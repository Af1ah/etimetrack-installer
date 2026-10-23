#requires -Version 5.1
#requires -RunAsAdministrator
<# Entry point: existing DB or one full .bak/.back restore, then /company and optional custom hostname. #>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidatePattern('^[a-z][a-z0-9-]{0,39}$')][string]$CompanyName,
    [string]$Domain,
    [string]$DbServer,
    [string]$Database,
    [string]$BackupPath,
    [ValidateRange(1, 32767)][int]$BackupSetPosition = 1,
    [string]$CompanyDomain,
    [string]$CertificateThumbprint,
    [string]$CompanyCertificateThumbprint,
    [string]$InstallRoot = 'C:\eTimeTrackHosting',
    [string]$SiteName = 'eTimeTrack Hosting',
    [switch]$HttpOnly,
    [switch]$InstallDependencies,
    [switch]$OpenFirewall,
    [switch]$CreateSqlLogin,
    [string]$WindowsFeatureSource,
    [string]$DotNetInstallerPath,
    [Management.Automation.PSCredential]$ApplicationCredential,
    [Management.Automation.PSCredential]$SqlAdminCredential
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'Scripts\Installer.Common.psm1') -Force
Assert-ETimeWindows
$interactive = $PSBoundParameters.Count -eq 0
if (-not $CompanyName) { $CompanyName = Read-Host 'Company URL name (lowercase letters, digits, hyphens)' }
if ($CompanyName -notmatch '^[a-z][a-z0-9-]{0,39}$' -or
    $CompanyName -in @('iclock', 'bin', 'con', 'prn', 'aux', 'nul', 'aspnet-client') -or
    $CompanyName -match '^(com|lpt)[1-9]$') { throw 'Choose a valid, non-reserved company URL name.' }
