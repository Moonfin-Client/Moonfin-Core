import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

void main() {
  group('Silo settings → UserConfiguration', () {
    test('maps every key', () {
      final config = UserConfiguration.fromJson(
        siloSettingsToUserConfiguration({
          siloLibraryOrderKey: [3, 1],
          siloDisabledLibrariesKey: [7],
          siloAudioLanguageKey: 'en',
          siloSubtitleLanguageKey: 'es',
          siloSubtitleModeKey: 'always',
          siloShowForcedSubtitlesKey: true,
          siloAutoPlayNextKey: false,
        }),
      );

      expect(config.orderedViews, ['3', '1']);
      expect(config.myMediaExcludes, ['7']);
      expect(config.audioLanguagePreference, 'en');
      expect(config.subtitleLanguagePreference, 'es');
      expect(config.subtitleMode, 'always');
      expect(config.enableNextEpisodeAutoPlay, isFalse);
    });

    test('Silo defaults (nulls and missing keys)', () {
      final config = UserConfiguration.fromJson(
        siloSettingsToUserConfiguration({
          siloLibraryOrderKey: null,
          siloAudioLanguageKey: null,
        }),
      );

      expect(config.orderedViews, isEmpty);
      expect(config.myMediaExcludes, isEmpty);
      expect(config.audioLanguagePreference, isNull);
      expect(config.subtitleMode, 'default');
      expect(config.enableNextEpisodeAutoPlay, isTrue);
      expect(config.latestItemsExcludes, isEmpty);
    });

    test('drops library ids that are not positive integers', () {
      final json = siloSettingsToUserConfiguration({
        siloLibraryOrderKey: [2, 0, -1, 'x', 4.0],
      });

      expect(json['OrderedViews'], ['2', '4']);
    });
  });

  group('subtitle mode', () {
    test('Silo → Jellyfin', () {
      expect(siloSubtitleModeToJellyfin('auto'), 'Default');
      expect(siloSubtitleModeToJellyfin(null), 'Default');
      expect(siloSubtitleModeToJellyfin('always'), 'Always');
      expect(siloSubtitleModeToJellyfin('off'), 'OnlyForced');
      expect(siloSubtitleModeToJellyfin('off', showForced: false), 'None');
    });

    test('Jellyfin → Silo, any case', () {
      expect(jellyfinSubtitleModeToSilo('Always').mode, 'always');
      expect(jellyfinSubtitleModeToSilo('onlyforced'), (
        mode: 'off',
        showForced: true,
      ));
      expect(jellyfinSubtitleModeToSilo('NONE'), (
        mode: 'off',
        showForced: false,
      ));
      expect(jellyfinSubtitleModeToSilo('smart').mode, 'auto');
    });

    test('Default keeps the current show-forced switch', () {
      expect(jellyfinSubtitleModeToSilo('default', currentShowForced: false), (
        mode: 'auto',
        showForced: false,
      ));
    });

    test('round trip', () {
      for (final (mode, forced) in [
        ('auto', true),
        ('always', true),
        ('off', true),
        ('off', false),
      ]) {
        final back = jellyfinSubtitleModeToSilo(
          siloSubtitleModeToJellyfin(mode, showForced: forced),
          currentShowForced: forced,
        );
        expect(back, (mode: mode, showForced: forced), reason: '$mode/$forced');
      }
    });
  });

  test('UserConfiguration → Silo values', () {
    final values = userConfigurationToSiloSettings(
      orderedViews: ['3', '1', '3', 'not-a-library'],
      myMediaExcludes: const [],
      enableNextEpisodeAutoPlay: true,
      audioLanguagePreference: ' en ',
      subtitleLanguagePreference: '',
      subtitleMode: 'none',
    );

    expect(values, {
      siloLibraryOrderKey: [3, 1],
      siloDisabledLibrariesKey: null,
      siloAudioLanguageKey: 'en',
      siloSubtitleLanguageKey: null,
      siloSubtitleModeKey: 'off',
      siloShowForcedSubtitlesKey: false,
      siloAutoPlayNextKey: true,
    });
  });
}
