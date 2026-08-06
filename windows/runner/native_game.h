#ifndef RUNNER_NATIVE_GAME_H_
#define RUNNER_NATIVE_GAME_H_

#include <flutter/binary_messenger.h>
#include <flutter/encodable_value.h>
#include <flutter/event_channel.h>
#include <flutter/event_sink.h>
#include <flutter/method_channel.h>
#include <flutter/texture_registrar.h>

#include <atomic>
#include <memory>

#include "libretro_host.h"

// Native retro-game playback on Windows. Drives the shared libretro host,
// renders into a Flutter pixel-buffer texture, plays audio through miniaudio,
// and takes a RetroPad mask from Dart.
class NativeGame {
 public:
  NativeGame(flutter::BinaryMessenger* messenger,
             flutter::TextureRegistrar* textures);
  ~NativeGame();

 private:
  void HandleMethod(const flutter::MethodCall<flutter::EncodableValue>& call,
                    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
  flutter::EncodableValue Load(const flutter::EncodableMap& args);
  flutter::EncodableValue Options(bool current_only);
  void Stop();
  const FlutterDesktopPixelBuffer* CopyPixelBuffer(size_t width, size_t height);

  static void OnFrameReady(void* user);
  static uint16_t OnPollInput(void* user, int port);
  static int OnControllerCount(void* user);
  static void OnCoreMessage(void* user, const char* text);
  static void OnCoreShutdown(void* user);

  flutter::TextureRegistrar* textures_;
  std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> control_;
  std::unique_ptr<flutter::EventChannel<flutter::EncodableValue>> events_;

  lh_host* host_ = nullptr;
  int64_t texture_id_ = -1;
  std::unique_ptr<flutter::TextureVariant> texture_;
  FlutterDesktopPixelBuffer pixel_buffer_ = {};
  std::atomic<uint16_t> mask_{0};
};

#endif  // RUNNER_NATIVE_GAME_H_
