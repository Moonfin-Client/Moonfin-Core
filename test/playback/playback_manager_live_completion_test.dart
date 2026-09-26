import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A backend whose completion and error streams a test drives by hand, so the
/// manager sees exactly the end-of-stream report a live source produces.
class _TestBackend extends Fake implements PlayerBackend {
  final _errors = StreamController<Map<String, dynamic>>.broadcast();
  final _completed = StreamController<bool>.broadcast();
  final _playing = StreamController<bool>.broadcast();
  final _buffering = StreamController<bool>.broadcast();
  final List<String> playedUrls = <String>[];
  int stopCalls = 0;
  int resumeLiveEdgeCalls = 0;
  /// Whether this engine can re-open a live source in place. False is the
  /// common case in the field -- only media3 can, and only for a source it
  /// was told is live -- and the manager must escalate rather than wait.
  bool canResumeLiveEdge = true;
  bool playing = false;
  bool buffering = false;
  /// Overrides [playWhenReady] independent of [playing], so a test can
  /// model a viewer pause or a buffer stall without conflating them.
  bool? playWhenReadyOverride;
  /// True simulates a backend that never reports its own intent (e.g.
  /// AppleTvBackend, AetherBackend, the web video backend,
  /// MediaKitPlayerBackend): [playWhenReady] always reads null, even while
  /// playing.
  bool forceNoIntent = false;
  Duration currentPosition = Duration.zero;
  Duration reportedDuration = Duration.zero;

  /// How many more times `play` should throw instead of opening, so a test
  /// can model a backend whose open/startup fails on the next N attempts.
  int failOpenTimes = 0;

  /// Backs [requiresStartupMediaReadyCheck]; a test flips this on to model
  /// an engine (media3) whose startup goes through the readiness poll.
  bool startupMediaReadyCheck = false;

  /// When true, `play` opens without ever reporting itself ready -- no
  /// frame, no buffer, no duration -- so a test can model a re-resolve whose
  /// media never becomes ready and the readiness poll has to time out.
  bool nextPlayNeverReady = false;

  /// Simulates web/MediaKit's playing+non-buffering events firing from
  /// inside `open`, before it returns -- the scenario the frame-seen reset
  /// has to survive.
  bool emitFrameDuringOpen = false;

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration => reportedDuration;

  @override
  Duration get buffer => Duration.zero;

  @override
  bool get isPlaying => playing;

  @override
  // Not playing with no explicit override reads as "still trying" (null),
  // not "paused" -- a stall must not look like a viewer pause.
  bool? get playWhenReady =>
      forceNoIntent ? null : playWhenReadyOverride ?? (playing ? true : null);

  @override
  double get playbackSpeed => 1.0;

  @override
  bool get isBuffering => buffering;

  @override
  Stream<Duration> get positionStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();

  @override
  Stream<bool> get playingStream => _playing.stream;

  /// Reports the engine has resumed playing, e.g. after a live recovery.
  void emitPlaying() {
    playing = true;
    _playing.add(true);
  }

  /// Reports the engine stopped delivering frames without the viewer having
  /// asked for that, e.g. a stall. Set [playWhenReady] to model a viewer
  /// pause instead.
  void emitNotPlaying({bool? playWhenReady}) {
    playing = false;
    if (playWhenReady != null) playWhenReadyOverride = playWhenReady;
    _playing.add(false);
  }

  void emitBuffering(bool value) {
    buffering = value;
    _buffering.add(value);
  }

  @override
  Stream<bool> get bufferingStream => _buffering.stream;

  @override
  Stream<bool> get completedStream => _completed.stream;

  @override
  Stream<Map<String, dynamic>>? get errorStream => _errors.stream;

  void emitCompleted() => _completed.add(true);

  /// A generic mid-stream source failure, e.g. the HTTP 502 a live direct
  /// play gets when the upstream hiccups.
  void emitSourceError() => _errors.add(<String, dynamic>{
    'event': 'error',
    'errorCode': 2004,
    'message': 'Source error',
  });

  void emitLiveSourceReset() => _errors.add(<String, dynamic>{
    'event': 'playerError',
    'kind': 'live_source_reset',
    'recoverable': true,
    'message': 'Live source reset',
  });

  @override
  Future<void> pause() async {}

  @override
  Future<void> resume() async {}

  @override
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get canRenderBitmapSubtitles => false;

  @override
  bool get requiresStartupMediaReadyCheck => startupMediaReadyCheck;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    if (failOpenTimes > 0) {
      failOpenTimes--;
      throw StateError('backend open failed');
    }
    playedUrls.add((mediaItem as Map<String, dynamic>)['url'] as String);
    if (nextPlayNeverReady) {
      // A stale position or duration from before this re-open would itself
      // satisfy the readiness poll, so both are cleared -- nothing here
      // ever looks ready.
      currentPosition = Duration.zero;
      reportedDuration = Duration.zero;
      return;
    }
    currentPosition = startPosition;
    playing = true;
    if (emitFrameDuringOpen) {
      _playing.add(true);
      buffering = false;
      _buffering.add(false);
    }
  }

  @override
  Future<void> stop() async {
    stopCalls++;
    playing = false;
  }

  @override
  Future<bool> resumeLiveEdge() async {
    resumeLiveEdgeCalls++;
    return canResumeLiveEdge;
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  void dispose() {
    _errors.close();
    _completed.close();
    _playing.close();
    _buffering.close();
  }
}

