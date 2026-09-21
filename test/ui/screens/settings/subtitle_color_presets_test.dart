import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/subtitle_customization_screen.dart';

void main() {
  group('subtitlePresetColors', () {
    test('contains all expected preset colors with correct ARGB values', () {
      expect(subtitlePresetColors['White'], 0xFFFFFFFF);
      expect(subtitlePresetColors['Light Grey'], 0xFFCCCCCC);
      expect(subtitlePresetColors['Grey'], 0xFF808080);
      expect(subtitlePresetColors['Dark Grey'], 0xFF404040);
      expect(subtitlePresetColors['Black'], 0xFF000000);
      expect(subtitlePresetColors['Yellow'], 0xFFFFFF00);
      expect(subtitlePresetColors['Green'], 0xFF00FF00);
      expect(subtitlePresetColors['Cyan'], 0xFF00FFFF);
      expect(subtitlePresetColors['Blue'], 0xFF0000FF);
      expect(subtitlePresetColors['Magenta'], 0xFFFF00FF);
      expect(subtitlePresetColors['Red'], 0xFFFF0000);
      expect(subtitlePresetColors['Navy'], 0xFF000080);
      expect(subtitlePresetColors['Transparent'], 0x00000000);
      expect(subtitlePresetColors['Semi-transparent Black'], 0x80000000);
      expect(subtitlePresetColors['Semi-transparent White'], 0x80FFFFFF);
    });

    test('default subtitle preferences match available presets', () {
      final presetValues = subtitlePresetColors.values.toSet();

      expect(presetValues.contains(UserPreferences.subtitlesTextColor.defaultValue), isTrue);
      expect(presetValues.contains(UserPreferences.subtitleTextStrokeColor.defaultValue), isTrue);
      expect(presetValues.contains(UserPreferences.subtitlesBackgroundColor.defaultValue), isTrue);

      expect(presetValues.contains(UserPreferences.subtitlesHdrTextColor.defaultValue), isTrue);
      expect(presetValues.contains(UserPreferences.subtitlesHdrTextStrokeColor.defaultValue), isTrue);
      expect(presetValues.contains(UserPreferences.subtitlesHdrBackgroundColor.defaultValue), isTrue);
    });

    test('only fully transparent options are filtered out when transparency is disallowed', () {
      final nonTransparent = subtitlePresetColors.entries
          .where((e) => (e.value >> 24) & 0xFF != 0)
          .map((e) => e.key)
          .toSet();

      expect(nonTransparent.contains('Transparent'), isFalse);
      expect(nonTransparent.contains('Semi-transparent Black'), isTrue);
      expect(nonTransparent.contains('Semi-transparent White'), isTrue);
      expect(nonTransparent.contains('Light Grey'), isTrue);
      expect(nonTransparent.contains('Grey'), isTrue);
      expect(nonTransparent.contains('Dark Grey'), isTrue);
    });
  });
}
