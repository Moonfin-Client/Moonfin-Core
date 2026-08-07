#include "native_game.h"

#include <flutter/event_stream_handler_functions.h>
#include <flutter/standard_method_codec.h>

#include <chrono>
#include <cstdio>
#include <string>
#include <thread>
#include <vector>

#include "lh_audio.h"

namespace {

std::string GetString(const flutter::EncodableMap& map, const char* key) {
  auto it = map.find(flutter::EncodableValue(std::string(key)));
  if (it != map.end()) {
    if (auto* value = std::get_if<std::string>(&it->second)) return *value;
  }
  return std::string();
}

int GetInt(const flutter::EncodableMap& map, const char* key, int fallback) {
  auto it = map.find(flutter::EncodableValue(std::string(key)));
  if (it != map.end()) {
    if (auto* value = std::get_if<int>(&it->second)) return *value;
  }
  return fallback;
}

// A pulse bit is held briefly so the overlay can send Start or Select.
std::atomic<uint16_t> g_pulse_mask{0};

}  // namespace

NativeGame::NativeGame(flutter::BinaryMessenger* messenger,
                       flutter::TextureRegistrar* textures)
    : textures_(textures) {
  control_ = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      messenger, "moonfin/native_game_control",
      &flutter::StandardMethodCodec::GetInstance());
  events_ = std::make_unique<flutter::EventChannel<flutter::EncodableValue>>(
      messenger, "moonfin/native_game_events",
      &flutter::StandardMethodCodec::GetInstance());
  control_->SetMethodCallHandler(
      [this](const auto& call, auto result) {
        HandleMethod(call, std::move(result));
      });
  // Input and the overlay are driven from Dart on desktop, so the event stream
  // stays open but never fires.
  events_->SetStreamHandler(
      std::make_unique<flutter::StreamHandlerFunctions<flutter::EncodableValue>>(
          [](const flutter::EncodableValue*,
             std::unique_ptr<flutter::EventSink<flutter::EncodableValue>>&&)
              -> std::unique_ptr<flutter::StreamHandlerError<flutter::EncodableValue>> {
            return nullptr;
          },
          [](const flutter::EncodableValue*)
              -> std::unique_ptr<flutter::StreamHandlerError<flutter::EncodableValue>> {
            return nullptr;
          }));
}

NativeGame::~NativeGame() { Stop(); }

void NativeGame::HandleMethod(
    const flutter::MethodCall<flutter::EncodableValue>& call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  const auto* args = std::get_if<flutter::EncodableMap>(call.arguments());
  const flutter::EncodableMap empty;
  const flutter::EncodableMap& map = args ? *args : empty;
  const std::string& method = call.method_name();

  if (method == "load") {
    result->Success(Load(map));
  } else if (method == "start") {
    if (host_) lh_start(host_);
    result->Success();
  } else if (method == "pause") {
    if (host_) lh_pause(host_);
    result->Success();
  } else if (method == "resume") {
    if (host_) lh_resume(host_);
    result->Success();
  } else if (method == "restart") {
    if (host_) lh_reset(host_);
    result->Success();
  } else if (method == "stop") {
    Stop();
    result->Success();
  } else if (method == "setFastForward") {
    if (host_) lh_set_fast_forward(host_, GetInt(map, "factor", 1));
    result->Success();
  } else if (method == "setInput") {
    mask_ = static_cast<uint16_t>(GetInt(map, "mask", 0));
    result->Success();
  } else if (method == "pulseButton") {
    int index = GetInt(map, "index", -1);
    int duration = GetInt(map, "durationMs", 150);
    if (index >= 0 && index < 16) {
      uint16_t bit = static_cast<uint16_t>(1 << index);
      g_pulse_mask |= bit;
      std::thread([bit, duration]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(duration));
        g_pulse_mask &= static_cast<uint16_t>(~bit);
      }).detach();
    }
    result->Success();
  } else if (method == "saveState") {
    if (!host_) {
      result->Error("no_session");
      return;
    }
    size_t size = lh_serialize_size(host_);
    std::vector<uint8_t> buffer(size);
    if (size > 0 && lh_serialize(host_, buffer.data(), size) == 0) {
      result->Success(flutter::EncodableValue(buffer));
    } else {
      result->Error("serialize_failed");
    }
  } else if (method == "loadState") {
    auto it = map.find(flutter::EncodableValue(std::string("data")));
    const auto* data =
        it != map.end() ? std::get_if<std::vector<uint8_t>>(&it->second) : nullptr;
    bool ok = host_ && data &&
              lh_unserialize(host_, data->data(), data->size()) == 0;
    result->Success(flutter::EncodableValue(ok));
  } else if (method == "getOptions" || method == "getCurrentOptions") {
    result->Success(Options(method == "getCurrentOptions"));
  } else if (method == "setOption") {
    if (host_) lh_set_option(host_, GetString(map, "id").c_str(),
                             GetString(map, "value").c_str());
    result->Success();
  } else if (method == "controllerCount") {
    result->Success(flutter::EncodableValue(1));
  } else {
    result->NotImplemented();
  }
}

