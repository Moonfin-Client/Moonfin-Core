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

  test('a TV scales artwork up to a 4K panel on the design canvas', () {
    // A 4K Apple TV reports 2 over 1920 points; TvUiScale lays it out on the
    // 1150 point canvas, so the density it hands down is about 3.34.
    const appleTv4k = 2.0 * 1920 / 1150;
    expect(artworkDevicePixelRatio(appleTv4k, isTv: true), appleTv4k);
    expect(artworkDevicePixelRatio(appleTv4k, isTv: false), 2.0);
    expect(
      artworkDevicePixelRatio(8.0, isTv: true),
      maxTvArtworkDevicePixelRatio,
    );
    expect(artworkDevicePixelRatio(0.5, isTv: true), 1.0);
    // A 150 point poster row card covers 501 pixels on that panel.
    expect(
      artworkRequestWidth(150, appleTv4k, ArtworkShape.poster, isTv: true),
      560,
    );
    expect(
      artworkRequestWidth(150, appleTv4k, ArtworkShape.poster, isTv: false),
      420,
    );
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
