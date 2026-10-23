# Installation and operations

## Before starting

Use an elevated **64-bit Windows PowerShell 5.1** session on Windows Server 2016 or later. This is a Windows IIS installer, not a firmware installer or Linux package. The bootstrap selects classic CLR v4.0 pools to match the supplied working deployment.

Keep the unzipped bundle outside all websites. If downloaded files are blocked, inspect the trusted release and checksum, then unblock only those files. Respect organization script-signing policy. Do not disable machine-wide execution policy. `Start-Installer.cmd` calls Windows PowerShell without changing execution policy; launch it from an administrator terminal.

Prepare these external dependencies:

| Dependency | Installer behaviour |
|---|---|
| IIS/ASP.NET 4.x roles | Checks required roles. Installs missing roles with `-InstallDependencies`. Use `-WindowsFeatureSource` for an appropriate offline Windows feature source. |
| .NET Framework 4.8+ | Checks the installed release. If missing, accepts a Microsoft-signed offline installer via `-DotNetInstallerPath` together with `-InstallDependencies`. Not bundled because OS requirements differ. A required reboot stops the installer; reboot and rerun. |
| IIS URL Rewrite 2.1 x64 | Official Microsoft MSI is bundled. Checks its packaged SHA-256 and Microsoft Authenticode signature before installing. |
| SQL Server | Must already be installed on Windows, local or remote. This installer does not install a SQL engine, change SQL mixed-mode configuration, or open SQL firewall ports. |
| Legacy SQL OLE DB provider | The supplied build uses Windows `sqloledb`. Both .NET SqlClient and OLE DB connectivity/schema are checked before a company is created. Custom `SQLType.txt` provider overrides are not bundled. |
| ReportViewer and other application DLLs | Bundled as supplied by the owner. They are not upgraded or represented as current. WinSCP's companion executable is retained for runtime compatibility. |
| DNS and TLS certificate | Create DNS records with your provider; import the domain's trusted certificate/private key into `Cert:\LocalMachine\My`. Supply its thumbprint. Certificate creation, ACME renewal, PFX import, Cloudflare settings and DNS API integration are not automated. |
| Licensing/activation | Follow eSSL's supported licensing and activation process for each deployment. No licensing bypass is provided. |

Review [NOTICE.md](../NOTICE.md) and keep the repository private. The main `iclock` web application is included. Employee Self Service and Windows scheduler/parallel-sync services need separate setup if required.

## Find your certificate thumbprint

A certificate thumbprint is the unique identifier IIS uses to select an installed SSL/TLS certificate for HTTPS. `YOUR_CERTIFICATE_THUMBPRINT`, `CERT_THUMBPRINT`, `SHARED_DOMAIN_CERT`, and `CUSTOM_DOMAIN_CERT` in the examples are placeholders; replace them with actual thumbprints.

On the Windows server, open **PowerShell as Administrator** and run:

```powershell
Get-ChildItem Cert:\LocalMachine\My |
    Select-Object Subject, Thumbprint, NotAfter, HasPrivateKey |
    Format-List
```

Select a certificate whose subject or DNS names cover the hostname you are configuring. Its `NotAfter` date must be in the future, and `HasPrivateKey` must be `True`. The installer also checks that it is currently valid and its DNS names match the requested domain.

Copy the complete `Thumbprint` value without spaces into the appropriate argument:

```powershell
-CertificateThumbprint "PASTE_THE_ACTUAL_THUMBPRINT_HERE"
```

Use `-CertificateThumbprint` for the shared hosting domain and `-CompanyCertificateThumbprint` for an optional custom company domain during installation. Both can use the same certificate only if it covers both hostnames. `Add-ETimeCompanyDomain.ps1` uses its own `-CertificateThumbprint` argument for the custom hostname.

If no certificates appear, install a trusted certificate with its private key into `LocalMachine\My`, then rerun the lookup. A certificate showing `HasPrivateKey: False` cannot be used by this installer for HTTPS; import the certificate with its matching private key. Certificate issuance/import remains an external prerequisite described above.

The thumbprint is safe to share. Do not share the private key, a `.pfx` file, or its password, and never commit those files to Git.

## Existing database

