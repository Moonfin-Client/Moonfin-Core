import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  final _errors = StreamController<Map<String, dynamic>>.broadcast();
  Completer<void>? playGate;
  Completer<void>? pauseGate;
  Completer<void>? pauseStarted;
  Completer<void>? resumeGate;
  Completer<void>? resumeStarted;
  bool applyCapturedAutoPlayAfterOpen = false;
  Completer<bool>? liveEdgeGate;
  int resumeLiveEdgeCalls = 0;
  final List<String> playedUrls = <String>[];
  final List<Duration> startPositions = <Duration>[];
  final List<Map<String, dynamic>> playedPayloads = <Map<String, dynamic>>[];
  int stopCalls = 0;
  bool playing = false;
  Duration currentPosition = Duration.zero;
  void Function(int playCount)? onPlay;
  int? throwOnPlayCount;

  @override
  Future<void> pause() async {
    playing = false;
    pauseStarted?.complete();
    final gate = pauseGate;
    if (gate != null) {
      pauseGate = null;
      await gate.future;
    }
  }

  @override
  Future<void> resume() async {
    final gate = resumeGate;
    if (gate != null) {
      resumeGate = null;
      resumeStarted?.complete();
      await gate.future;
    }
    playing = true;
  }

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration =>
      playing ? const Duration(minutes: 30) : Duration.zero;

  @override
  Duration get buffer => Duration.zero;

  @override
  bool get isPlaying => playing;

  @override
  double get playbackSpeed => 1.0;

  @override
  bool get isBuffering => false;

  @override
  Stream<Duration> get positionStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();

  @override
  Stream<bool> get playingStream => const Stream<bool>.empty();

  @override
  Stream<bool> get bufferingStream => const Stream<bool>.empty();

  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();

  @override
  Stream<Map<String, dynamic>>? get errorStream => _errors.stream;

  void emitError(Map<String, dynamic> event) => _errors.add(event);

  @override
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get canRenderBitmapSubtitles => false;

  @override
  bool get requiresStartupMediaReadyCheck => false;

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
    final payload = mediaItem as Map<String, dynamic>;
    playedUrls.add(payload['url'] as String);
    playedPayloads.add(Map<String, dynamic>.from(payload));
    onPlay?.call(playedUrls.length);
    if (throwOnPlayCount == playedUrls.length) {
      throw StateError('test backend play failure');
    }
    startPositions.add(startPosition);
    currentPosition = startPosition;
    playing = payload['autoPlay'] as bool? ?? true;
    // Holds the first play open so a test can land an error while the manager
    // is still waiting for media. Later plays run straight through.
    final gate = playGate;
    if (gate != null) {
      playGate = null;
      await gate.future;
      if (applyCapturedAutoPlayAfterOpen) {
        playing = payload['autoPlay'] as bool? ?? true;
      }
    }
  }

  // Runs inside stop(), standing in for a dying player's late events.
  void Function()? onStop;

  @override
  Future<void> stop() async {
    stopCalls++;
    playing = false;
    onStop?.call();
  }

  @override
  Future<bool> resumeLiveEdge() async {
    resumeLiveEdgeCalls++;
    final gate = liveEdgeGate;
    if (gate != null) {
      liveEdgeGate = null;
      return gate.future;
    }
    return false;
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  Future<void> setRepeatMode(RepeatMode mode) async {}

  @override
  void dispose() => _errors.close();
}

class _TestResolver extends MediaStreamResolver {
  int calls = 0;
  Completer<void>? resolveGate;
  final List<String?> requestedMediaSourceIds = <String?>[];
  final List<int?> requestedStartTicks = <int?>[];
  final List<bool> requestedDirectPlay = <bool>[];
  final List<bool> requestedDirectStream = <bool>[];
  StreamPlayMethod playMethod = StreamPlayMethod.directStream;
  bool isLocalMedia = false;
  List<Map<String, dynamic>> mediaStreams = const [];

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
    final gate = resolveGate;
    if (gate != null) {
      resolveGate = null;
      await gate.future;
    }
    requestedMediaSourceIds.add(mediaSourceId);
    requestedStartTicks.add(startTimeTicks);
    requestedDirectPlay.add(enableDirectPlay);
    requestedDirectStream.add(enableDirectStream);
    final type = (mediaItem as Map<String, dynamic>)['Type'];
    final isLive = type == 'TvChannel' || type == 'LiveTvChannel';
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$calls',
      mediaSourceId: 'source-$calls',
      liveStreamId: isLive ? 'live-$calls' : null,
      playSessionId: 'session-$calls',
      playMethod: playMethod,
      isLocalMedia: isLocalMedia,
      mediaStreams: mediaStreams,
    );
  }
}

class _ProgressRequest {
  _ProgressRequest(this.index, this.sessionId, this.events);

