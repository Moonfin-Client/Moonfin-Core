import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'multi_server_fakes.dart';

class _MockUserViewsApi extends Mock implements UserViewsApi {}

class _MockUsersApi extends Mock implements UsersApi {}

class _FakeCatalog extends ChangeNotifier implements UnifiedCatalogService {
  _FakeCatalog(this.storedKinds);

  /// The library kinds the stored catalog holds rows of, per server id.
  final Map<String, Set<UnifiedLibraryKind>> storedKinds;
  int loads = 0;
  int launchChecks = 0;

  /// The servers whose stored kinds were looked up, in order.
  final serversQueried = <String>[];

  @override
  Future<void> ensureLoaded() async => loads++;

  @override
  Future<void> syncOnLaunch() async => launchChecks++;

  @override
  Future<Set<UnifiedLibraryKind>> kindsHeldBy(String serverId) async {
    serversQueried.add(serverId);
    return storedKinds[serverId] ?? const {};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late UserPreferences prefs;

  /// [servers] maps each id to its type and its libraries' collection types.
  /// The servers in [down] fail when asked for their libraries.
  MultiServerRepository repository(
    Map<String, (ServerType, List<String>)> servers, {
    Set<String> down = const {},
  }) => fakeMultiServerRepository(
    {for (final MapEntry(:key, value: (type, _)) in servers.entries) key: type},
    stubClient: (id, client) {
      final libraries = servers[id]!.$2;
      final viewsApi = _MockUserViewsApi();
      final usersApi = _MockUsersApi();
      when(() => client.userViewsApi).thenReturn(viewsApi);
      when(() => client.usersApi).thenReturn(usersApi);
      when(() => usersApi.getUserConfiguration())
          .thenAnswer((_) async => const UserConfiguration());
      when(
        () => viewsApi.getUserViews(includeHidden: any(named: 'includeHidden')),
      ).thenAnswer((_) async {
        if (down.contains(id)) throw StateError('down');
        return {
          'Items': [
            for (final library in libraries)
              {
                'Id': '$id-$library',
                'Name': library,
                'CollectionType': library,
              },
          ],
        };
      });
    },
  );

  List<String> tiles(List<AggregatedLibrary> libraries) => [
    for (final library in libraries)
      [
        library.name,
        if (library.unifiedKindName case final kindName?) ' [$kindName]',
      ].join(),
  ];

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    await turnOnMergedLibraries(prefs);
  });

  tearDown(() => GetIt.instance.reset());

  test('every server\'s movies and series become one tile each', () async {
    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies', 'tvshows', 'boxsets']),
      'b': (ServerType.emby, ['movies', 'tvshows', 'boxsets']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), [
      'Movies [movies]',
      'TV Shows [series]',
      'boxsets (Server a)',
      'boxsets (Server b)',
    ]);
    // The tile opens nothing of its own, but still draws a real library's art.
    expect(libraries.first.id, 'a-movies');
    expect(libraries.first.serverId, 'a');
  });

  test('a type only one server holds keeps its own tile', () async {
    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies', 'tvshows']),
      'b': (ServerType.jellyfin, ['movies', 'music']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), [
      'Movies [movies]',
      'tvshows (Server a)',
      'music (Server b)',
    ]);
  });

  test('Plex and Silo servers merge with the others', () async {
    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies']),
      'p': (ServerType.plex, ['movies', 'music']),
      's': (ServerType.silo, ['movies', 'tvshows']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), [
      'Movies [movies]',
      'music (Server p)',
      'tvshows (Server s)',
    ]);
    expect(libraries.first.mergedFrom.map((library) => library.serverId), [
      'a',
      'p',
      's',
    ]);
  });

  test('merging libraries is off by default', () {
    expect(UserPreferences.mergeLibrariesByType.defaultValue, isFalse);
  });

  test('offline, every library keeps its own tile, which is what opens '
      'its downloads', () async {
    GetIt.instance.registerSingleton<ConnectivityService>(
      UnreachableConnectivity(),
    );
    final catalog = _FakeCatalog(const {});
    GetIt.instance.registerSingleton<UnifiedCatalogService>(catalog);

    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies', 'tvshows']),
      'b': (ServerType.jellyfin, ['movies', 'tvshows']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), [
      'movies (Server a)',
      'tvshows (Server a)',
      'movies (Server b)',
      'tvshows (Server b)',
    ]);
    expect(
      libraries.map((library) => library.unifiedKindName),
      everyElement(isNull),
    );
    expect(catalog.launchChecks, 0);
  });

  test('with the merge preference off each server keeps its own '
      'tiles', () async {
    await prefs.set(UserPreferences.mergeLibrariesByType, false);

    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies']),
      'b': (ServerType.jellyfin, ['movies']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), ['movies (Server a)', 'movies (Server b)']);
  });

  test('a single server\'s libraries are never merged', () async {
    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies', 'movies']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), ['movies', 'movies']);
  });

  test('a merged tile lists every library it stands for', () async {
    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies']),
      'b': (ServerType.emby, ['movies']),
    }).getAggregatedLibraries();

    expect(libraries.single.mergedFrom.map((library) => library.id), [
      'a-movies',
      'b-movies',
    ]);
  });

  group('with a server down', () {
    test('the other servers keep their tiles', () async {
      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['movies', 'music']),
          'b': (ServerType.jellyfin, ['movies']),
          'c': (ServerType.emby, ['movies', 'books']),
        },
        down: {'b'},
      ).getAggregatedLibraries();

      expect(tiles(libraries), [
        'Movies [movies]',
        'music (Server a)',
        'books (Server c)',
      ]);
    });

    test('the tiles stay unmerged with the merge preference off', () async {
      await prefs.set(UserPreferences.mergeLibrariesByType, false);

      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['movies']),
          'b': (ServerType.jellyfin, ['movies']),
        },
        down: {'a'},
      ).getAggregatedLibraries();

      expect(tiles(libraries), ['movies (Server b)']);
    });

    test('every server down is an error, not an empty list', () async {
      final loading = repository(
        {
          'a': (ServerType.jellyfin, ['movies']),
          'b': (ServerType.jellyfin, ['movies']),
        },
        down: {'a', 'b'},
      ).getAggregatedLibraries();

      await expectLater(loading, throwsStateError);
    });

    test('a type the stored catalog holds for the server that is down '
        'keeps its merged tile', () async {
      final catalog = _FakeCatalog({
        'a': {UnifiedLibraryKind.movies, UnifiedLibraryKind.series},
        'b': {UnifiedLibraryKind.movies},
      });
      GetIt.instance.registerSingleton<UnifiedCatalogService>(catalog);

      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['movies', 'tvshows']),
          'b': (ServerType.jellyfin, ['movies']),
        },
        down: {'b'},
      ).getAggregatedLibraries();

      // The stored catalog has no series for server b, so server a's series
      // library is the only one and keeps its own tile.
      expect(tiles(libraries), ['Movies [movies]', 'tvshows (Server a)']);
      expect(libraries.first.id, 'a-movies');
      expect(catalog.launchChecks, 1);
      // The stored kinds alone decide this: no titles are loaded from disk
      // to draw a tile.
      expect(catalog.serversQueried, ['b']);
      expect(catalog.loads, 0);
    });

    test('a type the stored catalog holds only for a server that answered '
        'keeps its own tile', () async {
      // Server b never had movies, so server a's alone are not merged.
      GetIt.instance.registerSingleton<UnifiedCatalogService>(
        _FakeCatalog({
          'a': {UnifiedLibraryKind.movies},
        }),
      );

      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['movies']),
          'b': (ServerType.jellyfin, ['music']),
        },
        down: {'b'},
      ).getAggregatedLibraries();

      expect(tiles(libraries), ['movies (Server a)']);
    });

    test('a type only the server that is down holds still gets a '
        'tile', () async {
      GetIt.instance.registerSingleton<UnifiedCatalogService>(
        _FakeCatalog({
          'b': {UnifiedLibraryKind.series},
        }),
      );

      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['music']),
          'b': (ServerType.jellyfin, ['tvshows']),
        },
        down: {'b'},
      ).getAggregatedLibraries();

      expect(tiles(libraries), ['music (Server a)', 'TV Shows [series]']);
      expect(libraries.last.serverId, 'b');
      expect(libraries.last.mergedFrom, isEmpty);
    });

    test('a type the stored catalog holds for no server keeps its own '
        'tile', () async {
      GetIt.instance.registerSingleton<UnifiedCatalogService>(
        _FakeCatalog(const {}),
      );

      final libraries = await repository(
        {
          'a': (ServerType.jellyfin, ['movies']),
          'b': (ServerType.jellyfin, ['movies']),
        },
        down: {'b'},
      ).getAggregatedLibraries();

      expect(tiles(libraries), ['movies (Server a)']);
    });
  });

  test('with every server answering, the stored catalog is not '
      'consulted', () async {
    final catalog = _FakeCatalog({
      'a': {UnifiedLibraryKind.movies},
    });
    GetIt.instance.registerSingleton<UnifiedCatalogService>(catalog);

    final libraries = await repository({
      'a': (ServerType.jellyfin, ['movies', 'tvshows']),
      'b': (ServerType.jellyfin, ['movies']),
    }).getAggregatedLibraries();

    expect(tiles(libraries), ['Movies [movies]', 'tvshows (Server a)']);
    expect(catalog.serversQueried, isEmpty);
    expect(catalog.loads, 0);
    // Listing the libraries still asks for the launch check; the catalog
    // decides whether one is due.
    expect(catalog.launchChecks, 1);
  });
}
