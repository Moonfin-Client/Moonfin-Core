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
  const migrationKey = 'pref_trickplay_consolidation_v1';

  Future<PreferenceStore> storeWith(Map<String, Object> values) async {
    SharedPreferences.setMockInitialValues(values);
    final store = PreferenceStore();
    await store.init();
    return store;
  }

  group('trickplay preference migration', () {
    test('explicit legacy off becomes disabled', () async {
      final store = await storeWith({legacyEnabledKey: false});

      await migrateTrickplayPreferenceConsolidation(store);

      expect(
        store.getString(UserPreferences.trickPlayMode.key),
        TrickplayMode.disabled.name,
      );
      expect(store.getBool(migrationKey), isTrue);
    });

    test(
      'legacy on and an untouched toggle both leave the default alone',
      () async {
        for (final values in [
          <String, Object>{},
          {legacyEnabledKey: true},
        ]) {
          final store = await storeWith(values);

          await migrateTrickplayPreferenceConsolidation(store);

          expect(store.containsKey(UserPreferences.trickPlayMode.key), isFalse);
          expect(store.getBool(migrationKey), isTrue);
        }
      },
    );

    test('an existing new value is never overwritten', () async {
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

    test('runs only once', () async {
      final store = await storeWith({
        migrationKey: true,
        legacyEnabledKey: false,
      });

      await migrateTrickplayPreferenceConsolidation(store);

      expect(store.containsKey(UserPreferences.trickPlayMode.key), isFalse);
    });
  });
}
