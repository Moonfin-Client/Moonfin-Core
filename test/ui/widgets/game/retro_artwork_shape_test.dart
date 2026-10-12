import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/game/retro_artwork_shape.dart';

void main() {
  group('RetroArtworkShape.cellFor', () {
    test('unknown shape keeps the portrait card', () {
      for (final aspect in <double?>[null, 0, -1, double.nan]) {
        expect(
          RetroArtworkShape.cellFor(aspect),
          RetroArtworkCellFactors.portrait,
        );
      }
    });

    test('portrait art keeps the card width and is never taller', () {
      final nes = RetroArtworkShape.cellFor(355 / 512);
      expect(nes.width, 1);
      expect(nes.height, RetroArtworkShape.portraitHeightRatio);

      final genesis = RetroArtworkShape.cellFor(512 / 720);
      expect(genesis.width, 1);
      expect(genesis.height, RetroArtworkShape.portraitHeightRatio);

      final squat = RetroArtworkShape.cellFor(0.8);
      expect(squat.width, 1);
      expect(squat.height, closeTo(1.25, 0.0001));
    });

    test('square art keeps the card width and gets shorter', () {
      final cell = RetroArtworkShape.cellFor(1);
      expect(cell.width, 1);
      expect(cell.height, 1);
    });

    test('landscape art widens to the cap and keeps its shape', () {
      final n64 = RetroArtworkShape.cellFor(512 / 357);
      expect(n64.width, RetroArtworkShape.landscapeMaxWidthFactor);
      expect(n64.aspectRatio, closeTo(512 / 357, 0.0001));
      expect(n64.height, lessThan(RetroArtworkShape.portraitHeightRatio));

      final nearSquare = RetroArtworkShape.cellFor(1.1);
      expect(nearSquare.width, closeTo(1.116, 0.0001));
      expect(nearSquare.aspectRatio, closeTo(1.1, 0.0001));
    });

    test('extreme shapes are clamped', () {
      expect(
        RetroArtworkShape.cellFor(5).aspectRatio,
        closeTo(RetroArtworkShape.maxAspectRatio, 0.0001),
      );
      expect(
        RetroArtworkShape.cellFor(0.2),
        RetroArtworkShape.cellFor(RetroArtworkShape.minAspectRatio),
      );
    });
  });

  group('RetroArtworkShape.needsFill', () {
    test('a close match fills its cell without a fill', () {
      expect(RetroArtworkShape.needsFill(1.40, 1.369), isFalse);
      expect(RetroArtworkShape.needsFill(null, 1.369), isFalse);
    });

    test('a portrait box in a landscape cell needs a fill', () {
      expect(RetroArtworkShape.needsFill(256 / 354, 1.369), isTrue);
      expect(RetroArtworkShape.needsFill(1.46, 1.369), isTrue);
    });
  });
}
