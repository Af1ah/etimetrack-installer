#requires -Version 5.1
<# Offline checks only. Does not import WebAdministration, connect to SQL, or modify IIS. #>
[CmdletBinding()]
param(
    [string]$ScriptPath = (Join-Path $PSScriptRoot 'New-ETimeCompany.ps1'),
    [string]$LibraryPath
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$tokens = $null
$parseErrors = $null
$ast = [Management.Automation.Language.Parser]::ParseFile(
    $ScriptPath, [ref]$tokens, [ref]$parseErrors
)
if ($parseErrors.Count) { throw ($parseErrors | Out-String) }
Write-Output 'PASS: provisioning script parses.'
$readerErrors = $null
$null = [Management.Automation.Language.Parser]::ParseFile(
    (Join-Path $PSScriptRoot 'Get-ETimeDeviceRequests.ps1'), [ref]$tokens, [ref]$readerErrors
)
if ($readerErrors.Count) { throw ($readerErrors | Out-String) }
Write-Output 'PASS: log reader parses.'

# Load only the pure XML helpers; do not execute the provisioning entry point.
foreach ($name in @('Ensure-Element', 'Write-CompanyWebConfig', 'Assert-SingleLine')) {
    $functionAst = $ast.Find({
        param($node)
        $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq $name
    }, $true)
    if ($null -eq $functionAst) { throw "Missing function: $name" }
    . ([scriptblock]::Create($functionAst.Extent.Text))
}

$fixture = Join-Path ([IO.Path]::GetTempPath()) ('etime-config-test-' + [Guid]::NewGuid())
$null = New-Item -ItemType Directory -Path $fixture
try {
    $path = Join-Path $fixture 'Web.config'
    @'
<configuration>
  <connectionStrings><add name="tenant" providerName="System.Data.SqlClient" connectionString="OLD-COMPANY" /></connectionStrings>
  <system.web><compilation debug="true" targetFramework="4.0" /></system.web>
  <system.webServer><handlers><clear /></handlers><rewrite><rules>
    <rule name="unrelated"><match url="^keep$" /><action type="None" /></rule>
  </rules></rewrite></system.webServer>
</configuration>
'@ | Set-Content -LiteralPath $path -Encoding UTF8
    $testConnection = 'Server=example;Database=tenant;User ID=test;Password="synthetic<&;password"'
    # Apply twice to verify there are no duplicate rules/filter entries.
    Write-CompanyWebConfig $path @('tenant', 'report') $testConnection
    Write-CompanyWebConfig $path @('tenant', 'report') $testConnection
    [xml]$xml = Get-Content -LiteralPath $path -Raw
    if ($xml.configuration.'system.web'.compilation.debug -ne 'false') { throw 'Debug must be disabled.' }
    if ($xml.SelectNodes('/configuration/system.webServer/handlers/clear').Count -ne 1) {
        throw 'Existing handler configuration was changed.'
    }
    $rules = $xml.SelectNodes('/configuration/system.webServer/rewrite/rules/rule')
    if ($rules.Count -ne 2) { throw 'Rewrite duplication or unrelated rule loss.' }
    $rule = $rules[0]
    if ($rule.name -ne 'Device endpoints with iclock prefix' -or
        $rule.action.type -ne 'Rewrite' -or $rule.action.url -ne '{R:1}.aspx' -or
        $rule.action.appendQueryString -ne 'true') { throw 'Incorrect device rewrite.' }
    foreach ($uri in @('iclock/getrequest', 'iclock/cdata', 'iclock/devicecmd',
        'iclock/cdata.php', 'iclock/getrequest.aspx', 'ICLOCK/GETREQUEST')) {
        $match = [regex]::Match($uri, [string]$rule.match.url, 'IgnoreCase')
        if (-not $match.Success) { throw "Expected endpoint did not match: $uri" }
        if ($match.Groups[1].Value.ToLowerInvariant() -notin @('getrequest', 'cdata', 'devicecmd')) {
            throw 'Wrong captured endpoint.'
        }
    }
    foreach ($uri in @('other/iclock/getrequest', 'iclock/Settings.txt',
        'iclock/getrequest/extra', 'othercompany/iclock/cdata', 'getrequest')) {
        if ([regex]::IsMatch($uri, [string]$rule.match.url, 'IgnoreCase')) {
            throw "Rule matched an unintended path: $uri"
        }
    }
    $settingsBlock = $xml.SelectNodes(
        "/configuration/system.webServer/security/requestFiltering/hiddenSegments/add[@segment='Settings.txt']"
    )
    if ($settingsBlock.Count -ne 1) { throw 'Settings.txt HTTP protection missing or duplicated.' }
    $entries = $xml.SelectNodes('/configuration/connectionStrings/add')
    if ($entries.Count -ne 2) { throw 'Wrong number of company connection strings.' }
    foreach ($entry in $entries) {
        if ($entry.connectionString -cne $testConnection) { throw 'Company credentials were not replaced or XML escaping failed.' }
    }
    if ((Get-Content -LiteralPath $path -Raw).Contains('OLD-COMPANY')) {
        throw 'Old company connection string remains.'
    }
    Write-Output 'PASS: XML remains valid; unrelated handlers and rules retained.'
    Write-Output 'PASS: only intended device paths match; query preservation is configured.'
    Write-Output 'PASS: Settings.txt blocked; SQL entries replaced; debug disabled; repeat application is safe.'

    # Also test a minimal template without optional sections.
    '<configuration />' | Set-Content -LiteralPath $path -Encoding UTF8
    Write-CompanyWebConfig $path @() $testConnection
    [xml]$minimal = Get-Content -LiteralPath $path -Raw
    if ($minimal.SelectNodes('/configuration/system.webServer/rewrite/rules/rule').Count -ne 1) {
        throw 'Minimal template configuration failed.'
    }
    $rejected = $false
    try { Assert-SingleLine "db`nother" 'Database' } catch { $rejected = $true }
    if (-not $rejected) { throw 'Multiline input must be rejected.' }
    Write-Output 'PASS: minimal template supported; multiline settings rejected.'
} finally {
    Remove-Item -LiteralPath $fixture -Recurse -Force
}
if ($LibraryPath) {
    $assembly = [Reflection.Assembly]::LoadFrom((Resolve-Path -LiteralPath $LibraryPath).Path)
    $codec = $assembly.GetType('eTimeTrackLiteLibrary.Utilities.Encryption64', $true)
    $encrypt = $codec.GetMethod('Encrypt', [type[]]@([string], [string]))
    $decrypt = $codec.GetMethod('Decrypt', [type[]]@([string], [string]))
    foreach ($value in @('synthetic-test', 'synthetic<&;test', ('synthetic-unicode-' + [char]0x00e9))) {
        $cipher = [string]$encrypt.Invoke($null, @($value, 'essl1234'))
        if ([string]$decrypt.Invoke($null, @($cipher, 'essl1234')) -cne $value) {
            throw 'Vendor password codec round trip failed with synthetic input.'
        }
    }
    Write-Output 'PASS: supplied vendor password codec round trips synthetic inputs.'
}
Write-Output 'Offline checks passed. Windows IIS, NTFS, DPAPI and live SQL integration require server validation.'
