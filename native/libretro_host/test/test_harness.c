// Headless check for the libretro host: loads the stub core, runs it, and
// verifies video conversion, input plumbing, audio, options, and a save-state
// round trip. Prints PASS or FAIL and exits non-zero on any failure.

#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "../libretro_host.h"

#ifdef _WIN32
#include <windows.h>
static void msleep(int ms) { Sleep(ms); }
#else
#include <time.h>
static void msleep(int ms) {
  struct timespec ts = {ms / 1000, (long)(ms % 1000) * 1000000L};
  nanosleep(&ts, NULL);
}
#endif

static int g_failures;
static atomic_int g_frames_ready;
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
static uint16_t on_poll_input(void *user, int port) {
  (void)user;
  return port == 0 ? g_mask : 0;
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
  cb.poll_input = on_poll_input;
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
  g_mask = 0x2A;

  lh_host *host = lh_create(fmt, make_callbacks());
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
    CHECK(lh_option_count(host) == 1, "one core option");
    lh_option opt;
    int opt_rc = lh_get_option(host, 0, &opt);
    CHECK(opt_rc == 0 && strcmp(opt.id, "stub_speed") == 0, "option id");
    CHECK(opt_rc == 0 && opt.choice_count == 2, "option choices");
    lh_set_option(host, "stub_speed", "fast");
    lh_get_option(host, 0, &opt);
    CHECK(strcmp(opt.current, "fast") == 0, "option value updates");

    lh_pause(host);
    msleep(40);
    size_t size = lh_serialize_size(host);
    CHECK(size > 0, "serialize size");
    uint8_t blob_a[64], blob_b[64], blob_c[64];
    CHECK(lh_serialize(host, blob_a, size) == 0, "serialize");
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

  test_format(core_path, rom_path, work_dir, LH_FORMAT_RGBA8888);
  test_format(core_path, rom_path, work_dir, LH_FORMAT_BGRA8888);
  test_shutdown(core_path, work_dir);

  printf("\n%s (%d failure%s)\n", g_failures == 0 ? "PASS" : "FAIL",
         g_failures, g_failures == 1 ? "" : "s");
  return g_failures == 0 ? 0 : 1;
}
