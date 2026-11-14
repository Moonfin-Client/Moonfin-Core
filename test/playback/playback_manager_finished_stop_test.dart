import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

import 'package:moonfin/data/models/aggregated_item.dart';

/// A backend whose position and duration the test drives.
class _TestBackend extends Fake implements PlayerBackend {
  final positions = StreamController<Duration>.broadcast(sync: true);
  bool playing = false;
  Duration currentPosition = Duration.zero;
  Duration currentDuration = Duration.zero;

  void emitPosition(Duration position) {
    currentPosition = position;
    positions.add(position);
  }

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration => currentDuration;

  @override
  Duration get buffer => Duration.zero;

  @override
  bool get isPlaying => playing;

  @override
  bool get playWhenReady => playing;

  @override
  double get playbackSpeed => 1.0;

  @override
  bool get isBuffering => false;

  @override
  Stream<Duration> get positionStream => positions.stream;

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
  bool get supportsDirectPlayAudioSwitch => false;

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
    currentPosition = startPosition;
    playing = true;
  }

  @override
  Future<void> pause() async => playing = false;

  @override
  Future<void> resume() async => playing = true;

  @override
  Future<void> stop() async => playing = false;

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  Future<void> waitForTracksReady() async {}

  @override
  void dispose() {}
}

/// Answers every resolve with the item's `source`, its stream cut at
/// [offset].
class _TestResolver extends MediaStreamResolver {
  _TestResolver(this.offset);

  final Duration offset;

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
  }) async => StreamResolutionResult(
    streamUrl: 'https://example.test/stream',
    mediaSourceId: 'source',
    playSessionId: 'session',
    playMethod: StreamPlayMethod.directStream,
    timelineOffset: offset,
  );
}

class _TestService extends Fake implements PlayerService {
  _TestService({this.holdProgress = false});

  /// Keeps each progress report in flight until the test completes it, like
  /// a slow server.
  final bool holdProgress;
  final List<Completer<void>> progressRequests = <Completer<void>>[];
  final List<Duration> stops = <Duration>[];

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

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
    if (!holdProgress) return Future<void>.value();
    final request = Completer<void>();
    progressRequests.add(request);
    return request.future;
  }

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => stops.add(position);

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

