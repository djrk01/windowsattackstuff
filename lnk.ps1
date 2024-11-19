$targetFolderPath = "C:\Users\%USER%\Desktop"
$shortcutName = "DeleteFiles"
$targetPath = "C:\Windows\System32\cmd.exe"
$arguments = "/c del /q C:\Usersz\*.*"

$shell = New-Object -ComObject WScript.Shell
$shortcutFilePath = Join-Path -Path $targetFolderPath -ChildPath "$shortcutName.lnk"
$shortcutObject = $shell.CreateShortcut($shortcutFilePath)
$shortcutObject.TargetPath = $targetPath
$shortcutObject.Arguments = $arguments
$shortcutObject.Save()

Write-Host "Shortcut '$shortcutName' created at '$shortcutFilePath'"
