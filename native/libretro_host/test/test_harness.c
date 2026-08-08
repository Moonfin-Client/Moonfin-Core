// Headless check for the libretro host: loads the stub core, runs it, and
// verifies video conversion, input plumbing, audio, options, and a save-state
// round trip. Prints PASS or FAIL and exits non-zero on any failure.

#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../libretro_host.h"

#ifdef _WIN32
#include <windows.h>
static void msleep(int ms) { Sleep(ms); }
#else
#include <pthread.h>
#include <time.h>
static void msleep(int ms) {
  struct timespec ts = {ms / 1000, (long)(ms % 1000) * 1000000L};
  nanosleep(&ts, NULL);
}
#endif

static int g_failures;
static atomic_int g_frames_ready;

// Must match STUB_WIDTH/STUB_HEIGHT in stub_core.c. Deliberately non-square
// (and each dimension a different prime multiplier away from the other) so a
// rotation bug that transposes or mirrors the frame cannot hide behind a
// square or symmetric geometry.
#define SRC_W 64
#define SRC_H 48
static _Atomic uint16_t g_mask;
static atomic_int g_shutdowns;
static atomic_int g_late_runs;
static char g_last_message[128];

#define CHECK(cond, msg)                            \
  do {                                              \
    if (cond) {                                     \
      printf("  ok   %s\n", msg);                   \
    } else {                                        \
      printf("  FAIL %s\n", msg);                   \
      g_failures++;                                 \
    }                                               \
  } while (0)

static void on_frame_ready(void *user) {
  (void)user;
  g_frames_ready++;
}
static int on_controller_count(void *user) {
  (void)user;
  return 1;
}
static void on_geometry(void *user, int w, int h, double aspect) {
  (void)user;
  (void)w;
  (void)h;
  (void)aspect;
}

static void on_message(void *user, const char *text) {
  (void)user;
  if (!text) return;
  if (strstr(text, "after shutdown")) g_late_runs++;
  snprintf(g_last_message, sizeof(g_last_message), "%s", text);
}
static void on_core_shutdown(void *user) {
  (void)user;
  g_shutdowns++;
}

static lh_callbacks make_callbacks(void) {
  lh_callbacks cb;
  memset(&cb, 0, sizeof(cb));
  cb.frame_ready = on_frame_ready;
  cb.controller_count = on_controller_count;
  cb.geometry_changed = on_geometry;
  cb.message = on_message;
  cb.core_shutdown = on_core_shutdown;
  return cb;
}

static void write_rom(const char *path, const char *contents) {
  FILE *f = fopen(path, "wb");
  if (f) {
    fputs(contents, f);
    fclose(f);
  }
}

// ---------------------------------------------------------------------------
// Regression tests for the input OR-latch. Before this fix, poll_input
// returned the platform's raw instantaneous mask, and input_poll_cb was a
// no-op - so a press whose down and up both landed inside one ~16.7ms poll
// window was never observed by the core at all. lh_set_input now folds every
// write into a pending OR mask, and lh_test_poll_input runs the same latch
// step input_poll_cb runs on every real libretro poll, exchanging pending
// back down to the current level and handing the exchanged value to the
// frame the core reads. Driven directly through lh_set_input/
// lh_test_poll_input/lh_test_read_input rather than a loaded core, so the
// exact poll boundaries are deterministic instead of racing the run loop's
// wall-clock pacing.
// ---------------------------------------------------------------------------

