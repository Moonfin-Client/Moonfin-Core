import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

(int, int)? _capped(int width, int height, Size window) =>
    MediaKitPlayerBackend.cappedTextureSize(
      width: width,
      height: height,
      window: window,
    );

void main() {
  const fullHd = Size(1920, 1080);

  test('a source no bigger than the window keeps its own size', () {
    expect(_capped(1920, 1080, fullHd), isNull);
    expect(_capped(1280, 720, fullHd), isNull);
    expect(_capped(3840, 2160, const Size(3840, 2160)), isNull);
  });

  test('a 4K 16:9 source shrinks to the window', () {
    expect(_capped(3840, 2160, fullHd), (1920, 1080));
  });

  test('a scope source still covers the window height for Zoom to Fill', () {
    expect(_capped(3840, 1636, fullHd), (2535, 1080));
  });

  test('a source that only overhangs one side keeps covering the other', () {
    expect(_capped(4096, 1080, fullHd), isNull);
  });

  test('a minimised window leaves the texture alone', () {
    expect(_capped(3840, 2160, Size.zero), isNull);
  });
}
