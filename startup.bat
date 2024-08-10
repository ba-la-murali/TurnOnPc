@echo off
REM Set the raw GitHub link
set GITHUB_LINK=https://raw.githubusercontent.com/ba-la-murali/TurnOnPc/main/status.txt

REM Use PowerShell to fetch the content of the link
for /f "delims=" %%i in ('powershell -Command "Invoke-RestMethod -Uri %GITHUB_LINK%"') do set RESPONSE=%%i

REM Check if the response is 'True'
if "%RESPONSE%"=="True" (
    REM Wake up the display
    powershell -ExecutionPolicy Bypass -File "C:\Users\Admin\Downloads\CARBAT.ps1" 

    REM Optional: Wait for the system to fully wake up
    timeout /t 5

    REM Open Google Chrome
    start chrome.exe
) else (
    REM If 'False', do nothing
    echo PC will remain in sleep mode.
)

REM End of script
