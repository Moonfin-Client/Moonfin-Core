#include "flutter_window.h"

#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

#include <cwchar>
#include <optional>
#include <vector>

#include "flutter/generated_plugin_registrant.h"

namespace {

std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>>
    g_hdr_display_channel;

struct HdrDisplayState {
  bool supported = false;
  bool enabled = false;
};

#if defined(DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO) && \
    defined(DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE)

bool GetMonitorDeviceNameFromWindow(HWND hwnd, std::wstring* device_name) {
  if (device_name == nullptr) {
    return false;
  }

  HMONITOR monitor = MonitorFromWindow(hwnd, MONITOR_DEFAULTTONEAREST);
  if (monitor == nullptr) {
    return false;
  }

  MONITORINFOEXW info = {};
  info.cbSize = sizeof(info);
  if (!GetMonitorInfoW(monitor, &info)) {
    return false;
  }

  *device_name = info.szDevice;
  return true;
}

bool ResolveTargetForDeviceName(
    const std::wstring& device_name,
    DISPLAYCONFIG_PATH_TARGET_INFO* target_info) {
  if (target_info == nullptr) {
    return false;
  }

  UINT32 path_count = 0;
  UINT32 mode_count = 0;
  if (GetDisplayConfigBufferSizes(QDC_ONLY_ACTIVE_PATHS, &path_count,
                                  &mode_count) != ERROR_SUCCESS) {
    return false;
  }

  std::vector<DISPLAYCONFIG_PATH_INFO> paths(path_count);
  std::vector<DISPLAYCONFIG_MODE_INFO> modes(mode_count);
  if (QueryDisplayConfig(QDC_ONLY_ACTIVE_PATHS, &path_count, paths.data(),
                         &mode_count, modes.data(), nullptr) != ERROR_SUCCESS) {
    return false;
  }

  paths.resize(path_count);
  for (const auto& path : paths) {
    DISPLAYCONFIG_SOURCE_DEVICE_NAME source_name = {};
    source_name.header.type = DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME;
    source_name.header.size = sizeof(source_name);
    source_name.header.adapterId = path.sourceInfo.adapterId;
    source_name.header.id = path.sourceInfo.id;

    if (DisplayConfigGetDeviceInfo(&source_name.header) != ERROR_SUCCESS) {
      continue;
    }

    if (_wcsicmp(source_name.viewGdiDeviceName, device_name.c_str()) == 0) {
      *target_info = path.targetInfo;
      return true;
    }
  }

  return false;
}

bool QueryHdrStateForTarget(const DISPLAYCONFIG_PATH_TARGET_INFO& target_info,
                            HdrDisplayState* state) {
  if (state == nullptr) {
    return false;
  }

  DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO info = {};
  info.header.type = DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO;
  info.header.size = sizeof(info);
  info.header.adapterId = target_info.adapterId;
  info.header.id = target_info.id;
  if (DisplayConfigGetDeviceInfo(&info.header) != ERROR_SUCCESS) {
    return false;
  }

  state->supported = info.advancedColorSupported != 0;
  state->enabled = info.advancedColorEnabled != 0;
  return true;
}

HdrDisplayState QueryHdrStateForWindow(HWND hwnd) {
  HdrDisplayState state;

  std::wstring device_name;
  if (!GetMonitorDeviceNameFromWindow(hwnd, &device_name)) {
    return state;
  }

  DISPLAYCONFIG_PATH_TARGET_INFO target_info = {};
  if (!ResolveTargetForDeviceName(device_name, &target_info)) {
    return state;
  }

  if (!QueryHdrStateForTarget(target_info, &state)) {
    return {};
  }

  return state;
}

bool SetHdrStateForWindow(HWND hwnd, bool enabled) {
  std::wstring device_name;
  if (!GetMonitorDeviceNameFromWindow(hwnd, &device_name)) {
    return false;
  }

  DISPLAYCONFIG_PATH_TARGET_INFO target_info = {};
  if (!ResolveTargetForDeviceName(device_name, &target_info)) {
    return false;
  }

  DISPLAYCONFIG_SET_ADVANCED_COLOR_STATE request = {};
  request.header.type = DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE;
  request.header.size = sizeof(request);
  request.header.adapterId = target_info.adapterId;
  request.header.id = target_info.id;
  request.enableAdvancedColor = enabled ? 1 : 0;

  return DisplayConfigSetDeviceInfo(&request.header) == ERROR_SUCCESS;
}

#else

HdrDisplayState QueryHdrStateForWindow(HWND hwnd) {
  (void)hwnd;
  return {};
}

bool SetHdrStateForWindow(HWND hwnd, bool enabled) {
  (void)hwnd;
  (void)enabled;
  return false;
}

#endif

}  // namespace

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());

  native_game_registrar_ = std::make_unique<flutter::PluginRegistrarWindows>(
      flutter_controller_->engine()->GetRegistrarForPlugin("NativeGame"));

  native_game_ = std::make_unique<NativeGame>(
      flutter_controller_->engine()->messenger(),
      native_game_registrar_->texture_registrar());

  if (!g_hdr_display_channel) {
    g_hdr_display_channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            flutter_controller_->engine()->messenger(), "moonfin/hdr_display",
            &flutter::StandardMethodCodec::GetInstance());
  }

  g_hdr_display_channel->SetMethodCallHandler(
      [this](const flutter::MethodCall<flutter::EncodableValue>& method_call,
             std::unique_ptr<
                 flutter::MethodResult<flutter::EncodableValue>> result) {
        const auto& method = method_call.method_name();

        if (method == "getHdrState") {
          const auto state = QueryHdrStateForWindow(GetHandle());
          flutter::EncodableMap payload;
          payload[flutter::EncodableValue("supported")] =
              flutter::EncodableValue(state.supported);
          payload[flutter::EncodableValue("enabled")] =
              flutter::EncodableValue(state.enabled);
          result->Success(flutter::EncodableValue(payload));
          return;
        }

        if (method == "setHdrEnabled") {
          bool enabled = false;
          if (const auto* bool_arg =
                  std::get_if<bool>(method_call.arguments())) {
            enabled = *bool_arg;
          } else if (const auto* args =
                         std::get_if<flutter::EncodableMap>(
                             method_call.arguments())) {
            const auto it = args->find(flutter::EncodableValue("enabled"));
            if (it != args->end()) {
              if (const auto* value = std::get_if<bool>(&it->second)) {
                enabled = *value;
              }
            }
          }

          const bool ok = SetHdrStateForWindow(GetHandle(), enabled);
          result->Success(flutter::EncodableValue(ok));
          return;
        }

        result->NotImplemented();
      });

  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  flutter_controller_->engine()->SetNextFrameCallback([&]() {
    this->Show();
  });

  // Flutter can complete the first frame before the "show window" callback is
  // registered. The following call ensures a frame is pending to ensure the
  // window is shown. It is a no-op if the first frame hasn't completed yet.
  flutter_controller_->ForceRedraw();

  return true;
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
