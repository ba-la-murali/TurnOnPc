@echo off

:: Define the GitHub raw URL
set "url=https://raw.githubusercontent.com/username/repository/branch/filename.txt"

:: Fetch the content from the URL
for /f "delims=" %%a in ('curl -s %url%') do set "rawgithublink=%%a"

:: Check if the content is 'True'
if /i "%rawgithublink%"=="True" (
    :: Wakes up the PC from sleep mode
    powercfg /hibernate off
    powercfg /change standby-timeout-ac 0
    powercfg /change monitor-timeout-ac 0
    powercfg /change standby-timeout-dc 0
    powercfg /change monitor-timeout-dc 0
    powercfg /lastwake

    :: This will not directly wake the monitor, but waking the PC may turn the monitor on automatically
    echo PC should wake up if it's in sleep mode.
) else (
    echo The value is False, no action taken.
)
