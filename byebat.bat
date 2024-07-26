reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Threats" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Logging" /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Threats" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Logging" /f
