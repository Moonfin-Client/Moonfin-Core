import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:moonfin/ui/screens/settings/home_row_toggles_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockHomeViewModel extends Mock implements HomeViewModel {}

class _MockSyncService extends Mock implements PluginSyncService {}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockUsersApi extends Mock implements UsersApi {}

// Returning to Home from settings only refreshes Continue Watching and Next Up,
// so a setting that changes Home's rows has to reload Home itself, like the
// sort pickers do.
void main() {
  late UserPreferences prefs;
  late _MockHomeViewModel home;
  late _MockSyncService sync;

  setUpAll(() {
    registerFallbackValue(const UserConfiguration());
  });

  setUp(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    sync = _MockSyncService();
    when(() => sync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    home = _MockHomeViewModel();
    when(() => home.load(preserveExisting: any(named: 'preserveExisting')))
        .thenAnswer((_) async {});
    GetIt.instance.registerSingleton<HomeViewModel>(home);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 8000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeRowTogglesScreen(),
      ),
    );
    await tester.pumpAndSettle();
  }

  final toggles = {
    'Display Audio Rows': UserPreferences.displayAudioRows,
    'Display Collections Rows': UserPreferences.displayCollectionsRows,
    'Display Favorites Rows': UserPreferences.displayFavoritesRows,
    'Display Genres Rows': UserPreferences.displayGenresRows,
    'Display Playlist Rows': UserPreferences.displayPlaylistsRows,
  };

  for (final MapEntry(key: title, value: preference) in toggles.entries) {
    testWidgets('$title reloads Home when turned on and off', (tester) async {
      await prefs.set(preference, false);
      await pump(tester);

      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(prefs.get(preference), isTrue);
      verify(() => home.load(preserveExisting: false)).called(1);

      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(prefs.get(preference), isFalse);
      verify(() => home.load(preserveExisting: false)).called(1);
    });
  }

  testWidgets('Hide Watched and Hide Upgrades reload Home', (tester) async {
    await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
    await prefs.set(UserPreferences.hideUpgradesInRecentRows, false);
    await pump(tester);

    expect(find.text('RECENTLY ADDED AND RELEASED'), findsOneWidget);

    await tester.tap(find.text('Hide Watched'));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isTrue);
    verify(() => home.load(preserveExisting: false)).called(1);
    clearInteractions(home);

    await tester.tap(find.text('Hide Upgrades'));
    await tester.pumpAndSettle();
    expect(prefs.get(UserPreferences.hideUpgradesInRecentRows), isTrue);
    verify(() => home.load(preserveExisting: false)).called(1);
  });

  testWidgets(
    'Hide Watched and Hide Upgrades sync with server when plugin is available',
    (tester) async {
      await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
      await prefs.set(UserPreferences.hideUpgradesInRecentRows, false);

      final client = _MockMediaServerClient();
      final usersApi = _MockUsersApi();
      when(() => client.usersApi).thenReturn(usersApi);
      when(() => usersApi.getUserConfiguration()).thenAnswer(
        (_) async => const UserConfiguration(hidePlayedInLatest: false),
      );
      when(
        () => usersApi.updateUserConfiguration(any()),
      ).thenAnswer((_) async {});
      GetIt.instance.registerSingleton<MediaServerClient>(client);

      when(() => sync.pluginAvailable).thenReturn(true);
      when(() => sync.pushSettings(client)).thenAnswer((_) async {});
      when(
        () => sync.pushHideUpgradesPreference(client),
      ).thenAnswer((_) async {});

      await pump(tester);

      // Update branch: server returns hidePlayedInLatest: false while user enables Hide Watched.
      await tester.tap(find.text('Hide Watched'));
      await tester.pumpAndSettle();
      expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isTrue);
      verify(() => usersApi.getUserConfiguration()).called(1);
      verify(
        () => usersApi.updateUserConfiguration(
          any(
            that: isA<UserConfiguration>().having(
              (c) => c.hidePlayedInLatest,
              'hidePlayedInLatest',
              isTrue,
            ),
          ),
        ),
      ).called(1);
      verify(() => home.load(preserveExisting: false)).called(2);
      clearInteractions(usersApi);
      clearInteractions(home);

      // No-update branch: server already matches the new preference value (false).
      await tester.tap(find.text('Hide Watched'));
      await tester.pumpAndSettle();
      expect(prefs.get(UserPreferences.hideWatchedInRecentRows), isFalse);
      verify(() => usersApi.getUserConfiguration()).called(1);
      verifyNever(() => usersApi.updateUserConfiguration(any()));
      verify(() => home.load(preserveExisting: false)).called(1);
      clearInteractions(home);

      await tester.tap(find.text('Hide Upgrades'));
      await tester.pumpAndSettle();
      expect(prefs.get(UserPreferences.hideUpgradesInRecentRows), isTrue);
      verify(() => sync.pushHideUpgradesPreference(client)).called(1);
      verify(() => home.load(preserveExisting: false)).called(1);
    },
  );

  testWidgets('Merge Recent Rows by Type reloads Home', (tester) async {
    await prefs.set(UserPreferences.mergeRecentRowsByType, false);
    await pump(tester);

    await tester.tap(find.text('Merge Recent Rows by Type'));
    await tester.pumpAndSettle();

    expect(prefs.get(UserPreferences.mergeRecentRowsByType), isTrue);
    verify(() => home.load(preserveExisting: false)).called(1);
  });

  testWidgets('Recently Released Series Sort By reloads Home', (tester) async {
    await prefs.set(
      UserPreferences.recentlyReleasedSeriesType,
      RecentlyReleasedSeriesType.series,
    );
    await pump(tester);

    await tester.tap(find.text('Recently Released Series Sort By'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Season').last);
    await tester.pumpAndSettle();

    expect(
      prefs.get(UserPreferences.recentlyReleasedSeriesType),
      RecentlyReleasedSeriesType.season,
    );
    verify(() => home.load(preserveExisting: false)).called(1);
  });
}
