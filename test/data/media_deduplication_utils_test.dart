import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/media_deduplication_utils.dart';

AggregatedItem _item({
  required String id,
  String serverId = 's1',
  String name = 'Avatar',
  String type = 'Movie',
  int? year = 2009,
  Map<String, String>? providerIds,
  int? positionTicks,
  bool played = false,
  bool favorite = false,
}) => AggregatedItem(
  id: id,
  serverId: serverId,
  rawData: {
    'Name': name,
    'Type': type,
    'ProductionYear': ?year,
    'ProviderIds': ?providerIds,
    'UserData': {
      'PlaybackPositionTicks': ?positionTicks,
      'Played': played,
      'IsFavorite': favorite,
    },
  },
);

List<String> _ids(List<AggregatedItem> items) =>
    items.map((item) => item.id).toList();

void main() {
  group('getDeduplicationKey', () {
    test('prefers imdb, then tmdb, then tvdb', () {
      expect(
        MediaDeduplicationUtils.getDeduplicationKey(
          _item(id: '1', providerIds: {'Imdb': 'tt0499549', 'Tmdb': '19995'}),
        ),
        'imdb:tt0499549',
      );
      expect(
        MediaDeduplicationUtils.getDeduplicationKey(
          _item(id: '2', providerIds: {'Tmdb': '19995', 'Tvdb': '73739'}),
        ),
        'tmdb:19995',
      );
      expect(
        MediaDeduplicationUtils.getDeduplicationKey(
          _item(id: '3', providerIds: {'Tvdb': '73739'}),
        ),
        'tvdb:73739',
      );
    });

    test('reads provider names whatever case the server sent them in', () {
      final upper = MediaDeduplicationUtils.getDeduplicationKey(
        _item(id: '1', providerIds: {'IMDB': 'TT0499549'}),
      );
      final lower = MediaDeduplicationUtils.getDeduplicationKey(
        _item(id: '2', providerIds: {'imdb': 'tt0499549'}),
      );
      expect(upper, 'imdb:tt0499549');
      expect(upper, lower);
    });

    test('an item with no provider id gets a key of its own', () {
      final a = MediaDeduplicationUtils.getDeduplicationKey(
        _item(id: '1', serverId: 's1'),
      );
      final b = MediaDeduplicationUtils.getDeduplicationKey(
        _item(id: '2', serverId: 's1'),
      );
      expect(a, isNot(b));
    });
  });

  group('deduplicateMediaItems', () {
    test('collapses the same title from two servers', () {
      final result = MediaDeduplicationUtils.deduplicateMediaItems([
        _item(id: '1', serverId: 's1', providerIds: {'Imdb': 'tt0499549'}),
        _item(id: '2', serverId: 's2', providerIds: {'Imdb': 'tt0499549'}),
        _item(id: '3', name: 'Titanic', providerIds: {'Imdb': 'tt0120338'}),
      ]);

      expect(_ids(result), ['1', '3']);
    });

    test('keeps the copy the user is furthest through', () {
      final result = MediaDeduplicationUtils.deduplicateMediaItems([
        _item(
          id: '1',
          providerIds: {'Imdb': 'tt0499549'},
          positionTicks: 1000,
        ),
        _item(
          id: '2',
          serverId: 's2',
          providerIds: {'Imdb': 'tt0499549'},
          positionTicks: 5000000,
        ),
      ]);

      expect(_ids(result), ['2']);
    });

    test('falls back to played, then favorite, when neither is started', () {
      final played = MediaDeduplicationUtils.deduplicateMediaItems([
        _item(id: '1', providerIds: {'Imdb': 'tt1'}),
        _item(id: '2', serverId: 's2', providerIds: {'Imdb': 'tt1'}, played: true),
      ]);
      expect(_ids(played), ['2']);

      final favorite = MediaDeduplicationUtils.deduplicateMediaItems([
        _item(id: '1', providerIds: {'Imdb': 'tt2'}),
        _item(
          id: '2',
          serverId: 's2',
          providerIds: {'Imdb': 'tt2'},
          favorite: true,
        ),
      ]);
      expect(_ids(favorite), ['2']);
    });

    test('keeps the order the titles first appeared in', () {
      final result = MediaDeduplicationUtils.deduplicateMediaItems([
        _item(id: '1', name: 'Titanic', providerIds: {'Imdb': 'tt0120338'}),
        _item(id: '2', providerIds: {'Imdb': 'tt0499549'}),
        _item(id: '3', serverId: 's2', providerIds: {'Imdb': 'tt0120338'}),
      ]);

      expect(_ids(result), ['1', '2']);
    });

    test('a tie resolves the same way on every run', () {
      // Nothing separates these but their ids, and an unstable pick would show
      // a different server's copy between one build of the row and the next.
      for (var run = 0; run < 5; run++) {
        final result = MediaDeduplicationUtils.deduplicateMediaItems([
          _item(id: 'b', serverId: 's2', providerIds: {'Imdb': 'tt1'}),
          _item(id: 'a', serverId: 's1', providerIds: {'Imdb': 'tt1'}),
        ]);
        expect(_ids(result), ['a']);
      }
    });

    group('never merges on title alone', () {
      test('two series both have a Season 1', () {
        final result = MediaDeduplicationUtils.deduplicateMediaItems([
          _item(id: '1', name: 'Season 1', type: 'Season', year: null),
          _item(id: '2', name: 'Season 1', type: 'Season', year: null),
        ]);

        expect(_ids(result), ['1', '2']);
      });

      test('unrelated series can share an episode title', () {
        final result = MediaDeduplicationUtils.deduplicateMediaItems([
          _item(id: '1', name: 'Pilot', type: 'Episode', year: null),
          _item(id: '2', name: 'Pilot', type: 'Episode', year: null),
        ]);

        expect(_ids(result), ['1', '2']);
      });

      test('different artists release albums under the same name', () {
        final result = MediaDeduplicationUtils.deduplicateMediaItems([
          _item(id: '1', name: 'Greatest Hits', type: 'MusicAlbum', year: null),
          _item(id: '2', name: 'Greatest Hits', type: 'MusicAlbum', year: null),
        ]);

        expect(_ids(result), ['1', '2']);
      });

      test('two servers can hold a playlist of the same name', () {
        final result = MediaDeduplicationUtils.deduplicateMediaItems([
          _item(id: '1', serverId: 's1', name: 'Favourites', type: 'Playlist'),
          _item(id: '2', serverId: 's2', name: 'Favourites', type: 'Playlist'),
        ]);

        expect(_ids(result), ['1', '2']);
      });
    });

    test('returns a new list and copes with nothing to do', () {
      final single = [_item(id: '1')];
      final result = MediaDeduplicationUtils.deduplicateMediaItems(single);

      expect(_ids(result), ['1']);
      expect(identical(result, single), isFalse);
      expect(MediaDeduplicationUtils.deduplicateMediaItems([]), isEmpty);
    });
  });
}