  final int index;
  final String? sessionId;
  final List<String> events;
  final Completer<void> completer = Completer<void>();

  Future<void> get future => completer.future.then((_) {
    events.add('progress:$sessionId:$index');
  });
}

class _BlockingAudioOwner extends AudioOwnable {
  final Completer<void> gate = Completer<void>();
  int calls = 0;

  @override
  AudioProducer get audioProducerId => AudioProducer.game;

  @override
  Future<void> onAudioRevoked(RevokeReason reason) async {
    calls++;
    if (calls == 2) await gate.future;
  }
}

class _TestService implements PlayerService {
  _TestService({this.stallProgress = false});

  final bool stallProgress;
  final List<String> events = <String>[];
  final List<_ProgressRequest> progressRequests = <_ProgressRequest>[];
  final reportedVolumes = <(int?, bool?)>[];
  final List<StreamResolutionResult> stoppedResolutions =
      <StreamResolutionResult>[];
  final List<StreamResolutionResult> transcodingStops =
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
  }) {
    reportedVolumes.add((volumeLevel, isMuted));
    if (!stallProgress) {
      events.add('progress:${resolution.playSessionId}:immediate');
      return Future<void>.value();
    }
    final request = _ProgressRequest(
      progressRequests.length,
      resolution.playSessionId,
      events,
    );
    progressRequests.add(request);
    return request.future;
  }

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
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {
    transcodingStops.add(resolution);
  }

  @override
  void dispose() {}
}

PlaybackManager _manager(
  _TestBackend backend,
  _TestResolver resolver,
  _TestService service,
) => PlaybackManager()
  ..setBackend(backend)
  ..setResolver(resolver)
  ..setPlayerService(service);

