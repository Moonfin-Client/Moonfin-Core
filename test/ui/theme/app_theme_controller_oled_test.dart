import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/theme/app_theme.dart' as theming;
import 'package:moonfin/ui/theme/app_theme_controller.dart';
import 'package:moonfin/ui/theme/vibrance.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _black = Color(0xFF000000);

Future<UserPreferences> _prefs() async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'pref_last_server_id': 'srv1',
    'pref_last_user_id': 'usr1',
  });
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    ThemeRegistry.setOledTuning(OledTuning.off);
    Vibrance.apply(OledTuning.off);
  });

  test('defaults to off, leaving the chosen theme untouched', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);
    final authored = ThemeRegistry.resolveById(controller.activeSpec.id);

    expect(controller.activeSpec.colors.background, authored.colors.background);
    expect(Vibrance.filter.value, isNull);
  });

  test('a cold start with the preference already set is crushed on frame one',
      () async {
    final prefs = await _prefs();
    await prefs.set(UserPreferences.oledMode, OledMode.vivid);

    final controller = AppThemeController.fromPreferences(prefs);

    expect(controller.activeSpec.colors.background, _black);
    expect(Vibrance.filter.value, isNotNull);
  });

  test('toggling the preference notifies and re-derives the spec', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);
    var notifications = 0;
    controller.addListener(() => notifications++);

    await prefs.set(UserPreferences.oledMode, OledMode.vivid);
    // The app wires this to the UserPreferences listener.
    controller.refreshFromPreferences(prefs);

    // The toggle changes no theme id, so this catches _apply guarding on the
    // id alone and skipping the work.
    expect(notifications, 1);
    expect(controller.activeSpec.colors.background, _black);
    expect(Vibrance.filter.value, isNotNull);
  });

  test('switching back to off restores the authored palette', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);
    final authored = ThemeRegistry.resolveById(controller.activeSpec.id);

    await prefs.set(UserPreferences.oledMode, OledMode.vivid);
    controller.refreshFromPreferences(prefs);
    expect(controller.activeSpec.colors.background, _black);

    await prefs.set(UserPreferences.oledMode, OledMode.off);
    controller.refreshFromPreferences(prefs);

    expect(controller.activeSpec.colors.background, authored.colors.background);
    expect(Vibrance.filter.value, isNull);
  });

  test('the static AppColorScheme path sees the crushed colours too', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);

    await prefs.set(UserPreferences.oledMode, OledMode.vivid);
    controller.refreshFromPreferences(prefs);

    // Plenty of widgets read colours statically instead of via Theme.of.
    expect(AppColorScheme.background, _black);
    expect(AppColorScheme.surface, _black);
  });

  test('the built ThemeData carries the crushed scaffold and card', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);

    await prefs.set(UserPreferences.oledMode, OledMode.vivid);
    controller.refreshFromPreferences(prefs);
    final theme = theming.AppTheme.buildTheme(controller.activeSpec);

    expect(theme.scaffoldBackgroundColor, _black);
    // Cards read from the fixed palette until this feature, so they are the
    // easiest thing to leave behind as grey slabs.
    expect(theme.cardTheme.color, _black);
  });

  test('changing theme while OLED is on keeps the crush applied', () async {
    final prefs = await _prefs();
    final controller = AppThemeController.fromPreferences(prefs);

    await prefs.set(UserPreferences.oledMode, OledMode.vivid);
    controller.refreshFromPreferences(prefs);

    await controller.applyThemeSelection(prefs, VisualThemeId.neonPulse);

    expect(controller.activeThemeId, VisualThemeId.neonPulse);
    expect(controller.activeSpec.colors.background, _black);
  });
}
