#include "hdr_video_window.h"

#include <flutter/standard_method_codec.h>

#include <string>

#include "hdr_window_support.h"
#include "method_call_args.h"

namespace {

constexpr const wchar_t kWindowClassName[] = L"MOONFIN_HDR_VIDEO";

// Where a hidden video window is parked instead of SW_HIDE. Hiding a window
// with a live D3D11 swapchain stalls mpv's presentation queue, and mpv paces
// audio against video, so the whole file goes silent - parking off-screen
// clips the window away while presentation carries on.
constexpr int kParkedOrigin = -32000;

}  // namespace

HdrVideoWindow::HdrVideoWindow(flutter::BinaryMessenger* messenger,
                               flutter::PluginRegistrarWindows* registrar,
                               HWND top_level,
                               std::function<void()> on_window_changed)
    : on_window_changed_(std::move(on_window_changed)),
      top_level_(top_level) {
  if (registrar != nullptr && registrar->GetView() != nullptr) {
    flutter_view_ = registrar->GetView()->GetNativeWindow();
  }

  // Position sync is driven from the head of FlutterWindow::MessageHandler
  // plus its heartbeat timer - not from a registered window-proc delegate,
  // whose chain stops at the first plugin that claims a message.

  channel_ = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      messenger, "moonfin/hdr_video",
      &flutter::StandardMethodCodec::GetInstance());
  channel_->SetMethodCallHandler([this](const auto& call, auto result) {
    HandleMethod(call, std::move(result));
  });
}

HdrVideoWindow::~HdrVideoWindow() { Destroy(); }

void HdrVideoWindow::HandleMethod(
    const flutter::MethodCall<flutter::EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  const auto* args = std::get_if<flutter::EncodableMap>(call.arguments());
  const flutter::EncodableMap empty;
  const flutter::EncodableMap& map = args != nullptr ? *args : empty;
  const std::string& method = call.method_name();

  if (method == "create") {
    // The arrangement rides on the call, so MOONFIN_HDR_DWM has exactly one
    // parser - hdr_composition_io.dart, on the Dart side.
    const int mode = method_call_args::GetInt(map, "dwmMode", 0);
    dwm_mode_ = (mode >= 1 && mode <= 4) ? mode : 0;
    // Once per HDR engagement, not per launch, and deliberately in both
    // arrangements: this is the line that catches a session that silently
    // fell back to the capture arrangement in the field.
    hdr_window_support::Log(L"create: dwm_mode=%d", dwm_mode_);
    const int64_t handle = Create();
    if (handle == 0) {
      result->Error("create_failed", "could not create the video window");
      return;
    }
    if (on_window_changed_) on_window_changed_();
    result->Success(flutter::EncodableValue(handle));
    return;
  }

  if (method == "setGeometry") {
    SetGeometry(method_call_args::GetInt(map, "x", 0),
                method_call_args::GetInt(map, "y", 0),
                method_call_args::GetInt(map, "width", 0),
                method_call_args::GetInt(map, "height", 0));
    result->Success();
    return;
  }

  if (method == "setVisible") {
    SetVisible(method_call_args::GetBool(map, "visible", false));
    result->Success();
    return;
  }

  if (method == "destroy") {
    Destroy();
    result->Success();
    return;
  }

  result->NotImplemented();
}

