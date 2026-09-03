// Headless check for the libretro host: loads the stub core, runs it, and
// verifies video conversion, input plumbing, audio, options, and a save-state
// round trip. Prints PASS or FAIL and exits non-zero on any failure.

#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../libretro_host.h"
#include "../libretro.h"

#ifdef _WIN32
#include <direct.h>
#include <windows.h>
static void msleep(int ms) { Sleep(ms); }
static int make_dir(const char *path) { return _mkdir(path); }
#else
#include <pthread.h>
#include <sys/stat.h>
#include <time.h>
static void msleep(int ms) {
  struct timespec ts = {ms / 1000, (long)(ms % 1000) * 1000000L};
  nanosleep(&ts, NULL);
}
static int make_dir(const char *path) { return mkdir(path, 0755); }
#endif

static int g_failures;
static atomic_int g_frames_ready;

// Must match STUB_WIDTH/STUB_HEIGHT in stub_core.c. Deliberately non-square
// (and each dimension a different prime multiplier away from the other) so a
// rotation bug that transposes or mirrors the frame cannot hide behind a
// square or symmetric geometry.
#define SRC_W 64
#define SRC_H 48
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
static atomic_int g_geometry_calls;
static void on_geometry(void *user, int w, int h, double aspect) {
  (void)user;
  (void)w;
  (void)h;
  (void)aspect;
  g_geometry_calls++;
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
// Regression tests for the digital input latch. Before this fix, poll_input
// returned the platform's raw instantaneous mask, and input_poll_cb was a
// no-op - so a press whose down and up both landed inside one ~16.7ms poll
// window was never observed by the core at all. lh_set_input now records
// transitions, and lh_test_poll_input runs the same latch step the run loop
// executes before retro_run. Driven directly through lh_set_input/
// lh_test_poll_input/lh_test_read_input rather than a loaded core, so the
// exact poll boundaries are deterministic instead of racing the run loop's
// wall-clock pacing.
// ---------------------------------------------------------------------------

// Observes every port, discarding the result, so an edge deliberately left
// unread by one section cannot bleed into the next. Under the delivery
// contract an unacknowledged bit survives polls on purpose - that is the whole
// point - so sections that peek with lh_test_read_input rather than reading
// like a core have to hand the latch back before the next one starts.
// Isolation only; no assertion here relies on it.
static void drain_latch(lh_host *host) {
  for (int p = 0; p < 4; p++) (void)lh_test_observe_input(host, p);
}

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
  CHECK(lh_test_observe_input(host, 0) == 0x0001,
        "a press+release inside one poll window is observed on the next poll");
  lh_test_poll_input(host);
  CHECK(lh_test_observe_input(host, 0) == 0x0000,
        "and is gone by the poll after that");

  // A bit held continuously stays set in every frame it's held, not just the
  // first one after it went down.
  lh_set_input(host, 0, 0x0002);
  lh_test_poll_input(host);
  CHECK(lh_test_observe_input(host, 0) == 0x0002, "held bit observed frame 1");
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

  drain_latch(host);
  // Clearing with no poll between the press and the release still yields
  // exactly one complete DOWN/UP sequence, not "last write wins".
  lh_set_input(host, 0, 0x0004);
  lh_set_input(host, 0, 0x0000);
  lh_test_poll_input(host);
  CHECK(lh_test_observe_input(host, 0) == 0x0004,
        "clearing without an intervening poll still yields one observation");
  lh_test_poll_input(host);
  CHECK(lh_test_observe_input(host, 0) == 0x0000, "and is gone on the poll after that");

  drain_latch(host);
  // Pausing suspends polling, so without lh_resume dropping the latch a button
  // pressed while paused would fire on the first frame after resuming -- the
  // reported bug: a button tested in the controller panel peppering in game.
  lh_set_input(host, 0, 0x0010);
  lh_set_input(host, 0, 0x0000);
  lh_pause(host);
  lh_resume(host);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0000,
        "a press made while paused does not fire after resuming");

  // The other half: a button genuinely still held across the resume must keep
  // working, which is why only pending is dropped and never the level.
  lh_set_input(host, 0, 0x0020);
  lh_pause(host);
  lh_resume(host);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0020,
        "a button still held across a resume is preserved");
  lh_set_input(host, 0, 0x0000);
  lh_test_poll_input(host);

  drain_latch(host);
  // Ports latch independently.
  lh_set_input(host, 0, 0x0010);
  lh_set_input(host, 1, 0x0020);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0010, "port 0 unaffected by port 1's write");
  CHECK(lh_test_read_input(host, 1) == 0x0020, "port 1 unaffected by port 0's write");

  lh_destroy(host);
}

// Regression coverage for the transition-preserving digital latch. The
// existing test_input_latch checks the original one-frame delivery contract;
// these cases specifically require a release and a following press to remain
// distinct when they arrive between frontend frames. Every assertion that
// represents a core read goes through read_joypad via the test hooks, rather
// than inspecting the host's private frame slot alone.
static void test_input_transition_latch(void) {
  printf("input transition latch:\n");
  const uint16_t b = (uint16_t)(1u << RETRO_DEVICE_ID_JOYPAD_B);

  // This is the measured bug: after DOWN was delivered, UP+DOWN between
  // frames must expose a real release before the second rising edge.
  {
    lh_host *h = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "the first B press is observed");

    lh_set_input(h, 0, 0);
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 0,
          "a release before a re-press is observable as UP");
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "the re-press is observable as a second rising edge");
    lh_destroy(h);
  }

  // When an extra-fast sequence ends held, retained transitions must settle
  // back to the real physical level instead of leaving the core released.
  {
    lh_host *h = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(h, 0, b);
    lh_set_input(h, 0, 0);
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == b,
          "a rapid sequence ending held first exposes DOWN");
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == 0,
          "the intervening release remains observable");
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == b,
          "then the core settles on the final held level");
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == b,
          "the final held level remains stable");
    lh_destroy(h);
  }

  // A zero-valued release must acknowledge the transition at both supported
  // query granularities. Otherwise a following DOWN remains blocked forever.
  {
    lh_host *h = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == b, "a mask query observes DOWN");
    lh_set_input(h, 0, 0);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == 0,
          "a mask query observes and acknowledges zero-valued UP");
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input(h, 0) == b,
          "a mask-acknowledged release permits the next DOWN");
    lh_destroy(h);

    h = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "an individual query observes DOWN");
    lh_set_input(h, 0, 0);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 0,
          "an individual query observes and acknowledges zero-valued UP");
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "an individually acknowledged release permits the next DOWN");
    lh_destroy(h);
  }

  // The run loop latches once before retro_run, and a compliant core may call
  // input_poll inside that run. The second call must not consume the deferred
  // DOWN in the same emulation frame, or UP+DOWN collapses again.
  {
    lh_host *h = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    lh_test_core_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "the first frame exposes DOWN once to a polling core");
    lh_set_input(h, 0, 0);
    lh_set_input(h, 0, b);
    lh_test_poll_input(h);
    lh_test_core_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 0,
          "a compliant core sees UP, not a second transition, that frame");
    lh_test_core_poll_input(h);
    CHECK((lh_test_read_input(h, 0) & b) == 0,
          "another core poll cannot advance DOWN in the same frame");
    lh_test_poll_input(h);
    lh_test_core_poll_input(h);
    CHECK(lh_test_observe_input_id(h, 0, RETRO_DEVICE_ID_JOYPAD_B) == 1,
          "the deferred DOWN waits for the following frame");
    lh_destroy(h);
  }

}

