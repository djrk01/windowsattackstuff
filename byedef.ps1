# Disable Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisableScriptScanning $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableIntrusionPreventionSystem $true
Set-MpPreference -DisableNetworkProtection $true
Set-MpPreference -DisableBlockAtFirstSeen $true

# Stop and disable Windows Defender services
Stop-Service -Name WinDefend -Force
Set-Service -Name WinDefend -StartupType Disabled

# Disable Windows Defender from the registry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWORD -Value 1 -Force