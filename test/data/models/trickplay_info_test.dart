import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_info.dart';
import 'package:server_core/server_core.dart';

void main() {
  const info = TrickplayInfo(
    width: 100,
    height: 60,
    tileWidth: 5,
    tileHeight: 4,
    interval: 10000,
  );

  group('TrickplayInfo.resolveTile', () {
    test('position 0 resolves to the first tile of the first sheet', () {
      final tile = info.resolveTile(Duration.zero);
      expect(tile.imageIndex, 0);
      expect(tile.sourceRect, const Rect.fromLTWH(0, 0, 100, 60));
    });

    test('mid-interval position stays on the same tile as its floor', () {
      final tile = info.resolveTile(const Duration(milliseconds: 9999));
      expect(tile.imageIndex, 0);
      expect(tile.sourceRect, const Rect.fromLTWH(0, 0, 100, 60));
    });

    test('tile-grid col/row math for a mid-sheet tile', () {
      final tile = info.resolveTile(const Duration(milliseconds: 70000));
      expect(tile.imageIndex, 0);
      expect(tile.sourceRect, const Rect.fromLTWH(200, 60, 100, 60));
    });

    test('last tile of the first sheet is the bottom-right cell', () {
      final tile = info.resolveTile(const Duration(milliseconds: 199999));
      expect(tile.imageIndex, 0);
      expect(tile.sourceRect, const Rect.fromLTWH(400, 180, 100, 60));
    });

    test('sheet-boundary rollover resets to tile (0,0) on the next sheet', () {
      final tile = info.resolveTile(const Duration(milliseconds: 200000));
      expect(tile.imageIndex, 1);
      expect(tile.sourceRect, const Rect.fromLTWH(0, 0, 100, 60));
    });

    test('carries thumb/tile dimensions through unchanged', () {
      final tile = info.resolveTile(const Duration(milliseconds: 70000));
      expect(tile.thumbWidth, 100);
      expect(tile.thumbHeight, 60);
      expect(tile.tileWidth, 5);
      expect(tile.tileHeight, 4);
    });
  });

  group('timestamped Emby frames', () {
    final frameInfo = TrickplayInfo.fromThumbnailSet(
      const TrickplayThumbnailSet(
        aspectRatio: 16 / 9,
        thumbnails: [
          TrickplayThumbnail(positionTicks: 0, imageTag: 'tag-0'),
          TrickplayThumbnail(positionTicks: 75000000, imageTag: 'tag-1'),
          TrickplayThumbnail(positionTicks: 210000000, imageTag: 'tag-2'),
        ],
      ),
      width: 320,
    );

    test('uses the thumbnail aspect ratio for preview dimensions', () {
      expect(frameInfo.isValid, isTrue);
      expect(frameInfo.usesIndividualFrames, isTrue);
      expect(frameInfo.width, 320);
      expect(frameInfo.height, 180);
      expect(frameInfo.tilesPerImage, 1);
    });

    test('chooses the last frame at or before the scrub position', () {
      expect(frameInfo.resolveTile(Duration.zero).imageIndex, 0);
      expect(
        frameInfo.resolveTile(const Duration(milliseconds: 7499)).imageIndex,
        0,
      );
      final exact = frameInfo.resolveTile(const Duration(milliseconds: 7500));
      expect(exact.imageIndex, 1);
      expect(exact.positionTicks, 75000000);
      expect(exact.imageTag, 'tag-1');
      expect(frameInfo.resolveTile(const Duration(minutes: 2)).imageIndex, 2);
    });

    test('drops a frame it could never fetch', () {
      final info = TrickplayInfo.fromThumbnailSet(
        const TrickplayThumbnailSet(
          aspectRatio: 2,
          thumbnails: [
            TrickplayThumbnail(positionTicks: 0, imageTag: 'first'),
            TrickplayThumbnail(positionTicks: 100, imageTag: ''),
          ],
        ),
        width: 200,
      );

      expect(info.frames.map((frame) => frame.imageTag), ['first']);
      expect(info.isValid, isTrue);
    });

    test('sorts timestamps and replaces duplicate positions', () {
      final sorted = TrickplayInfo.fromThumbnailSet(
        const TrickplayThumbnailSet(
          aspectRatio: 2,
          thumbnails: [
            TrickplayThumbnail(positionTicks: 100, imageTag: 'old'),
            TrickplayThumbnail(positionTicks: 0, imageTag: 'first'),
            TrickplayThumbnail(positionTicks: 100, imageTag: 'new'),
          ],
        ),
        width: 200,
      );

      expect(sorted.frames.map((frame) => frame.positionTicks), [0, 100]);
      expect(sorted.frames.last.imageTag, 'new');
    });
  });
}