// ---------------------------------------------------------------------------
// Analog passthrough (RETRO_DEVICE_ANALOG). Mirrors test_input_latch's style:
// driven directly through lh_set_pad_state/lh_test_poll_input and the
// frame-snapshot hooks, so poll boundaries are deterministic instead of
// racing a running core. See test_analog_via_core below for the coverage that
// requires calling through the real input_state_cb dispatch.
// ---------------------------------------------------------------------------

static void test_analog_passthrough(void) {
  printf("analog passthrough:\n");
  lh_callbacks cb;
  memset(&cb, 0, sizeof(cb));
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, cb);
  CHECK(host != NULL, "analog test host allocates");
  if (!host) return;

  // Round trip: left and right stick axes come back exactly as set.
  lh_set_pad_state(host, 0, 0, 100, -200, 300, -400, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 100, "left stick X round-trips");
  CHECK(lh_test_read_analog(host, 0, 0, 1) == -200, "left stick Y round-trips");
  CHECK(lh_test_read_analog(host, 0, 1, 0) == 300, "right stick X round-trips");
  CHECK(lh_test_read_analog(host, 0, 1, 1) == -400, "right stick Y round-trips");

  // Full-scale values round-trip too (int16 boundary).
  lh_set_pad_state(host, 0, 0, 32767, -32768, -32768, 32767, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 32767,
        "max positive axis round-trips");
  CHECK(lh_test_read_analog(host, 0, 0, 1) == -32768,
        "max negative axis round-trips");

  // Torn-diagonal: X and Y written together in one call are always read back
  // as that same pair, never mixed with a previous or later write.
  lh_set_pad_state(host, 0, 0, 1000, 2000, 0, 0, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 1000 &&
            lh_test_read_analog(host, 0, 0, 1) == 2000,
        "pair A reads back as pair A, not torn");
  lh_set_pad_state(host, 0, 0, -3000, 4000, 0, 0, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == -3000 &&
            lh_test_read_analog(host, 0, 0, 1) == 4000,
        "pair B reads back as pair B, not torn");

  // NOT transition-latched: two writes inside one poll window yield the
  // SECOND value, unlike the digital latch (see test_input_latch's
  // "clearing without an intervening poll" case, which preserves an edge that
  // landed entirely inside one window instead of discarding it). An axis has
  // no press/release semantics to preserve, so this is deliberately the
  // opposite behaviour.
  lh_set_pad_state(host, 0, 0, 111, 222, 0, 0, 0, 0);
  lh_set_pad_state(host, 0, 0, 555, 666, 0, 0, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 555 &&
            lh_test_read_analog(host, 0, 0, 1) == 666,
        "two writes inside one poll window yield the second value, not a "
        "combination");

  // Triggers round-trip independently of the axes.
  lh_set_pad_state(host, 0, 0, 0, 0, 0, 0, 0x1234, 0x5678);
  lh_test_poll_input(host);
  CHECK(lh_test_read_trigger(host, 0, 0) == 0x1234, "L2 pressure round-trips");
  CHECK(lh_test_read_trigger(host, 0, 1) == 0x5678, "R2 pressure round-trips");

  // Digital is unaffected by lh_set_pad_state: the mask half still goes
  // through the same transition latch as lh_set_input.
  lh_set_pad_state(host, 0, 0x0003, 0, 0, 0, 0, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_input(host, 0) == 0x0003,
        "lh_set_pad_state's digital mask latches exactly like lh_set_input");

  // Ports remain independent for analog too.
  lh_set_pad_state(host, 0, 0, 10, 20, 0, 0, 0, 0);
  lh_set_pad_state(host, 1, 0, 30, 40, 0, 0, 0, 0);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 10 &&
            lh_test_read_analog(host, 0, 0, 1) == 20,
        "port 0 analog unaffected by port 1's write");
  CHECK(lh_test_read_analog(host, 1, 0, 0) == 30 &&
            lh_test_read_analog(host, 1, 0, 1) == 40,
        "port 1 analog unaffected by port 0's write");

  // lh_set_input leaves the analog and trigger words untouched.
  lh_set_pad_state(host, 0, 0, 999, 888, 0, 0, 0x77, 0x88);
  lh_test_poll_input(host);
  lh_set_input(host, 0, 0x0001);
  lh_test_poll_input(host);
  CHECK(lh_test_read_analog(host, 0, 0, 0) == 999 &&
            lh_test_read_analog(host, 0, 0, 1) == 888,
        "lh_set_input does not disturb analog state set earlier");
  CHECK(lh_test_read_trigger(host, 0, 0) == 0x77 &&
            lh_test_read_trigger(host, 0, 1) == 0x88,
        "lh_set_input does not disturb trigger state set earlier");

  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// Coverage that requires calling through the real input_state_cb dispatch
// (index/id mapping, derivation from the digital mask, and the domains other
// than JOYPAD/ANALOG) rather than reading the frame snapshots directly. Drives
// a loaded stub core with stub_analog_check=on, which performs the
// input_state_cb queries itself and reports every result through SET_MESSAGE
// (see probe_analog in stub_core.c).
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// A core is free to re-send SET_GEOMETRY every frame with values it has
// already reported, and mupen64plus-next does exactly that. notify_geometry
// used to forward each one, so geometry_changed fired ~60x/second for the life
// of a session. On Android every call crosses JNI, posts a Runnable to the
// main thread and ships a platform-channel message to Dart, so the cost is
// real. The host now reports only actual changes.
// ---------------------------------------------------------------------------

static void test_geometry_reported_once(const char *core_path,
                                        const char *rom_path,
                                        const char *work_dir) {
  printf("unchanged geometry is reported once:\n");
  const char *keys[] = {"stub_repeat_geometry"};
  const char *vals[] = {"on"};
  g_geometry_calls = 0;
  g_frames_ready = 0;

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "repeatgeometry", keys, vals, 1, &av);
  CHECK(rc == 0, "core loads with the repeat-geometry variable set");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }

  lh_start(host);
  msleep(300);

  // Without enough frames the call count below would pass vacuously.
  int frames = g_frames_ready;
  CHECK(frames > 4, "several frames ran");
  // The core re-sent identical geometry on every one of those frames. Exactly
  // one report is expected: load_content seeds h->av without notifying, so the
  // core's first SET_GEOMETRY is the platform's first word on the subject and
  // has to go through.
  int calls = g_geometry_calls;
  if (calls != 1) {
    printf("  (geometry_changed fired %d times across %d frames)\n", calls,
           frames);
  }
  CHECK(calls == 1, "geometry_changed fires once, not once per frame");

  // An internal restart rebuilds the core without re-entering lh_load, so the
  // core's first SET_GEOMETRY afterwards is the only word the platform gets on
  // the new render size - even when it names the same dimensions as before.
  // Suppressing it as a duplicate would strand the presentation surface at the
  // old size, so load_content clears the record and this report must arrive.
  g_geometry_calls = 0;
  g_frames_ready = 0;
  // lh_restart runs as a job on the emulation thread, so the host stays
  // started across it.
  lh_pause(host);
  msleep(30);
  const uint16_t stale_edge = 0x0040;
  lh_set_input(host, 0, stale_edge);
  lh_set_input(host, 0, 0);
  CHECK(lh_restart(host) == 0, "core restarts");
  CHECK(lh_test_read_input(host, 0) == 0,
        "restart clears pending digital edges and old acknowledgments");

  // Resume is requested by the caller but its reset runs at the emulation
  // loop boundary. This stale tap must not be latched into the first resumed
  // frame; the check is made after pausing again so it cannot race a frame.
  lh_set_input(host, 0, stale_edge);
  lh_set_input(host, 0, 0);
  lh_resume(host);
  msleep(50);
  lh_pause(host);
  msleep(30);
  CHECK(lh_test_read_input(host, 0) == 0,
        "resume clears paused digital edges on the emulation thread");
  lh_resume(host);
  msleep(300);
  lh_stop(host);

  CHECK(g_frames_ready > 4, "several frames ran after the restart");
  calls = g_geometry_calls;
  if (calls != 1) {
    printf("  (geometry_changed fired %d times after the restart)\n", calls);
  }
  CHECK(calls == 1, "restart re-reports geometry it had already sent");

  lh_destroy(host);
}

