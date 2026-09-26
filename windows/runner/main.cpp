#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include <string>

#include "app_links/app_links_plugin_c_api.h"
#include "flutter_window.h"
#include "utils.h"

namespace {

// Registers the moonfin:// scheme for the current user, pointing at this
// executable. Written on every launch so a moved or updated install keeps
// working. HKCU needs no elevation and no installer step.
void RegisterMoonfinScheme() {
  wchar_t exe_path[MAX_PATH];
  if (::GetModuleFileName(nullptr, exe_path, MAX_PATH) == 0) {
    return;
  }
  std::wstring command = L"\"" + std::wstring(exe_path) + L"\" \"%1\"";

  HKEY scheme_key;
  if (::RegCreateKeyEx(HKEY_CURRENT_USER, L"Software\\Classes\\moonfin", 0,
                       nullptr, 0, KEY_WRITE, nullptr, &scheme_key,
                       nullptr) != ERROR_SUCCESS) {
    return;
  }
  const wchar_t description[] = L"URL:Moonfin";
  ::RegSetValueEx(scheme_key, nullptr, 0, REG_SZ,
                  reinterpret_cast<const BYTE *>(description),
                  sizeof(description));
  const wchar_t empty[] = L"";
  ::RegSetValueEx(scheme_key, L"URL Protocol", 0, REG_SZ,
                  reinterpret_cast<const BYTE *>(empty), sizeof(empty));

  HKEY command_key;
  if (::RegCreateKeyEx(scheme_key, L"shell\\open\\command", 0, nullptr, 0,
                       KEY_WRITE, nullptr, &command_key,
                       nullptr) == ERROR_SUCCESS) {
    ::RegSetValueEx(
        command_key, nullptr, 0, REG_SZ,
        reinterpret_cast<const BYTE *>(command.c_str()),
        static_cast<DWORD>((command.size() + 1) * sizeof(wchar_t)));
    ::RegCloseKey(command_key);
  }
  ::RegCloseKey(scheme_key);
}

}  // namespace

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // A moonfin:// launch while the app is already open hands the link to the
  // running instance and exits instead of opening a second window.
  if (SendAppLinkToInstance()) {
    return EXIT_SUCCESS;
  }
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  RegisterMoonfinScheme();

  flutter::DartProject project(L"data");
  project.set_impeller_switch(flutter::ImpellerSwitch::Disabled);

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"Moonfin", origin, size)) {
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