int64_t HdrVideoWindow::Create() {
  if (window_ != nullptr) {
    return reinterpret_cast<int64_t>(window_);
  }
  if (top_level_ == nullptr) {
    return 0;
  }
  if (!hdr_window_support::EnsureWindowClass(
          kWindowClassName, hdr_window_support::ClickThroughWndProc,
          static_cast<HBRUSH>(GetStockObject(BLACK_BRUSH)))) {
    return 0;
  }

  // Dart has not laid anything out when this runs, so fall back to the whole
  // client area. A zero-area window handed to mpv as `wid` fails
  // CreateSwapChainForHwnd and marks the session failed before the first
  // frame.
  if (geometry_.right <= geometry_.left || geometry_.bottom <= geometry_.top) {
    GetClientRect(top_level_, &geometry_);
  }

  if (behind()) {
    // A top-level window directly behind the runner window, which is given
    // per-pixel DWM transparency so the Flutter frame composites over the
    // video with real alpha. WS_EX_NOACTIVATE keeps focus on the runner,
    // WS_EX_TOOLWINDOW keeps it out of the taskbar and alt-tab.
    const RECT screen =
        hdr_window_support::ClientRectInScreenSpace(top_level_);
    // WS_CLIPCHILDREN keeps the class's black erase away from mpv's child,
    // so the black shows only in genuine gaps and playback never flickers.
    window_ = CreateWindowEx(
        WS_EX_NOACTIVATE | WS_EX_TOOLWINDOW, kWindowClassName, L"",
        WS_POPUP | WS_CLIPCHILDREN, screen.left, screen.top,
        screen.right - screen.left, screen.bottom - screen.top, nullptr,
        nullptr, GetModuleHandle(nullptr), nullptr);
    if (window_ == nullptr) {
      hdr_window_support::Log(L"behind Create failed: %lu", GetLastError());
      return 0;
    }
    // Shown immediately, black, covering the client area - but the runner
    // stays opaque until Dart claims the window (SetVisible). Dart engages
    // before the player screen mounts, so the page still on screen would
    // otherwise go see-through over the video behind it. Shown rather than
    // hidden or parked: hiding stalls mpv (see kParkedOrigin), and parking
    // would negotiate the swapchain against whichever monitor is nearest
    // the parked spot. The opaque runner covers it entirely meanwhile.
    PlaceBehind(true);
    hdr_window_support::Log(
        L"behind Create: hwnd=%p at (%ld,%ld)-(%ld,%ld), composition deferred",
        window_, screen.left, screen.top, screen.right, screen.bottom);
    return reinterpret_cast<int64_t>(window_);
  }

  // Without WS_CLIPSIBLINGS on the Flutter view, its swapchain present paints
  // over any overlapping sibling and nothing ever repaints the sibling. Set
  // before the window exists.
  if (flutter_view_ != nullptr) {
    const LONG_PTR view_style = GetWindowLongPtr(flutter_view_, GWL_STYLE);
    if ((view_style & WS_CLIPSIBLINGS) == 0) {
      SetWindowLongPtr(flutter_view_, GWL_STYLE, view_style | WS_CLIPSIBLINGS);
      SetWindowPos(flutter_view_, nullptr, 0, 0, 0, 0,
                   SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE |
                       SWP_FRAMECHANGED);
    }
  }

  // WS_EX_TRANSPARENT and the shared window proc's HTTRANSPARENT keep this
  // window out of hit-testing, so clicks fall through to the Flutter view
  // underneath where the player's widgets are still laid out. That is what
  // lets input, focus and keyboard keep working untouched. WS_CLIPCHILDREN
  // keeps the class's black erase away from mpv's child during playback.
  window_ = CreateWindowEx(
      WS_EX_TRANSPARENT | WS_EX_NOPARENTNOTIFY, kWindowClassName, L"",
      WS_CHILD | WS_CLIPSIBLINGS | WS_CLIPCHILDREN, geometry_.left,
      geometry_.top, geometry_.right - geometry_.left,
      geometry_.bottom - geometry_.top, top_level_, nullptr,
      GetModuleHandle(nullptr), nullptr);
  if (window_ == nullptr) {
    return 0;
  }

  // Above the Flutter view; the chrome is mirrored over the video by
  // hdr_overlay_window.
  SetWindowPos(window_, HWND_TOP, 0, 0, 0, 0,
               SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE);
  return reinterpret_cast<int64_t>(window_);
}

void HdrVideoWindow::SetGeometry(int x, int y, int width, int height) {
  geometry_ = RECT{x, y, x + width, y + height};
  if (window_ == nullptr || width <= 0 || height <= 0) {
    return;
  }
  if (behind()) {
    // A parked window keeps the new rect for when it is shown again, but
    // must not be dragged back on screen by a geometry update - the same
    // guard SyncPosition applies.
    if (!parked_) {
      PlaceBehind(false);
    }
    return;
  }
  SetWindowPos(window_, HWND_TOP, x, y, width, height, SWP_NOACTIVATE);
}

