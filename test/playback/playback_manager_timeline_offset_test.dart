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

/// Answers every resolve with a stream cut at [offset].
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
  }) async {}

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
  late _TestBackend backend;
  late _TestService service;
  late PlaybackManager manager;

  PlaybackManager managerWith(Duration offset) {
    backend = _TestBackend();
    service = _TestService();
    return PlaybackManager()
      ..setBackend(backend)
      ..setResolver(_TestResolver(offset))
      ..setPlayerService(service);
  }

  tearDown(() => manager.dispose());

  Future<void> play({Duration start = Duration.zero}) =>
      manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
      ], startPosition: start);

  group('a stream cut at 10 minutes', () {
    const offset = Duration(minutes: 10);

    setUp(() => manager = managerWith(offset));

    test('the player starts at the resume point on its own clock', () async {
      await play(start: const Duration(minutes: 10, seconds: 50));
      expect(backend.playStarts, [const Duration(seconds: 50)]);
    });

    test('positions and the duration read on the media timeline', () async {
      await play(start: const Duration(minutes: 10, seconds: 50));
      backend.emitPosition(const Duration(minutes: 1));
      expect(manager.state.position, const Duration(minutes: 11));
      expect(manager.currentPlaybackPosition, const Duration(minutes: 11));
      backend.durations.add(const Duration(minutes: 110));
      expect(manager.state.duration, const Duration(minutes: 120));
    });

    test('a seek goes to the player on its own clock', () async {
      await play(start: const Duration(minutes: 10, seconds: 50));
      await manager.seekTo(const Duration(minutes: 15));
      expect(backend.seeks.last, const Duration(minutes: 5));
      // Before the stream's start is the stream's start.
      await manager.seekTo(const Duration(minutes: 2));
      expect(backend.seeks.last, Duration.zero);
    });

    test('the stop is reported at the media position', () async {
      await play(start: const Duration(minutes: 10, seconds: 50));
      backend.emitPosition(const Duration(minutes: 1));
      await manager.stop();
      expect(service.stops, [const Duration(minutes: 11)]);
    });
  });

  group('a stream from the start of the file (Jellyfin, Emby)', () {
    setUp(() => manager = managerWith(Duration.zero));

    test('positions and seeks pass through unchanged', () async {
      await play(start: const Duration(minutes: 10, seconds: 50));
      expect(backend.playStarts, [const Duration(minutes: 10, seconds: 50)]);
      backend.emitPosition(const Duration(minutes: 11));
      expect(manager.state.position, const Duration(minutes: 11));
      await manager.seekTo(const Duration(minutes: 15));
      expect(backend.seeks.last, const Duration(minutes: 15));
    });
  });
}
