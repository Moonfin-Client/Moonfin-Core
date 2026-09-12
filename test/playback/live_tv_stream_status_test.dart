import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/live_tv_stream_status.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  final t0 = DateTime(2026, 9, 12, 0, 45);

  PlaybackBringupState phase(
    PlaybackBringupPhase p, {
    int? token,
    String? error,
  }) {
    return PlaybackBringupState(
      phase: p,
      sessionToken: token,
      itemId: 'channel',
      error: error,
    );
  }

  group('LiveTvStreamStatusTracker', () {
    late LiveTvStreamStatusTracker tracker;

    setUp(() {
      tracker = LiveTvStreamStatusTracker();
    });

    /// A channel change that the server answered at once: resolved and on
    /// screen at [at], with no frame shown yet.
    void tuneIn(DateTime at) {
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), at);
      tracker.onBringup(phase(PlaybackBringupPhase.ready, token: 1), at);
    }

    /// Frames on screen: playing, with the clock stepping four times a
    /// second the way both backends report it, for [span] (three seconds
    /// unless told otherwise).
    void showFrames(
      DateTime at, {
      Duration from = Duration.zero,
      Duration span = const Duration(seconds: 3),
    }) {
      tracker.onPlaying(true, at);
      for (var i = 0; i <= span.inMilliseconds ~/ 250; i++) {
        tracker.onPosition(
          from + Duration(milliseconds: 250 * i),
          at.add(Duration(milliseconds: 250 * i)),
        );
      }
    }

    /// The tuner feeding broken timestamps: every second the player stalls
    /// and leaps to a new live edge, then creeps forward for a few samples.
    void leapEverySecond(DateTime from, Duration forSeconds) {
      for (var k = 0; k < forSeconds.inSeconds; k++) {
        final at = from.add(Duration(seconds: k));
        tracker.onBuffering(true, at);
        tracker.onPlaying(false, at);
        tracker.onPlaying(true, at.add(const Duration(milliseconds: 50)));
        tracker.onBuffering(false, at.add(const Duration(milliseconds: 50)));
        for (var i = 0; i < 4; i++) {
          tracker.onPosition(
            Duration(seconds: 100 * (k + 1), milliseconds: 250 * i),
            at.add(Duration(milliseconds: 50 + 250 * i)),
          );
        }
      }
    }

    test('is idle before any bringup', () {
      expect(tracker.statusAt(t0), LiveTvStreamStatus.idle);
    });

    test('a fresh channel change is connecting, then still trying', () {
      tracker.onBringup(phase(PlaybackBringupPhase.stoppingPrevious), t0);
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      expect(tracker.statusAt(t0), LiveTvStreamStatus.connecting);
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 5))),
        LiveTvStreamStatus.connecting,
      );
      // The server is holding the request open: the tuner is retrying.
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 6))),
        LiveTvStreamStatus.stillTrying,
      );
    });

    test('the bringup clock starts at the first in-progress phase', () {
      tracker.onBringup(phase(PlaybackBringupPhase.stoppingPrevious), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.resolving, token: 1),
        t0.add(const Duration(seconds: 3)),
      );
      // Six seconds after the change began, even though resolving started
      // only three seconds ago.
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 6))),
        LiveTvStreamStatus.stillTrying,
      );
    });

    test('ready plus frames moving means playing', () {
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.ready, token: 1),
        t0.add(const Duration(seconds: 3)),
      );
      showFrames(
        t0.add(const Duration(seconds: 4)),
        span: const Duration(minutes: 1),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(minutes: 1))),
        LiveTvStreamStatus.playing,
      );
    });

    test('a failure before ready is unavailable, not lost', () {
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(
          PlaybackBringupPhase.failed,
          token: 1,
          error: liveChannelUnavailableError,
        ),
        t0.add(const Duration(seconds: 3)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 3))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('a channel stopped before it ever had a picture is unavailable', () {
      // The tuner answered and the player was started, but no frame ever
      // arrived and the manager stopped it. Reporting idle here left the
      // viewer on a black screen with nothing on it.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.idle, token: 1),
        t0.add(const Duration(seconds: 3)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 3))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('a channel that never came up says connecting for a moment first', () {
      // So a Retry press is seen to do something before the card returns.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(phase(PlaybackBringupPhase.idle, token: 1), t0);
      expect(tracker.statusAt(t0), LiveTvStreamStatus.connecting);
    });

    test('stopping a channel that did play is idle, not a failure card', () {
      // The viewer leaving a working channel has nothing to report.
      tuneIn(t0);
      showFrames(t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.idle, token: 1),
        t0.add(const Duration(seconds: 30)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.idle,
      );
    });

    test('a failure after ready is lost', () {
      tuneIn(t0);
      showFrames(t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.failed, token: 1, error: 'Source error'),
        t0.add(const Duration(seconds: 30)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.lost,
      );
    });

    test('a mid-play stall is buffering, then reconnecting, then lost', () {
      tuneIn(t0);
      showFrames(t0);
      final stall = t0.add(const Duration(seconds: 20));
      tracker.onBuffering(true, stall);
      expect(tracker.statusAt(stall), LiveTvStreamStatus.buffering);
      expect(
        tracker.statusAt(stall.add(const Duration(seconds: 3))),
        LiveTvStreamStatus.buffering,
      );
      expect(
        tracker.statusAt(stall.add(const Duration(seconds: 4))),
        LiveTvStreamStatus.reconnecting,
      );
      expect(
        tracker.statusAt(stall.add(const Duration(seconds: 44))),
        LiveTvStreamStatus.reconnecting,
      );
      expect(
        tracker.statusAt(stall.add(const Duration(seconds: 45))),
        LiveTvStreamStatus.lost,
      );
    });

    test('a stall that recovers goes back to playing once frames move', () {
      tuneIn(t0);
      showFrames(t0);
      final stall = t0.add(const Duration(seconds: 20));
      tracker.onBuffering(true, stall);
      final recovered = stall.add(const Duration(seconds: 8));
      tracker.onBuffering(false, recovered);
      // The player says it is no longer buffering, but until the clock has
      // run cleanly for a while that is what a broken feed says too.
      expect(tracker.statusAt(recovered), LiveTvStreamStatus.reconnecting);
      showFrames(recovered, from: const Duration(seconds: 20));
      expect(
        tracker.statusAt(recovered.add(const Duration(seconds: 3))),
        LiveTvStreamStatus.playing,
      );
    });

    test('a clock that leaps every second is not a channel playing', () {
      // Taken from a tvOS report: the tuner's feed carried broken
      // timestamps, the segmenter cut 1782 one-second segments in 85
      // seconds, and AVPlayer stalled and jumped to a new live edge every
      // second (25s, 94s, 186s, 301s...) while the screen stayed black.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.ready, token: 1),
        t0.add(const Duration(seconds: 3)),
      );
      leapEverySecond(
        t0.add(const Duration(seconds: 4)),
        const Duration(seconds: 40),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 12))),
        LiveTvStreamStatus.stillTrying,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('a playing channel whose clock starts leaping is lost', () {
      tuneIn(t0);
      showFrames(t0, span: const Duration(seconds: 10));
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 9))),
        LiveTvStreamStatus.playing,
      );
      final broken = t0.add(const Duration(seconds: 10));
      leapEverySecond(broken, const Duration(seconds: 50));
      expect(
        tracker.statusAt(broken.add(const Duration(seconds: 5))),
        LiveTvStreamStatus.reconnecting,
      );
      expect(
        tracker.statusAt(broken.add(const Duration(seconds: 46))),
        LiveTvStreamStatus.lost,
      );
    });

    test(
      'a clock that freezes after playing is a stall the player never reports',
      () {
        tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
        tracker.onBringup(phase(PlaybackBringupPhase.ready, token: 1), t0);
        showFrames(t0);
        // The last step was at t0+3s; nothing has been said since.
        expect(
          tracker.statusAt(t0.add(const Duration(seconds: 4))),
          LiveTvStreamStatus.playing,
        );
        expect(
          tracker.statusAt(t0.add(const Duration(seconds: 8))),
          LiveTvStreamStatus.reconnecting,
        );
        expect(
          tracker.statusAt(t0.add(const Duration(seconds: 49))),
          LiveTvStreamStatus.lost,
        );
      },
    );

    test('on screen but never playing is still trying, then unavailable', () {
      // tvOS reports ready as soon as its player is presented, black and
      // waiting on a manifest the dropped tuner will never fill.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.ready, token: 1),
        t0.add(const Duration(seconds: 3)),
      );
      tracker.onBuffering(true, t0.add(const Duration(seconds: 3)));
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 4))),
        LiveTvStreamStatus.connecting,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 12))),
        LiveTvStreamStatus.stillTrying,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 29))),
        LiveTvStreamStatus.stillTrying,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('playing with a clock that never moves is not playing', () {
      // The tvOS player says playing as soon as its clock is told to run,
      // still black on a manifest the dropped tuner never filled.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.ready, token: 1),
        t0.add(const Duration(seconds: 2)),
      );
      tracker.onPlaying(true, t0.add(const Duration(seconds: 2)));
      for (var i = 0; i < 40; i++) {
        tracker.onPosition(
          Duration.zero,
          t0.add(Duration(seconds: 2, milliseconds: 250 * i)),
        );
      }
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 6))),
        LiveTvStreamStatus.connecting,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 10))),
        LiveTvStreamStatus.stillTrying,
      );
      // A stall on a channel that never showed a frame is not a lost feed.
      tracker.onBuffering(true, t0.add(const Duration(seconds: 12)));
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 20))),
        LiveTvStreamStatus.stillTrying,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('a channel whose clock starts within the allowance never says '
        'still trying', () {
      // A healthy tvOS channel: on screen at once, a few seconds of engine
      // warm-up, then the clock steps. The two seconds it takes to prove
      // the frames must not push the wait over the line.
      tuneIn(t0);
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 7))),
        LiveTvStreamStatus.connecting,
      );
      showFrames(
        t0.add(const Duration(seconds: 7)),
        span: const Duration(milliseconds: 500),
      );
      // Past eight seconds, but the clock has been stepping since seven:
      // frames are on screen, and the spinner is already gone.
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 8200))),
        LiveTvStreamStatus.playing,
      );
      showFrames(
        t0.add(const Duration(milliseconds: 7750)),
        from: const Duration(milliseconds: 750),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 11))),
        LiveTvStreamStatus.playing,
      );
    });

    test('the first clean steps show as playing before the run is proven', () {
      // Taken from a macOS log: the stream opened at 1.2s, the clock
      // started at 3.0s, and the viewer looked at a spinner over the
      // picture until the two-second proof was in at 5.0s.
      tuneIn(t0);
      tracker.onBuffering(true, t0.add(const Duration(milliseconds: 300)));
      tracker.onBuffering(false, t0.add(const Duration(seconds: 2)));
      showFrames(
        t0.add(const Duration(seconds: 2)),
        span: const Duration(milliseconds: 500),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 2600))),
        LiveTvStreamStatus.playing,
      );
      // A leap takes that away again until a run is proven.
      showFrames(
        t0.add(const Duration(milliseconds: 2750)),
        from: const Duration(seconds: 100),
        span: const Duration(milliseconds: 750),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 3600))),
        LiveTvStreamStatus.connecting,
      );
    });

    test('where frames are reported, a running clock alone is no picture', () {
      // Taken from an Android TV emulator: ExoPlayer ran its clock on the
      // dead channel's sound track for minutes over a black screen, and
      // never drew a frame.
      tuneIn(t0);
      tracker.onPictureShown(false, t0);
      showFrames(
        t0.add(const Duration(seconds: 1)),
        span: const Duration(seconds: 40),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 4))),
        LiveTvStreamStatus.connecting,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 12))),
        LiveTvStreamStatus.stillTrying,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('where frames are reported, the first frame makes it playing', () {
      tuneIn(t0);
      tracker.onPictureShown(false, t0);
      showFrames(
        t0.add(const Duration(seconds: 1)),
        span: const Duration(seconds: 1),
      );
      // A second of clock over no picture proved nothing.
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.connecting,
      );
      tracker.onPictureShown(true, t0.add(const Duration(seconds: 2)));
      showFrames(
        t0.add(const Duration(milliseconds: 2250)),
        from: const Duration(milliseconds: 1250),
        span: const Duration(seconds: 2),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 4))),
        LiveTvStreamStatus.playing,
      );
    });

    test('a clock that froze after a few steps runs the wait out', () {
      tuneIn(t0);
      showFrames(
        t0.add(const Duration(seconds: 5)),
        span: const Duration(milliseconds: 500),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 10))),
        LiveTvStreamStatus.stillTrying,
      );
    });

    test('a single jump of the clock is not a frame', () {
      tuneIn(t0);
      tracker.onPlaying(true, t0);
      tracker.onPosition(Duration.zero, t0);
      // The live edge is found: the clock leaps to the stream's own time.
      tracker.onPosition(const Duration(hours: 3), t0);
      tracker.onPosition(const Duration(hours: 3), t0);
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 30))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('a failure after ready but before any frame is unavailable', () {
      tuneIn(t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.failed, token: 1, error: 'Source error'),
        t0.add(const Duration(seconds: 8)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 8))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('an instant refusal shows connecting for a moment first', () {
      // A retry on a channel the server refuses fails within a few hundred
      // milliseconds; without this the card would just redraw.
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(
          PlaybackBringupPhase.failed,
          token: 1,
          error: liveChannelUnavailableError,
        ),
        t0.add(const Duration(milliseconds: 300)),
      );
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 300))),
        LiveTvStreamStatus.connecting,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 1100))),
        LiveTvStreamStatus.connecting,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(milliseconds: 1200))),
        LiveTvStreamStatus.unavailable,
      );
    });

    test('buffering before ready never counts as a stall', () {
      tracker.onBringup(phase(PlaybackBringupPhase.opening, token: 1), t0);
      tracker.onBuffering(true, t0);
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.connecting,
      );
    });

    test('a new channel change after a failure starts clean', () {
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      tracker.onBringup(
        phase(PlaybackBringupPhase.failed, token: 1, error: 'x'),
        t0,
      );
      expect(
        tracker.statusAt(t0.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.unavailable,
      );
      final retry = t0.add(const Duration(seconds: 10));
      tracker.onBringup(phase(PlaybackBringupPhase.stoppingPrevious), retry);
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 2), retry);
      expect(tracker.statusAt(retry), LiveTvStreamStatus.connecting);
      expect(
        tracker.statusAt(retry.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.connecting,
      );
    });

    test('a re-resolve with a new token restarts the bringup clock', () {
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 1), t0);
      final again = t0.add(const Duration(seconds: 4));
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 2), again);
      expect(
        tracker.statusAt(again.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.connecting,
      );
    });

    test('the player running out on its own after playing is lost', () {
      // Seen on tvOS: the engine served what it held as a finished asset
      // once the tuner stopped feeding it, AVPlayer ran that out and said
      // completed, and the manager stopped the channel and announced the
      // session's end. The screen was black with nothing on it.
      tuneIn(t0);
      showFrames(t0, span: const Duration(seconds: 10));
      final stopped = t0.add(const Duration(seconds: 12));
      tracker.onBringup(const PlaybackBringupState.idle(), stopped);
      expect(tracker.statusAt(stopped), LiveTvStreamStatus.idle);
      tracker.onEnded(stopped);
      expect(tracker.statusAt(stopped), LiveTvStreamStatus.lost);
      expect(
        tracker.statusAt(stopped.add(const Duration(minutes: 1))),
        LiveTvStreamStatus.lost,
      );
    });

    test('the player running out before any frame is unavailable', () {
      tuneIn(t0);
      final stopped = t0.add(const Duration(seconds: 8));
      tracker.onBringup(const PlaybackBringupState.idle(), stopped);
      tracker.onEnded(stopped);
      expect(tracker.statusAt(stopped), LiveTvStreamStatus.unavailable);
    });

    test('a channel change after the player ran out starts clean', () {
      tuneIn(t0);
      showFrames(t0);
      tracker.onBringup(const PlaybackBringupState.idle(), t0);
      tracker.onEnded(t0.add(const Duration(seconds: 5)));
      final retry = t0.add(const Duration(seconds: 10));
      tracker.onBringup(phase(PlaybackBringupPhase.resolving, token: 2), retry);
      expect(tracker.statusAt(retry), LiveTvStreamStatus.connecting);
      expect(
        tracker.statusAt(retry.add(const Duration(seconds: 2))),
        LiveTvStreamStatus.connecting,
      );
    });

    test('a session end with no channel on record is ignored', () {
      tracker.onEnded(t0);
      expect(tracker.statusAt(t0), LiveTvStreamStatus.idle);
    });

    test('idle clears everything', () {
      tuneIn(t0);
      tracker.onBuffering(true, t0);
      tracker.onBringup(const PlaybackBringupState.idle(), t0);
      expect(
        tracker.statusAt(t0.add(const Duration(minutes: 1))),
        LiveTvStreamStatus.idle,
      );
    });
  });

  group('liveSourceProbeFailed', () {
    test(
      'recognises the placeholder Jellyfin returns after a failed probe',
      () {
        // Shape taken from a Jellyfin log where the tuner closed the stream
        // with no data and ffprobe found neither streams nor format.
        final streams = <Map<String, dynamic>>[
          {
            'Type': 'Video',
            'Codec': null,
            'Width': null,
            'Height': null,
            'BitRate': 2000000,
            'IsInterlaced': true,
            'Index': -1,
          },
          {'Type': 'Audio', 'Codec': null, 'BitRate': 192000, 'Index': -1},
        ];
        expect(liveSourceProbeFailed(streams), isTrue);
      },
    );

    test('a probed source with a codec and frame size is fine', () {
      final streams = <Map<String, dynamic>>[
        {'Type': 'Video', 'Codec': 'h264', 'Width': 1280, 'Height': 720},
        {'Type': 'Audio', 'Codec': 'aac', 'Channels': 2},
      ];
      expect(liveSourceProbeFailed(streams), isFalse);
    });

    test('a codec without dimensions is not the placeholder', () {
      final streams = <Map<String, dynamic>>[
        {'Type': 'Video', 'Codec': 'h264', 'Width': null, 'Height': null},
      ];
      expect(liveSourceProbeFailed(streams), isFalse);
    });

    test('an audio-only channel has no video stream to judge', () {
      final streams = <Map<String, dynamic>>[
        {'Type': 'Audio', 'Codec': 'aac', 'Channels': 2},
      ];
      expect(liveSourceProbeFailed(streams), isFalse);
      expect(liveSourceProbeFailed(const []), isFalse);
    });
  });
}