static void test_analog_via_core(const char *core_path, const char *rom_path,
                                 const char *work_dir) {
  printf("analog via input_state_cb dispatch:\n");
  const char *keys[] = {"stub_analog_check"};
  const char *vals[] = {"on"};
  g_last_message[0] = '\0';

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "analogviacore", keys, vals, 1, &av);
  CHECK(rc == 0, "core loads with the analog check variable set");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }

  // Hold JOYPAD_B (bit 0) so the derived analog-button path has a set bit to
  // observe, and leave JOYPAD_START (bit 3) unset as the negative case. Set
  // axis values and trigger pressures that are distinct from each other and
  // from zero, so any swapped field shows up as a mismatch.
  lh_set_pad_state(host, 0, 1u << RETRO_DEVICE_ID_JOYPAD_B, 111, -222, 333,
                   -444, 0x1111, 0x2222);

  lh_start(host);
  msleep(200);

  int lx, ly, rx, ry, l2, r2, db, ds, mx, gx, px;
  int parsed = sscanf(g_last_message,
                      "stub analog lx=%d ly=%d rx=%d ry=%d l2=%d r2=%d "
                      "db=%d ds=%d mx=%d gx=%d px=%d",
                      &lx, &ly, &rx, &ry, &l2, &r2, &db, &ds, &mx, &gx, &px);
  CHECK(parsed == 11, "stub core's analog probe message parses");
  if (parsed == 11) {
    CHECK(lx == 111 && ly == -222,
          "left stick reaches the core through input_state_cb");
    CHECK(rx == 333 && ry == -444,
          "right stick reaches the core through input_state_cb");
    CHECK(l2 == 0x1111 && r2 == 0x2222,
          "L2/R2 analog-button ids return the trigger pressures, not derived "
          "values");
    CHECK(db == 0x7fff,
          "an analog-button id whose bit is set in the digital mask returns "
          "0x7fff");
    CHECK(ds == 0,
          "an analog-button id whose bit is unset in the digital mask "
          "returns 0");
    CHECK(mx == 0, "RETRO_DEVICE_MOUSE still returns 0");
    CHECK(gx == 0, "RETRO_DEVICE_LIGHTGUN still returns 0");
    CHECK(px == 0, "RETRO_DEVICE_POINTER still returns 0");
  }

  lh_stop(host);
  lh_destroy(host);
}

// ---------------------------------------------------------------------------
// lh_analog_stick_ports: the AND of "the game describes a stick" and "the core
// actually reads one". Each signal alone is wrong on a real core, in opposite
// directions - Stella describes an axis for every ROM, FBNeo reads analog for
// every game - so the cases below cover all four quadrants. stub_core.c is
// shaped for it: port 1 has a stick descriptor, port 0 is JOYPAD-only, port 2
// has a BUTTON descriptor only, and stub_analog_query picks what the core
// reads.
// ---------------------------------------------------------------------------

#define STICK_PORTS_LOAD_FAILED 0xFFFFFFFFu

// Loads the stub with [query_mode], runs it, and reports the mask. The fixed
// settle comes first so a "stayed 0" result means the core really ran frames
// rather than never getting going; the poll after it keeps positive cases off
// a fixed deadline.
static unsigned stick_ports_after_run(const char *core_path,
                                      const char *rom_path,
                                      const char *work_dir,
                                      const char *game_id,
                                      const char *query_mode, unsigned want) {
  const char *keys[] = {"stub_analog_query"};
  const char *vals[] = {query_mode};
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  if (lh_load(host, core_path, rom_path, work_dir, work_dir, game_id, keys,
              vals, 1, &av) != 0) {
    lh_destroy(host);
    return STICK_PORTS_LOAD_FAILED;
  }
  lh_start(host);
  // Fast forward so the settle window passes in well under a second of wall
  // clock instead of the two seconds it takes at the stub's 60fps.
  lh_set_fast_forward(host, 20);
  msleep(300);
  unsigned ports = lh_analog_stick_ports(host);
  for (int waited = 0; waited < 500 && ports != want; waited += 10) {
    msleep(10);
    ports = lh_analog_stick_ports(host);
  }
  lh_stop(host);
  lh_destroy(host);
  return ports;
}

