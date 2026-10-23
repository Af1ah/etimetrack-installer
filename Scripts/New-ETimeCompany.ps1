#requires -Version 5.1
#requires -RunAsAdministrator
<#
.SYNOPSIS
Creates an isolated /company IIS application for an existing eTimeTrackLite SQL database.
.DESCRIPTION
Run in 64-bit Windows PowerShell 5.1 on the IIS server. Requires URL Rewrite 2.1.
Uses a clean iclock deployment template, not an existing company's live directory.
Does not create databases, modify schemas, install modules, change bindings, or restart IIS.
SQL credentials are prompted locally; never pass a password on the command line.
.EXAMPLE
.\New-ETimeCompany.ps1 -CompanyName northstar -DbServer 'localhost\SQLEXPRESS' -Database northstar
.EXAMPLE
.\New-ETimeCompany.ps1 -CompanyName northstar -DbServer localhost -Database northstar -WhatIf
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [ValidatePattern('^[a-z][a-z0-9-]{0,39}$')]
    [string]$CompanyName,
    [string]$DbServer,
    [string]$Database,
    [string]$SiteName = 'etime tracklite',
    [string]$TemplatePath = 'C:\eTimeTrackProvisioning\Template\iclock',
    [string]$TenantRoot = 'C:\eTimeTrackTenants',
    [string]$ReferencePool = '.NET v4.5 Classic',
    [System.Management.Automation.PSCredential]$SqlCredential
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-SingleLine([string]$Value, [string]$Label) {
    if ([string]::IsNullOrWhiteSpace($Value) -or $Value -match '[\r\n\x00]') {
        throw "$Label must be a nonempty single line."
    }
}

