import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/playlist_utils.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

AggregatedItem _playlistItem(
  String id, {
  String? mediaType,
  int childCount = 2,
}) => AggregatedItem(
  id: id,
  serverId: 'server',
  rawData: <String, dynamic>{
    'Id': id,
    'Type': 'Playlist',
    'MediaType': ?mediaType,
    'ChildCount': childCount,
  },
);

void main() {
  group('resolveItemMediaType', () {
    test('resolves MusicVideo type to MusicVideo', () {
      expect(
        resolveItemMediaType({'Type': 'MusicVideo', 'MediaType': 'Video'}),
        'MusicVideo',
      );
    });

    test('resolves standard video types to Video', () {
      for (final type in ['Movie', 'Episode', 'Video', 'Trailer', 'Clip']) {
        expect(
          resolveItemMediaType({'Type': type, 'MediaType': 'Video'}),
          'Video',
        );
      }
    });

    test('resolves audio and audiobook types', () {
      expect(
        resolveItemMediaType({'Type': 'Audio', 'MediaType': 'Audio'}),
        'Audio',
      );
      expect(
        resolveItemMediaType({'Type': 'AudioBook', 'MediaType': 'Audio'}),
        'AudioBook',
      );
    });
  });

  group('resolvePlaylistCategory', () {
    late _MockClient client;
    late _MockItemsApi itemsApi;

    setUp(() {
      client = _MockClient();
      itemsApi = _MockItemsApi();
      when(() => client.itemsApi).thenReturn(itemsApi);
    });

    void stubItems(String id, List<Map<String, dynamic>> items) {
      when(
        () => itemsApi.getPlaylistItems(id, limit: any(named: 'limit')),
      ).thenAnswer((_) async => {'Items': items});
    }

    void verifyRead(String id) {
      verify(
        () => itemsApi.getPlaylistItems(id, limit: any(named: 'limit')),
      ).called(1);
    }

    test('classifies a playlist with only MusicVideo items as MusicVideo', () async {
      stubItems('pl-1', [
        {'Type': 'MusicVideo', 'MediaType': 'Video'},
        {'Type': 'MusicVideo', 'MediaType': 'Video'},
      ]);

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-1', mediaType: 'Video'),
      );
      expect(category, 'MusicVideo');
    });

    test('classifies a playlist with MusicVideo and Audio tracks as MusicVideo', () async {
      stubItems('pl-2', [
        {'Type': 'MusicVideo', 'MediaType': 'Video'},
        {'Type': 'Audio', 'MediaType': 'Audio'},
      ]);

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-2', mediaType: 'Audio'),
      );
      expect(category, 'MusicVideo');
    });

    test('classifies a playlist with only Audio tracks as Audio', () async {
      stubItems('pl-3', [
        {'Type': 'Audio', 'MediaType': 'Audio'},
        {'Type': 'Audio', 'MediaType': 'Audio'},
      ]);

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-3', mediaType: 'Audio'),
      );
      expect(category, 'Audio');
      // The catch falls back to the summary, which says Audio here too, so
      // check the read actually happened.
      verifyRead('pl-3');
    });

    test('classifies a playlist with movies/shows as Video', () async {
      stubItems('pl-4', [
        {'Type': 'Movie', 'MediaType': 'Video'},
        {'Type': 'Episode', 'MediaType': 'Video'},
      ]);

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-4', mediaType: 'Video'),
      );
      expect(category, 'Video');
      verifyRead('pl-4');
    });

    test('classifies a playlist with movies and music videos as Mixed', () async {
      stubItems('pl-5', [
        {'Type': 'Movie', 'MediaType': 'Video'},
        {'Type': 'MusicVideo', 'MediaType': 'Video'},
      ]);

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-5', mediaType: 'Video'),
      );
      expect(category, 'Mixed');
    });

    test('MusicVideo playlists are considered browsable in video rows', () async {
      stubItems('pl-6', [
        {'Type': 'MusicVideo', 'MediaType': 'Video'},
      ]);

      final browsable = await playlistHasBrowsableItems(
        client,
        _playlistItem('pl-6', mediaType: 'Video'),
      );
      expect(browsable, isTrue);
    });
    test('reads a bounded page rather than the whole playlist', () async {
      stubItems('pl-7', [
        {'Type': 'Audio', 'MediaType': 'Audio'},
      ]);

      await resolvePlaylistCategory(
        client,
        _playlistItem('pl-7', mediaType: 'Audio'),
      );

      final limit = verify(
        () => itemsApi.getPlaylistItems(
          'pl-7',
          limit: captureAny(named: 'limit'),
        ),
      ).captured.single;
      expect(
        limit,
        isPositive,
        reason: 'an unbounded read pulls every item of a long playlist',
      );
    });
  });
}