```powershell
.\Install-ETimeTrack.ps1 -CompanyName northstar `
  -Domain attendance.example.com -DbServer 'localhost\SQLEXPRESS' `
  -Database northstar -CertificateThumbprint 'CERT_THUMBPRINT' `
  -InstallDependencies -OpenFirewall
```

Enter the existing **company-specific SQL login and password** in the local prompt. It must already be mapped to this database and have the permissions required by the vendor application. The connection check rejects application logins in `sysadmin`, `securityadmin`, or `dbcreator`, and logins that can access another online user database; do not use `sa` or reuse one login across companies. Metadata visibility and SQL server aliases still require operator review; this check is not a complete SQL permission audit.

The preflight checks the `Devices`, `Employees`, and `MasterSettings` tables and the device columns. This is not a complete schema migration or vendor acceptance test. SQL credentials are supplied through a `PSCredential` object; there is no plain-password command-line option. Avoid using transcripts/debug dumps that capture credential-bearing objects.

`-CreateSqlLogin` can create a new, unique server login for an existing database using administrator privileges, map a database user, and grant `db_owner` on **only that database**. The legacy application can create/update schema such as log tables; database ownership is deliberate and is not a claim of minimum SQL permissions for every feature. An existing login is never silently repurposed or password-reset by this flag. Without the flag, mounting an existing database does not change SQL users or roles.

## Restore a .bak or .back file

The extension may be `.bak` or `.back`; the content must be a real full SQL Server backup. Renaming an MDF, CSV, ZIP or BACPAC does not make it restorable.

```powershell
$sqlAdmin = Get-Credential -Message 'SQL administrator for restore/login creation only'
.\Install-ETimeTrack.ps1 -CompanyName northstar `
  -Domain attendance.example.com -DbServer 'localhost\SQLEXPRESS' `
  -Database northstar -BackupPath 'C:\SqlBackups\northstar.back' `
  -BackupSetPosition 1 -CreateSqlLogin -SqlAdminCredential $sqlAdmin `
  -CertificateThumbprint 'CERT_THUMBPRINT' -InstallDependencies -OpenFirewall
$sqlAdmin = $null
```

The separately requested application credential is written into company settings using the vendor's expected encoding. The administrator credential is used only for restore/login setup and is not written into the website.

Backup paths are interpreted by **the SQL Server service on the SQL host**, not by your laptop. For remote SQL, copy the backup onto that server or provide an appropriately secured UNC share. The SQL service account needs read access to the backup. Never grant Everyone access to customer backups or store them under a website. Normal backup/restore privileges are required; lack of permission does not justify granting the application login server-wide rights.

The restore path:

- Takes a session application lock scoped to the destination database name.
- Refuses system databases and any destination database that already exists.
- Reads `RESTORE HEADERONLY`, requires the selected set to be full (`BackupType=1`), rejects a damaged header and backups from newer SQL major versions.
- Runs `RESTORE VERIFYONLY` before restore.
- Reads `RESTORE FILELISTONLY` and generates a `MOVE` for **every** data/log file, using unique filenames in the SQL instance's default data/log directories.
- Restores with `RECOVERY`, without `REPLACE`. It never overwrites a database as part of a retry.
- Maps the selected application login to the restored database. When `-CreateSqlLogin` is used, the new unique login receives ownership of that database only. Otherwise existing restored user roles are retained; insufficient access causes the connection checks to fail.
- Denies connection to other restored SQL/Windows/external users, disables guest connection, and disables TRUSTWORTHY/cross-database chaining for the restored copy. Schema ownership is retained; review restored stored procedures/integrations as usual.

Only conventional complete disk backups with `D`/`L` files are automated. Differential/log chains, split/striped media, FILESTREAM containers, missing files, restoring encryption keys/certificates, managed-cloud backup formats, and attaching raw MDF/LDF files require a separate supported restore process. SQL edition, version, available disk space, service permissions, collation, encryption, and backup integrity can still prevent restore. A newer backup cannot be restored to an older SQL Server.

`VERIFYONLY` is not a substitute for checking database integrity. Use trusted backups and schedule appropriate `DBCC CHECKDB`/vendor checks. The restore command has a bounded one-hour timeout; interrupted/failed restores can leave a new database in a partial state. The installer deliberately does not drop it automatically.

## Host bootstrap

With `-InstallDependencies`, the first company run installs missing IIS roles and URL Rewrite, checks .NET, stages the verified application and creates the shared domain site. Subsequent companies reuse the staged template and host settings. Keep using the same `Domain`, `SiteName`, `InstallRoot`, HTTP/HTTPS mode and certificate until a deliberate maintenance change is planned.

Default filesystem layout:

```text
C:\eTimeTrackHosting\
  .etimetrack-installer
  Host.json                 non-secret host metadata
  Template\iclock\          verified clean application template
  Sites\Host\               minimal shared website root
  Companies\northstar\      isolated company's application files
  State\northstar.json       non-secret provisioning metadata
