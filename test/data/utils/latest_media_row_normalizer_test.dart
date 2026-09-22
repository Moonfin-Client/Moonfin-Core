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
  String? primaryImageTag,
  String? parentThumbImageTag,
  String? parentThumbItemId,
  String? parentBackdropItemId,
  List<String>? parentBackdropImageTags,
  List<String>? backdropImageTags,
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
  });
}
