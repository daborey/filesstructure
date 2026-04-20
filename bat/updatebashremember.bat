@echo off
setlocal

echo ===============================
echo Git Bash Auto History Setup
echo ===============================

REM Always use correct user folder (self-locating safe path)
set "BASHRC=%USERPROFILE%\.bashrc"

REM Create .bashrc if not exists
if not exist "%BASHRC%" (
    echo Creating .bashrc file...
    type nul > "%BASHRC%"
)

REM Check if already installed
findstr /C:"PROMPT_COMMAND=\"history -a; history -n\"" "%BASHRC%" >nul
if %errorlevel%==0 (
    echo Already configured. No changes made.
    pause
    exit /b
)

REM Add auto history config
echo.>>"%BASHRC%"
echo # ===== Auto History Save =====>>"%BASHRC%"
echo export HISTFILE=~/.bash_history>>"%BASHRC%"
echo export HISTSIZE=10000>>"%BASHRC%"
echo export HISTFILESIZE=20000>>"%BASHRC%"
echo shopt -s histappend>>"%BASHRC%"
echo PROMPT_COMMAND="history -a; history -n">>"%BASHRC%"

echo.
echo DONE!
echo Restart Git Bash to apply changes.
pause