static void test_analog_stick_ports(const char *core_path,
                                    const char *rom_path,
                                    const char *work_dir) {
  printf("analog-stick-ports (descriptor AND query):\n");
  const unsigned p1 = 1u << 1;

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  CHECK(lh_analog_stick_ports(host) == 0,
        "a freshly created host reports no analog-stick ports");
  CHECK(lh_analog_stick_ports(NULL) == 0, "a NULL host reports 0");
  lh_destroy(host);

  // Described AND read: a real analog stick. Breakout, Capcom Bowling.
  unsigned ports = stick_ports_after_run(core_path, rom_path, work_dir,
                                         "stickboth", "p1", p1);
  CHECK(ports == p1,
        "a port the game describes AND the core reads is an analog stick");

  // Described, never read: Stella advertises an axis for Asteroids and never
  // touches it, and the stick must keep steering.
  ports = stick_ports_after_run(core_path, rom_path, work_dir, "stickdesc",
                                "off", 0);
  CHECK(ports == 0,
        "a described stick the core never reads stays digital");

  // Read, never described. FBNeo reading analog for a 4-way game.
  ports = stick_ports_after_run(core_path, rom_path, work_dir, "stickquery",
                                "p0", 0);
  CHECK(ports == 0,
        "a stick the core reads but the game never describes stays digital");

  // Both ports read; only port 1 is described, so only port 1 turns analog.
  ports = stick_ports_after_run(core_path, rom_path, work_dir, "stickmixed",
                                "p0p1", p1);
  CHECK(ports == p1,
        "only the described port turns analog when the core reads both");

  // Reading an analog BUTTON is trigger pressure. It must not promote port 1,
  // which IS described, or a game with pressure triggers and digital movement
  // would lose its d-pad conversion.
  ports = stick_ports_after_run(core_path, rom_path, work_dir, "stickbtn",
                                "p1btn", 0);
  CHECK(ports == 0,
        "an analog BUTTON read does not make a described port analog");

  // The mirror, on the descriptor side: port 2 is described with an
  // ANALOG_BUTTON entry only, so a genuine stick read there must not qualify
  // it. Fails if the descriptor scan stops checking the index.
  ports = stick_ports_after_run(core_path, rom_path, work_dir, "stickbtndesc",
                                "p2", 0);
  CHECK(ports == 0,
        "a port described only with an analog BUTTON stays digital even when "
        "the core reads a stick on it");

  // Before the core has read any input, a described port is analog on the
  // descriptor alone. Concluding digital here is what made Hydro Thunder steer
  // like a d-pad. Asserted on a loaded but unstarted core, so it turns on the
  // core having answered rather than on any amount of elapsed time.
  host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info settle_av;
  const char *settle_keys[] = {"stub_analog_query"};
  const char *settle_off[] = {"off"};
  int settle_rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                          "sticksettle", settle_keys, settle_off, 1,
                          &settle_av);
  CHECK(settle_rc == 0, "core loads for the settle-window case");
  if (settle_rc == 0) {
    CHECK(lh_analog_stick_ports(host) == p1,
          "a described port is analog before the core has read any input");
    lh_start(host);
    lh_set_fast_forward(host, 20);
    unsigned settled = lh_analog_stick_ports(host);
    for (int waited = 0; waited < 800 && settled != 0; waited += 10) {
      msleep(10);
      settled = lh_analog_stick_ports(host);
    }
    CHECK(settled == 0,
          "once the core has read input and never a stick, it demotes to "
          "digital");
    lh_stop(host);
  }
  lh_destroy(host);

  // The read half is per-game, so a port that was analog in the last load must
  // not start the next one analog.
  host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  const char *keys[] = {"stub_analog_query"};
  const char *on_vals[] = {"p1"};
  const char *off_vals[] = {"off"};
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "stickreload",
                   keys, on_vals, 1, &av);
  CHECK(rc == 0, "core loads for the reload-re-decides case");
  if (rc == 0) {
    lh_start(host);
    lh_set_fast_forward(host, 20);
    msleep(300);
    CHECK(lh_analog_stick_ports(host) == p1, "port 1 is analog in this load");
    lh_stop(host);
    rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                 "stickreload2", keys, off_vals, 1, &av);
    CHECK(rc == 0, "core reloads without the stick read");
    if (rc == 0) {
      lh_start(host);
      lh_set_fast_forward(host, 20);
      msleep(300);
      CHECK(lh_analog_stick_ports(host) == 0,
            "reloading clears a stick port the previous game had earned");
      lh_stop(host);
    }
  }
  CHECK(lh_analog_stick_ports(host) == 0,
        "analog-stick ports clear when the core unloads");
  lh_destroy(host);

  // A controller-type change re-opens the decision, since the new type may stop
  // reading a stick the old one read. Driven with the read half off so the
  // demote either side of the change is observable. Paused across the change so
  // the running core cannot settle it mid-assertion; jobs still drain paused.
  host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "stickdevice",
               keys, off_vals, 1, &av);
  CHECK(rc == 0, "core loads for the controller-type-change case");
  if (rc == 0) {
    lh_start(host);
    lh_set_fast_forward(host, 20);
    unsigned settled = lh_analog_stick_ports(host);
    for (int waited = 0; waited < 800 && settled != 0; waited += 10) {
      msleep(10);
      settled = lh_analog_stick_ports(host);
    }
    CHECK(settled == 0, "port 1 has demoted to digital before the change");
    lh_pause(host);
    msleep(50);
    CHECK(lh_set_controller_type(host, 1, RETRO_DEVICE_JOYPAD) >= 0,
          "the controller type change is accepted");
    CHECK(lh_analog_stick_ports(host) == p1,
          "the change re-opens the decision, so the descriptor answer returns");
    lh_resume(host);
    unsigned again = lh_analog_stick_ports(host);
    for (int waited = 0; waited < 800 && again != 0; waited += 10) {
      msleep(10);
      again = lh_analog_stick_ports(host);
    }
    CHECK(again == 0,
          "and it settles back to digital while the core still does not read");
    lh_stop(host);
  }
  lh_destroy(host);
}

static void write_vfs_zip(const char *path) {
  // One stored member (chip.bin = 10 20 30 40), followed by a conventional
  // central directory and 22-byte EOCD record. The probe core reads the ZIP
  // structures through the frontend VFS exactly as an archive core does.
  static const uint8_t zip[] = {
      0x50, 0x4b, 0x03, 0x04, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00,
      0xd4, 0xa1, 0x0a, 0x5d, 0x00, 0xb9, 0x8a, 0xe0, 0x04, 0x00,
      0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
      0x63, 0x68, 0x69, 0x70, 0x2e, 0x62, 0x69, 0x6e, 0x10, 0x20,
      0x30, 0x40, 0x50, 0x4b, 0x01, 0x02, 0x14, 0x00, 0x14, 0x00,
      0x00, 0x00, 0x00, 0x00, 0xd4, 0xa1, 0x0a, 0x5d, 0x00, 0xb9,
      0x8a, 0xe0, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
      0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x63, 0x68,
      0x69, 0x70, 0x2e, 0x62, 0x69, 0x6e, 0x50, 0x4b, 0x05, 0x06,
      0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x36, 0x00,
      0x00, 0x00, 0x2a, 0x00, 0x00, 0x00, 0x00, 0x00,
  };
  FILE *f = fopen(path, "wb");
  if (!f) return;
  fwrite(zip, 1, sizeof(zip), f);
  fclose(f);
}

static void test_vfs_zip(const char *core_path, const char *work_dir) {
  printf("VFS ZIP archive access:\n");
  char zip_path[1024];
  snprintf(zip_path, sizeof(zip_path), "%s/archive-vfs.zip", work_dir);
  write_vfs_zip(zip_path);

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, zip_path, work_dir, work_dir,
                   "vfs-zip", NULL, NULL, 0, &av);
  CHECK(rc == 0, "archive opens, reports its path, seeks, and reads through VFS");
  lh_destroy(host);
}

// Covers directory traversal through the VFS: opendir, readdir to the end, and
// dirent_is_dir on a real subdirectory.
static void test_vfs_dir_reports_subdir(const char *core_path,
                                        const char *rom_path,
                                        const char *work_dir) {
  printf("VFS reports a subdirectory as a directory:\n");
  char sys_dir[1024];
  char sub_dir[sizeof(sys_dir) + sizeof("/probe_subdir")];
  snprintf(sys_dir, sizeof(sys_dir), "%s/vfsdir_system", work_dir);
  snprintf(sub_dir, sizeof(sub_dir), "%s/probe_subdir", sys_dir);
  make_dir(sys_dir);
  make_dir(sub_dir);

  const char *keys[] = {"stub_vfs_dir_check"};
  const char *vals[] = {"on"};
  g_last_message[0] = '\0';

  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, sys_dir, work_dir,
                   "vfsdirgame", keys, vals, 1, &av);
  CHECK(rc == 0, "core loads with the VFS dir check variable set");
  CHECK(strcmp(g_last_message, "stub vfs dir probe_subdir is a directory") == 0,
        "a real subdirectory is reported as a directory through the VFS");
  lh_destroy(host);
}

