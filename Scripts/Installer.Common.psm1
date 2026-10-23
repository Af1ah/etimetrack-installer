Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Assert-ETimeWindows {
    if ($PSVersionTable.PSEdition -ne 'Desktop' -or -not [Environment]::Is64BitProcess) {
        throw 'Use 64-bit Windows PowerShell 5.1 as Administrator on Windows Server.'
    }
    $os = Get-CimInstance Win32_OperatingSystem
    if ($os.ProductType -eq 1 -or [version]$os.Version -lt [version]'10.0') {
        throw 'This installer supports Windows Server 2016 or later, not Windows client editions or Linux.'
    }
}

function Assert-ETimeLocalDirectory([string]$Path) {
    if ($Path -notmatch '^[A-Za-z]:\\' -or $Path.TrimEnd('\') -match '^[A-Za-z]:$') {
        throw 'Use a dedicated local absolute Windows directory.'
    }
    $cursor = [IO.Path]::GetFullPath($Path)
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) {
            if ((Get-Item -LiteralPath $cursor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) {
                throw 'Installation directories must not traverse junctions or symlinks.'
            }
        }
        $cursor = [IO.Path]::GetDirectoryName($cursor)
    }
}

function Assert-ETimePayload([string]$Root, $Manifest) {
    $actualFiles = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Force)
    if (Get-ChildItem -LiteralPath $Root -Recurse -Force |
        Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) {
        throw 'Payload contains a junction or symlink.'
    }
    if ($actualFiles.Count -ne @($Manifest.Files).Count) { throw 'Payload contains missing or extra files.' }
    $seen = @{}
    foreach ($entry in $Manifest.Files) {
        if ($entry.Path -match '(^/|^[A-Za-z]:|(^|/)\.\.(/|$)|\\)' -or $seen.ContainsKey($entry.Path)) {
            throw 'Unsafe or duplicate payload manifest path.'
        }
        $seen[$entry.Path] = $true
        if ((Get-FileHash -LiteralPath (Join-Path $Root $entry.Path) -Algorithm SHA256).Hash -ne $entry.Sha256) {
            throw 'Application payload hash verification failed.'
        }
    }
}

function Get-ETimeFailureCategory($Record) {
    $exception = $Record.Exception
    $sqlNumbers = @()
    $lastType = $exception.GetType().Name
    while ($null -ne $exception) {
        $lastType = $exception.GetType().Name
        if ($exception -is [Data.SqlClient.SqlException]) {
            $sqlNumbers = @($exception.Errors | ForEach-Object { $_.Number })
        }
        $exception = $exception.InnerException
    }
    return 'Exception type: ' + $lastType + '; SQL error numbers: ' + ($sqlNumbers -join ',')
}

function ConvertTo-ETimeDomain([string]$Domain) {
    $Domain = $Domain.Trim().TrimEnd('.').ToLowerInvariant()
    try { $Domain = (New-Object Globalization.IdnMapping).GetAscii($Domain) } catch {
        throw 'Invalid domain name.'
    }
    if ($Domain.Length -gt 253 -or $Domain -notmatch '\.' -or
        [Uri]::CheckHostName($Domain) -ne [UriHostNameType]::Dns -or
        $Domain -match '[/:*\s]' -or $Domain -notmatch '^[a-z0-9.-]+$') {
        throw 'Enter a DNS hostname only, without protocol, port, path or wildcard.'
    }
    foreach ($label in $Domain.Split('.')) {
        if ($label -notmatch '^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$') { throw 'Invalid domain label.' }
    }
    return $Domain
}

function Test-ETimeCertificateName([string]$Name, [string]$Domain) {
    $Name = $Name.ToLowerInvariant()
    if ($Name -eq $Domain) { return $true }
    if ($Name.StartsWith('*.')) {
        $suffix = $Name.Substring(1)
        return $Domain.EndsWith($suffix) -and
            $Domain.Split('.').Count -eq $Name.Split('.').Count
    }
    return $false
}