class _TestResolver extends MediaStreamResolver {
  int calls = 0;

  /// Whether the server hands back a live stream id. Off for the case where
  /// only the item's type says the channel is live.
  bool issueLiveStreamId = true;

  /// Records whether each resolve was allowed to direct play, so the
  /// escalation to a server transcode on the last attempt is observable.
  final List<bool> directPlayAllowed = <bool>[];

  /// Records whether each resolve was allowed a direct stream, so a forced
  /// transcode (both refused) is distinguishable from a plain server-served
  /// escalation (only direct play refused).
  final List<bool> directStreamAllowed = <bool>[];

  /// 1-based call numbers that throw instead of resolving, e.g. a server
  /// that is unreachable for the first two live-recovery re-resolves.
  final Set<int> failOnCalls = <int>{};

  /// How long each resolve takes before returning (or throwing), so a test
  /// can model a slow re-resolve that eats into its own recovery gap.
  Duration delay = Duration.zero;

  /// The play method every successful resolve reports, so a test can model a
  /// channel that is already direct-played, direct-streamed or transcoded.
  StreamPlayMethod playMethod = StreamPlayMethod.transcode;

  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async {
    calls++;
    final thisCall = calls;
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }
    if (failOnCalls.contains(thisCall)) {
      throw StateError('server unreachable');
    }
    directPlayAllowed.add(enableDirectPlay);
    directStreamAllowed.add(enableDirectStream);
    final type = (mediaItem as Map<String, dynamic>)['Type'];
    final isLive = type == 'TvChannel' || type == 'LiveTvChannel';
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$thisCall',
      mediaSourceId: 'source-$thisCall',
      liveStreamId: isLive && issueLiveStreamId ? 'live-$thisCall' : null,
      playSessionId: 'session-$thisCall',
      playMethod: playMethod,
      mediaStreams: const [],
    );
  }
}

