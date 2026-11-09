import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/media_segment.dart';
import 'package:moonfin/data/utils/media_segment_actions.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late UserPreferences prefs;
  late AppLocalizations l10n;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(prefs);
    l10n = lookupAppLocalizations(const Locale('en'));
  });

  tearDown(() async {
    debugDefaultTargetPlatformOverride = null;
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
        home: automationQueueScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('picking a segment action keeps the focus on its row and the '
      'other rows show the new value', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await pump(tester);

    final outro = find.text(
      l10n.settingsMediaSegmentTypeAction(MediaSegmentType.outro.displayName),
    );
    final row = Focus.of(tester.element(outro));
    row.requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.settingsSkip).last);
    await tester.pumpAndSettle();

    expect(
      parseMediaSegmentActions(
        prefs.get(UserPreferences.mediaSegmentActions),
      )[MediaSegmentType.outro],
      MediaSegmentAction.skip,
    );
    expect(FocusManager.instance.primaryFocus, same(row));
    expect(row.context, isNotNull);

    // The other rows still show their own action, and a pick on one of
    // them must not undo the first one.
    final intro = find.text(
      l10n.settingsMediaSegmentTypeAction(MediaSegmentType.intro.displayName),
    );
    expect(
      find.descendant(
        of: find.ancestor(of: intro, matching: find.byType(ListTile)),
        matching: find.text(l10n.settingsPromptUser),
      ),
      findsOneWidget,
    );
    await tester.tap(intro);
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.settingsDoNothing).last);
    await tester.pumpAndSettle();

    final actions = parseMediaSegmentActions(
      prefs.get(UserPreferences.mediaSegmentActions),
    );
    expect(actions[MediaSegmentType.intro], MediaSegmentAction.nothing);
    expect(actions[MediaSegmentType.outro], MediaSegmentAction.skip);
    debugDefaultTargetPlatformOverride = null;
  });
}