static void test_input_latch(void) {
  printf("input latch:\n");
  lh_callbacks cb;
  memset(&cb, 0, sizeof(cb));
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, cb);
  CHECK(host != NULL, "latch test host allocates");
  if (!host) return;

  // The bug report, reproduced directly: a bit set and cleared entirely
  // between two polls must still be observed for exactly one frame.
  lh_set_input(host, 0, 0x0001);
  lh_set_input(host, 0, 0x0000);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0001,
        "a press+release inside one poll window is observed on the next poll");
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0000,
        "and is gone by the poll after that");

  // A bit held continuously stays set in every frame it's held, not just the
  // first one after it went down.
  lh_set_input(host, 0, 0x0002);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0002, "held bit observed frame 1");
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0002, "held bit still observed frame 2");
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0002, "held bit still observed frame 3");
  lh_set_input(host, 0, 0x0000);
  // A release of a bit that was already observed clears on the very next
  // poll. The latch no longer seeds pending with the level it read, so there
  // is nothing left over to re-report: pending holds only edges since the
  // last poll, and this release added none. A tap still survives (above),
  // because its press did OR an edge in before the release landed.
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0000,
        "a release of an already-observed bit clears on the next poll");

  // Simultaneous bits reported in one write must not tear: input_state_cb
  // reads each id from the same latched snapshot, not a fresh read per id.
  lh_set_input(host, 0, 0x8001);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x8001,
        "simultaneous bits in one write are not torn");
  lh_set_input(host, 0, 0x0000);
  lh_test_poll_input(host);

  // Clearing with no poll between the press and the release still yields
  // exactly one observation - this is an OR-latch, not "last write wins".
  lh_set_input(host, 0, 0x0004);
  lh_set_input(host, 0, 0x0000);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0004,
        "clearing without an intervening poll still yields one observation");
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0000, "and is gone on the poll after that");

  // Ports latch independently.
  lh_set_input(host, 0, 0x0010);
  lh_set_input(host, 1, 0x0020);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0010, "port 0 unaffected by port 1's write");
  CHECK(lh_test_read_input(host, 1) == 0x0020, "port 1 unaffected by port 0's write");

  lh_destroy(host);
}

// A core that asks to quit must be left alone afterwards, since running it
// again is what turns a failed boot into a native crash.
static void test_shutdown(const char *core_path, const char *work_dir) {
  printf("core shutdown:\n");
  char rom_path[1024];
  snprintf(rom_path, sizeof(rom_path), "%s/shutdown.rom", work_dir);
  write_rom(rom_path, "shutdown");
  g_shutdowns = 0;
  g_late_runs = 0;
  g_last_message[0] = '\0';

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "shutdown",
                   NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }
  lh_start(host);
  msleep(300);
  CHECK(g_shutdowns == 1, "shutdown reported once");
  CHECK(g_late_runs == 0, "core is not run after it quit");
  CHECK(strcmp(g_last_message, "stub boot failed") == 0, "core message shown");

  // A save state after the loop is gone must fail rather than wait forever.
  CHECK(lh_serialize_size(host) == 0, "serialize refused after shutdown");

  lh_stop(host);
  lh_destroy(host);
}