function Get-FullPath([string]$Value) {
    return [IO.Path]::GetFullPath(
        [Environment]::ExpandEnvironmentVariables($Value)
    ).TrimEnd('\')
}

function Test-Within([string]$Child, [string]$Parent) {
    return $Child.Equals($Parent, [StringComparison]::OrdinalIgnoreCase) -or
        $Child.StartsWith($Parent + '\', [StringComparison]::OrdinalIgnoreCase)
}

function Set-PrivateAcl([string]$Path, [string]$PoolName) {
    # Do not inherit broad Users/IIS_IUSRS read access from a hosting directory.
    $acl = New-Object Security.AccessControl.DirectorySecurity
    $acl.SetAccessRuleProtection($true, $false)
    $inherit = [Security.AccessControl.InheritanceFlags]'ContainerInherit, ObjectInherit'
    foreach ($sid in @('S-1-5-18', 'S-1-5-32-544')) {
        $identity = New-Object Security.Principal.SecurityIdentifier($sid)
        $rule = New-Object Security.AccessControl.FileSystemAccessRule(
            $identity, 'FullControl', $inherit, 'None', 'Allow'
        )
        $acl.AddAccessRule($rule)
    }
    if ($PoolName) {
        $rule = New-Object Security.AccessControl.FileSystemAccessRule(
            "IIS APPPOOL\$PoolName", 'ReadAndExecute', $inherit, 'None', 'Allow'
        )
        $acl.AddAccessRule($rule)
    }
    Set-Acl -LiteralPath $Path -AclObject $acl
}

function Add-ModifyAccess([string]$Path, [string]$PoolName) {
    $acl = Get-Acl -LiteralPath $Path
    $inherit = [Security.AccessControl.InheritanceFlags]'ContainerInherit, ObjectInherit'
    $rule = New-Object Security.AccessControl.FileSystemAccessRule(
        "IIS APPPOOL\$PoolName", 'Modify', $inherit, 'None', 'Allow'
    )
    $acl.AddAccessRule($rule)
    Set-Acl -LiteralPath $Path -AclObject $acl
}

function Ensure-Element([Xml.XmlElement]$Parent, [string]$Name) {
    $node = $Parent.SelectSingleNode($Name)
    if ($null -eq $node) {
        $node = $Parent.OwnerDocument.CreateElement($Name)
        $null = $Parent.AppendChild($node)
    }
    return $node
}

function Write-CompanyWebConfig {
    param([string]$ConfigPath, [string[]]$ConnectionNames, [string]$CompanyConnectionString)
    $config = New-Object Xml.XmlDocument
    $config.PreserveWhitespace = $true
    $config.Load($ConfigPath)
    $root = $config.DocumentElement
    $systemWeb = Ensure-Element $root 'system.web'
    $compilation = Ensure-Element $systemWeb 'compilation'
    $compilation.SetAttribute('debug', 'false')
    $server = Ensure-Element $root 'system.webServer'
    $rewrite = Ensure-Element $server 'rewrite'
    $rules = Ensure-Element $rewrite 'rules'
    foreach ($oldRule in @($rules.SelectNodes("rule[@name='Device endpoints with iclock prefix']"))) {
        $null = $rules.RemoveChild($oldRule)
    }
    $rule = $config.CreateElement('rule')
    $rule.SetAttribute('name', 'Device endpoints with iclock prefix')
    $rule.SetAttribute('stopProcessing', 'true')
    $match = Ensure-Element $rule 'match'
    $match.SetAttribute('url', '^iclock/(cdata|getrequest|devicecmd)(?:\.aspx|\.php)?$')
    $match.SetAttribute('ignoreCase', 'true')
    $action = Ensure-Element $rule 'action'
    $action.SetAttribute('type', 'Rewrite')
    $action.SetAttribute('url', '{R:1}.aspx')
    $action.SetAttribute('appendQueryString', 'true')
    $null = $rules.PrependChild($rule)

    $security = Ensure-Element $server 'security'
    $filtering = Ensure-Element $security 'requestFiltering'
    $hidden = Ensure-Element $filtering 'hiddenSegments'
    foreach ($segment in @('Settings.txt', 'CloudSettings.txt', 'CloudExpirayDate.txt',
        'Logs.txt', 'DeviceInfo', 'ErrorFiles', '.git', '.codex', '.agents')) {
        foreach ($oldEntry in @($hidden.SelectNodes("*[@segment='$segment']"))) {
            $null = $hidden.RemoveChild($oldEntry)
        }
        $remove = $config.CreateElement('remove')
        $remove.SetAttribute('segment', $segment)
        $null = $hidden.AppendChild($remove)
        $add = $config.CreateElement('add')
        $add.SetAttribute('segment', $segment)
        $null = $hidden.AppendChild($add)
    }

    # Remove old/template SQL credentials. Every existing name points to this company DB.
    $strings = Ensure-Element $root 'connectionStrings'
    $strings.RemoveAll()
    $null = $strings.AppendChild($config.CreateElement('clear'))
    foreach ($name in $ConnectionNames) {
        $entry = $config.CreateElement('add')
        $entry.SetAttribute('name', $name)
        $entry.SetAttribute('providerName', 'System.Data.SqlClient')
        $entry.SetAttribute('connectionString', $CompanyConnectionString)
        $null = $strings.AppendChild($entry)
    }
    $config.Save($ConfigPath)
}

if ($PSVersionTable.PSEdition -ne 'Desktop' -or -not [Environment]::Is64BitProcess) {
    throw 'Run this script in elevated 64-bit Windows PowerShell 5.1, not PowerShell 7 or a 32-bit shell.'
}
if (-not $CompanyName) { $CompanyName = Read-Host 'Company URL name (example: northstar)' }
if ($CompanyName -notmatch '^[a-z][a-z0-9-]{0,39}$') {
    throw 'Company name must start with a lowercase letter and contain only lowercase letters, digits or hyphens (maximum 40 characters).'
}
if ($CompanyName -in @('iclock', 'bin', 'aspnet-client', 'con', 'prn', 'aux', 'nul') -or
    $CompanyName -match '^(com|lpt)[1-9]$') {
    throw 'Choose another company URL name; this name is reserved.'
}
if (-not $DbServer) { $DbServer = Read-Host 'SQL Server (example: localhost\SQLEXPRESS)' }
if (-not $Database) { $Database = Read-Host 'Existing company database name' }
Assert-SingleLine $DbServer 'SQL Server'
Assert-SingleLine $Database 'Database'

Import-Module WebAdministration
Add-Type -AssemblyName System.Web
Add-Type -AssemblyName System.Configuration

$site = Get-Website -Name $SiteName
if ($null -eq $site -or [string]$site.Name -ne $SiteName) { throw 'Target IIS site was not found.' }
if ([string]$site.State -ne 'Started') { throw 'Start the target site and resolve binding conflicts before provisioning.' }
if (-not (Get-WebGlobalModule | Where-Object Name -eq 'RewriteModule')) {
    throw 'Install Microsoft IIS URL Rewrite 2.1 first.'
}
if (-not (Test-Path -LiteralPath "IIS:\AppPools\$ReferencePool")) {
    throw 'Reference application pool was not found.'
}
$reference = Get-Item -LiteralPath "IIS:\AppPools\$ReferencePool"
if ([string]$reference.managedRuntimeVersion -ne 'v4.0') {
    throw 'Reference pool must use .NET CLR v4.0.'
}

foreach ($localPath in @($TemplatePath, $TenantRoot)) {
    if ($localPath -notmatch '^[A-Za-z]:\\') {
        throw 'TemplatePath and TenantRoot must be local absolute Windows paths.'
    }
}
$TemplatePath = Get-FullPath $TemplatePath
$TenantRoot = Get-FullPath $TenantRoot
$destination = Join-Path $TenantRoot $CompanyName
$poolName = "eTime-$CompanyName"
$appLocation = "$SiteName/$CompanyName"
$appcmd = Join-Path $env:windir 'System32\inetsrv\appcmd.exe'

if (-not [IO.Path]::IsPathRooted($TenantRoot) -or $TenantRoot.StartsWith('\\')) {
    throw 'Use a local absolute directory for TenantRoot.'
}
if ((Test-Within $destination $TemplatePath) -or (Test-Within $TemplatePath $destination)) {
    throw 'Template and destination directories must not overlap.'
}
# Templates and tenant files must not be exposed as ordinary folders under another site.
foreach ($existingSite in Get-Website) {
    $webRoot = Get-FullPath ([string]$existingSite.PhysicalPath)
    if ((Test-Within $destination $webRoot) -or (Test-Within $TemplatePath $webRoot)) {
        throw 'Keep TemplatePath and TenantRoot outside every IIS site physical root.'
    }
    foreach ($app in Get-WebApplication -Site $existingSite.Name) {
        $webRoot = Get-FullPath ([string]$app.PhysicalPath)
        if ((Test-Within $destination $webRoot) -or (Test-Within $TemplatePath $webRoot)) {
            throw 'Template or destination overlaps an existing IIS application.'
        }
    }
}
if (Test-Path -LiteralPath $destination) { throw 'Destination already exists; no files were overwritten.' }
if (Test-Path -LiteralPath "IIS:\AppPools\$poolName") { throw 'Company application pool already exists.' }
if (Test-Path -LiteralPath "IIS:\Sites\$SiteName\$CompanyName") { throw 'Company IIS path already exists.' }

$required = @('Web.config', 'PrecompiledApp.config', 'getrequest.aspx', 'cdata.aspx',
    'devicecmd.aspx', 'bin\eTimeTrackLiteLibrary.dll')
foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $TemplatePath $relative) -PathType Leaf)) {
        throw "Template is missing required file: $relative"
    }
}
# Reject junctions and symlinks, including ancestors, before using ACLs/copy operations.
foreach ($candidate in @($TemplatePath, $TenantRoot)) {
    $cursor = $candidate
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) {
            if ((Get-Item -LiteralPath $cursor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw 'Template and tenant directories must not traverse junctions or symlinks.'
            }
        }
        $cursor = [IO.Path]::GetDirectoryName($cursor)
    }
}
if (Get-ChildItem -LiteralPath $TemplatePath -Recurse -Force |
    Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) {
    throw 'Remove junctions and symlinks from the deployment template.'
}

