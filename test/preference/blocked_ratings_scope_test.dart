import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/synced_fields.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<PreferenceStore> _store([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return store;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const signedIn = {
    'pref_last_server_id': 'server1',
    'pref_last_user_id': 'user1',
  };
  const scopedKey = 'blocked_ratings_server1_user1';

  group('blocked ratings', () {
    test('a saved list lands where the filter reads it', () async {
      final store = await _store(signedIn);
      final prefs = UserPreferences(store);

      await prefs.set(UserPreferences.blockedParentalRatings, 'R,TV-MA');

      expect(store.getString(scopedKey), 'R,TV-MA');
      expect(prefs.get(UserPreferences.blockedParentalRatings), 'R,TV-MA');
    });

    test('an existing list is adopted and the shared copy dropped', () async {
      // A list saved against the shared key is handed to the profile that is
      // signed in, so nobody loses the ratings they picked.
      final store = await _store({...signedIn, 'blocked_ratings': 'R'});
      final prefs = UserPreferences(store);

      expect(prefs.get(UserPreferences.blockedParentalRatings), 'R');
      expect(store.containsKey('blocked_ratings'), isFalse);
    });

    test('a saved list survives a restart', () async {
      final store = await _store(signedIn);
      await UserPreferences(store).set(
        UserPreferences.blockedParentalRatings,
        'NC-17',
      );

      expect(
        UserPreferences(store).get(UserPreferences.blockedParentalRatings),
        'NC-17',
      );
    });

    test('a second profile starts from nothing blocked', () async {
      // Documented rather than desired. The adoption hands the list to one
      // profile, so anyone else on the device starts clear.
      final store = await _store({...signedIn, scopedKey: 'R'});
      final prefs = UserPreferences(store);
      await store.setString('pref_last_user_id', 'user2');

      expect(prefs.get(UserPreferences.blockedParentalRatings), isEmpty);
    });

    test('a write while signed out does not land in a profile', () async {
      final store = await _store();
      final prefs = UserPreferences(store);

      await prefs.set(UserPreferences.blockedParentalRatings, 'R');

      expect(store.getString('blocked_ratings'), 'R');
      expect(store.containsKey(scopedKey), isFalse);
    });

    test('it is stored per server and user', () async {
      final store = await _store(signedIn);
      final prefs = UserPreferences(store);

      final effective = prefs.getEffectivePreference(
        UserPreferences.blockedParentalRatings,
      );

      expect(effective.key, isNot(UserPreferences.blockedParentalRatings.key));
    });

    test("isn't synced to the server", () async {
      // Syncing it would push the lockdown from the child's TV onto the
      // parent's own phone.
      expect(
        syncedFields.any(
          (f) => f.pref == UserPreferences.blockedParentalRatings,
        ),
        isFalse,
      );
    });

    test('the remembered series list is scoped the same way', () async {
      final store = await _store(signedIn);
      final prefs = UserPreferences(store);

      await prefs.set(UserPreferences.blockedSeriesIds, 'series-1');

      expect(store.getString('blocked_series_ids_server1_user1'), 'series-1');
    });
  });
}
