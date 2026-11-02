import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/immersive_music_screen.dart';
import 'package:moonfin/ui/screens/browse/music_browse_screen.dart';
import 'package:moonfin/ui/screens/browse/music_library_screen.dart';
import 'package:moonfin/ui/screens/browse/quick_access_music_screen.dart';
import 'package:moonfin/ui/widgets/left_sidebar.dart';
import 'package:moonfin/ui/widgets/music/music_widgets.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
import 'package:moonfin/ui/widgets/sliding_pill_tabs.dart';
import 'package:moonfin/util/game_library.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// The music screens render inside the navigation chrome, so the whole
// chrome's dependency set has to be standing.
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

class _FakeMutations extends Fake implements ItemMutationRepository {
  final favorites = <(String, bool)>[];

  @override
  Future<void> setFavorite(String itemId, {required bool isFavorite}) async =>
      favorites.add((itemId, isFavorite));
}

class _FakeBackgroundService extends Fake implements BackgroundService {
  @override
  Stream<String?> get backgroundStream => const Stream.empty();

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeServerMessages extends ChangeNotifier
    implements ServerMessagesService {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

/// One song, which every query answers with, so every section shows. Its
/// album and the library answer item lookups, and a playlist answers the
/// playlist queries.
class _OneSongItemsApi extends Fake implements ItemsApi {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final types = invocation.namedArguments[#includeItemTypes];
    if (types is List && types.contains('Playlist')) {
      return Future.value(const {
        'Items': [
          {
            'Id': 'playlist-1',
            'Name': '2000s Road Trip',
            'Type': 'Playlist',
            'MediaType': 'Audio',
            'ChildCount': 41,
          },
        ],
        'TotalRecordCount': 1,
      });
    }
    if (invocation.memberName == #getItem) {
      return Future.value(
        invocation.positionalArguments.first == 'album-1'
            ? const {
                'Id': 'album-1',
                'Name': 'A Rush of Blood to the Head',
                'Type': 'MusicAlbum',
                'ProductionYear': 2002,
                'UserData': {'IsFavorite': false},
              }
            : const {'Id': 'lib-1', 'Name': 'Music'},
      );
    }
    return Future.value(const {
      'Items': [
        {
          'Id': 'song-1',
          'Name': 'Clocks',
          'Type': 'Audio',
          'ServerId': 'server',
          'AlbumId': 'album-1',
          'Album': 'A Rush of Blood to the Head',
          'Artists': ['Coldplay'],
          'RunTimeTicks': 3070000000,
        },
      ],
      'TotalRecordCount': 1,
    });
  }
}

void main() {
  late UserPreferences prefs;
  late _FakeMutations mutations;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');
    when(() => client.itemsApi).thenReturn(_OneSongItemsApi());
    when(() => client.imageApi).thenReturn(_MockImageApi());

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
    getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
    getIt.registerSingleton<MediaServerClient>(client);
    getIt.registerSingleton<RowDataSource>(RowDataSource(client));
    getIt.registerSingleton<BackgroundService>(_FakeBackgroundService());
    mutations = _FakeMutations();
    getIt.registerSingleton<ItemMutationRepository>(mutations);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    // Every place the screen can open shows its address.
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const MusicLibraryScreen(libraryId: 'lib-1'),
        ),
      ],
      errorBuilder: (_, state) => Scaffold(body: Text(state.uri.toString())),
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await tester.pumpAndSettle();
  }

  /// A desktop window with the sidebar on the left.
  Future<void> pumpWide(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
    await pumpScreen(tester);
  }

  String? focused() => FocusManager.instance.primaryFocus?.debugLabel;

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pumpAndSettle();
  }

  group('style', () {
    testWidgets('Immersive is the default', (tester) async {
      await pumpScreen(tester);

      expect(find.byType(ImmersiveMusicScreen), findsOneWidget);
    });

    testWidgets('changing the style swaps the screen while it\'s open', (
      tester,
    ) async {
      await pumpScreen(tester);

      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.classic,
      );
      await tester.pumpAndSettle();
      expect(find.byType(MusicBrowseScreen), findsOneWidget);
      expect(find.byType(ImmersiveMusicScreen), findsNothing);

      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      );
      await tester.pumpAndSettle();
      expect(find.byType(QuickAccessMusicScreen), findsOneWidget);
      expect(find.byType(MusicBrowseScreen), findsNothing);
    });
  });

  group('Immersive', () {
    testWidgets('phones lead with the album and its categories', (
      tester,
    ) async {
      await pumpScreen(tester);

      expect(find.text('A Rush of Blood to the Head'), findsOneWidget);
      expect(find.text('Play'), findsOneWidget);
      expect(find.text('Shuffle'), findsOneWidget);
      expect(find.byType(MusicTile), findsNWidgets(6));
      expect(find.byType(SlidingPillTabs), findsNothing);
    });

    group('on wide layouts', () {
      testWidgets('focus lands on Play and walks the hero and sections', (
        tester,
      ) async {
        await pumpWide(tester);
        expect(focused(), 'music:play');
        expect(LeftSidebar.isFocusedNotifier.value, isFalse);

        await press(tester, LogicalKeyboardKey.arrowRight);
        expect(focused(), 'music:shuffle');
        await press(tester, LogicalKeyboardKey.arrowRight);
        expect(focused(), 'music:favorite');
        await press(tester, LogicalKeyboardKey.arrowRight);
        expect(focused(), 'music:albumTrack:0');
        await press(tester, LogicalKeyboardKey.arrowLeft);
        expect(focused(), 'music:favorite');

        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'music:tabs');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'music:play');

        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'music:latest:0');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'music:lastPlayed_lib-1:0');
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'music:genre:0');
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'music:seeAll:genres');
        await press(tester, LogicalKeyboardKey.arrowDown);
        await press(tester, LogicalKeyboardKey.arrowDown);
        expect(focused(), 'LockedFocusRow:music_albumartist_lib-1');
      });

      testWidgets('the D-pad moves along the tabs and Select opens one', (
        tester,
      ) async {
        await pumpWide(tester);
        await press(tester, LogicalKeyboardKey.arrowUp);
        expect(focused(), 'music:tabs');

        await press(tester, LogicalKeyboardKey.arrowRight);
        // Moving along the tabs doesn't leave the library.
        expect(find.byType(ImmersiveMusicScreen), findsOneWidget);
        expect(
          tester.widget<SlidingPillTabs>(find.byType(SlidingPillTabs))
              .selectedIndex,
          1,
        );

        await press(tester, LogicalKeyboardKey.enter);
        expect(find.text('/music/lib-1/artists'), findsOneWidget);
      });

      testWidgets('Favorite favorites the album', (tester) async {
        await pumpWide(tester);
        await press(tester, LogicalKeyboardKey.arrowRight);
        await press(tester, LogicalKeyboardKey.arrowRight);
        expect(focused(), 'music:favorite');
        expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

        await press(tester, LogicalKeyboardKey.enter);

        expect(mutations.favorites, [('album-1', true)]);
        expect(find.byIcon(Icons.favorite_border_rounded), findsNothing);
      });

      testWidgets('a tap on a tab opens it', (tester) async {
        await pumpWide(tester);

        await tester.tap(find.text('Albums').first);
        await tester.pumpAndSettle();

        expect(find.text('/music/lib-1/albums'), findsOneWidget);
      });
    });
  });

  group('Quick Access', () {
    setUp(
      () => prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      ),
    );

    testWidgets('phones show the chips, Jump Back In and playlists', (
      tester,
    ) async {
      await pumpScreen(tester);

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Jump Back In'), findsOneWidget);
      expect(find.byType(MusicQuickTile), findsNWidgets(2));
      expect(find.text('Your Playlists'), findsOneWidget);
    });

    testWidgets('Down from the header reaches All however far the chips '
        'scrolled', (tester) async {
      tester.view.physicalSize = const Size(360, 780);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await pumpScreen(tester);
      FocusManager.instance.rootScope.descendants
          .firstWhere((node) => node.debugLabel == 'music:search')
          .requestFocus();
      await tester.pumpAndSettle();

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:chip:0');
      for (var i = 0; i < 6; i++) {
        await press(tester, LogicalKeyboardKey.arrowRight);
      }
      expect(focused(), 'music:chip:6');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:search');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:chip:0');
    });

    testWidgets('a Jump Back In album opens the album', (tester) async {
      await pumpScreen(tester);

      await tester.tap(find.byType(MusicQuickTile).first);
      await tester.pumpAndSettle();

      expect(find.textContaining('/item/album-1'), findsOneWidget);
    });

    testWidgets('on wide layouts focus lands on the grid and reaches the '
        'rail and every section', (tester) async {
      await pumpWide(tester);
      expect(focused(), 'music:quick:0');
      expect(LeftSidebar.isFocusedNotifier.value, isFalse);

      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), 'music:rail:overview');
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:quick:0');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:filter');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:quick:0');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'LockedFocusRow:music_latest_lib-1');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:lastPlayed_lib-1:0');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'LockedFocusRow:music_albumartist_lib-1');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:seeAll:albumartist_lib-1');
    });
  });
}