static void test_format(const char *core_path, const char *rom_path,
                        const char *work_dir, lh_output_format fmt) {
  printf("format %s:\n", fmt == LH_FORMAT_RGBA8888 ? "RGBA" : "BGRA");
  g_frames_ready = 0;

  lh_host *host = lh_create(fmt, make_callbacks());
  // Held continuously, so it's still in effect whichever frame the pixel
  // check below happens to land on - this test is about pixel conversion,
  // not the latch itself (see test_input_latch for that).
  lh_set_input(host, 0, 0x2A);
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "testgame",
                   NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads");
  if (rc != 0) {
    printf("  load returned %d\n", rc);
    lh_destroy(host);
    return;
  }
  CHECK(av.width == 64 && av.height == 48, "av geometry");
  CHECK(av.fps > 59 && av.fps < 61, "av fps");
  CHECK(av.sample_rate > 44099 && av.sample_rate < 44101, "av sample rate");

  lh_start(host);
  msleep(200);
  CHECK(g_frames_ready > 0, "frames delivered");

  const void *data;
  int w, h, stride;
  int got = lh_get_frame(host, &data, &w, &h, &stride);
  CHECK(got == 1, "frame available");
  if (got) {
    const uint8_t *px = (const uint8_t *)data;
    CHECK(w == 64 && h == 48 && stride == 256, "frame dimensions");
    CHECK(px[3] == 0xFF, "alpha forced opaque");
    if (fmt == LH_FORMAT_RGBA8888) {
      // RGBA byte order: R, G(mask), B(0x55), A.
      CHECK(px[1] == 0x2A, "input mask in green channel");
      CHECK(px[2] == 0x55, "constant blue channel");
    } else {
      // BGRA byte order: B(0x55), G(mask), R, A.
      CHECK(px[0] == 0x55, "constant blue channel");
      CHECK(px[1] == 0x2A, "input mask in green channel");
    }
  }

  int16_t audio[512 * 2];
  int read = lh_read_audio(host, audio, 512);
  CHECK(read > 0, "audio produced");

  if (fmt == LH_FORMAT_RGBA8888) {
    // stub_speed, stub_pattern, stub_rotation, stub_format, stub_huge_frame,
    // stub_bad_pitch.
    CHECK(lh_option_count(host) == 6, "six core options");
    lh_option opt;
    int opt_rc = lh_get_option(host, 0, &opt);
    CHECK(opt_rc == 0 && strcmp(opt.id, "stub_speed") == 0, "option id");
    CHECK(opt_rc == 0 && opt.choice_count == 2, "option choices");
    lh_set_option(host, "stub_speed", "fast");
    lh_get_option(host, 0, &opt);
    CHECK(strcmp(opt.current, "fast") == 0, "option value updates");

    lh_pause(host);
    msleep(40);
    unsigned gen_before = lh_restart_generation(host);
    CHECK(lh_restart_async(host) == 0, "core restart schedules");
    // The flag is only checked at the top of the run loop, and the paused
    // branch sleeps up to 16ms before rechecking it, so a caller cannot infer
    // the restart has landed just because lh_restart_async returned. Poll the
    // generation counter for a real barrier before reading post-restart state.
    int waited_ms = 0;
    while (lh_restart_generation(host) == gen_before && waited_ms < 2000) {
      msleep(5);
      waited_ms += 5;
    }
    CHECK(lh_restart_generation(host) != gen_before,
          "core restart applied before timeout");
    size_t size = lh_serialize_size(host);
    uint8_t blob_a[64], blob_b[64], blob_c[64];
    CHECK(size > 0, "serialize size");
    CHECK(lh_serialize(host, blob_a, size) == 0, "serialize after restart");
    CHECK(lh_option_count(host) == 6, "restart replaces option definitions");
    lh_get_option(host, 0, &opt);
    CHECK(strcmp(opt.current, "fast") == 0, "restart retains option value");
    int32_t restart_marker;
    memcpy(&restart_marker, blob_a + sizeof(int32_t), sizeof(restart_marker));
    CHECK(restart_marker == 1,
          "restart applies option during core initialization");
    lh_resume(host);
    msleep(80);
    lh_pause(host);
    msleep(40);
    lh_serialize(host, blob_b, size);
    CHECK(memcmp(blob_a, blob_b, size) != 0, "state advances while running");
    CHECK(lh_unserialize(host, blob_a, size) == 0, "unserialize");
    lh_serialize(host, blob_c, size);
    CHECK(memcmp(blob_a, blob_c, size) == 0, "state restored");
    lh_resume(host);
  }

  lh_stop(host);
  lh_destroy(host);
}

// Reproduces the RETRO_ENVIRONMENT_SET_ROTATION semantics convert_frame
// implements: 0/1/2/3 are 0/90/180/270 degrees counter-clockwise. Rotation 1
// sends the source's rightmost column to the top output row; rotation 3
// (clockwise from the viewer's perspective) sends the leftmost column to the
// top row. This mirrors the spec, not convert_frame's internals, so it is an
// independent check rather than a restatement of the code under test.
static void rotate_point(int rotation, int src_w, int src_h, int x, int y,
                         int *out_row, int *out_col) {
  switch (rotation) {
    case 1:  // 90 CCW
      *out_row = (src_w - 1) - x;
      *out_col = y;
      break;
    case 2:  // 180
      *out_row = (src_h - 1) - y;
      *out_col = (src_w - 1) - x;
      break;
    case 3:  // 270 CCW
      *out_row = x;
      *out_col = (src_h - 1) - y;
      break;
    default:  // 0
      *out_row = y;
      *out_col = x;
      break;
  }
}

// Reduces an 8-bit channel to the precision a 5- or 6-bit pixel format keeps
// and expands it back exactly as unpack_pixel does, so the expected value
// accounts for the format's lossy round trip instead of assuming full
// precision.
static unsigned quantize5(unsigned v) {
  unsigned v5 = v >> 3;
  return (v5 << 3) | (v5 >> 2);
}
static unsigned quantize6(unsigned v) {
  unsigned v6 = v >> 2;
  return (v6 << 2) | (v6 >> 4);
}

