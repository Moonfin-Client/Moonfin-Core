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

// Posted after a nested WM_SIZE. WM_APP + 1 is native_game's.
constexpr UINT kResyncViewMessage = WM_APP + 2;

// Heartbeat that keeps the HDR companion windows in position - see the
// WM_TIMER note in RouteMessage. The id is 'HD', chosen not to collide with
// timers plugins set against the same window.
constexpr UINT_PTR kHdrSyncTimerId = 0x4844;
constexpr UINT kHdrSyncIntervalMs = 500;

struct HdrDisplayState {
  bool supported = false;
  bool enabled = false;
};

// Deliberately not guarded with `#if defined(DISPLAYCONFIG_DEVICE_INFO_...)`:
// those names are enumerators, not macros, so such a guard always fails and
// silently selects a stub. The legacy APIs have been in the SDK since Windows
// 10 1703, under this project's floor; the 24H2 ones need SDK 10.0.26100 to
// build and are only called on a build that has them.

// Windows 11 24H2, the first build with the HDR-specific display requests.
constexpr DWORD kFirstBuildWithHdrRequests = 26100;

// Whether the HDR-specific requests exist, decided by build: a 24H2 switch
// failing for a real reason must not fall back to the legacy request, which
// there can switch WCG instead of HDR. RtlGetVersion, because GetVersionEx
// reports what the manifest allows.
bool HasHdrDisplayRequests() {
  static const bool has_requests = [] {
    using RtlGetVersionFn = LONG(WINAPI*)(PRTL_OSVERSIONINFOW);
    HMODULE ntdll = GetModuleHandleW(L"ntdll.dll");
    if (ntdll == nullptr) {
      return false;
    }
    auto rtl_get_version = reinterpret_cast<RtlGetVersionFn>(
        GetProcAddress(ntdll, "RtlGetVersion"));
    if (rtl_get_version == nullptr) {
      return false;
    }
    RTL_OSVERSIONINFOW version = {};
    version.dwOSVersionInfoSize = sizeof(version);
    if (rtl_get_version(&version) != 0) {
      return false;
    }
    return version.dwMajorVersion > 10 ||
           (version.dwMajorVersion == 10 &&
            version.dwBuildNumber >= kFirstBuildWithHdrRequests);
  }();
  return has_requests;
}

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

  // Windows 11 24H2 reports advanced color as enabled for an SDR display
  // running Auto Color Management or wide color gamut, so the legacy query
  // alone would call that display HDR. The v2 query names the active mode.
  if (HasHdrDisplayRequests()) {
    DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO_2 info2 = {};
    info2.header.type = DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO_2;
    info2.header.size = sizeof(info2);
    info2.header.adapterId = target_info.adapterId;
    info2.header.id = target_info.id;
    if (DisplayConfigGetDeviceInfo(&info2.header) == ERROR_SUCCESS) {
      state->supported = info2.highDynamicRangeSupported != 0;
      state->enabled =
          info2.activeColorMode == DISPLAYCONFIG_ADVANCED_COLOR_MODE_HDR;
      return true;
    }
    // Falls back to the legacy query, made safe by its WCG check.
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
  // Wide color gamut enforced means an SDR display under Auto Color
  // Management, not HDR. Builds before 24H2 have such displays too.
  state->enabled =
      info.advancedColorEnabled != 0 && info.wideColorEnforced == 0;
  return true;
}

