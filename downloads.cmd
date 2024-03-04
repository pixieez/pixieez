@echo off
set ver=1.0 BETA

REM Run as admin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close) && exit
cd /d "%~dp0"
taskkill /IM powershell.exe /F

title PiXiE-EZ V%ver%

:MainMenu
cls
title PiXiE-EZ V%ver%
mode 82, 25
echo:     ________________________________________________________________________
echo:
echo:                               Welcome to PiXiE-EZ
echo:                              developed by pixieez1
echo:     ________________________________________________________________________ 
echo:
echo:         [1] Secrets Of Grindea (v0.99xx)    ^|  Steam ^|         (Download)
echo:         ________________________________________________________________
echo:
echo:         [0] Exit
echo:     ________________________________________________________________________ 
echo.
echo:     Enter a menu option in the Keyboard [1,0] :
choice /C:123456780 /N
set "userChoice=%errorlevel%"

if %userChoice%==1 goto Download1
if %userChoice%==2 goto Download2
if %userChoice%==3 goto Download3
if %userChoice%==9 goto EndScript

:Download1
set /p pixie_dir="Directory: "
curl -o %temp%/aria2c.exe https://raw.githubusercontent.com/pixieez/pixieez/main/aria2c.exe
cd /d %temp%
aria2c --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -x10 -o 2RNEddjg.zip -d "%pixie_dir%" https://pd.cybar.xyz/2RNEddjg
cd /d %pixie_dir%
start "" "2RNEddjg.zip"

pause
goto MainMenu

:EndScript
echo Exiting script...