function Get-ETimeCertificate([string]$Thumbprint, [string]$Domain) {
    $Thumbprint = $Thumbprint -replace '\s', ''
    if ($Thumbprint -notmatch '^[A-Fa-f0-9]{40}$') { throw 'Supply a certificate thumbprint from LocalMachine\My.' }
    $cert = Get-Item -LiteralPath "Cert:\LocalMachine\My\$Thumbprint"
    if (-not $cert.HasPrivateKey -or $cert.NotAfter -le (Get-Date) -or $cert.NotBefore -gt (Get-Date)) {
        throw 'The HTTPS certificate must have a private key and be currently valid.'
    }
    $matchesDomain = $false
    foreach ($dnsName in $cert.DnsNameList) {
        if (Test-ETimeCertificateName ([string]$dnsName.Unicode) $Domain) { $matchesDomain = $true }
    }
    if (-not $matchesDomain) { throw 'Certificate DNS names do not cover the requested domain.' }
    return $cert
}

function Assert-ETimeBindingAvailable([string]$Domain) {
    foreach ($site in Get-Website) {
        foreach ($binding in Get-WebBinding -Name $site.Name) {
            if ($binding.bindingInformation -match (':(?:80|443):' + [regex]::Escape($Domain) + '$')) {
                throw "Domain already has a port 80/443 binding on IIS site '$($site.Name)'."
            }
        }
    }
}

function Set-ETimePrivateDirectory([string]$Path, [string]$PoolName) {
    $acl = New-Object Security.AccessControl.DirectorySecurity
    $acl.SetAccessRuleProtection($true, $false)
    $inherit = [Security.AccessControl.InheritanceFlags]'ContainerInherit, ObjectInherit'
    foreach ($sid in @('S-1-5-18', 'S-1-5-32-544')) {
        $identity = New-Object Security.Principal.SecurityIdentifier($sid)
        $acl.AddAccessRule((New-Object Security.AccessControl.FileSystemAccessRule(
            $identity, 'FullControl', $inherit, 'None', 'Allow'
        )))
    }
    if ($PoolName) {
        $acl.AddAccessRule((New-Object Security.AccessControl.FileSystemAccessRule(
            "IIS APPPOOL\$PoolName", 'ReadAndExecute', $inherit, 'None', 'Allow'
        )))
    }
    Set-Acl -LiteralPath $Path -AclObject $acl
}

function New-ETimeDomainSite {
    param([string]$Name, [string]$Domain, [string]$PhysicalPath, [string]$PoolName,
        [string]$CertificateThumbprint, [switch]$HttpOnly)
    $Domain = ConvertTo-ETimeDomain $Domain
    if (Get-Website | Where-Object Name -eq $Name) { throw 'The requested IIS site already exists.' }
    Assert-ETimeBindingAvailable $Domain
    $cert = $null
    if (-not $HttpOnly) { $cert = Get-ETimeCertificate $CertificateThumbprint $Domain }
    $created = $false
    try {
        $null = New-Website -Name $Name -PhysicalPath $PhysicalPath -ApplicationPool $PoolName `
            -IPAddress '*' -Port 80 -HostHeader $Domain
        $created = $true
        if (-not $HttpOnly) {
            New-WebBinding -Name $Name -Protocol https -IPAddress '*' -Port 443 -HostHeader $Domain -SslFlags 1
            $binding = Get-WebBinding -Name $Name -Protocol https |
                Where-Object bindingInformation -eq "*:443:$Domain"
            $binding.AddSslCertificate($cert.Thumbprint, 'My')
        }
        # Do not redirect HTTP device uploads; older firmware may not follow redirects.
        Set-WebConfigurationProperty -PSPath 'MACHINE/WEBROOT/APPHOST' -Location $Name `
            -Filter 'system.webServer/security/authentication/anonymousAuthentication' -Name userName -Value ''
        Start-Website -Name $Name
    } catch {
        if ($created) { Remove-Website -Name $Name -ErrorAction SilentlyContinue }
        throw
    }
}

