@echo off

:: Set the task name
set TASK_NAME=AddAdminUser

:: Set the username and password for the new admin user
set USERNAME=NewAdminUser2
set PASSWORD=test

:: Create the task with SYSTEM privileges
schtasks /create /tn "%TASK_NAME%" /tr "cmd /c net user %USERNAME% %PASSWORD% /add && net localgroup Administrators %USERNAME% /add" /sc ONSTART /rl HIGHEST /ru SYSTEM

:: Start the task
schtasks /run /tn "%TASK_NAME%"