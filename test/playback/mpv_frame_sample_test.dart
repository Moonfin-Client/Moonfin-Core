import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/mpv_frame_sample.dart';

void main() {
  test('edge scan finds letterbox bars and maps them onto the source', () {
    const width = 20;
    const height = 10;
    final pixels = Uint8List(width * 4 * height);
    for (var y = 2; y <= 7; y++) {
      for (var x = 0; x < width; x++) {
        final i = (y * width + x) * 4;
        pixels[i] = 255;
        pixels[i + 1] = 255;
        pixels[i + 2] = 255;
      }
    }

    final rect = scanMpvBgra(
      pixels,
      width: width,
      height: height,
      stride: width * 4,
      sourceWidth: 200,
      sourceHeight: 100,
    );

    expect(rect, isNotNull);
    expect(rect!.x, 0);
    expect(rect.y, greaterThan(0));
    expect(rect.y + rect.h, lessThan(100));
  });
}