if (-not $Domain) { $Domain = Read-Host 'Shared company-hosting domain (example: attendance.example.com)' }
$Domain = ConvertTo-ETimeDomain $Domain
if ($CompanyDomain) {
    $CompanyDomain = ConvertTo-ETimeDomain $CompanyDomain
    if ($CompanyDomain -eq $Domain) { throw 'CompanyDomain must differ from the shared hosting domain.' }
}
if (-not $DbServer) { $DbServer = Read-Host 'SQL Server (example: localhost\SQLEXPRESS)' }
if (-not $Database) { $Database = Read-Host 'Company database name' }
if ($interactive) {
    $InstallDependencies = $true
    $BackupPath = Read-Host 'Full SQL backup path on the SQL host (.bak/.back), or Enter for an existing database'
    if ((Read-Host 'Create a NEW company SQL login and grant ownership of only this database? (y/N)') -ieq 'y') {
        $CreateSqlLogin = $true
    }
    if ($BackupPath -or $CreateSqlLogin) {
        if ((Read-Host 'SQL administration login: Enter for current Windows account, or type SQL') -ieq 'SQL') {
            $SqlAdminCredential = Get-Credential -Message 'SQL administrator for restore/login setup only. This account is not stored in application settings.'
            if ($null -eq $SqlAdminCredential) { throw 'SQL administrator credential entry cancelled.' }
        }
    }
    $CompanyDomain = Read-Host 'Optional custom company hostname, or Enter to use /company only'
    if ($CompanyDomain) {
        $CompanyDomain = ConvertTo-ETimeDomain $CompanyDomain
        if ($CompanyDomain -eq $Domain) { throw 'CompanyDomain must differ from the shared domain.' }
    }
    $CertificateThumbprint = Read-Host 'Installed TLS certificate thumbprint for the shared domain'
    if ($CompanyDomain) {
        $CompanyCertificateThumbprint = Read-Host 'Custom hostname TLS certificate thumbprint, or Enter to reuse the shared certificate'
    }
}
$null = ConvertTo-ETimeSqlIdentifier $Database
if ($Database -in @('master', 'model', 'msdb', 'tempdb') -or $DbServer -match '[\r\n\x00]') {
    throw 'Invalid database or server name.'
}
if ($InstallRoot -notmatch '^[A-Za-z]:\\') { throw 'InstallRoot must be a local absolute Windows directory.' }
$InstallRoot = [IO.Path]::GetFullPath($InstallRoot).TrimEnd('\')
Assert-ETimeLocalDirectory $InstallRoot
if (-not $HttpOnly -and -not $CertificateThumbprint) { throw 'Supply CertificateThumbprint, or explicitly use HttpOnly on a private test network.' }
if (-not $HttpOnly) { $null = Get-ETimeCertificate $CertificateThumbprint $Domain }
if ($CompanyDomain -and -not $HttpOnly) {
    if (-not $CompanyCertificateThumbprint) { $CompanyCertificateThumbprint = $CertificateThumbprint }
    $null = Get-ETimeCertificate $CompanyCertificateThumbprint $CompanyDomain
}
$tenantRoot = Join-Path $InstallRoot 'Companies'
$destination = Join-Path $tenantRoot $CompanyName
$stateDirectory = Join-Path $InstallRoot 'State'
$statePath = Join-Path $stateDirectory ($CompanyName + '.json')
if ((Test-Path -LiteralPath $destination) -or (Test-Path -LiteralPath $statePath)) {
    throw 'Company already exists. This installer does not overwrite existing mounts.'
}
if (Test-Path -LiteralPath $stateDirectory) {
    foreach ($stateFile in Get-ChildItem -LiteralPath $stateDirectory -Filter '*.json' -File) {
        $previous = Get-Content -LiteralPath $stateFile.FullName -Raw | ConvertFrom-Json
        if ($previous.DbServer -eq $DbServer -and $previous.Database -eq $Database) {
            throw 'This database is already assigned to another company in this installation.'
        }
    }
}
if (-not $PSCmdlet.ShouldProcess("$Domain/$CompanyName", 'Bootstrap IIS, optionally restore new database, and create isolated company application/domain')) {
    Write-Host 'Plan only: no credentials requested, dependencies installed, database restored, or IIS changes made.'
    return
}
if ($null -eq $ApplicationCredential) {
    $ApplicationCredential = Get-Credential -Message 'Enter a company-specific SQL login/password. Do not use sa or a server admin login.'
}
if ($null -eq $ApplicationCredential) { throw 'Application credential entry cancelled.' }
$stage = 'host bootstrap'
try {
    $bootstrap = @{
        Domain = $Domain; SiteName = $SiteName; InstallRoot = $InstallRoot
        HttpOnly = $HttpOnly; CertificateThumbprint = $CertificateThumbprint
        InstallDependencies = $InstallDependencies; OpenFirewall = $OpenFirewall
        WindowsFeatureSource = $WindowsFeatureSource; DotNetInstallerPath = $DotNetInstallerPath
        BundleRoot = $PSScriptRoot
    }
    & (Join-Path $PSScriptRoot 'Scripts\Initialize-ETimeHost.ps1') @bootstrap
    Import-Module WebAdministration
    if ($CompanyDomain) {
        Assert-ETimeBindingAvailable $CompanyDomain
        if (Get-Website | Where-Object Name -eq ('eTime-' + $CompanyName + '-domain')) {
            throw 'Custom company site name already exists.'
        }
    }
    if ($BackupPath) {
        $stage = 'database restore'
        Restore-ETimeDatabase $DbServer $Database $BackupPath $BackupSetPosition $SqlAdminCredential
    }
    if ($BackupPath -or $CreateSqlLogin) {
        $stage = 'database login mapping'
        Initialize-ETimeDatabaseLogin $DbServer $Database $ApplicationCredential $SqlAdminCredential `
            -CreateSqlLogin:$CreateSqlLogin -RestoredDatabase:([bool]$BackupPath)
    }
    $stage = 'application database checks'
    Test-ETimeApplicationDatabase $DbServer $Database $ApplicationCredential
    $stage = 'company application creation'
    $company = & (Join-Path $PSScriptRoot 'Scripts\New-ETimeCompany.ps1') `
        -CompanyName $CompanyName -DbServer $DbServer -Database $Database `
        -SiteName $SiteName -TemplatePath (Join-Path $InstallRoot 'Template\iclock') `
        -TenantRoot $tenantRoot -ReferencePool 'eTime-Reference' -SqlCredential $ApplicationCredential
    # Save non-secret state before optional domain provisioning, so partial success is explicit.
    $null = New-Item -ItemType Directory -Path $stateDirectory -Force
    $state = [ordered]@{
        Company = $CompanyName; DbServer = $DbServer; Database = $Database
        LoginUrl = 'https://' + $Domain + '/' + $CompanyName + '/'
        CompanyDomain = $CompanyDomain; CustomDomainReady = $false
        PhysicalPath = $destination; Pool = 'eTime-' + $CompanyName
        CreatedUtc = [DateTime]::UtcNow.ToString('o')
    }
    if ($HttpOnly) { $state.LoginUrl = $state.LoginUrl.Replace('https://', 'http://') }
    $state | ConvertTo-Json | Set-Content -LiteralPath $statePath -Encoding UTF8
    if ($CompanyDomain) {
        $stage = 'custom company domain'
        New-ETimeDomainSite ('eTime-' + $CompanyName + '-domain') $CompanyDomain $destination `
            ('eTime-' + $CompanyName) $CompanyCertificateThumbprint -HttpOnly:$HttpOnly
        $state.CustomDomainReady = $true
        $state | ConvertTo-Json | Set-Content -LiteralPath $statePath -Encoding UTF8
    }
    Write-Host ('Company URL: ' + $state.LoginUrl)
    if ($CompanyDomain) {
        $scheme = 'https'
        if ($HttpOnly) { $scheme = 'http' }
        Write-Host ('Custom company URL: ' + $scheme + '://' + $CompanyDomain + '/')
    }
    Write-Host 'Created successfully. Verify login, device serial/LastPing, a test punch, and blocked Settings.txt downloads.'
    Write-Host 'DNS records and certificate issuance remain with your DNS/certificate provider.'
} catch {
    Write-Warning ('Failed stage: ' + $stage + '. Original exception suppressed to avoid exposing credentials.')
    Write-Warning (Get-ETimeFailureCategory $_)
    Write-Warning 'Completed bootstrap, restored databases, new SQL logins and completed company mounts are retained. Review state before retrying; no existing database is overwritten.'
    throw "Installer failed during '$stage'. See docs/INSTALL.md for stage-specific recovery."
} finally {
    $ApplicationCredential = $null
    $SqlAdminCredential = $null
}
