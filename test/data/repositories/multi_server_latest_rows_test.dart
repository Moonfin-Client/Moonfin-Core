import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'multi_server_fakes.dart';

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockUserViewsApi extends Mock implements UserViewsApi {}

class _MockUsersApi extends Mock implements UsersApi {}

void main() {
  late UserPreferences prefs;

  /// Held open by a test to keep a server's answers back, per server id.
  late Map<String, Completer<void>> gates;

  /// The library each request for latest items named, in order.
  late List<String> requestedParentIds;

  /// The fields each request for latest items named, in order.
  late List<String?> requestedFields;

  late Map<String, Map<String, String>> movieProviderIds;

  /// The servers that aren't Jellyfin, per server id.
  late Map<String, ServerType> serverTypes;

  late Map<String, String> movieIds;

  /// Fields added to a server's new movie, per server id.
  late Map<String, Map<String, dynamic>> movieExtras;

  /// More movies a server lists after its new one, per server id.
  late Map<String, List<Map<String, dynamic>>> moreMovies;

  /// Every server has a movie, a show and a collection library, and answers
  /// with one new title per library.
  MultiServerRepository repository(List<String> serverIds) =>
      fakeMultiServerRepository(
        {
          for (final id in serverIds)
            id: serverTypes[id] ?? ServerType.jellyfin,
        },
        stubClient: (id, client) {
          final itemsApi = _MockItemsApi();
          final viewsApi = _MockUserViewsApi();
          final usersApi = _MockUsersApi();
          when(() => client.itemsApi).thenReturn(itemsApi);
          when(() => client.userViewsApi).thenReturn(viewsApi);
          when(() => client.usersApi).thenReturn(usersApi);
          when(() => usersApi.getUserConfiguration())
              .thenAnswer((_) async => const UserConfiguration());
          when(
            () => viewsApi.getUserViews(
              includeHidden: any(named: 'includeHidden'),
            ),
          ).thenAnswer(
            (_) async => {
              'Items': [
                {
                  'Id': '$id-movies',
                  'Name': 'Movies',
                  'CollectionType': 'movies',
                },
                {
                  'Id': '$id-shows',
                  'Name': 'Shows',
                  'CollectionType': 'tvshows',
                },
                {'Id': '$id-sets', 'Name': 'Sets', 'CollectionType': 'boxsets'},
              ],
            },
          );
          when(
            () => itemsApi.getLatestItems(
              parentId: any(named: 'parentId'),
              limit: any(named: 'limit'),
              fields: any(named: 'fields'),
              enableImageTypes: any(named: 'enableImageTypes'),
              imageTypeLimit: any(named: 'imageTypeLimit'),
            ),
          ).thenAnswer((invocation) async {
            final parent = invocation.namedArguments[#parentId] as String;
            requestedParentIds.add(parent);
            requestedFields.add(invocation.namedArguments[#fields] as String?);
            final isMovie = parent.endsWith('movies');
            await gates[id]?.future;
            return {
              'Items': [
                {
                  'Id': (isMovie ? movieIds[id] : null) ?? '$parent-new',
                  'Name': 'New in $parent',
                  'Type': isMovie ? 'Movie' : 'Series',
                  'DateCreated': '2026-01-01T00:00:00.0000000Z',
                  if (isMovie && movieProviderIds[id] != null)
                    'ProviderIds': movieProviderIds[id],
                  if (isMovie) ...?movieExtras[id],
                },
                if (isMovie) ...?moreMovies[id],
              ],
            };
          });
        },
      );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    gates = {};
    requestedParentIds = [];
    requestedFields = [];
    movieProviderIds = {};
    serverTypes = {};
    movieIds = {};
    movieExtras = {};
    moreMovies = {};
    resetParentalFilterCache();
  });

  Future<void> mergeRows({required bool libraries}) async {
    await prefs.set(UserPreferences.mergeRecentRowsByType, true);
    await prefs.set(UserPreferences.enableMultiServerLibraries, libraries);
    await prefs.set(UserPreferences.mergeLibrariesByType, libraries);
  }

  tearDown(() => GetIt.instance.reset());

  test('rows keep server then library order, collections left out', () async {
    final rows = await repository(['a', 'b', 'c'])
        .getAggregatedLatestMediaRows();

    expect(rows.map((row) => row.id), [
      'latest_a_a-movies',
      'latest_a_a-shows',
      'latest_b_b-movies',
      'latest_b_b-shows',
      'latest_c_c-movies',
      'latest_c_c-shows',
    ]);
    expect(rows.first.title, contains('Server a'));
  });

  test('a slow server does not hold back asking the next one', () async {
    gates['a'] = Completer<void>();

    final loading = repository(['a', 'b']).getAggregatedLatestMediaRows();
    await pumpEventQueue();

    expect(
      requestedParentIds,
      containsAll(['a-movies', 'a-shows', 'b-movies', 'b-shows']),
    );

    gates['a']!.complete();
    final rows = await loading;
    expect(rows.map((row) => row.id), [
      'latest_a_a-movies',
      'latest_a_a-shows',
      'latest_b_b-movies',
      'latest_b_b-shows',
    ]);
  });

  test('rows merged by type gather every server under one row', () async {
    await prefs.set(UserPreferences.mergeRecentRowsByType, true);

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    expect(rows, hasLength(2));
    expect(rows.first.items.map((item) => item.serverId).toSet(), {'a', 'b'});
  });

  test('only a few servers are asked at a time', () async {
    final ids = ['a', 'b', 'c', 'd', 'e'];
    for (final id in ids) {
      gates[id] = Completer<void>();
    }

    final loading = repository(ids).getAggregatedLatestMediaRows();
    await pumpEventQueue();

    expect(
      requestedParentIds.map((library) => library.split('-').first).toSet(),
      {'a', 'b', 'c'},
    );

    gates['a']!.complete();
    await pumpEventQueue();
    expect(requestedParentIds, contains('d-movies'));
    expect(requestedParentIds, isNot(contains('e-movies')));

    for (final gate in gates.values) {
      if (!gate.isCompleted) gate.complete();
    }
    final rows = await loading;
    expect(rows.map((row) => row.id.split('_')[1]).toSet().toList(), ids);
  });

  test('rows merged by type show a title two servers hold once, with the '
      'libraries merged by type too', () async {
    await mergeRows(libraries: true);
    // The servers don't agree on how the provider's name is written.
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'tmdb': '1003'},
      'c': {'Tmdb': '1004'},
    };

    final rows = await repository(['a', 'b', 'c'])
        .getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.id), [
      'a-movies-new',
      'c-movies-new',
    ]);
    // Series carry no provider ids here, so each server keeps its own.
    final shows = rows.firstWhere((row) => row.id.endsWith('tvshows'));
    expect(shows.items, hasLength(3));
    expect(requestedFields, everyElement(contains('ProviderIds')));
  });

  test(
    'rows merged by type fold two copies that share any provider id',
    () async {
      await mergeRows(libraries: true);
      movieProviderIds = {
        'a': {'Tmdb': '1003', 'Imdb': 'tt9000001'},
        'b': {'Imdb': 'tt9000001'},
        'c': {'Tmdb': '1003'},
      };

      final rows = await repository(['a', 'b', 'c'])
          .getAggregatedLatestMediaRows();

      final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
      expect(movies.items.map((item) => item.id), ['a-movies-new']);
    },
  );

  test('rows not merged by type do not ask for provider ids', () async {
    await repository(['a', 'b']).getAggregatedLatestMediaRows();

    expect(requestedFields, everyElement(isNot(contains('ProviderIds'))));
  });

  test('without the libraries merged by type, merged rows go by item id '
      'alone and ask for no provider ids', () async {
    await mergeRows(libraries: false);
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Tmdb': '1003'},
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.id), [
      'a-movies-new',
      'b-movies-new',
    ]);
    expect(requestedFields, everyElement(isNot(contains('ProviderIds'))));
  });

  test('without the libraries merged by type, two items under one id are '
      'still shown once', () async {
    await mergeRows(libraries: false);
    movieIds = {'a': '42', 'b': '42'};

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.serverId), ['a']);
  });

  test('two titles without provider ids that share an item id on two '
      'servers are both shown', () async {
    await mergeRows(libraries: true);
    serverTypes = {'a': ServerType.emby, 'b': ServerType.emby};
    movieIds = {'a': '42', 'b': '42'};

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.serverId), ['a', 'b']);
  });

  test('a placeholder provider id does not fold unrelated titles', () async {
    await mergeRows(libraries: true);
    movieProviderIds = {
      'a': {'Tmdb': '0'},
      'b': {'Tmdb': '0'},
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items, hasLength(2));
  });

  test('a title two servers hold carries both copies on its card', () async {
    await mergeRows(libraries: true);
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Tmdb': '1003'},
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movie = rows.firstWhere((row) => row.id.endsWith('movies')).items
        .single;
    expect(movie.serverId, 'a');
    final copies = unifiedCopiesOf(movie.rawData);
    expect(copies.map((copy) => copy.key), [
      'a|a-movies-new',
      'b|b-movies-new',
    ]);
    expect(copies.map((copy) => copy.serverName), ['Server a', 'Server b']);
  });

  test('copies joined only through a later copy still make one card', () async {
    await mergeRows(libraries: true);
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Imdb': 'tt9000001'},
      'c': {'Tmdb': '1003', 'Imdb': 'tt9000001'},
    };

    final rows = await repository(['a', 'b', 'c'])
        .getAggregatedLatestMediaRows();

    final movie = rows.firstWhere((row) => row.id.endsWith('movies')).items
        .single;
    expect(unifiedCopiesOf(movie.rawData).map((copy) => copy.serverId), [
      'a',
      'b',
      'c',
    ]);
  });

  test('the copy in progress is the one a folded card shows', () async {
    await mergeRows(libraries: true);
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Tmdb': '1003'},
    };
    movieExtras = {
      'b': {
        'UserData': {'PlaybackPositionTicks': 600000000},
      },
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movie = rows.firstWhere((row) => row.id.endsWith('movies')).items
        .single;
    expect((movie.serverId, movie.id), ('b', 'b-movies-new'));
    expect(unifiedCopiesOf(movie.rawData), hasLength(2));
  });

  test('a folded title keeps its place, and the row its limit', () async {
    await mergeRows(libraries: true);
    Map<String, dynamic> movie(int number, {required int day}) => {
      'Id': 'movie-$number',
      'Name': 'Movie $number',
      'Type': 'Movie',
      'DateCreated': '2025-12-${day.toString().padLeft(2, '0')}T00:00:00Z',
      'ProviderIds': {'Tmdb': '${2000 + number}'},
    };
    moreMovies = {
      // Newest first, each a day older than the one before.
      'a': [for (var n = 1; n <= 20; n++) movie(n, day: 30 - n)],
      // An older copy of the third of them.
      'b': [movie(3, day: 1)],
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items, hasLength(15));
    expect(movies.totalCount, 15);
    expect(movies.items.skip(2).map((item) => item.id), [
      for (var n = 1; n <= 13; n++) 'movie-$n',
    ]);
    final folded = movies.items[4];
    expect(
      unifiedCopiesOf(folded.rawData).map((copy) => copy.key),
      ['a|movie-3', 'b|movie-3'],
    );
    expect(
      movies.items.where((item) => unifiedCopiesOf(item.rawData).isNotEmpty),
      [folded],
    );
  });

  test('a title with a blocked copy on any server is left out', () async {
    await mergeRows(libraries: true);
    await prefs.set(UserPreferences.blockedParentalRatings, 'ZZ-18');
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Tmdb': '1003'},
      'c': {'Tmdb': '1004'},
    };
    // Only the second server rates the shared title as blocked.
    movieExtras = {
      'a': {'OfficialRating': 'ZZ-7'},
      'b': {'OfficialRating': 'ZZ-18'},
    };

    final rows = await repository(['a', 'b', 'c'])
        .getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.id), ['c-movies-new']);
  });

  test('without the libraries merged by type, a card carries no copies and '
      'each server drops its own blocked titles', () async {
    await mergeRows(libraries: false);
    await prefs.set(UserPreferences.blockedParentalRatings, 'ZZ-18');
    movieProviderIds = {
      'a': {'Tmdb': '1003'},
      'b': {'Tmdb': '1003'},
    };
    movieExtras = {
      'b': {'OfficialRating': 'ZZ-18'},
    };

    final rows = await repository(['a', 'b']).getAggregatedLatestMediaRows();

    final movies = rows.firstWhere((row) => row.id.endsWith('movies'));
    expect(movies.items.map((item) => item.id), ['a-movies-new']);
    expect(movies.items.single.rawData.containsKey(unifiedCopiesKey), isFalse);
  });
}
