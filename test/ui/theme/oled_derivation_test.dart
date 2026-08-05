import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/vibrance.dart';
import 'package:moonfin_design/moonfin_design.dart';

const _black = Color(0xFF000000);

/// Real registry themes rather than hand-rolled tokens, so the derivation is
/// exercised against the palettes it will actually see in production.
ThemeSpec _spec({bool isGlass = false}) => ThemeRegistry.resolveById(
      isGlass ? ThemeRegistry.glassId : ThemeRegistry.moonfinId,
    );

void main() {
  group('applyOled', () {
    test('off returns the identical spec, so disabled costs nothing', () {
      final base = _spec();
      expect(identical(applyOled(base, OledTuning.off), base), isTrue);
    });

    test('vivid drives the background to pure black', () {
      final out = applyOled(_spec(), OledTuning.vivid);
      expect(out.colors.background, _black);
    });

    test('subtle darkens the background without fully crushing it', () {
      final out = applyOled(_spec(), OledTuning.subtle);
      expect(out.colors.background, isNot(_black));
      expect(out.colors.background.g, lessThan(_spec().colors.background.g));
    });

    test('glass keeps its translucent surface so the frosting survives', () {
      final base = _spec(isGlass: true);
      final out = applyOled(base, OledTuning.vivid);
      expect(out.colors.surface, base.colors.surface);
      // The backdrop behind the panes still goes black.
      expect(out.colors.background, _black);
    });

    test('non-glass surfaces are crushed', () {
      final base = _spec();
      final out = applyOled(base, OledTuning.vivid);
      expect(out.colors.surface, _black);
      expect(out.colors.surfaceVariant, _black);
    });

    test('the card token is crushed from its fixed-palette default', () {
      final base = _spec();
      expect(base.colors.card, const Color(0xFF202020));
      expect(applyOled(base, OledTuning.vivid).colors.card, _black);
    });

    test('borders are lifted rather than crushed, to stay visible', () {
      final base = _spec();
      final out = applyOled(base, OledTuning.vivid);
      expect(out.colors.inputBorder.r, greaterThan(base.colors.inputBorder.r));
    });

    test('everything outside the crush list is left alone', () {
      final base = _spec();
      final out = applyOled(base, OledTuning.vivid);
      expect(out.colors.accent, base.colors.accent);
      expect(out.colors.onSurface, base.colors.onSurface);
      expect(out.colors.badgeWatched, base.colors.badgeWatched);
      expect(out.id, base.id);
      expect(out.borders, base.borders);
    });
  });

  group('Vibrance', () {
    tearDown(() => Vibrance.apply(OledTuning.off));

    test('off installs no filter, so wrap stays a no-op', () {
      Vibrance.apply(OledTuning.off);
      expect(Vibrance.filter.value, isNull);
    });

    test('vivid installs a filter', () {
      Vibrance.apply(OledTuning.vivid);
      expect(Vibrance.filter.value, isNotNull);
    });

    test('the saturation matrix preserves luminance for neutral grey', () {
      // Saturation is a no-op on grey by construction, so with contrast at 1.0
      // each colour row must sum to 1 and carry no translation. Otherwise a
      // grey pixel would shift brightness purely from saturating it.
      final m = Vibrance.saturationContrastMatrix(
        const OledTuning(1.0, 1.25, 1.0),
      );
      for (var row = 0; row < 3; row++) {
        final base = row * 5;
        expect(m[base] + m[base + 1] + m[base + 2], closeTo(1.0, 1e-9));
        expect(m[base + 4], closeTo(0.0, 1e-9));
      }
    });

    test('contrast pivots around mid grey', () {
      const c = 1.08;
      final m = Vibrance.saturationContrastMatrix(const OledTuning(1.0, 1.0, c));
      // Mid grey in must be mid grey out: 0.5 * c + offset == 0.5.
      final offset = m[4] / 255.0;
      expect(0.5 * c + offset, closeTo(0.5, 1e-9));
    });

    test('the alpha row is untouched, so transparency survives', () {
      final m = Vibrance.saturationContrastMatrix(OledTuning.vivid);
      expect(m.sublist(15), <double>[0, 0, 0, 1, 0]);
    });

    test('vivid actually raises saturation off the diagonal', () {
      final m = Vibrance.saturationContrastMatrix(OledTuning.vivid);
      // s > 1 pushes the off-diagonal luma terms negative.
      expect(m[1], lessThan(0.0));
      expect(m[0], greaterThan(1.0));
    });
  });
}