$templateConfig = New-Object Xml.XmlDocument
$templateConfig.PreserveWhitespace = $true
$templateConfig.Load((Join-Path $TemplatePath 'Web.config'))
if ($templateConfig.SelectSingleNode('/configuration/connectionStrings[@configSource]') -or
    $templateConfig.SelectSingleNode('/configuration/connectionStrings[@configProtectionProvider]')) {
    throw 'Use a clean template with inline, unprotected connectionStrings; this script replaces and protects them.'
}
$names = @($templateConfig.SelectNodes('/configuration/connectionStrings/add') |
    ForEach-Object { $_.GetAttribute('name') })
foreach ($entry in $templateConfig.SelectNodes('/configuration/connectionStrings/add')) {
    if ($entry.GetAttribute('providerName') -notin @('', 'System.Data.SqlClient')) {
        throw 'Template includes a non-SQL-Server connection string; review it before provisioning.'
    }
}

if (-not $PSCmdlet.ShouldProcess($appLocation,
    "Create $destination, dedicated pool, SQL settings and device rewrite (existing database only)")) {
    return
}

if ($null -eq $SqlCredential) {
    $SqlCredential = Get-Credential -Message 'Enter this company database SQL login. Password is not printed.'
}
if ($null -eq $SqlCredential) { throw 'SQL credential entry was cancelled.' }
Assert-SingleLine $SqlCredential.UserName 'SQL username'

