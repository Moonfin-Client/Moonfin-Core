import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/services/achievements_service.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/saved_media_presence.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/syncplay/syncplay_manager.dart';
import 'package:moonfin/ui/screens/settings/settings_side_panel.dart';
import 'package:moonfin/ui/screens/setup/setup_wizard_previews.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Sync extends Mock implements PluginSyncService {}

class _Seerr extends Mock implements SeerrPreferences {}

class _Achievements extends Mock implements AchievementsService {}

class _Users extends Mock implements UserRepository {}

class _SyncPlay extends Mock implements SyncPlayManager {}

class _WatchParty extends Mock implements SiloWatchPartyManager {}

class _Saved extends Mock implements SavedMediaPresence {}

// The Navigation Bar screen offers a button's switch wherever the navbar
// could show that button.
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

    final sync = _Sync();
    when(() => sync.seerrAvailable).thenReturn(false);
    when(() => sync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
    final seerr = _Seerr();
    when(() => seerr.enabled).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerr);
    final achievements = _Achievements();
    when(() => achievements.socialAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<AchievementsService>(achievements);

    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    l10n = lookupAppLocalizations(const Locale('en'));
  });

  tearDown(() async {
    SetupPreviewData.libraries.value = const [];
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  void signIn({required bool canDownload}) {
    final users = _Users();
    when(() => users.currentUser).thenReturn(
      PrivateUser(
        id: 'user',
        name: 'moonfin',
        serverId: 'server',
        accessToken: 'token',
        lastUsed: DateTime(2026),
        canDownload: canDownload,
      ),
    );
    GetIt.instance.registerSingleton<UserRepository>(users);
  }

  AggregatedLibrary library(String name, String type) => AggregatedLibrary(
    id: name,
    name: name,
    collectionType: type,
    serverId: 'server',
  );

  Future<void> pump(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1000, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: navigationSettingsScreenForTesting(),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('Live TV is offered once a Live TV library turns up', (
    tester,
  ) async {
    signIn(canDownload: true);
    SetupPreviewData.libraries.value = [library('Films', 'movies')];
    await pump(tester);
    expect(find.text(l10n.showLiveTvButton), findsNothing);

    SetupPreviewData.libraries.value = [
      library('Films', 'movies'),
      library('Live TV', 'livetv'),
    ];
    await tester.pumpAndSettle();
    expect(find.text(l10n.showLiveTvButton), findsOneWidget);
  });

  testWidgets('SyncPlay is offered only while it is on', (
    tester,
  ) async {
    signIn(canDownload: true);
    await pump(tester);
    expect(find.text(l10n.settingsSyncplayButton), findsNothing);

    await prefs.set(UserPreferences.syncPlayEnabled, true);
    await tester.pumpAndSettle();
    expect(find.text(l10n.settingsSyncplayButton), findsOneWidget);
  });

  testWidgets('SyncPlay stays offered on a server that can\'t run it', (
    tester,
  ) async {
    signIn(canDownload: true);
    await prefs.set(UserPreferences.syncPlayEnabled, true);
    final syncPlay = _SyncPlay();
    when(() => syncPlay.syncPlayConfigured).thenReturn(true);
    when(() => syncPlay.syncPlayEnabled).thenReturn(false);
    GetIt.instance.registerSingleton<SyncPlayManager>(syncPlay);
    final watchParty = _WatchParty();
    when(() => watchParty.activeSiloClient).thenReturn(null);
    GetIt.instance.registerSingleton<SiloWatchPartyManager>(watchParty);
    await pump(tester);
    // The navbar still shows the button there, so the switch has to stay.
    expect(find.text(l10n.settingsSyncplayButton), findsOneWidget);
  });

  testWidgets('Downloads is offered only where this user can download', (
    tester,
  ) async {
    signIn(canDownload: false);
    await pump(tester);
    expect(find.text(l10n.showDownloadsButton), findsNothing);

    await GetIt.instance.unregister<UserRepository>();
    signIn(canDownload: true);
    await tester.pumpWidget(const SizedBox());
    await pump(tester);
    expect(find.text(l10n.showDownloadsButton), findsOneWidget);
  });

  testWidgets('Downloads stays offered while something is saved', (
    tester,
  ) async {
    signIn(canDownload: false);
    final saved = _Saved();
    when(() => saved.hasSavedMedia).thenReturn(true);
    GetIt.instance.registerSingleton<SavedMediaPresence>(saved);
    await pump(tester);
    expect(find.text(l10n.showDownloadsButton), findsOneWidget);
  });

  testWidgets('a TV offers Downloads once offline downloads are on', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    signIn(canDownload: true);
    await pump(tester);
    expect(find.text(l10n.showDownloadsButton), findsNothing);

    await prefs.set(UserPreferences.tvOfflineDownloads, true);
    await tester.pumpAndSettle();
    expect(find.text(l10n.showDownloadsButton), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });
}
