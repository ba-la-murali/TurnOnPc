@echo off
:loop
echo Putting the PC to sleep...
rundll32.exe powrprof.dll,SetSuspendState 0,1,0

echo Waiting for 10 seconds...
timeout /t 10 >nul

:: Define the GitHub raw URL
set "url=https://raw.githubusercontent.com/username/repository/branch/filename.txt"

:: Fetch the content from the URL
for /f "delims=" %%a in ('curl -s %url%') do set "rawgithublink=%%a"

:: Check if the content is 'True'
if /i "%rawgithublink%"=="True" (
    echo Waking up the PC from sleep mode...
    :: Prevent hibernation
    powercfg /hibernate off
    :: Wake the PC
    powercfg /lastwake

    :: Simulate mouse movement to wake the screen
    powershell -Command "$mouse_event = Add-Type -MemberDefinition @'
    [DllImport(\"user32.dll\")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
    '@ -Name 'MouseEvents' -Namespace 'User32' -PassThru; 
    $mouse_event::mouse_event(0x0001, 0, 1, 0, 0); 
    $mouse_event::mouse_event(0x0001, 0, -1, 0, 0);"
    
    echo PC is awake with the screen on.
) else (
    echo rawgithublink is not True, staying in sleep mode.
)

:: Sleep for 5 minutes before checking again
timeout /t 300 >nul
goto loop
