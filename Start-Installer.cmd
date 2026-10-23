@echo off
rem Open an Administrator terminal first. This does not weaken machine execution policy.
powershell.exe -NoLogo -NoProfile -File "%~dp0Install-ETimeTrack.ps1" %*
pause
