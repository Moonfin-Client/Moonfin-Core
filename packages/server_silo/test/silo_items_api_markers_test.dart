import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _episode = 'episode-imdb-tt1641384-1-1';
const _film = 'movie-imdb-tt0295701';

void main() {
  test('an item not playing yet: its first file\'s markers', () async {
    final server = FixtureServer({
      '/api/v2/markers/items/$_episode': FixtureServer.file(
        'silo/markers_episode.json',
      ),
    });
    final segments = await siloTestClient(
      server,
    ).itemsApi.getMediaSegments(_episode);
    expect(segments, [
      {
        'Id': 'silo-intro-$_episode-0',
        'ItemId': _episode,
        'Type': 'Intro',
        'StartTicks': 2479980000,
        'EndTicks': 2683290000,
      },
    ]);
  });

  test('the file that plays, once the resolver names it', () async {
    final server = FixtureServer({
      '/api/v2/markers/files/89618': FixtureServer.file(
        'silo/markers_episode.json',
      ),
    });
    final api = siloTestClient(server).itemsApi;
    api.notePlayingFile(_episode, '89618', runTimeSeconds: 1320);
    final segments = await api.getMediaSegments(_episode);
    expect(segments.single['Type'], 'Intro');
    expect(server.requests.single.uri.path, '/api/v2/markers/files/89618');
  });

  test('credits without an end run to the file\'s end', () async {
    final server = FixtureServer({
      '/api/v2/markers/files/89618': siloJson({
        'file_id': '89618',
        'intro': {},
        'credits': {},
        'recap': {},
        'preview': {},
        'marker_segments': [
          {'kind': 'recap', 'start_seconds': 0, 'end_seconds': 42.5},
          {'kind': 'intro', 'start_seconds': 60, 'end_seconds': 90},
          {'kind': 'credits', 'start_seconds': 1250},
        ],
      }),
    });
    final api = siloTestClient(server).itemsApi;
    api.notePlayingFile(_episode, '89618', runTimeSeconds: 1320);
    final segments = await api.getMediaSegments(_episode);
    expect(segments.map((s) => s['Type']), ['Recap', 'Intro', 'Outro']);
    expect(segments.last['EndTicks'], 13200000000);
  });

  test('none: an empty list, a 404 too', () async {
    final server = FixtureServer({
      '/api/v2/markers/items/$_film': FixtureServer.file(
        'silo/markers_movie.json',
      ),
    });
    final api = siloTestClient(server).itemsApi;
    expect(await api.getMediaSegments(_film), isEmpty);
    expect(await api.getMediaSegments('movie-unknown'), isEmpty);
  });

  test('kept for a few minutes per file', () async {
    final server = FixtureServer({
      '/api/v2/markers/items/$_episode': FixtureServer.file(
        'silo/markers_episode.json',
      ),
    });
    final api = siloTestClient(server).itemsApi;
    await api.getMediaSegments(_episode);
    await api.getMediaSegments(_episode);
    expect(server.requests, hasLength(1));
  });

  test('a failed read is not kept', () async {
    var fail = true;
    final server = FixtureServer({
      '/api/v2/markers/items/$_episode': (request) => fail
          ? FixtureServer.problem(503, 'unavailable', 'Try again')
          : FixtureServer.json(200, fixture('silo/markers_episode.json')),
    });
    final api = siloTestClient(server).itemsApi;
    await expectLater(
      api.getMediaSegments(_episode),
      throwsA(isA<DioException>()),
    );
    fail = false;
    expect(await api.getMediaSegments(_episode), hasLength(1));
  });
}