void main() {
  // An episode of 23:50 whose credits start at 20:29: a stop there is a
  // resume point to the server, which keeps one between 5% and 90%.
  const credits = Duration(minutes: 20, seconds: 29);
  const end = Duration(minutes: 23, seconds: 50);

  late _TestBackend backend;
  late _TestService service;
  late PlaybackManager manager;

  PlaybackManager managerWith({
    Duration offset = Duration.zero,
    bool holdProgress = false,
  }) {
    backend = _TestBackend();
    service = _TestService(holdProgress: holdProgress);
    return PlaybackManager()
      ..setBackend(backend)
      ..setResolver(_TestResolver(offset))
      ..setPlayerService(service);
  }

  tearDown(() => manager.dispose());

  Future<void> playEpisode() => manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'episode', 'Type': 'Episode'},
  ]);

  test('a finished stop reports the end of the item', () async {
    manager = managerWith();
    await playEpisode();
    backend.currentDuration = end;
    backend.emitPosition(credits);
    await manager.stopAsFinished();
    expect(service.stops, [end]);
  });

  test('the runtime the server knows wins over the player duration', () async {
    manager = managerWith();
    await manager.playItems(<dynamic>[
      AggregatedItem(
        id: 'episode',
        serverId: 'server',
        rawData: {
          'Id': 'episode',
          'Type': 'Episode',
          'MediaSources': [
            {'Id': 'source', 'RunTimeTicks': end.inMicroseconds * 10},
          ],
        },
      ),
    ]);
    backend.currentDuration = end - const Duration(seconds: 1);
    backend.emitPosition(credits);
    await manager.stopAsFinished();
    expect(service.stops, [end]);
  });

  test('a stream cut at 10 minutes ends on the media timeline', () async {
    manager = managerWith(offset: const Duration(minutes: 10));
    await playEpisode();
    backend.currentDuration = const Duration(minutes: 110);
    backend.emitPosition(const Duration(minutes: 90));
    await manager.stopAsFinished();
    expect(service.stops, [const Duration(minutes: 120)]);
  });

  test('with no duration known the stop stays where playback is', () async {
    manager = managerWith();
    await playEpisode();
    backend.emitPosition(credits);
    await manager.stopAsFinished();
    expect(service.stops, [credits]);
  });

  testWidgets('a stop sent again after a late progress keeps the end', (
    tester,
  ) async {
    manager = managerWith(holdProgress: true);
    await playEpisode();
    backend.currentDuration = end;
    backend.emitPosition(credits);
    await tester.pump(const Duration(seconds: 5));
    expect(service.progressRequests, hasLength(1));

    await manager.stopAsFinished();
    service.progressRequests.single.complete();
    await tester.pump();

    // The progress may reach the server after the stop, so the stop goes
    // again, and it too says the item was played to the end.
    expect(service.stops, [end, end]);
  });

  test('nextInQueueAsFinished reports the end of the current item', () async {
    manager = managerWith();
    await manager.playItems(<dynamic>[
      <String, dynamic>{'Id': 'episode1', 'Type': 'Episode'},
      <String, dynamic>{'Id': 'episode2', 'Type': 'Episode'},
    ]);
    backend.currentDuration = end;
    backend.emitPosition(credits);

    await manager.nextInQueueAsFinished();

    expect(service.stops, [end]);
    expect(manager.queueService.currentIndex, 1);
  });

  test(
    'nextInQueueAsFinished dispatches TransportAction.nextAsFinished and leaves unrelated playItems unfinished',
    () async {
      manager = managerWith();
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode1', 'Type': 'Episode'},
        <String, dynamic>{'Id': 'episode2', 'Type': 'Episode'},
      ]);
      backend.currentDuration = end;
      backend.emitPosition(credits);

      final seenActions = <TransportAction>[];
      manager.setTransportInterceptor((action, {position}) async {
        seenActions.add(action);
        // Simulate a coordinator (Watch Party / Cast) that swallows next.
        return action == TransportAction.nextAsFinished;
      });

      await manager.nextInQueueAsFinished();
      expect(seenActions, [TransportAction.nextAsFinished]);
      expect(service.stops, isEmpty);

      // An unrelated item switch afterwards must still report the outgoing
      // position rather than consuming a stale finished flag.
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode3', 'Type': 'Episode'},
      ]);
      expect(service.stops, [credits]);
    },
  );

  test(
    'playItems with stopCurrentAsFinished reports the end of the outgoing item',
    () async {
      manager = managerWith();
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode1', 'Type': 'Episode'},
      ]);
      backend.currentDuration = end;
      backend.emitPosition(credits);

      final finishedItems = <dynamic>[];
      final sub = manager.finishedItemStopStream.listen(finishedItems.add);
      addTearDown(sub.cancel);

      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode2', 'Type': 'Episode'},
      ], stopCurrentAsFinished: true);
      expect(service.stops, [end]);
      expect(finishedItems.map((e) => e['Id']), ['episode1']);
    },
  );

  test(
    'finishedItemStopStream emits on committed finish and stays silent when intercepted',
    () async {
      manager = managerWith();
      await manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'episode1', 'Type': 'Episode'},
        <String, dynamic>{'Id': 'episode2', 'Type': 'Episode'},
      ]);
      backend.currentDuration = end;
      backend.emitPosition(credits);

      final finishedItems = <dynamic>[];
      final sub = manager.finishedItemStopStream.listen(finishedItems.add);
      addTearDown(sub.cancel);

      manager.setTransportInterceptor((action, {position}) async {
        return action == TransportAction.nextAsFinished;
      });
      await manager.nextInQueueAsFinished();
      expect(finishedItems, isEmpty);

      manager.setTransportInterceptor(null);
      await manager.nextInQueueAsFinished();
      expect(finishedItems.map((e) => e['Id']), ['episode1']);
    },
  );
}
