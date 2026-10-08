#ifndef RUNNER_HDR_VIDEO_WINDOW_H_
#define RUNNER_HDR_VIDEO_WINDOW_H_

#include <windows.h>

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <functional>
#include <memory>

// The window mpv renders HDR video into, on Windows.
//
// media_kit's texture path allocates B8G8R8A8_UNORM and mpv draws into it
// through the OpenGL render API, so every HDR stream is flattened to 8-bit SDR
// before Flutter composites it. target-colorspace-hint cannot fix that: it tags
// a swapchain, and on the render API mpv owns none. So mpv needs a window of
// its own, which is what this creates - the runner owns lifetime and geometry,
// mpv creates and owns the D3D11 swapchain once it is handed the HWND.
//
// The window comes in two arrangements, chosen by MOONFIN_HDR_DWM - parsed
// once, on the Dart side, and handed over with the `create` call:
//
//  - Default (technique 2; MOONFIN_HDR_DWM=1..4 picks another): a top-level
//    window *behind* the whole runner window, with the runner window given
//    per-pixel DWM transparency (see
//    hdr_window_support::ApplyTransparencyComposition for the techniques).
//    Flutter draws everything - controls, dialogs, OSD - natively over the
//    video, and no capture is needed at all.
//  - MOONFIN_HDR_DWM=0: the fallback - a child HWND *above* the Flutter
//    view. Flutter's UI is then re-composited over the video by
//    hdr_overlay_window, because nothing shows through the Flutter view from
//    below.
class HdrVideoWindow {
 public:
  // |top_level| is passed explicitly: these windows are constructed during
  // FlutterWindow::OnCreate, before SetChildContent parents the Flutter view
  // into the runner, so at that point GetAncestor(view, GA_ROOT) is the view
  // itself and anything derived from the registrar lands on the wrong window.
  // |on_window_changed| fires whenever the native window appears or goes
  // away, so the runner only pays for its position heartbeat while there is
  // something to keep in position.
  HdrVideoWindow(flutter::BinaryMessenger* messenger,
                 flutter::PluginRegistrarWindows* registrar, HWND top_level,
                 std::function<void()> on_window_changed);
  ~HdrVideoWindow();

  HdrVideoWindow(const HdrVideoWindow&) = delete;
  HdrVideoWindow& operator=(const HdrVideoWindow&) = delete;

  // Re-fits a behind-the-window video window to the runner's client area and
  // keeps it directly below in the z-order. Called from the runner's
  // WM_WINDOWPOSCHANGED, so it follows moves, resizes and z-order changes.
  // No-op in the child arrangement, where the window follows for free.
  void SyncPosition();

  bool NeedsPositionSync() const { return window_ != nullptr; }

 private:
  void HandleMethod(
      const flutter::MethodCall<flutter::EncodableValue>& call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

  int64_t Create();
  void SetGeometry(int x, int y, int width, int height);
  void SetVisible(bool visible);
  void Destroy();

  // Places the behind-mode window at its screen rect, directly below the
  // runner window. |show| also makes it visible without activating it.
  void PlaceBehind(bool show);

  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> channel_;
  std::function<void()> on_window_changed_;

  HWND top_level_ = nullptr;
  HWND flutter_view_ = nullptr;
  HWND window_ = nullptr;

  // Client-area rect of the video, as Dart reports it.
  RECT geometry_ = {};

  // Set while the window is parked off-screen (SetVisible(false)), so the
  // heartbeat's PlaceBehind does not drag it back over the runner during
  // teardown.
  bool parked_ = false;

  // Whether the runner has been made see-through for this window. Deferred
  // from Create to the first SetVisible(true), the screen's claim.
  bool composed_ = false;

  // The monitor the runner was on at the last placement. In `wid` mode mpv
  // negotiates the swapchain colorspace once, at creation, and never
  // re-checks; on a crossing Dart is notified and cycles the renderer.
  HMONITOR last_monitor_ = nullptr;

  // 1..4 = top-level behind, with the matching transparency technique applied
  // to the runner window (2 is the default). 0 = child above. Arrives with
  // the `create` call.
  int dwm_mode_ = 0;

  bool behind() const { return dwm_mode_ != 0; }
};

#endif  // RUNNER_HDR_VIDEO_WINDOW_H_
