@echo off
setlocal

:: Number of Chrome windows to open
set "numWindows=10"

:: Create a temporary HTML file
set "htmlFile=%temp%\hotsteamysex.html"
(
    echo ^<!DOCTYPE html^>
    echo ^<html^>
    echo ^<head^>
    echo ^<title^>hotsteamysex AND Disable defender^</title^>
    echo ^</head^>
    echo ^<body^>
    echo ^<h1^>Welcome to Hot Steamy Sex!^</h1^>
    echo ^</body^>
    echo ^</html^>
) > "%htmlFile%"

:: Loop to create multiple Chrome windows with the specified title
for /L %%i in (1,1,%numWindows%) do (
    start chrome "%htmlFile%"
)

:: Optional: Clean up the HTML file after a delay
timeout /t 5 > nul
del "%htmlFile%"

endlocal