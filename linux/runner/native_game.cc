#include "native_game.h"

#include <atomic>
#include <chrono>
#include <thread>
#include <vector>

#include "lh_audio.h"
#include "libretro_host.h"

namespace {

// libretro allows one session per process, so the state is global.
lh_host* g_host = nullptr;
FlTextureRegistrar* g_textures = nullptr;
FlTexture* g_texture = nullptr;
std::atomic<uint16_t> g_mask{0};
std::atomic<uint16_t> g_pulse{0};

uint16_t OnPollInput(void* user, int port) {
  (void)user;
  if (port != 0) return 0;
  return static_cast<uint16_t>(g_mask.load() | g_pulse.load());
}

int OnControllerCount(void* user) {
  (void)user;
  return 1;
}

void OnFrameReady(void* user) {
  (void)user;
  if (g_textures && g_texture) {
    fl_texture_registrar_mark_texture_frame_available(g_textures, g_texture);
  }
}

}  // namespace

// A pixel-buffer texture that hands Flutter the host's latest frame.
G_DECLARE_FINAL_TYPE(MoonfinGameTexture, moonfin_game_texture, MOONFIN,
                     GAME_TEXTURE, FlPixelBufferTexture)

struct _MoonfinGameTexture {
  FlPixelBufferTexture parent_instance;
};

G_DEFINE_TYPE(MoonfinGameTexture, moonfin_game_texture,
              fl_pixel_buffer_texture_get_type())

static gboolean moonfin_game_texture_copy_pixels(
    FlPixelBufferTexture* texture, const uint8_t** out_buffer, uint32_t* width,
    uint32_t* height, GError** error) {
  (void)texture;
  (void)error;
  const void* data;
  int w, h, stride;
  if (!g_host || !lh_get_frame(g_host, &data, &w, &h, &stride)) return FALSE;
  *out_buffer = static_cast<const uint8_t*>(data);
  *width = static_cast<uint32_t>(w);
  *height = static_cast<uint32_t>(h);
  return TRUE;
}

static void moonfin_game_texture_class_init(MoonfinGameTextureClass* klass) {
  FL_PIXEL_BUFFER_TEXTURE_CLASS(klass)->copy_pixels =
      moonfin_game_texture_copy_pixels;
}

static void moonfin_game_texture_init(MoonfinGameTexture* self) { (void)self; }

