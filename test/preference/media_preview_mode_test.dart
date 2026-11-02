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

  test('settings from before the mode keep what they played', () async {
    final on = await prefsWith({'episodePreviewEnabled': true});
    final off = await prefsWith({'episodePreviewEnabled': false});

    expect(on.resolveMediaPreviewMode(), UserPreferences.mediaPreviewMedia);
    expect(off.resolveMediaPreviewMode(), UserPreferences.mediaPreviewOff);
  });

  test('the switch decides whether anything plays, the mode which kind', () async {
    final prefs = await prefsWith({
      'episodePreviewEnabled': true,
      'mediaPreviewMode': 'trailer',
    });
    expect(prefs.resolveMediaPreviewMode(), UserPreferences.mediaPreviewTrailer);

    await prefs.set(UserPreferences.episodePreviewEnabled, false);
    expect(prefs.resolveMediaPreviewMode(), UserPreferences.mediaPreviewOff);
  });

  test('the stored mode is brought in line with the switch', () async {
    final turnedOff = await prefsWith({
      'episodePreviewEnabled': false,
      'mediaPreviewMode': 'trailer',
    });
    await turnedOff.reconcileMediaPreviewMode();
    expect(turnedOff.get(UserPreferences.mediaPreviewMode), 'off');

    // An app that only knows the switch turned previews back on.
    final turnedOn = await prefsWith({
      'episodePreviewEnabled': true,
      'mediaPreviewMode': 'off',
    });
    await turnedOn.reconcileMediaPreviewMode();
    expect(turnedOn.get(UserPreferences.mediaPreviewMode), 'media');
  });
}
