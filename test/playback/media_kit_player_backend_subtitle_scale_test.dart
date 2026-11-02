import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

double _scale(double frame, double screen) =>
    MediaKitPlayerBackend.textSubtitleFrameScale(
      frameAspect: frame,
      screenAspect: screen,
    );

void main() {
  test('a 16:9 or narrower frame keeps the chosen size', () {
    expect(_scale(16 / 9, 16 / 9), 1);
    expect(_scale(4 / 3, 16 / 9), 1);
    expect(_scale(16 / 9, 16 / 10), 1);
  });

  test('a scope frame grows back to the size a 16:9 title gets', () {
    expect(_scale(2.35, 16 / 9), closeTo(2.35 / (16 / 9), 1e-9));
    expect(_scale(2.35, 16 / 10), closeTo(2.35 / (16 / 9), 1e-9));
  });

  test('a screen wider than 16:9 only makes up what the frame overhangs', () {
    expect(_scale(2.35, 20 / 9), closeTo(2.35 / (20 / 9), 1e-9));
    expect(_scale(2.0, 21 / 9), 1);
  });
}
