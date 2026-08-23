import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_screen.dart';

void main() {
  group('Classic home row overlay clipping', () {
    test('keeps the focused row fully visible under the info overlay', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: true,
        rowViewportTop: 120,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 0);
    });

    test('clips the covered portion of an inactive row', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: false,
        rowViewportTop: 120,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 140);
    });

    test('does not clip an inactive row below the overlay', () {
      final clipTop = classicHomeRowOverlayClipTop(
        isFocused: false,
        rowViewportTop: 280,
        rowExtent: 300,
        overlayBottom: 260,
      );

      expect(clipTop, 0);
    });
  });
}
