#include "libretro_host.h"

#include <stdarg.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libretro.h"

#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#include <pthread.h>
#include <time.h>
#endif

#ifdef __ANDROID__
#include <android/log.h>
#endif

#include <errno.h>
#include <sys/stat.h>
#ifdef _WIN32
#include <direct.h>
#else
#include <dirent.h>
#endif

// ---------------------------------------------------------------------------
// Platform primitives: dynamic library, threading, time.
// ---------------------------------------------------------------------------

#ifdef _WIN32
typedef HMODULE lh_lib;
static lh_lib lib_open(const char *path) { return LoadLibraryA(path); }
static const char *lib_open_error(char *buf, size_t buf_size) {
  DWORD err = GetLastError();
  DWORD n = FormatMessageA(
      FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, NULL, err,
      0, buf, (DWORD)buf_size, NULL);
  if (n == 0) snprintf(buf, buf_size, "error %lu", (unsigned long)err);
  else {
    // FormatMessageA appends a trailing CRLF; trim it for a single-line log.
    while (n > 0 && (buf[n - 1] == '\n' || buf[n - 1] == '\r')) buf[--n] = '\0';
  }
  return buf;
}
static void *lib_sym(lh_lib h, const char *s) {
  return (void *)GetProcAddress(h, s);
}
static void lib_close(lh_lib h) { FreeLibrary(h); }

typedef HANDLE lh_thread;
typedef CRITICAL_SECTION lh_mutex;
typedef CONDITION_VARIABLE lh_cond;
static void mutex_init(lh_mutex *m) { InitializeCriticalSection(m); }
static void mutex_lock(lh_mutex *m) { EnterCriticalSection(m); }
static void mutex_unlock(lh_mutex *m) { LeaveCriticalSection(m); }
static void mutex_destroy(lh_mutex *m) { DeleteCriticalSection(m); }
static void cond_init(lh_cond *c) { InitializeConditionVariable(c); }
static void cond_wait(lh_cond *c, lh_mutex *m) {
  SleepConditionVariableCS(c, m, INFINITE);
}
static void cond_broadcast(lh_cond *c) { WakeAllConditionVariable(c); }
static void cond_destroy(lh_cond *c) { (void)c; }

static uint64_t now_ns(void) {
  LARGE_INTEGER f, t;
  QueryPerformanceFrequency(&f);
  QueryPerformanceCounter(&t);
  // t.QuadPart * 1e9 overflows a 64-bit value at ~1845s of uptime with a
  // 10 MHz QPC. Split into whole seconds and the sub-second remainder before
  // scaling so neither term can overflow.
  uint64_t whole = (uint64_t)t.QuadPart / (uint64_t)f.QuadPart;
  uint64_t frac = (uint64_t)t.QuadPart % (uint64_t)f.QuadPart;
  return whole * 1000000000ull + (frac * 1000000000ull) / (uint64_t)f.QuadPart;
}
static void sleep_ns(uint64_t ns) { Sleep((DWORD)(ns / 1000000ull)); }
static char *lh_strdup(const char *s) { return _strdup(s); }
#else
typedef void *lh_lib;
static lh_lib lib_open(const char *path) {
  return dlopen(path, RTLD_NOW | RTLD_LOCAL);
}
// Must be called immediately after a NULL dlopen; any later call clears it.
static const char *lib_open_error(void) { return dlerror(); }
static void *lib_sym(lh_lib h, const char *s) { return dlsym(h, s); }
static void lib_close(lh_lib h) { dlclose(h); }

typedef pthread_t lh_thread;
typedef pthread_mutex_t lh_mutex;
typedef pthread_cond_t lh_cond;
static void mutex_init(lh_mutex *m) { pthread_mutex_init(m, NULL); }
static void mutex_lock(lh_mutex *m) { pthread_mutex_lock(m); }
static void mutex_unlock(lh_mutex *m) { pthread_mutex_unlock(m); }
static void mutex_destroy(lh_mutex *m) { pthread_mutex_destroy(m); }
static void cond_init(lh_cond *c) { pthread_cond_init(c, NULL); }
static void cond_wait(lh_cond *c, lh_mutex *m) { pthread_cond_wait(c, m); }
static void cond_broadcast(lh_cond *c) { pthread_cond_broadcast(c); }
static void cond_destroy(lh_cond *c) { pthread_cond_destroy(c); }

static uint64_t now_ns(void) {
  struct timespec ts;
  clock_gettime(CLOCK_MONOTONIC, &ts);
  return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}
static void sleep_ns(uint64_t ns) {
  struct timespec ts;
  ts.tv_sec = (time_t)(ns / 1000000000ull);
  ts.tv_nsec = (long)(ns % 1000000000ull);
  nanosleep(&ts, NULL);
}
static char *lh_strdup(const char *s) { return strdup(s); }
#endif

// Identifies the calling thread for the input-hazard diagnostic below. Only
// ever compared for equality and printed; never dereferenced, and never used
// for control flow. pthread_t is not required by POSIX to be an integer, but
// is a pointer or unsigned long on every platform this host builds for, and a
// diagnostic is the right blast radius for that assumption.
static uint64_t current_thread_id(void) {
#ifdef _WIN32
  return (uint64_t)GetCurrentThreadId();
#else
  return (uint64_t)(uintptr_t)pthread_self();
#endif
}

// Truncating copy into a fixed buffer. Always NUL-terminates and tolerates a
// NULL source, so the option snapshot below never leaves a caller with an
// unterminated buffer to read past. strncpy is deliberately avoided: it does
// not terminate on truncation, which is exactly the case that matters here.
static void lh_copy_bounded(char *dst, size_t cap, const char *src) {
  if (!dst || cap == 0) return;
  if (!src) {
    dst[0] = '\0';
    return;
  }
  size_t n = strlen(src);
  if (n >= cap) n = cap - 1;
  memcpy(dst, src, n);
  dst[n] = '\0';
}

// ---------------------------------------------------------------------------
// Core entry points, resolved from the loaded library.
// ---------------------------------------------------------------------------

typedef void(RETRO_CALLCONV *fn_void)(void);
typedef void(RETRO_CALLCONV *fn_set_env)(retro_environment_t);
typedef void(RETRO_CALLCONV *fn_set_video)(retro_video_refresh_t);
typedef void(RETRO_CALLCONV *fn_set_audio)(retro_audio_sample_t);
typedef void(RETRO_CALLCONV *fn_set_audio_batch)(retro_audio_sample_batch_t);
typedef void(RETRO_CALLCONV *fn_set_input_poll)(retro_input_poll_t);
typedef void(RETRO_CALLCONV *fn_set_input_state)(retro_input_state_t);
typedef void(RETRO_CALLCONV *fn_set_controller_port_device)(unsigned,unsigned);
typedef void(RETRO_CALLCONV *fn_get_sysinfo)(struct retro_system_info *);
typedef void(RETRO_CALLCONV *fn_get_avinfo)(struct retro_system_av_info *);
typedef bool(RETRO_CALLCONV *fn_load_game)(const struct retro_game_info *);
typedef size_t(RETRO_CALLCONV *fn_size)(void);
typedef bool(RETRO_CALLCONV *fn_serialize)(void *, size_t);
typedef bool(RETRO_CALLCONV *fn_unserialize)(const void *, size_t);
typedef void *(RETRO_CALLCONV *fn_mem_data)(unsigned);
typedef size_t(RETRO_CALLCONV *fn_mem_size)(unsigned);

typedef struct {
  lh_lib handle;
  fn_set_env set_environment;
  fn_set_video set_video_refresh;
  fn_set_audio set_audio_sample;
  fn_set_audio_batch set_audio_sample_batch;
  fn_set_input_poll set_input_poll;
  fn_set_input_state set_input_state;
  // Optional in practice: older/minimal cores can omit this entry point even
  // though the libretro API documents it. Keep the rest of the core usable.
  fn_set_controller_port_device set_controller_port_device;
  fn_void init;
  fn_void deinit;
  fn_get_sysinfo get_system_info;
  fn_get_avinfo get_system_av_info;
  fn_load_game load_game;
  fn_void unload_game;
  fn_void run;
  fn_void reset;
  fn_size serialize_size;
  fn_serialize serialize;
  fn_unserialize unserialize;
  fn_mem_data get_memory_data;
  fn_mem_size get_memory_size;
} lh_core;

// ---------------------------------------------------------------------------
// Options.
// ---------------------------------------------------------------------------

typedef struct {
  char *id;
  char *label;
  char **choices;
  int choice_count;
} lh_optdef;

typedef struct {
  char *key;
  char *value;
} lh_var;

typedef struct {
  lh_controller_type *types;
  unsigned type_count;
} lh_controller_port;

// lh_input_descriptor (one RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS entry, as
// a caller-owned snapshot) is declared in libretro_host.h alongside
// lh_controller_type, since both are part of the public accessor surface.

// ---------------------------------------------------------------------------
// Video double buffer: the run loop converts into the back buffer, the platform
// pulls the front. A pull swaps them, so a returned frame stays valid until the
// next pull.
// ---------------------------------------------------------------------------

typedef struct {
  uint8_t *data;
  int width;
  int height;
  size_t capacity;
} lh_frame;

// ---------------------------------------------------------------------------
// Jobs run on the emulation thread between frames, so save/reset/options never
// race retro_run.
// ---------------------------------------------------------------------------

typedef enum {
  JOB_RESET,
  JOB_RESTART,
  JOB_SERIALIZE_SIZE,
  JOB_SERIALIZE,
  JOB_UNSERIALIZE,
  JOB_CONTROLLER_DEVICE,
} lh_job_kind;

typedef struct {
  lh_job_kind kind;
  void *buf;
  const void *cbuf;
  size_t size;
  size_t result_size;
  int result_ok;
  int port;
  unsigned device;
  int done;
} lh_job;

#define LH_MAX_JOBS 16

// Largest per-side frame dimension the host will accept, either from
// notify_geometry (SET_SYSTEM_AV_INFO / SET_GEOMETRY) or from a video_refresh
// callback. Both ultimately come from the loaded core, which is not a trusted
// boundary: a buggy or malicious core can report whatever it likes. The real
// hazard is convert_frame's size_t multiply (out_width * out_height * 4). On
// a 32-bit size_t (armeabi-v7a is still shipped, see build.gradle) a large
// enough width/height pair wraps that multiply to a small number, so the
// allocation is undersized while the pixel loop below still walks the full,
// un-wrapped width*height - a heap overflow. 8192 per side is far beyond any
// real libretro core's output (the largest arcade/console framebuffers top
// out in the low thousands) and small enough that width*height*4 cannot
// overflow even a 32-bit size_t (8192*8192*4 < 2^32), so rejecting anything
// larger removes the wraparound case entirely rather than merely computing
// around it.
#define LH_MAX_FRAME_DIMENSION 8192

// Distinct unserved environment commands remembered per host, purely to keep
// the diagnostic from repeating. Cores probe well under this many.
#define LH_UNHANDLED_ENV_SLOTS 48

// How many polls an unread edge bit is held before being dropped. Four is a
// little over the two frames the old 34ms pulse covered, so a core that does
// read gets a wider window than before, while a core that never reads a given
// id cannot wedge it on.
#define LH_UNACKED_MAX_POLLS 4

// Completed frames in which the core read input before its silence about the
// stick is taken as an answer. Not a timeout: a core that has read input and
// not touched the stick has told us it does not want one, however long that
// took in wall clock. Two rather than one only so a core that splits its
// joypad and analog reads across its first frames is not misread.
#define LH_ANALOG_DECIDE_FRAMES 2

struct lh_host {
  lh_output_format format;
  lh_callbacks cb;

  lh_core core;
  int core_loaded;

  lh_av_info av;
  // Last geometry handed to cb.geometry_changed, so unchanged repeats are not
  // forwarded. Emulation-thread only, like av. load_content resets these to -1
  // (never a valid dimension) so the first report after a load or an internal
  // restart always goes through.
  int notified_width;
  int notified_height;
  double notified_aspect;

  char *system_dir;
  char *save_dir;
  char *sram_path;
  char *core_path;
  char *rom_path;
  lh_mutex core_log_lock;
  int capture_load_log;
  char last_core_log[256];
  char last_core_error[256];
  unsigned pixel_format;

  // Options.
  lh_optdef *defs;
  int def_count;
  lh_var *vars;
  int var_count;
  // Option values the core may still be holding after they were replaced.
  // See vars_retire: replaced value strings are parked here for the life of
  // the load instead of being freed, and the whole list is released at
  // session teardown.
  char **retired_values;
  int retired_count;
  int variables_dirty;
  // Set when parse_variable fails to allocate while handling a
  // SET_VARIABLES environment call during retro_init/retro_load_game.
  // Checked once open_core/load_content return, so a core that hit an
  // allocation failure mid-init still fails the load instead of running with
  // silently incomplete option definitions. Reset before each such call (see
  // open_core).
  int alloc_failed;
  lh_mutex vars_lock;

  // Controller configuration snapshots. The core owns the structures passed
  // through SET_CONTROLLER_INFO, so retain only copied labels and IDs here.
  // We log every reported port, including ports Moonfin cannot drive, but keep
  // snapshots only for the four ports this host can actually route input to.
  lh_controller_port *controller_ports;
  int controller_port_count;
  lh_mutex controller_info_lock;
  // Last device successfully handed to the core for each routable port. This
  // survives an internal restart, whose new core instance otherwise forgets
  // every retro_set_controller_port_device call.
  // Atomic, not mutex-guarded: independent per-port scalars, like input_level.
  atomic_uint controller_devices[LH_MAX_PORTS];

  // RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS snapshot: a flat, core-supplied
  // list of (port, device, index, id) -> human-readable label entries. Kept
  // behind its own lock rather than controller_info_lock, since the two are
  // updated independently and sharing the lock would only widen an unrelated
  // critical section.
  lh_input_descriptor *input_descriptors;
  int input_descriptor_count;
  lh_mutex input_descriptor_lock;

  // Video.
  lh_frame front;
  lh_frame back;
  int back_ready;
  lh_mutex video_lock;

  // Audio ring: interleaved stereo S16.
  int16_t *ring;
  int ring_capacity;
  int ring_read;
  int ring_write;
  int ring_stored;
  lh_mutex audio_lock;
  atomic_int audio_paced;

  // Environment commands this host answered with the default false, recorded
  // so each is reported once instead of every frame. Best-effort: two threads
  // racing here can duplicate one line, which is harmless, and the table
  // filling up costs repeat lines rather than silence.
  unsigned unhandled_env[LH_UNHANDLED_ENV_SLOTS];
  atomic_int unhandled_env_count;

  // Run loop. running/paused/fast_forward are shared with the loop thread.
  lh_thread thread;
  int has_thread;
  atomic_int running;
  atomic_int paused;
  atomic_int fast_forward;
  atomic_int restart_requested;
  atomic_int resume_requested;
  atomic_uint restart_generation;
  atomic_int shutdown_requested;
  uint64_t last_sram_flush_ns;

  // Jobs. jobs_open says whether the loop is still there to drain them, so a
  // job queued as the loop exits is never left waiting.
  lh_job *jobs[LH_MAX_JOBS];
  int job_count;
  int jobs_open;
  lh_mutex jobs_lock;
  lh_cond jobs_cond;

