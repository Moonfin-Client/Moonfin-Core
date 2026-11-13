import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';

void main() {
  group('Classic home row overlay clipping', () {
    test('keeps a focused row that rests under the overlay fully visible', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: true,
        rowViewportTop: 120,
        rowRestTop: 120,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 0);
    });

    test('clips a focused row sliding down out from under the overlay', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: true,
        rowViewportTop: 120,
        rowRestTop: 260,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 140);
    });

    test('clips a focused row above its resting top under the overlay', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: true,
        rowViewportTop: 40,
        rowRestTop: 120,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 80);
    });

    test('leaves a focused row at rest below the overlay whole', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: true,
        rowViewportTop: 260,
        rowRestTop: 260,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 0);
    });

    test('clips the covered portion of an inactive row', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: false,
        rowViewportTop: 120,
        rowRestTop: 120,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 140);
    });

    test('does not clip an inactive row below the overlay', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: false,
        rowViewportTop: 280,
        rowRestTop: 280,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 0);
    });
  });
}
