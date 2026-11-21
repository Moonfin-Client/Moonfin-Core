import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late UserPreferences prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(prefs);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1000, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: librariesSettingsScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
  }

  const mergeTitle = 'Merge Movie and TV Show Libraries';

  SwitchPreferenceTile mergeTile(WidgetTester tester) => tester.widget(
    find.ancestor(
      of: find.text(mergeTitle),
      matching: find.byType(SwitchPreferenceTile),
    ),
  );

  testWidgets('is off and disabled until multi-server libraries are on', (
    tester,
  ) async {
    await pump(tester);

    expect(prefs.get(UserPreferences.enableMultiServerLibraries), isFalse);
    expect(prefs.get(UserPreferences.mergeLibrariesByType), isFalse);
    expect(mergeTile(tester).enabled, isFalse);

    await tester.tap(find.text(mergeTitle));
    await tester.pumpAndSettle();

    expect(prefs.get(UserPreferences.mergeLibrariesByType), isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('is enabled with multi-server libraries, and keeps its value '
      'when they are turned off', (tester) async {
    await pump(tester);

    await prefs.set(UserPreferences.enableMultiServerLibraries, true);
    await tester.pumpAndSettle();
    expect(mergeTile(tester).enabled, isTrue);

    await tester.tap(find.text(mergeTitle));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.mergeLibrariesByType), isTrue);

    // Its value is kept for when multi-server libraries are turned on again.
    await prefs.set(UserPreferences.enableMultiServerLibraries, false);
    await tester.pumpAndSettle();
    expect(mergeTile(tester).enabled, isFalse);
    expect(prefs.get(UserPreferences.mergeLibrariesByType), isTrue);
    expect(tester.takeException(), isNull);
  });
}