  // Input latch. Writers (any thread, any platform) call lh_set_input, which
  // records rising and falling transitions and replaces input_level. Once per
  // frontend frame, latch_input exposes at most one transition per button to
  // input_frame - the value the core reads for the rest of that frame via
  // input_state_cb. See lh_set_input's comment for why this, rather than a
  // plain instantaneous read, is required.
  // input_frame WAS a plain array, on the documented assumption that polling
  // and reading both happen on the emulation thread. bug-177 measured that
  // assumption false: mupen64plus-next with its threaded renderer reads input
  // from a thread the host never latched on, and the detector below fired on
  // the first game load. Pending transitions make a short pulse survive until
  // a frame latch drains it; the atomic published word then makes that frame
  // safe for a core reading on another thread. The hot steady-state read is a
  // single acquire load; no lock or atomic write is needed unless a transition
  // is actually being acknowledged.
  atomic_uint input_level[LH_MAX_PORTS];
  // Queued transitions: low 16 bits pending DOWNs, high 16 pending UPs, in one
  // word so the latch drains both in a single exchange. As two words it could
  // read a press without the release that followed it, publish the press next
  // frame, and leave the button held with nothing left to release it.
  atomic_uint input_transitions[LH_MAX_PORTS];
  // Low 16 bits are the published digital state and high 16 bits are
  // transitions awaiting acknowledgment. Keeping these together lets a
  // threaded core acknowledge the snapshot it read without racing a later
  // publication, using one lock-free 32-bit word even on armeabi-v7a.
  atomic_uint input_frame[LH_MAX_PORTS];

  // Edge bits published but not yet READ by the core, and how many frontend
  // frames they have waited. The bits live in input_frame with the published
  // snapshot so acknowledgment cannot clear a newer transition by mistake.
  //
  // The age bound is what keeps that from becoming a stuck button: a core that
  // never reads a given id would otherwise see it held forever. After
  // LH_UNACKED_MAX_POLLS the bit is dropped regardless. A core that reads
  // immediately after polling - which is every single-threaded core -
  // acknowledges within the same frame and sees no behaviour change at all.
  unsigned char unacked_age[LH_MAX_PORTS][16];  // latch thread only
  // The thread input_poll_cb last latched on, and how many times a core has
  // read input from a DIFFERENT one. Kept after the frames were made atomic:
  // the publication is now safe, so this is no longer a defect report, but a
  // core reading input off the polling thread is still worth knowing about -
  // it is the condition under which any future non-atomic addition to the
  // frame state would silently rot, and it is how bug-177 was proven.
  atomic_ullong input_poll_thread;
  atomic_int input_poll_thread_known;
  atomic_int input_thread_mismatch;

  // Analog is a level, not an edge, so it deliberately does NOT use the
  // transition latch above. X and Y share one 32-bit word so a diagonal cannot
  // tear:
  // cores read each axis many times per frame (measured ~7x), and two
  // independent atomics would be read at different instants.
  atomic_uint analog_level[LH_MAX_PORTS][2];   // [port][0=left,1=right]
  atomic_uint analog_frame[LH_MAX_PORTS][2];   // published, read cross-thread
  // l2 packed in the high 16 bits, r2 in the low, for the same reason.
  atomic_uint trigger_level[LH_MAX_PORTS];
  atomic_uint trigger_frame[LH_MAX_PORTS];     // published, read cross-thread

  // Ports the core has actually READ an analog stick on, bit N = port N; half
  // of lh_analog_stick_ports' answer. Written from whatever thread the core
  // reads input on, so atomic, and relaxed because nothing is published
  // through it.
  atomic_uint analog_queried_ports;
  // Whether the core read any input during the frame now running, and how many
  // completed frames it has done so in, saturating at the decision threshold.
  // "The core has not read a stick" only means something once the core has
  // read input at all.
  atomic_uint input_read_seen;
  atomic_uint input_read_frames;
};

// libretro's callbacks carry no user pointer, so the single live host is global.
static struct lh_host *g_session;

static int restart_core(struct lh_host *h);

// ---------------------------------------------------------------------------
// Options helpers.
// ---------------------------------------------------------------------------

static const char *vars_get(struct lh_host *h, const char *key) {
  for (int i = 0; i < h->var_count; i++) {
    if (strcmp(h->vars[i].key, key) == 0) return h->vars[i].value;
  }
  return NULL;
}

// Values handed to the core through RETRO_ENVIRONMENT_GET_VARIABLE must
// outlive a concurrent lh_set_option on the platform thread: the core is given
// a raw pointer into h->vars and is entitled to hold it across frames (most
// cores keep it until the next GET_VARIABLE_UPDATE tells them to re-poll, and
// re-polling is exactly what an option change triggers). Freeing the replaced
// string in place is therefore a use-after-free on the emulation thread. Park
// it here instead and release the whole list when the session ends.
//
// Growth is bounded in practice: one entry per option change, and option
// changes are a human action in the pause menu, so a session accumulates a
// handful of short strings at most. This is a per-load arena, not a leak -
// vars_free_retired drains it at every teardown and restart.
//
// Called with vars_lock held.
static void vars_retire(struct lh_host *h, char *old_value) {
  if (!old_value) return;
  char **grown = realloc(h->retired_values,
                         sizeof(char *) * (size_t)(h->retired_count + 1));
  if (!grown) {
    // Losing the pointer leaks one string for the session; freeing it could
    // crash the core that is still reading it. Leak deliberately.
    h->alloc_failed = 1;
    return;
  }
  h->retired_values = grown;
  h->retired_values[h->retired_count++] = old_value;
}

// Releases every retired value. Only safe once the core is torn down (or was
// never loaded), because that is the point at which no core-held pointer can
// still be dereferenced. Idempotent: it resets the list so a second call from
// a later teardown path is a no-op.
static void vars_free_retired(struct lh_host *h) {
  for (int i = 0; i < h->retired_count; i++) free(h->retired_values[i]);
  free(h->retired_values);
  h->retired_values = NULL;
  h->retired_count = 0;
}

// Sets h->vars[key] = value, adding a new entry if key is unseen. Returns 0 on
// success, -1 if an allocation failed. The realloc result always lands in a
// temporary first: assigning straight into h->vars, as the old code did,
// loses the original block on failure (realloc leaves it untouched and
// returns NULL) and leaves h->vars NULL while var_count still claims entries
// exist - the next vars_get/vars_set dereferences that NULL. Every new-entry
// path below is fully populated or fully abandoned before var_count moves, so
// a failure here never publishes a half-built slot with a NULL key or value.
static int vars_set(struct lh_host *h, const char *key, const char *value) {
  for (int i = 0; i < h->var_count; i++) {
    if (strcmp(h->vars[i].key, key) == 0) {
      char *new_value = lh_strdup(value);
      if (!new_value) return -1;
      vars_retire(h, h->vars[i].value);
      h->vars[i].value = new_value;
      return 0;
    }
  }
  lh_var *grown = realloc(h->vars, sizeof(lh_var) * (h->var_count + 1));
  if (!grown) return -1;
  h->vars = grown;
  char *key_copy = lh_strdup(key);
  char *value_copy = lh_strdup(value);
  if (!key_copy || !value_copy) {
    free(key_copy);
    free(value_copy);
    return -1;
  }
  h->vars[h->var_count].key = key_copy;
  h->vars[h->var_count].value = value_copy;
  h->var_count++;
  return 0;
}

static void free_option_definitions(struct lh_host *h) {
  for (int i = 0; i < h->def_count; i++) {
    free(h->defs[i].id);
    free(h->defs[i].label);
    for (int c = 0; c < h->defs[i].choice_count; c++) {
      free(h->defs[i].choices[c]);
    }
    free(h->defs[i].choices);
  }
  free(h->defs);
  h->defs = NULL;
  h->def_count = 0;
}

// Frees a not-yet-published choice list/label pair, for the allocation
// failure paths below where h->defs was never touched.
static void free_pending_choices(char *label, char **choices, int nchoices) {
  free(label);
  for (int c = 0; c < nchoices; c++) free(choices[c]);
  free(choices);
}

// Parses one SET_VARIABLES entry into its label and choice list. Returns 0 on
// success, -1 if an allocation failed anywhere along the way. Every realloc
// result lands in a temporary before it replaces choices/h->defs, so a
// failure never drops the last-good block (the bug the old code had: a failed
// realloc returns NULL, and assigning that straight back into choices/h->defs
// leaks the previous allocation and leaves a NULL the next line immediately
// writes through). On any failure, everything allocated for *this* entry is
// freed and nothing partial is published into h->defs, so the definitions
// table is left exactly as it was before this call - the caller only has to
// decide whether to abandon the load, not to unwind partial state here.
static int parse_variable(struct lh_host *h, const char *key,
                          const char *raw) {
  const char *sep = strstr(raw, "; ");
  char *label = NULL;
  char **choices = NULL;
  int nchoices = 0;
  if (sep) {
    size_t label_len = (size_t)(sep - raw);
    label = malloc(label_len + 1);
    if (!label) return -1;
    memcpy(label, raw, label_len);
    label[label_len] = '\0';
    const char *list = sep + 2;
    char *copy = lh_strdup(list);
    if (!copy) {
      free_pending_choices(label, choices, nchoices);
      return -1;
    }
    char *tok = strtok(copy, "|");
    while (tok) {
      char **grown = realloc(choices, sizeof(char *) * (nchoices + 1));
      if (!grown) {
        free(copy);
        free_pending_choices(label, choices, nchoices);
        return -1;
      }
      choices = grown;
      char *choice_copy = lh_strdup(tok);
      if (!choice_copy) {
        free(copy);
        free_pending_choices(label, choices, nchoices);
        return -1;
      }
      choices[nchoices++] = choice_copy;
      tok = strtok(NULL, "|");
    }
    free(copy);
  } else {
    label = lh_strdup(key);
    if (!label) return -1;
  }

  lh_optdef *grown_defs =
      realloc(h->defs, sizeof(lh_optdef) * (h->def_count + 1));
  if (!grown_defs) {
    free_pending_choices(label, choices, nchoices);
    return -1;
  }
  h->defs = grown_defs;
  char *id_copy = lh_strdup(key);
  if (!id_copy) {
    free_pending_choices(label, choices, nchoices);
    return -1;
  }
  h->defs[h->def_count].id = id_copy;
  h->defs[h->def_count].label = label;
  h->defs[h->def_count].choices = choices;
  h->defs[h->def_count].choice_count = nchoices;
  h->def_count++;

  if (vars_get(h, key) == NULL && nchoices > 0) {
    // The definition is already published above by this point, so a failure
    // here only means the option keeps its core-supplied fallback instead of
    // an explicit default - it does not need to unwind def_count.
    if (vars_set(h, key, choices[0]) != 0) return -1;
  }
  return 0;
}

// ---------------------------------------------------------------------------
// Virtual file system.
//
// Without GET_VFS_INTERFACE, some cores (Stella) never fall back to treating
// game.path as a real, stat-able file - they just reject the ROM outright,
// even though it genuinely exists on disk at that path. This is a thin,
// portable shim over stdio/dirent so those cores work like any other.
// ---------------------------------------------------------------------------

struct retro_vfs_file_handle {
  FILE *fp;
  char *path;
};

struct retro_vfs_dir_handle {
#ifdef _WIN32
  HANDLE find;
  WIN32_FIND_DATAA data;
  bool pending;
#else
  DIR *dir;
  struct dirent *entry;
#endif
};

static const char *vfs_get_path(struct retro_vfs_file_handle *stream) {
  return stream ? stream->path : NULL;
}

static struct retro_vfs_file_handle *vfs_open(const char *path, unsigned mode,
                                               unsigned hints) {
  (void)hints;
  const char *fmode = "rb";
  if (mode & RETRO_VFS_FILE_ACCESS_WRITE) {
    fmode = (mode & RETRO_VFS_FILE_ACCESS_UPDATE_EXISTING) ? "r+b" : "w+b";
  }
  FILE *fp = fopen(path, fmode);
  if (!fp && mode == RETRO_VFS_FILE_ACCESS_READ_WRITE) {
    // "r+b" requires the file to already exist; a core opening for
    // read/write update on a not-yet-created file needs it made first.
    fp = fopen(path, "w+b");
  }
  if (!fp) return NULL;
  struct retro_vfs_file_handle *handle = calloc(1, sizeof(*handle));
  if (!handle) {
    fclose(fp);
    return NULL;
  }
  size_t path_len = strlen(path);
  handle->path = malloc(path_len + 1);
  if (!handle->path) {
    fclose(fp);
    free(handle);
    return NULL;
  }
  memcpy(handle->path, path, path_len + 1);
  handle->fp = fp;
  return handle;
}

static int vfs_close(struct retro_vfs_file_handle *stream) {
  if (!stream) return -1;
  int rc = fclose(stream->fp);
  free(stream->path);
  free(stream);
  return rc == 0 ? 0 : -1;
}

static int64_t vfs_tell(struct retro_vfs_file_handle *stream) {
  if (!stream) return -1;
  long pos = ftell(stream->fp);
  return pos < 0 ? -1 : (int64_t)pos;
}

static int64_t vfs_size(struct retro_vfs_file_handle *stream) {
  if (!stream) return -1;
  long cur = ftell(stream->fp);
  if (cur < 0 || fseek(stream->fp, 0, SEEK_END) != 0) return -1;
  long end = ftell(stream->fp);
  fseek(stream->fp, cur, SEEK_SET);
  return end < 0 ? -1 : (int64_t)end;
}

static int64_t vfs_seek(struct retro_vfs_file_handle *stream, int64_t offset,
                         int seek_position) {
  if (!stream) return -1;
  int whence = SEEK_SET;
  if (seek_position == RETRO_VFS_SEEK_POSITION_CURRENT) whence = SEEK_CUR;
  else if (seek_position == RETRO_VFS_SEEK_POSITION_END) whence = SEEK_END;
  if (fseek(stream->fp, (long)offset, whence) != 0) return -1;
  // Match libretro-common's built-in VFS and stdio fseek semantics. FBNeo's
  // minizip bridge treats every nonzero result as a seek failure, then uses
  // tell() when it needs the resulting position.
  return 0;
}

static int64_t vfs_read(struct retro_vfs_file_handle *stream, void *s,
                         uint64_t len) {
  if (!stream) return -1;
  return (int64_t)fread(s, 1, (size_t)len, stream->fp);
}

static int64_t vfs_write(struct retro_vfs_file_handle *stream, const void *s,
                          uint64_t len) {
  if (!stream) return -1;
  return (int64_t)fwrite(s, 1, (size_t)len, stream->fp);
}

static int vfs_flush(struct retro_vfs_file_handle *stream) {
  if (!stream) return -1;
  return fflush(stream->fp) == 0 ? 0 : -1;
}

static int vfs_remove(const char *path) { return remove(path) == 0 ? 0 : -1; }

static int vfs_rename(const char *old_path, const char *new_path) {
  return rename(old_path, new_path) == 0 ? 0 : -1;
}

static int64_t vfs_truncate(struct retro_vfs_file_handle *stream,
                             int64_t length) {
  (void)stream;
  (void)length;
  return -1;  // Unused by any core this host ships.
}

static int vfs_stat(const char *path, int32_t *size) {
  struct stat st;
  if (stat(path, &st) != 0) return 0;
  int flags = RETRO_VFS_STAT_IS_VALID;
#ifdef _WIN32
  if (st.st_mode & _S_IFDIR) flags |= RETRO_VFS_STAT_IS_DIRECTORY;
#else
  if (S_ISDIR(st.st_mode)) flags |= RETRO_VFS_STAT_IS_DIRECTORY;
#endif
  if (size) *size = (int32_t)st.st_size;
  return flags;
}

static int vfs_mkdir(const char *dir) {
#ifdef _WIN32
  if (_mkdir(dir) == 0) return 0;
#else
  if (mkdir(dir, 0755) == 0) return 0;
#endif
  return errno == EEXIST ? -2 : -1;
}

