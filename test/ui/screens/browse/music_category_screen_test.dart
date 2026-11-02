import 'dart:math';

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
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/user_views_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:moonfin/data/utils/alphabet_bucket.dart';
import 'package:moonfin/data/viewmodels/music_category_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/browse/music_browse_screen.dart';
import 'package:moonfin/ui/screens/browse/music_category_screen.dart';
import 'package:moonfin/ui/widgets/media_card.dart';
import 'package:moonfin/ui/widgets/music/music_navigation.dart';
import 'package:moonfin/ui/widgets/music/music_widgets.dart';
import 'package:moonfin/ui/widgets/navigation_layout.dart';
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
  final played = <List<String>>[];
  final starts = <int>[];

  @override
  final PlayerState state = PlayerState();

  @override
  final QueueService queueService = QueueService();

  @override
  Future<void> playItems(
    List<dynamic> items, {
    int startIndex = 0,
    Duration startPosition = Duration.zero,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    String? mediaSourceId,
    bool audioSelectionExplicit = false,
    bool subtitleSelectionExplicit = false,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
    bool autoPlay = true,
    bool carryTrackSelections = false,
  }) async {
    played.add([for (final item in items) (item as AggregatedItem).id]);
    starts.add(startIndex);
  }
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

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

Map<String, dynamic> _page(List<Map<String, dynamic>> items) => {
  'Items': items,
  'TotalRecordCount': items.length,
};

Map<String, dynamic> _song(String id, String name, {int plays = 0}) => {
  'Id': id,
  'Name': name,
  'Type': 'Audio',
  'Album': 'Paper Lanterns',
  'AlbumId': 'album-1',
  'Artists': ['Mara Quill'],
  'IndexNumber': int.parse(id.split('-').last),
  'RunTimeTicks': 2200000000,
  'UserData': {'PlayCount': plays},
};

/// A small library: four artists over three letters, two albums, two songs,
/// one playlist and three genres. Records every getItems call.
class _LibraryItemsApi extends Fake implements ItemsApi {
  final calls = <Map<Symbol, dynamic>>[];
  final artistCalls = <Symbol>[];
  bool noPlaylists = false;

