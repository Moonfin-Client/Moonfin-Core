import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A backend that plays whatever it is given.
class _TestBackend extends Fake implements PlayerBackend {
  bool playing = false;
  Duration currentPosition = Duration.zero;
  Duration currentDuration = Duration.zero;

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

/// Answers every resolve with one stream.
class _TestResolver extends MediaStreamResolver {
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
    streamUrl: 'https://example.test/stream',
    mediaSourceId: 'source',
    playSessionId: 'session',
    playMethod: StreamPlayMethod.directStream,
  );
}

/// Fails every progress report with [progressError].
class _TestService extends Fake implements PlayerService {
  _TestService(this.progressError);

  final Object progressError;
  int progressReports = 0;

  /// Keeps each report in flight until the test completes it.
  bool hold = false;
  final List<Completer<void>> held = <Completer<void>>[];
  int stops = 0;

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
  }) async {
    progressReports++;
    if (hold) {
      final request = Completer<void>();
      held.add(request);
      await request.future;
    }
    throw progressError;
  }

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => stops++;

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
  late List<String> events;
  late List<StreamSubscription<Object?>> subs;

  void managerWith(Object progressError) {
    backend = _TestBackend();
    service = _TestService(progressError);
    manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(_TestResolver())
      ..setPlayerService(service);
    events = <String>[];
    subs = [
      manager.endedByServerStream.listen((m) => events.add('ended: $m')),
      manager.sessionEndedStream.listen((_) => events.add('closed')),
    ];
  }

  tearDown(() async {
    for (final sub in subs) {
      await sub.cancel();
    }
    manager.dispose();
  });

  Future<void> playMovie() => manager.playItems(<dynamic>[
    <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
  ]);

  testWidgets('a progress the server refuses stops, says why, and closes', (
    tester,
  ) async {
    managerWith(
      const PlaybackRefusedException(
        'Ended on the server.',
        reason: 'playback_session_ended',
      ),
    );
    await playMovie();
    expect(backend.playing, isTrue);

    await tester.pump(const Duration(seconds: 5));
    await tester.pump();

    expect(service.progressReports, 1);
    expect(backend.playing, isFalse);
    expect(service.stops, 1);
    expect(events, ['ended: Ended on the server.', 'closed']);

    // Nothing reports on the ended session afterwards.
    await tester.pump(const Duration(seconds: 10));
    expect(service.progressReports, 1);
  });

  testWidgets('a report the viewer retired before it was refused closes '
      'nothing', (tester) async {
    managerWith(
      const PlaybackRefusedException(
        'Ended on the server.',
        reason: PlaybackRefusedException.sessionEndedReason,
      ),
    );
    service.hold = true;
    await playMovie();
    await tester.pump(const Duration(seconds: 5));
    expect(service.held, hasLength(1));

    // Retired by the viewer with the item still queued, as Next is before
    // the queue moves on.
    await manager.stopForBackground(manager.queueService.currentItem);
    service.held.single.complete();
    await tester.pump();

    expect(events, isEmpty);
  });

  testWidgets('another progress failure leaves playback alone', (
    tester,
  ) async {
    managerWith(StateError('offline'));
    await playMovie();

    await tester.pump(const Duration(seconds: 5));
    await tester.pump();

    expect(service.progressReports, 1);
    expect(backend.playing, isTrue);
    expect(service.stops, 0);
    expect(events, isEmpty);
    await manager.stop();
  });
}
