import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/latest_media_row_normalizer.dart';
import 'package:server_core/server_core.dart';

class _ItemsApi extends Mock implements ItemsApi {}

Future<Map<String, dynamic>> _seriesLookup(_ItemsApi api) =>
    api.getItems(ids: any(named: 'ids'), fields: 'UserData');

void _answerSeries(_ItemsApi api, Map<String, int> unplayedById) {
  when(() => _seriesLookup(api)).thenAnswer(
    (_) async => {
      'Items': [
        for (final MapEntry(key: id, value: unplayed) in unplayedById.entries)
          {
            'Id': id,
            'Type': 'Series',
            'UserData': {'Played': false, 'UnplayedItemCount': unplayed},
          },
      ],
    },
  );
}

AggregatedItem _createItem({
  required String id,
  required String name,
  required String type,
  String? seriesId,
  String? seriesName,
  String? seriesPrimaryImageTag,
  String? parentPrimaryImageTag,
  String? primaryImageTag,
  String? parentThumbImageTag,
  String? parentThumbItemId,
  String? parentBackdropItemId,
  List<String>? parentBackdropImageTags,
  List<String>? backdropImageTags,
  String? parentLogoImageTag,
  String? parentLogoItemId,
}) {
  final imageTags = <String, dynamic>{};
  if (primaryImageTag != null) {
    imageTags['Primary'] = primaryImageTag;
  }

  return AggregatedItem(
    id: id,
    serverId: 'server1',
    rawData: {
      'Id': id,
      'Name': name,
      'Type': type,
      'SeriesId': ?seriesId,
      'SeriesName': ?seriesName,
      'SeriesPrimaryImageTag': ?seriesPrimaryImageTag,
      'ParentPrimaryImageTag': ?parentPrimaryImageTag,
      'PrimaryImageTag': ?primaryImageTag,
      if (imageTags.isNotEmpty) 'ImageTags': imageTags,
      'ParentThumbImageTag': ?parentThumbImageTag,
      'ParentThumbItemId': ?parentThumbItemId,
      'ParentBackdropItemId': ?parentBackdropItemId,
      'ParentBackdropImageTags': ?parentBackdropImageTags,
      'BackdropImageTags': ?backdropImageTags,
      'ParentLogoImageTag': ?parentLogoImageTag,
      'ParentLogoItemId': ?parentLogoItemId,
    },
  );
}

