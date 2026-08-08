#include "native_game.h"

#include <atomic>
#include <chrono>
#include <mutex>
#include <thread>
#include <vector>

#include "lh_audio.h"
#include "libretro_host.h"

namespace {

// libretro allows one session per process, so the state is global.
lh_host* g_host = nullptr;
FlTextureRegistrar* g_textures = nullptr;
FlTexture* g_texture = nullptr;
FlEventChannel* g_events = nullptr;
std::atomic<uint16_t> g_mask{0};
std::atomic<uint16_t> g_pulse{0};

// Guards g_host against the race between moonfin_game_texture_copy_pixels
// (called by Flutter on its render thread) and Teardown() destroying the
// host (called on the main loop thread from HandleMethod). Unregistering the
// texture is not a barrier against a copy_pixels call already in flight, so
// the pointer itself has to be protected, not just the texture registration
// - otherwise the render thread can read g_host and call into lh_get_frame
// after Teardown() has freed it. Held only across the pointer check plus
// lh_get_frame's front/back pointer swap (not the pixel copy Flutter
// performs afterwards with the returned buffer), and across lh_destroy in
// Teardown(), so it adds negligible per-frame contention.
std::mutex g_host_mutex;

// Pushes the combined Dart + pulse mask into the host's input latch. Called
// on every write to either half, not once per frame: the host OR-latches
// whatever it's told between polls, so it needs every edge, not a level
// sampled only when the core happens to poll (see lh_set_input's comment).
void PushInput() {
  if (g_host) {
    lh_set_input(g_host, 0, static_cast<uint16_t>(g_mask.load() | g_pulse.load()));
  }
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

// Heap-allocated so it survives the hop from the emulation thread to the
// main-loop idle callback below.
struct FatalErrorPayload {
  gchar* message;
};

// Runs on the main loop thread. g_events is only ever written on this
// thread, so reading it here (unlike from OnFatalError) needs no lock.
gboolean DeliverFatalError(gpointer data) {
  auto* payload = static_cast<FatalErrorPayload*>(data);
  if (g_events) {
    g_autoptr(FlValue) event = fl_value_new_map();
    fl_value_set_string_take(event, "event", fl_value_new_string("error"));
    fl_value_set_string_take(event, "message",
                             fl_value_new_string(payload->message));
    g_autoptr(GError) error = nullptr;
    fl_event_channel_send(g_events, event, nullptr, &error);
  }
  g_free(payload->message);
  delete payload;
  return G_SOURCE_REMOVE;
}

// The emulation thread is dying from an unrecoverable error (e.g. a failed
// core restart). Called from the run-loop thread. The Flutter/GLib embedder
// requires event-channel access on the main loop thread, so the send is
// marshaled via g_idle_add instead of happening here.
void OnFatalError(void* user, const char* message) {
  (void)user;
  auto* payload = new FatalErrorPayload{g_strdup(message ? message : "")};
  g_idle_add(DeliverFatalError, payload);
}

// Nothing listens on the desktop event channel, so a core that complains or
// quits says so in the log instead.
void OnCoreMessage(void* user, const char* text) {
  (void)user;
  g_warning("libretro core: %s", text);
}

void OnCoreShutdown(void* user) {
  (void)user;
  g_warning("libretro core asked to quit, emulation stopped");
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
  // Runs on Flutter's render thread. Pairs with the lock in Teardown():
  // guarantees g_host is either the live pointer Teardown() hasn't started
  // tearing down yet, or nullptr after Teardown() has fully destroyed it -
  // never a pointer lh_destroy is mid-free on. lh_get_frame only swaps the
  // front/back frame pointers under its own internal lock, so holding
  // g_host_mutex across the call does not serialize the actual per-frame
  // pixel copy, which Flutter performs after this function returns.
  //
  // KNOWN REMAINING HOLE: the buffer handed back below points directly at
  // host-owned memory (lh_get_frame returns h->front.data), and Flutter reads
  // it after this function returns, i.e. after the lock is released. A
  // Teardown() landing in that window frees the framebuffer while the render
  // thread is still reading it. Narrower than the dangling-g_host race this
  // lock fixes, but the same class. Closing it needs a staging copy taken
  // under the lock.
  std::lock_guard<std::mutex> lock(g_host_mutex);
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
  {
    // Pairs with the lock in moonfin_game_texture_copy_pixels: while this
    // block runs, the render thread either already finished reading g_host
    // before we got here, or blocks on g_host_mutex until we're done and
    // then observes g_host == nullptr - it can never see a pointer
    // lh_destroy is mid-free on. lh_stop joins the host's own worker thread,
    // not the render or main loop thread, so holding the lock across it
    // cannot deadlock.
    std::lock_guard<std::mutex> lock(g_host_mutex);
    if (g_host) {
      lh_stop(g_host);
      lh_destroy(g_host);
      g_host = nullptr;
    }
  }
  if (g_textures && g_texture) {
    fl_texture_registrar_unregister_texture(g_textures, g_texture);
    g_clear_object(&g_texture);
  }
  g_mask = 0;
  g_pulse = 0;
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
  cb.controller_count = OnControllerCount;
  cb.fatal_error = OnFatalError;
  cb.message = OnCoreMessage;
  cb.core_shutdown = OnCoreShutdown;

  g_host = lh_create(LH_FORMAT_RGBA8888, cb);
  if (!g_host) {
    // calloc failure inside lh_create; nothing to load into.
    return fl_value_new_null();
  }
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
    // A restart on the emulation thread can shrink the list between the count
    // and this read, so a failure means "no more options", not "skip this one".
    // opt is a self-contained copy; nothing below borrows from the host.
    if (lh_get_option(g_host, i, &opt) != 0) break;
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
    if (g_host && lh_restart_async(g_host) == 0) {
      response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
    } else {
      response = FL_METHOD_RESPONSE(fl_method_error_response_new(
          "restart_unavailable", "The emulator is not running.", nullptr));
    }
  } else if (g_strcmp0(method, "stop") == 0) {
    Teardown();
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "setFastForward") == 0) {
    if (g_host) lh_set_fast_forward(g_host, LookupInt(args, "factor", 1));
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "setInput") == 0) {
    g_mask = static_cast<uint16_t>(LookupInt(args, "mask", 0));
    PushInput();
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else if (g_strcmp0(method, "pulseButton") == 0) {
    int index = LookupInt(args, "index", -1);
    int duration = LookupInt(args, "durationMs", 150);
    if (index >= 0 && index < 16) {
      uint16_t bit = static_cast<uint16_t>(1 << index);
      g_pulse |= bit;
      PushInput();
      std::thread([bit, duration]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(duration));
        g_pulse &= static_cast<uint16_t>(~bit);
        PushInput();
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
  g_events = events;
}
