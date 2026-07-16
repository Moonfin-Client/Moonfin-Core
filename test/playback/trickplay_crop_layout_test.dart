import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/playback/trickplay_tile_image.dart';

/// Stands in for the network sprite sheet with a blank image of a known size.
class _FakeSheet extends ImageProvider<_FakeSheet> {
  final int width;
  final int height;

  _FakeSheet(this.width, this.height);

  @override
  Future<_FakeSheet> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<_FakeSheet>(this);

  @override
  ImageStreamCompleter loadImage(_FakeSheet key, ImageDecoderCallback decode) =>
      OneFrameImageStreamCompleter(_frame());

  Future<ImageInfo> _frame() async {
    final recorder = ui.PictureRecorder();
    Canvas(recorder).drawRect(
      Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      Paint()..color = const Color(0xFF00FF00),
    );
    return ImageInfo(
      image: await recorder.endRecording().toImage(width, height),
    );
  }
}

void main() {
  // A stock Jellyfin sheet of 320x180 thumbnails in a 10x10 grid.
  const thumbWidth = 320.0;
  const thumbHeight = 180.0;
  const tileWidth = 10;
  const tileHeight = 10;

  const displayWidth = 520.0;
  const displayHeight = displayWidth * (thumbHeight / thumbWidth);

  // An interior tile, so a mis-sized sheet shows neighbours on every side
  // rather than the sheet edge.
  const sourceRect = Rect.fromLTWH(
    3 * thumbWidth,
    2 * thumbHeight,
    thumbWidth,
    thumbHeight,
  );

  testWidgets('scales the sheet so one tile fills the preview box', (
    tester,
  ) async {
    await tester.pumpWidget(
      Center(
        child: SizedBox(
          width: displayWidth,
          height: displayHeight,
          child: ClipRect(
            child: TrickplayTileImage(
              sheet: _FakeSheet(
                (thumbWidth * tileWidth).toInt(),
                (thumbHeight * tileHeight).toInt(),
              ),
              sourceRect: sourceRect,
              thumbWidth: thumbWidth,
              thumbHeight: thumbHeight,
              tileWidth: tileWidth,
              tileHeight: tileHeight,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final image = tester.renderObject<RenderImage>(find.byType(RawImage));

    // Scaled up until one tile covers the box, rather than left at the sheet's
    // intrinsic 3200x1800.
    expect(image.size.width, displayWidth * tileWidth);
    expect(image.size.height, closeTo(displayHeight * tileHeight, 0.01));

    // The wanted tile lands over the box instead of its neighbours.
    const scale = displayWidth / thumbWidth;
    final box = tester.renderObject<RenderBox>(find.byType(ClipRect));
    final offset =
        box.localToGlobal(Offset.zero) - image.localToGlobal(Offset.zero);
    expect(offset.dx, closeTo(sourceRect.left * scale, 0.01));
    expect(offset.dy, closeTo(sourceRect.top * scale, 0.01));
  });
}
