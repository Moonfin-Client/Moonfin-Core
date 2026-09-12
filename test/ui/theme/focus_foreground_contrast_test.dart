import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/focus_foreground.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// WCAG 2.1 contrast ratio. Flutter's computeLuminance is already the WCAG
/// relative luminance, so this is only the ratio around it.
double _contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  tearDown(() => ThemeRegistry.setActiveById(ThemeRegistry.moonfinId));

  test('every theme focus fill carries readable text', () {
    for (final entry in ThemeRegistry.availableThemes.entries) {
      final fill = entry.value.colors.buttonFocused;
      // The active theme is what readableOnFocusFill reads onSurface from.
      ThemeRegistry.setActiveById(entry.key);
      final ratio = _contrast(readableOnFocusFill(fill), fill);
      expect(
        ratio,
        greaterThanOrEqualTo(4.5),
        reason:
            '${entry.key}: foreground on buttonFocused is only '
            '${ratio.toStringAsFixed(2)}:1',
      );
    }
  });
}
