import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([
  Map<String, Object> initialValues = const {},
]) async {
  SharedPreferences.setMockInitialValues(initialValues);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('device backdrop override wins without changing profile preference', () async {
    final prefs = await _prefs();

    expect(prefs.get(UserPreferences.backdropEnabled), isTrue);
    expect(prefs.shouldShowBackdrops, isTrue);

    await prefs.set(UserPreferences.deviceBackdropsEnabled, false);

    expect(prefs.shouldShowBackdrops, isFalse);
    expect(prefs.get(UserPreferences.backdropEnabled), isTrue);

    await prefs.set(UserPreferences.deviceBackdropsEnabled, true);
    expect(prefs.shouldShowBackdrops, isTrue);
  });

  test('device screensaver override wins without changing profile preference', () async {
    final prefs = await _prefs();

    expect(prefs.get(UserPreferences.screensaverEnabled), isTrue);
    expect(prefs.shouldUseInAppScreensaver, isTrue);

    await prefs.set(UserPreferences.deviceScreensaverEnabled, false);

    expect(prefs.shouldUseInAppScreensaver, isFalse);
    expect(prefs.get(UserPreferences.screensaverEnabled), isTrue);

    await prefs.set(UserPreferences.deviceScreensaverEnabled, true);
    expect(prefs.shouldUseInAppScreensaver, isTrue);
  });

  test('device overrides remain active when the signed-in profile changes', () async {
    final prefs = await _prefs(const {
      'pref_last_server_id': 'server',
      'pref_last_user_id': 'user-one',
      'pref_show_backdrop_server_user-one': true,
      'pref_screensaver_enabled_server_user-one': true,
      'pref_show_backdrop_server_user-two': true,
      'pref_screensaver_enabled_server_user-two': true,
    });

    await prefs.set(UserPreferences.deviceBackdropsEnabled, false);
    await prefs.set(UserPreferences.deviceScreensaverEnabled, false);
    expect(prefs.shouldShowBackdrops, isFalse);
    expect(prefs.shouldUseInAppScreensaver, isFalse);

    await prefs.set(UserPreferences.lastUserId, 'user-two');
    expect(prefs.shouldShowBackdrops, isFalse);
    expect(prefs.shouldUseInAppScreensaver, isFalse);
    expect(
      prefs.getEffectivePreference(UserPreferences.deviceBackdropsEnabled).key,
      UserPreferences.deviceBackdropsEnabled.key,
    );
    expect(
      prefs
          .getEffectivePreference(UserPreferences.deviceScreensaverEnabled)
          .key,
      UserPreferences.deviceScreensaverEnabled.key,
    );
  });

  test('background service does not retain URLs while override is off', () async {
    final prefs = await _prefs();
    await prefs.set(UserPreferences.deviceBackdropsEnabled, false);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    final service = BackgroundService();

    service.setBackgroundUrl('https://example.invalid/backdrop.jpg');

    expect(service.currentUrl, isNull);
    service.dispose();
  });
}