// fmt_tag: 0 = xrgb8888 (full precision), 1 = rgb565, 2 = 0rgb1555.
static void expected_rgb(unsigned fmt_tag, int x, int y, unsigned *r,
                         unsigned *g, unsigned *b) {
  unsigned raw_r = (unsigned)(x * 3) & 0xFF;
  unsigned raw_g = (unsigned)(y * 5) & 0xFF;
  unsigned raw_b = 0x11;
  if (fmt_tag == 0) {
    *r = raw_r;
    *g = raw_g;
    *b = raw_b;
  } else if (fmt_tag == 1) {
    *r = quantize5(raw_r);
    *g = quantize6(raw_g);
    *b = quantize5(raw_b);
  } else {
    *r = quantize5(raw_r);
    *g = quantize5(raw_g);
    *b = quantize5(raw_b);
  }
}

static void check_pixel(const uint8_t *px, int out_width, int row, int col,
                        unsigned exp_r, unsigned exp_g, unsigned exp_b,
                        const char *label) {
  size_t off = ((size_t)row * (size_t)out_width + (size_t)col) * 4;
  char msg[96];
  snprintf(msg, sizeof(msg), "%s -> row %d col %d", label, row, col);
  CHECK(px[off] == exp_r && px[off + 1] == exp_g && px[off + 2] == exp_b, msg);
}

// Drives the stub core's coordinate test pattern through one rotation/format
// combination and checks both corners (catches a swapped axis) and an
// interior asymmetric point (catches a transpose that corners alone would
// miss, since corner values are the same for the CW and CCW quarter turns).
static void test_rotation(const char *core_path, const char *rom_path,
                          const char *work_dir, int rotation,
                          const char *fmt_name, unsigned fmt_tag) {
  printf("rotation %d (%s):\n", rotation, fmt_name);

  char rot_str[4];
  snprintf(rot_str, sizeof(rot_str), "%d", rotation);
  const char *keys[] = {"stub_pattern", "stub_rotation", "stub_format"};
  const char *vals[] = {"on", rot_str, fmt_name};

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "rotgame",
                   keys, vals, 3, &av);
  CHECK(rc == 0, "rotation core loads");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }

  int quarter = rotation == 1 || rotation == 3;
  int out_w = quarter ? SRC_H : SRC_W;
  int out_h = quarter ? SRC_W : SRC_H;
  CHECK(av.width == out_w && av.height == out_h, "rotated geometry");

  lh_start(host);
  msleep(200);

  const void *data;
  int w, h, stride;
  int got = lh_get_frame(host, &data, &w, &h, &stride);
  CHECK(got == 1, "rotation frame available");
  if (got) {
    CHECK(w == out_w && h == out_h, "rotation frame dimensions");
    const uint8_t *px = (const uint8_t *)data;

    struct {
      int x, y;
      const char *name;
    } corners[] = {
        {0, 0, "top-left source"},
        {SRC_W - 1, 0, "top-right source"},
        {0, SRC_H - 1, "bottom-left source"},
        {SRC_W - 1, SRC_H - 1, "bottom-right source"},
    };
    int max_index = -1;
    for (size_t i = 0; i < sizeof(corners) / sizeof(corners[0]); i++) {
      int row, col;
      rotate_point(rotation, SRC_W, SRC_H, corners[i].x, corners[i].y, &row,
                  &col);
      unsigned er, eg, eb;
      expected_rgb(fmt_tag, corners[i].x, corners[i].y, &er, &eg, &eb);
      check_pixel(px, out_w, row, col, er, eg, eb, corners[i].name);
      int idx = row * out_w + col;
      if (idx > max_index) max_index = idx;
    }
    // Every rotation is a bijection over the source rectangle, so the corner
    // farthest from the origin always lands on the last destination pixel.
    CHECK(max_index == out_w * out_h - 1, "max destination index");

    // Interior point away from any symmetry axis: this is what actually
    // distinguishes a 90-degree CW turn from CCW, which corners cannot.
    int irow, icol;
    rotate_point(rotation, SRC_W, SRC_H, 10, 3, &irow, &icol);
    unsigned er, eg, eb;
    expected_rgb(fmt_tag, 10, 3, &er, &eg, &eb);
    check_pixel(px, out_w, irow, icol, er, eg, eb, "interior source");
  }

  lh_stop(host);
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Regression test for the shutdown deadlock: run_job queues a job onto the
// emulation thread and waits on job->done; lh_stop clears h->running and
// joins that same thread. Before the fix, lh_stop's write and run_job's
// queue-or-execute check were unsynchronized, and run_loop only drained the
// queue inside its while(running) body - so a job that got queued in the
// narrow window around shutdown could wait on jobs_cond forever, hanging
// whatever thread called it (the ANR scenario: a UI thread doing a
// save-state right before exit). The fix serializes both decisions on
// jobs_lock and adds a final drain after the loop exits, which makes the
// race harmless rather than merely narrower - but this test still drives the
// exact concurrent pattern (a job-issuing thread racing lh_stop with no
// artificial delay) so a regression has a realistic chance of being caught
// again.
// ---------------------------------------------------------------------------

