import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  final List<String> playedUrls = <String>[];
  final List<Duration> startPositions = <Duration>[];
  int stopCalls = 0;
  bool playing = false;
  Duration currentPosition = Duration.zero;

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
  Stream<Map<String, dynamic>>? get errorStream => null;

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
    playedUrls.add((mediaItem as Map<String, dynamic>)['url'] as String);
    startPositions.add(startPosition);
    currentPosition = startPosition;
    playing = true;
  }

  @override
  Future<void> stop() async {
    stopCalls++;
    playing = false;
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  Future<void> setRepeatMode(RepeatMode mode) async {}

  @override
  void dispose() {}
}

class _TestResolver extends MediaStreamResolver {
  int calls = 0;
  final List<String?> requestedMediaSourceIds = <String?>[];
  final List<int?> requestedStartTicks = <int?>[];

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
    requestedMediaSourceIds.add(mediaSourceId);
    requestedStartTicks.add(startTimeTicks);
    final type = (mediaItem as Map<String, dynamic>)['Type'];
    final isLive = type == 'TvChannel' || type == 'LiveTvChannel';
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$calls',
      mediaSourceId: 'source-$calls',
      liveStreamId: isLive ? 'live-$calls' : null,
      playSessionId: 'session-$calls',
      playMethod: StreamPlayMethod.directStream,
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

class _TestService implements PlayerService {
  _TestService({this.stallProgress = false});

  final bool stallProgress;
  final List<String> events = <String>[];
  final List<_ProgressRequest> progressRequests = <_ProgressRequest>[];
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
  }) {
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
    Duration position,
  ) async {
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
    'older overlapping progress completing last is followed by old stop',
    (tester) async {
      final backend = _TestBackend();
      final resolver = _TestResolver();
      final service = _TestService(stallProgress: true);
      final manager = _manager(backend, resolver, service);
      final item = <String, dynamic>{'Id': 'overlap', 'Type': 'Movie'};

      await manager.playItems(<dynamic>[item]);
      await tester.pump(const Duration(seconds: 10));
      expect(service.progressRequests, hasLength(2));

      expect(await manager.stopForBackground(item), isTrue);
      expect(service.events.last, 'stop:session-1');

      service.progressRequests[1].completer.complete();
      await tester.pump();
      expect(service.events.takeLast(2), <String>[
        'progress:session-1:1',
        'stop:session-1',
      ]);

      service.progressRequests[0].completer.complete();
      await tester.pump();
      expect(service.events.takeLast(2), <String>[
        'progress:session-1:0',
        'stop:session-1',
      ]);

      await tester.pump(const Duration(seconds: 15));
      expect(service.progressRequests, hasLength(2));
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
      expect(service.progressRequests, hasLength(2));

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

      service.progressRequests[1].completer.complete();
      await tester.pump();
      expect(service.events.last, 'stop:session-1');
      expect(service.stoppedResolutions.last.playSessionId, isNot('session-2'));

      // Request zero intentionally never completes. It neither blocks local
      // work nor produces a server progress update requiring compensation.
      manager.dispose();
    },
  );

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
}

extension<T> on Iterable<T> {
  Iterable<T> takeLast(int count) => skip(length - count);
}
