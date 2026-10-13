import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('migrates active and inactive account UI preferences', () async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'server',
      'pref_last_user_id': 'viewer',
      'pref_language_override': 'pt',
      'pref_language_override_other_viewer': 'pt_BR',
      'pref_language_override_third_viewer': 'system',
      'pref_audio_language_server_viewer': 'por',
    });
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    expect(prefs.get(UserPreferences.languageOverride), 'pt-PT');
    expect(store.getString('pref_language_override_server_viewer'), 'pt-PT');
    expect(store.getString('pref_language_override_other_viewer'), 'pt-BR');
    expect(store.getString('pref_language_override_third_viewer'), 'system');
    expect(store.getString('pref_audio_language_server_viewer'), 'por');
    await prefs.set(UserPreferences.languageOverride, 'pt_BR');
    expect(store.getString('pref_language_override_server_viewer'), 'pt-BR');
    prefs.dispose();
  });
  test('preferences imported later also resolve canonically', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await store.setString('pref_language_override', 'pt');
    expect(prefs.get(UserPreferences.languageOverride), 'pt-PT');
    await store.setString('pref_language_override', 'pt_BR');
    expect(prefs.get(UserPreferences.languageOverride), 'pt-BR');
    prefs.dispose();
  });
}
