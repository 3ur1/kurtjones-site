@echo off
REM ---------------------------------------------------------------
REM  Push the site live.
REM  Double-click this file. It commits whatever has changed in this
REM  folder and pushes to GitHub; Cloudflare then rebuilds and the
REM  new version is live on kurtjones.co.uk about a minute later.
REM ---------------------------------------------------------------
cd /d "%~dp0"

echo.
echo === Changes to be pushed ===
git status --short
echo.

git diff --quiet && git diff --cached --quiet
if %errorlevel%==0 (
  echo Nothing has changed. Nothing to push.
  echo.
  pause
  exit /b 0
)

set /p MSG="Describe the change (or press Enter for a default): "
if "%MSG%"=="" set MSG=Update site content

git add -A
git commit -m "%MSG%"
if errorlevel 1 (
  echo.
  echo Commit failed. Nothing was pushed.
  pause
  exit /b 1
)

git push
if errorlevel 1 (
  echo.
  echo PUSH FAILED. The commit is saved locally but is not live.
  echo Most likely cause: GitHub needs you to sign in again.
  pause
  exit /b 1
)

echo.
echo Pushed. Cloudflare is building - live in about a minute.
echo Check: https://kurtjones.co.uk/
echo.
pause