  static final artists = [
    {'Id': 'artist-1', 'Name': 'Amber Lane', 'Type': 'MusicArtist'},
    {'Id': 'artist-2', 'Name': 'Arlo Finch', 'Type': 'MusicArtist'},
    {'Id': 'artist-3', 'Name': 'Bellwether', 'Type': 'MusicArtist'},
    {'Id': 'artist-4', 'Name': 'Zephyr', 'Type': 'MusicArtist'},
  ];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final args = invocation.namedArguments;
    switch (invocation.memberName) {
      case #getItem:
        return Future.value(const {'Id': 'lib-1', 'Name': 'Music'});
      case #getAlbumArtists:
      case #getArtists:
        artistCalls.add(invocation.memberName);
        final sorted = args[#sortOrder] == 'Descending'
            ? artists.reversed.toList()
            : artists;
        return Future.value(
          _page(args[#isFavorite] == true ? [sorted.first] : sorted),
        );
      case #getGenres:
        return Future.value(
          _page([
            {'Id': 'g-ambient', 'Name': 'Ambient', 'ChildCount': 2},
            {'Id': 'g-electronic', 'Name': 'Electronic', 'ChildCount': 5},
            {'Id': 'g-folk', 'Name': 'Folk', 'ChildCount': 2},
          ]),
        );
      case #getPlaylistItems:
        return Future.value(
          _page([_song('song-1', 'Lantern Song'), _song('song-2', 'Riverlight')]),
        );
    }
    calls.add(args);
    final types = args[#includeItemTypes] as List?;
    if (types != null && types.contains('Playlist')) {
      if (noPlaylists) return Future.value(_page(const []));
      return Future.value(
        _page([
          {
            'Id': 'playlist-1',
            'Name': 'Gym Rotation',
            'Type': 'Playlist',
            'MediaType': 'Audio',
            'ChildCount': 2,
          },
        ]),
      );
    }
    if (types != null && types.contains('MusicAlbum')) {
      if (args[#isFavorite] == true) return Future.value(_page(const []));
      return Future.value(
        _page([
          {
            'Id': 'album-1',
            'Name': 'Paper Lanterns',
            'Type': 'MusicAlbum',
            'AlbumArtist': 'Mara Quill',
            'ProductionYear': 2024,
            'Genres': ['Indie Folk'],
          },
          {
            'Id': 'album-2',
            'Name': 'Field Notes',
            'Type': 'MusicAlbum',
            'AlbumArtist': 'Amber Lane',
          },
        ]),
      );
    }
    if (args[#limit] == 0) return Future.value({'Items': [], 'TotalRecordCount': 3412});
    return Future.value(
      _page([
        _song('song-1', 'Lantern Song', plays: 55),
        _song('song-2', 'Riverlight', plays: 42),
      ]),
    );
  }
}

void main() {
  late UserPreferences prefs;
  late _LibraryItemsApi itemsApi;
  late _FakePlaybackManager playback;

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    itemsApi = _LibraryItemsApi();
    playback = _FakePlaybackManager();

    final client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => client.userId).thenReturn('user-1');
    when(() => client.itemsApi).thenReturn(itemsApi);
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
    getIt.registerSingleton<PlaybackManager>(playback);
    getIt.registerSingleton<MediaServerClientFactory>(_FakeClientFactory());
    getIt.registerSingleton<ServerMessagesService>(_FakeServerMessages());
    getIt.registerSingleton<MediaServerClient>(client);
    getIt.registerSingleton<BackgroundService>(_FakeBackgroundService());
    PlatformDetection.setInterfaceLayout(InterfaceLayout.phone);
  });

  tearDown(() async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    NavigationLayout.chromeFocusRoots.clear();
    await GetIt.instance.reset();
  });

  Future<void> pumpCategory(
    WidgetTester tester,
    MusicCategoryKind kind, {
    String? show,
  }) async {
    // Anywhere the screen goes shows its address.
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) =>
              MusicCategoryScreen(libraryId: 'lib-1', kind: kind, show: show),
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
  Future<void> pumpWide(
    WidgetTester tester,
    MusicCategoryKind kind, {
    String? show,
  }) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    PlatformDetection.setInterfaceLayout(InterfaceLayout.desktop);
    await prefs.set(UserPreferences.navbarPosition, NavbarPosition.left);
    await pumpCategory(tester, kind, show: show);
  }

  String? focused() => FocusManager.instance.primaryFocus?.debugLabel;

  Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pumpAndSettle();
  }

  group('routes', () {
    test('rows See All open the matching category screen', () {
      expect(musicSeeAllRoute('lib-1', 'musicalbum_lib-1'), '/music/lib-1/albums');
      expect(musicSeeAllRoute('lib-1', 'albumartist_lib-1'), '/music/lib-1/artists');
      expect(
        musicSeeAllRoute('lib-1', 'musicartist_lib-1'),
        '/music/lib-1/artists?show=all',
      );
      expect(musicSeeAllRoute('lib-1', 'playlists'), '/music/lib-1/playlists');
      expect(
        musicSeeAllRoute('lib-1', 'favorites_lib-1'),
        '/music/lib-1/favorites?show=albums',
      );
      expect(musicSeeAllRoute('lib-1', 'lastPlayed_lib-1'), isNull);
    });

    test('category names parse back, anything else is null', () {
      for (final kind in MusicCategoryKind.values) {
        expect(MusicCategoryKind.parse(kind.name), kind);
      }
      expect(MusicCategoryKind.parse('folders'), isNull);
    });
  });

  group('data', () {
    AggregatedItem item(String name, [Map<String, dynamic> extra = const {}]) =>
        AggregatedItem(id: name, serverId: 's', rawData: {'Name': name, ...extra});

    test('genres sort by album count, then by name', () {
      final sorted = sortGenresByAlbums([
        item('Folk', {'ChildCount': 2}),
        item('Ambient', {'ChildCount': 2}),
        item('Electronic', {'AlbumCount': 5}),
        item('Spoken'),
      ]);
      expect(sorted.map((g) => g.name), ['Electronic', 'Ambient', 'Folk', 'Spoken']);
      expect(musicGenreAlbumCount(item('Spoken')), isNull);
    });

    test('names file under their first letter, or # without one', () {
      expect(alphabetBucketOf(item('Ángel')), 'A');
      expect(alphabetBucketOf(item('zephyr')), 'Z');
      expect(alphabetBucketOf(item('2Pac')), '#');
      expect(alphabetBucketOf(item('The Band', {'SortName': 'Band'})), 'B');
    });

    test('a paged list pages until an item turns up', () async {
      final requests = <int>[];
      final names = List.generate(25, (i) => item('Artist $i'));
      final list = MusicPagedItems((start, limit) async {
        requests.add(start);
        return (
          items: names.skip(start).take(limit).toList(),
          total: names.length,
        );
      }, pageSize: 10);
      await list.load();

      expect(await list.loadUntil((a) => a.name == 'Artist 22'), 22);
      expect(requests, [0, 10, 20]);
      expect(await list.loadUntil((a) => a.name == 'Nobody'), -1);
      expect(list.hasMore, isFalse);
    });

    test('Rediscover shuffles the favorites played longest ago', () async {
      final queries = MusicLibraryQueries(
        libraryId: 'lib-1',
        client: GetIt.instance<MediaServerClient>(),
      );
      final tracks = await queries.mix(MusicMix.rediscover, random: Random(1));
      final call = itemsApi.calls.last;

      expect(call[#isFavorite], isTrue);
      expect(call[#sortBy], 'DatePlayed,SortName');
      expect(call[#sortOrder], 'Ascending');
      expect(tracks.map((t) => t.id).toSet(), {'song-1', 'song-2'});
    });
  });

  group('Artists', () {
    testWidgets('lists artists under letter headings and switches to every '
        'artist', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.artists);

      expect(find.text('4 artists'), findsOneWidget);
      for (final letter in ['A', 'B']) {
        expect(find.text(letter), findsWidgets);
      }
      expect(itemsApi.artistCalls, [#getAlbumArtists]);

      await tester.tap(find.text('All Artists'));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(itemsApi.artistCalls, [#getAlbumArtists, #getArtists]);
    });

    testWidgets('on wide layouts the rail jumps to a letter and Left goes '
        'back to its artists', (tester) async {
      await pumpWide(tester, MusicCategoryKind.artists);
      expect(focused(), 'music:artist:0');

      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:artist:1');
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:letter:A');

      FocusManager.instance.rootScope.descendants
          .firstWhere((node) => node.debugLabel == 'music:letter:Z')
          .requestFocus();
      await tester.pumpAndSettle();
      await press(tester, LogicalKeyboardKey.enter);
      expect(focused(), 'music:artist:3');

      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:letter:Z');
      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), 'music:artist:3');
    });
  });

  group('category strip', () {
    testWidgets('every screen shows it with its own category picked', (
      tester,
    ) async {
      for (final kind in MusicCategoryKind.values) {
        await pumpCategory(tester, kind);
        expect(find.byType(MusicCategoryTabs), findsOneWidget, reason: '$kind');
        expect(
          tester.widget<MusicCategoryTabs>(find.byType(MusicCategoryTabs)).current,
          kind.index + 1,
        );
      }
    });

    testWidgets('the D-pad reaches it, moves along it and switches in place',
        (tester) async {
      await pumpWide(tester, MusicCategoryKind.artists);
      expect(focused(), 'music:artist:0');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:tabs');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:strip');

      await press(tester, LogicalKeyboardKey.arrowRight);
      // Moving along the strip doesn't switch yet.
      expect(find.text('4 artists'), findsOneWidget);
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Recently Added'), findsOneWidget);
      expect(find.text('4 artists'), findsNothing);
      expect(focused(), 'music:strip');

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:sort');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:album:0');
    });

    testWidgets('Down from the strip with nothing under it stays put', (
      tester,
    ) async {
      itemsApi.noPlaylists = true;
      await pumpWide(tester, MusicCategoryKind.playlists);
      expect(find.text('No items found'), findsOneWidget);
      FocusManager.instance.rootScope.descendants
          .firstWhere((node) => node.debugLabel == 'music:strip')
          .requestFocus();
      await tester.pumpAndSettle();

      await press(tester, LogicalKeyboardKey.arrowDown);

      expect(focused(), 'music:strip');
    });

    testWidgets('a narrow strip opens with the current category in view', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 780);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await pumpCategory(tester, MusicCategoryKind.favorites);

      final pill = find.descendant(
        of: find.byType(MusicCategoryTabs),
        matching: find.text('Favorites'),
      );
      expect(tester.getRect(pill).right, lessThanOrEqualTo(360));
    });

    testWidgets('Overview goes back to the library', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.songs);

      await tester.ensureVisible(find.text('Overview'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Overview'));
      await tester.pumpAndSettle();

      expect(find.text('/music/lib-1'), findsOneWidget);
    });
  });

  group('category rail', () {
    testWidgets('Quick Access shows its side rail instead of the strip', (
      tester,
    ) async {
      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      );
      await pumpWide(tester, MusicCategoryKind.songs);

      expect(find.text('Search Music'), findsOneWidget);
      expect(find.byType(MusicCategoryTabs), findsNothing);
      final picked = tester
          .widgetList<MusicRailItem>(find.byType(MusicRailItem))
          .where((item) => item.selected);
      expect(picked.single.label, 'Songs');
    });

    testWidgets('the D-pad reaches the rail, switches in place and comes '
        'back to the content', (tester) async {
      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      );
      await pumpWide(tester, MusicCategoryKind.artists);
      expect(focused(), 'music:artist:0');

      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), 'music:rail:artists');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:rail:albums');
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Recently Added'), findsOneWidget);
      expect(focused(), 'music:rail:albums');

      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:album:0');
    });

    testWidgets('Quick Access phones show its chips with the category in '
        'view, and the chips switch in place', (tester) async {
      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      );
      tester.view.physicalSize = const Size(360, 780);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await pumpCategory(tester, MusicCategoryKind.favorites);

      MusicChip picked() => tester
          .widgetList<MusicChip>(find.byType(MusicChip))
          .singleWhere((chip) => chip.selected);
      expect(find.byType(MusicCategoryTabs), findsNothing);
      expect(find.text('Search Music'), findsNothing);
      expect(
        tester.widgetList<MusicChip>(find.byType(MusicChip)).first.label,
        'All',
      );
      expect(picked().label, 'Favorites');
      expect(
        tester.getRect(find.widgetWithText(MusicChip, 'Favorites')).right,
        lessThanOrEqualTo(360),
      );

      await tester.tap(find.widgetWithText(MusicChip, 'Genres'));
      await tester.pumpAndSettle();
      expect(picked().label, 'Genres');

      await tester.ensureVisible(find.widgetWithText(MusicChip, 'All'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(MusicChip, 'All'));
      await tester.pumpAndSettle();
      expect(find.text('/music/lib-1'), findsOneWidget);
    });

    testWidgets('the D-pad reaches the Quick Access chips and moves along '
        'them', (tester) async {
      await prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.quickAccess,
      );
      await pumpCategory(tester, MusicCategoryKind.artists);
      FocusManager.instance.rootScope.descendants
          .firstWhere((node) => node.debugLabel == 'music:artist:0')
          .requestFocus();
      await tester.pumpAndSettle();

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:tabs');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:chip:artists');
      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), 'music:chip:overview');
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:chip:artists');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:tabs');
    });
  });

  group('Classic', () {
    setUp(
      () => prefs.set(
        UserPreferences.musicLibraryStyle,
        MusicLibraryStyle.classic,
      ),
    );

    MusicCategoryButton picked(WidgetTester tester) => tester
        .widgetList<MusicCategoryButton>(find.byType(MusicCategoryButton))
        .singleWhere((button) => button.selected);

    testWidgets('desktop shows Classic\'s own rail', (tester) async {
      await pumpWide(tester, MusicCategoryKind.songs);

      expect(find.byType(MusicCategoryRail), findsOneWidget);
      expect(find.byType(MusicCategoryTabs), findsNothing);
      expect(find.byType(MusicRailItem), findsNothing);
      expect(picked(tester).label, 'Songs');
      expect(find.text('Overview'), findsOneWidget);
    });

    testWidgets('TVs show Classic\'s chips, which the D-pad reaches and '
        'switches with', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
      await pumpCategory(tester, MusicCategoryKind.artists);

      expect(find.byType(MusicCategoryBar), findsOneWidget);
      expect(find.byType(MusicCategoryRail), findsNothing);
      expect(focused(), 'music:artist:0');

      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:tabs');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:classic:artists');
      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:classic:albums');
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Recently Added'), findsOneWidget);
      expect(focused(), 'music:classic:albums');
      expect(picked(tester).label, 'Albums');
    });

    testWidgets('phones show Classic\'s chips too', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.genres);

      expect(find.byType(MusicCategoryBar), findsOneWidget);
      expect(picked(tester).label, 'Genres');
    });
  });

  group('Albums', () {
    testWidgets('picking an album opens its songs under it, and again '
        'closes them', (tester) async {
      await pumpWide(tester, MusicCategoryKind.albums);
      expect(focused(), 'music:album:0');
      expect(find.text('Open Album'), findsNothing);

      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Open Album'), findsOneWidget);
      expect(find.text('Mara Quill · 2024'), findsOneWidget);
      expect(find.text('Riverlight'), findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:panel:play');
      await press(tester, LogicalKeyboardKey.arrowUp);
      expect(focused(), 'music:album:0');
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Open Album'), findsNothing);

      await press(tester, LogicalKeyboardKey.enter);
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.enter);
      expect(playback.played.single, ['song-1', 'song-2']);
      expect(find.text('/player/audio'), findsOneWidget);
    });

    testWidgets('Back closes the open album before leaving', (tester) async {
      await pumpWide(tester, MusicCategoryKind.albums);
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Open Album'), findsOneWidget);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(find.text('Open Album'), findsNothing);
      expect(find.text('Paper Lanterns'), findsOneWidget);
    });

    testWidgets('a focused card in the top row keeps its whole focus ring '
        'inside the list', (tester) async {
      await pumpWide(tester, MusicCategoryKind.albums);
      expect(focused(), 'music:album:0');

      final card = find.byType(MediaCard).first;
      final ring = find.descendant(
        of: card,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration as BoxDecoration).border != null,
        ),
      );
      final list = find.ancestor(of: card, matching: find.byType(ListView));
      expect(
        tester.getTopLeft(ring).dy,
        greaterThanOrEqualTo(tester.getTopLeft(list.first).dy - 0.01),
      );
    });
  });

  group('Songs', () {
    testWidgets('shows the mixes and the songs played most', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.songs);

      expect(find.text('3412 songs'), findsOneWidget);
      for (final title in ['Everything', 'Fresh Arrivals', 'Rediscover']) {
        expect(find.text(title), findsOneWidget);
      }
      expect(find.text('55 plays'), findsOneWidget);
    });

    testWidgets('a mix plays at once', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.songs);

      await tester.tap(find.text('Everything'));
      await tester.pumpAndSettle();

      expect(itemsApi.calls.last[#sortBy], 'Random');
      expect(playback.played.single, ['song-1', 'song-2']);
      expect(find.text('/player/audio'), findsOneWidget);
    });
  });

  group('Genres', () {
    testWidgets('lists the genres with the most albums first, and A to Z '
        'by name', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.genres);

      double top(String name) => tester.getTopLeft(find.text(name)).dy;
      expect(top('Electronic'), lessThan(top('Ambient')));
      expect(find.text('5 albums'), findsOneWidget);

      await tester.tap(find.text('A to Z'));
      await tester.pumpAndSettle();
      expect(top('Ambient'), lessThan(top('Electronic')));
    });

    testWidgets('a station shuffles its genre', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.genres);

      await tester.tap(find.text('Electronic'));
      await tester.pumpAndSettle();

      final call = itemsApi.calls.last;
      expect(call[#genreIds], ['g-electronic']);
      expect(call[#sortBy], 'Random');
      expect(playback.played, hasLength(1));
    });
  });

  group('Playlists', () {
    testWidgets('on wide layouts the focused playlist shows beside the list',
        (tester) async {
      await pumpWide(tester, MusicCategoryKind.playlists);
      expect(focused(), 'music:playlist:0');
      expect(find.text('Open Playlist'), findsOneWidget);
      expect(find.text('Riverlight'), findsOneWidget);

      await press(tester, LogicalKeyboardKey.arrowRight);
      expect(focused(), 'music:detail:play');
      await press(tester, LogicalKeyboardKey.arrowDown);
      expect(focused(), 'music:detailTrack:0');
      await press(tester, LogicalKeyboardKey.arrowLeft);
      expect(focused(), 'music:playlist:0');

      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.enter);
      expect(playback.played.single, ['song-1', 'song-2']);
      expect(playback.starts.single, 1);
      expect(find.text('/player/audio'), findsOneWidget);
    });

    testWidgets('phones open a playlist instead', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.playlists);

      await tester.tap(find.text('Gym Rotation'));
      await tester.pumpAndSettle();

      expect(find.textContaining('/item/playlist-1'), findsOneWidget);
    });
  });

  group('Favorites', () {
    testWidgets('only shows the kinds with favorites, starting on songs',
        (tester) async {
      await pumpCategory(tester, MusicCategoryKind.favorites);

      expect(find.text('Songs 2'), findsOneWidget);
      expect(find.text('Artists 1'), findsOneWidget);
      expect(find.text('Albums 0'), findsNothing);
      expect(find.text('Lantern Song'), findsOneWidget);
      expect(find.text('Play'), findsOneWidget);
    });

    testWidgets('opens on the tab a See All asked for', (tester) async {
      await pumpCategory(tester, MusicCategoryKind.favorites, show: 'artists');

      expect(find.text('Amber Lane'), findsOneWidget);
      expect(find.text('Lantern Song'), findsNothing);
      expect(find.text('Play'), findsNothing);
    });
  });
}
