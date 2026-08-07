// Portable libretro host. One instance runs a single core (libretro's C
// callbacks carry no user data, so only one session exists per process). The
// host owns the run loop, pixel conversion, an audio ring, save states, core
// options, and SRAM. The platform supplies a texture sink, an input source, and
// an audio device through the callbacks below, so Android and every desktop
// share this code.

#ifndef LIBRETRO_HOST_H
#define LIBRETRO_HOST_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct lh_host lh_host;

// The 32-bit layout the host writes converted frames in. Pick whichever the
// platform texture expects: Flutter desktop pixel buffers want RGBA, a macOS
// CVPixelBuffer wants BGRA.
typedef enum {
  LH_FORMAT_RGBA8888 = 0,
  LH_FORMAT_BGRA8888 = 1,
} lh_output_format;

typedef struct {
  int width;
  int height;
  double aspect;
  double fps;
  double sample_rate;
} lh_av_info;

typedef struct {
  void *user;
  // A new converted frame is ready. The platform pulls it with lh_get_frame.
  // Called from the run-loop thread.
  void (*frame_ready)(void *user);
  // The RetroPad button bitmask (RETRO_DEVICE_ID_JOYPAD_* bits) for a port.
  // Called from the run-loop thread on every input poll.
  uint16_t (*poll_input)(void *user, int port);
  // Number of connected controllers, for the player-count event.
  int (*controller_count)(void *user);
  // The core changed its output geometry or aspect ratio.
  void (*geometry_changed)(void *user, int width, int height, double aspect);
  // A message the core wants shown, such as a missing-system-files warning.
  // Arrives on the run-loop thread, or on the caller's thread during lh_load.
  // Optional, may be NULL.
  void (*message)(void *user, const char *text);
  // The core asked to quit, which cores do when a boot or a reset fails. The
  // loop has stopped and the core is already unloaded, so the platform should
  // end the session and tell the user. Called once, from the run-loop thread as
  // it exits, so post the teardown elsewhere rather than calling lh_stop or
  // lh_destroy from here. Optional, may be NULL.
  void (*core_shutdown)(void *user);
} lh_callbacks;

// One core option and its choices.
typedef struct {
  const char *id;
  const char *label;
  const char *current;
  const char *const *choices;
  int choice_count;
} lh_option;

// Creates a host that writes frames in [fmt] and reports back through [cb].
lh_host *lh_create(lh_output_format fmt, lh_callbacks cb);

// Loads [core_path] and [rom_path]. [system_dir] and [save_dir] back the core's
// directory requests. [game_id] names the SRAM file. [opt_keys]/[opt_vals] seed
// core options (may be NULL when [opt_count] is 0). Fills [out_info] and returns
// 0 on success, non-zero on failure.
int lh_load(lh_host *host, const char *core_path, const char *rom_path,
            const char *system_dir, const char *save_dir, const char *game_id,
            const char *const *opt_keys, const char *const *opt_vals,
            int opt_count, lh_av_info *out_info);

// Runs, pauses, or tears down the emulation. lh_stop flushes SRAM and unloads
// the core, so the host can then be destroyed or loaded again.
void lh_start(lh_host *host);
void lh_pause(lh_host *host);
void lh_resume(lh_host *host);
void lh_reset(lh_host *host);
void lh_set_fast_forward(lh_host *host, int factor);
void lh_stop(lh_host *host);
void lh_destroy(lh_host *host);

// Copies the latest frame under the host's lock. Returns 1 and fills the out
// params when a frame exists, 0 otherwise. The pointer stays valid until the
// next lh_get_frame call.
int lh_get_frame(lh_host *host, const void **data, int *width, int *height,
                 int *stride);

// Pulls up to [frame_count] interleaved stereo S16 frames into [dst], returning
// the count written. Silence fills any shortfall. The platform audio device
// calls this, and the ring fill also paces the run loop.
int lh_read_audio(lh_host *host, int16_t *dst, int frame_count);

// Switches the run loop from wall-clock timing to audio-buffer pacing. The
// platform sets this once its audio device is pulling, so audio is the clock.
void lh_set_audio_paced(lh_host *host, int paced);

// Save states. lh_serialize_size is an upper bound for the buffer. lh_serialize
// and lh_unserialize return 0 on success. They run between frames on the run
// loop, so they never race retro_run.
size_t lh_serialize_size(lh_host *host);
int lh_serialize(lh_host *host, void *dst, size_t size);
int lh_unserialize(lh_host *host, const void *src, size_t size);

// Core options. lh_option_count and lh_get_option read the definitions the core
// published, and lh_set_option changes a value. Strings stay valid until the next
// options call or lh_stop.
int lh_option_count(lh_host *host);
int lh_get_option(lh_host *host, int index, lh_option *out);
void lh_set_option(lh_host *host, const char *id, const char *value);

#ifdef __cplusplus
}
#endif

#endif  // LIBRETRO_HOST_H