void main() {
  group('latestMediaFetchLimitForCollection', () {
    test('expands limit for tvshows and shows', () {
      expect(
        latestMediaFetchLimitForCollection('tvshows', defaultLimit: 15, maxLimit: 100),
        equals(60),
      );
      expect(
        latestMediaFetchLimitForCollection('shows', defaultLimit: 15, maxLimit: 100),
        equals(60),
      );
    });

    test('respects maxLimit when expanded limit exceeds it', () {
      expect(
        latestMediaFetchLimitForCollection('tvshows', defaultLimit: 30, maxLimit: 100),
        equals(100),
      );
    });

    test('returns defaultLimit for other types or null', () {
      expect(
        latestMediaFetchLimitForCollection('movies', defaultLimit: 15, maxLimit: 100),
        equals(15),
      );
      expect(
        latestMediaFetchLimitForCollection(null, defaultLimit: 15, maxLimit: 100),
        equals(15),
      );
    });

    test('expands limit when hideWatched is true', () {
      expect(
        latestMediaFetchLimitForCollection(
          'movies',
          defaultLimit: 15,
          maxLimit: 100,
          hideWatched: true,
        ),
        equals(60),
      );
    });
  });

  group('normalizeLatestMediaItems', () {
    final seasonItem = _createItem(
      id: 'season-party-down-1',
      name: 'Season 1',
      type: 'Season',
      seriesId: 'series-party-down',
      seriesName: 'Party Down',
      seriesPrimaryImageTag: 'tag123',
    );

    final episodeItem = _createItem(
      id: 'ep-misfits-1',
      name: 'Episode 1',
      type: 'Episode',
      seriesId: 'series-misfits',
      seriesName: 'Misfits',
      seriesPrimaryImageTag: 'seriesTag456',
    );

    final seriesItem = _createItem(
      id: 'series-firefly',
      name: 'Firefly',
      type: 'Series',
    );

    final movieItem = _createItem(
      id: 'movie-the-matrix',
      name: 'The Matrix',
      type: 'Movie',
    );

    test('collapses Season and Episode items into Series when collectionType is tvshows', () {
      final input = [seasonItem, episodeItem, seriesItem];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.length, equals(3));
      expect(result[0].id, equals('series-party-down'));
      expect(result[0].name, equals('Party Down'));
      expect(result[0].type, equals('Series'));
      expect(result[0].primaryImageTagField, equals('tag123'));

      expect(result[1].id, equals('series-misfits'));
      expect(result[1].name, equals('Misfits'));
      expect(result[1].type, equals('Series'));
      expect(result[1].primaryImageTagField, equals('seriesTag456'));

      expect(result[2].id, equals('series-firefly'));
      expect(result[2].name, equals('Firefly'));
      expect(result[2].type, equals('Series'));
    });

    test('collapses Season and Episode items when collectionType is shows alias', () {
      final input = [seasonItem];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: 'shows',
        limit: 10,
      );

      expect(result.length, equals(1));
      expect(result[0].id, equals('series-party-down'));
      expect(result[0].name, equals('Party Down'));
      expect(result[0].type, equals('Series'));
    });

    test('auto-detects TV items and collapses them even when collectionType is null', () {
      final input = [seasonItem, seriesItem];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: null,
        limit: 10,
      );

      expect(result.length, equals(2));
      expect(result[0].id, equals('series-party-down'));
      expect(result[0].name, equals('Party Down'));
      expect(result[0].type, equals('Series'));
    });

    test('deduplicates multiple seasons or episodes from the same series', () {
      final season2 = _createItem(
        id: 'season-party-down-2',
        name: 'Season 2',
        type: 'Season',
        seriesId: 'series-party-down',
        seriesName: 'Party Down',
      );

      final input = [seasonItem, season2];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.length, equals(1));
      expect(result[0].id, equals('series-party-down'));
      expect(result[0].name, equals('Party Down'));
    });

    test('does not collapse non-TV items like movies', () {
      final input = [movieItem];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: 'movies',
        limit: 10,
      );

      expect(result.length, equals(1));
      expect(result[0].id, equals('movie-the-matrix'));
      expect(result[0].name, equals('The Matrix'));
      expect(result[0].type, equals('Movie'));
    });

    test('does not collapse movie items when collectionType is null', () {
      final input = [movieItem];
      final result = normalizeLatestMediaItems(
        input,
        collectionType: null,
        limit: 10,
      );

      expect(result.length, equals(1));
      expect(result[0].id, equals('movie-the-matrix'));
      expect(result[0].name, equals('The Matrix'));
      expect(result[0].type, equals('Movie'));
    });

    test('leaves a movie alone in a mixed list with no collectionType', () {
      final result = normalizeLatestMediaItems(
        [movieItem, episodeItem],
        collectionType: null,
        limit: 10,
      );

      expect(result.length, equals(2));
      expect(result[0].id, equals('movie-the-matrix'));
      expect(result[0].type, equals('Movie'));
      expect(result[1].id, equals('series-misfits'));
      expect(result[1].type, equals('Series'));
    });

    test('a season with no series tag takes its parent tag', () {
      final season = _createItem(
        id: 'season-fleabag-1',
        name: 'Season 1',
        type: 'Season',
        seriesId: 'series-fleabag',
        seriesName: 'Fleabag',
        parentPrimaryImageTag: 'seriesArt',
      );

      final result = normalizeLatestMediaItems(
        [season],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.primaryImageTagField, equals('seriesArt'));
    });

    test('an episode does not take its season tag', () {
      final episode = _createItem(
        id: 'ep-fleabag-1',
        name: 'Episode 1',
        type: 'Episode',
        seriesId: 'series-fleabag',
        seriesName: 'Fleabag',
        parentPrimaryImageTag: 'seasonArt',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.id, equals('series-fleabag'));
      expect(result.single.primaryImageTagField, isNull);
    });

    test('an episode preserves parent thumb tag onto ImageTags Thumb', () {
      final episode = _createItem(
        id: 'ep-dark-1',
        name: 'Secrets',
        type: 'Episode',
        seriesId: 'series-dark',
        seriesName: 'Dark',
        parentThumbImageTag: 'darkThumb123',
        parentThumbItemId: 'series-dark',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.id, equals('series-dark'));
      expect(result.single.thumbImageTag, equals('darkThumb123'));
    });

    test('an episode carries the show logo onto the series card', () {
      final episode = _createItem(
        id: 'ep-dark-3',
        name: 'Truths',
        type: 'Episode',
        seriesId: 'series-dark',
        seriesName: 'Dark',
        parentLogoImageTag: 'darkLogo789',
        parentLogoItemId: 'series-dark',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.id, equals('series-dark'));
      expect(result.single.logoImageTag, equals('darkLogo789'));
    });

    test('a season carries the show logo onto the series card', () {
      final season = _createItem(
        id: 'season-dark-2',
        name: 'Season 2',
        type: 'Season',
        seriesId: 'series-dark',
        seriesName: 'Dark',
        parentLogoImageTag: 'darkLogo789',
        parentLogoItemId: 'series-dark',
      );

      final result = normalizeLatestMediaItems(
        [season],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.logoImageTag, equals('darkLogo789'));
    });

    test('an episode ignores a logo that is not the show\'s', () {
      final episode = _createItem(
        id: 'ep-dark-4',
        name: 'Origins',
        type: 'Episode',
        seriesId: 'series-dark',
        seriesName: 'Dark',
        parentLogoImageTag: 'otherLogo',
        parentLogoItemId: 'collection-1',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.logoImageTag, isNull);
    });

    test('an episode ignores a thumb tag belonging to its season', () {
      final episode = _createItem(
        id: 'ep-dark-2',
        name: 'Lies',
        type: 'Episode',
        seriesId: 'series-dark',
        seriesName: 'Dark',
        parentThumbImageTag: 'seasonThumb456',
        parentThumbItemId: 'season-dark-1',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(result.single.id, equals('series-dark'));
      expect(
        result.single.thumbImageTag,
        isNull,
        reason: "the tag names the season, so it wouldn't load for the series",
      );
    });

    test('an episode takes the series primary tag over its own', () {
      final episode = _createItem(
        id: 'ep-dm-1',
        name: 'Stars, Hide Your Fires',
        type: 'Episode',
        seriesId: 'series-dm',
        seriesName: 'Dark Matter',
        primaryImageTag: 'episodeStillTag123',
        seriesPrimaryImageTag: 'seriesPosterTag456',
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      final series = result.single;
      expect(series.id, equals('series-dm'));
      expect(series.primaryImageTag, equals('seriesPosterTag456'));
      expect(series.primaryImageTagField, equals('seriesPosterTag456'));
      expect(series.primaryImageItemId, equals('series-dm'));
    });

    test('an episode drops a primary tag that is its own', () {
      final episode = _createItem(
        id: 'ep-dm-2',
        name: 'Episode 2',
        type: 'Episode',
        seriesId: 'series-dm',
        seriesName: 'Dark Matter',
        primaryImageTag: 'episodeStillTag123',
        seriesPrimaryImageTag: null,
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      final series = result.single;
      expect(series.id, equals('series-dm'));
      expect(series.primaryImageTag, isNull);
      expect(series.primaryImageTagField, isNull);
      expect(series.primaryImageItemId, equals('series-dm'));
    });

    test('an episode maps parent backdrop tags to BackdropImageTags', () {
      final episode = _createItem(
        id: 'ep-dm-3',
        name: 'Episode 3',
        type: 'Episode',
        seriesId: 'series-dm',
        seriesName: 'Dark Matter',
        parentBackdropItemId: 'series-dm',
        parentBackdropImageTags: ['seriesBackdropTag789'],
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      final series = result.single;
      expect(series.id, equals('series-dm'));
      expect(series.backdropImageTags, equals(['seriesBackdropTag789']));
    });

    test('an episode drops a backdrop that is its own', () {
      final episode = _createItem(
        id: 'ep-dm-4',
        name: 'Episode 4',
        type: 'Episode',
        seriesId: 'series-dm',
        seriesName: 'Dark Matter',
        seriesPrimaryImageTag: 'seriesPosterTag456',
        backdropImageTags: const ['episodeBackdropTag'],
      );

      final result = normalizeLatestMediaItems(
        [episode],
        collectionType: 'tvshows',
        limit: 10,
      );

      expect(
        result.single.backdropImageTags,
        isEmpty,
        reason: 'the tag names the episode, not the series',
      );
    });

    test('hideWatched filters out played movies and fully watched series', () {
      const playedMovie = AggregatedItem(
        id: 'm1',
        serverId: 'server1',
        rawData: {
          'Id': 'm1',
          'Name': 'Played Movie',
          'Type': 'Movie',
          'UserData': {'Played': true},
        },
      );
      const unplayedMovie = AggregatedItem(
        id: 'm2',
        serverId: 'server1',
        rawData: {
          'Id': 'm2',
          'Name': 'Unplayed Movie',
          'Type': 'Movie',
          'UserData': {'Played': false},
        },
      );
      const watchedSeries = AggregatedItem(
        id: 's1',
        serverId: 'server1',
        rawData: {
          'Id': 's1',
          'Name': 'Watched Series',
          'Type': 'Series',
          'UserData': {'Played': false, 'UnplayedItemCount': 0},
          'ChildCount': 3,
        },
      );
      const partialSeries = AggregatedItem(
        id: 's2',
        serverId: 'server1',
        rawData: {
          'Id': 's2',
          'Name': 'Partial Series',
          'Type': 'Series',
          'UserData': {'Played': false, 'UnplayedItemCount': 2},
          'ChildCount': 3,
        },
      );

      final result = normalizeLatestMediaItems(
        [playedMovie, unplayedMovie, watchedSeries, partialSeries],
        limit: 10,
        hideWatched: true,
      );

      expect(result.map((i) => i.id).toList(), equals(['m2', 's2']));
    });
  });

  group('withSeriesUserData', () {
    late _ItemsApi api;

    setUp(() => api = _ItemsApi());

    List<AggregatedItem> latestTvRow() => normalizeLatestMediaItems(
      [
        _createItem(
          id: 'e1',
          name: 'Episode',
          type: 'Episode',
          seriesId: 's1',
          seriesName: 'From an Episode',
        ),
        _createItem(
          id: 'se1',
          name: 'Season 2',
          type: 'Season',
          seriesId: 's2',
          seriesName: 'From a Season',
        ),
        _createItem(id: 's3', name: 'Sent as a Series', type: 'Series'),
      ],
      collectionType: 'tvshows',
      limit: 10,
    );

    test('series cards from episodes and seasons take the show counts', () async {
      _answerSeries(api, {'s1': 7, 's2': 9});

      final result = await withSeriesUserData(latestTvRow(), (_) => api);

      expect(result.map((i) => i.unplayedItemCount), [7, 9, null]);
      verify(
        () => api.getItems(ids: ['s1', 's2'], fields: 'UserData'),
      ).called(1);
    });

    test('a row of shows sent as series asks for nothing', () async {
      final row = [_createItem(id: 's3', name: 'Series', type: 'Series')];

      expect(await withSeriesUserData(row, (_) => api), same(row));
      verifyZeroInteractions(api);
    });

    test('a failed lookup keeps the cards', () async {
      when(() => _seriesLookup(api)).thenThrow(Exception('offline'));
      final row = latestTvRow();

      expect(await withSeriesUserData(row, (_) => api), same(row));
    });

    test('each server is asked about its own cards', () async {
      final other = _ItemsApi();
      _answerSeries(api, {'s1': 3});
      _answerSeries(other, {'s1': 8});
      final card = latestTvRow().first;
      final row = [
        card,
        AggregatedItem(id: 's1', serverId: 'server2', rawData: card.rawData),
      ];

      final result = await withSeriesUserData(
        row,
        (serverId) => serverId == 'server1' ? api : other,
      );

      expect(result.map((i) => i.unplayedItemCount), [3, 8]);
    });
  });
}
