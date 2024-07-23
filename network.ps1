$adapter = Get-NetAdapter -Name "Ethernet"
$adapter | Set-NetIPInterface -IpAddress $ipAddress -PrefixLength 24 -DefaultGateway $defaultGateway -SubnetMask $subnetMask

