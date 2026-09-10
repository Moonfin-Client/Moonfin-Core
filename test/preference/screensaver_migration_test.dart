import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The retired screensaver settings are stored per server, so a signed in user
// keeps them under a scoped key and the bare one is already gone. A migration
// that reads the bare key finds nothing and silently resets the screensaver.
Future<UserPreferences> _prefsWith(Map<String, Object> values) async {
  SharedPreferences.setMockInitialValues(values);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

const _scope = <String, Object>{
  'pref_last_server_id': 'srv1',
  'pref_last_user_id': 'usr1',
};

void main() {
  group('screensaver settings migration', () {
    test('a scoped bouncing logo becomes a black backdrop and logo component',
        () async {
      final prefs = await _prefsWith({
        ..._scope,
        'pref_screensaver_mode_srv1_usr1': 'logo',
      });

      expect(prefs.get(UserPreferences.screensaverBackdrop),
          ScreensaverBackdrop.black);
      expect(prefs.get(UserPreferences.screensaverComponent),
          ScreensaverComponent.moonfinLogo);
      expect(prefs.get(UserPreferences.screensaverMovement),
          ScreensaverMovement.fast);
    });

    test('a scoped static clock keeps its corner rather than bouncing',
        () async {
      final prefs = await _prefsWith({
        ..._scope,
        'pref_screensaver_clock_mode_srv1_usr1': 'staticCorner',
      });

      expect(prefs.get(UserPreferences.screensaverComponent),
          ScreensaverComponent.clock);
      expect(prefs.get(UserPreferences.screensaverMovement),
          ScreensaverMovement.staticCorner);
    });

    test('a scoped clock set to off leaves no component at all', () async {
      // The new default is a logo, so an untouched migration would hand this
      // user a component they had explicitly turned off.
      final prefs = await _prefsWith({
        ..._scope,
        'pref_screensaver_mode_srv1_usr1': 'library',
        'pref_screensaver_clock_mode_srv1_usr1': 'off',
      });

      expect(prefs.get(UserPreferences.screensaverBackdrop),
          ScreensaverBackdrop.library);
      expect(prefs.get(UserPreferences.screensaverComponent),
          ScreensaverComponent.none);
    });

    test('an unscoped value still migrates when no server is active',
        () async {
      final prefs = await _prefsWith({'pref_screensaver_mode': 'logo'});

      expect(prefs.get(UserPreferences.screensaverBackdrop),
          ScreensaverBackdrop.black);
      expect(prefs.get(UserPreferences.screensaverComponent),
          ScreensaverComponent.moonfinLogo);
    });

    test('a fresh install keeps the new defaults', () async {
      final prefs = await _prefsWith(_scope);

      expect(prefs.get(UserPreferences.screensaverBackdrop),
          ScreensaverBackdrop.library);
      expect(prefs.get(UserPreferences.screensaverComponent),
          ScreensaverComponent.moonfinLogo);
    });

    test('an existing choice is never overwritten by the migration', () async {
      final prefs = await _prefsWith({
        ..._scope,
        'pref_screensaver_mode_srv1_usr1': 'logo',
        'pref_screensaver_backdrop_srv1_usr1': 'aurora',
      });

      expect(prefs.get(UserPreferences.screensaverBackdrop),
          ScreensaverBackdrop.aurora);
    });
  });
}