typedef struct {
  lh_host *host;
  void *buf;
  size_t size;
  atomic_int done;
} stop_race_ctx;

static void stop_race_run(stop_race_ctx *ctx) {
  // The return value doesn't matter to this test - a job that gets dropped
  // (e.g. by the full-queue path added alongside this fix) still has to
  // complete and set done, it just completes with a failure result instead
  // of hanging. Only "did this ever return" is being checked here.
  lh_serialize(ctx->host, ctx->buf, ctx->size);
  atomic_store(&ctx->done, 1);
}

#ifdef _WIN32
static DWORD WINAPI stop_race_thread(LPVOID arg) {
  stop_race_run((stop_race_ctx *)arg);
  return 0;
}
#else
static void *stop_race_thread(void *arg) {
  stop_race_run((stop_race_ctx *)arg);
  return NULL;
}
#endif

static void test_stop_with_queued_job(const char *core_path,
                                      const char *rom_path,
                                      const char *work_dir) {
  printf("stop races a queued job:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "stopracegame", NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for stop-race test");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }
  lh_start(host);
  msleep(50);  // let the run loop actually start iterating

  size_t size = lh_serialize_size(host);
  uint8_t *buf = malloc(size > 0 ? size : 1);
  stop_race_ctx ctx = {host, buf, size, 0};

#ifdef _WIN32
  HANDLE th = CreateThread(NULL, 0, stop_race_thread, &ctx, 0, NULL);
#else
  pthread_t th;
  pthread_create(&th, NULL, stop_race_thread, &ctx);
#endif

  // No sleep between spawning the helper thread and stopping: the race this
  // test targets is exactly "run_job and lh_stop's running=0 happen at
  // nearly the same instant", and inserting a delay here would only make it
  // easier to accidentally avoid.
  lh_stop(host);

  // A blocking join here would itself hang the whole test binary if this
  // regressed, defeating the point of a test. Poll instead, so a regression
  // reports FAIL and the harness still finishes (and reports failure).
  int waited_ms = 0;
  while (!atomic_load(&ctx.done) && waited_ms < 2000) {
    msleep(5);
    waited_ms += 5;
  }
  CHECK(atomic_load(&ctx.done),
        "job thread returns instead of hanging when lh_stop races it");

  if (atomic_load(&ctx.done)) {
#ifdef _WIN32
    WaitForSingleObject(th, INFINITE);
    CloseHandle(th);
#else
    pthread_join(th, NULL);
#endif
  }
  // If ctx.done never became true the helper thread is (by definition of the
  // bug this guards against) permanently blocked on jobs_cond; joining it
  // would hang the harness right after already reporting the failure, so it
  // is deliberately leaked here and reclaimed by the OS at process exit.

  free(buf);
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Regression tests for the unbounded/unvalidated frame geometry fixes: a
// frame the host must reject (either because a dimension is absurd, or
// because the pitch is too small to hold one real scanline) should be
// dropped cleanly - no crash, no delivered frame, no frame_ready signal -
// rather than converted into an undersized or overrun buffer.
// ---------------------------------------------------------------------------

