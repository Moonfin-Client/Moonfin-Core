import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/expandable_icon_button.dart';
import 'package:moonfin/ui/widgets/left_sidebar.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/top_toolbar.dart';
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
  Future<List<AggregatedLibrary>> getUserViews() async => _libraries;
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
  bool get loaded => false;
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

// Both servers number their libraries from 1, as Emby does.
const _libraries = [
  AggregatedLibrary(
    id: '1',
    name: 'Movies',
    collectionType: 'movies',
    serverId: 's1',
  ),
  AggregatedLibrary(
    id: '1',
    name: 'Shows',
    collectionType: 'tvshows',
    serverId: 's2',
  ),
  AggregatedLibrary(
    id: '2',
    name: 'Live TV',
    collectionType: 'livetv',
    serverId: 's1',
  ),
];

Widget _host(Widget chrome, {List<String>? opened}) {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => Scaffold(body: chrome)),
      GoRoute(
        path: '/library/:id',
        builder: (_, state) {
          opened?.add(state.uri.toString());
          return const SizedBox.shrink();
        },
      ),
    ],
  );
  return MaterialApp.router(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: router,
  );
}

final _movies = find.byIcon(Icons.movie_rounded);
final _shows = find.byIcon(Icons.tv_rounded);

FocusNode _buttonFocus(WidgetTester tester, Finder icon) => tester
    .widget<Focus>(
      find
          .descendant(
            of: find.ancestor(
              of: icon,
              matching: find.byType(ExpandableIconButton),
            ),
            matching: find.byType(Focus),
          )
          .first,
    )
    .focusNode!;

void main() {
  setUp(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.showLiveTvButton, true);
    await prefs.set(UserPreferences.showLibrariesIndividually, true);
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
    getIt.registerSingleton<PlaybackManager>(_FakePlaybackManager());
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
  });

  tearDown(() async {
    NavigationLayout.chromeFocusRoots.clear();
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  testWidgets('the toolbar shows a button per library instead of the menu', (
    tester,
  ) async {
    await tester.pumpWidget(_host(const TopToolbar()));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('toolbar_libraries')), findsNothing);
    expect(_movies, findsOneWidget);
    expect(_shows, findsOneWidget);
    expect(
      tester.getCenter(_movies).dx,
      lessThan(tester.getCenter(_shows).dx),
    );
    // The Live TV button already leads to the guide, so the library is dropped
    // just as it is from the menu.
    expect(find.byIcon(Icons.live_tv_rounded), findsOneWidget);
  });

  testWidgets('a library button opens that library on its own server', (
    tester,
  ) async {
    // At 800 wide the desktop clock sits over the end of the bar.
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    final opened = <String>[];
    await tester.pumpWidget(_host(const TopToolbar(), opened: opened));
    await tester.pumpAndSettle();

    await tester.tap(_shows);
    await tester.pumpAndSettle();

    expect(opened, ['/library/1?serverId=s2']);
  });

  testWidgets('the menu stays while the setting is off', (tester) async {
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.showLibrariesIndividually,
      false,
    );
    await tester.pumpWidget(_host(const TopToolbar()));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('toolbar_libraries')), findsOneWidget);
    expect(_movies, findsNothing);
  });

  testWidgets('Left and Right step through the library buttons on TV', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await tester.pumpWidget(_host(const TopToolbar()));
    await tester.pumpAndSettle();

    final movies = _buttonFocus(tester, _movies);
    final shows = _buttonFocus(tester, _shows);
    movies.requestFocus();
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(shows.hasPrimaryFocus, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(movies.hasPrimaryFocus, isTrue);
  });

  testWidgets('the sidebar lists each library as a row of its own', (
    tester,
  ) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    await tester.pumpWidget(_host(const LeftSidebar()));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('sidebar-libraries')), findsNothing);
    expect(_movies, findsOneWidget);
    expect(_shows, findsOneWidget);
  });
}