function New-ETimeSqlConnection {
    param([string]$Server, [string]$Database = 'master',
        [Management.Automation.PSCredential]$Credential)
    $builder = New-Object Data.SqlClient.SqlConnectionStringBuilder
    $builder.DataSource = $Server
    $builder.InitialCatalog = $Database
    $builder.ConnectTimeout = 15
    $builder.PersistSecurityInfo = $false
    $builder.ApplicationName = 'eTimeTrack Installer'
    if ($null -eq $Credential) {
        $builder.IntegratedSecurity = $true
        return (New-Object Data.SqlClient.SqlConnection($builder.ConnectionString))
    }
    $builder.IntegratedSecurity = $false
    $secure = $Credential.Password.Copy()
    $secure.MakeReadOnly()
    $sqlCredential = New-Object Data.SqlClient.SqlCredential($Credential.UserName, $secure)
    return (New-Object Data.SqlClient.SqlConnection($builder.ConnectionString, $sqlCredential))
}

function Invoke-ETimeSqlTable {
    param([Data.SqlClient.SqlConnection]$Connection, [string]$Sql,
        [hashtable]$Parameters = @{}, [int]$Timeout = 30)
    $cmd = $Connection.CreateCommand()
    try {
        $cmd.CommandText = $Sql
        $cmd.CommandTimeout = $Timeout
        foreach ($key in $Parameters.Keys) { $null = $cmd.Parameters.AddWithValue($key, $Parameters[$key]) }
        $table = New-Object Data.DataTable
        $adapter = New-Object Data.SqlClient.SqlDataAdapter($cmd)
        try { $null = $adapter.Fill($table) } finally { $adapter.Dispose() }
        # Preserve a DataTable rather than enumerating its rows.
        return ,$table
    } finally { $cmd.Dispose() }
}

function ConvertTo-ETimeSqlIdentifier([string]$Value) {
    if ([string]::IsNullOrWhiteSpace($Value) -or $Value.Length -gt 128 -or $Value -match '[\x00-\x1f]') {
        throw 'SQL identifier must be a nonempty single line of at most 128 characters.'
    }
    return '[' + $Value.Replace(']', ']]') + ']'
}

function ConvertTo-ETimeSqlLiteral([string]$Value) {
    if ($Value -match '[\x00\r\n]') { throw 'SQL value contains an unsupported control character.' }
    return "N'" + $Value.Replace("'", "''") + "'"
}

