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

// Result codes for lh_load and lh_probe_options. The VALUES are fixed: platform
// runners map them to channel errors and the self-test asserts them, so name
// them, never renumber them.
//
// Scoped to the load path. Other entry points also return -1 as a plain
// failure without meaning LH_ERR_SESSION_BUSY.
typedef enum {
  LH_OK = 0,
  LH_ERR_SESSION_BUSY = -1,      // a core is already loaded in this process
  LH_ERR_CORE_OPEN = -2,         // the module could not be opened
  LH_ERR_CORE_SYMBOLS = -3,      // required libretro symbols are missing
  LH_ERR_ROM_READ = -4,          // the content file could not be read
  LH_ERR_CONTENT_REJECTED = -5,  // retro_load_game returned false
  LH_ERR_AUDIO_RING = -6,        // the audio ring could not be sized/allocated
  // The same value under its other meaning. The overload predates the names
  // and the value is part of the contract, so both spellings stay.
  LH_ERR_SHUTDOWN_DURING_LOAD = -6,
  LH_ERR_ALLOC = -7,             // a host allocation failed
  LH_ERR_BAD_GAME_ID = -8,       // game_id would escape save_dir
} lh_result;

// Ports the input latch tracks. Matches the largest per-platform mask array
// (Android, macOS/iOS); the desktop runners only ever touch port 0.
#define LH_MAX_PORTS 4

// The 32-bit layout the host writes converted frames in. Pick whichever the
// platform texture expects: Flutter desktop pixel buffers want RGBA, a macOS
// CVPixelBuffer wants BGRA.
typedef enum {
  LH_FORMAT_RGBA8888 = 0,
  LH_FORMAT_BGRA8888 = 1,
} lh_output_format;

typedef struct {
  // Post-rotation display geometry: when the core requested a 90 or 270 degree
  // rotation, width/height are already swapped and aspect already inverted, so
  // these match the frames lh_get_frame hands back.
  int width;
  int height;
  double aspect;
  double fps;
  double sample_rate;
  // 0, 1, 2, 3 = 0, 90, 180, 270 degrees counter-clockwise, per
  // RETRO_ENVIRONMENT_SET_ROTATION. Informational: the host already bakes the
  // rotation into the converted frame, so platforms need not act on it.
  int rotation;
} lh_av_info;

typedef struct {
  void *user;
  // A new converted frame is ready. The platform pulls it with lh_get_frame.
  // Called from the run-loop thread.
  void (*frame_ready)(void *user);
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
  // The emulation thread is terminating because of an unrecoverable error.
  // Distinct from core_shutdown, which is the core asking to quit cleanly.
  // Optional, may be NULL. Called from the run-loop thread.
  void (*fatal_error)(void *user, const char *message);
} lh_callbacks;

// Bounds for the option snapshot below. The host only speaks the legacy
// SET_VARIABLES form ("Label; a|b|c" - GET_CORE_OPTIONS_VERSION is answered
// with 0), where ids, labels, and values are all short, so these caps are
// generous rather than tight. Anything longer is truncated, never overrun.
#define LH_OPTION_ID_MAX 128
#define LH_OPTION_LABEL_MAX 256
#define LH_OPTION_VALUE_MAX 128
#define LH_OPTION_CHOICE_MAX 64

// One controller configuration the core advertised for an emulated input
// port. This is a caller-owned snapshot, just like lh_option: labels supplied
// by RETRO_ENVIRONMENT_SET_CONTROLLER_INFO belong to the core and may be
// replaced immediately after the environment callback returns.
#define LH_CONTROLLER_TYPE_LABEL_MAX 256
typedef struct {
  unsigned id;
  char label[LH_CONTROLLER_TYPE_LABEL_MAX];
} lh_controller_type;

// One RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS entry, copied: like
// lh_controller_type, the core owns the string and may replace it as soon as
// the environment callback returns.
#define LH_INPUT_DESCRIPTOR_LABEL_MAX 256
typedef struct {
  unsigned port;
  unsigned device;
  unsigned index;
  unsigned id;
  char description[LH_INPUT_DESCRIPTOR_LABEL_MAX];
} lh_input_descriptor;

