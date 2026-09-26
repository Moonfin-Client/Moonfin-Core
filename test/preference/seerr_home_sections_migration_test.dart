import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefsWith(Map<String, Object> values) async {
  SharedPreferences.setMockInitialValues(values);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

const _homeKey = 'home_sections_config_srv1_usr1';

const _scope = <String, Object>{
  'pref_last_server_id': 'srv1',
  'pref_last_user_id': 'usr1',
};

// Trending is Seerr DiscoverSliderType 4.
const _legacyRowsOff =
    '[{"type":"trending","enabled":false,"order":0}]';

String _storedHome(SharedPreferences prefs) => prefs.getString(_homeKey) ?? '';

void main() {
  group('legacy Seerr home sections migration', () {
    test('an old seerr_trending row becomes a slider that keeps its state',
        () async {
      final prefs = await _prefsWith({
        ..._scope,
        _homeKey: '[{"type":"seerr_trending","enabled":true,"order":3}]',
      });

      final trending = prefs.homeSectionsConfig
          .where((c) => c.isSeerrSlider && c.sliderType == 4)
          .single;
      expect(trending.enabled, isTrue);
      expect(trending.order, 3);
    });

    test('a row the user turned off in the old Discover store stays off',
        () async {
      final prefs = await _prefsWith({
        ..._scope,
        'seerr_home_rows_config_usr1': _legacyRowsOff,
        _homeKey: '[{"type":"seerr_trending","enabled":true,"order":3}]',
      });

      final trending = prefs.homeSectionsConfig
          .where((c) => c.isSeerrSlider && c.sliderType == 4)
          .single;
      expect(trending.enabled, isFalse);
    });

    test('re-enabling an unbound slider survives the next launch', () async {
      final first = await _prefsWith({
        ..._scope,
        'seerr_home_rows_config_usr1': _legacyRowsOff,
        _homeKey: '[{"type":"seerr_trending","enabled":true,"order":3}]',
      });

      await first.setHomeSectionsConfig([
        for (final c in first.homeSectionsConfig)
          c.isSeerrSlider && c.sliderType == 4
              ? c.copyWith(enabled: true)
              : c,
      ]);

      final shared = await SharedPreferences.getInstance();
      final store = PreferenceStore();
      await store.init();
      final second = UserPreferences(store);

      final trending = second.homeSectionsConfig
          .where((c) => c.isSeerrSlider && c.sliderType == 4)
          .single;
      expect(trending.enabled, isTrue,
          reason: 'the migration must not re-apply the legacy flags');
      expect(
        HomeSectionConfig.fromJsonString(_storedHome(shared))
            .where((c) => c.isSeerrSlider && c.sliderType == 4)
            .single
            .enabled,
        isTrue,
      );
    });
  });
}
