
schtasks /create /tn "RunPowerShellScript2" /tr "'C:\Program Files\PowerShell\7\pwsh.exe' -NoProfile -ExecutionPolicy Bypass -File 'C:\Users\thekid\OneDrive\Desktop\monitor.ps1'" /sc minute /mo 2 /ru SYSTEM
schtasks /run /tn RunPowerShellScript2