void main() {
  for (final type in <String>['Movie', 'Episode']) {
    test(
      '$type background stop preserves queue and fresh-resolves position',
      () async {
        final backend = _TestBackend();
        final resolver = _TestResolver();
        final service = _TestService();
        final manager = _manager(backend, resolver, service);
        final item = <String, dynamic>{'Id': type, 'Type': type};

        try {
          await manager.playItems(<dynamic>[item]);
          backend.currentPosition = const Duration(seconds: 90);

          expect(await manager.stopForBackground(item), isTrue);
          expect(manager.queueService.currentItem, same(item));
          expect(service.stoppedResolutions, hasLength(1));
          expect(service.stoppedResolutions.single.playSessionId, 'session-1');

          await manager.startQueuedPlayback(
            startPosition: const Duration(seconds: 90),
            freshResolution: true,
          );

          expect(resolver.calls, 2);
          expect(resolver.requestedMediaSourceIds, <String?>[null, null]);
          expect(resolver.requestedStartTicks, <int?>[
            null,
            const Duration(seconds: 90).inMicroseconds * 10,
          ]);
          expect(backend.playedUrls, <String>[
            'https://example.test/session-1',
            'https://example.test/session-2',
          ]);
          expect(backend.startPositions.last, const Duration(seconds: 90));
        } finally {
          manager.dispose();
        }
      },
    );
  }

  test(
    'live TV cleanup targets old live/transcode ownership and starts fresh',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{
        'Id': 'live-channel',
        'Type': 'LiveTvChannel',
      };

      try {
        await manager.playItems(<dynamic>[item]);
        backend.currentPosition = const Duration(minutes: 20);
        expect(await manager.stopForBackground(item), isTrue);

        expect(service.stoppedResolutions.single.liveStreamId, 'live-1');
        expect(service.transcodingStops.single.playSessionId, 'session-1');

        await manager.startQueuedPlayback(freshResolution: true);
        expect(backend.startPositions.last, Duration.zero);
        expect(backend.playedUrls.last, 'https://example.test/session-2');
        expect(service.events, contains('start:session-2'));
      } finally {
        manager.dispose();
      }
    },
  );

  test('background ownership check cannot stop a replacement item', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final service = _TestService();
    final manager = _manager(backend, resolver, service);
    final oldItem = <String, dynamic>{'Id': 'old', 'Type': 'Movie'};
    final replacement = <String, dynamic>{
      'Id': 'replacement',
      'Type': 'Episode',
    };

    try {
      await manager.playItems(<dynamic>[oldItem]);
      manager.queueService.setQueue(<dynamic>[replacement]);

      expect(await manager.stopForBackground(oldItem), isFalse);
      expect(manager.queueService.currentItem, same(replacement));
      expect(service.stoppedResolutions, isEmpty);
      expect(backend.stopCalls, isZero);
    } finally {
      manager.dispose();
    }
  });

  testWidgets(
    'pending progress is discarded on stop and late progress is followed by stop',
    (tester) async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService(stallProgress: true);
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{'Id': 'overlap', 'Type': 'Movie'};

      await manager.playItems(<dynamic>[item]);
      await tester.pump(const Duration(seconds: 10));
      expect(service.progressRequests, hasLength(1));
      manager.reportVolumeState(
        volume: 60,
        isMuted: false,
        reportImmediately: true,
      );

      expect(await manager.stopForBackground(item), isTrue);
      expect(service.events.last, 'stop:session-1');

      service.progressRequests[0].completer.complete();
      await tester.pump();
      expect(service.events.takeLast(2), <String>[
        'progress:session-1:0',
        'stop:session-1',
      ]);

      await tester.pump(const Duration(seconds: 15));
      expect(service.progressRequests, hasLength(1));
      manager.dispose();
    },
  );

  testWidgets(
    'stalled progress cannot block teardown or fresh foreground resume',
    (tester) async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService(stallProgress: true);
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{'Id': 'stalled', 'Type': 'Movie'};

      await manager.playItems(<dynamic>[item]);
      await tester.pump(const Duration(seconds: 10));
      expect(service.progressRequests, hasLength(1));

      await tester.runAsync(() async {
        expect(
          await manager
              .stopForBackground(item)
              .timeout(const Duration(milliseconds: 100)),
          isTrue,
          reason: 'teardown does not await progress',
        );

        await manager
            .startQueuedPlayback(
              startPosition: const Duration(seconds: 30),
              freshResolution: true,
            )
            .timeout(const Duration(milliseconds: 100));
      });
      expect(service.events, contains('start:session-2'));
      manager.reportVolumeState(
        volume: 60,
        isMuted: false,
        reportImmediately: true,
      );
      expect(service.progressRequests, hasLength(2));
      expect(service.progressRequests.last.sessionId, 'session-2');

      service.progressRequests[0].completer.complete();
      await tester.pump();
      expect(service.events.last, 'stop:session-1');
      expect(service.stoppedResolutions.last.playSessionId, isNot('session-2'));

      // The new session's request intentionally never completes. It neither
      // blocks local work nor produces a report requiring compensation.
      manager.dispose();
    },
  );

  testWidgets('only explicit volume changes request prompt reporting', (
    tester,
  ) async {
    final service = _TestService();
    final manager = _manager(_TestBackend(), _TestResolver(), service);
    manager.reportVolumeState(
      volume: 40,
      isMuted: false,
      reportImmediately: true,
    );
    expect(service.reportedVolumes, isEmpty);
    await manager.playItems(<dynamic>[
      {'Id': 'volume', 'Type': 'Movie'},
    ]);
    manager.reportVolumeState(volume: 41, isMuted: false);
    expect(service.reportedVolumes, isEmpty);
    manager.reportVolumeState(
      volume: 42,
      isMuted: false,
      reportImmediately: true,
    );
    expect(service.reportedVolumes, [(42, false)]);
    await tester.pump();
    await tester.pump(const Duration(seconds: 5));
    expect(service.reportedVolumes, [(42, false), (42, false)]);
    manager.dispose();
  });

  for (final fail in [false, true]) {
    testWidgets(
      'volume reports coalesce behind ${fail ? 'failed' : 'delayed'} progress',
      (tester) async {
        final service = _TestService(stallProgress: true);
        final manager = _manager(_TestBackend(), _TestResolver(), service);
        await manager.playItems(<dynamic>[
          {'Id': 'volume', 'Type': 'Movie'},
        ]);
        manager.reportVolumeState(volume: 40, isMuted: false);
        await tester.pump(const Duration(seconds: 5));
        manager.reportVolumeState(
          volume: 50,
          isMuted: false,
          reportImmediately: true,
        );
        manager.reportVolumeState(
          volume: 60,
          isMuted: false,
          reportImmediately: true,
        );
        await tester.pump(const Duration(seconds: 5));
        expect(service.reportedVolumes, [(40, false)]);
        if (fail) {
          service.progressRequests.single.completer.completeError(
            StateError('offline'),
          );
        } else {
          service.progressRequests.single.completer.complete();
        }
        await tester.pump();
        expect(service.reportedVolumes, [(40, false), (60, false)]);
        manager.reportVolumeState(
          volume: 0,
          isMuted: true,
          reportImmediately: true,
        );
        service.progressRequests.last.completer.complete();
        await tester.pump();
        expect(service.reportedVolumes, [(40, false), (60, false), (0, true)]);
        service.progressRequests.last.completer.complete();
        await tester.pump();
        expect(service.progressRequests, hasLength(3));
        expect(tester.takeException(), isNull);
        manager.dispose();
      },
    );
  }

  testWidgets('disposal discards a queued volume report', (tester) async {
    final service = _TestService(stallProgress: true);
    final manager = _manager(_TestBackend(), _TestResolver(), service);
    await manager.playItems(<dynamic>[
      {'Id': 'volume', 'Type': 'Movie'},
    ]);
    manager.reportVolumeState(
      volume: 40,
      isMuted: false,
      reportImmediately: true,
    );
    manager.reportVolumeState(
      volume: 60,
      isMuted: false,
      reportImmediately: true,
    );
    manager.dispose();
    service.progressRequests.single.completer.complete();
    await tester.pump();
    expect(service.reportedVolumes, [(40, false)]);
    expect(tester.takeException(), isNull);
  });

  test('canonical user stop still clears queue and playback state', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final service = _TestService();
    final manager = _manager(backend, resolver, service);
    final item = <String, dynamic>{'Id': 'canonical', 'Type': 'Movie'};

    try {
      await manager.playItems(<dynamic>[item]);
      manager.state.setPosition(const Duration(seconds: 15));
      await manager.stop();

      expect(manager.queueService.currentItem, isNull);
      expect(manager.state.position, Duration.zero);
      expect(backend.stopCalls, 1);
      expect(service.stoppedResolutions.single.playSessionId, 'session-1');
    } finally {
      manager.dispose();
    }
  });

  test(
    'a second failure with nothing new to veto does not resolve again',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService();
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{'Id': 'audio', 'Type': 'Movie'};

      try {
        await manager.playItems(<dynamic>[item]);
        // The recovery asks for a transcode, so that is what comes back.
        resolver.playMethod = StreamPlayMethod.transcode;
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'unsupported_audio',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
        expect(resolver.requestedDirectPlay, <bool>[true, false]);

        // No codec on the stream means nothing to veto, so there is no new
        // information a third resolve could act on.
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'unsupported_audio',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
      } finally {
        manager.dispose();
      }
    },
  );

  test('unsupported audio recovers when it lands during startup', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final service = _TestService();
    final manager = _manager(backend, resolver, service);

    final gate = Completer<void>();
    backend.playGate = gate;

    try {
      final started = manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'startup', 'Type': 'Movie'},
      ]);
      await pumpEventQueue(times: 5);

      // An audio failure can land before the first play returns, a format the
      // decoder turns down on sight for one, so the recovery has to fire in
      // this window rather than wait on a startup that never finishes.
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_audio',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(resolver.requestedDirectPlay, <bool>[true, false]);

      // Lets the preempted startup unwind so the handoff runs too.
      gate.complete();
      await started;
      await pumpEventQueue(times: 10);
    } finally {
      if (!gate.isCompleted) {
        gate.complete();
      }
      manager.dispose();
    }
  });

  test('a container error during startup recovers once', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final service = _TestService();
    final manager = _manager(backend, resolver, service);

    final gate = Completer<void>();
    backend.playGate = gate;

    try {
      final started = manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'padded', 'Type': 'Movie'},
      ]);
      await pumpEventQueue(times: 5);

      // A malformed container fails in the extractor, before the first play
      // has returned, so the recovery has to fire inside that window.
      resolver.playMethod = StreamPlayMethod.transcode;
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_container',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(resolver.requestedDirectPlay, <bool>[true, false]);

      // Already transcoding, so a repeat has nowhere further to go.
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_container',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);

      gate.complete();
      await started;
      await pumpEventQueue(times: 10);
    } finally {
      if (!gate.isCompleted) {
        gate.complete();
      }
      manager.dispose();
    }
  });

  test('the veto chain runs after a transcode recovery', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver()
      ..mediaStreams = <Map<String, dynamic>>[
        <String, dynamic>{'Type': 'Audio', 'Codec': 'eac3', 'IsDefault': true},
      ];
    final service = _TestService();
    final manager = _manager(backend, resolver, service);

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'chain', 'Type': 'Movie'},
      ]);

      // The server answers the transcode request with a different codec the
      // device turns out not to decode either.
      resolver
        ..playMethod = StreamPlayMethod.transcode
        ..mediaStreams = <Map<String, dynamic>>[
          <String, dynamic>{'Type': 'Audio', 'Codec': 'ac3', 'IsDefault': true},
        ];
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_audio',
      });
      await pumpEventQueue(times: 10);
      expect(resolver.calls, 2);
      expect(resolver.requestedDirectPlay, <bool>[true, false]);

      // A second codec vetoed is new information, so it earns one more
      // resolve rather than a dead stop.
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_audio',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 3);
    } finally {
      manager.dispose();
    }
  });

  test('audio offload retry does not trigger server recovery', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final service = _TestService();
    final manager = _manager(backend, resolver, service);
    final item = <String, dynamic>{'Id': 'offload', 'Type': 'Movie'};

    try {
      await manager.playItems(<dynamic>[item]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_audio',
        'audioOffloadRetryTriggered': true,
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 1);
      expect(manager.bringupState.phase, isNot(PlaybackBringupPhase.failed));
    } finally {
      manager.dispose();
    }
  });

  test('local media audio failure is surfaced without re-resolving', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver()..isLocalMedia = true;
    final service = _TestService();
    final manager = _manager(backend, resolver, service);
    final item = <String, dynamic>{'Id': 'local', 'Type': 'Movie'};

    try {
      await manager.playItems(<dynamic>[item]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_audio',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 1);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
    } finally {
      manager.dispose();
    }
  });

  test(
    'video decoder startup failure immediately forces one server transcode',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'decoder-failure', 'Type': 'Movie'},
        ]);
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
          'decoderFailureEventId': 'initial-pair',
        });
        // The backend contract pairs the typed event with one generic event.
        backend.emitError(<String, dynamic>{
          'event': 'error',
          'decoderFailureEventId': 'initial-pair',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
        expect(resolver.requestedDirectPlay, <bool>[true, false]);
        expect(resolver.requestedDirectStream, <bool>[true, false]);
        expect(manager.bringupState.phase, isNot(PlaybackBringupPhase.failed));

        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
          'decoderFailureEventId': 'repeated-after-fallback',
        });
        backend.emitError(<String, dynamic>{
          'event': 'error',
          'decoderFailureEventId': 'repeated-after-fallback',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        manager.dispose();
      }
    },
  );

  test('direct-played decoder failure goes straight to a transcode', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver()..playMethod = StreamPlayMethod.directPlay;
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'direct-decoder-failure', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'direct-pair',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(resolver.requestedDirectPlay, <bool>[true, false]);
      expect(resolver.requestedDirectStream, <bool>[true, false]);
    } finally {
      manager.dispose();
    }
  });

  test('old player decoder failure during a re-resolve stop is dropped',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'bitrate-switch', 'Type': 'Movie'},
      ]);
      backend.onStop = () {
        backend.onStop = null;
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
          'decoderFailureEventId': 'dying-player',
        });
      };
      await manager.changeBitrate(null);
      await pumpEventQueue(times: 10);

      // The bitrate change's own resolve only; no decoder fallback after it.
      expect(resolver.calls, 2);
      expect(resolver.requestedDirectPlay, <bool>[true, true]);
      expect(manager.bringupState.phase, isNot(PlaybackBringupPhase.failed));
    } finally {
      manager.dispose();
    }
  });

  test('decoder failure does not loop an existing transcode', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver()..playMethod = StreamPlayMethod.transcode;
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'already-transcoded', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'transcode-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'transcode-pair',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 1);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
    } finally {
      manager.dispose();
    }
  });

  test('typed-only decoder event does not suppress a later generic error',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'typed-only', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'typed-only-id',
      });
      await pumpEventQueue(times: 10);
      expect(resolver.calls, 2);

      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'unrelated-error-id',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
    } finally {
      manager.dispose();
    }
  });

  test('replacement decoder failure is surfaced without a second fallback',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());
    final replacementPlayGate = Completer<void>();
    backend.onPlay = (playCount) {
      if (playCount != 2) return;
      backend.playGate = replacementPlayGate;
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'next-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'next-pair',
      });
    };

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'replacement-fails', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'replacement-initial-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'replacement-initial-pair',
      });
      await pumpEventQueue(times: 10);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      replacementPlayGate.complete();
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
    } finally {
      if (!replacementPlayGate.isCompleted) replacementPlayGate.complete();
      manager.dispose();
    }
  });

  test('a failed replacement play does not recursively request another route',
      () async {
    final backend = _TestBackend()..throwOnPlayCount = 2;
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'replacement-play-throws', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'throwing-replacement-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'throwing-replacement-pair',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
    } finally {
      manager.dispose();
    }
  });

  test('next item keeps its initial direct-play route after decoder fallback',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'first', 'Type': 'Movie'},
        <String, dynamic>{'Id': 'healthy-next', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'replacement-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'replacement-pair',
      });
      await pumpEventQueue(times: 10);

      await manager.next();

      expect(resolver.calls, 3);
      expect(resolver.requestedDirectPlay, <bool>[true, false, true]);
      expect(resolver.requestedDirectStream, <bool>[true, false, true]);

      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'healthy-next-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'healthy-next-pair',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 4);
      expect(resolver.requestedDirectPlay, <bool>[true, false, true, false]);
      expect(resolver.requestedDirectStream, <bool>[true, false, true, false]);
    } finally {
      manager.dispose();
    }
  });

  test(
    'decoder failure on local media is surfaced without re-resolving',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver()..isLocalMedia = true;
      final manager = _manager(backend, resolver, _TestService());

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'local-decoder-failure', 'Type': 'Movie'},
        ]);
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
          'decoderFailureEventId': 'live-pair',
        });
        backend.emitError(<String, dynamic>{
          'event': 'error',
          'decoderFailureEventId': 'live-pair',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 1);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        manager.dispose();
      }
    },
  );

  test(
    'decoder failure on offline media is surfaced without server resolve',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());

      try {
        await manager.playOffline('file:///offline/movie.mkv');
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        backend.emitError(<String, dynamic>{'event': 'error'});
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 0);
        expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      } finally {
        manager.dispose();
      }
    },
  );

  test('source change while decoder fallback resolves cannot retune old item',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());
    final resolveGate = Completer<void>();

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'failed-source', 'Type': 'Movie'},
      ]);
      resolver.resolveGate = resolveGate;
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
      });
      await pumpEventQueue(times: 4);
      expect(resolver.calls, 2);

      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'new-source', 'Type': 'Movie'},
      ]);
      resolveGate.complete();
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 3);
      expect(backend.playedUrls, <String>[
        'https://example.test/session-1',
        'https://example.test/session-3',
      ]);
    } finally {
      if (!resolveGate.isCompleted) resolveGate.complete();
      manager.dispose();
    }
  });

  test('queued decoder fallback is canceled when manual next advances source',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());
    final resolveGate = Completer<void>();

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'queued-fallback-source', 'Type': 'Movie'},
        <String, dynamic>{'Id': 'manual-next-source', 'Type': 'Movie'},
      ]);
      resolver.resolveGate = resolveGate;
      final existingReResolve = manager.changeBitrate(8);
      await pumpEventQueue(times: 4);
      expect(resolver.calls, 2);

      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'queued-decoder-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'queued-decoder-pair',
      });
      await pumpEventQueue(times: 4);

      await manager.nextInQueue();
      resolveGate.complete();
      await existingReResolve;
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 3);
      expect(backend.playedUrls, <String>[
        'https://example.test/session-1',
        'https://example.test/session-3',
      ]);
    } finally {
      if (!resolveGate.isCompleted) resolveGate.complete();
      manager.dispose();
    }
  });

  test('viewer pause during decoder fallback is preserved after resolve',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());
    final resolveGate = Completer<void>();

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'paused-source', 'Type': 'Movie'},
      ]);
      resolver.resolveGate = resolveGate;
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
      });
      await pumpEventQueue(times: 4);
      await manager.pause();
      resolveGate.complete();
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 2);
      expect(backend.playing, isFalse);
      expect(manager.viewerPaused, isTrue);
    } finally {
      if (!resolveGate.isCompleted) resolveGate.complete();
      manager.dispose();
    }
  });

  test(
    'paused initial start remains paused through pre-ready decoder recovery',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final initialOpenGate = Completer<void>();
      final replacementResolveGate = Completer<void>();
      final replacementOpenGate = Completer<void>();
      final initialPlayStarted = Completer<void>();
      final replacementPlayStarted = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 1) {
          backend.playGate = initialOpenGate;
          initialPlayStarted.complete();
        } else if (playCount == 2) {
          backend.playGate = replacementOpenGate;
          replacementPlayStarted.complete();
        }
      };

      try {
        final initialStart = manager.playItems(
          <dynamic>[<String, dynamic>{'Id': 'paused-start', 'Type': 'Movie'}],
          autoPlay: false,
        );
        await initialPlayStarted.future;

        resolver.resolveGate = replacementResolveGate;
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        expect(resolver.calls, 2);

        // Let the retired initial open finish while replacement resolution is
        // still held, then release and hold the replacement backend open.
        initialOpenGate.complete();
        await initialStart;
        replacementResolveGate.complete();
        await replacementPlayStarted.future;
        expect(backend.playedPayloads.last['autoPlay'], isFalse);

        replacementOpenGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isFalse);
        expect(manager.viewerPaused, isTrue);
      } finally {
        if (!initialOpenGate.isCompleted) initialOpenGate.complete();
        if (!replacementResolveGate.isCompleted) {
          replacementResolveGate.complete();
        }
        if (!replacementOpenGate.isCompleted) replacementOpenGate.complete();
        await pumpEventQueue(times: 12);
        manager.dispose();
      }
    },
  );

  test(
    'viewer resume during paused initial recovery updates replacement intent',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final initialOpenGate = Completer<void>();
      final replacementResolveGate = Completer<void>();
      final replacementOpenGate = Completer<void>();
      final initialPlayStarted = Completer<void>();
      final replacementPlayStarted = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 1) {
          backend.playGate = initialOpenGate;
          initialPlayStarted.complete();
        } else if (playCount == 2) {
          backend.playGate = replacementOpenGate;
          replacementPlayStarted.complete();
        }
      };

      try {
        final initialStart = manager.playItems(
          <dynamic>[
            <String, dynamic>{'Id': 'resume-paused-start', 'Type': 'Movie'},
          ],
          autoPlay: false,
        );
        await initialPlayStarted.future;
        resolver.resolveGate = replacementResolveGate;
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        expect(resolver.calls, 2);

        initialOpenGate.complete();
        await initialStart;
        await manager.resume();
        replacementResolveGate.complete();
        await replacementPlayStarted.future;
        expect(backend.playedPayloads.last['autoPlay'], isTrue);

        replacementOpenGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isTrue);
        expect(manager.viewerPaused, isFalse);
      } finally {
        if (!initialOpenGate.isCompleted) initialOpenGate.complete();
        if (!replacementResolveGate.isCompleted) {
          replacementResolveGate.complete();
        }
        if (!replacementOpenGate.isCompleted) replacementOpenGate.complete();
        await pumpEventQueue(times: 12);
        manager.dispose();
      }
    },
  );

  test(
    'pause after resuming paused initial recovery wins during replacement open',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final initialOpenGate = Completer<void>();
      final replacementResolveGate = Completer<void>();
      final replacementOpenGate = Completer<void>();
      final initialPlayStarted = Completer<void>();
      final replacementPlayStarted = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 1) {
          backend.playGate = initialOpenGate;
          initialPlayStarted.complete();
        } else if (playCount == 2) {
          backend.playGate = replacementOpenGate;
          replacementPlayStarted.complete();
        }
      };

      try {
        final initialStart = manager.playItems(
          <dynamic>[
            <String, dynamic>{'Id': 'resume-pause-start', 'Type': 'Movie'},
          ],
          autoPlay: false,
        );
        await initialPlayStarted.future;
        resolver.resolveGate = replacementResolveGate;
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        expect(resolver.calls, 2);

        initialOpenGate.complete();
        await initialStart;
        await manager.resume();
        replacementResolveGate.complete();
        await replacementPlayStarted.future;
        expect(backend.playedPayloads.last['autoPlay'], isTrue);

        await manager.pause();
        replacementOpenGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isFalse);
        expect(manager.viewerPaused, isTrue);
      } finally {
        if (!initialOpenGate.isCompleted) initialOpenGate.complete();
        if (!replacementResolveGate.isCompleted) {
          replacementResolveGate.complete();
        }
        if (!replacementOpenGate.isCompleted) replacementOpenGate.complete();
        await pumpEventQueue(times: 12);
        manager.dispose();
      }
    },
  );

  test(
    'viewer pause during replacement opening is reconciled after open',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final openGate = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 2) backend.playGate = openGate;
      };

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'pause-while-opening', 'Type': 'Movie'},
        ]);
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        expect(backend.playedPayloads, hasLength(2));

        await manager.pause();
        expect(manager.viewerPaused, isTrue);
        openGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isFalse);
        expect(manager.viewerPaused, isTrue);
      } finally {
        if (!openGate.isCompleted) openGate.complete();
        manager.dispose();
      }
    },
  );

  test(
    'resume during paused decoder replacement survives captured autoplay',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final openGate = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 2) backend.playGate = openGate;
      };

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'resume-while-opening', 'Type': 'Movie'},
        ]);
        await manager.pause();
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        expect(backend.playedPayloads.last['autoPlay'], isFalse);

        await manager.resume();
        expect(manager.viewerPaused, isFalse);
        openGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isTrue);
        expect(manager.viewerPaused, isFalse);
      } finally {
        if (!openGate.isCompleted) openGate.complete();
        manager.dispose();
      }
    },
  );

  test(
    'pause during awaited resume reconciliation remains the final intent',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final openGate = Completer<void>();
      final resumeGate = Completer<void>();
      final resumeStarted = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 2) backend.playGate = openGate;
      };

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'pause-during-reconcile', 'Type': 'Movie'},
        ]);
        await manager.pause();
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        await manager.resume();
        backend
          ..resumeGate = resumeGate
          ..resumeStarted = resumeStarted;
        openGate.complete();
        await resumeStarted.future;

        await manager.pause();
        resumeGate.complete();
        await pumpEventQueue(times: 12);

        expect(backend.playing, isFalse);
        expect(manager.viewerPaused, isTrue);
      } finally {
        if (!openGate.isCompleted) openGate.complete();
        if (!resumeGate.isCompleted) resumeGate.complete();
        manager.dispose();
      }
    },
  );

  test(
    'source replacement during intent reconciliation retires old startup',
    () async {
      final backend = _TestBackend()..applyCapturedAutoPlayAfterOpen = true;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());
      final openGate = Completer<void>();
      final reconcileGate = Completer<void>();
      final reconcileStarted = Completer<void>();
      backend.onPlay = (playCount) {
        if (playCount == 2) backend.playGate = openGate;
      };

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'replaced-during-reconcile', 'Type': 'Movie'},
        ]);
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        await pumpEventQueue(times: 8);
        await manager.pause();

        backend
          ..pauseGate = reconcileGate
          ..pauseStarted = reconcileStarted;
        openGate.complete();
        await pumpEventQueue(times: 8);
        expect(reconcileStarted.isCompleted, isTrue);
        await reconcileStarted.future;

        final replacement = manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'replacement-source', 'Type': 'Movie'},
        ]);
        reconcileGate.complete();
        await replacement;
        await pumpEventQueue(times: 10);

        expect(
          backend.playedPayloads.last['url'],
          'https://example.test/session-3',
        );
        expect(manager.viewerPaused, isFalse);
        expect(backend.playing, isTrue);
      } finally {
        if (!openGate.isCompleted) openGate.complete();
        if (!reconcileGate.isCompleted) reconcileGate.complete();
        manager.dispose();
      }
    },
  );

  test('pause during audio ownership wait reaches the new backend payload',
      () async {
    final backend = _TestBackend();
    final resolver = _TestResolver();
    final manager = _manager(backend, resolver, _TestService());
    final arbiter = PlaybackArbiter();
    final blocker = _BlockingAudioOwner();
    manager.setAudioArbiter(arbiter);
    arbiter.register(blocker);

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'arbiter-pause', 'Type': 'Movie'},
      ]);
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'video_decoder_failure',
        'decoderFailureEventId': 'arbiter-pair',
      });
      backend.emitError(<String, dynamic>{
        'event': 'error',
        'decoderFailureEventId': 'arbiter-pair',
      });
      await pumpEventQueue(times: 5);
      expect(blocker.calls, 2);

      await manager.pause();
      blocker.gate.complete();
      await pumpEventQueue(times: 10);

      expect(backend.playedPayloads.last['autoPlay'], isFalse);
      expect(backend.playing, isFalse);
      expect(manager.viewerPaused, isTrue);
    } finally {
      if (!blocker.gate.isCompleted) blocker.gate.complete();
      manager.dispose();
    }
  });

  test(
    'typed decoder failure retires an in-flight generic live resume',
    () async {
      final backend = _TestBackend();
      final resumeGate = Completer<bool>();
      backend.liveEdgeGate = resumeGate;
      final resolver = _TestResolver();
      final manager = _manager(backend, resolver, _TestService());

      try {
        await manager.playItems(<dynamic>[
          <String, dynamic>{'Id': 'live-decoder-failure', 'Type': 'TvChannel'},
        ]);
        backend.emitError(<String, dynamic>{'event': 'error'});
        await pumpEventQueue(times: 3);
        expect(backend.resumeLiveEdgeCalls, 1);

        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'video_decoder_failure',
        });
        backend.emitError(<String, dynamic>{'event': 'error'});
        await pumpEventQueue(times: 10);
        resumeGate.complete(true);
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
        expect(resolver.requestedDirectPlay, <bool>[true, false]);
        expect(backend.resumeLiveEdgeCalls, 1);
      } finally {
        if (!resumeGate.isCompleted) resumeGate.complete(false);
        manager.dispose();
      }
    },
  );

  test('a transcode that can\'t show the video stops', () async {
    final backend = _TestBackend();
    final resolver = _TestResolver()..playMethod = StreamPlayMethod.transcode;
    final service = _TestService();
    final manager = _manager(backend, resolver, service);

    try {
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'vc1', 'Type': 'Movie'},
      ]);
      final stopsBefore = backend.stopCalls;
      backend.emitError(<String, dynamic>{
        'event': 'playerError',
        'recoverable': true,
        'kind': 'unsupported_video',
        'message': 'The stream has no video track the player can read',
      });
      await pumpEventQueue(times: 10);

      expect(resolver.calls, 1);
      expect(backend.stopCalls, greaterThan(stopsBefore));
      expect(manager.bringupState.phase, PlaybackBringupPhase.failed);
      expect(manager.bringupState.error, unsupportedVideoError);
    } finally {
      manager.dispose();
    }
  });

  test(
    'already-transcoded audio is retried after vetoing its selected codec',
    () async {
      final backend = _TestBackend();
      final resolver = _TestResolver()
        ..playMethod = StreamPlayMethod.transcode
        ..mediaStreams = <Map<String, dynamic>>[
          <String, dynamic>{
            'Type': 'Audio',
            'Codec': 'eac3',
            'IsDefault': true,
          },
        ];
      final service = _TestService();
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{'Id': 'transcoded', 'Type': 'Movie'};

      try {
        await manager.playItems(<dynamic>[item]);
        backend.emitError(<String, dynamic>{
          'event': 'playerError',
          'recoverable': true,
          'kind': 'unsupported_audio',
        });
        await pumpEventQueue(times: 10);

        expect(resolver.calls, 2);
        expect(resolver.requestedDirectPlay, <bool>[true, false]);
      } finally {
        manager.dispose();
      }
    },
  );
}

extension<T> on Iterable<T> {
  Iterable<T> takeLast(int count) => skip(length - count);
}
