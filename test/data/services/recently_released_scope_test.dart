import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() => GetIt.instance.reset());

  Future<void> preferSeriesType(RecentlyReleasedSeriesType type) async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.recentlyReleasedSeriesType, type);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
  }

  Future<({String types, bool recursive, bool? hideWatched})> requestFor(
    String? collectionType,
  ) async {
    bool? capturedHideWatched;
    final itemsApi = _MockItemsApi();
    when(
      () => itemsApi.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: any(named: 'recursive'),
        hideWatched: any(named: 'hideWatched'),
      ),
    ).thenAnswer((invocation) async {
      capturedHideWatched =
          invocation.namedArguments[#hideWatched] as bool?;
      return {'Items': <dynamic>[], 'TotalRecordCount': 0};
    });

    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);

    await RowDataSource(
      client,
    ).loadRecentlyReleased('lib1', 'A library', 'srv1', collectionType);

    final captured = verify(
      () => itemsApi.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: captureAny(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: captureAny(named: 'recursive'),
        hideWatched: any(named: 'hideWatched'),
      ),
    ).captured;
    // Named arguments come back in whatever order the call recorded them.
    final types = captured.whereType<List<String>>();
    return (
      types: types.isEmpty ? 'anything' : types.first.join(','),
      recursive: captured.whereType<bool>().first,
      hideWatched: capturedHideWatched,
    );
  }

  group('a library the row knows the shape of', () {
    test('movies are asked for below the library too', () async {
      final request = await requestFor('movies');
      expect(request.types, 'Movie');
      expect(request.recursive, isTrue);
    });

    test('books ask for both kinds a books library holds', () async {
      final request = await requestFor('books');
      expect(request.types, 'Book,AudioBook');
      expect(request.recursive, isTrue);
    });

    test('music stops at the album so tracks stay out of the row', () async {
      final request = await requestFor('music');
      expect(request.types, 'MusicAlbum');
      expect(request.recursive, isTrue);
    });

    test('a TV library follows the setting', () async {
      await preferSeriesType(RecentlyReleasedSeriesType.episode);
      final request = await requestFor('tvshows');
      expect(request.types, 'Episode');
      expect(request.recursive, isTrue);
    });
  });

  group('a library the row knows nothing about', () {
    // Going below it with nothing to ask for reaches every episode and track
    // under the library, and only a TV row folds those back up.
    test('a mixed library keeps to its top level', () async {
      final request = await requestFor('');
      expect(request.types, 'anything');
      expect(request.recursive, isFalse);
    });

    test('so does one whose kind is not covered', () async {
      final request = await requestFor('homevideos');
      expect(request.types, 'anything');
      expect(request.recursive, isFalse);
    });
  });

  test('a library that is not TV never reaches for the setting', () async {
    expect(GetIt.instance.isRegistered<UserPreferences>(), isFalse);
    final request = await requestFor('movies');
    expect(request.types, 'Movie');
    expect(request.recursive, isTrue);
    expect(request.hideWatched, isNull);
  });

  test('forwards hideWatched null when UserPreferences is registered but unset', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final request = await requestFor('movies');
    expect(request.hideWatched, isNull);
  });

  test('forwards hideWatched false when hideWatchedInRecentRows is explicitly disabled', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final request = await requestFor('movies');
    expect(request.hideWatched, isFalse);
  });

  test('forwards hideWatched true when hideWatchedInRecentRows is enabled', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.hideWatchedInRecentRows, true);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    final request = await requestFor('movies');
    expect(request.hideWatched, isTrue);
  });

  group('loadLatestMedia and latest_ paging with TotalRecordCount equal to returned list length', () {
    test('keeps Load More available for a full 15-item movie page and 30-item next page', () async {
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getLatestItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer((invocation) async {
        final limit = invocation.namedArguments[#limit] as int? ?? 15;
        final items = [
          for (var i = 0; i < limit; i++)
            <String, dynamic>{
              'Id': 'movie-$i',
              'Name': 'Movie $i',
              'Type': 'Movie',
            },
        ];
        return {'Items': items, 'TotalRecordCount': items.length};
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final row = await dataSource.loadLatestMedia('lib1', 'Movies', 'srv1', 'movies');
      expect(row.items, hasLength(15));
      expect(row.totalCount, 100);

      final (pagedItems, pagedTotal) = await dataSource.loadMore(
        row: row,
        serverId: 'srv1',
      );
      expect(pagedItems, hasLength(30));
      expect(pagedTotal, 100);
    });

    test('retries short TV row when preference is unset and server collapses episodes to fewer series', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      // hideWatchedInRecentRows is unset
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      final itemsApi = _MockItemsApi();
      final requestedLimits = <int>[];
      when(
        () => itemsApi.getRecentlyReleasedItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
          recursive: any(named: 'recursive'),
          hideWatched: any(named: 'hideWatched'),
        ),
      ).thenAnswer((invocation) async {
        final limit = invocation.namedArguments[#limit] as int? ?? 15;
        requestedLimits.add(limit);
        if (limit == 60) {
          // 60 episodes from only 5 series (e.g. Silo server filtered watched items)
          final items = [
            for (var i = 0; i < 60; i++)
              <String, dynamic>{
                'Id': 'ep-$i',
                'Name': 'Episode $i',
                'Type': 'Episode',
                'SeriesId': 'series-${i % 5}',
                'SeriesName': 'Series ${i % 5}',
              },
          ];
          return {'Items': items, 'TotalRecordCount': 60};
        } else {
          // Retry requests full page (limit: 500); returns 100 episodes from 20 series
          final items = [
            for (var i = 0; i < 100; i++)
              <String, dynamic>{
                'Id': 'ep-$i',
                'Name': 'Episode $i',
                'Type': 'Episode',
                'SeriesId': 'series-${i % 20}',
                'SeriesName': 'Series ${i % 20}',
              },
          ];
          return {'Items': items, 'TotalRecordCount': 100};
        }
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final row = await dataSource.loadRecentlyReleased('lib1', 'TV Shows', 'srv1', 'tvshows');
      expect(requestedLimits, [60, 500]);
      expect(row.items.length, 15);
    });

    test('preserves hasMore and reportedTotal for an expanded fetch with additional visible items', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.hideWatchedInRecentRows, true);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getLatestItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer((invocation) async {
        // Expanded fetch requests 45 items; server has 22 items (4 watched, 18 unwatched).
        final items = [
          for (var i = 0; i < 22; i++)
            <String, dynamic>{
              'Id': 'movie-$i',
              'Name': 'Movie $i',
              'Type': 'Movie',
              'UserData': {'Played': i < 4},
            },
        ];
        return {'Items': items, 'TotalRecordCount': items.length};
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final row = await dataSource.loadLatestMedia('lib1', 'Movies', 'srv1', 'movies');
      expect(row.items, hasLength(15));
      expect(row.totalCount, 22);
    });

    test('loadMore preserves pagination state when expanded retry fails on partial page', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      final requestedLimits = <int>[];
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getLatestItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer((invocation) async {
        final limit = invocation.namedArguments[#limit] as int;
        requestedLimits.add(limit);
        if (limit == 30) {
          // 30 episodes from 20 series -> collapses to 20 series cards (partial page, wanted: 30)
          final items = [
            for (var i = 0; i < 30; i++)
              <String, dynamic>{
                'Id': 'ep-$i',
                'Name': 'Episode $i',
                'Type': 'Episode',
                'SeriesId': 'series-${i % 20}',
                'SeriesName': 'Series ${i % 20}',
              },
          ];
          return {'Items': items, 'TotalRecordCount': 100};
        } else {
          // Retry at full row limit (500) fails with a network/server exception
          throw Exception('Server timeout during expansion');
        }
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final existingRow = HomeRow(
        id: 'latest_lib1',
        title: 'Latest TV',
        rowType: HomeRowType.latestMedia,
        items: [
          for (var i = 0; i < 15; i++)
            AggregatedItem(
              id: 'series-$i',
              serverId: 'srv1',
              rawData: {'Id': 'series-$i', 'Type': 'Series', 'Name': 'Series $i'},
            ),
        ],
        totalCount: 100,
      );

      final (items, totalCount) = await dataSource.loadMore(
        row: existingRow,
        serverId: 'srv1',
      );
      expect(requestedLimits, [30, 500]);
      expect(items, hasLength(20));
      expect(totalCount, 100);
      expect(items.length < totalCount, isTrue);
    });

    test('loadLatestMedia preserves pagination state when expanded retry fails on partial page', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      final requestedLimits = <int>[];
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getLatestItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer((invocation) async {
        final limit = invocation.namedArguments[#limit] as int;
        requestedLimits.add(limit);
        if (limit == 60) {
          // TV fetchLimit starts at 60; 60 episodes from 8 series -> collapses to 8 cards (< 15)
          final items = [
            for (var i = 0; i < 60; i++)
              <String, dynamic>{
                'Id': 'ep-$i',
                'Name': 'Episode $i',
                'Type': 'Episode',
                'SeriesId': 'series-${i % 8}',
                'SeriesName': 'Series ${i % 8}',
              },
          ];
          return {'Items': items, 'TotalRecordCount': 80};
        } else {
          // Retry fails
          throw Exception('Server timeout');
        }
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final row = await dataSource.loadLatestMedia('lib1', 'TV', 'srv1', 'tvshows');
      expect(requestedLimits, [60, 500]);
      expect(row.items, hasLength(8));
      expect(row.totalCount, 80);
      expect(row.hasMore, isTrue);
    });

    test('loadMore preserves existing cards and pagination when cumulative result does not grow', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.hideWatchedInRecentRows, false);
      GetIt.instance.registerSingleton<UserPreferences>(prefs);

      final initialItems = <AggregatedItem>[
        for (var i = 0; i < 8; i++)
          AggregatedItem(
            id: 'series-$i',
            serverId: 'srv1',
            rawData: {
              'Id': 'series-$i',
              'Name': 'Series $i',
              'Type': 'Series',
            },
          ),
      ];
      final initialRow = HomeRow(
        id: 'latest_lib1',
        title: 'TV',
        rowType: HomeRowType.latestMedia,
        items: initialItems,
        totalCount: 80,
      );

      final requestedLimits = <int>[];
      final itemsApi = _MockItemsApi();
      when(
        () => itemsApi.getLatestItems(
          parentId: any(named: 'parentId'),
          includeItemTypes: any(named: 'includeItemTypes'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImageTypes: any(named: 'enableImageTypes'),
          imageTypeLimit: any(named: 'imageTypeLimit'),
        ),
      ).thenAnswer((invocation) async {
        final limit = invocation.namedArguments[#limit] as int;
        requestedLimits.add(limit);
        if (limit == 23) {
          // 23 episodes only cover 3 series -> collapses to 3 cards (< 8 initial cards)
          final items = [
            for (var i = 0; i < 23; i++)
              <String, dynamic>{
                'Id': 'ep-$i',
                'Name': 'Episode $i',
                'Type': 'Episode',
                'SeriesId': 'series-${i % 3}',
                'SeriesName': 'Series ${i % 3}',
              },
          ];
          return {'Items': items, 'TotalRecordCount': 80};
        } else {
          // Retry fails
          throw Exception('Server timeout');
        }
      });

      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(itemsApi);
      final dataSource = RowDataSource(client);

      final (items, totalCount) = await dataSource.loadMore(
        row: initialRow,
        serverId: 'srv1',
      );

      expect(requestedLimits, [23, 500]);
      // Must preserve the 8 original cards instead of shrinking to 3
      expect(items, hasLength(8));
      expect(items.map((e) => e.id), initialItems.map((e) => e.id));
      expect(totalCount, 80);
      expect(totalCount > items.length, isTrue);
    });
  });
}
