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

/// A server that plans remuxes: every stream seeks through it, and each
/// replan cuts the new stream 2 s before the position asked for.
class _RemuxResolver extends MediaStreamResolver implements StreamReplanner {
  final List<ReplanRequest> requests = <ReplanRequest>[];
  int resolves = 0;
  Completer<void>? gate;
  Object? refusal;

  StreamResolutionResult _cut(Duration at, String name) =>
      StreamResolutionResult(
        streamUrl: 'https://example.test/$name',
        mediaSourceId: 'source',
        playSessionId: 'session',
        playMethod: StreamPlayMethod.directStream,
        timelineOffset: at > const Duration(seconds: 2)
            ? at - const Duration(seconds: 2)
            : Duration.zero,
        seeksThroughServer: true,
        reopenAfterPause: const Duration(minutes: 1),
      );

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
    return _cut(
      Duration(microseconds: (startTimeTicks ?? 0) ~/ 10),
      'start-$resolves',
    );
  }

  @override
  bool canReplan(StreamResolutionResult current) => true;

  @override
  Future<StreamResolutionResult> replan(
    dynamic mediaItem,
    StreamResolutionResult current,
    ReplanRequest request,
  ) async {
    requests.add(request);
    final wait = gate;
    if (wait != null) await wait.future;
    final error = refusal;
    if (error != null) throw error;
    return _cut(request.position, 'replan-${requests.length}');
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
  late _RemuxResolver resolver;
  late _TestService service;
  late PlaybackManager manager;
  var now = DateTime.utc(2026, 10, 17, 12);

  setUp(() {
    backend = _TestBackend();
    resolver = _RemuxResolver();
    service = _TestService();
    manager = PlaybackManager()
      ..clock = (() => now)
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(service);
  });

  tearDown(() => manager.dispose());

  Future<void> start() => manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
  ], startPosition: const Duration(minutes: 10));

  test('a seek is served by the server, at the position', () async {
    await start();
    await manager.seekTo(const Duration(minutes: 30));
    expect(resolver.requests.single.reason, ReplanReason.seek);
    expect(resolver.requests.single.position, const Duration(minutes: 30));
    // The player never seeks a stream it can't. It opens the new one 2 s
    // in, which is 30:00 on the film.
    expect(backend.seeks, isEmpty);
    expect(backend.playStarts.last, const Duration(seconds: 2));
    expect(
      manager.currentResolution?.streamUrl,
      'https://example.test/replan-1',
    );
    expect(service.stops, isEmpty);
  });

  test('a scrub is one replan per settled target', () async {
    await start();
    resolver.gate = Completer<void>();
    final first = manager.seekTo(const Duration(minutes: 20));
    await Future<void>.delayed(Duration.zero);
    unawaited(manager.seekTo(const Duration(minutes: 21)));
    unawaited(manager.seekTo(const Duration(minutes: 22)));
    resolver.gate!.complete();
    resolver.gate = null;
    await first;
    expect(resolver.requests.map((r) => r.position), [
      const Duration(minutes: 20),
      const Duration(minutes: 22),
    ]);
  });

  test('a stream that seeks itself is seeked by the player', () async {
    resolver = _RemuxResolver();
    manager.setResolver(_PlainResolver());
    await start();
    await manager.seekTo(const Duration(minutes: 30));
    expect(backend.seeks.single, const Duration(minutes: 30));
  });

  test('a long pause resumes on a stream opened again', () async {
    await start();
    backend.emitPosition(const Duration(seconds: 3));
    await manager.pause();
    now = now.add(const Duration(minutes: 2));
    await manager.resume();
    expect(resolver.requests.single.reason, ReplanReason.seek);
    // Where it was: 10:01 on the film (the stream was cut at 9:58).
    expect(
      resolver.requests.single.position,
      const Duration(minutes: 10, seconds: 1),
    );
    expect(backend.playing, isTrue);
  });

  test('a short pause just resumes', () async {
    await start();
    await manager.pause();
    now = now.add(const Duration(seconds: 30));
    await manager.resume();
    expect(resolver.requests, isEmpty);
    expect(backend.playing, isTrue);
  });

  test(
    'a server that refuses the replan is not asked to start again',
    () async {
      await start();
      resolver.refusal = const PlaybackRefusedException('Ended on the server');
      await expectLater(
        manager.seekTo(const Duration(minutes: 30)),
        throwsA(isA<PlaybackRefusedException>()),
      );
      expect(resolver.resolves, 1);
      expect(manager.bringupState.error, 'Ended on the server');
    },
  );
}

class _PlainResolver extends MediaStreamResolver {
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
  }) async => const StreamResolutionResult(
    streamUrl: 'https://example.test/file',
    mediaSourceId: 'source',
    playMethod: StreamPlayMethod.directPlay,
  );
}
