import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/latest_media_row_normalizer.dart';

AggregatedItem _createItem({
  required String id,
  required String name,
  required String type,
  String? seriesId,
  String? seriesName,
  String? seriesPrimaryImageTag,
  String? parentPrimaryImageTag,
}) {
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
  });
}