static struct retro_vfs_dir_handle *vfs_opendir(const char *dir,
                                                  bool include_hidden) {
  (void)include_hidden;
  struct retro_vfs_dir_handle *handle = calloc(1, sizeof(*handle));
  if (!handle) return NULL;
#ifdef _WIN32
  char pattern[1024];
  snprintf(pattern, sizeof(pattern), "%s\\*", dir);
  handle->find = FindFirstFileA(pattern, &handle->data);
  if (handle->find == INVALID_HANDLE_VALUE) {
    free(handle);
    return NULL;
  }
  handle->pending = true;
#else
  handle->dir = opendir(dir);
  if (!handle->dir) {
    free(handle);
    return NULL;
  }
#endif
  return handle;
}

static bool vfs_readdir(struct retro_vfs_dir_handle *dirstream) {
  if (!dirstream) return false;
#ifdef _WIN32
  if (dirstream->pending) {
    dirstream->pending = false;
    return true;
  }
  return FindNextFileA(dirstream->find, &dirstream->data) != 0;
#else
  dirstream->entry = readdir(dirstream->dir);
  return dirstream->entry != NULL;
#endif
}

static const char *vfs_dirent_get_name(struct retro_vfs_dir_handle *dirstream) {
  if (!dirstream) return NULL;
#ifdef _WIN32
  return dirstream->data.cFileName;
#else
  return dirstream->entry ? dirstream->entry->d_name : NULL;
#endif
}

static bool vfs_dirent_is_dir(struct retro_vfs_dir_handle *dirstream) {
  if (!dirstream) return false;
#ifdef _WIN32
  return (dirstream->data.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) != 0;
#else
  /* Everything we scan lives in the app's own cache/support dir — internal
     storage on every shipped platform, where d_type is always populated.
     Could be a problem if an app/cache dir is on NFS, overlayfs, or XFS
     with ftype=0 would return DT_UNKNOWN and make a real directory look
     like a file to the core. DT_LNK is not a directory either.
  */
  return dirstream->entry && dirstream->entry->d_type == DT_DIR;
#endif
}

static int vfs_closedir(struct retro_vfs_dir_handle *dirstream) {
  if (!dirstream) return -1;
#ifdef _WIN32
  FindClose(dirstream->find);
#else
  closedir(dirstream->dir);
#endif
  free(dirstream);
  return 0;
}

static const struct retro_vfs_interface g_vfs_interface = {
    vfs_get_path, vfs_open,        vfs_close,
    vfs_size,     vfs_tell,        vfs_seek,
    vfs_read,     vfs_write,       vfs_flush,
    vfs_remove,   vfs_rename,      vfs_truncate,
    vfs_stat,     vfs_mkdir,       vfs_opendir,
    vfs_readdir,  vfs_dirent_get_name, vfs_dirent_is_dir,
    vfs_closedir, NULL,
};

// ---------------------------------------------------------------------------
// Environment callback (mirrors the tvOS GameSession switch).
// ---------------------------------------------------------------------------

// Routes a formatted diagnostic to the platform's log sink, if it supplied one.
static void host_log(struct lh_host *h, const char *fmt, ...) {
  if (!h->cb.message) return;
  // Increase buffer to keep the path and the core's actual reason (if provided) together
  // in the platform diagnostic instead of truncating the message.
  char buf[1024];
  va_list args;
  va_start(args, fmt);
  vsnprintf(buf, sizeof(buf), fmt, args);
  va_end(args);
  h->cb.message(h->cb.user, buf);
}

// Host diagnostics that must never become a core message/overlay event. In
// particular, a core's controller inventory can be sizeable and is useful in
// logcat, but is not user-facing state. Keep this separate from log_printf_cb
// too: these host messages must not overwrite a core's load-failure reason.
static void diagnostic_log(const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
#ifdef __ANDROID__
  __android_log_vprint(ANDROID_LOG_INFO, "moonfin_libretro", fmt, args);
#else
  vfprintf(stderr, fmt, args);
  fputc('\n', stderr);
#endif
  va_end(args);
}

// The host bakes SET_ROTATION into the converted frame, so the geometry it
// advertises has to describe the rotated frame, not the core's raw buffer.
// Quarter turns swap the axes.
//
// The aspect ratio is deliberately left alone whenever the core supplied one:
// a core that asks for rotation reports the aspect of the *final* display, not
// of its own unrotated buffer. Verified against FBNeo, which pairs a landscape
// 512x480 buffer with a 0.75 portrait aspect for a vertical cabinet. Inverting
// that would double-correct and stretch the picture. Only a fallback aspect the
// host derived itself has to be recomputed from the swapped dimensions.
static void apply_rotation_to_av(struct lh_host *h, int aspect_reported) {
  if (h->av.rotation == 1 || h->av.rotation == 3) {
    int w = h->av.width;
    h->av.width = h->av.height;
    h->av.height = w;
  }
  if (!aspect_reported) {
    h->av.aspect =
        (double)h->av.width / (double)(h->av.height > 0 ? h->av.height : 1);
  }
}

static void notify_geometry(struct lh_host *h, unsigned width, unsigned height,
                            float aspect_ratio) {
  // A core reporting zero or an absurd dimension here would otherwise flow
  // straight into h->av (and out through geometry_changed to the platform's
  // texture allocation) as well as size the next convert_frame call. Reject it
  // at the source instead of trusting the core - see LH_MAX_FRAME_DIMENSION
  // for why 8192 and why this matters on 32-bit size_t.
  if (width == 0 || height == 0 || width > LH_MAX_FRAME_DIMENSION ||
      height > LH_MAX_FRAME_DIMENSION) {
    diagnostic_log("Rejected geometry %ux%u (out of bounds)", width, height);
    return;
  }
  h->av.width = (int)width;
  h->av.height = (int)height;
  if (aspect_ratio > 0) h->av.aspect = (double)aspect_ratio;
  apply_rotation_to_av(h, aspect_ratio > 0);

  // Cores may re-send SET_GEOMETRY every frame with values they already
  // reported; mupen64plus-next does, and forwarding those costs a JNI call, a
  // main-thread Runnable and a platform-channel message per frame on Android
  // for no change. Compared after apply_rotation_to_av so the values checked
  // are the ones the callback carries. Exact double comparison holds because
  // equal inputs take the same conversion and divide.
  if (h->av.width == h->notified_width &&
      h->av.height == h->notified_height &&
      h->av.aspect == h->notified_aspect) {
    return;
  }
  h->notified_width = h->av.width;
  h->notified_height = h->av.height;
  h->notified_aspect = h->av.aspect;

  if (h->cb.geometry_changed) {
    h->cb.geometry_changed(h->cb.user, h->av.width, h->av.height, h->av.aspect);
  }
}

// Cores are allowed to log during retro_init and some call this pointer
// without checking that the frontend handed one over, so it always has to be
// a real function.
static void RETRO_CALLCONV log_printf_cb(enum retro_log_level level,
                                         const char *fmt, ...) {
  if (!fmt) return;
  va_list args;
  va_start(args, fmt);
  struct lh_host *h = g_session;
  if (h) {
    mutex_lock(&h->core_log_lock);
    if (h->capture_load_log) {
      va_list copy;
      va_copy(copy, args);
      vsnprintf(h->last_core_log, sizeof(h->last_core_log), fmt, copy);
      va_end(copy);
      size_t length = strlen(h->last_core_log);
      while (length > 0 &&
             (h->last_core_log[length - 1] == '\n' ||
              h->last_core_log[length - 1] == '\r')) {
        h->last_core_log[--length] = '\0';
      }
      if (level >= RETRO_LOG_WARN) {
        snprintf(h->last_core_error, sizeof(h->last_core_error), "%s",
                 h->last_core_log);
      }
    }
    mutex_unlock(&h->core_log_lock);
  }
#ifdef __ANDROID__
  (void)level;
  __android_log_vprint(ANDROID_LOG_INFO, "moonfin_libretro", fmt, args);
#else
  (void)level;
  vfprintf(stderr, fmt, args);
#endif
  va_end(args);
}

static void deliver_message(struct lh_host *h, const char *text) {
  if (text && *text && h->cb.message) h->cb.message(h->cb.user, text);
}

static void free_controller_ports(lh_controller_port *ports, int count) {
  for (int p = 0; p < count; p++) free(ports[p].types);
  free(ports);
}

static void clear_controller_info(struct lh_host *h) {
  mutex_lock(&h->controller_info_lock);
  lh_controller_port *ports = h->controller_ports;
  int count = h->controller_port_count;
  h->controller_ports = NULL;
  h->controller_port_count = 0;
  mutex_unlock(&h->controller_info_lock);
  free_controller_ports(ports, count);
}

static void clear_input_descriptors(struct lh_host *h) {
  mutex_lock(&h->input_descriptor_lock);
  lh_input_descriptor *descriptors = h->input_descriptors;
  h->input_descriptors = NULL;
  h->input_descriptor_count = 0;
  mutex_unlock(&h->input_descriptor_lock);
  free(descriptors);
}

// Borrowed array, NULL-description terminated. Like SET_CONTROLLER_INFO, cores
// may free it after this returns, so nothing from it may escape; the snapshot is
// built whole before publishing so readers never see a half-rebuilt list.
static bool copy_input_descriptors(struct lh_host *h,
                                   const struct retro_input_descriptor *descriptors) {
  int count = 0;
  for (;;) {
    if (count == INT_MAX) {
      diagnostic_log("Rejected input descriptors with too many entries");
      return false;
    }
    if (!descriptors[count].description) break;
    count++;
  }

  lh_input_descriptor *copy = NULL;
  if (count > 0) {
#if SIZE_MAX <= UINT_MAX
    if ((size_t)count > SIZE_MAX / sizeof(lh_input_descriptor)) {
      diagnostic_log("Rejected input descriptors with too many entries");
      return false;
    }
#endif
    copy = calloc((size_t)count, sizeof(*copy));
    if (!copy) {
      diagnostic_log("Failed to allocate input descriptor snapshot");
      return false;
    }
  }

  for (int i = 0; i < count; i++) {
    const struct retro_input_descriptor *source = &descriptors[i];
    copy[i].port = source->port;
    copy[i].device = source->device;
    copy[i].index = source->index;
    copy[i].id = source->id;
    lh_copy_bounded(copy[i].description, sizeof(copy[i].description),
                    source->description);
  }

  // Logged before publishing, while copy is still exclusively owned. Once it is
  // in h->input_descriptors a concurrent clear can free it mid-read.
  // Timestamped so "the core never sent any" is distinguishable from "we read
  // them too early"
  diagnostic_log("SET_INPUT_DESCRIPTORS: %d entries", count);
  for (int i = 0; i < count && i < 8; i++) {
    diagnostic_log("  descriptor port=%u device=%u index=%u id=%u '%s'",
                   copy[i].port, copy[i].device, copy[i].index, copy[i].id,
                   copy[i].description);
  }

  mutex_lock(&h->input_descriptor_lock);
  lh_input_descriptor *old = h->input_descriptors;
  h->input_descriptors = copy;
  h->input_descriptor_count = count;
  mutex_unlock(&h->input_descriptor_lock);
  free(old);
  return true;
}

// Clears every analog word for a fresh session. The digital mask is zeroed by
// the platform on session change (its reset path writes a zero mask), but that
// path is mask-only and never touches these words -- so without this a stick
// left deflected when one game exits would still be deflected for the first
// frames of the next, before any motion event arrives to overwrite it.
static void reset_analog_state(struct lh_host *h) {
  for (int p = 0; p < LH_MAX_PORTS; p++) {
    atomic_store(&h->analog_level[p][0], 0u);
    atomic_store(&h->analog_level[p][1], 0u);
    atomic_store(&h->trigger_level[p], 0u);
    atomic_store(&h->analog_frame[p][0], 0u);
    atomic_store(&h->analog_frame[p][1], 0u);
    atomic_store(&h->trigger_frame[p], 0u);
  }
}

// Forgets which ports the core has read a stick on. Separate from
// reset_analog_state so a controller-type change can re-decide stick mode
// without zeroing a live deflection.
static void reset_analog_queries(struct lh_host *h) {
  atomic_store_explicit(&h->analog_queried_ports, 0u, memory_order_relaxed);
  atomic_store_explicit(&h->input_read_seen, 0u, memory_order_relaxed);
  atomic_store_explicit(&h->input_read_frames, 0u, memory_order_relaxed);
}

static void reset_controller_devices(struct lh_host *h) {
  for (int port = 0; port < LH_MAX_PORTS; port++) {
    atomic_store(&h->controller_devices[port], (unsigned)RETRO_DEVICE_JOYPAD);
  }
}

// SET_CONTROLLER_INFO is a borrowed, zero-terminated array. Cores often keep
// it in static storage, but the API permits them to replace it after this
// callback returns, so no pointer from it may escape this function. Build a
// complete new snapshot before publishing it, leaving a reader with either the
// old whole list or the new whole list (never a half-rebuilt list).
static bool copy_controller_info(struct lh_host *h,
                                 const struct retro_controller_info *info) {
  lh_controller_port *ports = calloc(LH_MAX_PORTS, sizeof(*ports));
  int stored_count = 0;
  int source_port = 0;
  if (!ports) {
    diagnostic_log("Failed to allocate controller info snapshot");
    return false;
  }

  for (;;) {
    if (source_port == INT_MAX) {
      diagnostic_log("Rejected controller info with too many ports");
      free_controller_ports(ports, stored_count);
      return false;
    }
    if (!info[source_port].types) break;

    const struct retro_controller_info *source = &info[source_port];
#if SIZE_MAX <= UINT_MAX
    if ((size_t)source->num_types > SIZE_MAX / sizeof(lh_controller_type)) {
      diagnostic_log("Rejected controller info for port %d with too many types",
                     source_port);
      free_controller_ports(ports, stored_count);
      return false;
    }
#endif

    lh_controller_type *types = NULL;
    if (source_port < LH_MAX_PORTS && source->num_types > 0) {
      types = calloc(source->num_types, sizeof(*types));
      if (!types) {
        diagnostic_log("Failed to copy controller info for port %d", source_port);
        free_controller_ports(ports, stored_count);
        return false;
      }
    }
    for (unsigned t = 0; t < source->num_types; t++) {
      const struct retro_controller_description *description = &source->types[t];
      if (source_port < LH_MAX_PORTS) {
        types[t].id = description->id;
        lh_copy_bounded(types[t].label, sizeof(types[t].label),
                        description->desc);
      }
      // Log every type rather than filtering to devices Moonfin currently
      // understands. In particular, retain this diagnostic for an extra core
      // port even though Moonfin currently exposes input only through P4.
      diagnostic_log("Controller capability port=%d id=%u label='%s'%s",
                     source_port, description->id,
                     description->desc && *description->desc ? description->desc
                                                              : "(unnamed)",
                     source_port < LH_MAX_PORTS ? "" : " (unsupported port)");
    }

    if (source_port < LH_MAX_PORTS) {
      ports[source_port].types = types;
      ports[source_port].type_count = source->num_types;
      stored_count = source_port + 1;
    }
    source_port++;
  }

  mutex_lock(&h->controller_info_lock);
  lh_controller_port *old_ports = h->controller_ports;
  int old_count = h->controller_port_count;
  h->controller_ports = ports;
  h->controller_port_count = stored_count;
  mutex_unlock(&h->controller_info_lock);
  free_controller_ports(old_ports, old_count);
  return true;
}

static int controller_device_is_advertised(struct lh_host *h, int port,
                                           unsigned device) {
  if (device == RETRO_DEVICE_JOYPAD) return 1;  // Auto/libretro default.
  int advertised = 0;
  mutex_lock(&h->controller_info_lock);
  if (port >= 0 && port < h->controller_port_count) {
    lh_controller_port *controller_port = &h->controller_ports[port];
    for (unsigned i = 0; i < controller_port->type_count; i++) {
      if (controller_port->types[i].id == device) {
        advertised = 1;
        break;
      }
    }
  }
  mutex_unlock(&h->controller_info_lock);
  return advertised;
}

