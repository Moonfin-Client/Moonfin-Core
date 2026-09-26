import 'dart:typed_data';

import 'package:playback_core/playback_core.dart';

class MpvFrameSample {
  const MpvFrameSample({required this.rect, required this.elapsed});

  final LetterboxCropRect? rect;
  final Duration elapsed;
}

/// Scan only the edges until picture is found. Work is bounded across each
/// row/column; a 4K frame never needs a second full-size Dart pixel buffer.
LetterboxCropRect? scanMpvBgra(
  Uint8List pixels, {
  required int width,
  required int height,
  required int stride,
  required int sourceWidth,
  required int sourceHeight,
}) {
  if (width <= 0 ||
      height <= 0 ||
      sourceWidth <= 0 ||
      sourceHeight <= 0 ||
      stride < width * 4 ||
      pixels.length < stride * height) {
    return null;
  }
  bool bright(int x, int y) {
    final offset = y * stride + x * 4;
    return (77 * pixels[offset + 2] +
            150 * pixels[offset + 1] +
            29 * pixels[offset]) >
        24 * 256;
  }

  final xStep = (width ~/ 192).clamp(1, width);
  final yStep = (height ~/ 128).clamp(1, height);
  bool rowHasPicture(int y) {
    var hits = 0;
    for (var x = xStep ~/ 2; x < width; x += xStep) {
      if (bright(x, y) && ++hits >= 2) return true;
    }
    return false;
  }

  bool columnHasPicture(int x, int top, int bottom) {
    var hits = 0;
    for (var y = top; y <= bottom; y += yStep) {
      if (bright(x, y) && ++hits >= 2) return true;
    }
    return false;
  }

  var top = 0;
  while (top < height && !rowHasPicture(top)) {
    top++;
  }
  if (top == height) return null;
  var bottom = height - 1;
  while (bottom > top && !rowHasPicture(bottom)) {
    bottom--;
  }
  var left = 0;
  while (left < width && !columnHasPicture(left, top, bottom)) {
    left++;
  }
  if (left == width) return null;
  var right = width - 1;
  while (right > left && !columnHasPicture(right, top, bottom)) {
    right--;
  }

  // Round outwards: alignment must not discard a strip of real picture.
  final x = (left * sourceWidth ~/ width) ~/ 2 * 2;
  final y = (top * sourceHeight ~/ height) ~/ 2 * 2;
  final endX = ((((right + 1) * sourceWidth / width).ceil() + 1) ~/ 2 * 2)
      .clamp(0, sourceWidth);
  final endY = ((((bottom + 1) * sourceHeight / height).ceil() + 1) ~/ 2 * 2)
      .clamp(0, sourceHeight);
  return LetterboxCropRect(w: endX - x, h: endY - y, x: x, y: y);
}
