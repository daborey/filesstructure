@echo off
echo Setting up PowerShell persistent history...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }; ^
Add-Content $PROFILE 'Set-PSReadLineOption -HistorySaveStyle SaveIncrementally'; ^
Add-Content $PROFILE 'Set-PSReadLineOption -HistorySavePath \"$env:USERPROFILE\ps_history.txt\"'"

echo.
echo Done!
echo Restart PowerShell to apply changes.
pause