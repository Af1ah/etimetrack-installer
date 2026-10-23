#requires -Version 5.1
#requires -RunAsAdministrator
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory)][ValidatePattern('^[a-z][a-z0-9-]{0,39}$')][string]$CompanyName,
    [Parameter(Mandatory)][string]$Domain,
    [string]$InstallRoot = 'C:\eTimeTrackHosting',
    [string]$CertificateThumbprint,
    [switch]$HttpOnly
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'Installer.Common.psm1') -Force
Assert-ETimeWindows
Assert-ETimeLocalDirectory $InstallRoot
Import-Module WebAdministration
$Domain = ConvertTo-ETimeDomain $Domain
$path = Join-Path $InstallRoot ('State\' + $CompanyName + '.json')
$state = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
if ($state.Company -ne $CompanyName -or -not (Test-Path -LiteralPath $state.PhysicalPath)) {
    throw 'Managed company state/directory was not found.'
}
if ($state.CustomDomainReady) { throw 'A custom domain is already provisioned. Review changes separately.' }
if (-not $HttpOnly) { $null = Get-ETimeCertificate $CertificateThumbprint $Domain }
Assert-ETimeBindingAvailable $Domain
if (-not $PSCmdlet.ShouldProcess($Domain, "Add a company-only IIS site for $CompanyName")) { return }
$appcmd = Join-Path $env:windir 'System32\inetsrv\appcmd.exe'
& $appcmd add backup ('BeforeETimeDomain_' + (Get-Date -Format 'yyyyMMdd_HHmmss_fff')) | Out-Null
if ($LASTEXITCODE -ne 0) { throw 'IIS backup failed.' }
New-ETimeDomainSite ('eTime-' + $CompanyName + '-domain') $Domain $state.PhysicalPath `
    $state.Pool $CertificateThumbprint -HttpOnly:$HttpOnly
$state.CompanyDomain = $Domain
$state.CustomDomainReady = $true
$state | ConvertTo-Json | Set-Content -LiteralPath $path -Encoding UTF8
Write-Host 'Company-only hostname binding created. Configure DNS and verify public TLS separately.'
