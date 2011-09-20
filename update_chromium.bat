@echo off
echo.
echo ***************************************************************************
echo Author: Sui Libin (sui.libin AT GMail dot com)
echo Data:   2011-09-15
echo ***************************************************************************
echo.
wget -q --output-document=latest.txt http://commondatastorage.googleapis.com/chromium-browser-snapshots/Win/LAST_CHANGE
for /f %%a in (latest.txt) do set lastest=%%a
echo.
echo.
echo.
echo ***************************************************************************
echo *                      lastest version is %lastest%.                      *
echo ***************************************************************************
echo.
echo.
echo.
echo.
@del /S /q mini_installer_%lastest%.exe
echo  Downloading mini_installer_%lastest%.exe, please wait...
echo.
wget -N http://commondatastorage.googleapis.com/chromium-browser-snapshots/Win/%lastest%/mini_installer.exe -v -p -r --output-document=mini_installer_%lastest%.exe
echo  Download Finished.
if exist mini_installer_%lastest%.exe goto there
:there
@del /S /q latest.txt

tasklist |find /i "chrome.exe"
if errorlevel==1 goto Yes
if errorlevel==0 goto RequireCloseChrome

:RequireCloseChrome
type nul>%temp%\~YesOrNo.tmp
echo.
echo.
echo  Would you like to install mini_installer_%lastest%.exe now [y/n]?
del /p %temp%\~YesOrNo.tmp>nul
if not exist %temp%\~YesOrNo.tmp goto Yes
echo.
echo.
echo You can manuelly install %CD%\mini_installer_%lastest%.exe
del %temp%\~YesOrNo.tmp
pause
goto end
:Yes
echo  Installing, please waiting...
call mini_installer_%lastest%.exe
echo  Install Finished!
goto end

:nothere
echo Error download, you should connect with author to check where it is failed!
pause
:end
@echo on
