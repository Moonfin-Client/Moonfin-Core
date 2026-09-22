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

    test('classifies a playlist with only MusicVideo items as MusicVideo', () async {
      when(() => itemsApi.getPlaylistItems('pl-1')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'MusicVideo', 'MediaType': 'Video'},
            {'Type': 'MusicVideo', 'MediaType': 'Video'},
          ],
        },
      );

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-1', mediaType: 'Video'),
      );
      expect(category, 'MusicVideo');
    });

    test('classifies a playlist with MusicVideo and Audio tracks as MusicVideo', () async {
      when(() => itemsApi.getPlaylistItems('pl-2')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'MusicVideo', 'MediaType': 'Video'},
            {'Type': 'Audio', 'MediaType': 'Audio'},
          ],
        },
      );

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-2', mediaType: 'Audio'),
      );
      expect(category, 'MusicVideo');
    });

    test('classifies a playlist with only Audio tracks as Audio', () async {
      when(() => itemsApi.getPlaylistItems('pl-3')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'Audio', 'MediaType': 'Audio'},
            {'Type': 'Audio', 'MediaType': 'Audio'},
          ],
        },
      );

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-3', mediaType: 'Audio'),
      );
      expect(category, 'Audio');
    });

    test('classifies a playlist with movies/shows as Video', () async {
      when(() => itemsApi.getPlaylistItems('pl-4')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'Movie', 'MediaType': 'Video'},
            {'Type': 'Episode', 'MediaType': 'Video'},
          ],
        },
      );

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-4', mediaType: 'Video'),
      );
      expect(category, 'Video');
    });

    test('classifies a playlist with movies and music videos as Mixed', () async {
      when(() => itemsApi.getPlaylistItems('pl-5')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'Movie', 'MediaType': 'Video'},
            {'Type': 'MusicVideo', 'MediaType': 'Video'},
          ],
        },
      );

      final category = await resolvePlaylistCategory(
        client,
        _playlistItem('pl-5', mediaType: 'Video'),
      );
      expect(category, 'Mixed');
    });

    test('MusicVideo playlists are considered browsable in video rows', () async {
      when(() => itemsApi.getPlaylistItems('pl-6')).thenAnswer(
        (_) async => {
          'Items': [
            {'Type': 'MusicVideo', 'MediaType': 'Video'},
          ],
        },
      );

      final browsable = await playlistHasBrowsableItems(
        client,
        _playlistItem('pl-6', mediaType: 'Video'),
      );
      expect(browsable, isTrue);
    });
  });
}
