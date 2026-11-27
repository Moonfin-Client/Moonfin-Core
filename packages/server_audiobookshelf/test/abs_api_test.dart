import 'dart:convert';

import 'package:server_audiobookshelf/src/abs_ids.dart';
import 'package:server_audiobookshelf/src/abs_progress.dart';
import 'package:server_audiobookshelf/src/api/abs_apis.dart';
import 'package:server_audiobookshelf/src/api/abs_items_api.dart';
import 'package:server_audiobookshelf/src/api/abs_playback_api.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fake_server.dart';

const _me = {
  'id': 'user-1',
  'username': 'test',
  'type': 'user',
  'permissions': {'download': true, 'update': false},
  'mediaProgress': [
    {
      'id': 'p1',
      'libraryItemId': 'book-1',
      'episodeId': null,
      'currentTime': 130,
      'progress': 0.21,
      'isFinished': false,
      'lastUpdate': 1795759816261,
    },
  ],
};

Map<String, dynamic> _book(String id, {int numTracks = 1}) => {
  'id': id,
  'libraryId': 'lib-a',
  'mediaType': 'book',
  'updatedAt': 1,
  'media': {
    'metadata': {'title': 'Title $id', 'authorName': 'Test Author'},
    'coverPath': '/c.jpg',
    'numTracks': numTracks,
    'duration': 600,
  },
};

String _decode(String filter) {
  final value = filter.substring(filter.indexOf('.') + 1);
  return utf8.decode(base64.decode(value));
}