flutter::EncodableValue NativeGame::Load(const flutter::EncodableMap& args) {
  Stop();

  std::string core_path = GetString(args, "corePath");
  std::string rom_path = GetString(args, "romPath");
  std::string system_dir = GetString(args, "systemDir");
  std::string save_dir = GetString(args, "saveDir");
  std::string game_id = GetString(args, "gameId");

  std::vector<std::string> keys;
  std::vector<std::string> values;
  auto opt_it = args.find(flutter::EncodableValue(std::string("options")));
  if (opt_it != args.end()) {
    if (const auto* opts = std::get_if<flutter::EncodableMap>(&opt_it->second)) {
      for (const auto& entry : *opts) {
        keys.push_back(std::get<std::string>(entry.first));
        values.push_back(std::get<std::string>(entry.second));
      }
    }
  }
  std::vector<const char*> key_ptrs;
  std::vector<const char*> value_ptrs;
  for (size_t i = 0; i < keys.size(); i++) {
    key_ptrs.push_back(keys[i].c_str());
    value_ptrs.push_back(values[i].c_str());
  }

  lh_callbacks cb = {};
  cb.user = this;
  cb.frame_ready = &NativeGame::OnFrameReady;
  cb.poll_input = &NativeGame::OnPollInput;
  cb.controller_count = &NativeGame::OnControllerCount;
  cb.message = &NativeGame::OnCoreMessage;
  cb.core_shutdown = &NativeGame::OnCoreShutdown;

  host_ = lh_create(LH_FORMAT_RGBA8888, cb);
  lh_av_info info = {};
  int rc = lh_load(host_, core_path.c_str(), rom_path.c_str(),
                   system_dir.c_str(), save_dir.c_str(), game_id.c_str(),
                   key_ptrs.data(), value_ptrs.data(),
                   static_cast<int>(key_ptrs.size()), &info);
  if (rc != 0) {
    Stop();
    return flutter::EncodableValue();
  }

  texture_ = std::make_unique<flutter::TextureVariant>(flutter::PixelBufferTexture(
      [this](size_t width, size_t height) { return CopyPixelBuffer(width, height); }));
  texture_id_ = textures_->RegisterTexture(texture_.get());
  lh_audio_start(host_, info.sample_rate);

  return flutter::EncodableValue(flutter::EncodableMap{
      {flutter::EncodableValue("textureId"), flutter::EncodableValue(texture_id_)},
      {flutter::EncodableValue("width"), flutter::EncodableValue(info.width)},
      {flutter::EncodableValue("height"), flutter::EncodableValue(info.height)},
      {flutter::EncodableValue("aspect"), flutter::EncodableValue(info.aspect)},
      {flutter::EncodableValue("fps"), flutter::EncodableValue(info.fps)},
      {flutter::EncodableValue("sampleRate"), flutter::EncodableValue(info.sample_rate)},
  });
}

flutter::EncodableValue NativeGame::Options(bool current_only) {
  flutter::EncodableList options;
  flutter::EncodableMap current;
  if (host_) {
    int count = lh_option_count(host_);
    for (int i = 0; i < count; i++) {
      lh_option opt;
      if (lh_get_option(host_, i, &opt) != 0) continue;
      if (current_only) {
        current[flutter::EncodableValue(std::string(opt.id))] =
            flutter::EncodableValue(std::string(opt.current));
        continue;
      }
      flutter::EncodableList choices;
      for (int c = 0; c < opt.choice_count; c++) {
        std::string value(opt.choices[c]);
        choices.push_back(flutter::EncodableValue(flutter::EncodableMap{
            {flutter::EncodableValue("value"), flutter::EncodableValue(value)},
            {flutter::EncodableValue("label"), flutter::EncodableValue(value)},
        }));
      }
      options.push_back(flutter::EncodableValue(flutter::EncodableMap{
          {flutter::EncodableValue("id"), flutter::EncodableValue(std::string(opt.id))},
          {flutter::EncodableValue("label"), flutter::EncodableValue(std::string(opt.label))},
          {flutter::EncodableValue("current"), flutter::EncodableValue(std::string(opt.current))},
          {flutter::EncodableValue("choices"), flutter::EncodableValue(choices)},
      }));
    }
  }
  return current_only ? flutter::EncodableValue(current)
                      : flutter::EncodableValue(options);
}

void NativeGame::Stop() {
  lh_audio_stop();
  if (host_) {
    lh_stop(host_);
    lh_destroy(host_);
    host_ = nullptr;
  }
  if (texture_id_ != -1) {
    textures_->UnregisterTexture(texture_id_, nullptr);
    texture_id_ = -1;
    texture_.reset();
  }
  mask_ = 0;
}

const FlutterDesktopPixelBuffer* NativeGame::CopyPixelBuffer(size_t width,
                                                             size_t height) {
  (void)width;
  (void)height;
  const void* data;
  int w, h, stride;
  if (!host_ || !lh_get_frame(host_, &data, &w, &h, &stride)) return nullptr;
  pixel_buffer_.buffer = static_cast<const uint8_t*>(data);
  pixel_buffer_.width = static_cast<size_t>(w);
  pixel_buffer_.height = static_cast<size_t>(h);
  return &pixel_buffer_;
}

void NativeGame::OnFrameReady(void* user) {
  auto* self = static_cast<NativeGame*>(user);
  if (self->texture_id_ != -1) {
    self->textures_->MarkTextureFrameAvailable(self->texture_id_);
  }
}

uint16_t NativeGame::OnPollInput(void* user, int port) {
  if (port != 0) return 0;
  auto* self = static_cast<NativeGame*>(user);
  return static_cast<uint16_t>(self->mask_.load() | g_pulse_mask.load());
}

int NativeGame::OnControllerCount(void* user) {
  (void)user;
  return 1;
}

// Nothing listens on the desktop event channel, so a core that complains or
// quits says so in the log instead.
void NativeGame::OnCoreMessage(void* user, const char* text) {
  (void)user;
  std::fprintf(stderr, "libretro core: %s\n", text);
}

void NativeGame::OnCoreShutdown(void* user) {
  (void)user;
  std::fprintf(stderr, "libretro core asked to quit, emulation stopped\n");
}
