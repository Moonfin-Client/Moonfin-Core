import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A backend whose position and duration the test drives.
class _TestBackend extends Fake implements PlayerBackend {
  final positions = StreamController<Duration>.broadcast(sync: true);
  final durations = StreamController<Duration>.broadcast(sync: true);
  final List<Duration> playStarts = <Duration>[];
  final List<Duration> seeks = <Duration>[];
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
  Stream<Duration> get durationStream => durations.stream;

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
    playStarts.add(startPosition);
    currentPosition = startPosition;
    playing = true;
  }

  @override
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    currentPosition = position;
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

/// Resolves session-1, session-2 and so on, and replans when [replans]
/// allows it.
class _ReplanningResolver extends MediaStreamResolver
    implements StreamReplanner {
  bool replans = true;
  bool refuse = false;
  int resolves = 0;
  final List<ReplanRequest> requests = <ReplanRequest>[];
  final List<String?> replannedFrom = <String?>[];

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
    resolves++;
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$resolves/plan-1',
      mediaSourceId: 'source',
      playSessionId: 'session-$resolves',
      playMethod: StreamPlayMethod.directStream,
    );
  }

  @override
  bool canReplan(StreamResolutionResult current) => replans;

  @override
  Future<StreamResolutionResult> replan(
    dynamic mediaItem,
    StreamResolutionResult current,
    ReplanRequest request,
  ) async {
    requests.add(request);
    replannedFrom.add(current.streamUrl);
    if (refuse) throw StateError('session gone');
    return StreamResolutionResult(
      streamUrl: '${current.streamUrl}+${requests.length}',
      mediaSourceId: current.mediaSourceId,
      playSessionId: current.playSessionId,
      playMethod: StreamPlayMethod.transcode,
    );
  }
}

class _TestService extends Fake implements PlayerService {
  final List<String?> stops = <String?>[];
  final List<String?> killed = <String?>[];

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
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => stops.add(resolution.streamUrl);

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async =>
      killed.add(resolution.streamUrl);

  @override
  void dispose() {}
}

void main() {
  late _TestBackend backend;
  late _ReplanningResolver resolver;
  late _TestService service;
  late PlaybackManager manager;
  final played = <String>[];

  setUp(() {
    played.clear();
    backend = _TestBackend();
    resolver = _ReplanningResolver();
    service = _TestService();
    manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service);
  });

  tearDown(() => manager.dispose());

  Future<void> start() async {
    await manager.playItems(<dynamic>[
      <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
    ]);
    backend.emitPosition(const Duration(minutes: 20));
  }

  test('a track change moves the session instead of ending it', () async {
    await start();
    await manager.changeAudioTrack(3);

    expect(resolver.resolves, 1);
    expect(resolver.requests.single.reason, ReplanReason.trackChange);
    expect(resolver.requests.single.audioStreamIndex, 3);
    expect(resolver.requests.single.position, const Duration(minutes: 20));
    expect(resolver.replannedFrom, ['https://example.test/session-1/plan-1']);
    expect(service.stops, isEmpty);
    expect(service.killed, isEmpty);
    expect(
      manager.currentResolution?.streamUrl,
      'https://example.test/session-1/plan-1+1',
    );
  });

  test('a second change replans from the stream the first one gave', () async {
    await start();
    await manager.changeAudioTrack(3);
    await manager.changeSubtitleTrack(5);
    expect(
      resolver.replannedFrom.last,
      'https://example.test/session-1/plan-1+1',
    );
    expect(resolver.requests.last.subtitleStreamIndex, 5);
    expect(service.stops, isEmpty);
  });

  test('a bitrate change is a quality change', () async {
    await start();
    await manager.changeBitrate(8);
    expect(resolver.requests.single.reason, ReplanReason.qualityChange);
    expect(resolver.requests.single.maxStreamingBitrate, 8000000);
    expect(service.stops, isEmpty);
  });

  test('a refused replan ends the session and resolves afresh', () async {
    await start();
    resolver.refuse = true;
    await manager.changeAudioTrack(3);
    expect(resolver.requests, hasLength(1));
    expect(resolver.resolves, 2);
    expect(service.stops, ['https://example.test/session-1/plan-1']);
    expect(
      manager.currentResolution?.streamUrl,
      'https://example.test/session-2/plan-1',
    );
  });

  test(
    'a session the resolver can\'t replan is stopped and resolved',
    () async {
      await start();
      resolver.replans = false;
      await manager.changeAudioTrack(3);
      expect(resolver.requests, isEmpty);
      expect(resolver.resolves, 2);
      expect(service.stops, ['https://example.test/session-1/plan-1']);
    },
  );
}
