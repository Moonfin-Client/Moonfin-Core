import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/connectivity_service.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'multi_server_fakes.dart';

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockImageApi extends Mock implements ImageApi {}

void main() {
  late UserPreferences prefs;
  // Each genre page requested, as `server@startIndex`.
  final genrePageRequests = <String>[];
  // Whether the servers page their genres, as real ones do.
  var paged = false;

  /// [servers] maps each id to its type and the genres it lists.
  MultiServerRepository repository(
    Map<String, (ServerType, List<String>)> servers,
  ) => fakeMultiServerRepository(
    {for (final MapEntry(:key, value: (type, _)) in servers.entries) key: type},
    stubClient: (id, client) {
      final genres = servers[id]!.$2;
      final itemsApi = _MockItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => client.imageApi).thenReturn(_MockImageApi());
      when(
        () => itemsApi.getGenres(
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
          recursive: any(named: 'recursive'),
          startIndex: any(named: 'startIndex'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          includeItemTypes: any(named: 'includeItemTypes'),
        ),
      ).thenAnswer((invocation) async {
        final start = invocation.namedArguments[#startIndex] as int? ?? 0;
        final limit = invocation.namedArguments[#limit] as int?;
        genrePageRequests.add('$id@$start');
        return {
          'Items': [
            for (final genre
                in paged ? genres.skip(start).take(limit!) : genres)
              {
                'Id': '$id-$genre',
                'Name': genre,
                'Type': 'Genre',
                'MovieCount': 3,
              },
          ],
          'TotalRecordCount': genres.length,
        };
      });
      when(
        () => itemsApi.getItems(
          genreIds: any(named: 'genreIds'),
          includeItemTypes: any(named: 'includeItemTypes'),
          excludeItemTypes: any(named: 'excludeItemTypes'),
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
          recursive: any(named: 'recursive'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': '$id-movie', 'Type': 'Movie', 'Name': 'movie'},
          ],
          'TotalRecordCount': 3,
        },
      );
    },
  );

  /// Each tile as `name@server`, starred when it opens the merged genre.
  List<String> tiles(HomeRow row) => [
    for (final item in row.items)
      '${item.name}@${item.serverId}'
          '${item.rawData[unifiedGenreTileKey] == true ? '*' : ''}',
  ];

  const twoServers = {
    'a': (ServerType.jellyfin, ['Action', 'Comedy', 'Drama']),
    'b': (ServerType.emby, ['Comédie', 'DRAMA', 'Western', ' action ']),
  };

  setUp(() async {
    genrePageRequests.clear();
    paged = false;
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  });

  tearDown(() => GetIt.instance.reset());

  test('same-named genres of the merged servers are one tile', () async {
    await turnOnMergedLibraries(prefs);

    final row = await repository(twoServers).getAggregatedGenres();

    expect(tiles(row), [
      'Action@a*',
      'Comedy@a*',
      'Comédie@b*',
      'Drama@a*',
      'Western@b*',
    ]);
    expect(row.items.first.id, 'a-Action');
  });

  test('pages of the row fold into the tiles already shown', () async {
    await turnOnMergedLibraries(prefs);
    final multiServer = repository(twoServers);
    final row = await multiServer.getAggregatedGenres(limit: 2);
    expect(tiles(row), ['Action@a*', 'Comedy@a*']);

    final (items, _) = await multiServer.loadMore(row: row);

    expect([for (final item in items) genreNameKey(item.name)]..sort(), [
      'action',
      'comedy',
      'comédie',
      'drama',
      'western',
    ]);
    expect(
      items.every((item) => item.rawData[unifiedGenreTileKey] == true),
      isTrue,
    );
  });

  test('two servers with the same genres: the row has no more to load and '
      'requests no further page', () async {
    await turnOnMergedLibraries(prefs);
    paged = true;
    const genres = ['Action', 'Comedy', 'Drama'];
    final multiServer = repository({
      'a': (ServerType.jellyfin, genres),
      'b': (ServerType.emby, genres),
    });

    final row = await multiServer.getAggregatedGenres();

    expect(tiles(row), ['Action@a*', 'Comedy@a*', 'Drama@a*']);
    expect(row.totalCount, 3);
    expect(row.hasMore, isFalse);
    final (items, total) = await multiServer.loadMore(row: row);
    expect(items, hasLength(3));
    expect(total, 3);
    expect(genrePageRequests, ['a@0', 'b@0']);
  });

  test('paging the folded row ends once every server is read, each genre '
      'shown once', () async {
    await turnOnMergedLibraries(prefs);
    paged = true;
    String name(int i) => 'Genre ${'$i'.padLeft(2, '0')}';
    final multiServer = repository({
      'a': (ServerType.jellyfin, [for (var i = 1; i <= 20; i++) name(i)]),
      'b': (ServerType.emby, [for (var i = 1; i <= 40; i++) name(i)]),
    });

    var row = await multiServer.getAggregatedGenres();
    expect(row.items, hasLength(15));
    var pages = 0;
    while (row.hasMore && pages < 10) {
      pages++;
      final (items, total) = await multiServer.loadMore(row: row);
      row = row.copyWith(items: items, totalCount: total);
    }

    expect(row.hasMore, isFalse);
    expect(pages, 2);
    expect([for (final item in row.items) item.name], [
      for (var i = 1; i <= 40; i++) name(i),
    ]);
    // No page is read twice, and none past a server's last.
    expect(genrePageRequests, ['a@0', 'b@0', 'a@15', 'b@15', 'a@30', 'b@30']);
  });

  test('an unmerged row keeps the total its servers gave', () async {
    await prefs.set(UserPreferences.enableMultiServerLibraries, true);
    paged = true;

    final row = await repository(twoServers).getAggregatedGenres();

    expect(row.totalCount, 7);
  });

  group('lists each server\'s genres separately', () {
    const unmerged = [
      ' action @b',
      'Action@a',
      'Comedy@a',
      'Comédie@b',
      'Drama@a',
      'DRAMA@b',
      'Western@b',
    ];

    test('with merged libraries off', () async {
      await prefs.set(UserPreferences.enableMultiServerLibraries, true);

      final multiServer = repository(twoServers);

      expect(await multiServer.mergedGenreServerIds(), isEmpty);
      expect(tiles(await multiServer.getAggregatedGenres()), unmerged);
    });

    test('with multi-server libraries off', () async {
      await prefs.set(UserPreferences.mergeLibrariesByType, true);

      expect(
        tiles(await repository(twoServers).getAggregatedGenres()),
        unmerged,
      );
    });

    test('with a single server', () async {
      await turnOnMergedLibraries(prefs);

      final multiServer = repository({
        'a': (ServerType.jellyfin, ['Drama']),
      });

      expect(await multiServer.mergedGenreServerIds(), isEmpty);
      expect(tiles(await multiServer.getAggregatedGenres()), ['Drama@a']);
    });

    test('while browsing the downloads offline', () async {
      await turnOnMergedLibraries(prefs);
      GetIt.instance.registerSingleton<ConnectivityService>(
        UnreachableConnectivity(),
      );

      expect(
        tiles(await repository(twoServers).getAggregatedGenres()),
        unmerged,
      );
    });
  });

  test('the merged genre has a route of its own', () {
    expect(Destinations.unifiedGenre('Comédie'), '/unified-genre/Com%C3%A9die');
    expect(
      Destinations.unifiedGenre('Drama', kindName: 'series'),
      '/unified-genre/Drama?kind=series',
    );
  });
}
