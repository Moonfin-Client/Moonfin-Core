#include "libretro_host.h"

#include <stdarg.h>
#include <stdatomic.h>
#include <stdbool.h>
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

// ---------------------------------------------------------------------------
// Platform primitives: dynamic library, threading, time.
// ---------------------------------------------------------------------------

#ifdef _WIN32
typedef HMODULE lh_lib;
static lh_lib lib_open(const char *path) { return LoadLibraryA(path); }
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
  return (uint64_t)(t.QuadPart * 1000000000ull / f.QuadPart);
}
static void sleep_ns(uint64_t ns) { Sleep((DWORD)(ns / 1000000ull)); }
static char *lh_strdup(const char *s) { return _strdup(s); }
#else
typedef void *lh_lib;
static lh_lib lib_open(const char *path) {
  return dlopen(path, RTLD_NOW | RTLD_LOCAL);
}
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
  JOB_SERIALIZE_SIZE,
  JOB_SERIALIZE,
  JOB_UNSERIALIZE,
} lh_job_kind;

typedef struct {
  lh_job_kind kind;
  void *buf;
  const void *cbuf;
  size_t size;
  size_t result_size;
  int result_ok;
  int done;
} lh_job;

#define LH_MAX_JOBS 16

struct lh_host {
  lh_output_format format;
  lh_callbacks cb;

  lh_core core;
  int core_loaded;

  lh_av_info av;

  char *system_dir;
  char *save_dir;
  char *sram_path;
  unsigned pixel_format;

  // Options.
  lh_optdef *defs;
  int def_count;
  lh_var *vars;
  int var_count;
  int variables_dirty;
  lh_mutex vars_lock;

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

  // Run loop. running/paused/fast_forward are shared with the loop thread.
  lh_thread thread;
  int has_thread;
  atomic_int running;
  atomic_int paused;
  atomic_int fast_forward;
  atomic_int shutdown_requested;
  uint64_t last_sram_flush_ns;

  // Jobs. jobs_open says whether the loop is still there to drain them, so a
  // job queued as the loop exits is never left waiting.
  lh_job *jobs[LH_MAX_JOBS];
  int job_count;
  int jobs_open;
  lh_mutex jobs_lock;
  lh_cond jobs_cond;
};

// libretro's callbacks carry no user pointer, so the single live host is global.
static struct lh_host *g_session;

// ---------------------------------------------------------------------------
// Options helpers.
// ---------------------------------------------------------------------------

static const char *vars_get(struct lh_host *h, const char *key) {
  for (int i = 0; i < h->var_count; i++) {
    if (strcmp(h->vars[i].key, key) == 0) return h->vars[i].value;
  }
  return NULL;
}

static void vars_set(struct lh_host *h, const char *key, const char *value) {
  for (int i = 0; i < h->var_count; i++) {
    if (strcmp(h->vars[i].key, key) == 0) {
      free(h->vars[i].value);
      h->vars[i].value = lh_strdup(value);
      return;
    }
  }
  h->vars = realloc(h->vars, sizeof(lh_var) * (h->var_count + 1));
  h->vars[h->var_count].key = lh_strdup(key);
  h->vars[h->var_count].value = lh_strdup(value);
  h->var_count++;
}

// Parses one SET_VARIABLES entry into its label and choice list.
static void parse_variable(struct lh_host *h, const char *key,
                           const char *raw) {
  const char *sep = strstr(raw, "; ");
  char *label;
  char **choices = NULL;
  int nchoices = 0;
  if (sep) {
    size_t label_len = (size_t)(sep - raw);
    label = malloc(label_len + 1);
    memcpy(label, raw, label_len);
    label[label_len] = '\0';
    const char *list = sep + 2;
    char *copy = lh_strdup(list);
    char *tok = strtok(copy, "|");
    while (tok) {
      choices = realloc(choices, sizeof(char *) * (nchoices + 1));
      choices[nchoices++] = lh_strdup(tok);
      tok = strtok(NULL, "|");
    }
    free(copy);
  } else {
    label = lh_strdup(key);
  }

  h->defs = realloc(h->defs, sizeof(lh_optdef) * (h->def_count + 1));
  h->defs[h->def_count].id = lh_strdup(key);
  h->defs[h->def_count].label = label;
  h->defs[h->def_count].choices = choices;
  h->defs[h->def_count].choice_count = nchoices;
  h->def_count++;

  if (vars_get(h, key) == NULL && nchoices > 0) {
    vars_set(h, key, choices[0]);
  }
}

// ---------------------------------------------------------------------------
// Environment callback (mirrors the tvOS GameSession switch).
// ---------------------------------------------------------------------------