// restart_core runs on the emulation thread after the new core has finished
// load_content and re-published its controller list. Re-check stored explicit
// IDs against that fresh list: a core version/content change can remove one,
// in which case preserving a stale value is less safe than returning to Auto.
static void reapply_controller_devices(struct lh_host *h) {
  for (int port = 0; port < LH_MAX_PORTS; port++) {
    unsigned device = atomic_load(&h->controller_devices[port]);
    if (!controller_device_is_advertised(h, port, device)) {
      diagnostic_log(
          "Controller device port=%d id=%u is no longer advertised after "
          "restart; using Auto (%u)",
          port, device, RETRO_DEVICE_JOYPAD);
      device = RETRO_DEVICE_JOYPAD;
      atomic_store(&h->controller_devices[port], device);
    }
    if (h->core.set_controller_port_device) {
      h->core.set_controller_port_device((unsigned)port, device);
    } else if (device != RETRO_DEVICE_JOYPAD) {
      diagnostic_log(
          "Controller device port=%d id=%u could not be reapplied; core has "
          "no controller-device entry point",
          port, device);
      atomic_store(&h->controller_devices[port], (unsigned)RETRO_DEVICE_JOYPAD);
    }
  }
}

// Reports an environment command this host does not serve, once per command.
// See the default case in environment_cb for why this is not silent.
static void note_unhandled_env(struct lh_host *h, unsigned cmd) {
  int count = atomic_load(&h->unhandled_env_count);
  if (count > LH_UNHANDLED_ENV_SLOTS) count = LH_UNHANDLED_ENV_SLOTS;
  for (int i = 0; i < count; i++) {
    if (h->unhandled_env[i] == cmd) return;
  }
  if (count < LH_UNHANDLED_ENV_SLOTS) {
    h->unhandled_env[count] = cmd;
    atomic_store(&h->unhandled_env_count, count + 1);
  }
  // The 0x800000 bit marks a libretro-common command and the 0x10000 bit an
  // experimental one; printing the raw value keeps both greppable against the
  // header.
  diagnostic_log("Environment command %u (0x%x) is not served by this host",
                 cmd, cmd);
}

// Handed to cores through RETRO_ENVIRONMENT_GET_CLEAR_ALL_THREAD_WAITS_CB. A
// core calls this around an operation that blocks its emulation thread:
// clear_threads non-zero before it blocks, zero once it is done.
//
// RetroArch starts and stops its audio driver here, because its threaded audio
// driver can leave a blocked core waiting on a consumer that never runs. This
// host has nothing to release: audio_batch_cb hands samples to audio_push,
// which drops rather than blocks when the ring is full, so a core inside
// retro_unserialize is never waiting on us. The work is genuinely zero.
//
// It still must EXIST. The out-param is a function pointer that cores call
// without a null check, so answering false and leaving it NULL is not a
// degraded mode, it is a crash inside the core (see the header note on the
// command). Returning a real no-op is the honest implementation, not a stub.
static bool RETRO_CALLCONV clear_all_thread_waits_cb(unsigned clear_threads,
                                                    void *data) {
  (void)clear_threads;
  (void)data;
  return true;
}

static bool RETRO_CALLCONV environment_cb(unsigned cmd, void *data) {
  struct lh_host *h = g_session;
  if (!h) return false;
  switch (cmd) {
    case RETRO_ENVIRONMENT_GET_CAN_DUPE:
      if (data) *(bool *)data = true;
      return true;
    case RETRO_ENVIRONMENT_SET_PERFORMANCE_LEVEL:
      return true;
    case RETRO_ENVIRONMENT_SHUTDOWN:
      // A core asks for this when a boot or a reset failed, and then answers
      // the next retro_run with a machine it never initialised. Stopping the
      // loop here is what keeps that frame from faulting inside the core.
      h->shutdown_requested = 1;
      h->running = 0;
      return true;
    case RETRO_ENVIRONMENT_SET_MESSAGE:
      if (!data) return false;
      deliver_message(h, ((const struct retro_message *)data)->msg);
      return true;
    case RETRO_ENVIRONMENT_SET_MESSAGE_EXT: {
      if (!data) return false;
      const struct retro_message_ext *msg =
          (const struct retro_message_ext *)data;
      // Log-only messages are not meant for the user.
      if (msg->target != RETRO_MESSAGE_TARGET_LOG) deliver_message(h, msg->msg);
      return true;
    }
    case RETRO_ENVIRONMENT_GET_MESSAGE_INTERFACE_VERSION:
      if (data) *(unsigned *)data = 1;
      return true;
    case RETRO_ENVIRONMENT_GET_SYSTEM_DIRECTORY:
      if (!data || !h->system_dir) return false;
      *(const char **)data = h->system_dir;
      return true;
    case RETRO_ENVIRONMENT_SET_PIXEL_FORMAT: {
      if (!data) return false;
      unsigned fmt = *(const unsigned *)data;
      if (fmt > RETRO_PIXEL_FORMAT_RGB565) return false;
      h->pixel_format = fmt;
      return true;
    }
    case RETRO_ENVIRONMENT_SET_INPUT_DESCRIPTORS:
      return data && copy_input_descriptors(
                         h, (const struct retro_input_descriptor *)data);
    case RETRO_ENVIRONMENT_SET_CONTROLLER_INFO:
      return data && copy_controller_info(
                         h, (const struct retro_controller_info *)data);
    case RETRO_ENVIRONMENT_SET_HW_RENDER:
      return false;  // software rendering only
    case RETRO_ENVIRONMENT_GET_VARIABLE: {
      if (!data) return false;
      struct retro_variable *var = (struct retro_variable *)data;
      if (!var->key) return false;
      mutex_lock(&h->vars_lock);
      const char *value = vars_get(h, var->key);
      // Owned by the host and readable for the life of this load. The core
      // may keep this pointer across frames: a later lh_set_option on the
      // platform thread swaps in a new string and retires the old one (see
      // vars_retire) rather than freeing it, precisely because the core is
      // still allowed to be reading it here. Only the contents can go stale,
      // never the memory; a core that wants the new value re-polls after
      // GET_VARIABLE_UPDATE.
      var->value = value;
      mutex_unlock(&h->vars_lock);
      return value != NULL;
    }
    case RETRO_ENVIRONMENT_SET_VARIABLES: {
      if (!data) return false;
      const struct retro_variable *cursor =
          (const struct retro_variable *)data;
      mutex_lock(&h->vars_lock);
      while (cursor->key && cursor->value) {
        // A core is allowed to publish dozens of options, so one allocation
        // failure partway through shouldn't stop parsing the rest (later
        // entries are independent and may still succeed) - but it does mean
        // the option set is now incomplete, so the load has to be failed
        // once open_core/load_content return control to lh_load. Keep
        // parsing instead of bailing out here so h->def_count reflects
        // whatever really was parsed, which matters if a caller ever
        // inspects options after logging the failure.
        if (parse_variable(h, cursor->key, cursor->value) != 0) {
          h->alloc_failed = 1;
        }
        cursor++;
      }
      h->variables_dirty = 1;
      mutex_unlock(&h->vars_lock);
      return true;
    }
    case RETRO_ENVIRONMENT_GET_VARIABLE_UPDATE: {
      mutex_lock(&h->vars_lock);
      int dirty = h->variables_dirty;
      h->variables_dirty = 0;
      mutex_unlock(&h->vars_lock);
      if (data) *(bool *)data = dirty != 0;
      return true;
    }
    case RETRO_ENVIRONMENT_GET_SAVE_DIRECTORY:
      if (!data || !h->save_dir) return false;
      *(const char **)data = h->save_dir;
      return true;
    case RETRO_ENVIRONMENT_SET_SYSTEM_AV_INFO: {
      if (!data) return false;
      const struct retro_system_av_info *av =
          (const struct retro_system_av_info *)data;
      notify_geometry(h, av->geometry.base_width, av->geometry.base_height,
                      av->geometry.aspect_ratio);
      return true;
    }
    case RETRO_ENVIRONMENT_SET_GEOMETRY: {
      if (!data) return false;
      const struct retro_game_geometry *geo =
          (const struct retro_game_geometry *)data;
      notify_geometry(h, geo->base_width, geo->base_height, geo->aspect_ratio);
      return true;
    }
    case RETRO_ENVIRONMENT_SET_ROTATION: {
      // Vertically-oriented arcade cabinets (and a few console games) ask the
      // frontend to rotate. The host bakes it into convert_frame instead of
      // asking every platform for a GPU transform.
      if (!data) return false;
      unsigned rot = *(const unsigned *)data;
      if (rot > 3) return false;
      int was_quarter = (h->av.rotation == 1 || h->av.rotation == 3);
      int is_quarter = (rot == 1 || rot == 3);
      h->av.rotation = (int)rot;
      // diagnostic_log, not host_log: every vertical cabinet sends this on a
      // normal load, and host_log surfaces it as a user-facing core message.
      diagnostic_log("SET_ROTATION rot=%u", rot);
      // Geometry recorded before this request describes the other orientation.
      // Only the axes move; the aspect the core reported already describes the
      // final display (see apply_rotation_to_av).
      if (was_quarter != is_quarter && h->av.width > 0) {
        int w = h->av.width;
        h->av.width = h->av.height;
        h->av.height = w;
        // Keep notify_geometry's record in step with what the platform has
        // actually been told, so the core's next SET_GEOMETRY is judged
        // against these swapped dimensions.
        h->notified_width = h->av.width;
        h->notified_height = h->av.height;
        h->notified_aspect = h->av.aspect;
        if (h->cb.geometry_changed) {
          h->cb.geometry_changed(h->cb.user, h->av.width, h->av.height,
                                 h->av.aspect);
        }
      }
      return true;
    }
    case RETRO_ENVIRONMENT_GET_LANGUAGE:
      if (data) *(unsigned *)data = RETRO_LANGUAGE_ENGLISH;
      return true;
    case RETRO_ENVIRONMENT_GET_AUDIO_VIDEO_ENABLE:
      if (data) *(int *)data = 3;  // video + audio
      return true;
    case RETRO_ENVIRONMENT_GET_FASTFORWARDING:
      if (data) *(bool *)data = h->fast_forward > 1;
      return true;
    case RETRO_ENVIRONMENT_GET_INPUT_BITMASKS:
      return true;
    case RETRO_ENVIRONMENT_GET_CORE_OPTIONS_VERSION:
      if (data) *(unsigned *)data = 0;  // force legacy SET_VARIABLES
      return true;
    case RETRO_ENVIRONMENT_GET_LOG_INTERFACE:
      if (!data) return false;
      ((struct retro_log_callback *)data)->log = log_printf_cb;
      return true;
    case RETRO_ENVIRONMENT_GET_VFS_INTERFACE: {
      if (!data) return false;
      struct retro_vfs_interface_info *info =
          (struct retro_vfs_interface_info *)data;
      if (info->required_interface_version > 3) return false;
      info->required_interface_version = 3;
      info->iface = (struct retro_vfs_interface *)&g_vfs_interface;
      return true;
    }
    case RETRO_ENVIRONMENT_GET_PREFERRED_HW_RENDER:
      return false;
    case RETRO_ENVIRONMENT_GET_CLEAR_ALL_THREAD_WAITS_CB: {
      // Write the out-param before anything else can return early: a core
      // that gets false here still calls whatever is in its variable.
      if (!data) return false;
      *(retro_environment_t *)data = clear_all_thread_waits_cb;
      return true;
    }
    default:
      // Silence here cost hours once already: mupen64plus-next asked for the
      // command above, got a quiet false, and jumped to address 0 four frames
      // into a save-state load. An unserved command is not necessarily a bug,
      // so this is a diagnostic rather than a host_log, but it must be
      // visible. Reported once per command for the life of this host - the
      // core asks during set_environment, before any load, so a per-load reset
      // would only re-report what it just reported. Cores probe the same
      // handful every frame and a per-call line would bury the log.
      note_unhandled_env(h, cmd);
      return false;
  }
}

// ---------------------------------------------------------------------------
// Video.
// ---------------------------------------------------------------------------

static void pack_pixel(struct lh_host *h, uint8_t *dst, unsigned r, unsigned g,
                       unsigned b) {
  uint32_t word = h->format == LH_FORMAT_BGRA8888
                      ? (0xFF000000u | (r << 16) | (g << 8) | b)
                      : (0xFF000000u | (b << 16) | (g << 8) | r);
  memcpy(dst, &word, 4);
}

// Decodes one source pixel of [fmt] into 8-bit r/g/b. [fmt] is constant for
// the whole frame, so this branch predicts perfectly; it is not the cost
// convert_frame's rewrite targets (see the comment below).
static void unpack_pixel(unsigned fmt, const uint8_t *p, unsigned *r,
                         unsigned *g, unsigned *b) {
  if (fmt == RETRO_PIXEL_FORMAT_XRGB8888) {
    uint32_t v;
    memcpy(&v, p, 4);
    *r = (v >> 16) & 0xFF;
    *g = (v >> 8) & 0xFF;
    *b = v & 0xFF;
  } else if (fmt == RETRO_PIXEL_FORMAT_RGB565) {
    uint16_t v;
    memcpy(&v, p, 2);
    unsigned r5 = (v >> 11) & 0x1F, g6 = (v >> 5) & 0x3F, b5 = v & 0x1F;
    *r = (r5 << 3) | (r5 >> 2);
    *g = (g6 << 2) | (g6 >> 4);
    *b = (b5 << 3) | (b5 >> 2);
  } else {  // 0RGB1555
    uint16_t v;
    memcpy(&v, p, 2);
    unsigned r5 = (v >> 10) & 0x1F, g5 = (v >> 5) & 0x1F, b5 = v & 0x1F;
    *r = (r5 << 3) | (r5 >> 2);
    *g = (g5 << 3) | (g5 >> 2);
    *b = (b5 << 3) | (b5 >> 2);
  }
}

