import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/settings/multi_select_dialog.dart';
import 'package:moonfin/ui/widgets/settings/preference_tiles.dart';
import 'package:moonfin/util/idiom/app_ui_idiom.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Issue #1283: the subtitle download languages checklist keeps the pick order,
// caps how many can be ticked and keeps Save within reach.
void main() {
  late PreferenceStore store;

  setUp(() async {
    SharedPreferences.setMockInitialValues(const <String, Object>{});
    store = PreferenceStore();
    await store.init();
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  String stored() => store.get(UserPreferences.subtitleDownloadLanguages);

  Future<void> pumpTile(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: MultiSelectPreferenceTile(
            preference: UserPreferences.subtitleDownloadLanguages,
            title: 'Languages',
            options: const {
              'eng': 'English',
              'ger': 'German',
              'hrv': 'Croatian',
            },
            emptyLabel: 'Auto',
            maxSelected: 2,
          ),
        ),
      ),
    );
  }

  Future<void> open(WidgetTester tester) async {
    await tester.tap(find.text('Languages'));
    await tester.pumpAndSettle();
  }

  Future<void> tick(WidgetTester tester, String label) async {
    await tester.tap(
      find.descendant(
        of: find.byType(Dialog),
        matching: find.text(label),
      ),
    );
    await tester.pump();
  }

  testWidgets('saves the picks in the order they were made', (tester) async {
    await pumpTile(tester);
    expect(find.text('Auto'), findsOneWidget);

    await open(tester);
    await tick(tester, 'Croatian');
    await tick(tester, 'English');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(stored(), 'hrv,eng');
    expect(find.text('Croatian, English'), findsOneWidget);
  });

  testWidgets('a third pick past the cap is ignored', (tester) async {
    await pumpTile(tester);
    await open(tester);
    await tick(tester, 'English');
    await tick(tester, 'German');
    await tick(tester, 'Croatian');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(stored(), 'eng,ger');
  });

  testWidgets('picked rows lead the list under Save', (tester) async {
    await store.set(UserPreferences.subtitleDownloadLanguages, 'hrv');
    await pumpTile(tester);
    await open(tester);

    double top(String label) => tester
        .getCenter(
          find.descendant(
            of: find.byType(Dialog),
            matching: find.text(label),
          ),
        )
        .dy;
    expect(top('Save'), lessThan(top('Croatian')));
    expect(top('Croatian'), lessThan(top('English')));
    expect(top('English'), lessThan(top('German')));
  });

  testWidgets('the top row fits a phone in a longer language', (tester) async {
    tester.view.physicalSize = const Size(360, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => showMultiSelectDialog(
              context: context,
              title: 'Bibliothèques',
              items: const {'a': 'Films', 'b': 'Séries'},
              selected: const {},
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Tout sélectionner'), findsOneWidget);
    expect(find.text('Enregistrer'), findsOneWidget);
  });

  testWidgets('a long list fills the Apple dialog', (tester) async {
    AppUiIdiomResolver.setOverride(InterfaceStyle.apple);
    addTearDown(() => AppUiIdiomResolver.setOverride(InterfaceStyle.automatic));
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    Set<String>? result;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(platform: TargetPlatform.iOS),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async => result = await showMultiSelectDialog(
              context: context,
              title: 'Source Libraries',
              items: {for (var i = 10; i < 40; i++) '$i': 'Library $i'},
              selected: const {},
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(CupertinoAlertDialog), findsOneWidget);
    expect(
      tester.getSize(find.byType(CupertinoAlertDialog)).height,
      greaterThan(600),
    );
    await tester.ensureVisible(find.text('Library 39'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Library 39'));
    await tester.pump();
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(result, {'39'});
  });

  testWidgets('cancel leaves the setting alone', (tester) async {
    await pumpTile(tester);
    await open(tester);
    await tick(tester, 'German');
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(stored(), '');
  });
}
