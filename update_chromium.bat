REM ***************************************************************************
REM Sui Libin (sui.libin AT GMail dot com)
REM ***************************************************************************
REM
REM @echo off
REM wget -q --output-document=latest.txt http://build.chromium.org/f/chromium/snapshots/Win/LASTEST
wget -q --output-document=latest.txt http://commondatastorage.googleapis.com/chromium-browser-snapshots/Win/LAST_CHANGE
for /f %%a in (latest.txt) do set lastest=%%a
@echo ***************************************
@echo *      lastest version is %lastest%.      *
@echo ***************************************
@echo.
del /S /q mini_installer_%lastest%.exe
REM wget -N http://build.chromium.org/f/chromium/snapshots/Win/%lastest%/mini_installer.exe mini_installer_%lastest%.exe
wget -N "http://commondatastorage.googleapis.com/chromium-browser-snapshots/Win/%lastest%/mini_installer.exe" mini_installer_%lastest%.exe
@del /S /q latest.txt
@echo on