import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/bounded_network_image.dart';
import 'package:moonfin/ui/widgets/image_source.dart';

void main() {
  group('BoundedNetworkImage.cacheWidthFor', () {
    test(
      'rounds a fractional physical width up so the paint never stretches',
      () {
        expect(BoundedNetworkImage.cacheWidthFor(160.2, 1.0), 180);
        expect(BoundedNetworkImage.cacheWidthFor(100, 1.25), 140);
        expect(BoundedNetworkImage.cacheWidthFor(101, 1.25), 140);
        for (final logical in [1.0, 33.3, 100.0, 150.0, 160.2, 333.7, 500.0]) {
          for (final dpr in [1.0, 1.25, 1.5, 2.0, 2.75]) {
            final painted = (logical * math.min(dpr, 2.0)).ceil();
            expect(
              BoundedNetworkImage.cacheWidthFor(logical, dpr),
              greaterThanOrEqualTo(math.max(painted, 64)),
              reason: '$logical @ $dpr',
            );
          }
        }
      },
    );

    test('caps the pixel ratio where the server requests cap it', () {
      expect(BoundedNetworkImage.cacheWidthFor(100, 3.0), 200);
      expect(BoundedNetworkImage.cacheWidthFor(100, 0.5), 100);
    });

    test('keeps the caller bounds', () {
      expect(BoundedNetworkImage.cacheWidthFor(10, 2.0), 64);
      expect(BoundedNetworkImage.cacheWidthFor(900, 2.0), 1024);
      expect(BoundedNetworkImage.cacheWidthFor(900, 2.0, maxWidth: 640), 640);
    });
  });

  group('ArtworkDecode', () {
    test('steps up to the next multiple of 20 and never below the paint', () {
      expect(ArtworkDecode.stepUp(0), 0);
      expect(ArtworkDecode.stepUp(1), 20);
      expect(ArtworkDecode.stepUp(20), 20);
      expect(ArtworkDecode.stepUp(21), 40);
      expect(ArtworkDecode.stepUp(299), 300);
      for (var px = 1; px <= 2000; px++) {
        final stepped = ArtworkDecode.stepUp(px);
        expect(stepped, greaterThanOrEqualTo(px));
        expect(stepped - px, lessThan(ArtworkDecode.widthStep));
      }
    });

    test('the caps in use are returned exactly', () {
      for (final cap in [640, 960, 1024, 1280, 1920]) {
        expect(
          ArtworkDecode.widthFor(5000, 2.0, maxWidth: cap),
          cap,
          reason: 'cap $cap',
        );
      }
    });

    test('a decode never exceeds the library grid request ladder', () {
      // The grid asks the server for widths rounded up to 140 (posters) or
      // 240 (landscape). The decode must never be wider than that request or
      // the decoder would be asked to upscale.
      for (var px = 1; px <= 2000; px++) {
        final decode = ArtworkDecode.stepUp(px);
        final posterRequest = (px / 140).ceil() * 140;
        final landscapeRequest = (px / 240).ceil() * 240;
        expect(decode, lessThanOrEqualTo(posterRequest), reason: 'poster $px');
        expect(
          decode,
          lessThanOrEqualTo(landscapeRequest),
          reason: 'landscape $px',
        );
      }
    });

    test('a cover fit into a portrait box inflates the width', () {
      // A 16:9 backdrop filling a 390 by 844 phone paints about 1500 points
      // wide. Bounding by the box width alone would decode 780 pixels and
      // stretch them across four times as many.
      expect(
        ArtworkDecode.widthFor(
          390,
          2.0,
          layoutHeight: 844,
          sourceAspectRatio: 16 / 9,
        ),
        1920,
      );
      expect(ArtworkDecode.widthFor(390, 2.0), 780);
      // A landscape box is unaffected.
      expect(
        ArtworkDecode.widthFor(
          800,
          1.0,
          layoutHeight: 450,
          sourceAspectRatio: 16 / 9,
        ),
        800,
      );
    });

    test('heightFor mirrors widthFor', () {
      expect(ArtworkDecode.heightFor(225, 2.0), 460);
      expect(ArtworkDecode.heightFor(10, 1.0), 64);
      expect(ArtworkDecode.heightFor(5000, 1.0), 1920);
    });
  });
}
