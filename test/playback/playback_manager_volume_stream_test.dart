import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  test("each new level is emitted once, and a repeat isn't", () async {
    final manager = PlaybackManager();
    addTearDown(manager.dispose);
    final levels = <double>[];
    manager.volumeStream.listen(levels.add);

    manager.reportVolumeState(volume: 30, isMuted: false);
    manager.reportVolumeState(volume: 30, isMuted: false);
    manager.reportVolumeState(volume: 0, isMuted: true);
    manager.reportVolumeState(volume: 140, isMuted: false);
    await pumpEventQueue();

    expect(levels, [30, 0, 100]);
    expect(manager.volume, 100);
    expect(manager.isMuted, isFalse);
  });
}
