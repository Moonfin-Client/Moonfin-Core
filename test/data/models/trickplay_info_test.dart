import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/trickplay_info.dart';

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
}
