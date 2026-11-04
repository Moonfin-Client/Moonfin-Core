import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/theme_music_service.dart';

void main() {
  int start(double current, double target) => ThemeMusicService.fadeInStartStep(
    current: current,
    target: target,
    steps: 40,
  );

  test('a fresh player fades in from silence', () {
    expect(start(0, 40), 0);
  });

  test('a reversed fade-out carries on from its volume', () {
    expect(start(10, 40), 10);
    expect(start(30, 40), 30);
  });

  test('a player at or above the target still takes the last step', () {
    expect(start(40, 40), 39);
    expect(start(100, 40), 39);
  });

  test('a target of zero starts at 0', () {
    expect(start(25, 0), 0);
  });
}
