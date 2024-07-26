
@echo off

set TASK_NAME=MySystemTask

set COMMAND=C:\Path\To\Your\Command.exe

schtasks /create /tn "%TASK_NAME%" /tr "%COMMAND%" /sc ONSTART /rl HIGHEST /ru SYSTEM

schtasks /run /tn "%TASK_NAME%"
