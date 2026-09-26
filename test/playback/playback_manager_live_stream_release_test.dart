import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  bool playing = false;

  @override
  Duration get position => Duration.zero;

  @override
  Duration get duration => playing ? const Duration(minutes: 30) : Duration.zero;

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
    playing = true;
  }

  @override
  Future<void> stop() async {
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
  StreamPlayMethod playMethod = StreamPlayMethod.directStream;

  /// 1-based resolve calls that throw, like a server that cannot be reached.
  final Set<int> failOnCalls = <int>{};

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
    if (failOnCalls.contains(calls)) {
      throw StateError('server unreachable');
    }
    // The server gives a reopened channel the same live stream id.
    return StreamResolutionResult(
      streamUrl: 'https://example.test/session-$calls',
      mediaSourceId: 'source-1',
      liveStreamId: 'live-channel',
      playSessionId: 'session-$calls',
      playMethod: playMethod,
      mediaStreams: const [],
    );
  }
}

class _TestService implements PlayerService {
  _TestService({this.holdProgress = false});

  final bool holdProgress;
  final List<Completer<void>> progressRequests = <Completer<void>>[];
  final List<String> stops = <String>[];

  /// Every time the server is asked to give a live stream back, with the
  /// session that asked.
  final List<String> releases = <String>[];

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
  }) async {
    stops.add(resolution.playSessionId!);
    if (releaseLiveStream && resolution.liveStreamId != null) {
      releases.add(resolution.playSessionId!);
    }
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) async {
    releases.add('direct:$liveStreamId');
  }

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

const _channel = <String, dynamic>{'Id': 'channel-1', 'Type': 'TvChannel'};

PlaybackManager _manager(
  _TestBackend backend,
  _TestResolver resolver,
  _TestService service,
) => PlaybackManager()
  ..setBackend(backend)
  ..setResolver(resolver)
  ..setPlayerService(service);

void main() {
  testWidgets(
    'a stop re-sent after a late progress report keeps the live stream',
    (tester) async {
      final service = _TestService(holdProgress: true);
      final manager = _manager(_TestBackend(), _TestResolver(), service);

      await manager.playItems(<dynamic>[_channel]);
      await tester.pump(const Duration(seconds: 5));
      expect(service.progressRequests, hasLength(1));

      expect(await manager.stopForBackground(_channel), isTrue);
      service.progressRequests.single.complete();
      await tester.pump();

      // The stop is reported again so the late progress is not the server's
      // last word, but a shared stream would count a second close as another
      // viewer leaving.
      expect(service.stops, <String>['session-1', 'session-1']);
      expect(service.releases, <String>['session-1']);
      manager.dispose();
    },
  );

  testWidgets(
    'a direct-played channel closed at start is not closed again on stop',
    (tester) async {
      final resolver = _TestResolver()..playMethod = StreamPlayMethod.directPlay;
      final service = _TestService();
      final manager = _manager(_TestBackend(), resolver, service);

      await manager.playItems(<dynamic>[_channel]);
      await tester.pump();
      expect(service.releases, <String>['direct:live-channel']);

      await manager.stop();
      await tester.pump();

      expect(service.stops, <String>['session-1']);
      expect(service.releases, <String>['direct:live-channel']);
      manager.dispose();
    },
  );

  testWidgets(
    'a session left current by a failed re-resolve makes one release attempt',
    (tester) async {
      final resolver = _TestResolver()..failOnCalls.add(2);
      final service = _TestService();
      final manager = _manager(_TestBackend(), resolver, service);

      await manager.playItems(<dynamic>[_channel]);
      await tester.pump();

      try {
        await manager.changeBitrate(8);
      } catch (_) {}
      await tester.pump();
      await manager.changeBitrate(null);
      await tester.pump();

      // Both re-resolves stop session-1, since the failed one never replaced
      // it, but only the first attempts to release its stream.
      expect(
        service.stops.where((s) => s == 'session-1'),
        hasLength(2),
      );
      expect(service.releases, <String>['session-1']);
      manager.dispose();
    },
  );
}
