import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';
import 'silo_test_client.dart';

const _film = 'movie-imdb-tt0295701';

ResponseBody Function(RequestOptions) _json(Object body) =>
    (_) => FixtureServer.json(200, jsonEncode(body));

Map<String, dynamic> _body(RequestOptions request) =>
    request.data as Map<String, dynamic>;

final _search = _json({
  'results': [
    {
      'id': 'os-123',
      'provider': 'opensubtitles',
      'release_name': 'xXx.2002.1080p.BluRay',
      'format': 'srt',
      'language': 'en',
      'hearing_impaired': false,
      'downloads': 5120,
      'score': 9.5,
    },
  ],
  'warnings': [],
});

void main() {
  test('searches the default version in Silo\'s language code', () async {
    final server = FixtureServer({
      '/api/v2/catalog/items/$_film': FixtureServer.file(
        'silo/catalog_item_movie.json',
      ),
      '/api/v2/subtitles/search': _search,
    });
    final results = await siloTestClient(
      server,
    ).itemsApi.searchRemoteSubtitles(_film, language: 'eng');
    final body = _body(
      server.requests.lastWhere((r) => r.path.endsWith('/search')),
    );
    expect(body, {
      'media_file_id': '4598',
      'languages': ['en'],
    });
    expect(siloSchemaErrors('SubtitleSearchBody', body), isEmpty);
    expect(results.single['Name'], 'xXx.2002.1080p.BluRay');
    expect(results.single['ProviderName'], 'opensubtitles');
    expect(results.single['DownloadCount'], 5120);
  });

  test('a result downloads as the result Silo found', () async {
    final server = FixtureServer({
      '/api/v2/subtitles/search': _search,
      '/api/v2/subtitles/download': _json({'subtitle': {}}),
    });
    final client = siloTestClient(server);
    client.itemsApi.notePlayingFile(
      _film,
      '4599',
      source: const {'Id': '4599'},
    );
    final result = (await client.itemsApi.searchRemoteSubtitles(
      _film,
      language: 'en',
    )).single;
    await client.itemsApi.downloadRemoteSubtitle(_film, '${result['Id']}');
    final download = _body(server.requests.last);
    expect(download, {
      'media_file_id': '4599',
      'subtitle_id': 'os-123',
      'provider': 'opensubtitles',
      'language': 'en',
      'release_name': 'xXx.2002.1080p.BluRay',
      'score': 9.5,
      'hearing_impaired': false,
    });
    expect(siloSchemaErrors('SubtitleDownloadBody', download), isEmpty);
  });

  test('an id Silo never gave is refused', () {
    final api = siloTestClient(FixtureServer({})).itemsApi;
    expect(
      api.downloadRemoteSubtitle(_film, 'not base64!'),
      throwsArgumentError,
    );
  });
}