static int convert_frame(struct lh_host *h, const void *src, int width,
                         int height, size_t pitch) {
  const int bpp = h->pixel_format == RETRO_PIXEL_FORMAT_XRGB8888 ? 4 : 2;

  // `pitch` is whatever the core passed to video_refresh_cb; convert_frame
  // reads `src_bytes + y*pitch + x*bpp` for every row below. A pitch smaller
  // than one full row of pixels (width*bpp) would make that read walk into
  // the next row's data - or, on the last scanline, off the end of the
  // buffer entirely - which is an out-of-bounds read the core fully controls.
  // Reject it here rather than trusting the core to report a sane pitch.
  if (pitch < (size_t)width * (size_t)bpp) {
    diagnostic_log("Rejected frame: pitch %zu too small for %dx%d bpp %d", pitch,
             width, height, bpp);
    return 0;
  }

  const int rotation = h->av.rotation;
  const int quarter = (rotation == 1 || rotation == 3);
  const int out_width = quarter ? height : width;
  const int out_height = quarter ? width : height;

  // Overflow-safe size computation. notify_geometry/video_refresh_cb already
  // reject any width/height over LH_MAX_FRAME_DIMENSION before a frame gets
  // here, which keeps out_width*out_height*4 comfortably under 2^32 - but
  // that bound lives in the callers, not in this function's own contract.
  // Check by division (which cannot itself overflow) rather than by
  // multiplying and inspecting the result, so a future caller that forgets to
  // validate still fails safely here instead of silently wrapping size_t into
  // an undersized allocation while the pixel loop below keeps writing the
  // full, un-wrapped pixel count (the 32-bit armeabi-v7a heap overflow this
  // guards against).
  if (out_height <= 0 || out_width <= 0 ||
      (size_t)out_width > (SIZE_MAX / 4) / (size_t)out_height) {
    diagnostic_log("Rejected frame: %dx%d overflows frame buffer size", out_width,
             out_height);
    return 0;
  }
  size_t needed = (size_t)out_width * (size_t)out_height * 4;
  if (h->back.capacity < needed) {
    uint8_t *data = realloc(h->back.data, needed);
    if (!data) return 0;
    h->back.data = data;
    h->back.capacity = needed;
  }

  // dst_row0 is the destination index a (x=0, y=0) source pixel maps to;
  // step_x/step_y are how that index moves as x/y advance by one. Both are
  // constant for the whole frame, derived once here instead of re-running
  // this switch - and the index multiply it replaces - for every pixel.
  // libretro's SET_ROTATION counts quarter turns counter-clockwise, so a 90
  // degree turn sends the source's right-hand column to the top row.
  //
  // A tiled/blocked write was also tried here for the quarter-turn case
  // (rotations 1 and 3, where step_x is +-out_width*4 bytes and consecutive
  // source pixels land on different destination cache lines). Measured
  // against this plain accumulating walk on x86-64 at 512x480, tiling
  // through a scratch buffer was consistently slower - about 25% - because
  // it doubles the stores per pixel (once into the scratch tile, once out to
  // the real destination) for a locality win that a modern desktop's cache
  // hierarchy doesn't need. It was dropped in favor of this simpler,
  // measured-faster loop; ARM Cortex-A55 class hardware couldn't be measured
  // directly, but the doubled-store cost is architecture independent while
  // the cache benefit is not guaranteed to outweigh it there either.
  ptrdiff_t dst_row0, step_x, step_y;
  switch (rotation) {
    case 1:  // 90 CCW
      dst_row0 = (ptrdiff_t)(width - 1) * out_width;
      step_x = -(ptrdiff_t)out_width;
      step_y = 1;
      break;
    case 2:  // 180
      dst_row0 = (ptrdiff_t)(height - 1) * out_width + (width - 1);
      step_x = -1;
      step_y = -(ptrdiff_t)out_width;
      break;
    case 3:  // 270 CCW
      dst_row0 = height - 1;
      step_x = out_width;
      step_y = -1;
      break;
    default:  // 0
      dst_row0 = 0;
      step_x = 1;
      step_y = out_width;
      break;
  }

  const uint8_t *src_bytes = (const uint8_t *)src;
  uint8_t *back = h->back.data;
  unsigned fmt = h->pixel_format;
  ptrdiff_t row_dst = dst_row0;
  for (int y = 0; y < height; y++) {
    const uint8_t *s = src_bytes + (size_t)y * pitch;
    ptrdiff_t dst = row_dst;
    for (int x = 0; x < width; x++) {
      unsigned r, g, b;
      unpack_pixel(fmt, s + (size_t)x * bpp, &r, &g, &b);
      pack_pixel(h, back + (size_t)dst * 4, r, g, b);
      dst += step_x;
    }
    row_dst += step_y;
  }
  h->back.width = out_width;
  h->back.height = out_height;
  return 1;
}

static void RETRO_CALLCONV video_refresh_cb(const void *data, unsigned width,
                                            unsigned height, size_t pitch) {
  struct lh_host *h = g_session;
  if (!h || width == 0 || height == 0) return;
  // Reject an out-of-bounds frame here, before it ever reaches convert_frame's
  // allocation math. width/height come straight from the core on every frame
  // (unlike notify_geometry's SET_SYSTEM_AV_INFO/SET_GEOMETRY, this path has
  // no separate announcement step to reject first), so the same
  // LH_MAX_FRAME_DIMENSION bound has to be enforced here too.
  if (width > LH_MAX_FRAME_DIMENSION || height > LH_MAX_FRAME_DIMENSION) {
    diagnostic_log("Rejected frame %ux%u (out of bounds)", width, height);
    return;
  }
  if (!data) {  // duped frame: re-signal the last one
    if (h->cb.frame_ready) h->cb.frame_ready(h->cb.user);
    return;
  }
  mutex_lock(&h->video_lock);
  // pitch stays a size_t end to end (see convert_frame): truncating it to int
  // here would let a core report a huge real pitch that wraps to something
  // small and passes convert_frame's `pitch < width*bpp` rejection check by
  // accident, defeating FIX 3 instead of enforcing it.
  int converted = convert_frame(h, data, (int)width, (int)height, pitch);
  if (converted) h->back_ready = 1;
  mutex_unlock(&h->video_lock);
  if (converted && h->cb.frame_ready) h->cb.frame_ready(h->cb.user);
}

// ---------------------------------------------------------------------------
// Audio.
// ---------------------------------------------------------------------------

static void audio_push(struct lh_host *h, const int16_t *data, int frames) {
  mutex_lock(&h->audio_lock);
  int capacity = h->ring_capacity;
  if (capacity > 0) {
    int samples = frames * 2;
    if (samples > capacity - h->ring_stored) samples = capacity - h->ring_stored;
    for (int i = 0; i < samples; i++) {
      h->ring[h->ring_write] = data[i];
      h->ring_write = (h->ring_write + 1) % capacity;
    }
    h->ring_stored += samples;
  }
  mutex_unlock(&h->audio_lock);
}

static double buffered_seconds(struct lh_host *h) {
  mutex_lock(&h->audio_lock);
  int frames = h->ring_stored / 2;
  mutex_unlock(&h->audio_lock);
  return h->av.sample_rate > 0 ? (double)frames / h->av.sample_rate : 0;
}

static size_t RETRO_CALLCONV audio_batch_cb(const int16_t *data,
                                            size_t frames) {
  struct lh_host *h = g_session;
  if (!h || !data || frames == 0) return frames;
  // audio_push doubles this for stereo sample count and stores it in an int,
  // so anything that wouldn't fit after doubling must be clamped here, before
  // the (int) cast below can turn a huge frame count negative. No real core
  // reports anything close to this many frames in one callback; this is
  // purely a guard against untrusted core input.
  size_t clamped = frames > (size_t)(INT_MAX / 2) ? (size_t)(INT_MAX / 2) : frames;
  if (h->fast_forward <= 1) audio_push(h, data, (int)clamped);
  return frames;
}

static void RETRO_CALLCONV audio_sample_cb(int16_t left, int16_t right) {
  int16_t frame[2] = {left, right};
  audio_batch_cb(frame, 1);
}

// ---------------------------------------------------------------------------
// Input.
// ---------------------------------------------------------------------------

// Packing helpers for the analog and trigger atomics: two int16 halves share
// one 32-bit word so a diagonal (or an L2/R2 pair) read many times per frame
// can never tear across two independently-updated atomics.
static inline uint32_t pack_axes(int16_t x, int16_t y) {
  return ((uint32_t)(uint16_t)x << 16) | (uint16_t)y;
}
static inline int16_t unpack_x(uint32_t v) { return (int16_t)(v >> 16); }
static inline int16_t unpack_y(uint32_t v) { return (int16_t)(v & 0xffff); }

#define LH_INPUT_MASK UINT32_C(0xffff)
#define LH_INPUT_UNACK_SHIFT 16

static inline unsigned pack_input_frame(uint16_t frame, uint16_t unacked) {
  return (unsigned)frame | ((unsigned)unacked << LH_INPUT_UNACK_SHIFT);
}

// Reset the digital lifecycle state without changing the latest physical
// level. This is called when a session/core is replaced and on the emulation
// thread before the first frame after resume. Keeping the level means a
// genuinely held button remains held, while pending edges and stale
// acknowledgments from the previous lifecycle cannot leak into the new one.
static void reset_digital_input(struct lh_host *h) {
  for (int p = 0; p < LH_MAX_PORTS; p++) {
    atomic_store(&h->input_transitions[p], 0u);
    unsigned level = atomic_load(&h->input_level[p]) & LH_INPUT_MASK;
    atomic_store_explicit(&h->input_frame[p],
                          pack_input_frame((uint16_t)level, 0),
                          memory_order_release);
    memset(h->unacked_age[p], 0, sizeof(h->unacked_age[p]));
  }
}

static void apply_resume_request(struct lh_host *h) {
  if (atomic_exchange(&h->resume_requested, 0)) reset_digital_input(h);
}

// Publish the latest analog values. Analog is a level, not an edge, and may be
// refreshed by a core's input_poll without changing digital transition state.
static void latch_analog(struct lh_host *h) {
  for (int p = 0; p < LH_MAX_PORTS; p++) {
    atomic_store_explicit(&h->analog_frame[p][0],
                          atomic_load(&h->analog_level[p][0]),
                          memory_order_release);
    atomic_store_explicit(&h->analog_frame[p][1],
                          atomic_load(&h->analog_level[p][1]),
                          memory_order_release);
    atomic_store_explicit(&h->trigger_frame[p],
                          atomic_load(&h->trigger_level[p]),
                          memory_order_release);
  }
}

// The one implementation of the digital transition latch. Every platform
// writer records one pending DOWN and one pending UP bit per button. The run
// loop calls this once per frontend frame; a core's input_poll callback only
// refreshes analog values and must not consume another digital transition in
// the same retro_run.
// Only the run loop (and the test hook standing in for it) calls this, so the
// expiry clock advances exactly once per frontend frame.
static void latch_input(struct lh_host *h) {
  for (int p = 0; p < LH_MAX_PORTS; p++) {
    unsigned queued = atomic_exchange(&h->input_transitions[p], 0u);
    unsigned downs = queued & LH_INPUT_MASK;
    unsigned ups = queued >> LH_INPUT_UNACK_SHIFT;
    unsigned level = atomic_load(&h->input_level[p]) & 0xffffu;
    unsigned published = atomic_load_explicit(&h->input_frame[p],
                                              memory_order_acquire);
    unsigned frame = published & LH_INPUT_MASK;
    unsigned blocked = published >> LH_INPUT_UNACK_SHIFT;
    unsigned ready = ~blocked & 0xffffu;
    unsigned go_down = downs & ~frame & ready;
    unsigned go_up = ups & frame & ready;

    // Both directions may be pending for one button. Its current published
    // state determines their order: UP then DOWN when currently held, DOWN
    // then UP when currently released. Requeue the second edge for the next
    // frame instead of collapsing it into the current level.
    // Same-state edges are redundant unless the opposite edge is also
    // pending; in that case they are the second half of a real transition
    // pair and must remain queued. A blocked transition is always retained.
    unsigned deferred_downs = downs & (blocked | (frame & ups));
    unsigned deferred_ups = ups & (blocked | (~frame & downs));
    unsigned applied = go_down | go_up;
    unsigned next = (frame | go_down) & ~go_up;

    // If more than one cycle arrived in this window, the two direction masks
    // cannot count every edge. Preserve the final physical level after the
    // retained opposite edge so a rapid tap ending in a hold cannot leave the
    // core stuck in the wrong state.
    deferred_downs |= go_down & ups & level;
    deferred_ups |= go_up & downs & ~level;
    if (deferred_downs || deferred_ups) {
      atomic_fetch_or(&h->input_transitions[p],
                      deferred_downs | (deferred_ups << LH_INPUT_UNACK_SHIFT));
    }

    unsigned unacked = blocked;
    if (applied != 0) {
      // Publish the transition and its acknowledgment barrier together. The
      // CAS preserves any concurrent core acknowledgment.
      unsigned expected = published;
      for (;;) {
        unsigned current_unacked = expected >> LH_INPUT_UNACK_SHIFT;
        unacked = current_unacked | applied;
        unsigned desired = pack_input_frame((uint16_t)next,
                                            (uint16_t)unacked);
        if (atomic_compare_exchange_weak_explicit(
                &h->input_frame[p], &expected, desired,
                memory_order_release, memory_order_acquire)) {
          break;
        }
      }
    }

    // Age each button independently. Activity on A must not keep an unread B
    // transition alive forever and block B's queued opposite edge.
    unsigned expired = 0;
    for (unsigned id = 0; id < 16; id++) {
      unsigned bit = 1u << id;
      if (!(unacked & bit)) continue;
      if (applied & bit) {
        h->unacked_age[p][id] = 1;
      } else if (++h->unacked_age[p][id] > LH_UNACKED_MAX_POLLS) {
        expired |= bit;
        h->unacked_age[p][id] = 0;
      }
    }
    if (expired) {
      unsigned current = atomic_load_explicit(&h->input_frame[p],
                                              memory_order_acquire);
      for (;;) {
        unsigned desired = current &
                           ~(expired << LH_INPUT_UNACK_SHIFT);
        if (atomic_compare_exchange_weak_explicit(
                &h->input_frame[p], &current, desired,
                memory_order_release, memory_order_acquire)) {
          break;
        }
      }
    }
  }
  latch_analog(h);
  // Runs before retro_run, so the flag being rolled up here belongs to the
  // frame that just finished - by which point every read it made is in.
  if (atomic_exchange_explicit(&h->input_read_seen, 0u, memory_order_relaxed)) {
    unsigned seen = atomic_load_explicit(&h->input_read_frames,
                                         memory_order_relaxed);
    if (seen < LH_ANALOG_DECIDE_FRAMES) {
      atomic_store_explicit(&h->input_read_frames, seen + 1,
                            memory_order_relaxed);
    }
  }
}

// The run loop has already advanced digital input for this retro_run. Keep
// this callback for core diagnostics and analog snapshot refresh, but do not
// consume a second digital transition when a compliant core calls it.
static void RETRO_CALLCONV input_poll_cb(void) {
  struct lh_host *h = g_session;
  if (!h) return;
  atomic_store(&h->input_poll_thread, current_thread_id());
  atomic_store(&h->input_poll_thread_known, 1);
  latch_analog(h);
}

// Flags a core reading input from a thread other than the one that latched
// it. Reported once, then counted silently - a core that does this does it
// every frame, and the count is what the harness asserts on.
static void note_input_thread(struct lh_host *h) {
  if (!atomic_load(&h->input_poll_thread_known)) return;
  uint64_t polled = (uint64_t)atomic_load(&h->input_poll_thread);
  uint64_t reading = current_thread_id();
  if (polled == reading) return;
  if (atomic_fetch_add(&h->input_thread_mismatch, 1) == 0) {
    diagnostic_log(
        "Core reads input on thread %llu but it was latched on %llu; the "
        "published frame is atomic, so this is safe - noted because any "
        "non-atomic state added alongside it would not be",
        (unsigned long long)reading, (unsigned long long)polled);
  }
}

// A read of [port]'s digital frame, acknowledging only [ack_mask]. Both DOWN
// and zero-valued UP transitions require acknowledgment before the opposite
// transition may advance. Held state remains in the low half of input_frame;
// acknowledgment never releases a physically held button.
//
// The SCOPE matters, and getting it wrong loses presses. A core that queries
// buttons one id at a time must acknowledge only the id it asked for: if an
// early query for B acknowledged Start too, a poll landing before the core got
// round to querying Start would drop it from the frame, and the press would be
// gone by the time it was asked for. That interleaving is not hypothetical -
// polling and reading are on different threads for any core with a threaded
// renderer. Only RETRO_DEVICE_ID_JOYPAD_MASK, which hands the core every bit
// at once, may acknowledge the lot.
static uint16_t observe_input_bits(struct lh_host *h, int port,
                                   unsigned ack_mask) {
  unsigned observed = atomic_load_explicit(&h->input_frame[port],
                                           memory_order_acquire);
  uint16_t mask = (uint16_t)(observed & LH_INPUT_MASK);
  if (ack_mask) {
    unsigned expected = observed;
    for (;;) {
      unsigned ack = (expected >> LH_INPUT_UNACK_SHIFT) & ack_mask;
      if (ack == 0) return mask;
      unsigned desired = expected & ~(ack << LH_INPUT_UNACK_SHIFT);
      if (atomic_compare_exchange_weak_explicit(
              &h->input_frame[port], &expected, desired,
              memory_order_acq_rel, memory_order_acquire)) {
        break;
      }
      // A concurrent latch or acknowledgment changed the word. Retry from the
      // newer snapshot and return exactly the state eventually acknowledged.
      mask = (uint16_t)(expected & LH_INPUT_MASK);
    }
  }
  return mask;
}

