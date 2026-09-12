import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

/// A backend whose error stream the test drives, standing in for a Media3
/// player that keeps talking after it was stopped.
class _ErrorBackend extends Fake implements PlayerBackend {
  final _errors = StreamController<Map<String, dynamic>>.broadcast();
  bool playing = false;

  void emit(Map<String, dynamic> payload) => _errors.add(payload);

  @override
  Duration get position => Duration.zero;

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
  Stream<bool>? get pictureShownStream => null;

  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();

  @override
  Stream<Map<String, dynamic>>? get errorStream => _errors.stream;

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

  @override
  void dispose() {
    _errors.close();
  }
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
      playMethod: StreamPlayMethod.directPlay,
    );
  }
}

class _TestService implements PlayerService {
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

class _Harness {
  _Harness() {
    manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(_TestResolver())
      ..setPlayerService(_TestService())
      ..setDiagnosticLogger(notes.add);
    _states = manager.bringupStateStream.listen(phases.add);
  }

  final backend = _ErrorBackend();
  late final PlaybackManager manager;
  final List<PlaybackBringupState> phases = <PlaybackBringupState>[];
  final List<String> notes = <String>[];
  late final StreamSubscription<PlaybackBringupState> _states;

  bool get sawFailure =>
      phases.any((state) => state.phase == PlaybackBringupPhase.failed);

  Future<void> dispose() async {
    await _states.cancel();
    manager.dispose();
  }
}

final _item = <String, dynamic>{'Id': 'movie', 'Type': 'Movie'};

const _lateError = <String, dynamic>{
  'event': 'error',
  'errorCode': 1000,
  'message': 'Unexpected runtime error',
};

void main() {
  test('a backend error after stop does not fail a bring-up that is over', () async {
    final h = _Harness();
    try {
      await h.manager.playItems(<dynamic>[_item]);
      await h.manager.stop();
      h.phases.clear();

      h.backend.emit(_lateError);
      await pumpEventQueue();

      expect(h.manager.bringupState.phase, PlaybackBringupPhase.idle);
      expect(h.sawFailure, isFalse);
      expect(h.notes, hasLength(1));
      expect(h.notes.single, contains('Dropped a late error'));
      expect(h.notes.single, contains('Unexpected runtime error'));
    } finally {
      await h.dispose();
    }
  });

  test('a backend error during an active session still fails the bring-up', () async {
    final h = _Harness();
    try {
      await h.manager.playItems(<dynamic>[_item]);

      h.backend.emit(_lateError);
      await pumpEventQueue();

      expect(h.manager.bringupState.phase, PlaybackBringupPhase.failed);
      expect(h.manager.bringupState.error, 'Unexpected runtime error');
      expect(h.notes, isEmpty);
    } finally {
      await h.dispose();
    }
  });

  test('a late error after a background stop is dropped too', () async {
    // The queue item survives a background stop, which is why the guard
    // reads the resolutions rather than the broader idle predicate.
    final h = _Harness();
    try {
      await h.manager.playItems(<dynamic>[_item]);
      expect(await h.manager.stopForBackground(_item), isTrue);
      expect(h.manager.queueService.currentItem, same(_item));
      h.phases.clear();

      h.backend.emit(_lateError);
      await pumpEventQueue();

      expect(h.sawFailure, isFalse);
      expect(h.notes.single, contains('Dropped a late error'));
    } finally {
      await h.dispose();
    }
  });

  test('a late playerError is dropped the same way', () async {
    final h = _Harness();
    try {
      await h.manager.playItems(<dynamic>[_item]);
      await h.manager.stop();
      h.phases.clear();

      h.backend.emit(<String, dynamic>{
        'event': 'playerError',
        'recoverable': false,
        'kind': 'unsupported_audio',
      });
      await pumpEventQueue();

      expect(h.sawFailure, isFalse);
      expect(h.notes.single, contains('Dropped a late playerError'));
    } finally {
      await h.dispose();
    }
  });
}
