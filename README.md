# eTimeTrack installer

Unzip on a Windows Server, run the installer as Administrator, and create an eTimeTrackLite company at `https://attendance.example.com/company/`. An optional custom domain such as `https://attendance.customer.com/` serves only that company.

The bundle contains the supplied compiled **iclock web application**, a Microsoft URL Rewrite installer, host bootstrap, SQL connection checks, optional full `.bak`/`.back` restore, company provisioning, and a device-log reader. Credentials are entered locally, not stored in this repository.

## Quick start

Use **64-bit Windows PowerShell 5.1 as Administrator**. Install SQL Server separately or use an existing SQL Server. Install a trusted TLS certificate in `LocalMachine\My` and point your domain DNS at the server/proxy.

Find the installed certificate's **thumbprint**, its unique identifier, by running:

```powershell
Get-ChildItem Cert:\LocalMachine\My |
    Select-Object Subject, Thumbprint, NotAfter, HasPrivateKey |
    Format-List
```

Choose the certificate covering your domain, with a future `NotAfter` date and `HasPrivateKey: True`. Replace `YOUR_CERTIFICATE_THUMBPRINT` below with its actual `Thumbprint` value, without spaces. For a custom company domain, select a certificate covering that hostname for `-CompanyCertificateThumbprint` too.

If the command returns no certificates, install the trusted certificate and its private key into `LocalMachine\My` before using HTTPS. The thumbprint is safe to share; keep private keys, `.pfx` files and their passwords private. See [certificate selection](docs/INSTALL.md#find-your-certificate-thumbprint) for details.

```powershell
Set-Location C:\Downloads\etimetrack-installer

# Existing company database and existing dedicated SQL login; password prompt follows.
.\Install-ETimeTrack.ps1 -CompanyName northstar `
    -Domain attendance.example.com `
    -DbServer 'localhost\SQLEXPRESS' -Database northstar `
    -CertificateThumbprint 'YOUR_CERTIFICATE_THUMBPRINT' `
    -InstallDependencies -OpenFirewall
```

For a new database restored from a trusted full backup and a new dedicated SQL login:

```powershell
.\Install-ETimeTrack.ps1 -CompanyName northstar `
    -Domain attendance.example.com `
    -DbServer 'localhost\SQLEXPRESS' -Database northstar `
    -BackupPath 'C:\SqlBackups\northstar.back' -CreateSqlLogin `
    -CertificateThumbprint 'YOUR_CERTIFICATE_THUMBPRINT' `
    -InstallDependencies -OpenFirewall
```

Restore/login administration uses your current Windows account by default. For SQL administrator authentication, supply `-SqlAdminCredential (Get-Credential)`; the application login is requested separately and must not be a server administrator.

With no arguments, `Install-ETimeTrack.ps1` prompts for the required settings. Read [installation, dependencies, domains and recovery](docs/INSTALL.md) before the first run. `-WhatIf` prints the planned operation without requesting passwords or making changes; it still requires the supported Windows environment and valid certificate inputs.

## Supported scope

- Windows Server 2016 or later, IIS 10, .NET Framework 4.8+, Windows PowerShell 5.1 x64.
- SQL Server 2016 or later on Windows, accepting the supplied application's legacy `sqloledb` provider. Existing databases must match this eTimeTrackLite build's schema.
- One complete, trusted SQL Server disk backup set, optionally renamed to a new database, with all data/log files moved safely. The destination cannot already exist.
- Hostname bindings with existing TLS certificates. DNS records and certificate issuance stay with your DNS/certificate provider.
- Separate application folders, pools, SQL logins and databases. Existing applications and databases are not overwritten.

This does not run on Linux, arbitrary Windows client PCs, or every biometric device. Newer SQL policies, incompatible backups, unsupported firmware, missing licensing, and third-party component requirements can prevent operation. SQL engine installation, Employee Self Service provisioning, database migrations, vendor activation, and scheduler-service setup are not automated.

## Verification

```powershell
# Offline checks: no IIS or SQL mutations.
.\tests\Test-Installer.ps1

# Fresh device requests after installing a company.
.\Scripts\Get-ETimeDeviceRequests.ps1 `
    -SiteName 'eTimeTrack Hosting' -CompanyName northstar |
    Format-Table -AutoSize -Wrap
```

Offline tests passed on Linux PowerShell using the supplied DLL's password codec and a mocked SQL transport. GitHub Actions also runs the offline checks on Windows. A real Windows/IIS/SQL restore and device acceptance check must still be performed before broad production rollout. No universal compatibility or successful fresh-server installation is claimed.

## Build

```bash
python build/package.py
```

Produces `dist/etimetrack-installer.zip` and its SHA-256 checksum. The application payload and official dependency are tracked in this private repository. Operational database backups, settings, certificates and generated ZIPs are excluded from Git.

[Original incident and routing explanation](docs/incident-and-company-hosting.md) · [Third-party licensing](NOTICE.md)