// The JOYPAD read, in one place. input_state_cb and the test hooks both go
// through here so the acknowledgment scope is decided once and can actually be
// regression-tested; a hook that reached past this into observe_input_bits
// would happily keep passing while the dispatch above it broke.
static int16_t read_joypad(struct lh_host *h, int port, unsigned id) {
  // Only a MASK query delivers every bit, so only it may acknowledge them all.
  unsigned ack = id == RETRO_DEVICE_ID_JOYPAD_MASK ? 0xFFFFu
                 : id < 16                         ? (1u << id)
                                                   : 0u;
  uint16_t mask = observe_input_bits(h, port, ack);
  if (id == RETRO_DEVICE_ID_JOYPAD_MASK) return (int16_t)mask;
  if (id >= 16) return 0;
  return (mask & (1u << id)) ? 1 : 0;
}


static int16_t RETRO_CALLCONV input_state_cb(unsigned port, unsigned device,
                                             unsigned index, unsigned id) {
  struct lh_host *h = g_session;
  if (!h || port >= LH_MAX_PORTS) return 0;
  note_input_thread(h);
  // Any read counts, not just an analog one: this records that the core polls
  // input at all, which is what makes its silence about the stick meaningful.
  if (!atomic_load_explicit(&h->input_read_seen, memory_order_relaxed)) {
    atomic_store_explicit(&h->input_read_seen, 1u, memory_order_relaxed);
  }

  if (device == RETRO_DEVICE_ANALOG) {
    // Snapshot by the run-loop latch and refreshed by input_poll_cb, rather
    // than read as two separate live axis values that could tear.
    if (index == RETRO_DEVICE_INDEX_ANALOG_LEFT ||
        index == RETRO_DEVICE_INDEX_ANALOG_RIGHT) {
      // Only a STICK read counts; ANALOG_BUTTON is trigger pressure. Cores
      // read these ~56x/frame, so only the first read on a port pays the RMW.
      unsigned bit = 1u << port;
      if (!(atomic_load_explicit(&h->analog_queried_ports,
                                 memory_order_relaxed) &
            bit)) {
        atomic_fetch_or_explicit(&h->analog_queried_ports, bit,
                                 memory_order_relaxed);
      }
      uint32_t packed = atomic_load_explicit(&h->analog_frame[port][index],
                                             memory_order_acquire);
      if (id == RETRO_DEVICE_ID_ANALOG_X) return unpack_x(packed);
      if (id == RETRO_DEVICE_ID_ANALOG_Y) return unpack_y(packed);
      return 0;
    }
    if (index == RETRO_DEVICE_INDEX_ANALOG_BUTTON) {
      if (id == RETRO_DEVICE_ID_JOYPAD_L2) {
        return unpack_x(atomic_load_explicit(&h->trigger_frame[port],
                                            memory_order_acquire));
      }
      if (id == RETRO_DEVICE_ID_JOYPAD_R2) {
        return unpack_y(atomic_load_explicit(&h->trigger_frame[port],
                                            memory_order_acquire));
      }
      // Derived, not stored: every other analog-button id just reflects the
      // matching digital bit at full deflection, so a core reading this
      // plane instead of JOYPAD directly still sees the button.
      if (id >= 16) return 0;
      // Acknowledges this id alone, like the JOYPAD path: a core reading only
      // this plane still acknowledges, but never on another button's behalf.
      return (observe_input_bits(h, (int)port, 1u << id) & (1u << id))
                 ? 0x7fff
                 : 0;
    }
    return 0;
  }

  if (device != RETRO_DEVICE_JOYPAD) return 0;
  // Latched by the host before retro_run. Each read observes one complete
  // atomic mask rather than independently sampled button bits.
  return read_joypad(h, (int)port, id);
}

// ---------------------------------------------------------------------------
// Jobs.
// ---------------------------------------------------------------------------

static void execute_job(struct lh_host *h, lh_job *job) {
  switch (job->kind) {
    case JOB_RESET:
      if (h->core.reset) h->core.reset();
      break;
    case JOB_RESTART:
      job->result_ok = restart_core(h) == 0;
      if (!job->result_ok) {
        // restart_core already set h->running = 0 on failure, which would
        // otherwise freeze the picture with no signal to the platform layer.
        // Mirror the async restart path (run_loop's restart_requested
        // handling) so a synchronous lh_restart failure is reported the
        // same way.
        if (h->cb.message) {
          h->cb.message(h->cb.user, "Failed to restart libretro core");
        }
        if (h->cb.fatal_error) {
          h->cb.fatal_error(h->cb.user, "Failed to restart libretro core");
        }
      }
      break;
    case JOB_SERIALIZE_SIZE:
      job->result_size = h->core.serialize_size ? h->core.serialize_size() : 0;
      break;
    case JOB_SERIALIZE:
      job->result_ok =
          h->core.serialize && h->core.serialize(job->buf, job->size) ? 1 : 0;
      break;
    case JOB_UNSERIALIZE:
      job->result_ok =
          h->core.unserialize && h->core.unserialize(job->cbuf, job->size) ? 1
                                                                           : 0;
      break;
    case JOB_CONTROLLER_DEVICE:
      if (h->core.set_controller_port_device) {
        h->core.set_controller_port_device((unsigned)job->port, job->device);
        atomic_store(&h->controller_devices[job->port], job->device);
        // The signal only latches ON, so without this a game switched from
        // paddles back to a joystick would keep its stick in analog mode.
        reset_analog_queries(h);
        job->result_ok = 1;
      }
      break;
  }
}

// Runs [job] on the emulation thread and waits, or inline when no loop runs.
// A full queue or a loop that already exited gives up instead of waiting, since
// nothing would ever mark the job done.
static int run_job(struct lh_host *h, lh_job *job) {
  mutex_lock(&h->jobs_lock);
  if (h->jobs_open) {
    if (h->job_count < LH_MAX_JOBS) {
      h->jobs[h->job_count++] = job;
      while (!job->done) cond_wait(&h->jobs_cond, &h->jobs_lock);
      mutex_unlock(&h->jobs_lock);
      return 0;
    }
    mutex_unlock(&h->jobs_lock);
    return -1;
  }
  int loaded = h->core_loaded;
  mutex_unlock(&h->jobs_lock);
  if (!loaded) return -1;
  execute_job(h, job);
  return 0;
}

static void drain_jobs(struct lh_host *h) {
  mutex_lock(&h->jobs_lock);
  lh_job *pending[LH_MAX_JOBS];
  int count = h->job_count;
  for (int i = 0; i < count; i++) pending[i] = h->jobs[i];
  h->job_count = 0;
  mutex_unlock(&h->jobs_lock);

  for (int i = 0; i < count; i++) {
    execute_job(h, pending[i]);
    mutex_lock(&h->jobs_lock);
    pending[i]->done = 1;
    cond_broadcast(&h->jobs_cond);
    mutex_unlock(&h->jobs_lock);
  }
}

// ---------------------------------------------------------------------------
// SRAM.
// ---------------------------------------------------------------------------

static void sram_load(struct lh_host *h) {
  if (!h->sram_path || !h->core.get_memory_size || !h->core.get_memory_data) {
    return;
  }
  size_t size = h->core.get_memory_size(RETRO_MEMORY_SAVE_RAM);
  void *mem = h->core.get_memory_data(RETRO_MEMORY_SAVE_RAM);
  if (size == 0 || !mem) return;
  FILE *f = fopen(h->sram_path, "rb");
  if (!f) return;
  size_t got = fread(mem, 1, size, f);
  fclose(f);
  if (got < size) {
    // A truncated .srm otherwise leaves the tail of SRAM at whatever
    // retro_init put there, silently.
    host_log(h, "sram_load: read %zu of %zu expected bytes from %s", got,
             size, h->sram_path);
  }
}

static void sram_flush(struct lh_host *h) {
  h->last_sram_flush_ns = now_ns();
  if (!h->sram_path || !h->core.get_memory_size || !h->core.get_memory_data) {
    return;
  }
  size_t size = h->core.get_memory_size(RETRO_MEMORY_SAVE_RAM);
  void *mem = h->core.get_memory_data(RETRO_MEMORY_SAVE_RAM);
  if (size == 0 || !mem) return;
  FILE *f = fopen(h->sram_path, "wb");
  if (!f) return;
  fwrite(mem, 1, size, f);
  fclose(f);
}

// ---------------------------------------------------------------------------
// Run loop.
// ---------------------------------------------------------------------------

static void *run_loop(void *arg) {
  struct lh_host *h = (struct lh_host *)arg;
  const uint64_t frame_ns =
      (uint64_t)(1000000000.0 / (h->av.fps > 0 ? h->av.fps : 60.0));
  const double pace_seconds = 0.05;
  uint64_t next = now_ns();

  while (h->running) {
    if (atomic_exchange(&h->restart_requested, 0)) {
      if (restart_core(h) != 0) {
        if (h->cb.message) {
          h->cb.message(h->cb.user, "Failed to restart libretro core");
        }
        if (h->cb.fatal_error) {
          h->cb.fatal_error(h->cb.user, "Failed to restart libretro core");
        }
      }
      continue;
    }
    apply_resume_request(h);
    if (atomic_load(&h->paused)) {
      sleep_ns(16000000);
      drain_jobs(h);
      continue;
    }
    int iterations = h->fast_forward;
    for (int i = 0; i < iterations && h->running; i++) {
      // Latch here rather than trusting the core to call input_poll.
      //
      // libretro REQUIRES a core to call it: "During retro_run(), the
      // retro_input_poll_t callback must be called at least once"
      // (libretro.h). mupen64plus-next does not always honour that: its
      // libretro.c declares poll_cb as a non-static global and never invokes
      // it, and with its threaded renderer enabled nothing else does either.
      // With that renderer OFF the same core polls fine, so something in
      // another translation unit reaches poll_cb on that path - which was
      // never established. Either way this is the host defensively
      // accommodating a core that can break the contract, not filling a gap
      // the API leaves open.
      //
      // latch_input is the only writer of input_frame, so such a core
      // received NO input at all. Measured on device: the poll heartbeat in
      // input_poll_cb stayed silent for an entire session while presses were
      // provably reaching lh_set_input.
      //
      // This is the only digital latch for the frame. A compliant core's
      // input_poll callback may refresh analog state, but it must not consume
      // another queued digital transition inside the same retro_run.
      latch_input(h);
      if (h->core.run) h->core.run();
    }
    drain_jobs(h);
    if (!h->running) break;
    if (now_ns() - h->last_sram_flush_ns > 30000000000ull) sram_flush(h);

    if (h->audio_paced) {
      double buffered = buffered_seconds(h);
      if (buffered < pace_seconds * 0.5) {
        // Priming, underrun, or fast forward: refill without sleeping.
        next = now_ns();
      } else {
        // Frames come out strictly periodically, and a small feedback term
        // nudges the period so the ring settles at the target and the
        // emulation rate locks to the audio device clock. Ahead of audio means
        // a slightly longer period, behind means slightly shorter.
        double err = (buffered - pace_seconds) / pace_seconds;
        if (err > 0.25) err = 0.25;
        if (err < -0.25) err = -0.25;
        uint64_t period = (uint64_t)((double)frame_ns * (1.0 + 0.1 * err));
        next += period;
        uint64_t t = now_ns();
        if (next > t) {
          sleep_ns(next - t);
        } else {
          next = t;
        }
      }
    } else {
      next += frame_ns;
      uint64_t t = now_ns();
      if (next > t) {
        sleep_ns(next - t);
      } else {
        next = t;
      }
    }
  }

  // Close the queue before touching the core, so a job that arrives while this
  // thread is unloading is refused rather than run against a freed library.
  mutex_lock(&h->jobs_lock);
  h->jobs_open = 0;
  h->core_loaded = 0;
  for (int i = 0; i < h->job_count; i++) h->jobs[i]->done = 1;
  h->job_count = 0;
  cond_broadcast(&h->jobs_cond);
  mutex_unlock(&h->jobs_lock);

  // A core that quit has no save worth keeping, and its memory pointers may
  // already be gone, so writing SRAM now would only risk the good file.
  if (!h->shutdown_requested) sram_flush(h);
  if (h->core.unload_game) h->core.unload_game();
  if (h->core.deinit) h->core.deinit();
  if (h->core.handle) lib_close(h->core.handle);
  memset(&h->core, 0, sizeof(h->core));
  clear_controller_info(h);
  clear_input_descriptors(h);

  // Reported last, once nothing in here touches the core any more.
  if (h->shutdown_requested && h->cb.core_shutdown) {
    h->cb.core_shutdown(h->cb.user);
  }
  return NULL;
}

#ifdef _WIN32
static DWORD WINAPI run_loop_win(LPVOID arg) {
  run_loop(arg);
  return 0;
}
#endif

static void thread_start(struct lh_host *h) {
#ifdef _WIN32
  h->thread = CreateThread(NULL, 0, run_loop_win, h, 0, NULL);
  h->has_thread = h->thread != NULL;
#else
  h->has_thread = pthread_create(&h->thread, NULL, run_loop, h) == 0;
#endif
}

static void thread_join(struct lh_host *h) {
  if (!h->has_thread) return;
#ifdef _WIN32
  WaitForSingleObject(h->thread, INFINITE);
  CloseHandle(h->thread);
#else
  pthread_join(h->thread, NULL);
#endif
  h->has_thread = 0;
}

// ---------------------------------------------------------------------------
// Symbol resolution.
// ---------------------------------------------------------------------------

static int resolve_core(lh_core *core) {
  int ok = 1;
#define SYM(field, name)                                        \
  core->field = (void *)lib_sym(core->handle, name);            \
  if (!core->field) ok = 0;
  SYM(set_environment, "retro_set_environment")
  SYM(set_video_refresh, "retro_set_video_refresh")
  SYM(set_audio_sample, "retro_set_audio_sample")
  SYM(set_audio_sample_batch, "retro_set_audio_sample_batch")
  SYM(set_input_poll, "retro_set_input_poll")
  SYM(set_input_state, "retro_set_input_state")
  SYM(init, "retro_init")
  SYM(deinit, "retro_deinit")
  SYM(get_system_info, "retro_get_system_info")
  SYM(get_system_av_info, "retro_get_system_av_info")
  SYM(load_game, "retro_load_game")
  SYM(unload_game, "retro_unload_game")
  SYM(run, "retro_run")
  SYM(reset, "retro_reset")
  SYM(serialize_size, "retro_serialize_size")
  SYM(serialize, "retro_serialize")
  SYM(unserialize, "retro_unserialize")
  SYM(get_memory_data, "retro_get_memory_data")
  SYM(get_memory_size, "retro_get_memory_size")
#undef SYM
  core->set_controller_port_device =
      (fn_set_controller_port_device)lib_sym(
          core->handle, "retro_set_controller_port_device");
  return ok;
}

// ---------------------------------------------------------------------------
// Public API.
// ---------------------------------------------------------------------------

lh_host *lh_create(lh_output_format fmt, lh_callbacks cb) {
  struct lh_host *h = calloc(1, sizeof(struct lh_host));
  if (!h) return NULL;
  h->format = fmt;
  h->cb = cb;
  h->fast_forward = 1;
  h->pixel_format = RETRO_PIXEL_FORMAT_0RGB1555;
  h->variables_dirty = 1;
  reset_controller_devices(h);
  mutex_init(&h->vars_lock);
  mutex_init(&h->controller_info_lock);
  mutex_init(&h->input_descriptor_lock);
  mutex_init(&h->core_log_lock);
  mutex_init(&h->video_lock);
  mutex_init(&h->audio_lock);
  mutex_init(&h->jobs_lock);
  cond_init(&h->jobs_cond);
  return h;
}

