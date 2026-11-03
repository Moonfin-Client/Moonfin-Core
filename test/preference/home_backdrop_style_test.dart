import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<UserPreferences> prefsWith(Map<String, Object> values) async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'server1',
      'pref_last_user_id': 'user1',
      for (final MapEntry(:key, :value) in values.entries)
        '${key}_server1_user1': value,
    });
    final store = PreferenceStore();
    await store.init();
    return UserPreferences(store);
  }

  test('settings from before the style keep a full screen backdrop', () async {
    final on = await prefsWith({'pref_show_home_backdrop': true});
    final off = await prefsWith({'pref_show_home_backdrop': false});

    expect(on.resolveHomeBackdropStyle(), UserPreferences.homeBackdropFullScreen);
    expect(off.resolveHomeBackdropStyle(), UserPreferences.homeBackdropOff);
  });

  test('the switch decides whether there is a backdrop, the style where', () async {
    final prefs = await prefsWith({
      'pref_show_home_backdrop': true,
      'pref_home_backdrop_style': 'corner',
    });
    expect(prefs.resolveHomeBackdropStyle(), UserPreferences.homeBackdropCorner);

    await prefs.set(UserPreferences.homeBackdropStyle, 'top');
    expect(prefs.resolveHomeBackdropStyle(), UserPreferences.homeBackdropTop);

    await prefs.set(UserPreferences.homeBackdropEnabled, false);
    expect(prefs.resolveHomeBackdropStyle(), UserPreferences.homeBackdropOff);
  });

  test('a style this app doesnt know fills the screen', () async {
    final prefs = await prefsWith({
      'pref_show_home_backdrop': true,
      'pref_home_backdrop_style': 'something new',
    });
    expect(prefs.resolveHomeBackdropStyle(), UserPreferences.homeBackdropFullScreen);
  });

  test('the stored style is brought in line with the switch', () async {
    final turnedOff = await prefsWith({
      'pref_show_home_backdrop': false,
      'pref_home_backdrop_style': 'corner',
    });
    await turnedOff.reconcileHomeBackdropStyle();
    expect(turnedOff.get(UserPreferences.homeBackdropStyle), 'off');

    // Another app synced the switch back on.
    final turnedOn = await prefsWith({
      'pref_show_home_backdrop': true,
      'pref_home_backdrop_style': 'off',
    });
    await turnedOn.reconcileHomeBackdropStyle();
    expect(turnedOn.get(UserPreferences.homeBackdropStyle), 'fullScreen');
  });
}