$passwordPointer = [IntPtr]::Zero
$plainPassword = $null
$cipherPassword = $null
$sqlConnectionString = $null
$builder = $null
$createdDirectory = $false
$createdPool = $false
$createdApplication = $false
$stage = 'credential validation'
try {
    $passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SqlCredential.Password)
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
    Assert-SingleLine $plainPassword 'SQL password'

    $stage = 'vendor password encoding'
    $assembly = [Reflection.Assembly]::LoadFrom((Join-Path $TemplatePath 'bin\eTimeTrackLiteLibrary.dll'))
    $codec = $assembly.GetType('eTimeTrackLiteLibrary.Utilities.Encryption64', $true)
    $encrypt = $codec.GetMethod('Encrypt', [type[]]@([string], [string]))
    $decrypt = $codec.GetMethod('Decrypt', [type[]]@([string], [string]))
    # Compatibility constant used by DatabaseConnection.GetDBSettings in this vendor build.
    # This vendor encoding is reversible, so file permissions and HTTP blocking are essential.
    $legacyKey = 'essl1234'
    $cipherPassword = [string]$encrypt.Invoke($null, @($plainPassword, $legacyKey))
    $roundTrip = [string]$decrypt.Invoke($null, @($cipherPassword, $legacyKey))
    if ($roundTrip -cne $plainPassword) { throw 'Password encoding round trip failed.' }
    $roundTrip = $null

    $stage = 'database connectivity and schema check'
    $builder = New-Object Data.SqlClient.SqlConnectionStringBuilder
    $builder.DataSource = $DbServer
    $builder.InitialCatalog = $Database
    $builder.UserID = $SqlCredential.UserName
    $builder.Password = $plainPassword
    $builder.IntegratedSecurity = $false
    $builder.PersistSecurityInfo = $false
    $builder.ConnectTimeout = 15
    $sqlConnectionString = $builder.ConnectionString
    $connection = New-Object Data.SqlClient.SqlConnection($sqlConnectionString)
    try {
        $connection.Open()
        $command = $connection.CreateCommand()
        try {
            $command.CommandTimeout = 15
            $command.CommandText = 'SELECT TOP (0) SerialNumber, LastPing FROM Devices'
            $reader = $command.ExecuteReader()
            $reader.Dispose()
        } finally { $command.Dispose() }
    } finally { $connection.Dispose() }
    Write-Host 'Database connection and required device columns verified.'

    $stage = 'IIS configuration backup'
    $backupName = 'BeforeETime_' + $CompanyName + '_' + (Get-Date -Format 'yyyyMMdd_HHmmss_fff')
    & $appcmd add backup $backupName | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'IIS backup failed.' }

    $stage = 'private application directory'
    $null = New-Item -ItemType Directory -Path $TenantRoot -Force
    # Creating a new leaf without -Force also rejects a racing second provisioner.
    $null = New-Item -ItemType Directory -Path $destination
    $createdDirectory = $true
    Set-PrivateAcl $destination ''

    $stage = 'copy deployment files'
    # Never duplicate operational data, credentials, backups, or imported employee lists.
    $runtimeFolders = @('DeviceInfo', 'ErrorFiles', 'Photos', 'imageFPSensor',
        'Utilities\App_Docs', 'SapExport')
    $excludeDirectories = @($runtimeFolders | ForEach-Object { Join-Path $TemplatePath $_ })
    $excludeDirectories += @('.git', '.codex', '.agents')
    $copyArguments = @($TemplatePath, $destination, '/E', '/COPY:DAT', '/DCOPY:DAT',
        '/XJ', '/R:1', '/W:1', '/NFL', '/NDL', '/NJH', '/NJS', '/NP', '/XF',
        'Settings.txt', '*.pdb', '*.log', '*.bak', '*.backup', '*.mdf', '*.ldf',
        '*.mdb', '*.db', '*.csv', '*.xls', '*.xlsx', '*.dat', '*.txt',
        '*.exe', '*.exe.config', '/XD') + $excludeDirectories
    & robocopy.exe @copyArguments | Out-Null
    if ($LASTEXITCODE -ge 8) { throw 'Deployment copy failed.' }
    # WinSCP's companion executable is a runtime dependency, not a tenant scheduler.
    $winscpRuntime = Join-Path $TemplatePath 'bin\WinSCP.exe'
    if (Test-Path -LiteralPath $winscpRuntime) {
        Copy-Item -LiteralPath $winscpRuntime -Destination (Join-Path $destination 'bin\WinSCP.exe')
    }

    $stage = 'company configuration'
    Write-CompanyWebConfig (Join-Path $destination 'Web.config') $names $sqlConnectionString
    # SQL Server format observed in DatabaseConnection.GetDBSettings: exactly six lines.
    $settingsLines = @('MS SQL Server', $DbServer, $Database, 'SQL Server Authentication',
        $SqlCredential.UserName, $cipherPassword)
    [IO.File]::WriteAllLines((Join-Path $destination 'Settings.txt'),
        [string[]]$settingsLines, [Text.UTF8Encoding]::new($false))
    $settingsLines = $null

    $stage = 'dedicated application pool'
    $null = New-WebAppPool -Name $poolName
    $createdPool = $true
    if ((Get-WebAppPoolState -Name $poolName).Value -eq 'Started') {
        Stop-WebAppPool -Name $poolName
    }
    Set-ItemProperty "IIS:\AppPools\$poolName" -Name managedRuntimeVersion -Value 'v4.0'
    Set-ItemProperty "IIS:\AppPools\$poolName" -Name managedPipelineMode -Value $reference.managedPipelineMode
    Set-ItemProperty "IIS:\AppPools\$poolName" -Name enable32BitAppOnWin64 -Value $reference.enable32BitAppOnWin64
    Set-ItemProperty "IIS:\AppPools\$poolName" -Name processModel.identityType -Value 'ApplicationPoolIdentity'
    Set-PrivateAcl $destination $poolName
    foreach ($relative in $runtimeFolders) {
        $folder = Join-Path $destination $relative
        $null = New-Item -ItemType Directory -Path $folder -Force
        Add-ModifyAccess $folder $poolName
    }

    $stage = 'IIS application registration'
    $null = New-WebApplication -Name $CompanyName -Site $SiteName `
        -PhysicalPath $destination -ApplicationPool $poolName
    $createdApplication = $true
    # Commit at applicationHost.config level; do not unlock authentication globally.
    Set-WebConfigurationProperty -PSPath 'MACHINE/WEBROOT/APPHOST' -Location $appLocation `
        -Filter 'system.webServer/security/authentication/anonymousAuthentication' `
        -Name enabled -Value $true
    Set-WebConfigurationProperty -PSPath 'MACHINE/WEBROOT/APPHOST' -Location $appLocation `
        -Filter 'system.webServer/security/authentication/anonymousAuthentication' `
        -Name userName -Value ''

    $stage = 'protect web.config connection strings'
    $webConfiguration = [Web.Configuration.WebConfigurationManager]::OpenWebConfiguration(
        "/$CompanyName", $SiteName
    )
    $section = $webConfiguration.GetSection('connectionStrings')
    $section.SectionInformation.ProtectSection('DataProtectionConfigurationProvider')
    $section.SectionInformation.ForceSave = $true
    $webConfiguration.Save([Configuration.ConfigurationSaveMode]::Modified)

    $stage = 'effective IIS configuration validation'
    & $appcmd list config $appLocation /section:system.webServer/rewrite/rules | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Effective rewrite configuration is invalid.' }
    if ((Get-WebAppPoolState -Name $poolName).Value -ne 'Started') {
        Start-WebAppPool -Name $poolName
    }
    Write-Host 'Company application created. HTTP/device behaviour has not been tested.'
    [PSCustomObject]@{
        Company = $CompanyName
        Application = "/$CompanyName/"
        DevicePrefix = "/$CompanyName/iclock/"
        PhysicalPath = $destination
        ApplicationPool = $poolName
        IisBackup = $backupName
        NextStep = 'Register the real device serial, configure its company server address, and verify polls plus a test punch.'
    }
} catch {
    # Do not echo arbitrary SQL/vendor exceptions: they can contain connection details.
    Write-Warning "Provisioning failed during: $stage. Original exception suppressed to avoid printing credentials."
    if ($createdApplication) {
        try { Remove-WebApplication -Site $SiteName -Name $CompanyName } catch {
            Write-Warning 'Could not remove the new IIS application; remove it manually before retrying.'
        }
    }
    if ($createdPool) {
        try {
            Stop-WebAppPool -Name $poolName -ErrorAction SilentlyContinue
            Remove-WebAppPool -Name $poolName
        } catch { Write-Warning 'Could not remove the new application pool; inspect it manually.' }
    }
    if ($createdDirectory) {
        try { Remove-Item -LiteralPath $destination -Recurse -Force } catch {
            Write-Warning "Could not remove $destination. It may contain credentials; keep it private and remove it before retrying."
        }
    }
    throw "Company creation failed at '$stage'. No existing application or database was intentionally changed."
} finally {
    if ($passwordPointer -ne [IntPtr]::Zero) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($passwordPointer)
    }
    if ($null -ne $builder) { $builder.Clear() }
    $plainPassword = $null
    $cipherPassword = $null
    $sqlConnectionString = $null
    $SqlCredential = $null
}
