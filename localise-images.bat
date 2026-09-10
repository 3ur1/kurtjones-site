@echo off
REM Downloads the site's remaining Wix-hosted images into the repo and
REM repoints the HTML at them. Double-click, then run push.bat.
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\localise-images.ps1"
echo.
pause
