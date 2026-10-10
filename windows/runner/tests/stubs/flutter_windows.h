#pragma once

#include <windows.h>

// The standalone runner test does not create a Flutter engine. This is the
// only Flutter API Win32Window uses; all window operations use real Win32.
unsigned int FlutterDesktopGetDpiForMonitor(HMONITOR monitor);
