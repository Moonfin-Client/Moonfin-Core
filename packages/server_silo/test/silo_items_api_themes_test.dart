import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _series = 'series-imdb-tt1641384';
const _caps = '/api/v2/catalog/themes/capabilities';
const _grant = '/api/v2/catalog/items/$_series/themes/7/playback';

/// Young Justice's detail with one theme song.
ResponseBody _seriesWithTheme(RequestOptions _) {
  final json = jsonDecode(fixture('silo/catalog_item_series.json')) as Map;
  json['themes'] = {
    'owner_id': _series,
    'items': [
      {
        'id': '7',
        'title': 'Young Justice Theme',
        'container': 'mp3',
        'duration_seconds': 62.5,
      },
    ],
  };
  return FixtureServer.json(200, jsonEncode(json));
}

FixtureServer _server([
  Map<String, ResponseBody Function(RequestOptions)> extra = const {},
]) => FixtureServer({
  _caps: FixtureServer.file('silo/themes_capabilities.json'),
  '/api/v2/catalog/items/$_series': _seriesWithTheme,
  ...extra,
});

void main() {
  test('a title\'s theme songs, as Jellyfin lists them', () async {
    final server = _server();
    final media = await siloTestClient(server).itemsApi.getThemeMedia(_series);
    final songs = media['ThemeSongsResult'] as Map;
    expect(songs['OwnerId'], _series);
    expect(songs['Items'], [
      {
        'Id': '7',
        'Name': 'Young Justice Theme',
        'Type': 'Audio',
        'MediaType': 'Audio',
        'Container': 'mp3',
        'RunTimeTicks': 625000000,
        'ParentId': _series,
      },
    ]);
    expect((media['ThemeVideosResult'] as Map)['Items'], isEmpty);
  });

  test('a title without themes, and the capabilities read once', () async {
    final server = FixtureServer({
      _caps: FixtureServer.file('silo/themes_capabilities.json'),
      '/api/v2/catalog/items/$_series': FixtureServer.file(
        'silo/catalog_item_series.json',
      ),
    });
    final api = siloTestClient(server).itemsApi;
    for (var i = 0; i < 2; i++) {
      final songs = (await api.getThemeMedia(_series))['ThemeSongsResult'];
      expect((songs as Map)['Items'], isEmpty);
    }
    expect(server.requests.where((r) => r.uri.path == _caps), hasLength(1));
  });

  test('a server that doesn\'t serve themes: none, no detail read', () async {
    final server = _server({
      _caps: siloJson({
        'revision': 'r',
        'state': 'disabled',
        'allowed': true,
        'delivery': 'local_direct_play',
        'transcode': false,
        'cluster_routing': false,
        'grant_lifetime_seconds': 300,
      }),
    });
    final songs = (await siloTestClient(
      server,
    ).itemsApi.getThemeMedia(_series))['ThemeSongsResult'];
    expect((songs as Map)['Items'], isEmpty);
    expect(server.requests.map((r) => r.uri.path), [_caps]);
  });

  test('a play asks for a grant naming what the player decodes', () async {
    final server = _server({
      _grant: siloJson({
        'url': '/api/v2/catalog/items/$_series/themes/7/audio?token=g1',
        'expires_at': '2026-10-14T12:05:00.000Z',
        'delivery': 'original',
        'content_type': 'audio/mpeg',
      }),
    });
    final api = siloTestClient(server).itemsApi as ThemeSongStreamApi;
    final url = await api.themeSongStreamUrl(
      _series,
      '7',
      accepts: const [
        (container: 'mp3', codec: null),
        (container: 'mp4', codec: 'aac'),
      ],
    );
    expect(
      url,
      'https://silo.example/api/v2/catalog/items/$_series/themes/7/audio'
      '?token=g1',
    );
    final request = server.requests.single;
    expect(request.method, 'POST');
    expect(request.data, {
      'accepted_formats': [
        {'container': 'mp3'},
        {'container': 'mp4', 'audio_codec': 'aac'},
      ],
    });
  });

  test('a grant on a proxy node is used as it is', () async {
    final server = _server({
      _grant: siloJson({
        'url': 'https://node2.silo.example/theme/abc',
        'expires_at': '2026-10-14T12:05:00.000Z',
        'delivery': 'converted',
        'content_type': 'audio/mp4',
      }),
    });
    expect(
      await siloTestClient(server).itemsApi.themeSongStreamUrl(_series, '7'),
      'https://node2.silo.example/theme/abc',
    );
  });

  test('a song Silo can\'t serve plays nothing', () async {
    final server = _server({
      _grant: (_) => FixtureServer.problem(406, 'not_acceptable', 'No'),
    });
    expect(
      await siloTestClient(server).itemsApi.themeSongStreamUrl(_series, '7'),
      isNull,
    );
  });
}
