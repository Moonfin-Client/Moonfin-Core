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

class _RefusingResolver extends MediaStreamResolver {
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
  }) async => throw const PlaybackRefusedException(
    "This file can't be read. Replace it and scan the library again.",
    reason: 'source_unreadable',
  );
}

void main() {
  test('a refusal fails the bringup with the server\'s words', () async {
    final backend = _TestBackend();
    final manager = PlaybackManager()
      ..setBackend(backend)
      ..setResolver(_RefusingResolver());
    addTearDown(manager.dispose);
    final states = <PlaybackBringupState>[];
    final sub = manager.bringupStateStream.listen(states.add);
    addTearDown(sub.cancel);

    await expectLater(
      manager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'movie', 'Type': 'Movie'},
      ]),
      throwsA(isA<PlaybackRefusedException>()),
    );
    await Future<void>.delayed(Duration.zero);
    final failed = states.lastWhere(
      (s) => s.phase == PlaybackBringupPhase.failed,
    );
    expect(
      failed.error,
      "This file can't be read. Replace it and scan the library again.",
    );
    expect(backend.playStarts, isEmpty);
  });
}
