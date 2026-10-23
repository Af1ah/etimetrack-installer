# Why the original deployment failed

Recorded on 23 October 2026 from the supplied IIS output, device request logs, screenshots, and compiled-code inspection.

| Symptom | Finding | Correction |
|---|---|---|
| `MachineToApplication` configuration error | `/secu` pointed to the parent `etime_test` folder, while the ASP.NET application configuration was inside `iclock`. | Point the application directly to the physical `iclock` directory. |
| Hosting site could not coexist on HTTP port 80 | Default Web Site and the company-hosting site both had the wildcard `*:80:` binding. | Use explicit hostname bindings for the hosting site. The new installer never removes unrelated site bindings. |
| Login loaded, but devices remained offline | Device requested `/secu/iclock/getrequest`, while the handler was directly under `/secu`. Logs showed `404.0`, Win32 `2`. | Install URL Rewrite and internally rewrite the three device endpoints to their local `.aspx` handlers. |
| Initial rewrite attempt did not run | URL Rewrite was not registered. | Install the official Microsoft module once. The new bootstrap checks and can install it. |
| HTTP 200 did not immediately imply online status | The polling handler updates LastPing by the supplied `SN` and ignores the affected-row count. Database configuration is read from the application-root Settings.txt. | Verify exact registered serial, selected company database, and recent LastPing. The user subsequently confirmed the device online; the exact final database-setting change was not recorded. |

The final screenshot showed one online device and zero offline devices. Logs changed from 404 to sustained 200 starting at 11:21:21 UTC on 23 October 2026. A stored attendance punch and command acknowledgement were not independently verified.

## Uploaded-code evidence

- `App_Web_wdniqpox.dll`: `getrequest.Page_Load` reads the `SN` query parameter and calls `UpdateDeviceLastPing`.
- `eTimeTrackLiteLibrary.dll`: `DeviceManagement.UpdateDeviceLastPingBySerialNumber` updates `Devices.LastPing` for `SerialNumber` and discards the affected-row count. Unknown serials can therefore produce HTTP success without updating a registered device.
- `WorkerPage.PopulateDataGrid` and `EmployeeManagement.GetActiveDevicesCount` compare LastPing against Windows server local time minus five minutes. IIS W3C logs use UTC.
- `DatabaseConnection.GetDBSettings` reads six SQL Server settings lines from the application's base-directory `Settings.txt`.
- `Encryption64.Encrypt`/`Decrypt` implement the required reversible vendor password format. The installer uses these supplied methods, verifies a round trip, blocks HTTP access to Settings.txt, and restricts file permissions.

The uploaded DLL SHA-256 values were:

```text
App_Web_wdniqpox.dll
A031048AC0AA4448A0E38DDCB809953A4F80502DB5045D5F1B9F4702499B277F

eTimeTrackLiteLibrary.dll
D819074F4ECADB47FF9BDD5B6170BF3E5CF3C3B936F964031E91CADA201F4115
```

Production DLL hashes were not collected. Reassess this behaviour before substituting a different vendor build.

Turning compilation debug off is appropriate for production but does not fix an application boundary or endpoint path. The earlier error solved by eSSL's debug-setting change was not supplied, so its specific cause remains unconfirmed.

See [INSTALL.md](INSTALL.md) for the new bundle's setup, domain provisioning, restore restrictions and verification steps. No production configuration was changed while preparing this repository.