function Get-ETimeRestoreMoves {
    param([Data.DataTable]$Files, [string]$DataDirectory, [string]$LogDirectory,
        [string]$FilePrefix)
    if ($DataDirectory -notmatch '^[A-Za-z]:\\' -or $LogDirectory -notmatch '^[A-Za-z]:\\' -or
        $FilePrefix -notmatch '^[a-zA-Z0-9_-]+$') { throw 'Invalid SQL destination directories or file prefix.' }
    if ($Files.Rows.Count -lt 2) { throw 'Backup must include data and log files.' }
    $dataCount = 0
    $logCount = 0
    $moves = @(
        foreach ($file in $Files.Rows) {
            $type = [string]$file.Type
            if ($type -notin @('D', 'L')) { throw 'FILESTREAM/full-text containers require a manual restore.' }
            if ($file.IsPresent -isnot [DBNull] -and -not [bool]$file.IsPresent) {
                throw 'Backup contains an absent file; only complete full backups are supported.'
            }
            if ($type -eq 'D') {
                $dataCount++
                $extension = '.ndf'
                if ($dataCount -eq 1) { $extension = '.mdf' }
                $target = $DataDirectory.TrimEnd('\') + '\' + $FilePrefix + '_data' + $dataCount + $extension
            } else {
                $logCount++
                $target = $LogDirectory.TrimEnd('\') + '\' + $FilePrefix + '_log' + $logCount + '.ldf'
            }
            'MOVE ' + (ConvertTo-ETimeSqlLiteral ([string]$file.LogicalName)) +
                ' TO ' + (ConvertTo-ETimeSqlLiteral $target)
        }
    )
    if (-not $dataCount -or -not $logCount) { throw 'Backup must include both data and log files.' }
    return $moves
}

function Test-ETimeApplicationDatabase {
    param([string]$Server, [string]$Database, [Management.Automation.PSCredential]$Credential)
    $connection = New-ETimeSqlConnection $Server $Database $Credential
    try {
        $connection.Open()
        $table = Invoke-ETimeSqlTable $connection @'
SELECT DB_NAME() AS DatabaseName, IS_SRVROLEMEMBER('sysadmin') AS IsSysadmin,
       IS_SRVROLEMEMBER('securityadmin') AS IsSecurityAdmin,
       IS_SRVROLEMEMBER('dbcreator') AS IsDbCreator;
SELECT TOP (0) SerialNumber, LastPing FROM Devices;
SELECT TOP (0) EmployeeId FROM Employees;
SELECT TOP (0) * FROM MasterSettings;
'@
        if ([int]$table.Rows[0].IsSysadmin -eq 1 -or [int]$table.Rows[0].IsSecurityAdmin -eq 1 -or
            [int]$table.Rows[0].IsDbCreator -eq 1) {
            throw 'Use a company-scoped application SQL login, not a server administration login.'
        }
        $otherDatabases = Invoke-ETimeSqlTable $connection @'
SELECT name FROM sys.databases
WHERE database_id > 4 AND state = 0 AND name <> DB_NAME() AND HAS_DBACCESS(name) = 1;
'@
        if ($otherDatabases.Rows.Count) {
            throw 'Application SQL login can access another user database. Use a separate company-scoped login.'
        }
        Write-Host 'Application SQL connection and minimum schema verified.'
    } finally { $connection.Dispose() }
    # The legacy application uses OLE DB, so a SqlClient-only check is insufficient.
    $pointer = [IntPtr]::Zero
    $plain = $null
    $oleBuilder = New-Object Data.OleDb.OleDbConnectionStringBuilder
    $oleConnection = $null
    try {
        $pointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($Credential.Password)
        $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($pointer)
        $oleBuilder.Provider = 'sqloledb'
        $oleBuilder['Data Source'] = $Server
        $oleBuilder['Initial Catalog'] = $Database
        $oleBuilder['User ID'] = $Credential.UserName
        $oleBuilder['Password'] = $plain
        $oleBuilder['Connect Timeout'] = 15
        $oleConnection = New-Object Data.OleDb.OleDbConnection($oleBuilder.ConnectionString)
        $oleConnection.Open()
        $command = $oleConnection.CreateCommand()
        try {
            $command.CommandTimeout = 15
            $command.CommandText = 'SELECT TOP (0) SerialNumber, LastPing FROM Devices'
            $reader = $command.ExecuteReader()
            $reader.Dispose()
        } finally { $command.Dispose() }
        Write-Host 'Legacy application SQL OLE DB provider connection verified.'
    } finally {
        if ($null -ne $oleConnection) { $oleConnection.Dispose() }
        if ($pointer -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($pointer) }
        $oleBuilder.Clear()
        $plain = $null
    }
}

function Restore-ETimeDatabase {
    param([string]$Server, [string]$Database, [string]$BackupPath,
        [int]$BackupSetPosition = 1, [Management.Automation.PSCredential]$AdminCredential,
        [int]$RestoreTimeoutSeconds = 3600)
    if ($BackupSetPosition -lt 1) { throw 'Backup set position must be positive.' }
    if ($Database -in @('master', 'model', 'msdb', 'tempdb')) { throw 'System database names are forbidden.' }
    if ($BackupPath -notmatch '(?i)\.(bak|back)$' -or
        ($BackupPath -notmatch '^[A-Za-z]:\\' -and $BackupPath -notmatch '^\\\\[^\\]+\\[^\\]+\\')) {
        throw 'Supply a .bak or .back path readable by SQL Server, on its own host or a permitted UNC share.'
    }
    $identifier = ConvertTo-ETimeSqlIdentifier $Database
    $connection = New-ETimeSqlConnection $Server 'master' $AdminCredential
    try {
        $connection.Open()
        $lock = Invoke-ETimeSqlTable $connection @'
DECLARE @result int;
EXEC @result = sys.sp_getapplock @Resource=@resource, @LockMode='Exclusive', @LockOwner='Session', @LockTimeout=0;
SELECT @result AS Result;
'@ @{ '@resource' = 'ETimeInstaller:Restore:' + $Database }
        if ([int]$lock.Rows[0].Result -lt 0) { throw 'Another installer is working on this database.' }
        $existing = Invoke-ETimeSqlTable $connection 'SELECT DB_ID(@db) AS Id;' @{ '@db' = $Database }
        if ($existing.Rows[0].Id -isnot [DBNull]) { throw 'Target database already exists; restore will not overwrite it.' }
        $version = Invoke-ETimeSqlTable $connection @'
SELECT CAST(SERVERPROPERTY('ProductMajorVersion') AS int) AS Major,
       CAST(SERVERPROPERTY('InstanceDefaultDataPath') AS nvarchar(4000)) AS DataPath,
       CAST(SERVERPROPERTY('InstanceDefaultLogPath') AS nvarchar(4000)) AS LogPath;
'@
        if ([int]$version.Rows[0].Major -lt 13) { throw 'SQL Server 2016 or later is required by this installer.' }
        $header = Invoke-ETimeSqlTable $connection 'RESTORE HEADERONLY FROM DISK=@backup;' @{ '@backup' = $BackupPath } 120
        $selected = @($header.Rows | Where-Object { [int]$_.Position -eq $BackupSetPosition })
        if ($selected.Count -ne 1 -or [int]$selected[0].BackupType -ne 1) {
            throw 'Selected backup set must be one complete full database backup.'
        }
        if ([int]$selected[0].SoftwareVersionMajor -gt [int]$version.Rows[0].Major) {
            throw 'This backup was produced by a newer SQL Server; install the same or a newer SQL Server version.'
        }
        if ([bool]$selected[0].IsDamaged) { throw 'Backup header marks this backup as damaged.' }
        $parameters = @{ '@backup' = $BackupPath; '@position' = $BackupSetPosition }
        $null = Invoke-ETimeSqlTable $connection 'RESTORE VERIFYONLY FROM DISK=@backup WITH FILE=@position;' `
            $parameters $RestoreTimeoutSeconds
        $files = Invoke-ETimeSqlTable $connection 'RESTORE FILELISTONLY FROM DISK=@backup WITH FILE=@position;' $parameters 120
        $moves = Get-ETimeRestoreMoves $files ([string]$version.Rows[0].DataPath) `
            ([string]$version.Rows[0].LogPath) ('etime_' + [Guid]::NewGuid().ToString('N'))
        # Never use REPLACE. Unique filenames and the prior DB_ID check protect existing databases.
        $sql = 'RESTORE DATABASE ' + $identifier + ' FROM DISK=@backup WITH FILE=@position, ' +
            ($moves -join ', ') + ', RECOVERY;'
        $null = Invoke-ETimeSqlTable $connection $sql $parameters $RestoreTimeoutSeconds
        Write-Host 'Database restored as a new database. It is retained if a later IIS step fails.'
    } finally { $connection.Dispose() }
}

function Initialize-ETimeDatabaseLogin {
    param([string]$Server, [string]$Database, [Management.Automation.PSCredential]$ApplicationCredential,
        [Management.Automation.PSCredential]$AdminCredential, [switch]$CreateSqlLogin,
        [switch]$RestoredDatabase)
    $connection = New-ETimeSqlConnection $Server 'master' $AdminCredential
    $pointer = [IntPtr]::Zero
    $plain = $null
    try {
        $connection.Open()
        $name = $ApplicationCredential.UserName
        if ($name -ieq 'sa') { throw 'Do not use sa for a company application.' }
        $identifier = ConvertTo-ETimeSqlIdentifier $name
        $databaseIdentifier = ConvertTo-ETimeSqlIdentifier $Database
        $login = Invoke-ETimeSqlTable $connection @'
SELECT SUSER_ID(@login) AS Id, IS_SRVROLEMEMBER('sysadmin', @login) AS IsSysadmin,
       IS_SRVROLEMEMBER('securityadmin', @login) AS IsSecurityAdmin,
       IS_SRVROLEMEMBER('dbcreator', @login) AS IsDbCreator;
'@ @{ '@login' = $name }
        if ($login.Rows[0].Id -isnot [DBNull] -and
            (@('IsSysadmin', 'IsSecurityAdmin', 'IsDbCreator') | Where-Object {
                $login.Rows[0][$_] -isnot [DBNull] -and [int]$login.Rows[0][$_] -eq 1
            })) { throw 'The application login must not hold server administration roles.' }
        if ($CreateSqlLogin) {
            # A typo must never grant new database access to an existing shared login.
            if ($login.Rows[0].Id -isnot [DBNull]) {
                throw 'CreateSqlLogin requires a new unique login. Existing login was not changed.'
            }
            $pointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($ApplicationCredential.Password)
            $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($pointer)
            $passwordLiteral = ConvertTo-ETimeSqlLiteral $plain
            $null = Invoke-ETimeSqlTable $connection (
                'CREATE LOGIN ' + $identifier + ' WITH PASSWORD=' + $passwordLiteral +
                ', CHECK_POLICY=ON, CHECK_EXPIRATION=OFF;'
            )
            $passwordLiteral = $null
        } elseif ($login.Rows[0].Id -is [DBNull]) {
            throw 'Application SQL login does not exist. Provision a dedicated login or use CreateSqlLogin.'
        }
        # Only invoked for restore/new-login paths, never silently for an existing-database mount.
        $sql = 'USE ' + $databaseIdentifier + '; ' +
            'IF DATABASE_PRINCIPAL_ID(@login) IS NULL CREATE USER ' + $identifier + ' FOR LOGIN ' + $identifier +
            '; ELSE ALTER USER ' + $identifier + ' WITH LOGIN=' + $identifier + ';'
        if ($CreateSqlLogin) {
            $sql += ' ALTER ROLE [db_owner] ADD MEMBER ' + $identifier + ';'
        }
        $null = Invoke-ETimeSqlTable $connection $sql @{ '@login' = $name }
        if ($RestoredDatabase) {
            # Keep old backup users/schema ownership, but prevent their logins connecting to this copy.
            $null = Invoke-ETimeSqlTable $connection ('USE ' + $databaseIdentifier + '; ' + @'
DECLARE @sql nvarchar(max) = N'';
SELECT @sql = @sql + N'DENY CONNECT TO ' + QUOTENAME(name) + N';'
FROM sys.database_principals
WHERE principal_id > 4 AND type IN ('S','U','G','E','X') AND name <> @login;
EXEC sys.sp_executesql @sql;
REVOKE CONNECT FROM guest;
ALTER DATABASE CURRENT SET TRUSTWORTHY OFF;
ALTER DATABASE CURRENT SET DB_CHAINING OFF;
'@) @{ '@login' = $name }
        }
        Write-Host 'Application database user mapped. Any newly created login is scoped to this database.'
    } finally {
        if ($pointer -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($pointer) }
        $plain = $null
        $connection.Dispose()
    }
}

Export-ModuleMember -Function *-ETime*
