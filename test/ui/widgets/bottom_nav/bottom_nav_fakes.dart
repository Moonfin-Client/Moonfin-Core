import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeUserRepository extends Fake implements UserRepository {
  @override
  User? get currentUser => null;

  @override
  Stream<User?> get currentUserStream => const Stream.empty();
}

class _FakeUserViewsRepository extends ChangeNotifier
    implements UserViewsRepository {
  @override
  Future<List<AggregatedLibrary>> getUserViews() async => [];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakePluginSyncService extends ChangeNotifier
    implements PluginSyncService {
  @override
  bool get seerrAvailable => false;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeSessionRepository extends Fake implements SessionRepository {
  @override
  String? get activeUserId => null;
}

class _FakeGameLibraryRegistry extends Fake implements GameLibraryRegistry {
  @override
  Future<void> refresh() async {}
}

class FakePlaybackManager extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const testTrack = AggregatedItem(
  id: 'a1',
  serverId: 'srv',
  rawData: {'Id': 'a1', 'Name': 'A Song', 'Type': 'Audio'},
);

/// Registers what the bottom navbar reaches for, on a phone, with the bar
/// along the bottom in [style].
Future<({UserPreferences prefs, FakePlaybackManager playback})>
    setUpBottomNav({
  BottomNavbarStyle style = BottomNavbarStyle.dock,
}) async {
  SharedPreferences.setMockInitialValues({});
  final store = PreferenceStore();
  await store.init();
  final playback = FakePlaybackManager();
  final prefs = UserPreferences(store);
  final getIt = GetIt.instance;
  getIt.registerSingleton<PreferenceStore>(store);
  getIt.registerSingleton<UserPreferences>(prefs);
  getIt.registerSingleton<UserRepository>(_FakeUserRepository());
  getIt.registerSingleton<UserViewsRepository>(_FakeUserViewsRepository());
  getIt.registerSingleton<PluginSyncService>(_FakePluginSyncService());
  getIt.registerSingleton<SeerrPreferences>(
    SeerrPreferences(store, _FakeSessionRepository()),
  );
  getIt.registerSingleton<GameLibraryRegistry>(_FakeGameLibraryRegistry());
  getIt.registerSingleton<PlaybackManager>(playback);
  getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
  PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
  ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  await prefs.set(UserPreferences.navbarPosition, NavbarPosition.bottom);
  await prefs.set(UserPreferences.bottomNavbarStyle, style);
  return (prefs: prefs, playback: playback);
}

Future<void> tearDownBottomNav() async {
  PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
  ThemeRegistry.setActiveById(ThemeRegistry.moonfinId);
  NavigationLayout.chromeFocusRoots.clear();
  await GetIt.instance.reset();
}

void usePhoneView(WidgetTester tester, {Size size = const Size(390, 844)}) {
  tester.view.physicalSize = size * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

Widget bottomNavApp({
  bool chrome = true,
  String? activeRoute = '/home',
  Widget child = const SizedBox.expand(),
}) =>
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: NavigationLayout(
          activeRoute: activeRoute,
          showNavigationChrome: chrome,
          child: child,
        ),
      ),
    );