```

`Settings.txt` belongs inside each company root. It contains database details and a reversibly encoded password and must remain private. The script blocks its HTTP download and limits NTFS access. XML connection strings from the template are replaced with this company's database settings and machine-protected using DPAPI. These protected files cannot simply be moved to another server; reprovision the company there.

Application code and configuration are read-only to its pool. Only known runtime-data directories are writable. The web UI database-settings page cannot rewrite `Settings.txt` under this policy; make future database changes through an administrator-controlled process. New writable feature directories must be reviewed individually rather than giving modify permission to the full application root.

The staged template is hash-verified, not automatically overwritten on upgrade. Do not edit it in place. Upgrading a vendor build, replacing a certificate, or changing an existing company's database is a separate maintenance action. Company folders, pools and state entries are never overwritten by another install run. Two companies using the same SQL server/database string within the same installation are rejected; alias hostnames pointing to one SQL instance still require operator review.

Bootstrapping never stops Default Web Site or removes unrelated bindings. It creates explicit hostname bindings, avoiding duplicate wildcard `*:80:` bindings. Existing domain/port bindings owned by another site are rejected. The optional firewall flag opens inbound TCP 80/443 on all Windows firewall profiles; no SQL port is opened. Restrict external/cloud firewall rules according to your hosting network.

## Custom company domain

During creation:

```powershell
.\Install-ETimeTrack.ps1 -CompanyName northstar `
  -Domain attendance.example.com -CompanyDomain attendance.northstar.example `
  -DbServer localhost -Database northstar `
  -CertificateThumbprint 'SHARED_DOMAIN_CERT' `
  -CompanyCertificateThumbprint 'CUSTOM_DOMAIN_CERT' -InstallDependencies
```

After creation, or to resume a failed optional custom-domain step:

```powershell
.\Scripts\Add-ETimeCompanyDomain.ps1 -CompanyName northstar `
  -Domain attendance.northstar.example -CertificateThumbprint 'CUSTOM_DOMAIN_CERT'
```

This creates a **separate IIS site** rooted in that company's directory, using its dedicated pool. It does not add the custom hostname to the shared multi-company site. Both `https://attendance.example.com/northstar/` and `https://attendance.northstar.example/` reach that company's database, but browser sessions are independent between origins/application roots.

HTTPS uses SNI and an already installed certificate with a private key, valid dates and matching DNS name. Wildcards match one label only. This validation does not prove public certificate-chain trust or successful DNS/proxy routing. Create the DNS record and configure any reverse proxy/CDN yourself. Legacy devices that lack SNI/HTTPS/hostname support may need a separately designed compatible endpoint; do not assume a browser login proves device compatibility.

`-HttpOnly` is available explicitly for a private test network. It leaves credentials/device traffic unencrypted and is not the production default. The bootstrap does not force HTTP redirects because some device firmware cannot follow redirects on uploads. Use HTTPS for browser login and a verified device transport appropriate to the hardware/network.

## Device routing and checks

For a shared company address, the observed compatible routing is:

```text
/northstar/iclock/getrequest -> /northstar/getrequest.aspx
/northstar/iclock/cdata      -> /northstar/cdata.aspx
/northstar/iclock/devicecmd  -> /northstar/devicecmd.aspx
```

For a custom company domain, the same rule matches `/iclock/...` at that site's root. Rewrites are internal and preserve queries and POST bodies; no cross-company catch-all routing is added. Firmware may append `iclock` itself; use the demonstrated device format and do not append it twice.

Register the exact physical serial in the correct company. After installing, verify the login/data, current LastPing, a real test punch's stored attendance record, and any intentionally requested command's acknowledgement. Confirm `/company/Settings.txt` and the custom domain's `/Settings.txt` are blocked without printing or sharing their contents.