static void notify_geometry(struct lh_host *h, unsigned width, unsigned height,
                            float aspect_ratio) {
  h->av.width = (int)width;
  h->av.height = (int)height;
  h->av.aspect = aspect_ratio > 0
                     ? (double)aspect_ratio
                     : (double)width / (double)(height > 0 ? height : 1);
  if (h->cb.geometry_changed) {
    h->cb.geometry_changed(h->cb.user, h->av.width, h->av.height, h->av.aspect);
  }
}

// Cores are allowed to log during retro_init and some call this pointer
// without checking that the frontend handed one over, so it always has to be
// a real function.
static void RETRO_CALLCONV log_printf_cb(enum retro_log_level level,
                                         const char *fmt, ...) {
  (void)level;
  if (!fmt) return;
  va_list args;
  va_start(args, fmt);
  vfprintf(stderr, fmt, args);
  va_end(args);
}

static void deliver_message(struct lh_host *h, const char *text) {
  if (text && *text && h->cb.message) h->cb.message(h->cb.user, text);
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
    case RETRO_ENVIRONMENT_SET_CONTROLLER_INFO:
      return true;
    case RETRO_ENVIRONMENT_SET_HW_RENDER:
      return false;  // software rendering only
    case RETRO_ENVIRONMENT_GET_VARIABLE: {
      if (!data) return false;
      struct retro_variable *var = (struct retro_variable *)data;
      if (!var->key) return false;
      mutex_lock(&h->vars_lock);
      const char *value = vars_get(h, var->key);
      var->value = value;  // owned by h->vars, stable until changed
      mutex_unlock(&h->vars_lock);
      return value != NULL;
    }
    case RETRO_ENVIRONMENT_SET_VARIABLES: {
      if (!data) return false;
      const struct retro_variable *cursor =
          (const struct retro_variable *)data;
      mutex_lock(&h->vars_lock);
      while (cursor->key && cursor->value) {
        parse_variable(h, cursor->key, cursor->value);
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
    case RETRO_ENVIRONMENT_GET_PREFERRED_HW_RENDER:
      return false;
    default:
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

static void convert_frame(struct lh_host *h, const void *src, int width,
                          int height, int pitch) {
  size_t needed = (size_t)width * (size_t)height * 4;
  if (h->back.capacity < needed) {
    h->back.data = realloc(h->back.data, needed);
    h->back.capacity = needed;
  }
  const uint8_t *src_bytes = (const uint8_t *)src;
  for (int y = 0; y < height; y++) {
    const uint8_t *s = src_bytes + (size_t)y * pitch;
    uint8_t *d = h->back.data + (size_t)y * width * 4;
    for (int x = 0; x < width; x++) {
      unsigned r, g, b;
      if (h->pixel_format == RETRO_PIXEL_FORMAT_XRGB8888) {
        uint32_t p;
        memcpy(&p, s + x * 4, 4);
        r = (p >> 16) & 0xFF;
        g = (p >> 8) & 0xFF;
        b = p & 0xFF;
      } else if (h->pixel_format == RETRO_PIXEL_FORMAT_RGB565) {
        uint16_t p;
        memcpy(&p, s + x * 2, 2);
        unsigned r5 = (p >> 11) & 0x1F, g6 = (p >> 5) & 0x3F, b5 = p & 0x1F;
        r = (r5 << 3) | (r5 >> 2);
        g = (g6 << 2) | (g6 >> 4);
        b = (b5 << 3) | (b5 >> 2);
      } else {  // 0RGB1555
        uint16_t p;
        memcpy(&p, s + x * 2, 2);
        unsigned r5 = (p >> 10) & 0x1F, g5 = (p >> 5) & 0x1F, b5 = p & 0x1F;
        r = (r5 << 3) | (r5 >> 2);
        g = (g5 << 3) | (g5 >> 2);
        b = (b5 << 3) | (b5 >> 2);
      }
      pack_pixel(h, d + x * 4, r, g, b);
    }
  }
  h->back.width = width;
  h->back.height = height;
}

static void RETRO_CALLCONV video_refresh_cb(const void *data, unsigned width,
                                            unsigned height, size_t pitch) {
  struct lh_host *h = g_session;
  if (!h || width == 0 || height == 0) return;
  if (!data) {  // duped frame: re-signal the last one
    if (h->cb.frame_ready) h->cb.frame_ready(h->cb.user);
    return;
  }
  mutex_lock(&h->video_lock);
  convert_frame(h, data, (int)width, (int)height, (int)pitch);
  h->back_ready = 1;
  mutex_unlock(&h->video_lock);
  if (h->cb.frame_ready) h->cb.frame_ready(h->cb.user);
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
  if (h->fast_forward <= 1) audio_push(h, data, (int)frames);
  return frames;
}

static void RETRO_CALLCONV audio_sample_cb(int16_t left, int16_t right) {
  int16_t frame[2] = {left, right};
  audio_batch_cb(frame, 1);
}

// ---------------------------------------------------------------------------
// Input.
// ---------------------------------------------------------------------------

static void RETRO_CALLCONV input_poll_cb(void) {}

static int16_t RETRO_CALLCONV input_state_cb(unsigned port, unsigned device,
                                             unsigned index, unsigned id) {
  (void)index;
  struct lh_host *h = g_session;
  if (!h || device != RETRO_DEVICE_JOYPAD || !h->cb.poll_input) return 0;
  uint16_t mask = h->cb.poll_input(h->cb.user, (int)port);
  if (id == RETRO_DEVICE_ID_JOYPAD_MASK) return (int16_t)mask;
  if (id >= 16) return 0;
  return (mask & (1u << id)) ? 1 : 0;
}

// ---------------------------------------------------------------------------
// Jobs.
// ---------------------------------------------------------------------------

static void execute_job(struct lh_host *h, lh_job *job) {
  switch (job->kind) {
    case JOB_RESET:
      if (h->core.reset) h->core.reset();
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
  }
}

// Runs [job] on the emulation thread and waits, or inline when no loop runs.
// A full queue or a loop that already exited gives up instead of waiting, since
// nothing would ever mark the job done.
static void run_job(struct lh_host *h, lh_job *job) {
  mutex_lock(&h->jobs_lock);
  if (h->jobs_open) {
    if (h->job_count < LH_MAX_JOBS) {
      h->jobs[h->job_count++] = job;
      while (!job->done) cond_wait(&h->jobs_cond, &h->jobs_lock);
    }
    mutex_unlock(&h->jobs_lock);
    return;
  }
  int loaded = h->core_loaded;
  mutex_unlock(&h->jobs_lock);
  if (loaded) execute_job(h, job);
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
  fread(mem, 1, size, f);
  fclose(f);
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
    if (h->paused) {
      sleep_ns(16000000);
      drain_jobs(h);
      continue;
    }
    int iterations = h->fast_forward;
    for (int i = 0; i < iterations && h->running; i++) {
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
#else
  pthread_create(&h->thread, NULL, run_loop, h);
#endif
  h->has_thread = 1;
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
  return ok;
}

// ---------------------------------------------------------------------------
// Public API.
// ---------------------------------------------------------------------------

lh_host *lh_create(lh_output_format fmt, lh_callbacks cb) {
  struct lh_host *h = calloc(1, sizeof(struct lh_host));
  h->format = fmt;
  h->cb = cb;
  h->fast_forward = 1;
  h->pixel_format = RETRO_PIXEL_FORMAT_0RGB1555;
  h->variables_dirty = 1;
  mutex_init(&h->vars_lock);
  mutex_init(&h->video_lock);
  mutex_init(&h->audio_lock);
  mutex_init(&h->jobs_lock);
  cond_init(&h->jobs_cond);
  return h;
}

// Unwinds a load that failed after retro_init, pairing the init and freeing the
// directory strings that lh_stop would otherwise own.
static int load_failed(struct lh_host *h, int code) {
  h->core.deinit();
  lib_close(h->core.handle);
  memset(&h->core, 0, sizeof(h->core));
  free(h->system_dir);
  free(h->save_dir);
  free(h->sram_path);
  h->system_dir = h->save_dir = h->sram_path = NULL;
  g_session = NULL;
  return code;
}

int lh_load(lh_host *h, const char *core_path, const char *rom_path,
            const char *system_dir, const char *save_dir, const char *game_id,
            const char *const *opt_keys, const char *const *opt_vals,
            int opt_count, lh_av_info *out_info) {
  if (g_session) return -1;  // one session per process
  h->shutdown_requested = 0;

  h->core.handle = lib_open(core_path);
  if (!h->core.handle) return -2;
  if (!resolve_core(&h->core)) {
    lib_close(h->core.handle);
    memset(&h->core, 0, sizeof(h->core));
    return -3;
  }

  h->system_dir = lh_strdup(system_dir);
  h->save_dir = lh_strdup(save_dir);
  size_t sram_len = strlen(save_dir) + strlen(game_id) + 6;
  h->sram_path = malloc(sram_len);
  snprintf(h->sram_path, sram_len, "%s/%s.srm", save_dir, game_id);
  for (int i = 0; i < opt_count; i++) vars_set(h, opt_keys[i], opt_vals[i]);

  g_session = h;
  h->core.set_environment(environment_cb);
  h->core.set_video_refresh(video_refresh_cb);
  h->core.set_audio_sample(audio_sample_cb);
  h->core.set_audio_sample_batch(audio_batch_cb);
  h->core.set_input_poll(input_poll_cb);
  h->core.set_input_state(input_state_cb);
  h->core.init();

  struct retro_system_info info;
  memset(&info, 0, sizeof(info));
  h->core.get_system_info(&info);

  struct retro_game_info game;
  memset(&game, 0, sizeof(game));
  game.path = rom_path;
  void *rom_data = NULL;
  if (!info.need_fullpath) {
    FILE *f = fopen(rom_path, "rb");
    if (!f) return load_failed(h, -4);
    fseek(f, 0, SEEK_END);
    long len = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (len <= 0) {
      fclose(f);
      return load_failed(h, -4);
    }
    rom_data = malloc((size_t)len);
    size_t got = rom_data ? fread(rom_data, 1, (size_t)len, f) : 0;
    fclose(f);
    if (got != (size_t)len) {
      free(rom_data);
      return load_failed(h, -4);
    }
    game.data = rom_data;
    game.size = (size_t)len;
  }

  bool ok = h->core.load_game(&game);
  free(rom_data);
  if (!ok) return load_failed(h, -5);
  // A core that asked to quit during the load has nothing to run.
  if (h->shutdown_requested) {
    if (h->core.unload_game) h->core.unload_game();
    return load_failed(h, -6);
  }

  struct retro_system_av_info av;
  memset(&av, 0, sizeof(av));
  h->core.get_system_av_info(&av);
  h->av.width = (int)av.geometry.base_width;
  h->av.height = (int)av.geometry.base_height;
  h->av.aspect =
      av.geometry.aspect_ratio > 0
          ? (double)av.geometry.aspect_ratio
          : (double)av.geometry.base_width /
                (double)(av.geometry.base_height > 0 ? av.geometry.base_height
                                                     : 1);
  h->av.fps = av.timing.fps > 0 ? av.timing.fps : 60;
  h->av.sample_rate = av.timing.sample_rate > 0 ? av.timing.sample_rate : 44100;

  int cap_frames = (int)(h->av.sample_rate * 0.25);
  h->ring_capacity = cap_frames * 2;
  h->ring = calloc((size_t)h->ring_capacity, sizeof(int16_t));
  h->ring_read = h->ring_write = h->ring_stored = 0;

  sram_load(h);
  h->core_loaded = 1;
  h->last_sram_flush_ns = now_ns();
  if (out_info) *out_info = h->av;
  return 0;
}

void lh_start(lh_host *h) {
  if (!h->core_loaded || h->has_thread || h->shutdown_requested) return;
  h->running = 1;
  h->paused = 0;
  mutex_lock(&h->jobs_lock);
  h->jobs_open = 1;
  mutex_unlock(&h->jobs_lock);
  thread_start(h);
}

void lh_pause(lh_host *h) { h->paused = 1; }
void lh_resume(lh_host *h) { h->paused = 0; }

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

void lh_stop(lh_host *h) {
  if (h->has_thread) {
    h->running = 0;
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
  g_session = NULL;
  free(h->system_dir);
  free(h->save_dir);
  free(h->sram_path);
  h->system_dir = h->save_dir = h->sram_path = NULL;
}

static void free_options(struct lh_host *h) {
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
  for (int i = 0; i < h->var_count; i++) {
    free(h->vars[i].key);
    free(h->vars[i].value);
  }
  free(h->vars);
  h->vars = NULL;
  h->var_count = 0;
}

void lh_destroy(lh_host *h) {
  if (!h) return;
  if (h->core_loaded || h->has_thread) lh_stop(h);
  free_options(h);
  free(h->front.data);
  free(h->back.data);
  free(h->ring);
  mutex_destroy(&h->vars_lock);
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

int lh_get_option(lh_host *h, int index, lh_option *out) {
  mutex_lock(&h->vars_lock);
  if (index < 0 || index >= h->def_count) {
    mutex_unlock(&h->vars_lock);
    return -1;
  }
  lh_optdef *def = &h->defs[index];
  const char *current = vars_get(h, def->id);
  out->id = def->id;
  out->label = def->label;
  out->current = current ? current
                         : (def->choice_count > 0 ? def->choices[0] : "");
  out->choices = (const char *const *)def->choices;
  out->choice_count = def->choice_count;
  mutex_unlock(&h->vars_lock);
  return 0;
}

void lh_set_option(lh_host *h, const char *id, const char *value) {
  mutex_lock(&h->vars_lock);
  vars_set(h, id, value);
  h->variables_dirty = 1;
  mutex_unlock(&h->vars_lock);
}
