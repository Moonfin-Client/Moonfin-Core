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

  group('normalizeAndHydrateLatestMediaItems', () {
    test(
      'hydrates collapsed Episode and Season cards with series UnplayedItemCount and skips native Series',
      () async {
        const episodeItem = AggregatedItem(
          id: 'ep-yaga-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-yaga-1',
            'Name': 'Episode 1',
            'Type': 'Episode',
            'SeriesId': 'series-yaga',
            'SeriesName': 'YAGA',
            'UserData': {'Played': false},
          },
        );
        const seasonItem = AggregatedItem(
          id: 'season-foundation-2',
          serverId: 'server1',
          rawData: {
            'Id': 'season-foundation-2',
            'Name': 'Season 2',
            'Type': 'Season',
            'SeriesId': 'series-foundation',
            'SeriesName': 'Foundation',
            'UserData': {'Played': false, 'UnplayedItemCount': 10},
            'ChildCount': 10,
          },
        );
        const nativeSeries = AggregatedItem(
          id: 'series-cyberpunk',
          serverId: 'server1',
          rawData: {
            'Id': 'series-cyberpunk',
            'Name': 'Cyberpunk: Edgerunners',
            'Type': 'Series',
            'UserData': {'Played': false, 'UnplayedItemCount': 20},
            'ChildCount': 1,
          },
        );

        List<String>? requestedIds;
        final result = await normalizeAndHydrateLatestMediaItems(
          [episodeItem, seasonItem, nativeSeries],
          collectionType: 'tvshows',
          limit: 10,
          fetchSeriesByIds: (ids) async {
            requestedIds = ids;
            return [
              {
                'Id': 'series-yaga',
                'Type': 'Series',
                'UserData': {'Played': false, 'UnplayedItemCount': 6},
                'ChildCount': 1,
                'RecursiveItemCount': 6,
              },
              {
                'Id': 'series-foundation',
                'Type': 'Series',
                'UserData': {'Played': false, 'UnplayedItemCount': 24},
                'ChildCount': 3,
                'RecursiveItemCount': 30,
              },
            ];
          },
        );

        expect(requestedIds, equals(['series-yaga', 'series-foundation']));
        expect(result.length, equals(3));
        expect(result[0].id, equals('series-yaga'));
        expect(result[0].unplayedItemCount, equals(6));
        expect(result[1].id, equals('series-foundation'));
        expect(result[1].unplayedItemCount, equals(24));
        expect(result[1].childCount, equals(3));
        expect(result[2].id, equals('series-cyberpunk'));
        expect(result[2].unplayedItemCount, equals(20));
      },
    );

    test('skips fetchSeriesByIds when all items are already Series or Movies', () async {
      const nativeSeries = AggregatedItem(
        id: 'series-1',
        serverId: 'server1',
        rawData: {
          'Id': 'series-1',
          'Name': 'Show 1',
          'Type': 'Series',
          'UserData': {'Played': false, 'UnplayedItemCount': 5},
        },
      );

      var called = false;
      final result = await normalizeAndHydrateLatestMediaItems(
        [nativeSeries],
        collectionType: 'tvshows',
        limit: 10,
        fetchSeriesByIds: (_) async {
          called = true;
          return const [];
        },
      );

      expect(called, isFalse);
      expect(result.single.unplayedItemCount, equals(5));
    });

    test(
      'hideWatched evaluates hydrated series UserData rather than episode Played state',
      () async {
        const watchedEpisodeOfUnfinishedSeries = AggregatedItem(
          id: 'ep-yaga-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-yaga-1',
            'Name': 'Episode 1',
            'Type': 'Episode',
            'SeriesId': 'series-yaga',
            'SeriesName': 'YAGA',
            'UserData': {'Played': true},
          },
        );
        const unwatchedEpisodeOfFinishedSeries = AggregatedItem(
          id: 'ep-done-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-done-1',
            'Name': 'Episode 1',
            'Type': 'Episode',
            'SeriesId': 'series-done',
            'SeriesName': 'Done Show',
            'UserData': {'Played': false},
          },
        );

        final result = await normalizeAndHydrateLatestMediaItems(
          [watchedEpisodeOfUnfinishedSeries, unwatchedEpisodeOfFinishedSeries],
          collectionType: 'tvshows',
          limit: 10,
          hideWatched: true,
          fetchSeriesByIds: (_) async => [
            {
              'Id': 'series-yaga',
              'Type': 'Series',
              'UserData': {'Played': false, 'UnplayedItemCount': 5},
              'ChildCount': 1,
            },
            {
              'Id': 'series-done',
              'Type': 'Series',
              'UserData': {'Played': true, 'UnplayedItemCount': 0},
              'ChildCount': 1,
            },
          ],
        );

        expect(result.map((i) => i.id).toList(), equals(['series-yaga']));
        expect(result.single.unplayedItemCount, equals(5));
      },
    );

    test('falls back to collapsed cards if fetchSeriesByIds throws', () async {
      const seasonItem = AggregatedItem(
        id: 'season-1',
        serverId: 'server1',
        rawData: {
          'Id': 'season-1',
          'Name': 'Season 1',
          'Type': 'Season',
          'SeriesId': 'series-1',
          'SeriesName': 'Show 1',
          'UserData': {'Played': false, 'UnplayedItemCount': 8},
        },
      );

      final result = await normalizeAndHydrateLatestMediaItems(
        [seasonItem],
        collectionType: 'tvshows',
        limit: 10,
        fetchSeriesByIds: (_) async => throw Exception('network error'),
      );

      expect(result.single.id, equals('series-1'));
      expect(result.single.unplayedItemCount, equals(8));
    });

    test(
      'hideWatched preserves show with older unwatched episode when newest episode is watched and hydration fails',
      () async {
        const watchedNewestEpisode = AggregatedItem(
          id: 'ep-yaga-2',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-yaga-2',
            'Name': 'Episode 2',
            'Type': 'Episode',
            'SeriesId': 'series-yaga',
            'SeriesName': 'YAGA',
            'UserData': {'Played': true},
          },
        );
        const unwatchedOlderEpisode = AggregatedItem(
          id: 'ep-yaga-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-yaga-1',
            'Name': 'Episode 1',
            'Type': 'Episode',
            'SeriesId': 'series-yaga',
            'SeriesName': 'YAGA',
            'UserData': {'Played': false},
          },
        );

        final result = await normalizeAndHydrateLatestMediaItems(
          [watchedNewestEpisode, unwatchedOlderEpisode],
          collectionType: 'tvshows',
          limit: 10,
          hideWatched: true,
          fetchSeriesByIds: (_) async => throw Exception('network error'),
        );

        expect(result.map((i) => i.id).toList(), equals(['series-yaga']));
        expect(result.single.isPlayed, isFalse);
      },
    );

    test('chunks series hydration requests into batches of 100', () async {
      final episodes = [
        for (var i = 0; i < 150; i++)
          AggregatedItem(
            id: 'ep-$i',
            serverId: 'server1',
            rawData: {
              'Id': 'ep-$i',
              'Name': 'Episode 1',
              'Type': 'Episode',
              'SeriesId': 'series-$i',
              'SeriesName': 'Show $i',
              'UserData': const {'Played': false},
            },
          ),
      ];

      final batchSizes = <int>[];
      final result = await normalizeAndHydrateLatestMediaItems(
        episodes,
        collectionType: 'tvshows',
        limit: 150,
        hideWatched: true,
        fetchSeriesByIds: (ids) async {
          batchSizes.add(ids.length);
          return [
            for (final id in ids)
              {
                'Id': id,
                'Type': 'Series',
                'UserData': {'Played': false, 'UnplayedItemCount': 4},
                'ChildCount': 1,
              },
          ];
        },
      );

      expect(batchSizes, equals([100, 50]));
      expect(result.length, equals(150));
      expect(result.last.unplayedItemCount, equals(4));
    });

    test('preserves earlier hydrated batches when a later batch fails', () async {
      final episodes = [
        for (var i = 0; i < 120; i++)
          AggregatedItem(
            id: 'ep-$i',
            serverId: 'server1',
            rawData: {
              'Id': 'ep-$i',
              'Name': 'Episode 1',
              'Type': 'Episode',
              'SeriesId': 'series-$i',
              'SeriesName': 'Show $i',
              'UserData': const {'Played': false},
            },
          ),
      ];

      var callCount = 0;
      final result = await normalizeAndHydrateLatestMediaItems(
        episodes,
        collectionType: 'tvshows',
        limit: 120,
        fetchSeriesByIds: (ids) async {
          callCount++;
          if (callCount == 2) throw Exception('second batch failed');
          return [
            for (final id in ids)
              {
                'Id': id,
                'Type': 'Series',
                'UserData': {'Played': false, 'UnplayedItemCount': 7},
                'ChildCount': 1,
              },
          ];
        },
      );

      expect(result.length, equals(120));
      expect(result.first.unplayedItemCount, equals(7));
      expect(result.last.unplayedItemCount, isNull);
    });

    test(
      'preserves filter-before-collapse order when hydration fails for mixed episodes',
      () async {
        const aWatchedNewest = AggregatedItem(
          id: 'ep-a-2',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-a-2',
            'Name': 'A Ep 2',
            'Type': 'Episode',
            'SeriesId': 'series-a',
            'SeriesName': 'Show A',
            'UserData': {'Played': true},
          },
        );
        const bUnwatchedMiddle = AggregatedItem(
          id: 'ep-b-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-b-1',
            'Name': 'B Ep 1',
            'Type': 'Episode',
            'SeriesId': 'series-b',
            'SeriesName': 'Show B',
            'UserData': {'Played': false},
          },
        );
        const aUnwatchedOldest = AggregatedItem(
          id: 'ep-a-1',
          serverId: 'server1',
          rawData: {
            'Id': 'ep-a-1',
            'Name': 'A Ep 1',
            'Type': 'Episode',
            'SeriesId': 'series-a',
            'SeriesName': 'Show A',
            'UserData': {'Played': false},
          },
        );

        final result = await normalizeAndHydrateLatestMediaItems(
          [aWatchedNewest, bUnwatchedMiddle, aUnwatchedOldest],
          collectionType: 'tvshows',
          limit: 1,
          hideWatched: true,
          fetchSeriesByIds: (_) async => throw Exception('network error'),
        );

        expect(result.map((i) => i.id).toList(), equals(['series-b']));
      },
    );

    test(
      'preserves relative order between unhydrated fallback cards and native Series after duplicate collapse',
      () async {
        AggregatedItem ep(String id, String seriesId) => AggregatedItem(
          id: id,
          serverId: 'server1',
          rawData: {
            'Id': id,
            'Name': 'Ep',
            'Type': 'Episode',
            'SeriesId': seriesId,
            'SeriesName': seriesId,
            'UserData': const {'Played': false},
          },
        );
        const nativeC = AggregatedItem(
          id: 'series-c',
          serverId: 'server1',
          rawData: {
            'Id': 'series-c',
            'Name': 'Show C',
            'Type': 'Series',
            'UserData': {'Played': false, 'UnplayedItemCount': 2},
          },
        );

        final result = await normalizeAndHydrateLatestMediaItems(
          [
            ep('a1', 'series-a'),
            ep('a2', 'series-a'),
            ep('a3', 'series-a'),
            ep('b1', 'series-b'),
            nativeC,
          ],
          collectionType: 'tvshows',
          limit: 2,
          hideWatched: true,
          fetchSeriesByIds: (_) async => throw Exception('network error'),
        );

        expect(
          result.map((i) => i.id).toList(),
          equals(['series-a', 'series-b']),
        );
      },
    );

    test(
      'preserves relative order between unhydrated fallback and partial-hydration cards',
      () async {
        AggregatedItem ep(String id, String seriesId, {bool watched = false}) =>
            AggregatedItem(
              id: id,
              serverId: 'server1',
              rawData: {
                'Id': id,
                'Name': 'Ep',
                'Type': 'Episode',
                'SeriesId': seriesId,
                'SeriesName': seriesId,
                'UserData': {'Played': watched},
              },
            );

        final result = await normalizeAndHydrateLatestMediaItems(
          [
            ep('a1', 'series-a', watched: true),
            ep('a2', 'series-a', watched: true),
            ep('a3', 'series-a', watched: true),
            ep('b1', 'series-b'),
            ep('c1', 'series-c'),
          ],
          collectionType: 'tvshows',
          limit: 1,
          hideWatched: true,
          fetchSeriesByIds: (_) async => [
            {
              'Id': 'series-c',
              'Type': 'Series',
              'UserData': {'Played': false, 'UnplayedItemCount': 3},
              'ChildCount': 1,
            },
          ],
        );

        expect(result.map((i) => i.id).toList(), equals(['series-b']));
      },
    );
  });
}
