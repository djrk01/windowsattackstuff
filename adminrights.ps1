# Get the current user
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# Add the user to the Administrators group
Add-LocalGroupMember -Group "Administrators" -Member $user

# Grant the user elevated privileges
$principal = New-Object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())
$principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator) | Out-Null

# Grant the user read/write access to the registry
$registryRoot = [Microsoft.Win32.RegistryKey]::LocalMachine
$acl = $registryRoot.GetAccessControl()
$rule = New-Object System.Security.AccessControl.RegistryAccessRule($user, "ReadKey,WriteKey", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.SetAccessRule($rule)
$registryRoot.SetAccessControl($acl)

# Grant the user read/write access to the file system
$rootDir = [System.IO.Directory]::GetLogicalDrives()
foreach ($drive in $rootDir) {
    $acl = $drive.GetAccessControl()
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($user, "Read,Write", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.SetAccessRule($rule)
    $drive.SetAccessControl($acl)
}

Write-Host "Privileges granted to $user"