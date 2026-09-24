import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/subtitle_customization_screen.dart';

void main() {
  group('subtitlePresetColors', () {
    test('offers exactly these colors', () {
      expect(subtitlePresetColors, {
        'white': 0xFFFFFFFF,
        'light_gray': 0xFFCCCCCC,
        'gray': 0xFF808080,
        'dark_gray': 0xFF404040,
        'black': 0xFF000000,
        'yellow': 0xFFFFFF00,
        'green': 0xFF00FF00,
        'cyan': 0xFF00FFFF,
        'blue': 0xFF0000FF,
        'magenta': 0xFFFF00FF,
        'red': 0xFFFF0000,
        'navy': 0xFF000080,
        'transparent': 0x00000000,
        'semi_transparent_black': 0x80000000,
        'semi_transparent_white': 0x80FFFFFF,
      });
    });

    test('every subtitle color default is one of the presets', () {
      final values = subtitlePresetColors.values.toSet();

      for (final pref in [
        UserPreferences.subtitlesTextColor,
        UserPreferences.subtitleTextStrokeColor,
        UserPreferences.subtitlesBackgroundColor,
        UserPreferences.subtitlesHdrTextColor,
        UserPreferences.subtitlesHdrTextStrokeColor,
        UserPreferences.subtitlesHdrBackgroundColor,
      ]) {
        expect(
          values,
          contains(pref.defaultValue),
          reason: '${pref.key} defaults to a color the picker cannot show',
        );
      }
    });

    test('transparent is the only fully transparent preset', () {
      // The pickers that refuse transparency filter on this, so the two
      // semi-transparent entries have to read as visible.
      final invisible = subtitlePresetColors.entries
          .where((e) => Color(e.value).a == 0)
          .map((e) => e.key)
          .toList();

      expect(invisible, ['transparent']);
    });
  });

  group('subtitleColorLabel', () {
    test('names every preset', () {
      final l10n = AppLocalizationsEn();

      for (final key in subtitlePresetColors.keys) {
        expect(
          subtitleColorLabel(key, l10n),
          isNotNull,
          reason: '$key has no translated name',
        );
      }
    });

    test('has no name for a key that is not a preset', () {
      expect(subtitleColorLabel('chartreuse', AppLocalizationsEn()), isNull);
    });

    test('spells the English names the American way', () {
      final l10n = AppLocalizationsEn();

      expect(subtitleColorLabel('light_gray', l10n), 'Light Gray');
      expect(subtitleColorLabel('gray', l10n), 'Gray');
      expect(subtitleColorLabel('dark_gray', l10n), 'Dark Gray');
    });
  });
}
