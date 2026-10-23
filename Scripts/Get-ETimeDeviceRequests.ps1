#requires -Version 5.1
<# Reads W3C logs only. Never outputs complete queries, request bodies or credentials. #>
[CmdletBinding()]
param(
    [string]$SiteName = 'etime tracklite',
    [ValidatePattern('^[a-z][a-z0-9-]{0,39}$')]
    [string]$CompanyName,
    [switch]$AtSiteRoot,
    [ValidateRange(1, 200)]
    [int]$Limit = 20
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if (-not $AtSiteRoot) {
    if (-not $CompanyName) { $CompanyName = Read-Host 'Company URL name' }
    if ($CompanyName -notmatch '^[a-z][a-z0-9-]{0,39}$') { throw 'Invalid company URL name.' }
}
Import-Module WebAdministration
$site = Get-Website -Name $SiteName
if ($null -eq $site -or [string]$site.Name -ne $SiteName) { throw 'IIS site not found.' }
if ([string]$site.logFile.logFormat -ne 'W3C') { throw 'This reader requires W3C file logging.' }
$base = [Environment]::ExpandEnvironmentVariables([string]$site.logFile.directory)
$folder = Join-Path $base ('W3SVC' + $site.ID)
$logs = @(Get-ChildItem -LiteralPath $folder -Filter '*.log' -File |
    Sort-Object LastWriteTime -Descending | Select-Object -First 2)
if (-not $logs.Count) { throw 'No log files found. Check the IIS logging directory and File logging target.' }
Write-Host ('Current UTC: ' + [DateTime]::UtcNow.ToString('yyyy-MM-dd HH:mm:ss'))
Write-Host ('Latest log written UTC: ' + $logs[0].LastWriteTimeUtc.ToString('yyyy-MM-dd HH:mm:ss'))
$pattern = '^/' + [regex]::Escape($CompanyName) +
    '/(?:iclock/)?(?:cdata|getrequest|devicecmd|fdata)(?:\.(?:aspx|php))?$'
if ($AtSiteRoot) {
    $pattern = '^/(?:iclock/)?(?:cdata|getrequest|devicecmd|fdata)(?:\.(?:aspx|php))?$'
}
$results = @(
    foreach ($log in $logs) {
        $header = Get-Content -LiteralPath $log.FullName -TotalCount 100 |
            Where-Object { $_ -like '#Fields:*' } | Select-Object -Last 1
        if (-not $header) { continue }
        $fields = $header.Substring(8).Trim() -split '\s+'
        foreach ($line in Get-Content -LiteralPath $log.FullName -Tail 8000) {
            if ($line -like '#Fields:*') {
                $fields = $line.Substring(8).Trim() -split '\s+'
                continue
            }
            if (-not $line -or $line.StartsWith('#')) { continue }
            $values = $line -split '\s+'
            if ($values.Count -ne $fields.Count) { continue }
            $row = @{}
            for ($i = 0; $i -lt $fields.Count; $i++) { $row[$fields[$i]] = $values[$i] }
            if ($row['cs-uri-stem'] -notmatch $pattern) { continue }
            $serial = '(not logged)'
            if ($row.ContainsKey('cs-uri-query')) {
                $serial = '(SN missing)'
                if ($row['cs-uri-query'] -match '(?i)(?:^|&)SN=([^&]*)') {
                    $serial = [Uri]::UnescapeDataString($Matches[1])
                }
            }
            [PSCustomObject]@{
                UTC = $row['date'] + ' ' + $row['time']
                Method = $row['cs-method']
                Path = $row['cs-uri-stem']
                Serial = $serial
                Status = $row['sc-status']
                Sub = $row['sc-substatus']
                Win32 = $row['sc-win32-status']
            }
        }
    }
)
if ($results.Count) {
    $results | Sort-Object UTC | Select-Object -Last $Limit
} else {
    Write-Warning 'No matching requests in the inspected log tails. Check buffering, site selection and device address.'
}
