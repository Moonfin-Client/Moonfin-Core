import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Profile switch stale configuration race protection', () {
    test('delayed response from profile A does not seed profile B preference', () async {
      SharedPreferences.setMockInitialValues({
        'pref_last_server_id': 'server1',
        'pref_last_user_id': 'userA',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      expect(prefs.activeProfileScopeSuffix(), 'server1_userA');

      // User initiates refresh under profile A.
      final originatingScope = prefs.activeProfileScopeSuffix();
      expect(originatingScope, 'server1_userA');

      // User switches to profile B while the request is in flight.
      await store.setString('pref_last_user_id', 'userB');
      expect(prefs.activeProfileScopeSuffix(), 'server1_userB');

      // Profile A's response returns with hidePlayedInLatest: true.
      const configA = UserConfiguration(hidePlayedInLatest: true);
      prefs.initLanguagePrefs(configA, expectedProfileScope: originatingScope);

      // Verify profile B was not seeded with profile A's setting.
      expect(prefs.containsPreference(UserPreferences.hideWatchedInRecentRows, scopedOnly: true), isFalse);
      expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isFalse);
    });

    test('seedHideWatchedFromServer discards when expectedProfileScope does not match active profile', () async {
      SharedPreferences.setMockInitialValues({
        'pref_last_server_id': 'server1',
        'pref_last_user_id': 'userB',
      });
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);

      const configA = UserConfiguration(hidePlayedInLatest: true);
      prefs.seedHideWatchedFromServer(configA, expectedProfileScope: 'server1_userA');

      expect(prefs.containsPreference(UserPreferences.hideWatchedInRecentRows, scopedOnly: true), isFalse);
      expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isFalse);

      // But when expectedProfileScope matches active profile, it seeds successfully.
      prefs.seedHideWatchedFromServer(configA, expectedProfileScope: 'server1_userB');
      expect(prefs.containsPreference(UserPreferences.hideWatchedInRecentRows, scopedOnly: true), isTrue);
      expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isTrue);
    });
  });
}
