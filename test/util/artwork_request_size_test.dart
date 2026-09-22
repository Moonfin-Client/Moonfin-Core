import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/image_source.dart';
import 'package:moonfin/util/artwork_request_size.dart';

void main() {
  test('poster and landscape ladders', () {
    expect(artworkRequestWidth(100, 1.0, ArtworkShape.poster), 140);
    expect(artworkRequestWidth(140, 1.0, ArtworkShape.poster), 140);
    expect(artworkRequestWidth(141, 1.0, ArtworkShape.poster), 280);
    expect(artworkRequestWidth(150, 2.0, ArtworkShape.poster), 420);
    expect(artworkRequestWidth(300, 1.0, ArtworkShape.landscape), 480);
    expect(artworkRequestWidth(480, 1.0, ArtworkShape.landscape), 480);
    expect(artworkRequestWidth(481, 1.0, ArtworkShape.landscape), 720);
  });

  test('the pixel ratio is capped at two and floored at one', () {
    expect(artworkPhysicalPixels(100, 3.0), 200);
    expect(artworkPhysicalPixels(100, 0.5), 100);
    expect(artworkPhysicalPixels(100.4, 1.0), 101);
    expect(artworkRequestWidth(100, 3.0, ArtworkShape.poster), 280);
  });

  test('a request is never narrower than the decode at any width', () {
    for (var width = 1.0; width <= 1000; width += 0.5) {
      for (final dpr in [1.0, 1.25, 1.5, 2.0, 3.0]) {
        for (final shape in ArtworkShape.values) {
          final request = artworkRequestWidth(width, dpr, shape);
          final decode = ArtworkDecode.widthFor(width, dpr, maxWidth: 4000);
          expect(
            request,
            greaterThanOrEqualTo(decode),
            reason: '$width @ $dpr ${shape.name}',
          );
        }
      }
    }
  });

  test('shape follows the aspect ratio the cards use', () {
    expect(ArtworkShape.forAspectRatio(2 / 3), ArtworkShape.poster);
    expect(ArtworkShape.forAspectRatio(1.0), ArtworkShape.poster);
    expect(ArtworkShape.forAspectRatio(16 / 9), ArtworkShape.landscape);
  });

  test('a zero width still asks for one step', () {
    expect(artworkRequestWidth(0, 2.0, ArtworkShape.poster), 140);
  });
}
