@echo off
:loop
echo Sleeping for 5 minutes...
timeout /t 15 >nul
echo Putting the PC to sleep...
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
timeout /t 5 >nul
echo Simulating mouse movement...
powershell -ExecutionPolicy Bypass -File "C:\Users\sijig\Downloads\TurnOnPc-main\TurnOnPc-main\wake_screen.ps1"
echo PC is awake with the screen on.
goto loop