```powershell
.\Scripts\Get-ETimeDeviceRequests.ps1 -SiteName 'eTimeTrack Hosting' `
  -CompanyName northstar | Format-Table -AutoSize -Wrap
```

For a custom root site:

```powershell
.\Scripts\Get-ETimeDeviceRequests.ps1 -SiteName 'eTime-northstar-domain' `
  -AtSiteRoot | Format-Table -AutoSize -Wrap
```

IIS timestamps are UTC; the uploaded dashboard compares Windows local time minus five minutes against LastPing. A fresh `200` proves HTTP success, not protocol acceptance or an affected device row. Missing/mismatched `SN` can leave the dashboard offline despite `200`. The reader prints only the serial parameter, never complete queries or upload bodies. Rerun it for fresh rows; IIS log buffering can delay output.

## Failure and recovery

Bootstrap can install machine-wide dependencies and create an IIS site; those successful steps are retained if a later step fails. SQL restore/login operations are also retained. This avoids deleting customer data during a partial setup. The company-creation step attempts to remove only its new folder/pool/application if it fails. An IIS backup is created before configuration changes, but the installer does not automatically restore the entire server configuration and risk undoing concurrent work.

The entry point reports the failed stage, exception type, and SQL error numbers without echoing arbitrary SQL/vendor messages that might contain credentials. Check locally without copying complete `$Error`, debug transcripts or secret settings into chat. Useful SQL error numbers include `18456` (login), `4060` (database access), `3201` (backup file access), `3154` (backup/target mismatch), `3169` (newer backup), and `5170` (file collision); inspect the local SQL error log for the exact cause.

| Stage | Recovery |
|---|---|
| Windows dependency installation/reboot | Complete the reboot or trusted dependency setup; rerun. Successful role/module installation is retained. |
| Certificate/domain validation | Import the correct certificate or fix hostname inputs. DNS changes happen at the provider. |
| Existing unmanaged IIS site/pool/folder | Choose new names or review the existing resources manually. The installer does not take ownership of unrelated resources. |
| SQL restore fails | Inspect the SQL host, backup compatibility, service permissions and disk space. A partial new DB may remain. Do not blindly overwrite or delete it. |
| Restore succeeded but later step failed | Rerun **without `-BackupPath`** using that existing DB. Verify any new login first; omit `-CreateSqlLogin` if it was already created. |
| SQL login mapping/schema/provider check | Confirm the dedicated login's mapping/roles, the expected vendor schema and legacy OLE DB connectivity. The application admin credential must not be the SQL server admin credential. |
| Company mount already exists | Inspect `State\company.json` and IIS before retrying. The installer is not an update/overwrite command. |
| Optional custom company domain fails | The working `/company/` mount is retained. Fix DNS/certificate/binding inputs and run `Add-ETimeCompanyDomain.ps1`. |

## Validation boundary

Offline tests validate parser compatibility, XML changes, narrow rewrite matching, credentials replacement, domain validation, SQL quoting, payload hashes, and mocked restore refusal/command construction. The vendor password codec round trips synthetic passwords. No credential from the original `Settings.txt` is included in the prepared payload.

A real Windows Server IIS bootstrap, NTFS/DPAPI permissions, SQL restore, certificate binding and fresh-company device test have **not** been executed in this workspace. First run against a trial company and trusted test backup. Neither a ZIP build nor a mocked restore is production proof.

## Official references

- [IIS URL Rewrite](https://www.iis.net/downloads/microsoft/url-rewrite)
- [Install Windows Server features](https://learn.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature)
- [IIS bindings and SNI](https://learn.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/bindings/binding/)
- [SQL RESTORE HEADERONLY](https://learn.microsoft.com/en-us/sql/t-sql/statements/restore-statements-headeronly-transact-sql)
- [SQL RESTORE FILELISTONLY](https://learn.microsoft.com/en-us/sql/t-sql/statements/restore-statements-filelistonly-transact-sql)
- [Restore to new database files](https://learn.microsoft.com/en-us/sql/relational-databases/backup-restore/restore-a-database-to-a-new-location-sql-server)
- [DPAPI protected configuration](https://learn.microsoft.com/en-us/previous-versions/aspnet/zhhddkxy(v=vs.100))
