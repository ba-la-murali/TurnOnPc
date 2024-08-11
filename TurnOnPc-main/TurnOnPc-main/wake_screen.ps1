Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class MouseJiggle {
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
    private const int MOUSEEVENTF_MOVE = 0x0001;
    public static void Jiggle() {
        mouse_event(MOUSEEVENTF_MOVE, 0, 1, 0, 0);
        mouse_event(MOUSEEVENTF_MOVE, 0, -1, 0, 0);
    }
}
"@
[MouseJiggle]::Jiggle()