static void set_digital_input(lh_host *host, int port, uint16_t mask) {
  unsigned old = atomic_exchange(&host->input_level[port], (unsigned)mask);
  unsigned rising = (unsigned)mask & ~old;
  unsigned falling = old & ~(unsigned)mask;
  if (rising || falling) {
    atomic_fetch_or(&host->input_transitions[port],
                    rising | (falling << LH_INPUT_UNACK_SHIFT));
  }
}

void lh_set_input(lh_host *host, int port, uint16_t mask) {
  if (!host || port < 0 || port >= LH_MAX_PORTS) return;
  set_digital_input(host, port, mask);
}

void lh_set_pad_state(lh_host *host, int port, uint16_t mask, int16_t lx,
                      int16_t ly, int16_t rx, int16_t ry, uint16_t l2,
                      uint16_t r2) {
  if (!host || port < 0 || port >= LH_MAX_PORTS) return;
  // Analog first, digital second, deliberately.
  //
  // These are separate words, so a poll landing between them shows the core one
  // domain a frame ahead of the other. The window is a few instructions against
  // a 16.7ms poll, so it is rare either way -- but it is not symmetric in which
  // direction is preferable. Writing analog first means that when the button
  // mask lands, the stick position accompanying it is already current: a
  // direction never arrives later than the button pressed with it, which is the
  // ordering that matters for direction+button inputs.
  atomic_store(&host->analog_level[port][0], pack_axes(lx, ly));
  atomic_store(&host->analog_level[port][1], pack_axes(rx, ry));
  atomic_store(&host->trigger_level[port],
              pack_axes((int16_t)l2, (int16_t)r2));

  // Same digital transition recording as lh_set_input. That entry point stays
  // separate for platforms and tests that do not publish analog state.
  set_digital_input(host, port, mask);
}

void lh_test_poll_input(lh_host *host) {
  if (host) {
    apply_resume_request(host);
    latch_input(host);  // stands in for a frontend frame
  }
}

// Stands in for a core-driven poll inside retro_run. Digital input was already
// advanced by the frontend-frame latch, so this mirrors input_poll_cb and only
// refreshes analog state.
void lh_test_core_poll_input(lh_host *host) {
  if (host) latch_analog(host);
}

uint16_t lh_test_read_input(lh_host *host, int port) {
  if (!host || port < 0 || port >= LH_MAX_PORTS) return 0;
  return (uint16_t)(atomic_load(&host->input_frame[port]) & LH_INPUT_MASK);
}

int16_t lh_test_read_analog(lh_host *host, int port, int index, int axis) {
  if (!host || port < 0 || port >= LH_MAX_PORTS || index < 0 || index > 1) {
    return 0;
  }
  uint32_t packed = atomic_load(&host->analog_frame[port][index]);
  return axis == 0 ? unpack_x(packed) : unpack_y(packed);
}

int lh_test_observe_input_id(lh_host *host, int port, unsigned id) {
  if (!host || port < 0 || port >= LH_MAX_PORTS || id >= 16) return 0;
  return (int)read_joypad(host, port, id);
}

uint16_t lh_test_observe_input(lh_host *host, int port) {
  if (!host || port < 0 || port >= LH_MAX_PORTS) return 0;
  return (uint16_t)read_joypad(host, port, RETRO_DEVICE_ID_JOYPAD_MASK);
}

int lh_test_input_thread_mismatch(lh_host *host) {
  return host ? atomic_load(&host->input_thread_mismatch) : 0;
}

int lh_test_unhandled_env_count(lh_host *host) {
  return host ? atomic_load(&host->unhandled_env_count) : 0;
}

uint16_t lh_test_read_trigger(lh_host *host, int port, int which) {
  if (!host || port < 0 || port >= LH_MAX_PORTS) return 0;
  uint32_t packed = atomic_load(&host->trigger_frame[port]);
  return which == 0 ? (uint16_t)unpack_x(packed) : (uint16_t)unpack_y(packed);
}

static void free_load_paths(struct lh_host *h) {
  free(h->system_dir);
  free(h->save_dir);
  free(h->sram_path);
  free(h->core_path);
  free(h->rom_path);
  h->system_dir = h->save_dir = h->sram_path = h->core_path = h->rom_path =
      NULL;
}

// Unwinds a core that was opened (and possibly loaded) for an attempt that
// is now being abandoned: lh_load's load_failed and restart_core's failure
// path both reach this. load_content can fail (e.g. -7, alloc_failed) after
// it already set core_loaded = 1 and called retro_load_game successfully;
// leaving core_loaded = 1 here would let lh_serialize_size/lh_reset/lh_stop
// pass their core_loaded guard and run a job against a core struct this
// function is about to zero out. retro_unload_game must also be paired with
// the retro_load_game that succeeded before deinit runs - calling deinit
// without unload_game first is out of the libretro contract.
static void unwind_failed_core(struct lh_host *h) {
  if (h->core_loaded) {
    if (h->core.unload_game) h->core.unload_game();
    h->core_loaded = 0;
  }
  if (h->core.deinit) h->core.deinit();
  if (h->core.handle) lib_close(h->core.handle);
  memset(&h->core, 0, sizeof(h->core));
}

// Unwinds a load that failed after retro_init, pairing the init and freeing the
// paths that lh_stop would otherwise own.
static int load_failed(struct lh_host *h, int code) {
  unwind_failed_core(h);
  clear_controller_info(h);
  clear_input_descriptors(h);
  free_load_paths(h);
  g_session = NULL;
  return code;
}

static int open_core(struct lh_host *h) {
  h->core.handle = lib_open(h->core_path);
  if (!h->core.handle) {
#ifdef _WIN32
    char err_buf[256];
    host_log(h, "Failed to load core '%s': %s", h->core_path,
             lib_open_error(err_buf, sizeof(err_buf)));
#else
    const char *err = lib_open_error();
    host_log(h, "Failed to load core '%s': %s", h->core_path,
             err ? err : "unknown dlopen failure");
#endif
    return LH_ERR_CORE_OPEN;
  }
  if (!resolve_core(&h->core)) {
    lib_close(h->core.handle);
    memset(&h->core, 0, sizeof(h->core));
    return LH_ERR_CORE_SYMBOLS;
  }

  h->pixel_format = RETRO_PIXEL_FORMAT_0RGB1555;
  h->av.rotation = 0;
  clear_controller_info(h);
  clear_input_descriptors(h);
  // retro_init (below) and, later, retro_load_game are the two points a core
  // can call SET_VARIABLES from; reset the flag here so a failure from a
  // *previous* load/restart attempt (already handled by that attempt's own
  // rc check) can't be mistaken for one from this one.
  h->alloc_failed = 0;
  h->core.set_environment(environment_cb);
  h->core.set_video_refresh(video_refresh_cb);
  h->core.set_audio_sample(audio_sample_cb);
  h->core.set_audio_sample_batch(audio_batch_cb);
  h->core.set_input_poll(input_poll_cb);
  h->core.set_input_state(input_state_cb);
  h->core.init();
  return 0;
}

// open_core already does exactly what a probe needs -- dlopen, resolve,
// set_environment, retro_init -- and stops short of content.
int lh_probe_options(lh_host *h, const char *core_path, const char *system_dir) {
  if (!h || !core_path || !system_dir) return -1;
  if (g_session) return LH_ERR_SESSION_BUSY;

  free_option_definitions(h);  // this core's options, not a union

  h->system_dir = lh_strdup(system_dir);
  h->core_path = lh_strdup(core_path);
  if (!h->system_dir || !h->core_path) {
    free_load_paths(h);
    return LH_ERR_ALLOC;
  }

  g_session = h;
  int rc = open_core(h);
  if (rc != 0) {
    free_load_paths(h);
    g_session = NULL;
    return rc;
  }

  // Pairs the init and drops the module. Deliberately leaves h->defs alone.
  unwind_failed_core(h);
  free_load_paths(h);
  g_session = NULL;
  return 0;
}

static int load_content(struct lh_host *h) {
  struct retro_system_info info;
  memset(&info, 0, sizeof(info));
  h->core.get_system_info(&info);

  struct retro_game_info game;
  memset(&game, 0, sizeof(game));
  game.path = h->rom_path;
  void *rom_data = NULL;
  if (!info.need_fullpath) {
    FILE *f = fopen(h->rom_path, "rb");
    if (!f) return LH_ERR_ROM_READ;
    fseek(f, 0, SEEK_END);
    long len = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (len <= 0) {
      fclose(f);
      return LH_ERR_ROM_READ;
    }
    rom_data = malloc((size_t)len);
    size_t got = rom_data ? fread(rom_data, 1, (size_t)len, f) : 0;
    fclose(f);
    if (got != (size_t)len) {
      free(rom_data);
      return LH_ERR_ROM_READ;
    }
    game.data = rom_data;
    game.size = (size_t)len;
  }

  char load_diagnostic[sizeof(h->last_core_log)] = {0};
  mutex_lock(&h->core_log_lock);
  h->last_core_log[0] = '\0';
  h->last_core_error[0] = '\0';
  h->capture_load_log = 1;
  mutex_unlock(&h->core_log_lock);
  bool ok = h->core.load_game(&game);
  mutex_lock(&h->core_log_lock);
  h->capture_load_log = 0;
  const char *selected_log =
      h->last_core_error[0] ? h->last_core_error : h->last_core_log;
  snprintf(load_diagnostic, sizeof(load_diagnostic), "%s", selected_log);
  mutex_unlock(&h->core_log_lock);
  free(rom_data);
  if (!ok) {
    if (load_diagnostic[0]) {
      host_log(h, "retro_load_game rejected '%s': %s", h->rom_path,
               load_diagnostic);
    } else {
      host_log(h, "retro_load_game rejected '%s' without a core diagnostic",
               h->rom_path);
    }
    return LH_ERR_CONTENT_REJECTED;
  }
  // A core that asked to quit during the load has nothing to run. Unload before
  // reporting, so the caller's teardown is not left holding a live game.
  if (h->shutdown_requested) {
    if (h->core.unload_game) h->core.unload_game();
    return LH_ERR_SHUTDOWN_DURING_LOAD;
  }

  struct retro_system_av_info av;
  memset(&av, 0, sizeof(av));
  h->core.get_system_av_info(&av);
  h->av.width = (int)av.geometry.base_width;
  h->av.height = (int)av.geometry.base_height;
  if (av.geometry.aspect_ratio > 0) {
    h->av.aspect = (double)av.geometry.aspect_ratio;
  }
  // load_game is where SET_ROTATION arrives, so it is already known here.
  apply_rotation_to_av(h, av.geometry.aspect_ratio > 0);
  // Seeded av does not notify - lh_load hands the caller av directly, and an
  // internal restart reaches the platform through the core's first
  // SET_GEOMETRY. Clearing the record keeps that first report from being
  // mistaken for a duplicate when a restart lands on the same geometry.
  h->notified_width = -1;
  h->notified_height = -1;
  h->notified_aspect = -1.0;
  h->av.fps = av.timing.fps > 0 ? av.timing.fps : 60;
  h->av.sample_rate = av.timing.sample_rate > 0 ? av.timing.sample_rate : 44100;

  int cap_frames = (int)(h->av.sample_rate * 0.25);
  if (cap_frames <= 0 || cap_frames > INT_MAX / 2) return LH_ERR_AUDIO_RING;
  int ring_capacity = cap_frames * 2;
  int16_t *ring = calloc((size_t)ring_capacity, sizeof(int16_t));
  if (!ring) return LH_ERR_AUDIO_RING;
  mutex_lock(&h->audio_lock);
  int16_t *old_ring = h->ring;
  h->ring = ring;
  h->ring_capacity = ring_capacity;
  h->ring_read = h->ring_write = h->ring_stored = 0;
  mutex_unlock(&h->audio_lock);
  free(old_ring);

  sram_load(h);
  h->core_loaded = 1;
  h->last_sram_flush_ns = now_ns();
  // load_game (just above) is the other point besides retro_init that a core
  // can call SET_VARIABLES from, so alloc_failed has to be re-checked here
  // too: a core is fully loaded and playable at this point, but with an
  // incomplete option set, which lh_load and restart_core both need to treat
  // as a failure rather than a silent partial success. LH_ERR_ALLOC joins the
  // other codes this function returns as "the same failure lh_load uses for
  // its own setup", so both callers just check `rc != 0`.
  if (h->alloc_failed) return LH_ERR_ALLOC;
  return 0;
}

int lh_load(lh_host *h, const char *core_path, const char *rom_path,
            const char *system_dir, const char *save_dir, const char *game_id,
            const char *const *opt_keys, const char *const *opt_vals,
            int opt_count, lh_av_info *out_info) {
  if (g_session) return LH_ERR_SESSION_BUSY;
  h->shutdown_requested = 0;
  atomic_store(&h->resume_requested, 0);
  reset_digital_input(h);
  // A fresh load is a new session, so do not carry a choice from a different
  // core/content forward. Internal restart deliberately does not call this.
  reset_controller_devices(h);
  // Analog-queried is per-game, not per-core (see the struct comment): clear
  // it, and the analog values with it, so neither a stale "reads analog"
  // signal nor a stale stick deflection leaks into new content.
  reset_analog_queries(h);
  reset_analog_state(h);

  // FIX 5: game_id names the SRAM file below and ultimately originates from a
  // route parameter seeded by server data (app_router.dart ->
  // LibretroBridge.kt -> nativeLoad here), which is not a trusted boundary. A
  // hostile or compromised server could hand this an id containing "../" to
  // make sram_path point outside save_dir - an arbitrary file write/overwrite
  // once combined with the core's own read/write of that path. Reject it
  // outright rather than stripping or rewriting the offending characters:
  // silently sanitizing would silently change which save file a legitimate
  // game_id maps to, which is a worse, quieter failure mode than refusing the
  // load with a clear error.
  if (!game_id || strchr(game_id, '/') || strchr(game_id, '\\') ||
      strstr(game_id, "..")) {
    return LH_ERR_BAD_GAME_ID;
  }

  h->system_dir = lh_strdup(system_dir);
  h->save_dir = lh_strdup(save_dir);
  h->core_path = lh_strdup(core_path);
  h->rom_path = lh_strdup(rom_path);
  size_t sram_len = strlen(save_dir) + strlen(game_id) + 6;
  h->sram_path = malloc(sram_len);
  // FIX 4: lh_strdup/malloc can all return NULL under memory pressure. The
  // old code walked straight into snprintf-ing through h->sram_path (a
  // guaranteed NULL-pointer write if that malloc failed) and later into
  // open_core, which hands system_dir/core_path/rom_path to dlopen/fopen
  // without ever having checked them. -7 is a new code (existing ones are all
  // core/content specific: -2/-3 core load, -4/-5 rom/game, -6 audio ring),
  // reserved for "the host itself couldn't allocate what it needed to attempt
  // the load" so a caller can tell this apart from a bad core or ROM.
  if (!h->system_dir || !h->save_dir || !h->core_path || !h->rom_path ||
      !h->sram_path) {
    free_load_paths(h);
    return LH_ERR_ALLOC;
  }
  snprintf(h->sram_path, sram_len, "%s/%s.srm", save_dir, game_id);
  for (int i = 0; i < opt_count; i++) {
    if (vars_set(h, opt_keys[i], opt_vals[i]) != 0) {
      free_load_paths(h);
      return LH_ERR_ALLOC;
    }
  }

  g_session = h;
  int rc = open_core(h);
  if (rc != 0) {
    free_load_paths(h);
    g_session = NULL;
    return rc;
  }
  rc = load_content(h);
  if (rc != 0) return load_failed(h, rc);
  if (out_info) *out_info = h->av;
  return 0;
}

