#requires -Version 5.1
[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
# Windows PowerShell 5.1 does not consistently apply Include with LiteralPath.
$scripts = @(Get-ChildItem -LiteralPath $root -Recurse -File |
    Where-Object { $_.Extension -in @('.ps1', '.psm1') })
foreach ($script in $scripts) {
    $tokens = $null
    $errors = $null
    $null = [Management.Automation.Language.Parser]::ParseFile($script.FullName, [ref]$tokens, [ref]$errors)
    if ($errors.Count) { throw ($errors | Out-String) }
}
Write-Output 'PASS: all PowerShell scripts/modules parse.'
& (Join-Path $root 'Scripts/Test-ETimeProvisioning.ps1') `
    -LibraryPath (Join-Path $root 'Application/iclock/bin/eTimeTrackLiteLibrary.dll')

$modulePath = Join-Path $root 'Scripts/Installer.Common.psm1'
Import-Module $modulePath -Force
function Assert-True([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
foreach ($domain in @('HTTPS://example.com', 'example.com/path', 'example.com:80', '*.example.com',
    '-bad.example.com', '127.0.0.1', 'bad..example.com')) {
    $rejected = $false
    try { $null = ConvertTo-ETimeDomain $domain } catch { $rejected = $true }
    Assert-True $rejected ('Invalid domain accepted: ' + $domain)
}
Assert-True ((ConvertTo-ETimeDomain 'Tenant.Example.com.') -ceq 'tenant.example.com') 'Domain normalization failed.'
Assert-True (Test-ETimeCertificateName '*.example.com' 'tenant.example.com') 'Valid wildcard rejected.'
Assert-True (-not (Test-ETimeCertificateName '*.example.com' 'deep.tenant.example.com')) 'Wildcard accepted too many labels.'
Assert-True (-not (Test-ETimeCertificateName '*.example.com' 'example.com')) 'Wildcard matched the apex.'
Assert-True ((ConvertTo-ETimeSqlIdentifier 'company]name') -ceq '[company]]name]') 'SQL identifier not escaped.'
Assert-True ((ConvertTo-ETimeSqlLiteral "a';DROP DATABASE x;--") -ceq "N'a'';DROP DATABASE x;--'") 'SQL literal not escaped.'
Write-Output 'PASS: domain validation, certificate wildcard scope and SQL escaping.'

# Verify the actual bundled payload, including detection of unexpected files and changed hashes.
$manifest = Get-Content -LiteralPath (Join-Path $root 'Application/manifest.json') -Raw | ConvertFrom-Json
Assert-ETimePayload (Join-Path $root 'Application/iclock') $manifest
Write-Output 'PASS: bundled application matches its full file/hash manifest.'

# SQL transport is mocked. Exercise the real restore control flow and emitted command.
Import-Module $modulePath -Force
$module = Get-Module 'Installer.Common'
& $module {
    function script:New-ETimeSqlConnection {
        param($Server, $Database, $Credential)
        $fake = [PSCustomObject]@{}
        $fake | Add-Member ScriptMethod Open { }
        $fake | Add-Member ScriptMethod Dispose { }
        return $fake
    }
    function script:New-MockTable([hashtable[]]$Rows) {
        $table = New-Object Data.DataTable
        if ($Rows.Count) {
            foreach ($key in $Rows[0].Keys) { $null = $table.Columns.Add($key, [object]) }
            foreach ($source in $Rows) {
                $row = $table.NewRow()
                foreach ($key in $source.Keys) { $row[$key] = $source[$key] }
                $table.Rows.Add($row)
            }
        }
        return ,$table
    }
    function script:Invoke-ETimeSqlTable {
        param($Connection, $Sql, $Parameters, $Timeout)
        $script:queries.Add($Sql)
        if ($Sql -match 'sp_getapplock') { return ,(New-MockTable @(@{Result=0})) }
        if ($Sql -match 'SELECT DB_ID') {
            $id = [DBNull]::Value
            if ($script:scenario -eq 'existing') { $id = 123 }
            return ,(New-MockTable @(@{Id=$id}))
        }
        if ($Sql -match 'ProductMajorVersion') {
            return ,(New-MockTable @(@{Major=16; DataPath='C:\SQLData\'; LogPath='D:\SQLLogs\'}))
        }
        if ($Sql -match '^RESTORE HEADERONLY') {
            $type = 1
            $major = 16
            if ($script:scenario -eq 'differential') { $type = 5 }
            if ($script:scenario -eq 'newer') { $major = 17 }
            return ,(New-MockTable @(@{Position=1; BackupType=$type; SoftwareVersionMajor=$major; IsDamaged=$false}))
        }
        if ($Sql -match '^RESTORE FILELISTONLY') {
            return ,(New-MockTable @(
                @{LogicalName="data'file"; Type='D'; IsPresent=$true},
                @{LogicalName='second'; Type='D'; IsPresent=$true},
                @{LogicalName='log'; Type='L'; IsPresent=$true}
            ))
        }
        return ,(New-MockTable @())
    }
    foreach ($case in @('existing', 'differential', 'newer', 'success')) {
        $script:scenario = $case
        $script:queries = New-Object 'Collections.Generic.List[string]'
        $failed = $false
        try { Restore-ETimeDatabase 'localhost' 'new_company' 'C:\Backups\company.back' } catch {
            $failed = $true
            if ($case -eq 'success') { throw }
        }
        $restores = @($script:queries | Where-Object { $_ -match '^RESTORE DATABASE ' })
        if ($case -eq 'success') {
            if ($failed -or $restores.Count -ne 1) { throw 'Valid full backup did not reach restore.' }
            if ($restores[0] -match '\bREPLACE\b' -or
                ([regex]::Matches($restores[0], '\bMOVE ')).Count -ne 3 -or
                $restores[0] -notmatch "data''file" -or
                $restores[0] -notmatch 'RECOVERY;') { throw 'Unsafe/incomplete restore command.' }
            if (-not ($script:queries | Where-Object { $_ -match '^RESTORE VERIFYONLY' })) {
                throw 'Restore must verify the backup first.'
            }
        } elseif (-not $failed -or $restores.Count) { throw "Unsafe restore accepted: $case" }
    }
}
Write-Output 'PASS: restore refuses existing databases, differential backups and newer-version backups.'
Write-Output 'PASS: valid full .back restore verifies first, moves every file and never uses REPLACE.'
Write-Output 'Offline checks passed. These do not execute IIS, NTFS ACLs, DPAPI or a real SQL restore.'