// One core option and its choices, as a caller-owned snapshot.
//
// These used to be borrowed pointers into the host's own allocations, which
// was not safe to hand out: restart_core frees every definition on the
// emulation thread and lh_set_option frees the old value on whichever thread
// changed it, so a caller reading its lh_option afterwards read freed memory.
// lh_get_option now copies everything under the host's option lock, so a
// snapshot stays valid for as long as the caller keeps the struct, whatever
// the other threads do to the host in the meantime.
typedef struct {
  char id[LH_OPTION_ID_MAX];
  char label[LH_OPTION_LABEL_MAX];
  char current[LH_OPTION_VALUE_MAX];
  char choices[LH_OPTION_CHOICE_MAX][LH_OPTION_VALUE_MAX];
  // Choices actually copied, so it never exceeds LH_OPTION_CHOICE_MAX even if
  // the core published more.
  int choice_count;
} lh_option;

// Creates a host that writes frames in [fmt] and reports back through [cb].
lh_host *lh_create(lh_output_format fmt, lh_callbacks cb);

// Reports the RetroPad button mask (RETRO_DEVICE_ID_JOYPAD_* bits) currently
// held on [port]. Call this every time the platform's raw input state
// changes - on a key/button edge, a controller value-changed callback, a
// method-channel message, whatever the platform's transport is - not once
// per frame. The host records press and release transitions between frontend
// frames, so a complete short tap is exposed as DOWN and then UP instead of
// disappearing. Every button read comes from one complete atomic mask.
// A bit held continuously across many frames stays set in every one of them.
// Thread-safe and safe to call before a core is loaded or after lh_stop; the
// write just has nothing to be read by yet. [port] outside
// [0, LH_MAX_PORTS) is ignored.
void lh_set_input(lh_host *host, int port, uint16_t mask);

// Whole-pad state in one call: the digital mask plus the analog axes and
// trigger pressures. One call rather than several keeps the digital and analog
// stores adjacent, so a poll rarely lands between them, and halves the
// per-event platform-boundary crossings.
//
// Axes are -32768..32767; triggers are 0..0x7fff.
void lh_set_pad_state(lh_host *host, int port, uint16_t mask,
                      int16_t lx, int16_t ly, int16_t rx, int16_t ry,
                      uint16_t l2, uint16_t r2);

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
// lh_start returns 0 when the emulation thread is running (including when it
// already was), non-zero when it could not be created.
int lh_start(lh_host *host);
void lh_pause(lh_host *host);
// Resumes asynchronously with respect to input lifecycle state: the native
// emulation loop clears queued/stale digital transitions before its next
// frame, while preserving buttons that remain physically held.
void lh_resume(lh_host *host);
// Fully recreates the core and reloads its current content. Unlike lh_reset,
// this applies options that a core only reads during initialization.
int lh_restart(lh_host *host);
// Schedules the same restart on the emulation thread without waiting for it.
// Returns non-zero when no running core can accept the request.
int lh_restart_async(lh_host *host);
// Increments once for every restart the run loop applies, whether scheduled by
// lh_restart or lh_restart_async and whether it succeeds or fails. Lets a
// caller poll for a scheduled restart to actually land before reading state
// that only makes sense post-restart.
unsigned lh_restart_generation(lh_host *host);
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
// published, and lh_set_option changes a value. lh_get_option fills [out] with
// a self-contained copy taken under the host's option lock, so the caller owns
// the strings and nothing invalidates them. Returns 0 on success, -1 for a NULL
// argument or an index outside the current definitions - and note the count can
// shrink between the two calls, because a restart on the emulation thread
// rebuilds the whole definition list. Treat a -1 as "stop enumerating", not as
// a hole to skip past.
int lh_option_count(lh_host *host);
int lh_get_option(lh_host *host, int index, lh_option *out);
void lh_set_option(lh_host *host, const char *id, const char *value);

// Reads a core's option definitions without loading content, so a core whose
// game will not start is still configurable. Definitions are host-owned copies
// readable through lh_option_count/lh_get_option afterwards; a core may publish
// more from retro_load_game, so this can be a subset. Returns 0 on success.
//
// Refused while any session is loaded: libretro's callbacks carry no user data,
// so a second module would be handed the running core's environment callback.
int lh_probe_options(lh_host *host, const char *core_path,
                     const char *system_dir);

