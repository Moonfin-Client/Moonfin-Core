import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/theme/app_theme.dart';
import 'package:moonfin_design/moonfin_design.dart';

/// The manifest the build writes from the pubspec font declarations, which is
/// also what the web engine reads.
List<Map<String, dynamic>> _fontManifest() {
  final file = File('build/unit_test_assets/FontManifest.json');
  return (jsonDecode(file.readAsStringSync()) as List)
      .cast<Map<String, dynamic>>();
}

void main() {
  // The web engine fetches Roboto from fonts.gstatic.com unless it finds a
  // family of that name in the manifest, and Material typography asks for
  // Roboto, so that fetch would otherwise happen on every load.
  test('Roboto is bundled, with the weights Material text styles use', () {
    final roboto = _fontManifest()
        .where((family) => family['family'] == 'Roboto')
        .toList();
    expect(roboto, hasLength(1), reason: 'no Roboto family in the manifest');
    expect(
      (roboto.single['fonts'] as List)
          .cast<Map<String, dynamic>>()
          .map((asset) => asset['weight']),
      containsAll(<Object?>[null, 500, 700]),
      reason: 'regular, medium and bold all appear in Material text styles',
    );
  });

  test('every theme falls back to a bundled font', () {
    for (final id in ThemeRegistry.builtInIds) {
      final textTheme = AppTheme.buildTheme(
        ThemeRegistry.availableThemes[id]!,
      ).textTheme;
      for (final style in [
        textTheme.bodyMedium,
        textTheme.titleLarge,
        textTheme.labelSmall,
      ]) {
        expect(
          style?.fontFamilyFallback,
          contains('NotoSans'),
          reason: '$id has a text style with no bundled fallback',
        );
      }
    }
  });
}
