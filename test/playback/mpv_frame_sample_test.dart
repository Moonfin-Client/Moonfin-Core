import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/mpv_frame_sample.dart';
import 'package:playback_core/playback_core.dart';

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

  test('a cropped screenshot is the crop window, not a full frame', () {
    expect(
      screenshotIsCropWindow(
        shotWidth: 3840,
        shotHeight: 1920,
        sourceWidth: 3840,
        sourceHeight: 2160,
        windowW: 3840,
        windowH: 1920,
      ),
      isTrue,
    );
    expect(
      screenshotIsCropWindow(
        shotWidth: 3840,
        shotHeight: 2160,
        sourceWidth: 3840,
        sourceHeight: 2160,
        windowW: 3840,
        windowH: 1920,
      ),
      isFalse,
    );

    final placed = offsetScanToSource(
      const LetterboxCropRect(w: 3840, h: 1920, x: 0, y: 0),
      windowX: 0,
      windowY: 120,
      sourceWidth: 3840,
      sourceHeight: 2160,
    );
    expect(placed, const LetterboxCropRect(w: 3840, h: 1920, x: 0, y: 120));
  });
}
