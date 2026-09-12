import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  final List<String> playedUrls = <String>[];
  final List<bool> autoPlayValues = <bool>[];
  int resumeCalls = 0;
  bool playing = false;
  Duration currentPosition = Duration.zero;

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration =>
      playedUrls.isEmpty ? Duration.zero : const Duration(minutes: 30);

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
  Stream<bool>? get pictureShownStream => null;

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
    final payload = mediaItem as Map<String, dynamic>;
    final autoPlay = payload['autoPlay'] != false;
    playedUrls.add(payload['url'] as String);
    autoPlayValues.add(autoPlay);
    currentPosition = startPosition;
    // The real backends load the source and only start it when asked, which
    // is the behaviour under test.
    playing = autoPlay;
  }

  @override
  Future<void> pause() async {
    playing = false;
  }

  @override
  Future<void> resume() async {
    resumeCalls++;
    playing = true;
  }

  @override
  Future<void> stop() async {
    playing = false;
  }

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  Future<void> waitForTracksReady() async {}

  @override
  void dispose() {}
}

class _TestResolver extends MediaStreamResolver {
  int calls = 0;

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
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$calls',
      mediaSourceId: 'source-$calls',
      playSessionId: 'session-$calls',
      playMethod: StreamPlayMethod.directStream,
    );
  }
}

class _TestService extends Fake implements PlayerService {
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
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position,
  ) async {}

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

void main() {
  late _TestBackend backend;
  late _TestResolver resolver;
  late PlaybackManager manager;

  setUp(() {
    backend = _TestBackend();
    resolver = _TestResolver();
    manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(resolver)
      ..setPlayerService(_TestService());
  });

  tearDown(() => manager.dispose());

  Future<void> startPlayback() async {
    await manager.playItems(<dynamic>[
      <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
    ]);
    backend.currentPosition = const Duration(seconds: 90);
  }

  test('a paused session stays paused across a re-resolve', () async {
    await startPlayback();
    await manager.pause();
    expect(backend.isPlaying, isFalse);

    await manager.changeAudioTrack(3);

    expect(resolver.calls, 2);
    expect(backend.autoPlayValues, [true, false]);
    expect(backend.resumeCalls, 0);
    expect(backend.isPlaying, isFalse);
  });

  test('a playing session keeps playing across a re-resolve', () async {
    await startPlayback();
    expect(backend.isPlaying, isTrue);

    await manager.changeAudioTrack(3);

    expect(resolver.calls, 2);
    expect(backend.autoPlayValues, [true, true]);
    expect(backend.isPlaying, isTrue);
  });
}
