import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the swipe gestures start on so the player behaves as it always has',
      () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

    expect(prefs.get(UserPreferences.playerSwipeGestures), isTrue);
  });

  test('gesture indicator placement defaults to same side as swipe', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

    expect(
      prefs.get(UserPreferences.gestureIndicatorPlacement),
      equals(GestureIndicatorPlacement.same),
    );
  });

  test('gesture indicator placement can be set to inverted', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

    await prefs.set(
      UserPreferences.gestureIndicatorPlacement,
      GestureIndicatorPlacement.inverted,
    );

    expect(
      prefs.get(UserPreferences.gestureIndicatorPlacement),
      equals(GestureIndicatorPlacement.inverted),
    );
  });
}