void main() {
  group('items', () {
    test('a library page maps the sort, filter and page and adds progress', () async {
      final (dio, server) = fakeDio((o) {
        if (o.path == '/api/me') return _me;
        return {
          'results': [_book('book-1'), _book('book-2')],
          'total': 52,
        };
      });
      final api = AbsItemsApi(dio, AbsProgressCache(dio));

      final result = await api.getItems(
        parentId: absLibraryId('lib-a'),
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Descending',
        filters: ['IsResumable'],
        startIndex: 50,
        limit: 25,
        includeItemTypes: ['AudioBook', 'Book'],
      );

      final page = server.requests.firstWhere((o) => o.path.endsWith('/items'));
      expect(page.path, '/api/libraries/lib-a/items');
      expect(page.queryParameters['sort'], 'addedAt');
      expect(page.queryParameters['desc'], 1);
      expect(page.queryParameters['limit'], 25);
      expect(page.queryParameters['page'], 2);
      expect(page.queryParameters['minified'], 1);
      expect(_decode(page.queryParameters['filter'] as String), 'in-progress');
      expect(result['TotalRecordCount'], 52);
      final items = result['Items'] as List;
      expect(items.first['UserData']['PlaybackPositionTicks'], 130 * 10000000);
      expect(items.last['UserData']['PlaybackPositionTicks'], 0);
    });

    test('an author filter names the author for the server', () async {
      final (dio, server) = fakeDio((o) => o.path == '/api/me' ? _me : {'results': [], 'total': 0});
      await AbsItemsApi(dio, AbsProgressCache(dio)).getItems(
        parentId: absLibraryId('lib-a'),
        artistIds: [absAuthorId('author-x')],
      );
      final page = server.requests.firstWhere((o) => o.path.endsWith('/items'));
      final filter = page.queryParameters['filter'] as String;
      expect(filter, startsWith('authors.'));
      expect(_decode(filter), 'author-x');
    });

    test('a series lists its books in reading order', () async {
      final (dio, _) = fakeDio((o) {
        if (o.path == '/api/me') return _me;
        if (o.path == '/api/series/s1') return {'id': 's1', 'libraryId': 'lib-a'};
        return {
          'results': [
            {..._book('b2'), 'media': {...(_book('b2')['media'] as Map), 'metadata': {'title': 'Two', 'seriesName': 'S #2'}}},
            {..._book('b1'), 'media': {...(_book('b1')['media'] as Map), 'metadata': {'title': 'One', 'seriesName': 'S #1'}}},
          ],
        };
      });
      final result = await AbsItemsApi(dio, AbsProgressCache(dio)).getItems(
        parentId: absSeriesId('s1'),
      );
      expect([for (final i in result['Items'] as List) i['Name']], ['One', 'Two']);
    });

    test('favorites come from the device and filter by library', () async {
      final (dio, server) = fakeDio((o) {
        if (o.path == '/api/me') return _me;
        return {
          'libraryItems': [
            _book('book-1'),
            {..._book('book-9'), 'libraryId': 'lib-b'},
          ],
        };
      });
      final api = AbsItemsApi(
        dio,
        AbsProgressCache(dio),
        favorites: () => {'book-1', 'book-9'},
      );

      final result = await api.getItems(
        parentId: absLibraryId('lib-a'),
        isFavorite: true,
      );

      expect(server.requests.any((o) => o.path == '/api/items/batch/get'), isTrue);
      final items = result['Items'] as List;
      expect(items.single['Id'], 'book-1');
      expect(items.single['UserData']['IsFavorite'], isTrue);
    });

    test('a video only filter matches nothing instead of everything', () async {
      final (dio, server) = fakeDio((o) => const {});
      final result = await AbsItemsApi(dio, AbsProgressCache(dio)).getItems(
        parentId: absLibraryId('lib-a'),
        is4K: true,
      );
      expect(result['Items'], isEmpty);
      expect(server.requests, isEmpty);
    });
  });

  group('playback', () {
    const device = DeviceInfo(id: 'dev', name: 'Desk', appName: 'Moonfin', appVersion: '1');

    test('a single file plays directly with the token in its URL', () async {
      final (dio, server) = fakeDio((o) => {
        'id': 'session-1',
        'playMethod': 0,
        'duration': 600,
        'currentTime': 130,
        'audioTracks': [
          {
            'contentUrl': '/api/items/book-1/file/9',
            'codec': 'aac',
            'metadata': {'ext': '.m4b'},
          },
        ],
      });
      final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => 'tok', AbsProgressCache(dio));

      final info = await api.getPlaybackInfo(
        'book-1',
        requestBody: {
          'DeviceProfile': {
            'DirectPlayProfiles': [
              {'Type': 'Audio', 'Container': 'mp3,m4b'},
            ],
          },
        },
        waitForMediaProbe: true,
      );

      final open = server.requests.single;
      expect(open.path, '/api/items/book-1/play');
      expect((open.data as Map)['supportedMimeTypes'], containsAll(['audio/mpeg', 'audio/mp4']));
      expect((open.data as Map)['supportedMimeTypes'], isNot(contains('audio/flac')));
      final source = (info['MediaSources'] as List).single as Map;
      expect(source['Path'], 'http://abs/api/items/book-1/file/9?token=tok');
      expect(source['SupportsDirectPlay'], isTrue);
      expect(source['Container'], 'm4b');
      expect(info['PlaySessionId'], 'session-1');
    });

    test('a book in several files reopens as one HLS stream', () async {
      var opened = 0;
      final (dio, server) = fakeDio((o) {
        if (o.path.endsWith('/close')) return 'OK';
        opened++;
        final transcode = (o.data as Map)['forceTranscode'] == true;
        return {
          'id': 'session-$opened',
          'playMethod': transcode ? 2 : 0,
          'duration': 540,
          'audioTracks': transcode
              ? [{'contentUrl': '/hls/session-2/output.m3u8'}]
              : [{'contentUrl': '/a'}, {'contentUrl': '/b'}, {'contentUrl': '/c'}],
        };
      });
      final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => 'tok', AbsProgressCache(dio));

      final info = await api.getPlaybackInfo('book-1', waitForMediaProbe: true);

      expect([for (final o in server.requests) o.path], [
        '/api/items/book-1/play',
        '/api/session/session-1/close',
        '/api/items/book-1/play',
      ]);
      final source = (info['MediaSources'] as List).single as Map;
      expect(source['SupportsDirectPlay'], isFalse);
      // The HLS route answers without a token.
      expect(source['TranscodingUrl'], 'http://abs/hls/session-2/output.m3u8');
      expect(info['PlaySessionId'], 'session-2');
    });

    test('an episode opens through its podcast', () async {
      final (dio, server) = fakeDio((o) => {'id': 's', 'audioTracks': []});
      final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => null, AbsProgressCache(dio));
      await api.getPlaybackInfo(absEpisodeId('pod', 'ep1'), waitForMediaProbe: true);
      expect(server.requests.first.path, '/api/items/pod/play/ep1');
    });

    test('asking what would play opens no session', () async {
      final (dio, server) = fakeDio((o) => {
        'id': 'book-1',
        'media': {
          'duration': 600,
          'tracks': [
            {'contentUrl': '/api/items/book-1/file/9', 'mimeType': 'audio/mp4', 'metadata': {'ext': '.m4b'}},
          ],
        },
      });
      final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => 'tok', AbsProgressCache(dio));

      final info = await api.getPlaybackInfo('book-1');

      expect(server.requests.single.method, 'GET');
      expect(info.containsKey('PlaySessionId'), isFalse);
      final source = (info['MediaSources'] as List).single as Map;
      expect(source['SupportsDirectPlay'], isTrue);
      expect(source['Container'], 'm4b');
    });

    test('progress syncs the position and a seek counts as no listening', () async {
      final (dio, server) = fakeDio((o) => 'OK');
      final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => null, AbsProgressCache(dio));
      await api.reportPlaybackStart({'PlaySessionId': 's1', 'PositionTicks': 0});
      await api.reportPlaybackProgress({
        'PlaySessionId': 's1',
        'PositionTicks': 300 * 10000000,
        'RunTimeTicks': 600 * 10000000,
      });
      final sync = server.requests.single;
      expect(sync.path, '/api/session/s1/sync');
      expect((sync.data as Map)['currentTime'], 300.0);
      expect((sync.data as Map)['timeListened'], 0);
      expect((sync.data as Map)['duration'], 600.0);
    });
  });

  test('a download without a session saves its position on the item', () async {
    final (dio, server) = fakeDio((o) => 'OK');
    const device = DeviceInfo(id: 'dev', name: 'Desk', appName: 'Moonfin', appVersion: '1');
    final api = AbsPlaybackApi(dio, device, () => 'http://abs', () => null, AbsProgressCache(dio));

    await api.reportPlaybackProgress({'ItemId': 'book-1', 'PositionTicks': 100 * 10000000, 'RunTimeTicks': 400 * 10000000});
    await api.reportPlaybackProgress({'ItemId': 'book-1', 'PositionTicks': 105 * 10000000, 'RunTimeTicks': 400 * 10000000});
    await api.reportPlaybackStopped({'ItemId': 'book-1', 'PositionTicks': 110 * 10000000, 'RunTimeTicks': 400 * 10000000});

    // The second tick falls inside the save interval, the stop always saves.
    expect([for (final o in server.requests) '${o.method} ${o.path}'], [
      'PATCH /api/me/progress/book-1',
      'PATCH /api/me/progress/book-1',
    ]);
    expect(server.requests.last.data, {'currentTime': 110.0, 'duration': 400.0, 'progress': 0.275});
  });

  group('user library', () {
    test('an EPUB position saves as the share the reader read', () async {
      final (dio, server) = fakeDio((o) {
        if (o.path == '/api/me') return _me;
        if (o.path == '/api/items/ebook-1') {
          return {
            'id': 'ebook-1',
            'libraryId': 'lib-a',
            'mediaType': 'book',
            'media': {
              'metadata': {'title': 'E'},
              'numTracks': 0,
              'duration': 0,
              'ebookFormat': 'epub',
            },
          };
        }
        return 'OK';
      });
      final progress = AbsProgressCache(dio);
      final items = AbsItemsApi(dio, progress);
      final api = AbsUserLibraryApi(dio, items, progress, AbsFavorites(null, () => 'user-1'));

      await api.updatePlayedPosition('ebook-1', positionTicks: 4000000);

      final patch = server.requests.firstWhere((o) => o.method == 'PATCH');
      expect(patch.path, '/api/me/progress/ebook-1');
      expect(patch.data, {'ebookProgress': 0.4});
    });

    test('an audio position saves with its share of the book', () async {
      final (dio, server) = fakeDio((o) {
        if (o.path == '/api/me') return _me;
        if (o.path == '/api/items/book-1') return _book('book-1');
        return 'OK';
      });
      final progress = AbsProgressCache(dio);
      final api = AbsUserLibraryApi(dio, AbsItemsApi(dio, progress), progress, AbsFavorites(null, () => null));

      await api.updatePlayedPosition('book-1', positionTicks: 150 * 10000000);

      final patch = server.requests.firstWhere((o) => o.method == 'PATCH');
      expect(patch.data, {'currentTime': 150.0, 'duration': 600.0, 'progress': 0.25});
    });
  });

  test('sign in keeps the legacy token, which outlives the hour long one', () async {
    final (dio, server) = fakeDio((o) => {
      'user': {
        'id': 'user-1',
        'username': 'test',
        'type': 'admin',
        'token': 'legacy',
        'accessToken': 'short',
        'permissions': {'download': true},
      },
    });
    final result = await AbsAuthApi(dio).authenticateByName('test', 'pw');
    expect(result['AccessToken'], 'legacy');
    final policy = (result['User'] as Map)['Policy'] as Map;
    expect(policy['IsAdministrator'], isFalse);
    expect(policy['EnableCollectionManagement'], isTrue);
    expect(server.requests.single.extra[absNoAuthExtra], isTrue);
  });
}
