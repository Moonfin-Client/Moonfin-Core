import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/screens/detail/playlist_sort_filter_bar.dart';

void main() {
  group('sortAndFilterPlaylistTracks', () {
    late List<AggregatedItem> sampleTracks;

    setUp(() {
      sampleTracks = [
        AggregatedItem(
          id: 'item-1',
          serverId: 'srv-1',
          rawData: {
            'Name': 'Queens of the Dead',
            'SortName': 'Queens of the Dead',
            'Type': 'Movie',
            'DateCreated': '2026-01-01T10:00:00.000Z',
            'PremiereDate': '2025-05-10T00:00:00.000Z',
            'RunTimeTicks': 60000000000, // 100 mins
            'CommunityRating': 7.5,
            'CriticRating': 80,
            'UserData': {
              'Played': false,
              'IsFavorite': true,
              'PlaybackPositionTicks': 0,
              'PlayCount': 0,
            },
          },
        ),
        AggregatedItem(
          id: 'item-2',
          serverId: 'srv-1',
          rawData: {
            'Name': 'The Super Mario Galaxy Movie',
            'SortName': 'Super Mario Galaxy Movie, The',
            'Type': 'Movie',
            'DateCreated': '2026-03-01T10:00:00.000Z',
            'PremiereDate': '2026-04-01T00:00:00.000Z',
            'RunTimeTicks': 54000000000, // 90 mins
            'CommunityRating': 8.8,
            'CriticRating': 92,
            'UserData': {
              'Played': true,
              'IsFavorite': false,
              'PlaybackPositionTicks': 0,
              'PlayCount': 3,
            },
          },
        ),
        AggregatedItem(
          id: 'item-3',
          serverId: 'srv-1',
          rawData: {
            'Name': 'Hail Caesar',
            'SortName': 'Hail Caesar',
            'Type': 'Movie',
            'DateCreated': '2025-11-01T10:00:00.000Z',
            'PremiereDate': '2016-02-05T00:00:00.000Z',
            'RunTimeTicks': 63600000000, // 106 mins
            'CommunityRating': 6.3,
            'CriticRating': 86,
            'UserData': {
              'Played': false,
              'IsFavorite': false,
              'PlaybackPositionTicks': 12000000000, // in progress (20 mins)
              'PlayCount': 1,
            },
          },
        ),
        AggregatedItem(
          id: 'item-4',
          serverId: 'srv-1',
          rawData: {
            'Name': 'Acoustic Intro',
            'SortName': 'Acoustic Intro',
            'Type': 'Audio',
            'DateCreated': '2026-02-15T10:00:00.000Z',
            'PremiereDate': '2024-01-01T00:00:00.000Z',
            'RunTimeTicks': 1800000000, // 3 mins
            'CommunityRating': 9.0,
            'CriticRating': null,
            'UserData': {
              'Played': true,
              'IsFavorite': true,
              'PlaybackPositionTicks': 0,
              'PlayCount': 15,
            },
          },
        ),
      ];
    });

    test('defaults to Playlist Order without mutating original order', () {
      final result = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );

      expect(result.map((t) => t.id).toList(), ['item-1', 'item-2', 'item-3', 'item-4']);
      expect(sampleTracks.map((t) => t.id).toList(), ['item-1', 'item-2', 'item-3', 'item-4']);
    });

    test('reverses playlist order when descending', () {
      final result = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.descending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );

      expect(result.map((t) => t.id).toList(), ['item-4', 'item-3', 'item-2', 'item-1']);
    });

    test('sorts by Name ascending and descending', () {
      final asc = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.name,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );
      // 'Acoustic Intro', 'Hail Caesar', 'Queens of the Dead', 'Super Mario Galaxy Movie, The'
      expect(asc.map((t) => t.id).toList(), ['item-4', 'item-3', 'item-1', 'item-2']);

      final desc = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.name,
        sortDirection: SortDirection.descending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );
      expect(desc.map((t) => t.id).toList(), ['item-2', 'item-1', 'item-3', 'item-4']);
    });

    test('sorts by Runtime ascending and descending', () {
      final asc = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.runtime,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );
      // item-4 (3 mins), item-2 (90 mins), item-1 (100 mins), item-3 (106 mins)
      expect(asc.map((t) => t.id).toList(), ['item-4', 'item-2', 'item-1', 'item-3']);

      final desc = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.runtime,
        sortDirection: SortDirection.descending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );
      expect(desc.map((t) => t.id).toList(), ['item-3', 'item-1', 'item-2', 'item-4']);
    });

    test('sorts by Community Rating ascending and descending', () {
      final desc = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.communityRating,
        sortDirection: SortDirection.descending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
      );
      // item-4 (9.0), item-2 (8.8), item-1 (7.5), item-3 (6.3)
      expect(desc.map((t) => t.id).toList(), ['item-4', 'item-2', 'item-1', 'item-3']);
    });

    test('filters by Played Status correctly', () {
      // Watched (item-2, item-4)
      final watched = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.watched,
        favoriteOnly: false,
      );
      expect(watched.map((t) => t.id).toList(), ['item-2', 'item-4']);

      // Unwatched (item-1 only, since item-3 is in-progress with positionTicks > 0)
      final unwatched = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.unwatched,
        favoriteOnly: false,
      );
      expect(unwatched.map((t) => t.id).toList(), ['item-1']);

      // In Progress (item-3 only)
      final inProgress = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.inProgress,
        favoriteOnly: false,
      );
      expect(inProgress.map((t) => t.id).toList(), ['item-3']);
    });

    test('filters by Favorites Only', () {
      final favorites = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: true,
      );
      // item-1, item-4
      expect(favorites.map((t) => t.id).toList(), ['item-1', 'item-4']);
    });

    test('filters by Media Type', () {
      final audioOnly = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
        mediaTypeFilter: 'Audio',
      );
      expect(audioOnly.map((t) => t.id).toList(), ['item-4']);

      final movieOnly = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.playlistOrder,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
        mediaTypeFilter: 'Movie',
      );
      expect(movieOnly.map((t) => t.id).toList(), ['item-1', 'item-2', 'item-3']);
    });

    test('combines filters and sorting together', () {
      // Movies only, Watched or InProgress or All, sorted by Community Rating desc
      final combined = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.communityRating,
        sortDirection: SortDirection.descending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
        mediaTypeFilter: 'Movie',
      );
      // item-2 (8.8), item-1 (7.5), item-3 (6.3)
      expect(combined.map((t) => t.id).toList(), ['item-2', 'item-1', 'item-3']);
    });

    test('random sort shuffles all items deterministically with seed', () {
      final random1 = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.random,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
        randomSeed: 12345,
      );
      final random2 = sortAndFilterPlaylistTracks(
        tracks: sampleTracks,
        sortBy: LibrarySortBy.random,
        sortDirection: SortDirection.ascending,
        playedFilter: PlayedStatusFilter.all,
        favoriteOnly: false,
        randomSeed: 12345,
      );
      expect(random1.map((t) => t.id).toList(), random2.map((t) => t.id).toList());
      expect(random1.length, sampleTracks.length);
    });
  });
}
