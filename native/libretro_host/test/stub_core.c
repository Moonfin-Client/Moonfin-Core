// A minimal libretro core for exercising the host without a real emulator. Each
// frame it advances a counter, paints a frame whose colours encode the counter
// and the current input, emits audio, and keeps the counter as its save state.

#include <stdint.h>
#include <string.h>

#include "../libretro.h"

#define STUB_WIDTH 64
#define STUB_HEIGHT 48

static retro_environment_t env_cb;
static retro_video_refresh_t video_cb;
static retro_audio_sample_batch_t audio_batch_cb;
static retro_input_poll_t input_poll_cb;
static retro_input_state_t input_state_cb;

static uint32_t framebuffer[STUB_WIDTH * STUB_HEIGHT];
static int32_t frame_counter;
static uint8_t sram[64];

// Set from the ROM contents, to mimic a core whose boot fails a few frames in:
// it asks the frontend to quit and would fault if it were run again.
static int shutdown_frame;
static int did_shutdown;

void retro_set_environment(retro_environment_t cb) { env_cb = cb; }
void retro_set_video_refresh(retro_video_refresh_t cb) { video_cb = cb; }
void retro_set_audio_sample(retro_audio_sample_t cb) { (void)cb; }
void retro_set_audio_sample_batch(retro_audio_sample_batch_t cb) {
  audio_batch_cb = cb;
}
void retro_set_input_poll(retro_input_poll_t cb) { input_poll_cb = cb; }
void retro_set_input_state(retro_input_state_t cb) { input_state_cb = cb; }

// Real cores log from retro_init and call the pointer without checking it, so
// the stub does the same to keep the host honest about GET_LOG_INTERFACE.
void retro_init(void) {
  frame_counter = 0;
  struct retro_log_callback logging;
  memset(&logging, 0, sizeof(logging));
  env_cb(RETRO_ENVIRONMENT_GET_LOG_INTERFACE, &logging);
  logging.log(RETRO_LOG_DEBUG, "stub core init %d\n", 0);
}
void retro_deinit(void) {}
unsigned retro_api_version(void) { return RETRO_API_VERSION; }

void retro_get_system_info(struct retro_system_info *info) {
  memset(info, 0, sizeof(*info));
  info->library_name = "stub";
  info->library_version = "1.0";
  info->valid_extensions = "stub";
  info->need_fullpath = false;
}

void retro_get_system_av_info(struct retro_system_av_info *info) {
  memset(info, 0, sizeof(*info));
  info->geometry.base_width = STUB_WIDTH;
  info->geometry.base_height = STUB_HEIGHT;
  info->geometry.max_width = STUB_WIDTH;
  info->geometry.max_height = STUB_HEIGHT;
  info->geometry.aspect_ratio = (float)STUB_WIDTH / (float)STUB_HEIGHT;
  info->timing.fps = 60.0;
  info->timing.sample_rate = 44100.0;
}

bool retro_load_game(const struct retro_game_info *game) {
  shutdown_frame = 0;
  did_shutdown = 0;
  if (game && game->data && game->size >= 8 &&
      memcmp(game->data, "shutdown", 8) == 0) {
    shutdown_frame = 3;
  }
  enum retro_pixel_format fmt = RETRO_PIXEL_FORMAT_XRGB8888;
  env_cb(RETRO_ENVIRONMENT_SET_PIXEL_FORMAT, &fmt);

  static const struct retro_variable vars[] = {
      {"stub_speed", "Speed; normal|fast"},
      {NULL, NULL},
  };
  env_cb(RETRO_ENVIRONMENT_SET_VARIABLES, (void *)vars);
  return true;
}

void retro_unload_game(void) {}

void retro_run(void) {
  if (did_shutdown) {
    // A real core would fault here. Say so instead, so the harness can tell.
    struct retro_message late = {"stub ran after shutdown", 180};
    env_cb(RETRO_ENVIRONMENT_SET_MESSAGE, &late);
    return;
  }
  if (shutdown_frame > 0 && frame_counter >= shutdown_frame) {
    did_shutdown = 1;
    struct retro_message msg = {"stub boot failed", 180};
    env_cb(RETRO_ENVIRONMENT_SET_MESSAGE, &msg);
    env_cb(RETRO_ENVIRONMENT_SHUTDOWN, NULL);
    return;
  }
  input_poll_cb();
  int16_t mask =
      input_state_cb(0, RETRO_DEVICE_JOYPAD, 0, RETRO_DEVICE_ID_JOYPAD_MASK);
  frame_counter++;

  // Encode the counter and input into the frame so the host's pixel conversion
  // and input plumbing can be checked end to end. XRGB8888: 0x00RRGGBB.
  uint32_t r = (uint32_t)(frame_counter & 0xFF);
  uint32_t g = (uint32_t)(mask & 0xFF);
  uint32_t b = 0x55;
  uint32_t color = (r << 16) | (g << 8) | b;
  for (int i = 0; i < STUB_WIDTH * STUB_HEIGHT; i++) framebuffer[i] = color;
  video_cb(framebuffer, STUB_WIDTH, STUB_HEIGHT, STUB_WIDTH * 4);

  // One frame of a constant tone so the ring has something to read.
  int16_t samples[735 * 2];
  for (int i = 0; i < 735; i++) {
    samples[i * 2] = 1000;
    samples[i * 2 + 1] = -1000;
  }
  audio_batch_cb(samples, 735);
}

void retro_reset(void) { frame_counter = 0; }

size_t retro_serialize_size(void) { return sizeof(frame_counter); }

bool retro_serialize(void *data, size_t size) {
  if (size < sizeof(frame_counter)) return false;
  memcpy(data, &frame_counter, sizeof(frame_counter));
  return true;
}

bool retro_unserialize(const void *data, size_t size) {
  if (size < sizeof(frame_counter)) return false;
  memcpy(&frame_counter, data, sizeof(frame_counter));
  return true;
}

void *retro_get_memory_data(unsigned id) {
  return id == RETRO_MEMORY_SAVE_RAM ? sram : NULL;
}
size_t retro_get_memory_size(unsigned id) {
  return id == RETRO_MEMORY_SAVE_RAM ? sizeof(sram) : 0;
}

// Unused libretro entry points.
void retro_set_controller_port_device(unsigned port, unsigned device) {
  (void)port;
  (void)device;
}
bool retro_load_game_special(unsigned type, const struct retro_game_info *info,
                             size_t num) {
  (void)type;
  (void)info;
  (void)num;
  return false;
}
unsigned retro_get_region(void) { return RETRO_REGION_NTSC; }
void retro_cheat_reset(void) {}
void retro_cheat_set(unsigned index, bool enabled, const char *code) {
  (void)index;
  (void)enabled;
  (void)code;
}