static void test_rejects_bad_frame(const char *core_path, const char *rom_path,
                                   const char *work_dir, const char *var_key,
                                   const char *game_id, const char *label) {
  printf("%s:\n", label);
  g_frames_ready = 0;
  const char *keys[] = {var_key};
  const char *vals[] = {"on"};

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, game_id,
                   keys, vals, 1, &av);
  CHECK(rc == 0, "core loads with the bad-frame variable set");
  if (rc == 0) {
    lh_start(host);
    msleep(150);

    const void *data;
    int w, h, stride;
    int got = lh_get_frame(host, &data, &w, &h, &stride);
    CHECK(got == 0, "rejected frame never becomes available");
    CHECK(g_frames_ready == 0, "frame_ready is never signalled for a rejected frame");

    lh_stop(host);
  }
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Regression test for the lh_get_option use-after-free: lh_get_option used to
// hand back pointers borrowed from h->defs and h->vars and then unlock, so the
// caller read them with nothing holding them alive. Two different threads free
// exactly those allocations - the emulation thread through restart_core ->
// free_option_definitions, and whichever thread calls lh_set_option through
// vars_set - which is the ordinary "restart the core, then open the options
// menu" sequence on Android, where the enumeration runs on the platform thread.
//
// The contract is now a caller-owned snapshot, so this test takes one, lets
// both invalidators run, and reads the snapshot afterwards. Under ASAN a
// regression reports heap-use-after-free; without ASAN the freed bytes usually
// still read back correctly, so the string comparisons below are the weaker
// backstop and the ASAN build is the real check.
// ---------------------------------------------------------------------------