// SET_CONTROLLER_INFO is supplied by the core through borrowed pointers, and
// controller changes must cross to the emulation thread just like save-state
// requests. The stub mutates every source label as soon as the environment
// callback returns, then exposes the selected port-0 device in word four of
// its save state so this checks both properties without reaching into host
// internals.
static void test_controller_types(const char *core_path, const char *rom_path,
                                  const char *work_dir) {
  printf("controller types:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "controllertypes", NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for controller type discovery");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }

  CHECK(lh_controller_type_count(host, 0) == 3,
        "all advertised port-0 types are retained, including unsupported ones");
  CHECK(lh_controller_type_count(host, 3) == 1,
        "the fourth Moonfin port is retained");
  CHECK(lh_controller_type_count(host, 4) == 0,
        "ports beyond Moonfin input capacity are logged but not exposed");
  lh_controller_type type;
  CHECK(lh_get_controller_type(host, 0, 0, &type) == 0,
        "first controller type is enumerable");
  CHECK(type.id == RETRO_DEVICE_SUBCLASS(RETRO_DEVICE_JOYPAD, 1),
        "controller type id is copied");
  CHECK(strcmp(type.label, "Stub Classic") == 0,
        "controller label survives the core mutating its source buffer");
  CHECK(lh_get_controller_type(host, 0, 3, &type) != 0,
        "past-the-end controller type is rejected");
  CHECK(lh_get_controller_type(host, 4, 0, &type) != 0,
        "unroutable controller port is not enumerable");

  lh_start(host);
  lh_pause(host);
  msleep(30);  // ensure the running loop drains controller jobs while paused
  const unsigned classic = RETRO_DEVICE_SUBCLASS(RETRO_DEVICE_JOYPAD, 1);
  CHECK(lh_set_controller_type(host, 0, classic) == 0,
        "advertised controller type applies on the emulation thread");

  size_t size = lh_serialize_size(host);
  uint8_t state[64] = {0};
  CHECK(size >= sizeof(int32_t) * 4 && size <= sizeof(state),
        "stub state carries applied controller type");
  if (size >= sizeof(int32_t) * 4 && size <= sizeof(state)) {
    CHECK(lh_serialize(host, state, size) == 0,
          "serialize after advertised controller selection");
    int32_t applied;
    memcpy(&applied, state + sizeof(int32_t) * 3, sizeof(applied));
    CHECK((unsigned)applied == classic,
          "core receives the advertised controller device id");
  }

  unsigned generation_before_restart = lh_restart_generation(host);
  CHECK(lh_restart_async(host) == 0,
        "controller-selection restart schedules on the emulation thread");
  int waited_ms = 0;
  while (lh_restart_generation(host) == generation_before_restart &&
         waited_ms < 2000) {
    msleep(5);
    waited_ms += 5;
  }
  CHECK(lh_restart_generation(host) != generation_before_restart,
        "controller-selection restart completes");
  if (size >= sizeof(int32_t) * 4 && size <= sizeof(state)) {
    memset(state, 0, sizeof(state));
    CHECK(lh_serialize(host, state, size) == 0,
          "serialize after controller-selection restart");
    int32_t applied;
    memcpy(&applied, state + sizeof(int32_t) * 3, sizeof(applied));
    CHECK((unsigned)applied == classic,
          "restart reapplies the selected controller device to the new core");
  }

  CHECK(lh_set_controller_type(host, 0, 0x7fffffffU) == 1,
        "stale explicit controller type falls back safely");
  if (size >= sizeof(int32_t) * 4 && size <= sizeof(state)) {
    memset(state, 0, sizeof(state));
    CHECK(lh_serialize(host, state, size) == 0,
          "serialize after stale controller fallback");
    int32_t applied;
    memcpy(&applied, state + sizeof(int32_t) * 3, sizeof(applied));
    CHECK((unsigned)applied == RETRO_DEVICE_JOYPAD,
          "core receives the libretro default after a stale controller id");
  }
  CHECK(lh_set_controller_type(host, 2, RETRO_DEVICE_JOYPAD) == 0,
        "Auto accepts libretro's joypad default when the port did not advertise it");
  CHECK(lh_set_controller_type(host, 4, RETRO_DEVICE_JOYPAD) != 0,
        "unroutable controller port is rejected");

  lh_stop(host);
  CHECK(lh_controller_type_count(host, 0) == 0,
        "controller types are cleared when the core unloads");
  lh_destroy(host);
}

