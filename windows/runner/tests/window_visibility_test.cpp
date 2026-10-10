// Exercises the runner against real Win32 parent/child windows. The standalone
// harness supplies only FlutterDesktopGetDpiForMonitor; visibility is not mocked.
#include "../win32_window.h"

#include <cstdio>

unsigned int FlutterDesktopGetDpiForMonitor(HMONITOR) { return 96; }

int main() {
  Win32Window runner;
  if (!runner.Create(L"Moonfin window visibility test", {50000, 50000},
                     {320, 200})) {
    std::fprintf(stderr, "Could not create test runner\n");
    return 1;
  }
  HWND parent = runner.GetHandle();
  HWND child = CreateWindowW(L"STATIC", L"content", WS_CHILD, 0, 0, 320,
                             200, parent, nullptr, GetModuleHandleW(nullptr),
                             nullptr);
  if (child == nullptr) {
    std::fprintf(stderr, "Could not create hidden child\n");
    return 1;
  }

  runner.SetChildContent(child);
  if (IsWindowVisible(parent)) {
    std::fprintf(stderr, "Attaching content exposed the parent too early\n");
    return 1;
  }
  runner.Show();
  if (!IsWindowVisible(parent) || !IsWindowVisible(child)) {
    std::fprintf(stderr, "FAIL: first show left the content hidden\n");
    return 1;
  }

  // A plugin can show the native parent without calling the runner's Show().
  ShowWindow(parent, SW_HIDE);
  ShowWindow(child, SW_HIDE);
  ShowWindow(parent, SW_SHOWNOACTIVATE);
  if (!IsWindowVisible(child)) {
    std::fprintf(stderr, "FAIL: direct parent show left the content hidden\n");
    return 1;
  }

  // Showing an already-visible parent does not emit WM_SHOWWINDOW again.
  ShowWindow(child, SW_HIDE);
  runner.Show();
  if (!IsWindowVisible(child)) {
    std::fprintf(stderr, "FAIL: repeated runner show left the content hidden\n");
    return 1;
  }

  // Content can be attached after the parent has already been presented.
  HWND replacement = CreateWindowW(L"STATIC", L"replacement", WS_CHILD,
                                   0, 0, 320, 200, parent, nullptr,
                                   GetModuleHandleW(nullptr), nullptr);
  runner.SetChildContent(replacement);
  if (!IsWindowVisible(replacement)) {
    std::fprintf(stderr, "FAIL: attaching content to visible runner hid it\n");
    return 1;
  }

  runner.Destroy();
  std::puts("PASS: hidden parent preserved; first show, direct show, repeated "
            "show and late attachment display content");
  return 0;
}
