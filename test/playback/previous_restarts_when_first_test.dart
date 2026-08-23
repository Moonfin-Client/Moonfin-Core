import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  final List<Duration> seeks = <Duration>[];
  int stopCalls = 0;
  Duration currentPosition = Duration.zero;
  bool playing = true;

  @override
  Duration get position => currentPosition;

  @override
  bool get isPlaying => playing;

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
  Future<void> seekTo(Duration position) async {
    seeks.add(position);
    currentPosition = position;
  }

  @override
  Future<void> stop() async {
    stopCalls++;
    playing = false;
  }
}

void main() {
  late _TestBackend backend;
  late PlaybackManager manager;

  setUp(() {
    backend = _TestBackend();
    manager = PlaybackManager()..setBackend(backend);
  });

  test('previous restarts the only item rather than stopping it', () async {
    manager.queueService.setQueue(['only'], startIndex: 0);
    manager.state.setPosition(const Duration(seconds: 1));

    await manager.previous();

    expect(backend.seeks, [Duration.zero]);
    expect(
      backend.stopCalls,
      0,
      reason: 'stopping with nothing to step back to left playback dead',
    );
  });

  test('previous restarts the first item of a longer queue', () async {
    manager.queueService.setQueue(['a', 'b', 'c'], startIndex: 0);
    manager.state.setPosition(const Duration(seconds: 2));

    await manager.previous();

    expect(backend.seeks, [Duration.zero]);
    expect(manager.queueService.currentIndex, 0);
    expect(backend.stopCalls, 0);
  });

  test('previous past three seconds restarts wherever it sits', () async {
    manager.queueService.setQueue(['a', 'b'], startIndex: 1);
    manager.state.setPosition(const Duration(seconds: 30));

    await manager.previous();

    expect(backend.seeks, [Duration.zero]);
    expect(
      manager.queueService.currentIndex,
      1,
      reason: 'a late press restarts rather than stepping back',
    );
  });
}