// SET_INPUT_DESCRIPTORS is supplied by the core through borrowed pointers,
// exactly like SET_CONTROLLER_INFO above. The stub mutates every source
// label as soon as the environment callback returns, and this spans two
// ports and several distinct ids (including 0 and 8, RETRO_DEVICE_ID_JOYPAD_B
// and _A) so a copy bug that only shows up away from index/id zero would
// still be caught.
static void test_input_descriptors(const char *core_path, const char *rom_path,
                                   const char *work_dir) {
  printf("input descriptors:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir,
                   "inputdescriptors", NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for input descriptor discovery");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }

  CHECK(lh_input_descriptor_count(host) == 6,
        "every advertised input descriptor is retained");

  lh_input_descriptor descriptor;
  CHECK(lh_get_input_descriptor(host, 0, &descriptor) == 0,
        "first input descriptor is enumerable");
  CHECK(descriptor.port == 0 && descriptor.device == RETRO_DEVICE_JOYPAD &&
            descriptor.index == 0 && descriptor.id == RETRO_DEVICE_ID_JOYPAD_B,
        "input descriptor fields are copied");
  CHECK(strcmp(descriptor.description, "Fire") == 0,
        "input descriptor label survives the core mutating its source buffer");

  CHECK(lh_get_input_descriptor(host, 1, &descriptor) == 0 &&
            descriptor.id == RETRO_DEVICE_ID_JOYPAD_A &&
            strcmp(descriptor.description, "Jump") == 0,
        "second input descriptor (id 8, RETRO_DEVICE_ID_JOYPAD_A) is correct");

  CHECK(lh_get_input_descriptor(host, 3, &descriptor) == 0 &&
            descriptor.port == 1 && descriptor.id == RETRO_DEVICE_ID_JOYPAD_B &&
            strcmp(descriptor.description, "P2 Fire") == 0,
        "descriptor for a second port is retained distinctly from port 0");

  CHECK(lh_get_input_descriptor(host, 4, &descriptor) == 0 &&
            descriptor.port == 1 && descriptor.device == RETRO_DEVICE_ANALOG &&
            descriptor.index == RETRO_DEVICE_INDEX_ANALOG_LEFT &&
            descriptor.id == RETRO_DEVICE_ID_ANALOG_X &&
            strcmp(descriptor.description, "P2 Stick X") == 0,
        "port 1's RETRO_DEVICE_ANALOG descriptor is retained alongside its "
        "JOYPAD one");

  CHECK(lh_get_input_descriptor(host, 6, &descriptor) != 0,
        "past-the-end input descriptor is rejected");
  CHECK(lh_get_input_descriptor(host, -1, &descriptor) != 0,
        "negative input descriptor index is rejected");

  lh_stop(host);
  CHECK(lh_input_descriptor_count(host) == 0,
        "input descriptors are cleared when the core unloads");
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
    // stub_bad_pitch, stub_vfs_dir_check, stub_analog_check,
    // stub_analog_query, stub_repeat_geometry, stub_unserved,
    // stub_input_thread, stub_no_poll, stub_waits_report.
    CHECK(lh_option_count(host) == 14, "fourteen core options");
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
    CHECK(lh_option_count(host) == 14, "restart replaces option definitions");
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

// The numeric values are the contract: platform runners map them to channel
// errors. Naming them must not renumber them.
static void test_result_codes_are_stable(void) {
  printf("result codes keep their values:\n");
  CHECK(LH_OK == 0, "LH_OK");
  CHECK(LH_ERR_SESSION_BUSY == -1, "LH_ERR_SESSION_BUSY");
  CHECK(LH_ERR_CORE_OPEN == -2, "LH_ERR_CORE_OPEN");
  CHECK(LH_ERR_CORE_SYMBOLS == -3, "LH_ERR_CORE_SYMBOLS");
  CHECK(LH_ERR_ROM_READ == -4, "LH_ERR_ROM_READ");
  CHECK(LH_ERR_CONTENT_REJECTED == -5, "LH_ERR_CONTENT_REJECTED");
  CHECK(LH_ERR_AUDIO_RING == -6, "LH_ERR_AUDIO_RING");
  CHECK(LH_ERR_SHUTDOWN_DURING_LOAD == -6, "LH_ERR_SHUTDOWN_DURING_LOAD");
  CHECK(LH_ERR_ALLOC == -7, "LH_ERR_ALLOC");
  CHECK(LH_ERR_BAD_GAME_ID == -8, "LH_ERR_BAD_GAME_ID");
}

// Options are published at retro_init, before retro_load_game, so a core can be
// asked what it supports with no ROM and no session.
static void test_probe_options_without_content(const char *core_path,
                                               const char *work_dir) {
  printf("probe reads options with no content loaded:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());

  CHECK(lh_option_count(host) == 0, "no definitions before probing");
  CHECK(lh_probe_options(host, core_path, work_dir) == 0, "probe succeeds");
  CHECK(lh_option_count(host) > 0, "probe published the core's definitions");

  // Readable after the probe unloads the core, so the copies are host-owned.
  lh_option opt;
  CHECK(lh_get_option(host, 0, &opt) == 0, "definition readable after probe");
  CHECK(strcmp(opt.id, "stub_speed") == 0, "probed id");
  CHECK(strcmp(opt.label, "Speed") == 0, "probed label");
  CHECK(opt.choice_count == 2, "probed choice count");

  lh_av_info av;
  char rom_path[1024];
  snprintf(rom_path, sizeof(rom_path), "%s/dummy.rom", work_dir);
  CHECK(lh_load(host, core_path, rom_path, work_dir, work_dir, "afterprobe",
                NULL, NULL, 0, &av) == 0,
        "a real load still works after a probe");
  lh_destroy(host);
}

// One core per process: probing during a session would hand the running core's
// environment callback to a second module.
static void test_probe_refused_during_session(const char *core_path,
                                              const char *rom_path,
                                              const char *work_dir) {
  printf("probe is refused while a session is live:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info av;
  int rc = lh_load(host, core_path, rom_path, work_dir, work_dir, "probeguard",
                   NULL, NULL, 0, &av);
  CHECK(rc == 0, "core loads for the probe-guard test");
  if (rc != 0) {
    lh_destroy(host);
    return;
  }
  lh_start(host);
  msleep(50);

  lh_host *other = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  CHECK(lh_probe_options(other, core_path, work_dir) != 0,
        "probe refuses while another session is loaded");
  CHECK(lh_option_count(other) == 0, "refused probe published nothing");
  lh_destroy(other);

  lh_option opt;
  CHECK(lh_get_option(host, 0, &opt) == 0, "live session still readable");
  CHECK(strcmp(opt.id, "stub_speed") == 0, "live session options intact");
  lh_destroy(host);
}

// A failed probe must leave the host reusable, not half-initialised.
static void test_probe_bad_path_leaves_host_usable(const char *core_path,
                                                   const char *rom_path,
                                                   const char *work_dir) {
  printf("probe failure leaves the host usable:\n");
  lh_host *host = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  CHECK(lh_probe_options(host, "/no/such/core.so", work_dir) != 0,
        "probing a missing core fails");
  CHECK(lh_option_count(host) == 0, "failed probe published nothing");

  CHECK(lh_probe_options(host, core_path, work_dir) == 0,
        "a good probe works after a failed one");
  CHECK(lh_option_count(host) > 0, "recovered probe published definitions");

  lh_av_info av;
  CHECK(lh_load(host, core_path, rom_path, work_dir, work_dir, "afterbadprobe",
                NULL, NULL, 0, &av) == 0,
        "a real load still works after a failed probe");
  lh_destroy(host);
}

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

  // bug-175. mupen64plus-next asks for this in retro_set_environment, stores
  // it in a variable initialised to NULL, and - whenever its threaded renderer
  // is enabled - calls it with no null check from retro_unload_game,
  // retro_serialize and retro_unserialize. This host used to fall through to
  // the default false and never touch the out-param, so the core jumped to
  // address 0 a few seconds into a save-state load on the Shield. The contract
  // is that the pointer is written and callable, not merely that we say no
  // politely.
  {
    printf("GET_CLEAR_ALL_THREAD_WAITS_CB:\n");
    lh_host *tw = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    g_last_message[0] = '\0';
    lh_av_info av;
    const char *keys[] = {"stub_waits_report"};
    const char *vals[] = {"on"};
    CHECK(lh_load(tw, core_path, rom_path, work_dir, work_dir, "waits", keys,
                  vals, 1, &av) == 0,
          "a core that calls the thread-waits callback still loads");
    lh_start(tw);
    msleep(120);
    lh_stop(tw);
    // waitscb: 0 = written as NULL, 1 = never written (still the stub's own
    // marker), 2 = the host wrote its own callback.
    CHECK(strstr(g_last_message, "waitscb=2") != NULL,
          "the host writes a callback of its own into the out-param");
    CHECK(strstr(g_last_message, "waitscb=1") == NULL,
          "the out-param is not left untouched");
    CHECK(strstr(g_last_message, "waitsrc=1") != NULL,
          "and the environment call reports success");
    CHECK(strstr(g_last_message, "waitscalls=2") != NULL,
          "the core completes both the blocking and the resuming call");
    CHECK(strstr(g_last_message, "waitsok=1") != NULL,
          "and the callback returns true both times");
    lh_destroy(tw);
  }

  // The other half of bug-175: an unserved command must be visible, not
  // silent. The diagnostic itself lands on stderr or in logcat, neither of
  // which this harness reads, so what is asserted here is the record behind
  // it - one entry per distinct command, however many times it is asked.
  {
    printf("unhandled environment commands are recorded once each:\n");
    lh_host *ue = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    g_last_message[0] = '\0';
    const char *keys[] = {"stub_unserved"};
    const char *vals[] = {"on"};
    lh_av_info av;
    CHECK(lh_load(ue, core_path, rom_path, work_dir, work_dir, "unserved",
                  keys, vals, 1, &av) == 0,
          "a core probing unserved commands still loads");
    CHECK(strstr(g_last_message, "false=3") != NULL,
          "every unserved command answers false");
    CHECK(lh_test_unhandled_env_count(ue) == 2,
          "three calls across two commands record two entries, not three");
    lh_destroy(ue);
  }

  // bug-177, the delivery contract. A published transition remains blocked
  // until the core reads it, so a transient press survives frontend frames,
  // is delivered exactly once, and cannot wedge a button if the core never
  // reads that id. Test hooks keep the frame boundaries deterministic.
  {
    printf("a transient press is delivered exactly once:\n");
    lh_host *ed = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const uint16_t start_bit = 1u << 3;  // RETRO_DEVICE_ID_JOYPAD_START

    // A press whose down and up both land between polls - the Start pulse.
    lh_set_input(ed, 0, start_bit);
    lh_set_input(ed, 0, 0);

    lh_test_poll_input(ed);
    CHECK((lh_test_read_input(ed, 0) & start_bit) != 0,
          "the press reaches the first polled frame");

    // The regression: without an acknowledgment this second poll erased it.
    lh_test_poll_input(ed);
    CHECK((lh_test_read_input(ed, 0) & start_bit) != 0,
          "and survives a further poll while nothing has read it");

    CHECK((lh_test_observe_input(ed, 0) & start_bit) != 0,
          "a read observes it");
    lh_test_poll_input(ed);
    CHECK((lh_test_read_input(ed, 0) & start_bit) == 0,
          "and having been observed once, it is gone - not repeated");
    lh_destroy(ed);
  }

  // bug-177, the actual fault. libretro REQUIRES a core to poll ("During
  // retro_run(), the retro_input_poll_t callback must be called at least
  // once", libretro.h), but mupen64plus-next does not always honour it: with
  // its threaded renderer enabled nothing called poll_cb at all. latch_input
  // is the only writer of input_frame, so such a core received NO input
  // whatsoever. Device evidence is the poll heartbeat in
  // input_poll_cb staying silent for an entire session while presses were
  // provably reaching lh_set_input - and that heartbeat alone; the edge trace
  // captured at the same time was itself broken and proves nothing.
  //
  // The assertion is on what the CORE observed, not on the host's own frame:
  // the stub reads RETRO_DEVICE_ID_JOYPAD_MASK through input_state_cb and
  // paints it into the green channel, so a green byte carrying the bit is
  // proof the core saw it. Peeking input_frame instead would pass even if
  // input_state_cb had returned zero every time.
  {
    printf("input reaches a core that never calls input_poll:\n");
    lh_host *np = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_av_info av;
    const char *keys[] = {"stub_no_poll"};
    const char *vals[] = {"on"};
    CHECK(lh_load(np, core_path, rom_path, work_dir, work_dir, "nopoll", keys,
                  vals, 1, &av) == 0,
          "a core that never polls still loads");
    lh_start(np);
    msleep(80);
    lh_set_input(np, 0, 1u << 3);  // Start, held
    msleep(200);                   // several frames

    const void *data = NULL;
    int w = 0, hh = 0, stride = 0;
    int got = lh_get_frame(np, &data, &w, &hh, &stride);
    CHECK(got == 1, "the never-polling core still produces frames");
    if (got) {
      const uint8_t *px = (const uint8_t *)data;
      CHECK(px[1] == (uint8_t)(1u << 3),
            "the core observed the button through input_state_cb");
    }
    lh_stop(np);
    lh_destroy(np);
  }

  // A compliant core polls inside retro_run after the host's run-loop latch.
  // That callback refreshes analog state but must not advance digital state or
  // its expiry clock a second time.
  {
    printf("a core polling on top of the run loop does not shorten expiry:\n");
    lh_host *dp = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const uint16_t start_bit = 1u << 3;
    lh_set_input(dp, 0, start_bit);
    lh_set_input(dp, 0, 0);

    int held = 0;
    for (int i = 0; i < 12; i++) {
      lh_test_poll_input(dp);       // the frontend frame
      lh_test_core_poll_input(dp);  // the core polling within it
      if (lh_test_read_input(dp, 0) & start_bit) held++;
    }
    // Same window as the frontend-only case: core polls do not age the edge.
    CHECK(held > 2 && held <= 5,
          "the expiry window is counted in frames, not in latches");
    lh_destroy(dp);
  }

  // Acknowledgment scope. A core that queries ids one at a time must not have
  // one button's read deliver another's edge: if querying B acknowledged Start,
  // a poll landing before Start was queried would drop it and the press would
  // be gone. Only a MASK query, which hands over every bit at once, may
  // acknowledge the lot.
  {
    printf("one button's query does not acknowledge another's:\n");
    lh_host *sc = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const unsigned id_b = 0;      // RETRO_DEVICE_ID_JOYPAD_B
    const unsigned id_start = 3;  // RETRO_DEVICE_ID_JOYPAD_START

    lh_set_input(sc, 0, (uint16_t)((1u << id_b) | (1u << id_start)));
    lh_set_input(sc, 0, 0);
    lh_test_poll_input(sc);

    CHECK(lh_test_observe_input_id(sc, 0, id_b) == 1,
          "querying B delivers B");
    // The interleaving that loses presses: a poll between the two queries.
    lh_test_poll_input(sc);
    CHECK(lh_test_observe_input_id(sc, 0, id_start) == 1,
          "and Start still arrives, having never been asked for until now");
    lh_destroy(sc);

    // The MASK query is the one caller that legitimately takes everything.
    lh_host *mk = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_set_input(mk, 0, (uint16_t)((1u << id_b) | (1u << id_start)));
    lh_set_input(mk, 0, 0);
    lh_test_poll_input(mk);
    CHECK(lh_test_observe_input(mk, 0) ==
              (uint16_t)((1u << id_b) | (1u << id_start)),
          "a mask query delivers every pressed bit at once");
    lh_test_poll_input(mk);
    CHECK(lh_test_observe_input(mk, 0) == 0,
          "and having delivered them all, acknowledges them all");
    lh_destroy(mk);
  }

  // The case the first contract MISSED, and the one that matters in the app:
  // the Start pulse is ~34ms, so a poll usually lands while the bit is still
  // HELD rather than after it was released. The original rule only tracked
  // bits absent from input_level, so a press caught mid-hold never entered the
  // unacked set at all and got the old one-frame treatment - published once,
  // erased by the next poll, gone if nothing read that exact frame.
  {
    printf("a press caught while still held is still delivered:\n");
    lh_host *mh = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const unsigned id_start = 3;

    lh_set_input(mh, 0, (uint16_t)(1u << id_start));  // press, still held
    lh_test_poll_input(mh);                            // poll inside the hold
    // Nothing reads here: this is the interleaving that loses the press.
    lh_set_input(mh, 0, 0);                            // release
    lh_test_poll_input(mh);
    CHECK(lh_test_observe_input_id(mh, 0, id_start) == 1,
          "a press held across one poll survives to be read after release");
    lh_destroy(mh);
  }

  // The bound that stops the contract becoming a stuck button.
  {
    printf("an unread press expires instead of wedging on:\n");
    lh_host *ex = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const uint16_t start_bit = 1u << 3;
    lh_set_input(ex, 0, start_bit);
    lh_set_input(ex, 0, 0);
    int held = 0;
    for (int i = 0; i < 12; i++) {
      lh_test_poll_input(ex);
      if (lh_test_read_input(ex, 0) & start_bit) held++;
    }
    CHECK(held > 0 && held <= 5,
          "an unobserved press is held for a bounded number of polls, not forever");
    lh_destroy(ex);

    // Other button activity on the same port must not restart Start's age.
    ex = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const uint16_t a_bit = 1u << 8;
    lh_set_input(ex, 0, start_bit);
    lh_set_input(ex, 0, 0);
    lh_test_poll_input(ex);  // Start DOWN, deliberately unread.
    int released = 0;
    for (int i = 0; i < 8; i++) {
      lh_set_input(ex, 0, (i & 1) ? 0 : a_bit);
      lh_test_poll_input(ex);
      (void)lh_test_observe_input_id(ex, 0, RETRO_DEVICE_ID_JOYPAD_A);
      if (!(lh_test_read_input(ex, 0) & start_bit)) released = 1;
    }
    CHECK(released,
          "other button activity cannot postpone an unread edge timeout");
    lh_destroy(ex);
  }

  // After its initial transition is acknowledged, a held button remains in
  // the published level and is reported every frame without being re-queued.
  {
    printf("a held button is unaffected by the edge contract:\n");
    lh_host *hb = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const uint16_t a_bit = 1u << 8;  // RETRO_DEVICE_ID_JOYPAD_A
    lh_set_input(hb, 0, a_bit);
    int seen = 0;
    for (int i = 0; i < 6; i++) {
      lh_test_poll_input(hb);
      if (lh_test_observe_input(hb, 0) & a_bit) seen++;
    }
    CHECK(seen == 6, "a held button is reported on every poll despite being read");
    lh_set_input(hb, 0, 0);
    lh_test_poll_input(hb);
    CHECK((lh_test_observe_input(hb, 0) & a_bit) == 0, "and clears on release");
    lh_destroy(hb);
  }

  // bug-177. latch_input publishes the polled frame into plain, non-atomic
  // arrays and documents that polling and reading share the emulation thread.
  // mupen64plus-next with ThreadedRenderer breaks that, and the symptom is
  // that a synthesised two-frame Start pulse vanishes while held buttons are
  // fine. The host cannot stop a core doing this, so it detects and reports
  // it instead of leaving the hazard silent.
  {
    printf("cross-thread input reads are detected:\n");
    lh_host *nt = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_av_info av;
    const char *okeys[] = {"stub_input_thread"};
    const char *ovals[] = {"off"};
    CHECK(lh_load(nt, core_path, rom_path, work_dir, work_dir, "samethread",
                  okeys, ovals, 1, &av) == 0,
          "core loads with same-thread input");
    lh_start(nt);
    msleep(150);
    lh_stop(nt);
    CHECK(lh_test_input_thread_mismatch(nt) == 0,
          "a core reading input on the polling thread raises nothing");
    lh_destroy(nt);

    lh_host *ot = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    const char *keys[] = {"stub_input_thread"};
    const char *vals[] = {"on"};
    CHECK(lh_load(ot, core_path, rom_path, work_dir, work_dir, "offthread",
                  keys, vals, 1, &av) == 0,
          "core loads with off-thread input");
    lh_start(ot);
    msleep(150);
    lh_stop(ot);
    CHECK(lh_test_input_thread_mismatch(ot) > 0,
          "a core reading input off the polling thread is detected");
    lh_destroy(ot);
  }

  // A stick left deflected when one game exits must not still be deflected for
  // the first frames of the next: the platform's session reset is mask-only and
  // never clears these words, so lh_load has to.
  {
    printf("stale analog does not survive a load:\n");
    lh_host *stale = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
    lh_av_info stale_av;
    CHECK(lh_load(stale, core_path, rom_path, work_dir, work_dir, "stale", NULL,
                  NULL, 0, &stale_av) == 0,
          "host loads for the stale-analog check");
    lh_set_pad_state(stale, 0, 0, 30000, -30000, 0, 0, 0x7fff, 0x7fff);
    lh_test_poll_input(stale);
    CHECK(lh_test_read_analog(stale, 0, 0, 0) == 30000,
          "analog is deflected before the reload");
    CHECK(lh_test_read_trigger(stale, 0, 0) == 0x7fff,
          "trigger is pressed before the reload");

    // The real sequence: a game ends (stop) and another is loaded on the same
    // host. lh_load refuses to load over a live core.
    lh_stop(stale);
    CHECK(lh_load(stale, core_path, rom_path, work_dir, work_dir, "stale2",
                  NULL, NULL, 0, &stale_av) == 0,
          "the same host loads new content after a stop");
    lh_test_poll_input(stale);
    CHECK(lh_test_read_analog(stale, 0, 0, 0) == 0 &&
              lh_test_read_analog(stale, 0, 0, 1) == 0,
          "the new game starts centred, not at the old deflection");
    CHECK(lh_test_read_trigger(stale, 0, 0) == 0 &&
              lh_test_read_trigger(stale, 0, 1) == 0,
          "the new game starts with triggers released");

    // A host can be reused while a physical button remains held. The load
    // reset must preserve that latest level, but discard a transient edge and
    // its old acknowledgment barrier from the previous core.
    const uint16_t held_bit = 0x0040;
    const uint16_t transient_bit = 0x0080;
    lh_set_input(stale, 0, held_bit);
    lh_test_poll_input(stale);
    lh_set_input(stale, 0, (uint16_t)(held_bit | transient_bit));
    lh_set_input(stale, 0, held_bit);
    lh_stop(stale);
    CHECK(lh_load(stale, core_path, rom_path, work_dir, work_dir, "stale3",
                  NULL, NULL, 0, &stale_av) == 0,
          "the host loads a third game for digital lifecycle reuse");
    CHECK(lh_test_read_input(stale, 0) == held_bit,
          "load preserves the current held level but drops stale edges");
    lh_set_input(stale, 0, 0);
    lh_test_poll_input(stale);
    CHECK(lh_test_read_input(stale, 0) == 0,
          "a release after host reuse is not blocked by the old edge");
    lh_destroy(stale);
  }

  // A failed load must clean up fully so a later load still works.
  printf("negative load:\n");
  lh_host *bad = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  lh_av_info bad_av;
  int bad_rc = lh_load(bad, core_path, "/no/such/rom.bin", work_dir, work_dir,
                       "missing", NULL, NULL, 0, &bad_av);
  CHECK(bad_rc != 0, "missing rom fails load");
  lh_destroy(bad);

  char rejected_path[1024];
  snprintf(rejected_path, sizeof(rejected_path), "%s/rejected.rom", work_dir);
  write_rom(rejected_path, "reject");
  g_last_message[0] = '\0';
  lh_host *rejected = lh_create(LH_FORMAT_RGBA8888, make_callbacks());
  int rejected_rc = lh_load(rejected, core_path, rejected_path, work_dir,
                            work_dir, "rejected", NULL, NULL, 0, &bad_av);
  CHECK(rejected_rc == LH_ERR_CONTENT_REJECTED,
        "core rejection returns the libretro load code");
  CHECK(strstr(g_last_message, "stub rejected this content") != NULL,
        "core rejection reason reaches the host diagnostic");
  CHECK(strstr(g_last_message, "rejection cleanup") == NULL,
        "later informational output does not replace the rejection reason");
  lh_destroy(rejected);

  test_result_codes_are_stable();
  test_probe_options_without_content(core_path, work_dir);
  test_probe_refused_during_session(core_path, rom_path, work_dir);
  test_probe_bad_path_leaves_host_usable(core_path, rom_path, work_dir);
  test_input_latch();
  test_input_transition_latch();
  test_analog_passthrough();
  test_analog_via_core(core_path, rom_path, work_dir);
  test_analog_stick_ports(core_path, rom_path, work_dir);
  test_vfs_zip(core_path, work_dir);
  test_vfs_dir_reports_subdir(core_path, rom_path, work_dir);
  test_controller_types(core_path, rom_path, work_dir);
  test_input_descriptors(core_path, rom_path, work_dir);

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

  test_geometry_reported_once(core_path, rom_path, work_dir);

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
