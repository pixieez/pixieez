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
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/pixieez/pixieez/main/aria2c.exe" -OutFile "%temp%\aria2c.exe" -UseBasicParsing -PassThru | Write-Progress -Activity "Downloading file" -Status "Progress"
start %temp%aria2c -x10 -o 8iAq2itk.zip -d %pixie_dir% https://pd.cybar.xyz/8iAq2itk

pause >nul
goto MainMenu

:EndScript
echo Exiting script...