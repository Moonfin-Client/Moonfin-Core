import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserPreferences> _prefs([Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('personal rating style defaults to thumbs', () async {
    final prefs = await _prefs();

    expect(
      prefs.get(UserPreferences.personalRatingStyle),
      PersonalRatingStyle.thumbs,
    );
  });

  test('personal rating style serializes as an enum name', () async {
    final prefs = await _prefs();
    await prefs.set(
      UserPreferences.personalRatingStyle,
      PersonalRatingStyle.numeric,
    );
    await prefs.flushPendingWrites();

    expect(
      prefs.get(UserPreferences.personalRatingStyle),
      PersonalRatingStyle.numeric,
    );
  });

  test('personal rating style is scoped by active server and user', () async {
    final prefs = await _prefs();
    await prefs.set(UserPreferences.lastServerId, 'server-1');
    await prefs.set(UserPreferences.lastUserId, 'user-1');
    await prefs.set(
      UserPreferences.personalRatingStyle,
      PersonalRatingStyle.stars,
    );

    await prefs.set(UserPreferences.lastServerId, 'server-2');
    await prefs.set(UserPreferences.lastUserId, 'user-2');

    expect(
      prefs.get(UserPreferences.personalRatingStyle),
      PersonalRatingStyle.thumbs,
    );
  });
}