// Controller configurations reported through
// RETRO_ENVIRONMENT_SET_CONTROLLER_INFO. The host logs every port and type the
// core reports (including unsupported extras), and retains snapshots for the
// Moonfin input ports it can route.
// lh_get_controller_type copies one entry into caller-owned storage; it returns
// -1 for a NULL host/out or an index outside the latest snapshot. A core may
// publish a replacement snapshot at any time, so treat that result as the end
// of enumeration rather than a hole.
int lh_controller_type_count(lh_host *host, int port);
int lh_get_controller_type(lh_host *host, int port, int index,
                           lh_controller_type *out);

// Core-supplied (port, device, index, id) -> label entries. Returns -1 for a
// NULL host/out or an index past the latest snapshot; since a core may publish
// a replacement snapshot at any time (notably after
// retro_set_controller_port_device), treat -1 as end of enumeration, not a hole.
int lh_input_descriptor_count(lh_host *host);
int lh_get_input_descriptor(lh_host *host, int index,
                            lh_input_descriptor *out);

// Applies a controller device on the emulation thread. RETRO_DEVICE_JOYPAD is
// Auto/the libretro default and is always accepted, even when it is not in a
// core's advertised list. An explicit unadvertised device safely falls back to
// that default and returns 1; an exact or Auto application returns 0. Returns
// -1 when the port is outside Moonfin's input range, no loaded core exports
// retro_set_controller_port_device, or the host can no longer run a job.
int lh_set_controller_type(lh_host *host, int port, unsigned device);

// Bitmask of ports whose left stick is passed through as an analog stick
// rather than converted to d-pad bits. Bit N = port N.
//
// Set only where the game DESCRIBES a stick (SET_INPUT_DESCRIPTORS at
// ANALOG_LEFT/RIGHT) and the core has actually READ one. Both are needed:
// FBNeo describes accurately but reads analog for every game including 4-way
// ones, while Stella reads accurately but describes an axis for every ROM.
// An ANALOG_BUTTON entry or read is trigger pressure and counts for neither.
//
// Until the core has completed a frame in which it read input, a described port
// reports analog on the descriptor alone: the core has not answered yet, and
// concluding digital early costs binary steering in a driving game. This waits
// on the core's own behaviour rather than on elapsed frames or time, so it does
// not shift on slower hardware.
//
// The read half is per-game: cleared by lh_load, by an internal restart, and
// by lh_set_controller_type. Thread-safe.
unsigned lh_analog_stick_ports(lh_host *host);

// Test-only: drives the frontend-frame input latch directly, without a running
// core or run loop. This is the same step the host runs before retro_run, so
// its transition delivery can be tested without wall-clock timing. Not part of
// the platform-facing contract; no shipping caller should need these.
void lh_test_poll_input(lh_host *host);
// A core-driven poll inside retro_run: refreshes analog only, like input_poll_cb.
void lh_test_core_poll_input(lh_host *host);
uint16_t lh_test_read_input(lh_host *host, int port);
// Test-only: reads the post-latch analog snapshot ([index] 0=left, 1=right
// stick; [axis] 0=X, 1=Y) and trigger snapshot ([which] 0=L2, 1=R2) for
// [port], exactly like lh_test_read_input reads input_frame. See that
// comment for why these hooks exist.
int16_t lh_test_read_analog(lh_host *host, int port, int index, int axis);
uint16_t lh_test_read_trigger(lh_host *host, int port, int which);

// Distinct environment commands this host has answered with the default
// false. Test-only: the diagnostic those commands emit goes to stderr or
// logcat, which the harness cannot read, so the dedupe is observed here.
int lh_test_unhandled_env_count(lh_host *host);

// How many times a core read input from a thread other than the one that
// latched it. Non-zero means the input frame is being published across
// threads without synchronisation.
int lh_test_input_thread_mismatch(lh_host *host);


// Reads a port the way a core does, INCLUDING acknowledging the edge bits it
// returns. lh_test_read_input peeks without acknowledging; use this one to
// assert the delivered-once contract.
uint16_t lh_test_observe_input(lh_host *host, int port);

// Reads one button the way a core querying ids individually does: returns that
// bit and acknowledges only it, leaving other buttons' edges undelivered.
int lh_test_observe_input_id(lh_host *host, int port, unsigned id);

#ifdef __cplusplus
}
#endif

#endif  // LIBRETRO_HOST_H