int lh_start(lh_host *h) {
  if (h->has_thread) return 0;  // already running
  if (!h->core_loaded || h->shutdown_requested) return -1;
  h->running = 1;
  atomic_store(&h->paused, 0);
  // Opened before thread_start, or run_job could run a job inline while the
  // loop is already live.
  mutex_lock(&h->jobs_lock);
  h->jobs_open = 1;
  mutex_unlock(&h->jobs_lock);
  thread_start(h);
  if (!h->has_thread) {
    // Close and drain, or run_job waits forever on a condvar no thread can
    // signal. Draining is required here because while (!job->done) ignores a wake.
    h->running = 0;
    mutex_lock(&h->jobs_lock);
    h->jobs_open = 0;
    for (int i = 0; i < h->job_count; i++) h->jobs[i]->done = 1;
    h->job_count = 0;
    cond_broadcast(&h->jobs_cond);
    mutex_unlock(&h->jobs_lock);
    return -1;
  }
  return 0;
}

void lh_pause(lh_host *h) { atomic_store(&h->paused, 1); }
void lh_resume(lh_host *h) {
  // The pending latch exists so a press+release falling entirely between two
  // polls is still observed for one frame (see test_input_latch). While paused
  // there IS no next poll, so anything pressed in a menu -- the controller test
  // panel most obviously, where pressing buttons is the whole point -- stays
  // latched and fires on the first frame after resuming.
  //
  // The reset must run on the emulation thread: it clears unacked_age, which
  // is latch-thread-only state, and publishes the frame that the next core
  // run will read. The atomic request lets resume return without racing that
  // state; the run loop applies it before its next latch.
  atomic_store(&h->resume_requested, 1);
  atomic_store(&h->paused, 0);
}

void lh_set_fast_forward(lh_host *h, int factor) {
  if (factor < 1) factor = 1;
  if (factor > 8) factor = 8;
  h->fast_forward = factor;
}

void lh_reset(lh_host *h) {
  if (!h->core_loaded) return;
  lh_job job = {0};
  job.kind = JOB_RESET;
  run_job(h, &job);
}

// This follows the same lifecycle as leaving and launching the game again,
// while keeping the platform's existing texture and input objects alive.
static int restart_core(struct lh_host *h) {
  if (!h->core_loaded) {
    atomic_fetch_add(&h->restart_generation, 1);
    return -1;
  }

  // restart_core is executed by the emulation thread (or inline only when no
  // run loop exists), so this shared lifecycle reset cannot race latch_input's
  // plain per-button ages. The latest physical level intentionally survives.
  reset_digital_input(h);
  sram_flush(h);
  if (h->core.unload_game) h->core.unload_game();
  if (h->core.deinit) h->core.deinit();
  if (h->core.handle) lib_close(h->core.handle);
  memset(&h->core, 0, sizeof(h->core));
  h->core_loaded = 0;

  // Same reasoning as lh_load: the design treats analog-queried as per-game,
  // so a restart clears it -- and the analog values with it -- even though it
  // keeps most other state (e.g. controller_devices, reapplied below) alive
  // across the new core instance.
  reset_analog_queries(h);
  reset_analog_state(h);

  mutex_lock(&h->vars_lock);
  free_option_definitions(h);
  // The old core is fully unloaded above, so nothing can still be holding a
  // GET_VARIABLE pointer from the previous session. Draining here (rather
  // than only at lh_stop) keeps the arena from carrying across restarts.
  vars_free_retired(h);
  h->variables_dirty = 1;
  mutex_unlock(&h->vars_lock);

  int rc = open_core(h);
  if (rc == 0) rc = load_content(h);
  if (rc == 0) reapply_controller_devices(h);
  if (rc != 0) {
    // Same unwind load_failed performs for lh_load, but restart_core keeps
    // g_session and the load paths alive (a later restart attempt reuses
    // core_path/rom_path via open_core, and lh_stop still needs them).
    unwind_failed_core(h);
    h->running = 0;
  }
  atomic_fetch_add(&h->restart_generation, 1);
  return rc;
}

int lh_restart(lh_host *h) {
  if (!h->core_loaded) return -1;
  lh_job job = {0};
  job.kind = JOB_RESTART;
  run_job(h, &job);
  return job.result_ok ? 0 : -1;
}

int lh_restart_async(lh_host *h) {
  if (!h || !atomic_load(&h->running)) {
    return -1;
  }
  atomic_store(&h->restart_requested, 1);
  return 0;
}

unsigned lh_restart_generation(lh_host *h) {
  return atomic_load(&h->restart_generation);
}

void lh_stop(lh_host *h) {
  if (h->has_thread) {
    // Clearing running under jobs_lock makes this transition atomic with
    // run_job's queue-or-execute decision (see the comment on run_job): either
    // a concurrent run_job call observes running==1 here and queues into a
    // loop that is guaranteed one more drain_jobs before it can exit (see
    // run_loop's final drain), or it observes running==0 and fails the job
    // without entering a core that may be unloading. Without holding the lock across this
    // write, run_job could read running==1 a moment after this store and
    // queue into a loop that has already fallen out of its while() condition,
    // and the job would then wait on jobs_cond forever.
    mutex_lock(&h->jobs_lock);
    h->running = 0;
    mutex_unlock(&h->jobs_lock);
    thread_join(h);  // the loop flushes SRAM and tears the core down
  } else if (h->core_loaded) {
    // Same order as the run loop's exit, so a job from another thread is
    // refused rather than run against a core going away.
    mutex_lock(&h->jobs_lock);
    h->core_loaded = 0;
    mutex_unlock(&h->jobs_lock);
    sram_flush(h);
    if (h->core.unload_game) h->core.unload_game();
    if (h->core.deinit) h->core.deinit();
    if (h->core.handle) lib_close(h->core.handle);
    memset(&h->core, 0, sizeof(h->core));
  }
  // Both branches above end with the core torn down (thread_join returns only
  // after run_loop has unloaded it), so no core-held GET_VARIABLE pointer can
  // outlive this point and the retired values can go. h->vars themselves stay
  // put - lh_destroy's free_options owns those.
  mutex_lock(&h->vars_lock);
  vars_free_retired(h);
  mutex_unlock(&h->vars_lock);

  clear_controller_info(h);
  clear_input_descriptors(h);
  reset_controller_devices(h);
  g_session = NULL;
  free_load_paths(h);
}

static void free_options(struct lh_host *h) {
  free_option_definitions(h);
  for (int i = 0; i < h->var_count; i++) {
    free(h->vars[i].key);
    free(h->vars[i].value);
  }
  free(h->vars);
  h->vars = NULL;
  h->var_count = 0;
  // Backstop for the lh_destroy path that never loaded a core (and so never
  // ran lh_stop). vars_free_retired is idempotent, so the ordinary
  // lh_stop-then-destroy sequence just finds an empty list here.
  vars_free_retired(h);
}

void lh_destroy(lh_host *h) {
  if (!h) return;
  if (h->core_loaded || h->has_thread) lh_stop(h);
  free_options(h);
  clear_controller_info(h);
  clear_input_descriptors(h);
  free(h->front.data);
  free(h->back.data);
  free(h->ring);
  mutex_destroy(&h->vars_lock);
  mutex_destroy(&h->controller_info_lock);
  mutex_destroy(&h->input_descriptor_lock);
  mutex_destroy(&h->core_log_lock);
  mutex_destroy(&h->video_lock);
  mutex_destroy(&h->audio_lock);
  cond_destroy(&h->jobs_cond);
  mutex_destroy(&h->jobs_lock);
  free(h);
}

int lh_get_frame(lh_host *h, const void **data, int *width, int *height,
                 int *stride) {
  mutex_lock(&h->video_lock);
  if (h->back_ready) {
    lh_frame tmp = h->front;
    h->front = h->back;
    h->back = tmp;
    h->back_ready = 0;
  }
  int ok = h->front.data && h->front.width > 0;
  if (ok) {
    *data = h->front.data;
    *width = h->front.width;
    *height = h->front.height;
    *stride = h->front.width * 4;
  }
  mutex_unlock(&h->video_lock);
  return ok;
}

int lh_read_audio(lh_host *h, int16_t *dst, int frame_count) {
  mutex_lock(&h->audio_lock);
  int capacity = h->ring_capacity;
  int available = h->ring_stored / 2;
  int to_copy = frame_count < available ? frame_count : available;
  for (int i = 0; i < to_copy; i++) {
    dst[i * 2] = h->ring[h->ring_read];
    dst[i * 2 + 1] = h->ring[(h->ring_read + 1) % capacity];
    h->ring_read = (h->ring_read + 2) % capacity;
  }
  h->ring_stored -= to_copy * 2;
  mutex_unlock(&h->audio_lock);
  for (int i = to_copy; i < frame_count; i++) {
    dst[i * 2] = 0;
    dst[i * 2 + 1] = 0;
  }
  return to_copy;
}

void lh_set_audio_paced(lh_host *h, int paced) { h->audio_paced = paced ? 1 : 0; }

size_t lh_serialize_size(lh_host *h) {
  if (!h->core_loaded) return 0;
  lh_job job = {0};
  job.kind = JOB_SERIALIZE_SIZE;
  run_job(h, &job);
  return job.result_size;
}

int lh_serialize(lh_host *h, void *dst, size_t size) {
  if (!h->core_loaded) return -1;
  lh_job job = {0};
  job.kind = JOB_SERIALIZE;
  job.buf = dst;
  job.size = size;
  run_job(h, &job);
  return job.result_ok ? 0 : -1;
}

int lh_unserialize(lh_host *h, const void *src, size_t size) {
  if (!h->core_loaded) return -1;
  lh_job job = {0};
  job.kind = JOB_UNSERIALIZE;
  job.cbuf = src;
  job.size = size;
  run_job(h, &job);
  return job.result_ok ? 0 : -1;
}

int lh_option_count(lh_host *h) {
  mutex_lock(&h->vars_lock);
  int count = h->def_count;
  mutex_unlock(&h->vars_lock);
  return count;
}

// Copies one definition into caller-owned storage while still holding the
// lock. Handing back the host's own pointers, as this used to, was a
// cross-thread use-after-free: restart_core frees every definition from the
// emulation thread and lh_set_option frees the replaced value from whichever
// thread changed it, both after this function has already unlocked and
// returned. Copying is cheap next to the JNI/Flutter marshalling every caller
// does with the result anyway.
int lh_get_option(lh_host *h, int index, lh_option *out) {
  if (!h || !out) return -1;
  mutex_lock(&h->vars_lock);
  if (index < 0 || index >= h->def_count) {
    mutex_unlock(&h->vars_lock);
    return -1;
  }
  lh_optdef *def = &h->defs[index];
  const char *current = vars_get(h, def->id);
  lh_copy_bounded(out->id, sizeof(out->id), def->id);
  lh_copy_bounded(out->label, sizeof(out->label), def->label);
  lh_copy_bounded(out->current, sizeof(out->current),
                  current ? current
                          : (def->choice_count > 0 ? def->choices[0] : ""));
  int n = def->choice_count;
  if (n > LH_OPTION_CHOICE_MAX) n = LH_OPTION_CHOICE_MAX;
  for (int c = 0; c < n; c++) {
    lh_copy_bounded(out->choices[c], sizeof(out->choices[c]), def->choices[c]);
  }
  out->choice_count = n;
  mutex_unlock(&h->vars_lock);
  return 0;
}

void lh_set_option(lh_host *h, const char *id, const char *value) {
  mutex_lock(&h->vars_lock);
  // There is no "load" to fail here - the core is already running - so an
  // allocation failure is skipped cleanly instead: leave the option at its
  // previous value and don't mark variables dirty for a change that never
  // actually took, rather than telling the core an update happened when it
  // didn't.
  if (vars_set(h, id, value) == 0) {
    h->variables_dirty = 1;
  } else {
    host_log(h, "Failed to set option %s (allocation failure)", id);
  }
  mutex_unlock(&h->vars_lock);
}

int lh_controller_type_count(lh_host *h, int port) {
  if (!h || port < 0) return 0;
  mutex_lock(&h->controller_info_lock);
  int count = port < h->controller_port_count
                  ? (h->controller_ports[port].type_count > INT_MAX
                         ? INT_MAX
                         : (int)h->controller_ports[port].type_count)
                  : 0;
  mutex_unlock(&h->controller_info_lock);
  return count;
}

int lh_get_controller_type(lh_host *h, int port, int index,
                           lh_controller_type *out) {
  if (!h || !out || port < 0 || index < 0) return -1;
  mutex_lock(&h->controller_info_lock);
  if (port >= h->controller_port_count ||
      (unsigned)index >= h->controller_ports[port].type_count) {
    mutex_unlock(&h->controller_info_lock);
    return -1;
  }
  *out = h->controller_ports[port].types[index];
  mutex_unlock(&h->controller_info_lock);
  return 0;
}

int lh_input_descriptor_count(lh_host *h) {
  if (!h) return 0;
  mutex_lock(&h->input_descriptor_lock);
  int count = h->input_descriptor_count;
  mutex_unlock(&h->input_descriptor_lock);
  return count;
}

int lh_get_input_descriptor(lh_host *h, int index, lh_input_descriptor *out) {
  if (!h || !out || index < 0) return -1;
  mutex_lock(&h->input_descriptor_lock);
  if (index >= h->input_descriptor_count) {
    mutex_unlock(&h->input_descriptor_lock);
    return -1;
  }
  *out = h->input_descriptors[index];
  mutex_unlock(&h->input_descriptor_lock);
  return 0;
}

unsigned lh_analog_stick_ports(lh_host *h) {
  if (!h) return 0;
  unsigned ports = 0;
  mutex_lock(&h->input_descriptor_lock);
  for (int i = 0; i < h->input_descriptor_count; i++) {
    const lh_input_descriptor *d = &h->input_descriptors[i];
    // Only STICK descriptors decide the stick's mode. An analog BUTTON
    // descriptor (index 2, i.e. trigger pressure) says nothing about whether
    // the game wants an analog stick -- counting it would switch the stick to
    // analog for a game whose movement is digital, which is exactly the
    // BurgerTime failure this signal exists to avoid.
    if (d->device == RETRO_DEVICE_ANALOG && d->port < LH_MAX_PORTS &&
        (d->index == RETRO_DEVICE_INDEX_ANALOG_LEFT ||
         d->index == RETRO_DEVICE_INDEX_ANALOG_RIGHT)) {
      ports |= (1u << d->port);
    }
  }
  mutex_unlock(&h->input_descriptor_lock);
  // Until the core has read input at all, the descriptor is the only evidence
  // there is, so trust it; see the header.
  if (atomic_load_explicit(&h->input_read_frames, memory_order_relaxed) <
      LH_ANALOG_DECIDE_FRAMES) {
    return ports;
  }
  return ports & atomic_load_explicit(&h->analog_queried_ports,
                                      memory_order_relaxed);
}

int lh_set_controller_type(lh_host *h, int port, unsigned device) {
  if (!h || port < 0 || port >= LH_MAX_PORTS) return -1;

  int fallback = !controller_device_is_advertised(h, port, device);
  if (fallback) {
    diagnostic_log(
        "Controller device port=%d id=%u was not advertised; using Auto (%u)",
        port, device, RETRO_DEVICE_JOYPAD);
    device = RETRO_DEVICE_JOYPAD;
  }

  lh_job job = {0};
  job.kind = JOB_CONTROLLER_DEVICE;
  job.port = port;
  job.device = device;
  if (run_job(h, &job) != 0 || !job.result_ok) return -1;
  return fallback ? 1 : 0;
}