namespace {

const gchar* LookupString(FlValue* args, const char* key) {
  FlValue* value = fl_value_lookup_string(args, key);
  return value && fl_value_get_type(value) == FL_VALUE_TYPE_STRING
             ? fl_value_get_string(value)
             : "";
}

int LookupInt(FlValue* args, const char* key, int fallback) {
  FlValue* value = fl_value_lookup_string(args, key);
  return value && fl_value_get_type(value) == FL_VALUE_TYPE_INT
             ? static_cast<int>(fl_value_get_int(value))
             : fallback;
}

void Teardown() {
  lh_audio_stop();
  if (g_host) {
    lh_stop(g_host);
    lh_destroy(g_host);
    g_host = nullptr;
  }
  if (g_textures && g_texture) {
    fl_texture_registrar_unregister_texture(g_textures, g_texture);
    g_clear_object(&g_texture);
  }
  g_mask = 0;
}

FlValue* Load(FlValue* args) {
  Teardown();

  const gchar* core_path = LookupString(args, "corePath");
  const gchar* rom_path = LookupString(args, "romPath");
  const gchar* system_dir = LookupString(args, "systemDir");
  const gchar* save_dir = LookupString(args, "saveDir");
  const gchar* game_id = LookupString(args, "gameId");

  std::vector<const char*> keys;
  std::vector<const char*> values;
  FlValue* options = fl_value_lookup_string(args, "options");
  if (options && fl_value_get_type(options) == FL_VALUE_TYPE_MAP) {
    for (size_t i = 0; i < fl_value_get_length(options); i++) {
      keys.push_back(fl_value_get_string(fl_value_get_map_key(options, i)));
      values.push_back(fl_value_get_string(fl_value_get_map_value(options, i)));
    }
  }

  lh_callbacks cb = {};
  cb.frame_ready = OnFrameReady;
  cb.poll_input = OnPollInput;
  cb.controller_count = OnControllerCount;

  g_host = lh_create(LH_FORMAT_RGBA8888, cb);
  lh_av_info info = {};
  int rc = lh_load(g_host, core_path, rom_path, system_dir, save_dir, game_id,
                   keys.data(), values.data(), static_cast<int>(keys.size()),
                   &info);
  if (rc != 0) {
    Teardown();
    return fl_value_new_null();
  }

  g_texture = FL_TEXTURE(g_object_new(moonfin_game_texture_get_type(), nullptr));
  fl_texture_registrar_register_texture(g_textures, g_texture);
  lh_audio_start(g_host, info.sample_rate);

  FlValue* result = fl_value_new_map();
  fl_value_set_string_take(result, "textureId",
                           fl_value_new_int(fl_texture_get_id(g_texture)));
  fl_value_set_string_take(result, "width", fl_value_new_int(info.width));
  fl_value_set_string_take(result, "height", fl_value_new_int(info.height));
  fl_value_set_string_take(result, "aspect", fl_value_new_float(info.aspect));
  fl_value_set_string_take(result, "fps", fl_value_new_float(info.fps));
  fl_value_set_string_take(result, "sampleRate",
                           fl_value_new_float(info.sample_rate));
  return result;
}

FlValue* Options(bool current_only) {
  FlValue* result =
      current_only ? fl_value_new_map() : fl_value_new_list();
  if (!g_host) return result;
  int count = lh_option_count(g_host);
  for (int i = 0; i < count; i++) {
    lh_option opt;
    if (lh_get_option(g_host, i, &opt) != 0) continue;
    if (current_only) {
      fl_value_set_string_take(result, opt.id, fl_value_new_string(opt.current));
      continue;
    }
    FlValue* choices = fl_value_new_list();
    for (int c = 0; c < opt.choice_count; c++) {
      FlValue* choice = fl_value_new_map();
      fl_value_set_string_take(choice, "value",
                               fl_value_new_string(opt.choices[c]));
      fl_value_set_string_take(choice, "label",
                               fl_value_new_string(opt.choices[c]));
      fl_value_append_take(choices, choice);
    }
    FlValue* entry = fl_value_new_map();
    fl_value_set_string_take(entry, "id", fl_value_new_string(opt.id));
    fl_value_set_string_take(entry, "label", fl_value_new_string(opt.label));
    fl_value_set_string_take(entry, "current", fl_value_new_string(opt.current));
    fl_value_set_string_take(entry, "choices", choices);
    fl_value_append_take(result, entry);
  }
  return result;
}

void HandleMethod(FlMethodChannel* channel, FlMethodCall* call,
                  gpointer user_data) {
  (void)channel;
  (void)user_data;
  const gchar* method = fl_method_call_get_name(call);
  FlValue* args = fl_method_call_get_args(call);
  g_autoptr(FlMethodResponse) response = nullptr;

  if (g_strcmp0(method, "load") == 0) {
    response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(Load(args)));
  } else if (g_strcmp0(method, "start") == 0) {
    if (g_host) lh_start(g_host);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "pause") == 0) {
    if (g_host) lh_pause(g_host);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "resume") == 0) {
    if (g_host) lh_resume(g_host);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "restart") == 0) {
    if (g_host) lh_reset(g_host);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "stop") == 0) {
    Teardown();
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "setFastForward") == 0) {
    if (g_host) lh_set_fast_forward(g_host, LookupInt(args, "factor", 1));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "setInput") == 0) {
    g_mask = static_cast<uint16_t>(LookupInt(args, "mask", 0));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "pulseButton") == 0) {
    int index = LookupInt(args, "index", -1);
    int duration = LookupInt(args, "durationMs", 150);
    if (index >= 0 && index < 16) {
      uint16_t bit = static_cast<uint16_t>(1 << index);
      g_pulse |= bit;
      std::thread([bit, duration]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(duration));
        g_pulse &= static_cast<uint16_t>(~bit);
      }).detach();
    }
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "saveState") == 0) {
    size_t size = g_host ? lh_serialize_size(g_host) : 0;
    if (size > 0) {
      std::vector<uint8_t> buffer(size);
      if (lh_serialize(g_host, buffer.data(), size) == 0) {
        response = FL_METHOD_RESPONSE(fl_method_success_response_new(
            fl_value_new_uint8_list(buffer.data(), size)));
      }
    }
    if (!response) {
      response = FL_METHOD_RESPONSE(
          fl_method_error_response_new("serialize_failed", nullptr, nullptr));
    }
  } else if (g_strcmp0(method, "loadState") == 0) {
    FlValue* data = fl_value_lookup_string(args, "data");
    bool ok = g_host && data &&
              fl_value_get_type(data) == FL_VALUE_TYPE_UINT8_LIST &&
              lh_unserialize(g_host, fl_value_get_uint8_list(data),
                             fl_value_get_length(data)) == 0;
    response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_bool(ok)));
  } else if (g_strcmp0(method, "getOptions") == 0) {
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(Options(false)));
  } else if (g_strcmp0(method, "getCurrentOptions") == 0) {
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(Options(true)));
  } else if (g_strcmp0(method, "setOption") == 0) {
    if (g_host) {
      lh_set_option(g_host, LookupString(args, "id"), LookupString(args, "value"));
    }
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "controllerCount") == 0) {
    response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_int(1)));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  fl_method_call_respond(call, response, nullptr);
}

FlMethodErrorResponse* OnListen(FlEventChannel* channel, FlValue* args,
                                gpointer user_data) {
  (void)channel;
  (void)args;
  (void)user_data;
  return nullptr;
}

FlMethodErrorResponse* OnCancel(FlEventChannel* channel, FlValue* args,
                                gpointer user_data) {
  (void)channel;
  (void)args;
  (void)user_data;
  return nullptr;
}

}  // namespace

void moonfin_game_register(FlEngine* engine) {
  FlBinaryMessenger* messenger = fl_engine_get_binary_messenger(engine);
  g_textures = fl_engine_get_texture_registrar(engine);

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  FlMethodChannel* control = fl_method_channel_new(
      messenger, "moonfin/native_game_control", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(control, HandleMethod, nullptr,
                                            nullptr);

  FlEventChannel* events = fl_event_channel_new(
      messenger, "moonfin/native_game_events", FL_METHOD_CODEC(codec));
  fl_event_channel_set_stream_handlers(events, OnListen, OnCancel, nullptr,
                                       nullptr);
}
