import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/di/injection.dart'
    show migrateTrickplayPreferenceConsolidation;
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const legacyEnabledKey = 'trick_play_enabled';
  const legacyDisplayStyleKey = 'trickplay_display_style';
  const legacyReplaceVideoKey = 'trickplay_replace_video_while_scrubbing';
  const legacyVerticalOffsetPxKey = 'trickplay_vertical_offset_px';
  const migrationKey = 'pref_trickplay_consolidation_v1';

  Future<PreferenceStore> storeWith(Map<String, Object> values) async {
    SharedPreferences.setMockInitialValues(values);
    final store = PreferenceStore();
    await store.init();
    return store;
  }

  group('trickplay preference consolidation migration', () {
    test('explicit legacy off becomes disabled', () async {
      final store = await storeWith({legacyEnabledKey: false});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.disabled.name,
      );
      expect(store.getBool(migrationKey), isTrue);
    });

    test('untouched legacy toggle stays on the new single default', () async {
      final store = await storeWith({});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.single.name,
      );
    });

    test('legacy strip style wins over replace-video', () async {
      final store = await storeWith({
        legacyEnabledKey: true,
        legacyReplaceVideoKey: true,
        legacyDisplayStyleKey: 'strip',
      });

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.strip.name,
      );
    });

    test('legacy replace-video maps to full mode on its own', () async {
      final store = await storeWith({
        legacyEnabledKey: true,
        legacyReplaceVideoKey: true,
      });

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.full.name,
      );
    });

    test('legacy strip style maps to strip mode', () async {
      final store = await storeWith({
        legacyEnabledKey: true,
        legacyDisplayStyleKey: 'strip',
      });

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.strip.name,
      );
    });

    test('existing new-key value is never overwritten', () async {
      final store = await storeWith({
        UserPreferences.trickPlayMode.key: TrickplayMode.full.name,
        legacyEnabledKey: false,
      });

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.full.name,
      );
    });

    test('positive legacy px offset converts to a percent', () async {
      final store = await storeWith({legacyVerticalOffsetPxKey: 40});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getInt(UserPreferences.trickPlayVerticalPositionPercent.key),
        50,
      );
    });

    test('negative legacy px offset clamps to the 0% floor', () async {
      final store = await storeWith({legacyVerticalOffsetPxKey: -40});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getInt(UserPreferences.trickPlayVerticalPositionPercent.key),
        isNull,
      );
    });

    test('runs only once', () async {
      final store = await storeWith({migrationKey: true, legacyEnabledKey: false});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.containsKey(UserPreferences.trickPlayMode.key),
        isFalse,
      );
    });
  });
}
