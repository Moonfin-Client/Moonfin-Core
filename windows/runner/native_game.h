#ifndef RUNNER_NATIVE_GAME_H_
#define RUNNER_NATIVE_GAME_H_

#include <windows.h>

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/event_channel.h>
#include <flutter/event_sink.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/texture_registrar.h>

#include <memory>
#include <mutex>
#include <optional>
#include <string>

#include "libretro_host.h"

// Native retro-game playback on Windows. Drives the shared libretro host,
// renders into a Flutter pixel-buffer texture, plays audio through miniaudio,
// and takes a RetroPad mask from Dart.
class NativeGame {
 public:
  // |registrar| is used to (a) find the top-level window's HWND, so a fatal
  // error raised from the emulation thread can be posted to it, and (b)
  // register a WindowProc delegate that flushes the error when that message
  // arrives on the platform thread. May be null in tests; fatal errors then
  // fall back to the next inbound control-channel call, as before.
  NativeGame(flutter::BinaryMessenger* messenger,
             flutter::TextureRegistrar* textures,
             flutter::PluginRegistrarWindows* registrar);
  ~NativeGame();

 private:
  void HandleMethod(const flutter::MethodCall<flutter::EncodableValue>& call,
                    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
  flutter::EncodableValue Load(const flutter::EncodableMap& args);
  flutter::EncodableValue Options(bool current_only);
  void Stop();
  const FlutterDesktopPixelBuffer* CopyPixelBuffer(size_t width, size_t height);
  // Delivers a fatal-error event queued by OnFatalError, if any. Must only be
  // called from the platform thread.
  void FlushPendingError();

  static void OnFrameReady(void* user);
  static int OnControllerCount(void* user);
  static void OnFatalError(void* user, const char* message);
  static void OnCoreMessage(void* user, const char* text);
  static void OnCoreShutdown(void* user);

  flutter::TextureRegistrar* textures_;
  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> control_;
  std::unique_ptr<flutter::EventChannel<flutter::EncodableValue>> events_;

  // Guards event_sink_ and pending_error_. event_sink_ is written from the
  // platform thread (listen/cancel) and, without this lock, would be read
  // from the emulation thread by OnFatalError; the Flutter Windows embedder
  // also requires event-sink sends to happen on the platform thread. So
  // OnFatalError (emulation thread) never touches event_sink_ directly: it
  // only records pending_error_, which FlushPendingError (platform thread,
  // called from HandleMethod) drains and sends.
  std::mutex event_mutex_;
  // Captured on listen so FlushPendingError can push an unsolicited event;
  // the overlay's own input/geometry are still driven from Dart, so this is
  // the only producer today.
  std::unique_ptr<flutter::EventSink<flutter::EncodableValue>> event_sink_;
  // Set by OnFatalError, drained by FlushPendingError. Delivery is deferred
  // to the next control-channel call because that is the next guaranteed
  // platform-thread entry point.
  std::optional<std::string> pending_error_;

  // Top-level window HWND, used to post kFatalErrorMessage from the
  // emulation thread; null if no registrar was supplied.
  HWND hwnd_ = nullptr;

  // Guards host_ against the race between CopyPixelBuffer (called by Flutter
  // on the raster thread) and Stop() tearing the host down (called on the
  // platform thread from HandleMethod or the destructor). Unregistering the
  // texture is not a barrier against a CopyPixelBuffer call already in
  // flight, so the pointer itself has to be protected, not just the texture
  // registration - otherwise the raster thread can read host_ and call into
  // lh_get_frame after Stop() has freed it. Held only across the pointer
  // check plus lh_get_frame's front/back pointer swap (not the pixel copy
  // Flutter performs afterwards with the returned buffer), and across
  // lh_destroy in Stop(), so it adds negligible per-frame contention.
  std::mutex host_mutex_;

  lh_host* host_ = nullptr;
  int64_t texture_id_ = -1;
  std::unique_ptr<flutter::TextureVariant> texture_;
  FlutterDesktopPixelBuffer pixel_buffer_ = {};
};

#endif  // RUNNER_NATIVE_GAME_H_
