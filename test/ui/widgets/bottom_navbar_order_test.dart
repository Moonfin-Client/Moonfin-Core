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
import 'package:moonfin/ui/widgets/mobile_bottom_nav_bar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
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

class _FakePlaybackManager extends Fake implements PlaybackManager {
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

const _track = AggregatedItem(
  id: 'a1',
  serverId: 'srv',
  rawData: {'Id': 'a1', 'Name': 'A Song', 'Type': 'Audio'},
);

void main() {
  late _FakePlaybackManager playback;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    playback = _FakePlaybackManager();
    final getIt = GetIt.instance;
    getIt.registerSingleton<PreferenceStore>(store);
    getIt.registerSingleton<UserPreferences>(UserPreferences(store));
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
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  testWidgets('the bar reports the room it takes at the bottom', (
    tester,
  ) async {
    Future<double> heightWithInset(double bottom) async {
      late double height;
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(padding: EdgeInsets.only(bottom: bottom)),
          child: Builder(
            builder: (context) {
              height = MobileBottomNavBar.heightFor(context);
              return const SizedBox();
            },
          ),
        ),
      );
      return height;
    }

    // The bar pads the system inset underneath itself and falls back to its
    // own float gap where there is none.
    expect(await heightWithInset(48), 54.0 + 48.0);
    expect(await heightWithInset(0), 54.0 + 14.0);
  });

  testWidgets('the navbar keeps the screen edge while music is playing', (
    tester,
  ) async {
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.navbarPosition,
      NavbarPosition.bottom,
    );
    playback.queueService.setQueue([_track]);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: NavigationLayout(child: SizedBox.expand()),
        ),
      ),
    );
    await tester.pump();

    final navbar = find.byType(MobileBottomNavBar);
    final musicBar = find.byType(BottomMusicBar);
    expect(navbar, findsOneWidget);
    expect(musicBar, findsOneWidget);

    // The navbar is what pads the system inset, so nothing may sit between
    // it and the bottom of the screen.
    expect(
      tester.getBottomLeft(navbar).dy,
      greaterThan(tester.getBottomLeft(musicBar).dy),
    );
  });
}