void HdrVideoWindow::SetVisible(bool visible) {
  if (window_ == nullptr) {
    return;
  }

  parked_ = !visible;
  if (visible) {
    if (behind()) {
      // The first claim is when the runner goes see-through - see Create.
      // Kept for the rest of the window's life, as before; Destroy reverts.
      if (!composed_) {
        composed_ = true;
        const bool composed = hdr_window_support::ApplyTransparencyComposition(
            top_level_, dwm_mode_);
        hdr_window_support::Log(L"behind claimed: composition(%d)=%d",
                                dwm_mode_, composed);
      }
      // No separate ShowWindow: showing a popup hoists it over the runner and
      // only PlaceBehind's insert-after puts it back, so the one call that
      // does both atomically is the one to use.
      PlaceBehind(true);
    } else {
      ShowWindow(window_, SW_SHOWNOACTIVATE);
      SetWindowPos(window_, HWND_TOP, geometry_.left, geometry_.top,
                   geometry_.right - geometry_.left,
                   geometry_.bottom - geometry_.top, SWP_NOACTIVATE);
    }
    return;
  }

  // Parked off-screen rather than hidden - see kParkedOrigin.
  SetWindowPos(window_, nullptr, kParkedOrigin, kParkedOrigin,
               geometry_.right - geometry_.left,
               geometry_.bottom - geometry_.top,
               SWP_NOZORDER | SWP_NOACTIVATE);
}

void HdrVideoWindow::PlaceBehind(bool show) {
  if (window_ == nullptr || top_level_ == nullptr) {
    return;
  }
  // Minimised: the client rect is meaningless, so park until restore.
  if (IsIconic(top_level_)) {
    SetWindowPos(window_, nullptr, kParkedOrigin, kParkedOrigin, 0, 0,
                 SWP_NOSIZE | SWP_NOZORDER | SWP_NOACTIVATE);
    return;
  }

  // The video rect Dart reports is in client coordinates; a top-level window
  // is positioned in screen space, and inserted directly below the runner so
  // nothing can slot between them.
  RECT client = geometry_;
  POINT origin = {client.left, client.top};
  ClientToScreen(top_level_, &origin);
  const int width = client.right - client.left;
  const int height = client.bottom - client.top;
  UINT flags = SWP_NOACTIVATE;
  if (show) {
    flags |= SWP_SHOWWINDOW;
  }

  SetLastError(0);
  const BOOL ok = SetWindowPos(window_, top_level_, origin.x, origin.y, width,
                               height, flags);
  if (ok == FALSE) {
    // This runs on the half-second heartbeat, so only failures are worth a
    // line - a healthy session would otherwise write to disk twice a second.
    hdr_window_support::Log(L"PlaceBehind failed: err=%lu", GetLastError());
  }
}

void HdrVideoWindow::SyncPosition() {
  if (window_ == nullptr || top_level_ == nullptr) {
    return;
  }

  // Monitor-crossing detection is ahead of the arrangement gate: `wid`-mode
  // mpv negotiates the swapchain colorspace once, at creation, in both
  // arrangements. A resize does not renegotiate (ResizeBuffers keeps the
  // colorspace), so Dart recreates the renderer.
  const HMONITOR monitor =
      MonitorFromWindow(top_level_, MONITOR_DEFAULTTONEAREST);
  if (last_monitor_ != nullptr && monitor != last_monitor_ &&
      channel_ != nullptr) {
    channel_->InvokeMethod("monitorChanged", nullptr);
    if (behind()) {
      hdr_window_support::Log(L"monitor crossed - asked Dart to renegotiate");
    }
  }
  last_monitor_ = monitor;

  if (behind() && !parked_) {
    PlaceBehind(false);
  }
}

void HdrVideoWindow::Destroy() {
  if (window_ == nullptr) return;
  if (behind() && composed_) {
    hdr_window_support::RevertTransparencyComposition(top_level_);
  }
  composed_ = false;
  DestroyWindow(window_);
  window_ = nullptr;
  if (on_window_changed_) on_window_changed_();
}