class _TestService implements PlayerService {
  final List<String> events = <String>[];
  final List<StreamResolutionResult> stoppedResolutions =
      <StreamResolutionResult>[];

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    events.add('start:${resolution.playSessionId}');
  }

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async {
    events.add('stop:${resolution.playSessionId}');
    stoppedResolutions.add(resolution);
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

/// Drives the recovery budget's rolling window without waiting a minute.
class _Clock {
  DateTime now = DateTime(2026, 9, 15, 20);

  void advance(Duration by) => now = now.add(by);
}

PlaybackManager _manager(
  _TestBackend backend,
  _TestResolver resolver,
  _TestService service,
  _Clock clock,
) => PlaybackManager()
  ..setBackend(backend)
  ..setResolver(resolver)
  ..setPlayerService(service)
  ..clock = (() => clock.now);

/// The manager reads completion off a stream and recovers without awaiting,
/// so a test has to let those microtasks run before asserting.
Future<void> _settle() => pumpEventQueue(times: 40);

const _liveChannel = <String, dynamic>{
  'Id': 'channel-1',
  'Type': 'TvChannel',
  'Name': 'WKRC',
};

const _movie = <String, dynamic>{
  'Id': 'movie-1',
  'Type': 'Movie',
  'Name': 'A Film',
};

void main() {
  group('live end-of-stream never means finished', () {
    for (final autoAdvance in <bool>[true, false]) {
      test(
        'autoAdvance=$autoAdvance: a completed live item recovers instead of '
        'stopping',
        () async {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final clock = _Clock();
          final manager = _manager(backend, resolver, service, clock)
            ..autoAdvanceEnabled = autoAdvance;
          try {
            await manager.playItems(<dynamic>[_liveChannel]);
            backend.currentPosition = const Duration(seconds: 12);

            backend.emitCompleted();
            await _settle();

            expect(backend.resumeLiveEdgeCalls, 1);
            expect(backend.stopCalls, isZero);
            expect(service.stoppedResolutions, isEmpty);
            expect(resolver.calls, 1);
          } finally {
            manager.dispose();
          }
        },
      );
    }

    test('a channel known live only by its item type still recovers', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver()..issueLiveStreamId = false;
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);
        expect(manager.currentResolution?.liveStreamId, isNull);

        backend.emitCompleted();
        await _settle();

        expect(backend.resumeLiveEdgeCalls, 1);
        expect(service.stoppedResolutions, isEmpty);
      } finally {
        manager.dispose();
      }
    });

    test('a VOD stream the client outran recovers instead of parking', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_movie]);
        // Ninety minutes long, the player gave up ten minutes in.
        backend.reportedDuration = const Duration(minutes: 90);
        backend.currentPosition = const Duration(minutes: 10);
        // Past the settle window that ignores a completion right after start.
        clock.advance(const Duration(seconds: 30));

        backend.emitCompleted();
        await _settle();

        // It used to do nothing at all and leave the player on its last frame.
        expect(backend.resumeLiveEdgeCalls, 1);
        expect(service.stoppedResolutions, isEmpty);
      } finally {
        manager.dispose();
      }
    });

    test('a finished VOD item still stops and reports', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock)
        ..autoAdvanceEnabled = false;
      try {
        await manager.playItems(<dynamic>[_movie]);
        backend.reportedDuration = const Duration(minutes: 90);
        backend.currentPosition = const Duration(minutes: 90);

        backend.emitCompleted();
        await _settle();

        expect(backend.resumeLiveEdgeCalls, isZero);
        expect(service.stoppedResolutions, hasLength(1));
      } finally {
        manager.dispose();
      }
    });
  });

  group('recovery budget', () {
    test('escalates resume, re-resolve, server stream, then gives up', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      final sessionEnded = <void>[];
      final sub = manager.sessionEndedStream.listen(sessionEnded.add);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 4; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitCompleted();
          await _settle();
        }

        expect(backend.resumeLiveEdgeCalls, 1);
        // Attempt two re-resolves on the fast direct route; only attempt
        // three, the last thing tried before the channel is given up, hands
        // the stream to the server.
        expect(resolver.calls, 3);
        expect(resolver.directPlayAllowed, <bool>[true, true, false]);
        expect(backend.playedUrls, <String>[
          'https://example.test/session-1',
          'https://example.test/session-2',
          'https://example.test/session-3',
        ]);
        // The fourth event is terminal: the tuner is released and the
        // bringup is reported failed, which is how this manager says a stream
        // could not be played.
        expect(service.stoppedResolutions, isNotEmpty);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        expect(manager.bringupState.error, liveStreamLostError);
        // A dead channel is a failure, not a finished queue.
        expect(sessionEnded, isEmpty);
      } finally {
        await sub.cancel();
        manager.dispose();
      }
    });

    test('a second completion inside the debounce window is ignored', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitCompleted();
        await _settle();
        clock.advance(const Duration(milliseconds: 200));
        backend.emitCompleted();
        await _settle();

        expect(backend.resumeLiveEdgeCalls, 1);
      } finally {
        manager.dispose();
      }
    });

    test('a quiet minute gives the budget back', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 6; i++) {
          clock.advance(const Duration(seconds: 90));
          backend.emitCompleted();
          await _settle();
        }

        // Every hiccup sat a clear minute past the last, so each one is the
        // first attempt of a fresh budget and none of them escalates.
        expect(backend.resumeLiveEdgeCalls, 6);
        expect(service.stoppedResolutions, isEmpty);
        expect(resolver.calls, 1);
      } finally {
        manager.dispose();
      }
    });

    test('a live source reset shares the budget and skips the cheap tier', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      final sessionEnded = <void>[];
      final sub = manager.sessionEndedStream.listen(sessionEnded.add);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 4; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitLiveSourceReset();
          await _settle();
        }

        // Re-opening a reset source in place cannot help, so all three
        // attempts re-resolve, and the fourth event is still terminal.
        expect(backend.resumeLiveEdgeCalls, isZero);
        expect(resolver.calls, 4);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        await sub.cancel();
        manager.dispose();
      }
    });

    test('retuning the channel restores the whole budget', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);
        for (var i = 0; i < 4; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitCompleted();
          await _settle();
        }
        expect(service.stoppedResolutions, isNotEmpty);
        final resumesBeforeRetry = backend.resumeLiveEdgeCalls;

        // What Retry on the channel-lost card does.
        await manager.playItems(<dynamic>[_liveChannel]);
        clock.advance(const Duration(seconds: 5));
        backend.emitCompleted();
        await _settle();

        // A cheap resume, not the terminal step a spent budget would give.
        expect(backend.resumeLiveEdgeCalls, resumesBeforeRetry + 1);
      } finally {
        manager.dispose();
      }
    });

    test('a live source error recovers instead of killing the channel', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitSourceError();
        await _settle();

        // One bad response is a hiccup, not a dead channel.
        expect(backend.resumeLiveEdgeCalls, 1);
        expect(manager.bringupState.phase, isNot(PlaybackBringupPhase.failed));
        expect(service.stoppedResolutions, isEmpty);
      } finally {
        manager.dispose();
      }
    });

    test('a VOD source error still fails the bringup', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_movie]);

        backend.emitSourceError();
        await _settle();

        expect(backend.resumeLiveEdgeCalls, isZero);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        manager.dispose();
      }
    });

    test('repeated live source errors still give up in the end', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 5; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitSourceError();
          await _settle();
        }

        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        expect(manager.bringupState.error, liveStreamLostError);
      } finally {
        manager.dispose();
      }
    });

    test('completions and source resets cannot exceed one budget', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      final sessionEnded = <void>[];
      final sub = manager.sessionEndedStream.listen(sessionEnded.add);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 6; i++) {
          clock.advance(const Duration(seconds: 25));
          if (i.isEven) {
            backend.emitCompleted();
          } else {
            backend.emitLiveSourceReset();
          }
          await _settle();
        }

        // Three recoveries, then terminal, and nothing after it revives the
        // channel: six events must not buy six attempts.
        expect(backend.resumeLiveEdgeCalls, lessThanOrEqualTo(1));
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        await sub.cancel();
        manager.dispose();
      }
    });
  });

  group('live recovery status', () {
    test('reports attempt 1 of 3 on the first recovery', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      final statuses = <LiveRecoveryStatus?>[];
      final sub = manager.liveRecoveryStatusStream.listen(statuses.add);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitCompleted();
        await _settle();

        expect(manager.liveRecoveryStatus?.attempt, 1);
        expect(manager.liveRecoveryStatus?.maxAttempts, 3);
        expect(statuses.whereType<LiveRecoveryStatus>().length, 1);
      } finally {
        await sub.cancel();
        manager.dispose();
      }
    });

    test('advances with further attempts', () async {
      final backend = _TestBackend()..canResumeLiveEdge = false;
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 3; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitCompleted();
          await _settle();
          expect(manager.liveRecoveryStatus?.attempt, i + 1);
          expect(manager.liveRecoveryStatus?.maxAttempts, 3);
        }
      } finally {
        manager.dispose();
      }
    });

    test('clears when the backend reports playing', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitCompleted();
        await _settle();
        expect(manager.liveRecoveryStatus, isNotNull);

        backend.emitPlaying();
        await _settle();

        expect(manager.liveRecoveryStatus, isNull);
      } finally {
        manager.dispose();
      }
    });

    test('clears on give-up, alongside the failed bringup state', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        for (var i = 0; i < 5; i++) {
          clock.advance(const Duration(seconds: 25));
          backend.emitCompleted();
          await _settle();
        }

        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        expect(manager.liveRecoveryStatus, isNull);
      } finally {
        manager.dispose();
      }
    });

    test('clears when the viewer stops playback', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitCompleted();
        await _settle();
        expect(manager.liveRecoveryStatus, isNotNull);

        await manager.stop();

        expect(manager.liveRecoveryStatus, isNull);
      } finally {
        manager.dispose();
      }
    });

    test('clears when the viewer tunes to another channel', () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final clock = _Clock();
      final manager = _manager(backend, resolver, service, clock);
      try {
        await manager.playItems(<dynamic>[_liveChannel]);

        backend.emitCompleted();
        await _settle();
        expect(manager.liveRecoveryStatus, isNotNull);

        await manager.playItems(<dynamic>[
          <String, dynamic>{
            'Id': 'channel-2',
            'Type': 'TvChannel',
            'Name': 'WXIX',
          },
        ]);

        expect(manager.liveRecoveryStatus, isNull);
      } finally {
        manager.dispose();
      }
    });
  });

  group('recovery gaps and failed re-resolves', () {
    // The initial tune itself resolves once, so recovery's own re-resolves
    // start counting from call 2.
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'attempt 2 waits 10s and attempt 3 waits 20s after the attempt before '
      'it',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            // A second failure 1s later is well inside the 10s gap attempt 2
            // needs, so it is held rather than spending another attempt.
            async.elapse(const Duration(seconds: 1));
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            async.elapse(const Duration(seconds: 9));
            async.flushMicrotasks();
            expect(resolver.calls, 3);

            // Same story for attempt 3's 20s gap.
            async.elapse(const Duration(seconds: 5));
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 3);

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            expect(resolver.calls, 4);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'a slow but successful re-resolve is not spent by the next attempt\'s '
      'gap: the gap is measured from when it finished, not when it started',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            // Attempt 1's re-resolve itself takes 12s to complete.
            resolver.delay = const Duration(seconds: 12);
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);
            expect(backend.playing, isFalse);

            async.elapse(const Duration(seconds: 12));
            async.flushMicrotasks();
            expect(backend.playing, isTrue);

            // The stream stalls again right after attempt 1 finishes. If the
            // gap were measured from when attempt 1 started, 10s would
            // already be spent and this would fire immediately.
            resolver.delay = Duration.zero;
            backend.playing = false;
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            async.elapse(const Duration(seconds: 9));
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            async.elapse(const Duration(seconds: 1));
            async.flushMicrotasks();
            expect(resolver.calls, 3);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'server down then back: attempts 1 and 2 fail to re-resolve, attempt '
      '3 succeeds without giving the channel up',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()..failOnCalls.addAll([2, 3]);
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );

            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            expect(resolver.calls, 3);
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );

            async.elapse(const Duration(seconds: 20));
            async.flushMicrotasks();
            expect(resolver.calls, 4);
            // The last attempt, so it hands the stream to the server.
            expect(resolver.directPlayAllowed.last, isFalse);
            expect(backend.playing, isTrue);
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'server never comes back: the channel is given up after attempt 3 '
      'fails and the resolver is not called again',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()..failOnCalls.addAll([2, 3, 4]);
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            backend.emitCompleted();
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 20));
            async.flushMicrotasks();

            expect(resolver.calls, 4);
            expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
            expect(manager.bringupState.error, liveStreamLostError);

            async.elapse(const Duration(minutes: 5));
            async.flushMicrotasks();
            expect(resolver.calls, 4);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'the viewer stopping during the post-failure wait cancels the '
      'scheduled retry',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()..failOnCalls.add(2);
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            unawaited(manager.stop());
            async.flushMicrotasks();

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();

            expect(resolver.calls, 2);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'a live re-resolve whose media never becomes ready still schedules '
      'the next attempt, and the budget ends in one failed bringup',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()
            ..playMethod = StreamPlayMethod.directPlay;
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          final failedCount = <void>[];
          final sub = manager.bringupStateStream.listen((s) {
            if (s.phase == PlaybackBringupPhase.failed) failedCount.add(null);
          });
          try {
            backend.startupMediaReadyCheck = true;
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);
            expect(backend.playing, isTrue);

            // From here every re-resolve's media never becomes ready.
            backend.nextPlayNeverReady = true;
            backend.emitCompleted();
            async.flushMicrotasks();

            // Attempt 1's readiness poll times out after 15s.
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );

            // Attempt 2 waits its 10s gap, then its own 15s readiness poll.
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            expect(resolver.calls, 3);
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();

            // Attempt 3 waits its 20s gap, then its own 15s readiness poll.
            async.elapse(const Duration(seconds: 20));
            async.flushMicrotasks();
            expect(resolver.calls, 4);
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();

            expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
            expect(manager.bringupState.error, liveStreamLostError);
            expect(failedCount, hasLength(1));
          } finally {
            unawaited(sub.cancel());
            manager.dispose();
          }
        });
      },
    );

    test(
      'a starved VOD re-resolve whose media never becomes ready fails with '
      'streamStarvedError instead of hanging',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()
            ..playMethod = StreamPlayMethod.directPlay;
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            backend.startupMediaReadyCheck = true;
            unawaited(manager.playItems(<dynamic>[_movie]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);
            expect(backend.playing, isTrue);

            // Ninety minutes long, the player gave up ten minutes in, well
            // past the settle window that ignores a completion right after
            // start.
            backend.reportedDuration = const Duration(minutes: 90);
            backend.currentPosition = const Duration(minutes: 10);
            async.elapse(const Duration(seconds: 10));

            backend.nextPlayNeverReady = true;
            backend.emitCompleted();
            async.flushMicrotasks();

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 20));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();

            expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
            expect(manager.bringupState.error, streamStarvedError);
          } finally {
            manager.dispose();
          }
        });
      },
    );
  });

  group('attempt 3 escalation follows the channel\'s current route', () {
    test(
      'a direct-played channel is escalated to server-served without '
      'forcing a transcode',
      () async {
        final backend = _TestBackend();
        final resolver = _TestResolver()
          ..playMethod = StreamPlayMethod.directPlay;
        final service = _TestService();
        final clock = _Clock();
        final manager = _manager(backend, resolver, service, clock);
        try {
          await manager.playItems(<dynamic>[_liveChannel]);

          for (var i = 0; i < 3; i++) {
            clock.advance(const Duration(seconds: 25));
            backend.emitCompleted();
            await _settle();
          }

          // Direct play is given up on the last attempt, but direct stream
          // -- a remux -- is still left on the table.
          expect(resolver.directPlayAllowed.last, isFalse);
          expect(resolver.directStreamAllowed.last, isTrue);
        } finally {
          manager.dispose();
        }
      },
    );

    test(
      'a channel already on direct stream is escalated to a forced '
      'transcode',
      () async {
        final backend = _TestBackend();
        final resolver = _TestResolver()
          ..playMethod = StreamPlayMethod.directStream;
        final service = _TestService();
        final clock = _Clock();
        final manager = _manager(backend, resolver, service, clock);
        try {
          await manager.playItems(<dynamic>[_liveChannel]);

          for (var i = 0; i < 3; i++) {
            clock.advance(const Duration(seconds: 25));
            backend.emitCompleted();
            await _settle();
          }

          // Already server-served, so disabling direct play again would do
          // nothing: the last attempt forces a full transcode instead.
          expect(resolver.directPlayAllowed.last, isFalse);
          expect(resolver.directStreamAllowed.last, isFalse);
        } finally {
          manager.dispose();
        }
      },
    );

    test(
      'the escalation does not stick: retuning and Retry both restore the '
      'viewer\'s own direct-play setting',
      () async {
        final backend = _TestBackend();
        final resolver = _TestResolver()
          ..playMethod = StreamPlayMethod.directPlay;
        final service = _TestService();
        final clock = _Clock();
        final manager = _manager(backend, resolver, service, clock);
        try {
          await manager.playItems(
            <dynamic>[_liveChannel],
            enableDirectPlay: true,
            enableDirectStream: true,
          );

          for (var i = 0; i < 3; i++) {
            clock.advance(const Duration(seconds: 25));
            backend.emitCompleted();
            await _settle();
          }
          expect(resolver.directPlayAllowed.last, isFalse);

          // Tuning to another channel is a fresh playItems call: nothing the
          // escalation did should carry over to it.
          resolver.directPlayAllowed.clear();
          await manager.playItems(
            <dynamic>[
              <String, dynamic>{
                'Id': 'channel-2',
                'Type': 'TvChannel',
                'Name': 'WXIX',
              },
            ],
            enableDirectPlay: true,
            enableDirectStream: true,
          );
          expect(resolver.directPlayAllowed, <bool>[true]);

          // Retry on the original channel -- also a fresh playItems call --
          // behaves the same way.
          resolver.directPlayAllowed.clear();
          await manager.playItems(
            <dynamic>[_liveChannel],
            enableDirectPlay: true,
            enableDirectStream: true,
          );
          expect(resolver.directPlayAllowed, <bool>[true]);
        } finally {
          manager.dispose();
        }
      },
    );
  });

  group('the queue\'s direct-play setting survives a recovery re-resolve', () {
    test(
      'a channel tuned with direct play off stays off through every '
      'recovery attempt',
      () async {
        final backend = _TestBackend()..canResumeLiveEdge = false;
        final resolver = _TestResolver();
        final service = _TestService();
        final clock = _Clock();
        final manager = _manager(backend, resolver, service, clock);
        try {
          await manager.playItems(
            <dynamic>[_liveChannel],
            enableDirectPlay: false,
            enableDirectStream: true,
          );

          for (var i = 0; i < 3; i++) {
            clock.advance(const Duration(seconds: 25));
            backend.emitCompleted();
            await _settle();
          }

          expect(
            resolver.directPlayAllowed,
            everyElement(isFalse),
          );
        } finally {
          manager.dispose();
        }
      },
    );
  });

  group('live stall watchdog', () {
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'a channel that opens but never plays recovers at 15s, not before',
      () {
        fakeAsync((async) {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);

            async.elapse(const Duration(seconds: 14));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);

            async.elapse(const Duration(seconds: 1));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, 1);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test('a stopped channel never restarts itself', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();

          unawaited(manager.stop());
          async.flushMicrotasks();
          // A stopped player still reports "not playing" with its intent
          // unchanged; that must not re-arm the watchdog.
          backend.emitNotPlaying(playWhenReady: true);
          backend.emitBuffering(true);
          async.flushMicrotasks();
          final resolvesAfterStop = resolver.calls;

          async.elapse(const Duration(minutes: 3));
          async.flushMicrotasks();

          expect(backend.resumeLiveEdgeCalls, isZero);
          expect(resolver.calls, resolvesAfterStop);
        } finally {
          manager.dispose();
        }
      });
    });

    test('a given-up channel stays down behind the Retry card', () {
      fakeAsync((async) {
        final backend = _TestBackend()..canResumeLiveEdge = false;
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          for (var i = 0; i < 20; i++) {
            if (manager.bringupState.phase == PlaybackBringupPhase.failed) {
              break;
            }
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
          }
          expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
          final resolvesAtGiveUp = resolver.calls;
          final resumesAtGiveUp = backend.resumeLiveEdgeCalls;
          final stopsAtGiveUp = service.stoppedResolutions.length;
          final notes = <String>[];
          manager.setDiagnosticLogger(notes.add);

          // Media3 re-reports playing/buffering on every state update, so a
          // stopped player keeps saying "not playing". Run long past the 60s
          // window that would otherwise refill the budget.
          for (var i = 0; i < 180; i++) {
            backend.emitNotPlaying(playWhenReady: true);
            backend.emitBuffering(true);
            async.elapse(const Duration(seconds: 1));
            async.flushMicrotasks();
          }

          expect(resolver.calls, resolvesAtGiveUp);
          expect(backend.resumeLiveEdgeCalls, resumesAtGiveUp);
          // No repeated give-ups either: each would send the server another
          // stop report for a channel that is already down.
          expect(service.stoppedResolutions, hasLength(stopsAtGiveUp));
          // Nor a watchdog quietly firing on a channel that is already down.
          expect(
            notes.where((n) => n.startsWith('Live stall watchdog')),
            isEmpty,
          );
          expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
        } finally {
          manager.dispose();
        }
      });
    });

    test('a channel that played then buffers for 8s recovers', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();

          backend.emitNotPlaying();
          backend.emitBuffering(true);
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);

          async.elapse(const Duration(seconds: 7));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);

          async.elapse(const Duration(seconds: 1));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, 1);
        } finally {
          manager.dispose();
        }
      });
    });

    test(
      'a frame seen during open (web/MediaKit) still gets the 8s '
      'mid-stream window on the next stall, not 15s',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..emitFrameDuringOpen = true;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            // No separate emitPlaying() -- the frame was already reported
            // from inside open(), before the tune's own await returned.
            backend.emitNotPlaying();
            backend.emitBuffering(true);
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);

            async.elapse(const Duration(seconds: 7));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);

            async.elapse(const Duration(seconds: 1));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, 1);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'a 6s buffer that resolves back into playing does not recover',
      () {
        fakeAsync((async) {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            backend.emitPlaying();
            async.flushMicrotasks();

            backend.emitNotPlaying();
            backend.emitBuffering(true);
            async.flushMicrotasks();

            async.elapse(const Duration(seconds: 6));
            async.flushMicrotasks();
            backend.emitBuffering(false);
            backend.emitPlaying();
            async.flushMicrotasks();

            // Past where the 8s window would have fired had it not been
            // cancelled by the second emitPlaying above.
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test('after an in-place resume the next frame gets the 15s window', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();
          backend.emitNotPlaying();
          backend.emitBuffering(true);
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 8));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, 1);
          final resolves = resolver.calls;

          // The reopened source is treated like a fresh tune: 8s of no frame
          // is not yet a stall.
          async.elapse(const Duration(seconds: 12));
          async.flushMicrotasks();
          expect(resolver.calls, resolves);

          async.elapse(const Duration(seconds: 4));
          async.flushMicrotasks();
          expect(resolver.calls, resolves + 1);
        } finally {
          manager.dispose();
        }
      });
    });

    test('a viewer pause never recovers, even after 60s', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();

          backend.emitNotPlaying(playWhenReady: false);
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 60));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);
        } finally {
          manager.dispose();
        }
      });
    });

    test('a VOD item that never plays or buffers is never watched', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_movie]));
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 60));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);
        } finally {
          manager.dispose();
        }
      });
    });

    test('stopping during the countdown drops the watchdog', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 10));
          unawaited(manager.stop());
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 10));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);
        } finally {
          manager.dispose();
        }
      });
    });

    test('tuning to another channel during the countdown drops it too', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 10));
          unawaited(manager.playItems(<dynamic>[
            <String, dynamic>{
              'Id': 'channel-2',
              'Type': 'TvChannel',
              'Name': 'WXIX',
            },
          ]));
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 10));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);
        } finally {
          manager.dispose();
        }
      });
    });

    test(
      'a resume that never plays escalates to a re-resolve on the next '
      'watchdog cycle',
      () {
        fakeAsync((async) {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, 1);
            expect(resolver.calls, 1);

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            expect(resolver.calls, 2);
            expect(backend.playedUrls.last, 'https://example.test/session-2');
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'repeated stalls exhaust the budget and give up, and the watchdog '
      'goes quiet after',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            // Drive the watchdog through enough 15s cycles to exhaust the
            // recovery budget: the stream never plays, so every cycle
            // re-fires it.
            for (var i = 0; i < 8; i++) {
              async.elapse(const Duration(seconds: 15));
              async.flushMicrotasks();
              if (manager.bringupState.phase ==
                  PlaybackBringupPhase.failed) {
                break;
              }
            }

            expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
            expect(manager.bringupState.error, liveStreamLostError);

            final callsAtGiveUp = resolver.calls;
            async.elapse(const Duration(minutes: 2));
            async.flushMicrotasks();
            expect(resolver.calls, callsAtGiveUp);
          } finally {
            manager.dispose();
          }
        });
      },
    );
  });

  group('live stall watchdog, intent-less backend', () {
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'a manager pause is never treated as a stall, even after 60s',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..forceNoIntent = true;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            backend.emitPlaying();
            async.flushMicrotasks();

            unawaited(manager.pause());
            backend.emitNotPlaying();
            // A pause a backend renders as buffering must still not recover
            // -- the explicit pause overrides it.
            backend.emitBuffering(true);
            async.flushMicrotasks();

            async.elapse(const Duration(seconds: 60));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test('buffering for 15s with no pause recovers', () {
      fakeAsync((async) {
        final backend = _TestBackend()..forceNoIntent = true;
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();

          backend.emitNotPlaying();
          backend.emitBuffering(true);
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 15));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, 1);
        } finally {
          manager.dispose();
        }
      });
    });

    test('a channel that opens and never plays recovers at 15s', () {
      fakeAsync((async) {
        final backend = _TestBackend()..forceNoIntent = true;
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 15));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, 1);
        } finally {
          manager.dispose();
        }
      });
    });

    test(
      'a pause from outside the app looks like "not playing, has frames" '
      'and is never treated as a stall, even after 60s',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..forceNoIntent = true;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            backend.emitPlaying();
            async.flushMicrotasks();

            // No manager.pause() call: this models a system-remote pause the
            // manager never heard about.
            backend.emitNotPlaying();
            async.flushMicrotasks();

            async.elapse(const Duration(seconds: 60));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test('pause then resume then buffering for 15s recovers', () {
      fakeAsync((async) {
        final backend = _TestBackend()..forceNoIntent = true;
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          async.flushMicrotasks();

          unawaited(manager.pause());
          backend.emitNotPlaying();
          async.flushMicrotasks();

          unawaited(manager.resume());
          backend.emitBuffering(true);
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 15));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, 1);
        } finally {
          manager.dispose();
        }
      });
    });
  });

  // Web/MediaKit forward `playing` as "unpaused", not "advancing": it can
  // report true while `buffering` is also true, unlike Media3's derived
  // `isPlaying`. These cover the `_isActuallyPlaying` helper the watchdog,
  // frame-seen bookkeeping and recovery-status clearing all read now.
  group('web/MediaKit-style playing+buffering progress', () {
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'playing=true with buffering=true for 15s is still a stall and '
      'recovers',
      () {
        fakeAsync((async) {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            // Buffering first, then playing, so the moment playing flips
            // there is already a buffering stall under way -- not a
            // transient "actually playing" instant in between.
            backend.emitBuffering(true);
            backend.emitPlaying();
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, isZero);

            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();
            expect(backend.resumeLiveEdgeCalls, 1);
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test('playing=true with buffering=false never recovers', () {
      fakeAsync((async) {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = fakeManager(backend, resolver, service, async);
        try {
          unawaited(manager.playItems(<dynamic>[_liveChannel]));
          async.flushMicrotasks();
          backend.emitPlaying();
          backend.emitBuffering(false);
          async.flushMicrotasks();

          async.elapse(const Duration(seconds: 60));
          async.flushMicrotasks();
          expect(backend.resumeLiveEdgeCalls, isZero);
        } finally {
          manager.dispose();
        }
      });
    });

    test(
      'recovery status stays set while playing&&buffering, and clears '
      'only once buffering ends',
      () {
        fakeAsync((async) {
          final backend = _TestBackend();
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            backend.emitCompleted();
            async.flushMicrotasks();
            expect(manager.liveRecoveryStatus, isNotNull);

            // The re-resolve's own play() succeeded, but the web/MediaKit
            // engine is still buffering: playing flips true while a
            // buffering stall is already under way, which is not yet
            // "actually playing". Buffering first, so there is no
            // momentary "actually playing" instant in between.
            backend.emitBuffering(true);
            backend.emitPlaying();
            async.flushMicrotasks();
            expect(manager.liveRecoveryStatus, isNotNull);

            // Buffering clears while already playing -- the moment
            // web/MediaKit playback actually resumes.
            backend.emitBuffering(false);
            async.flushMicrotasks();
            expect(manager.liveRecoveryStatus, isNull);
          } finally {
            manager.dispose();
          }
        });
      },
    );
  });

  group('a held retry does not interrupt playback that already resumed', () {
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'a failure held during an in-flight attempt is dropped once '
      'playback actually resumes, even past the hold',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver()
            ..delay = const Duration(seconds: 5);
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();
            expect(resolver.calls, 1);

            // Attempt 1's re-resolve is in flight (5s delay).
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(resolver.calls, 2);

            // A second failure arrives mid-flight and is held for attempt
            // 2's gap rather than spending another attempt immediately.
            backend.emitCompleted();
            async.flushMicrotasks();

            // Attempt 1 finishes and the channel actually starts playing.
            async.elapse(const Duration(seconds: 5));
            async.flushMicrotasks();
            expect(backend.playing, isTrue);
            backend.emitPlaying();
            backend.emitBuffering(false);
            async.flushMicrotasks();

            final callsAfterResume = resolver.calls;
            final resumesAfterResume = backend.resumeLiveEdgeCalls;

            // Elapse well past attempt 2's 10s gap (and the watchdog's own
            // fresh 15s window, which the resume above disarmed): the held
            // retry must not fire, because it was cancelled the moment
            // playback resumed.
            async.elapse(const Duration(seconds: 15));
            async.flushMicrotasks();

            expect(resolver.calls, callsAfterResume);
            expect(backend.resumeLiveEdgeCalls, resumesAfterResume);
          } finally {
            manager.dispose();
          }
        });
      },
    );
  });

  group('an intermediate recovery failure does not surface as terminal', () {
    PlaybackManager fakeManager(
      _TestBackend backend,
      _TestResolver resolver,
      _TestService service,
      FakeAsync async,
    ) => PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service)
      ..clock = () => DateTime(2026, 9, 15, 20).add(async.elapsed);

    test(
      'a recovery re-resolve whose backend.open throws emits no failed '
      'bringup state',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          final phases = <PlaybackBringupPhase>[];
          final sub = manager.bringupStateStream.listen(
            (s) => phases.add(s.phase),
          );
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            backend.failOpenTimes = 1;
            backend.emitCompleted();
            async.flushMicrotasks();

            expect(phases, isNot(contains(PlaybackBringupPhase.failed)));
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );
          } finally {
            unawaited(sub.cancel());
            manager.dispose();
          }
        });
      },
    );

    test(
      'the next attempt succeeding after a failed open leaves bringup not '
      'failed',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            backend.failOpenTimes = 1;
            backend.emitCompleted();
            async.flushMicrotasks();
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );

            // Attempt 2, after the 10s gap, opens cleanly.
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();

            expect(backend.playing, isTrue);
            expect(
              manager.bringupState.phase,
              isNot(PlaybackBringupPhase.failed),
            );
          } finally {
            manager.dispose();
          }
        });
      },
    );

    test(
      'exhausting the budget on repeated open failures still emits exactly '
      'one failed state with liveStreamLostError',
      () {
        fakeAsync((async) {
          final backend = _TestBackend()..canResumeLiveEdge = false;
          final resolver = _TestResolver();
          final service = _TestService();
          final manager = fakeManager(backend, resolver, service, async);
          final failedCount = <void>[];
          final sub = manager.bringupStateStream.listen((s) {
            if (s.phase == PlaybackBringupPhase.failed) failedCount.add(null);
          });
          try {
            unawaited(manager.playItems(<dynamic>[_liveChannel]));
            async.flushMicrotasks();

            // Only after the initial tune has already succeeded does every
            // recovery attempt's own play() fail.
            backend.failOpenTimes = 3;
            backend.emitCompleted();
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 10));
            async.flushMicrotasks();
            async.elapse(const Duration(seconds: 20));
            async.flushMicrotasks();

            expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
            expect(manager.bringupState.error, liveStreamLostError);
            expect(failedCount, hasLength(1));
          } finally {
            unawaited(sub.cancel());
            manager.dispose();
          }
        });
      },
    );
  });
}