static void test_option_snapshot_survives_invalidation(const char *core_path,
                                                       const char *rom_path,
                                                       const char *work_dir) {
  printf("option snapshot outlives its definitions:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "optlifegame",
                   NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for the option lifetime test");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }
  lh_start(host);
  msleep(50);

  // Invalidator 1: lh_set_option frees the previous value string.
  lh_option before_set;
  CHECK(lh_get_option(host, 0, &before_set) == 0, "snapshot before set_option");
  CHECK(strcmp(before_set.id, "stub_speed") == 0, "snapshot id");
  lh_set_option(host, "stub_speed", "fast");
  CHECK(strcmp(before_set.current, "normal") == 0,
        "snapshot value survives lh_set_option freeing the old value");

  // Invalidator 2: restart_core runs free_option_definitions on the emulation
  // thread, freeing every id, label, and choice string the snapshot points at.
  lh_option before_restart;
  CHECK(lh_get_option(host, 0, &before_restart) == 0, "snapshot before restart");
  CHECK(before_restart.choice_count == 2, "snapshot choice count");

  lh_pause(host);
  msleep(40);
  unsigned gen_before = lh_restart_generation(host);
  CHECK(lh_restart_async(host) == 0, "restart schedules for the lifetime test");
  int waited_ms = 0;
  while (lh_restart_generation(host) == gen_before && waited_ms < 2000) {
    msleep(5);
    waited_ms += 5;
  }
  CHECK(lh_restart_generation(host) != gen_before, "restart applied");

  CHECK(strcmp(before_restart.id, "stub_speed") == 0,
        "snapshot id survives a concurrent restart");
  CHECK(strcmp(before_restart.label, "Speed") == 0,
        "snapshot label survives a concurrent restart");
  CHECK(strcmp(before_restart.current, "fast") == 0,
        "snapshot value survives a concurrent restart");
  CHECK(before_restart.choice_count == 2 &&
            strcmp(before_restart.choices[0], "normal") == 0 &&
            strcmp(before_restart.choices[1], "fast") == 0,
        "snapshot choices survive a concurrent restart");

  // Out-of-range and NULL arguments must be rejected without writing anything.
  lh_option unused;
  CHECK(lh_get_option(host, -1, &unused) != 0, "negative index rejected");
  CHECK(lh_get_option(host, 9999, &unused) != 0, "past-the-end index rejected");
  CHECK(lh_get_option(host, 0, NULL) != 0, "NULL out param rejected");
  CHECK(lh_get_option(NULL, 0, &unused) != 0, "NULL host rejected");

  lh_resume(host);
  lh_stop(host);
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Regression test for the GET_VARIABLE use-after-free. The host hands the core
// a raw pointer into h->vars and unlocks; the core is entitled to keep that
// pointer across frames. vars_set used to free the replaced value in place
// from whichever thread called lh_set_option - the platform thread, on the
// ordinary "change a core option in the pause menu" path - while the core on
// the emulation thread still held it.
//
// The stub core stashes the "stub_speed" pointer on its first frame and reads
// it again on the frame that observes GET_VARIABLE_UPDATE, which is exactly
// the frame after the lh_set_option below. It reports the result through the
// third word of its save state: 1 = the stashed pointer still read back
// correctly, 2 = the bytes had changed, 0 = the re-read never happened. Under
// ASAN a regression is a heap-use-after-free on that read; without ASAN the
// freed bytes usually still read back intact, so the assertion below is the
// weaker backstop and the ASAN build is the real check.
// ---------------------------------------------------------------------------

static void test_option_value_outlives_set_option(const char *core_path,
                                                  const char *rom_path,
                                                  const char *work_dir) {
  printf("option value outlives a concurrent set_option:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "varlifegame",
                   NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for the option value lifetime test");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }
  lh_start(host);
  msleep(60);  // let the core stash the pointer on an early frame

  // The platform thread replaces the value the core is still holding.
  lh_set_option(host, "stub_speed", "fast");
  msleep(80);  // let the core observe the update and re-read its stash

  size_t size = lh_serialize_size(host);
  uint8_t blob[64];
  CHECK(size >= sizeof(int32_t) * 3 && size <= sizeof(blob),
        "stub state carries the stash result");
  if (size >= sizeof(int32_t) * 3 && size <= sizeof(blob)) {
    CHECK(lh_serialize(host, blob, size) == 0, "serialize for stash result");
    int32_t stash_recheck;
    memcpy(&stash_recheck, blob + sizeof(int32_t) * 2, sizeof(stash_recheck));
    CHECK(stash_recheck != 0,
          "core re-read its stashed option pointer after the change");
    CHECK(stash_recheck == 1,
          "the stashed GET_VARIABLE pointer is still readable and intact "
          "after lh_set_option replaced the value");
  }

  // Retiring instead of freeing must not turn into an unbounded leak: every
  // one of these 100 replaced strings has to be reclaimed by the drain in
  // lh_stop. Under ASAN's leak checker a drain that misses entries shows up
  // here.
  for (int i = 0; i < 100; i++) {
    lh_set_option(host, "stub_speed", (i & 1) ? "normal" : "fast");
  }

  lh_stop(host);
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Regression test for the truncated-SRAM-file fix: sram_load used to ignore
// fread's return value, so a .srm shorter than the core's declared SAVE_RAM
// size silently left the tail of the buffer at whatever retro_init put
// there instead of reporting anything. It now logs a warning through
// cb.log_message on a short read (and stays silent on a full one).
// ---------------------------------------------------------------------------

// The core's own load path (SET_ROTATION, etc.) logs unconditionally, so the
// signal to look for is specifically the sram_load warning, not "was
// log_message called at all".
static int g_saw_sram_warning;

static void on_log_message(void *user, const char *message) {
  (void)user;
  if (message && strstr(message, "sram_load") != NULL) {
    g_saw_sram_warning = 1;
  }
}

static void test_truncated_sram_warns(const char *core_path,
                                      const char *rom_path,
                                      const char *work_dir) {
  printf("truncated SRAM file logs a warning:\n");

  // The stub core's SAVE_RAM is 64 bytes (see stub_core.c); write far fewer
  // so sram_load's fread comes back short.
  char srm_path[1024];
  snprintf(srm_path, sizeof(srm_path), "%s/%s.srm", work_dir, "sramtruncgame");
  FILE *f = fopen(srm_path, "wb");
  CHECK(f != NULL, "truncated .srm file created");
  if (f) {
    uint8_t partial[10] = {0};
    fwrite(partial, 1, sizeof(partial), f);
    fclose(f);
  }

  g_saw_sram_warning = 0;
  lh_callbacks cb = make_callbacks();
  cb.message = on_log_message;
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, cb);
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "sramtruncgame", NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads with a truncated SRAM file present");
  CHECK(g_saw_sram_warning, "a short SRAM read is logged");
  lh_destroy(host);

  // A full-length file must load quietly - no false positives on the
  // ordinary path.
  f = fopen(srm_path, "wb");
  CHECK(f != NULL, "full-length .srm file created");
  if (f) {
    uint8_t full[64] = {0};
    fwrite(full, 1, sizeof(full), f);
    fclose(f);
  }
  g_saw_sram_warning = 0;
  lh_host *host2 = lh_create(LH_FORMAT_RGBA8888, cb);
  rc = lh_load(host2, core_path, rom_path, work_dir, work_dir,
              "sramtruncgame", NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads with a full-length SRAM file present");
  CHECK(!g_saw_sram_warning, "a full-length SRAM read stays quiet");
  lh_destroy(host2);
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("usage: %s <stub_core> <work_dir>\n", argv[0]);
    return 2;
  }
  const char *core_path = argv[1];
  const char *work_dir = argv[2];
  char rom_path[1024];
  snprintf(rom_path, sizeof(rom_path), "%s/dummy.rom", work_dir);
  write_rom(rom_path, "stub-rom");

  // A failed load must clean up fully so a later load still works.
  printf("negative load:\n");
  lh_host *bad = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info bad_av;
  int bad_rc = lh_load(bad, core_path, "/no/such/rom.bin", work_dir, work_dir,
                       "missing", NULL, NULL, 0, &bad_av);
  CHECK(bad_rc != 0, "missing rom fails load");
  lh_destroy(bad);

  test_input_latch();

  test_format(core_path, rom_path, work_dir, LH_FORMAT_RGBA8888);
  test_format(core_path, rom_path, work_dir, LH_FORMAT_BGRA8888);
  test_shutdown(core_path, work_dir);

  // All four rotations at full precision: rotation is the risky axis for
  // convert_frame, so it gets complete coverage against one format.
  test_rotation(core_path, rom_path, work_dir, 0, "xrgb8888", 0);
  test_rotation(core_path, rom_path, work_dir, 1, "xrgb8888", 0);
  test_rotation(core_path, rom_path, work_dir, 2, "xrgb8888", 0);
  test_rotation(core_path, rom_path, work_dir, 3, "xrgb8888", 0);
  // Quarter turns again against the two reduced-precision formats, where the
  // index math and the unpack shifts interact.
  test_rotation(core_path, rom_path, work_dir, 1, "rgb565", 1);
  test_rotation(core_path, rom_path, work_dir, 3, "rgb565", 1);
  test_rotation(core_path, rom_path, work_dir, 1, "0rgb1555", 2);
  test_rotation(core_path, rom_path, work_dir, 3, "0rgb1555", 2);

  test_stop_with_queued_job(core_path, rom_path, work_dir);

  test_option_snapshot_survives_invalidation(core_path, rom_path, work_dir);

  test_option_value_outlives_set_option(core_path, rom_path, work_dir);

  test_rejects_bad_frame(core_path, rom_path, work_dir, "stub_huge_frame",
                        "hugeframegame", "oversized geometry frame rejected");
  test_rejects_bad_frame(core_path, rom_path, work_dir, "stub_bad_pitch",
                        "badpitchgame", "undersized pitch frame rejected");

  test_truncated_sram_warns(core_path, rom_path, work_dir);

  // Regression test for the SRAM path traversal fix: game_id flows straight
  // into sram_path (save_dir/game_id.srm), and ultimately originates from a
  // route parameter seeded by server data, so it must be rejected outright
  // rather than sanitized whenever it could escape save_dir.
  printf("game_id path traversal:\n");
  lh_host *traversal_slash = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info traversal_av;
  int traversal_rc =
      lh_load(traversal_slash, core_path, rom_path, work_dir, work_dir,
             "../escape", NULL, NULL, 0, &traversal_av);
  CHECK(traversal_rc == -8, "game_id containing .. is rejected");
  lh_destroy(traversal_slash);

  lh_host *traversal_backslash = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  int traversal_rc2 =
      lh_load(traversal_backslash, core_path, rom_path, work_dir, work_dir,
             "sub\\dir", NULL, NULL, 0, &traversal_av);
  CHECK(traversal_rc2 == -8, "game_id containing a backslash is rejected");
  lh_destroy(traversal_backslash);

  lh_host *traversal_ok = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  int traversal_rc3 = lh_load(traversal_ok, core_path, rom_path, work_dir,
                              work_dir, "normal-game-id", NULL, NULL, 0,
                              &traversal_av);
  CHECK(traversal_rc3 == 0, "an ordinary game_id still loads");
  lh_destroy(traversal_ok);

  printf("\n%s (%d failure%s)\n", g_failures == 0 ? "PASS" : "FAIL",
         g_failures, g_failures == 1 ? "" : "s");
  return g_failures == 0 ? 0 : 1;
}
