@echo off
set TARGET_IP=192.168.9.3
set PACKET_COUNT=1000

echo Sending TCP packets to %TARGET_IP%:9080...

for /l %%i in (1,1,%PACKET_COUNT%) do (
    nc %TARGET_IP% 9080 < nul
)