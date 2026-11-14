import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester, Locale locale) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: playerSettingsScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('Player settings section header follows the app language', (
    tester,
  ) async {
    const italian = Locale('it');
    final l10n = lookupAppLocalizations(italian);
    expect(l10n.mediaPlayerBehavior, 'Comportamento del Lettore Media');

    await pump(tester, italian);

    expect(find.text('Comportamento del Lettore Media'), findsOneWidget);
    expect(find.text('Media Player Behavior'), findsNothing);
  });
}
