import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/offline/offline_catalog.dart';
import 'package:moonfin/data/offline/offline_items_api.dart';
import 'package:moonfin/data/offline/offline_user_views_api.dart';
import 'package:moonfin/data/offline/offline_views.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/storage_path_service.dart';

class _FakeStoragePathService extends StoragePathService {
  final Directory dir;
  _FakeStoragePathService(this.dir);

  @override
  Future<Directory> getImageCacheDir() async => dir;
}

void main() {
  late OfflineDatabase db;
  late OfflineRepository repo;
  late OfflineCatalog catalog;
  late OfflineItemsApi api;
  late Directory tempDir;

  Future<void> insert({
    required String id,
    required String type,
    required String name,
    Map<String, dynamic> metadata = const {},
    String? seriesId,
    String? seasonId,
    String? seriesName,
    String? seasonName,
    int? indexNumber,
    int? parentIndexNumber,
    int positionTicks = 0,
    int status = 2,
    DateTime? downloadedAt,
  }) async {
    await repo.upsertItem(
      DownloadedItemsCompanion(
        itemId: Value(id),
        serverId: const Value('http://server'),
        type: Value(type),
        name: Value(name),
        metadataJson: Value(
          jsonEncode({
            'Id': id,
            'Type': type,
            'Name': name,
            if (seriesId != null) 'SeriesId': seriesId,
            if (seasonId != null) 'SeasonId': seasonId,
            if (indexNumber != null) 'IndexNumber': indexNumber,
            if (parentIndexNumber != null)
              'ParentIndexNumber': parentIndexNumber,
            ...metadata,
          }),
        ),
        downloadStatus: Value(status),
        seriesId: Value(seriesId),
        seasonId: Value(seasonId),
        seriesName: Value(seriesName),
        seasonName: Value(seasonName),
        indexNumber: Value(indexNumber),
        parentIndexNumber: Value(parentIndexNumber),
        playbackPositionTicks: Value(positionTicks),
        downloadedAt: Value(downloadedAt),
      ),
    );
  }

  List<Map<String, dynamic>> items(Map<String, dynamic> envelope) =>
      (envelope['Items'] as List).cast<Map<String, dynamic>>();

  setUp(() async {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    catalog = OfflineCatalog(repo);
    tempDir = await Directory.systemTemp.createTemp('offline_api_test');
    api = OfflineItemsApi(catalog, _FakeStoragePathService(tempDir));
  });

  tearDown(() async {
    catalog.dispose();
    await db.close();
    await tempDir.delete(recursive: true);
  });

  group('getItems', () {
    test('filters, sorts and pages', () async {
      await insert(
        id: 'm1',
        type: 'Movie',
        name: 'Alpha',
        metadata: {
          'ProductionYear': 2001,
          'Genres': ['Action'],
          'GenreItems': [
            {'Id': 'g-action', 'Name': 'Action'},
          ],
        },
      );
      await insert(
        id: 'm2',
        type: 'Movie',
        name: 'Beta',
        metadata: {
          'ProductionYear': 1999,
          'Genres': ['Drama'],
          'UserData': {'IsFavorite': true},
        },
      );
      await insert(
        id: 'm3',
        type: 'Movie',
        name: 'Gamma',
        metadata: {
          'ProductionYear': 2010,
          'Genres': ['Action'],
        },
      );
      await insert(id: 'b1', type: 'Book', name: 'Delta');
      await catalog.warm();

      final movies = await api.getItems(parentId: OfflineViews.movies);
      expect(
        items(movies).map((i) => i['Id']),
        containsAll(['m1', 'm2', 'm3']),
      );
      expect(items(movies).any((i) => i['Id'] == 'b1'), isFalse);

      final sorted = await api.getItems(
        parentId: OfflineViews.movies,
        sortBy: 'ProductionYear',
        sortOrder: 'Descending',
      );
      expect(items(sorted).first['Id'], 'm3');

      final byGenreId = await api.getItems(genreIds: ['g-action']);
      expect(items(byGenreId).map((i) => i['Id']), ['m1']);
      final bySynthetic = await api.getItems(
        genreIds: ['offline-genre:action'],
      );
      expect(items(bySynthetic).map((i) => i['Id']).toSet(), {'m1', 'm3'});

      final favs = await api.getItems(isFavorite: true);
      expect(items(favs).map((i) => i['Id']), ['m2']);

      final search = await api.getItems(searchTerm: 'gam');
      expect(items(search).map((i) => i['Id']), ['m3']);

      final page = await api.getItems(
        parentId: OfflineViews.movies,
        sortBy: 'SortName',
        startIndex: 1,
        limit: 1,
      );
      expect(page['TotalRecordCount'], 3);
      expect(items(page).single['Id'], 'm2');

      final startsWith = await api.getItems(
        parentId: OfflineViews.movies,
        nameStartsWith: 'B',
      );
      expect(items(startsWith).single['Id'], 'm2');
    });

    test('series and season parent scoping', () async {
      await insert(id: 's1', type: 'Series', name: 'Show');
      await insert(
        id: 'se1',
        type: 'Season',
        name: 'Season 1',
        seriesId: 's1',
        indexNumber: 1,
      );
      await insert(
        id: 'e1',
        type: 'Episode',
        name: 'Pilot',
        seriesId: 's1',
        seasonId: 'se1',
        indexNumber: 1,
        parentIndexNumber: 1,
      );
      await catalog.warm();

      final children = await api.getItems(parentId: 's1');
      expect(items(children).map((i) => i['Id']).toSet(), {'se1', 'e1'});

      final episodes = await api.getItems(
        parentId: 'se1',
        includeItemTypes: ['Episode'],
      );
      expect(items(episodes).single['Id'], 'e1');
    });
  });

  test('getEpisodes and synthesized getSeasons', () async {
    await insert(
      id: 'e1',
      type: 'Episode',
      name: 'One',
      seriesId: 's1',
      seasonId: 'sea1',
      seasonName: 'Season 1',
      seriesName: 'Show',
      indexNumber: 1,
      parentIndexNumber: 1,
    );
    await insert(
      id: 'e2',
      type: 'Episode',
      name: 'Two',
      seriesId: 's1',
      seasonId: 'sea1',
      seasonName: 'Season 1',
      seriesName: 'Show',
      indexNumber: 2,
      parentIndexNumber: 1,
    );
    await catalog.warm();

    final episodes = await api.getEpisodes('s1', seasonId: 'sea1');
    expect(items(episodes).map((i) => i['Id']), ['e1', 'e2']);

    // There's no Season container row, so seasons come from the episodes.
    final seasons = await api.getSeasons('s1');
    final season = items(seasons).single;
    expect(season['Id'], 'sea1');
    expect(season['Type'], 'Season');
    expect(season['IndexNumber'], 1);
  });

  test('getNextUp returns first unplayed after last played', () async {
    await insert(
      id: 'e1',
      type: 'Episode',
      name: 'One',
      seriesId: 's1',
      indexNumber: 1,
      parentIndexNumber: 1,
      metadata: {
        'RunTimeTicks': 1000,
        'UserData': {'Played': true},
      },
    );
    await insert(
      id: 'e2',
      type: 'Episode',
      name: 'Two',
      seriesId: 's1',
      indexNumber: 2,
      parentIndexNumber: 1,
      metadata: {'RunTimeTicks': 1000},
    );
    await insert(
      id: 'e3',
      type: 'Episode',
      name: 'Three',
      seriesId: 's1',
      indexNumber: 3,
      parentIndexNumber: 1,
      metadata: {'RunTimeTicks': 1000},
    );
    await catalog.warm();

    final nextUp = await api.getNextUp();
    expect(items(nextUp).single['Id'], 'e2');

    // A series with no played episodes has no next-up entry.
    final scoped = await api.getNextUp(seriesId: 'other');
    expect(items(scoped), isEmpty);
  });

  test('getResumeItems uses live position and 90% cutoff', () async {
    await insert(
      id: 'm1',
      type: 'Movie',
      name: 'Halfway',
      positionTicks: 500,
      metadata: {'RunTimeTicks': 1000},
    );
    await insert(
      id: 'm2',
      type: 'Movie',
      name: 'Done',
      positionTicks: 950,
      metadata: {'RunTimeTicks': 1000},
    );
    await insert(id: 'm3', type: 'Movie', name: 'Unwatched');
    await catalog.warm();

    final resume = await api.getResumeItems();
    expect(items(resume).map((i) => i['Id']), ['m1']);

    // Live position was merged into UserData for the UI.
    final userData = items(resume).single['UserData'] as Map;
    expect(userData['PlaybackPositionTicks'], 500);
    expect(userData['PlayedPercentage'], 50.0);

    // The >=90% item was marked played instead.
    final done = await api.getItem('m2');
    expect((done['UserData'] as Map)['Played'], true);
  });

  test('getGenres aggregates distinct genres with counts', () async {
    await insert(
      id: 'm1',
      type: 'Movie',
      name: 'A',
      metadata: {
        'Genres': ['Action', 'Drama'],
      },
    );
    await insert(
      id: 'm2',
      type: 'Movie',
      name: 'B',
      metadata: {
        'Genres': ['Action'],
      },
    );
    await catalog.warm();

    final genres = await api.getGenres();
    final byName = {for (final g in items(genres)) g['Name'] as String: g};
    expect(byName.keys.toSet(), {'Action', 'Drama'});
    expect(byName['Action']!['MovieCount'], 2);
    expect(byName['Drama']!['MovieCount'], 1);
  });

  test('getLatestItems collapses episodes into series', () async {
    await insert(id: 's1', type: 'Series', name: 'Show');
    await insert(
      id: 'e1',
      type: 'Episode',
      name: 'One',
      seriesId: 's1',
      downloadedAt: DateTime(2026, 1, 2),
    );
    await insert(
      id: 'm1',
      type: 'Movie',
      name: 'Film',
      downloadedAt: DateTime(2026, 1, 1),
    );
    await catalog.warm();

    final latest = await api.getLatestItems();
    expect(items(latest).map((i) => i['Id']), ['s1', 'm1']);
  });

  test('getUserViews only returns populated views', () async {
    await insert(id: 'm1', type: 'Movie', name: 'Film');
    await insert(id: 'b1', type: 'Book', name: 'Book');
    await catalog.warm();

    final views = await OfflineUserViewsApi(catalog).getUserViews();
    final ids = items(views).map((i) => i['Id']).toSet();
    expect(ids, {OfflineViews.movies, OfflineViews.books});
    expect(items(views).every((v) => v['Type'] == 'CollectionFolder'), isTrue);
  });

  test('getItem answers synthetic views and 404s unknown ids', () async {
    await insert(id: 'm1', type: 'Movie', name: 'Film');
    await catalog.warm();

    final view = await api.getItem(OfflineViews.movies);
    expect(view['CollectionType'], 'movies');

    expect(() => api.getItem('nope'), throwsA(anything));
  });
}
