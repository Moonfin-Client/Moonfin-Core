import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/providers/offline_providers.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/download_settings_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    PlatformDetection.setTvMode(true);
  });

  tearDown(() async {
    PlatformDetection.setTvMode(false);
    await GetIt.instance.reset();
  });

  testWidgets('uses the standard settings subsection header on TV', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageUsedProvider.overrideWith((_) => Stream.value(0))],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const DownloadSettingsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.automaticallyImplyLeading, isFalse);
    expect(appBar.leading, isA<SizedBox>());
    expect(appBar.scrolledUnderElevation, 0);
    expect(find.text('Storage & Downloads'), findsOneWidget);
  });

  testWidgets('TV offers the offline downloads opt-in as the first row', (
    tester,
  ) async {
    final prefs = GetIt.instance<UserPreferences>();
    expect(prefs.get(UserPreferences.tvOfflineDownloads), isFalse);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageUsedProvider.overrideWith((_) => Stream.value(0))],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const DownloadSettingsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // The initial focus grab scrolls the TV list to its end; the opt-in
    // lives at the top, so scroll back before asserting.
    await tester.drag(find.byType(Scrollable), const Offset(0, 800));
    await tester.pumpAndSettle();

    final toggle = find.text('Enable Offline Downloads');
    expect(toggle, findsOneWidget);

    await tester.tap(toggle);
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.tvOfflineDownloads), isTrue);
  });

  testWidgets('non-TV platforms never see the opt-in toggle', (tester) async {
    PlatformDetection.setTvMode(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageUsedProvider.overrideWith((_) => Stream.value(0))],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const DownloadSettingsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Enable Offline Downloads'), findsNothing);
  });

  testWidgets('TV quality picker scrolls focused options into view', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final openerKey = GlobalKey();
    final prefs = GetIt.instance<UserPreferences>();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: SizedBox(key: openerKey)),
      ),
    );

    DownloadSettingsScreen.showQualityPicker(
      openerKey.currentContext!,
      prefs,
      'original',
    );
    await tester.pumpAndSettle();

    final scrollable = tester.state<ScrollableState>(find.byType(Scrollable));
    expect(scrollable.position.maxScrollExtent, greaterThan(0));

    for (var i = 0; i < 4; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
    }

    final lastOption = find.text('Mobile (360p)');
    expect(Focus.of(tester.element(lastOption)).hasFocus, isTrue);
    expect(scrollable.position.pixels, greaterThan(0));
    expect(tester.getBottomLeft(lastOption).dy, lessThan(360));

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(
      prefs.get(UserPreferences.defaultDownloadQuality),
      'mobile360p',
    );
  });

  testWidgets('TV storage limit picker scrolls focused options into view', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    final openerKey = GlobalKey();
    final prefs = GetIt.instance<UserPreferences>();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: SizedBox(key: openerKey)),
      ),
    );

    final openerContext = openerKey.currentContext!;
    final lastLabel = AppLocalizations.of(openerContext).gbValue('100');
    DownloadSettingsScreen.showStorageLimitPicker(openerContext, prefs, 0);
    await tester.pumpAndSettle();

    final scrollable = tester.state<ScrollableState>(find.byType(Scrollable));
    expect(scrollable.position.maxScrollExtent, greaterThan(0));

    for (var i = 0; i < 7; i++) {
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
    }

    final lastOption = find.text(lastLabel);
    expect(Focus.of(tester.element(lastOption)).hasFocus, isTrue);
    expect(scrollable.position.pixels, greaterThan(0));
    expect(tester.getBottomLeft(lastOption).dy, lessThan(540));

    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(
      prefs.get(UserPreferences.downloadStorageLimitMb),
      102400,
    );
  });
}
