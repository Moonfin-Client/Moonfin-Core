import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Sync extends Mock implements PluginSyncService {}

class _Views extends Mock implements UserViewsRepository {}

AggregatedLibrary _library(String name, String type) => AggregatedLibrary(
  id: 'id-$name',
  name: name,
  collectionType: type,
  serverId: 'server',
);

void main() {
  late UserPreferences prefs;
  late _Sync sync;
  late AppLocalizations l10n;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance
      ..registerSingleton<PreferenceStore>(store)
      ..registerSingleton<UserPreferences>(prefs);

    sync = _Sync();
    when(() => sync.pluginAvailable).thenReturn(false);
    when(() => sync.seerrAvailable).thenReturn(true);
    when(() => sync.calendarAvailable).thenReturn(true);
    when(() => sync.calendarRemindersAvailable).thenReturn(true);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final views = _Views();
    when(() => views.getAllViewsIncludingHidden()).thenAnswer(
      (_) async => [
        _library('Films', 'movies'),
        _library('Shows', 'tvshows'),
        _library('Music', 'music'),
      ],
    );
    GetIt.instance.registerSingleton<UserViewsRepository>(views);

    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
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
        home: calendarSettingsScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('a phone with Seerr and reminders gets every setting', (
    tester,
  ) async {
    await pump(tester);
    for (final title in [
      l10n.calendarSettingsStyle,
      l10n.calendarSettingsWeekStart,
      l10n.calendarSettingsScope,
      l10n.episodes,
      l10n.movies,
      l10n.radarrCalendarShowCinema,
      l10n.libraries,
      l10n.calendarSettingsUnmonitored,
      l10n.calendarSettingsSpecials,
      l10n.calendarSettingsBadges,
      l10n.calendarSettingsColorBy,
      l10n.calendarSettingsImageType,
      l10n.calendarSettingsSpoilerSafe,
      l10n.calendarSettingsSelectAction,
      l10n.calendarSettingsRequestButton,
      l10n.calendarSettingsReminders,
    ]) {
      expect(find.text(title), findsOneWidget, reason: title);
    }
  });

  testWidgets('Request needs Seerr and Reminders need a phone and a server '
      'that sends them', (tester) async {
    when(() => sync.seerrAvailable).thenReturn(false);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await pump(tester);
    expect(find.text(l10n.calendarSettingsRequestButton), findsNothing);
    expect(find.text(l10n.calendarSettingsReminders), findsNothing);

    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
    when(() => sync.calendarRemindersAvailable).thenReturn(false);
    await tester.pumpWidget(const SizedBox());
    await pump(tester);
    expect(find.text(l10n.calendarSettingsReminders), findsNothing);
  });

  testWidgets('the release types go away with Movies', (tester) async {
    await pump(tester);
    await tester.tap(find.text(l10n.movies));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.calendarShowMovies), isFalse);
    expect(find.text(l10n.radarrCalendarShowCinema), findsNothing);
  });

  testWidgets('Libraries offers only movie and show libraries', (tester) async {
    await pump(tester);
    expect(find.text(l10n.allLibraries), findsOneWidget);
    await tester.tap(find.text(l10n.libraries));
    await tester.pumpAndSettle();
    expect(find.text('Films'), findsOneWidget);
    expect(find.text('Shows'), findsOneWidget);
    expect(find.text('Music'), findsNothing);
  });

  testWidgets('a TV lands on the first setting and the D-pad moves on', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await pump(tester);
    expect(FocusManager.instance.primaryFocus?.debugLabel, 'calendar_style');

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      'EnumPreferenceTile_pref_calendar_week_start',
    );
    // Reminders are phone only, so a TV never lists them.
    expect(find.text(l10n.calendarSettingsReminders), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });
}
