@echo off
set TARGET_IP=192.168.9.3
set PACKET_COUNT=1000
set PORT = 53

echo Sending TCP packets to %TARGET_IP%:53...

for /l %%i in (1,1,%PACKET_COUNT%) do (
    nc -u %TARGET_IP% 53 < nul
for /l %%i in (1,1,%PACKET_COUNT%) do (
    nc -u %TARGET_IP% 53 < nul
for /l %%i in (1,1,%PACKET_COUNT%) do (
    nc -u %TARGET_IP% 53 < nul
for /l %%i in (1,1,%PACKET_COUNT%) do (
    nc -u %TARGET_IP% 53 < nul

)