// Empty when the display could not be read, which Dart reports as unknown
// rather than SDR.
std::optional<HdrDisplayState> QueryHdrStateForWindow(HWND hwnd) {
  std::wstring device_name;
  if (!GetMonitorDeviceNameFromWindow(hwnd, &device_name)) {
    return std::nullopt;
  }

  DISPLAYCONFIG_PATH_TARGET_INFO target_info = {};
  if (!ResolveTargetForDeviceName(device_name, &target_info)) {
    return std::nullopt;
  }

  HdrDisplayState state;
  if (!QueryHdrStateForTarget(target_info, &state)) {
    return std::nullopt;
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

  // On 24H2 advanced color also covers wide color gamut, so switching it can
  // leave an SDR display in WCG rather than HDR. A refusal of the
  // HDR-specific request is reported as one, not retried the legacy way.
  if (HasHdrDisplayRequests()) {
    DISPLAYCONFIG_SET_HDR_STATE hdr_request = {};
    hdr_request.header.type = DISPLAYCONFIG_DEVICE_INFO_SET_HDR_STATE;
    hdr_request.header.size = sizeof(hdr_request);
    hdr_request.header.adapterId = target_info.adapterId;
    hdr_request.header.id = target_info.id;
    hdr_request.enableHdr = enabled ? 1 : 0;
    return DisplayConfigSetDeviceInfo(&hdr_request.header) == ERROR_SUCCESS;
  }

  DISPLAYCONFIG_SET_ADVANCED_COLOR_STATE request = {};
  request.header.type = DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE;
  request.header.size = sizeof(request);
  request.header.adapterId = target_info.adapterId;
  request.header.id = target_info.id;
  request.enableAdvancedColor = enabled ? 1 : 0;

  return DisplayConfigSetDeviceInfo(&request.header) == ERROR_SUCCESS;
}

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
      native_game_registrar_->texture_registrar(),
      native_game_registrar_.get());

  hdr_video_registrar_ = std::make_unique<flutter::PluginRegistrarWindows>(
      flutter_controller_->engine()->GetRegistrarForPlugin("HdrVideo"));
  hdr_video_ = std::make_unique<HdrVideoWindow>(
      flutter_controller_->engine()->messenger(), hdr_video_registrar_.get(),
      GetHandle(), [this]() { UpdateHdrSyncTimer(); });

  hdr_overlay_ = std::make_unique<HdrOverlayWindow>(
      flutter_controller_->engine()->messenger(), GetHandle(),
      [this]() { UpdateHdrSyncTimer(); });

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
          if (!state) {
            result->Success();
            return;
          }
          flutter::EncodableMap payload;
          payload[flutter::EncodableValue("supported")] =
              flutter::EncodableValue(state->supported);
          payload[flutter::EncodableValue("enabled")] =
              flutter::EncodableValue(state->enabled);
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

void FlutterWindow::UpdateHdrSyncTimer() {
  const bool needed =
      (hdr_video_ != nullptr && hdr_video_->NeedsPositionSync()) ||
      (hdr_overlay_ != nullptr && hdr_overlay_->NeedsPositionSync());
  if (needed == hdr_sync_timer_running_) {
    return;
  }
  if (needed) {
    // Half-second heartbeat for the HDR windows' position sync - see the
    // WM_TIMER note in MessageHandler.
    SetTimer(GetHandle(), kHdrSyncTimerId, kHdrSyncIntervalMs, nullptr);
  } else {
    KillTimer(GetHandle(), kHdrSyncTimerId);
  }
  hdr_sync_timer_running_ = needed;
}

void FlutterWindow::OnDestroy() {
  KillTimer(GetHandle(), kHdrSyncTimerId);
  hdr_sync_timer_running_ = false;
  hdr_overlay_ = nullptr;
  hdr_video_ = nullptr;

  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}

void FlutterWindow::SizeChildToClientArea() {
  if (IsIconic(GetHandle())) {
    return;
  }
  const RECT frame = GetClientArea();
  SizeChildContent(frame.right, frame.bottom);
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  if (message == kResyncViewMessage) {
    SizeChildToClientArea();
    return 0;
  }
  if (message != WM_SIZE) {
    return RouteMessage(hwnd, message, wparam, lparam);
  }

  // The engine pumps its task queue while answering a child resize, so a task
  // that resizes the window re-enters here. A nested resize leaves the engine
  // with a stale target (white, half-size or corner-drawn UI), so the child
  // is sized once, after both have unwound.
  ++size_depth_;
  LRESULT result = 0;
  if (size_depth_ == 1) {
    result = RouteMessage(hwnd, message, wparam, lparam);
  } else {
    nested_size_ = true;
    if (flutter_controller_) {
      result = flutter_controller_
                   ->HandleTopLevelWindowProc(hwnd, message, wparam, lparam)
                   .value_or(0);
    }
  }
  if (--size_depth_ == 0 && nested_size_) {
    nested_size_ = false;
    PostMessage(hwnd, kResyncViewMessage, 0, 0);
  }
  return result;
}

LRESULT
FlutterWindow::RouteMessage(HWND hwnd, UINT const message,
                            WPARAM const wparam,
                            LPARAM const lparam) noexcept {
  // Ahead of the plugin dispatch, deliberately: the registered-delegate chain
  // stops at the first plugin that claims a message, and window_manager
  // registers before these windows exist, so a delegate never sees
  // WM_WINDOWPOSCHANGED. The timer is the fallback for a lost message;
  // wparam-checked because plugins may set their own timers on this window.
  if (message == WM_WINDOWPOSCHANGED ||
      (message == WM_TIMER && wparam == kHdrSyncTimerId)) {
    if (hdr_overlay_) {
      hdr_overlay_->SyncPosition();
    }
    if (hdr_video_) {
      hdr_video_->SyncPosition();
    }
  }

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
