Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class SleepMode {
    [DllImport("powrprof.dll", SetLastError=true)]
    public static extern bool SetSuspendState(bool hibernate, bool forceCritical, bool disableWakeEvent);
}
"@

# Put the system into sleep mode (not hibernate)
[SleepMode]::SetSuspendState($false, $true, $true)
