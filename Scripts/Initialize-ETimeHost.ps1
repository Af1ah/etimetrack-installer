#requires -Version 5.1
#requires -RunAsAdministrator
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory)][string]$Domain,
    [string]$SiteName = 'eTimeTrack Hosting',
    [string]$InstallRoot = 'C:\eTimeTrackHosting',
    [string]$CertificateThumbprint,
    [switch]$HttpOnly,
    [switch]$InstallDependencies,
    [switch]$OpenFirewall,
    [string]$WindowsFeatureSource,
    [string]$DotNetInstallerPath,
    [string]$BundleRoot = (Split-Path -Parent $PSScriptRoot)
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'Installer.Common.psm1') -Force
Assert-ETimeWindows
$Domain = ConvertTo-ETimeDomain $Domain
if ($InstallRoot -notmatch '^[A-Za-z]:\\' -or $InstallRoot.TrimEnd('\') -match '^[A-Za-z]:$') {
    throw 'Use a dedicated local absolute InstallRoot directory.'
}
$InstallRoot = [IO.Path]::GetFullPath($InstallRoot).TrimEnd('\')
Assert-ETimeLocalDirectory $InstallRoot
if (-not $HttpOnly -and -not $CertificateThumbprint) {
    throw 'Supply an installed TLS certificate thumbprint, or explicitly choose HttpOnly for a private test network.'
}
if (-not $HttpOnly) { $null = Get-ETimeCertificate $CertificateThumbprint $Domain }
if (-not $PSCmdlet.ShouldProcess($InstallRoot, 'Check/install dependencies, stage clean application and create hostname-bound IIS site')) { return }

Import-Module ServerManager
$required = @('Web-Server', 'Web-Static-Content', 'Web-Default-Doc', 'Web-Http-Errors',
    'Web-Http-Logging', 'Web-Filtering', 'Web-Net-Ext45', 'Web-Asp-Net45',
    'Web-ISAPI-Ext', 'Web-ISAPI-Filter', 'Web-Mgmt-Console', 'Web-Scripting-Tools')
$missing = @(Get-WindowsFeature -Name $required | Where-Object { -not $_.Installed })
if ($missing.Count) {
    if (-not $InstallDependencies) { throw 'Missing IIS features. Run again with InstallDependencies or install the documented features manually.' }
    $featureArguments = @{ Name = @($missing.Name); IncludeManagementTools = $true }
    if ($WindowsFeatureSource) { $featureArguments.Source = $WindowsFeatureSource }
    $result = Install-WindowsFeature @featureArguments
    if (-not $result.Success) { throw 'Windows feature installation failed.' }
    if ([string]$result.RestartNeeded -eq 'Yes') { throw 'Windows requires a reboot. Restart the server and rerun the same command.' }
}

function Invoke-VerifiedMicrosoftInstaller([string]$Path, [string]$Arguments, [switch]$Msi) {
    $signature = Get-AuthenticodeSignature -LiteralPath $Path
    if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Subject -notmatch 'Microsoft Corporation') {
        throw 'Dependency installer does not have a valid Microsoft publisher signature.'
    }
    if ($Msi) {
        $process = Start-Process msiexec.exe -ArgumentList ('/i "' + $Path + '" /qn /norestart') -Wait -PassThru
    } else {
        $process = Start-Process -FilePath $Path -ArgumentList $Arguments -Wait -PassThru
    }
    if ($process.ExitCode -eq 3010) { throw 'Dependency installation requires a reboot. Restart Windows and rerun.' }
    if ($process.ExitCode -ne 0) { throw ('Dependency installer failed with exit code ' + $process.ExitCode) }
}

$release = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' `
    -Name Release -ErrorAction SilentlyContinue
if ($null -eq $release -or [int]$release -lt 528040) {
    if (-not $InstallDependencies -or -not $DotNetInstallerPath) {
        throw '.NET Framework 4.8+ is required. Install it or supply DotNetInstallerPath with InstallDependencies.'
    }
    Invoke-VerifiedMicrosoftInstaller $DotNetInstallerPath '/q /norestart'
    $release = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' -Name Release
    if ([int]$release -lt 528040) { throw '.NET Framework 4.8 could not be verified.' }
}
Import-Module WebAdministration
foreach ($existingSite in Get-Website) {
    $webRoot = [IO.Path]::GetFullPath([Environment]::ExpandEnvironmentVariables(
        [string]$existingSite.PhysicalPath
    )).TrimEnd('\')
    if ($InstallRoot -ieq $webRoot -or $InstallRoot.StartsWith($webRoot + '\', [StringComparison]::OrdinalIgnoreCase)) {
        throw 'InstallRoot must be outside all existing IIS website roots.'
    }
}
if (-not (Get-WebGlobalModule | Where-Object Name -eq 'RewriteModule')) {
    if (-not $InstallDependencies) { throw 'URL Rewrite is missing. Run with InstallDependencies.' }
    $dependency = Join-Path $BundleRoot 'Dependencies\rewrite_amd64_en-US.msi'
    $manifest = Get-Content -LiteralPath (Join-Path $BundleRoot 'Dependencies\manifest.json') -Raw | ConvertFrom-Json
    if ((Get-FileHash -LiteralPath $dependency -Algorithm SHA256).Hash -ne $manifest.UrlRewrite.Sha256) {
        throw 'URL Rewrite installer checksum does not match the packaged Microsoft download.'
    }
    Invoke-VerifiedMicrosoftInstaller $dependency '' -Msi
    if (-not (Get-WebGlobalModule | Where-Object Name -eq 'RewriteModule')) { throw 'URL Rewrite registration failed.' }
}

# Verify bundled payload before any template copy. Relative paths cannot escape the bundle.
$payload = Get-Content -LiteralPath (Join-Path $BundleRoot 'Application\manifest.json') -Raw | ConvertFrom-Json
Assert-ETimePayload (Join-Path $BundleRoot 'Application\iclock') $payload

$markerPath = Join-Path $InstallRoot '.etimetrack-installer'
if ((Test-Path -LiteralPath $InstallRoot) -and -not (Test-Path -LiteralPath $markerPath)) {
    throw 'InstallRoot already exists but is not owned by this installer. Use a new directory.'
}
$ownedInstall = Test-Path -LiteralPath $markerPath
if (-not $ownedInstall -and ((Test-Path -LiteralPath 'IIS:\AppPools\eTime-Reference') -or
    (Test-Path -LiteralPath 'IIS:\AppPools\eTime-HostRoot'))) {
    throw 'Installer pool names already exist without this installation marker. Choose a clean host or review those pools manually.'
}
if ((Get-Website | Where-Object Name -eq $SiteName) -and
    -not (Test-Path -LiteralPath (Join-Path $InstallRoot 'Host.json'))) {
    throw 'Target site already exists and is not managed by this installation.'
}
if (Test-Path -LiteralPath $InstallRoot) {
    if ((Get-Item -LiteralPath $InstallRoot -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
        throw 'InstallRoot must not be a junction or symlink.'
    }
}
$appcmd = Join-Path $env:windir 'System32\inetsrv\appcmd.exe'
& $appcmd add backup ('BeforeETimeHost_' + (Get-Date -Format 'yyyyMMdd_HHmmss_fff')) | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'IIS backup failed.' }
$null = New-Item -ItemType Directory -Path $InstallRoot -Force
Set-ETimePrivateDirectory $InstallRoot ''
if (-not (Test-Path -LiteralPath $markerPath)) { 'etimetrack-installer-v1' | Set-Content -LiteralPath $markerPath -Encoding ASCII }
$template = Join-Path $InstallRoot 'Template\iclock'
if (-not (Test-Path -LiteralPath $template)) {
    $null = New-Item -ItemType Directory -Path (Split-Path -Parent $template) -Force
    Copy-Item -LiteralPath (Join-Path $BundleRoot 'Application\iclock') -Destination $template -Recurse
}
Assert-ETimePayload $template $payload
$referencePool = 'eTime-Reference'
if (-not (Test-Path -LiteralPath "IIS:\AppPools\$referencePool")) {
    $null = New-WebAppPool -Name $referencePool
    Set-ItemProperty "IIS:\AppPools\$referencePool" managedRuntimeVersion 'v4.0'
    Set-ItemProperty "IIS:\AppPools\$referencePool" managedPipelineMode 'Classic'
    Set-ItemProperty "IIS:\AppPools\$referencePool" enable32BitAppOnWin64 $false
    Set-ItemProperty "IIS:\AppPools\$referencePool" processModel.identityType 'ApplicationPoolIdentity'
}
$pool = Get-Item -LiteralPath "IIS:\AppPools\$referencePool"
if ([string]$pool.managedRuntimeVersion -ne 'v4.0' -or [string]$pool.managedPipelineMode -ne 'Classic' -or
    $pool.enable32BitAppOnWin64 -or [string]$pool.processModel.identityType -ne 'ApplicationPoolIdentity') {
    throw 'Existing eTime-Reference pool does not match this installer. It was not overwritten.'
}
if ((Get-WebAppPoolState -Name $referencePool).Value -eq 'Started') { Stop-WebAppPool -Name $referencePool }
$rootPool = 'eTime-HostRoot'
if (-not (Test-Path -LiteralPath "IIS:\AppPools\$rootPool")) {
    $null = New-WebAppPool -Name $rootPool
    Set-ItemProperty "IIS:\AppPools\$rootPool" managedRuntimeVersion 'v4.0'
    Set-ItemProperty "IIS:\AppPools\$rootPool" processModel.identityType 'ApplicationPoolIdentity'
}
$pool = Get-Item -LiteralPath "IIS:\AppPools\$rootPool"
if ([string]$pool.processModel.identityType -ne 'ApplicationPoolIdentity') {
    throw 'Existing host root pool uses an unexpected identity. It was not overwritten.'
}
$siteRoot = Join-Path $InstallRoot 'Sites\Host'
$null = New-Item -ItemType Directory -Path $siteRoot -Force
Set-ETimePrivateDirectory $siteRoot $rootPool
if (-not (Test-Path -LiteralPath (Join-Path $siteRoot 'index.html'))) {
    '<!doctype html><html lang="en"><meta charset="utf-8"><title>eTimeTrackLite</title><h1>eTimeTrackLite</h1><p>Use your company address to sign in.</p></html>' |
        Set-Content -LiteralPath (Join-Path $siteRoot 'index.html') -Encoding UTF8
}
$hostStatePath = Join-Path $InstallRoot 'Host.json'
$existing = @(Get-Website | Where-Object Name -eq $SiteName)
if ($existing.Count) {
    if (-not (Test-Path -LiteralPath $hostStatePath)) { throw 'Site name is already in use by an unmanaged site. Choose another SiteName.' }
    $state = Get-Content -LiteralPath $hostStatePath -Raw | ConvertFrom-Json
    if ($state.Domain -ne $Domain -or $state.SiteName -ne $SiteName -or [bool]$state.HttpOnly -ne [bool]$HttpOnly -or
        ([IO.Path]::GetFullPath([string]$existing[0].PhysicalPath).TrimEnd('\') -ne $siteRoot)) {
        throw 'Existing host configuration differs. Review domain/protocol changes instead of overwriting bindings.'
    }
    if ($CertificateThumbprint -and $state.CertificateThumbprint -ne ($CertificateThumbprint -replace '\s', '')) {
        throw 'Certificate replacement is a separate maintenance action.'
    }
    Start-Website -Name $SiteName
} else {
    New-ETimeDomainSite $SiteName $Domain $siteRoot $rootPool $CertificateThumbprint -HttpOnly:$HttpOnly
}
[PSCustomObject]@{
    SiteName = $SiteName; Domain = $Domain; InstallRoot = $InstallRoot; TemplatePath = $template
    ReferencePool = $referencePool; HttpOnly = [bool]$HttpOnly
    CertificateThumbprint = ($CertificateThumbprint -replace '\s', '')
} | ConvertTo-Json | Set-Content -LiteralPath $hostStatePath -Encoding UTF8
if ($OpenFirewall) {
    $ports = @(80)
    if (-not $HttpOnly) { $ports += 443 }
    $ruleName = 'ETimeTrackInstaller-Web'
    if (-not (Get-NetFirewallRule -Name $ruleName -ErrorAction SilentlyContinue)) {
        $null = New-NetFirewallRule -Name $ruleName -DisplayName 'eTimeTrackLite HTTP/HTTPS' `
            -Direction Inbound -Action Allow -Protocol TCP -LocalPort $ports -Profile Domain,Private,Public
    }
}
try {
    $addresses = @(Resolve-DnsName -Name $Domain -Type A -ErrorAction Stop |
        Where-Object Type -eq 'A' | Select-Object -ExpandProperty IPAddress)
    Write-Host ('DNS currently resolves to: ' + ($addresses -join ', '))
} catch { Write-Warning 'DNS does not resolve here yet. Create the appropriate DNS record with your domain provider.' }
Write-Host 'Host bootstrap complete. IIS bindings are configured; DNS ownership and public TLS reachability are not proven.'
