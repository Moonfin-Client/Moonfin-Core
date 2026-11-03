import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_silo/server_silo.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _film = 'movie-imdb-tt0295701';

ResponseBody _noContent(RequestOptions _) => ResponseBody.fromString('', 204);

void main() {
  group('favorites', () {
    test('marking and unmarking', () async {
      final server = FixtureServer({'/api/v2/favorites/$_film': _noContent});
      final api = siloTestClient(server).userLibraryApi;
      await api.markFavorite(_film);
      await api.unmarkFavorite(_film);
      expect([for (final r in server.requests) r.method], ['PUT', 'DELETE']);
      // As the profile the client acts for.
      expect(server.requests.first.headers['X-Profile-Id'], 'p1');
    });

    test('a season or an episode is a title too', () async {
      const season = 'season-imdb-tt1641384-1';
      const episode = 'episode-imdb-tt1641384-1-1';
      final server = FixtureServer({
        '/api/v2/favorites/$season': _noContent,
        '/api/v2/favorites/$episode': _noContent,
      });
      final api = siloTestClient(server).userLibraryApi;
      await api.markFavorite(season);
      await api.markFavorite(episode);
      expect(server.requests, hasLength(2));
    });

    test('what isn\'t a title fails without a request', () async {
      final server = FixtureServer({});
      final api = siloTestClient(server).userLibraryApi;
      for (final id in [
        'silo-genre:Action',
        'silo-studio:HBO',
        'silo-collection:c1',
        'silo-libcollection:1:c2',
        '7',
      ]) {
        expect(
          () => api.markFavorite(id),
          throwsA(isA<UnsupportedError>()),
          reason: id,
        );
      }
      expect(server.requests, isEmpty);
    });

    test('Silo\'s refusal reaches the caller', () async {
      final server = FixtureServer({
        '/api/v2/favorites/$_film': (_) =>
            FixtureServer.problem(404, 'not_found', 'gone'),
      });
      await expectLater(
        siloTestClient(server).userLibraryApi.markFavorite(_film),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('played state', () {
    test('a film, a season and a show: once each, no retry', () async {
      const season = 'season-imdb-tt1641384-1';
      const show = 'series-imdb-tt1641384';
      final server = FixtureServer({
        '/api/v2/watched/$_film': _noContent,
        '/api/v2/watched/$season': _noContent,
        '/api/v2/watched/$show': _noContent,
      });
      final api = siloTestClient(server).userLibraryApi;
      await api.markPlayed(_film);
      await api.markPlayed(season);
      await api.unmarkPlayed(show);
      expect(
        [for (final r in server.requests) '${r.method} ${r.uri.path}'],
        [
          'POST /api/v2/watched/$_film',
          'POST /api/v2/watched/$season',
          'DELETE /api/v2/watched/$show',
        ],
      );
    });

    test('a failure is not sent again', () async {
      final server = FixtureServer({
        '/api/v2/watched/$_film': (_) =>
            FixtureServer.problem(503, 'unavailable', 'busy'),
      });
      await expectLater(
        siloTestClient(server).userLibraryApi.markPlayed(_film),
        throwsA(isA<DioException>()),
      );
      expect(server.requests, hasLength(1));
    });

    test('a collection has no played state', () {
      final api = siloTestClient(FixtureServer({})).userLibraryApi;
      expect(
        () => api.markPlayed('silo-collection:c1'),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });

  group('ratings', () {
    Future<List<String>> sent(
      Future<void> Function(UserLibraryApi api) act,
    ) async {
      final server = FixtureServer({'/api/v2/ratings/$_film': _noContent});
      await act(siloTestClient(server).userLibraryApi);
      return [
        for (final r in server.requests)
          '${r.method} ${r.data == null ? '' : jsonEncode(r.data)}'.trim(),
      ];
    }

    test('thumbs: up is 5 stars, down is 1', () async {
      expect(await sent((a) => a.updateUserRating(_film, likes: true)), [
        'PUT {"rating":5}',
      ]);
      expect(await sent((a) => a.updateUserRating(_film, likes: false)), [
        'PUT {"rating":1}',
      ]);
    });

    test('out of 10 as whole stars, half a star up', () async {
      expect(await sent((a) => a.updateNumericUserRating(_film, rating: 8)), [
        'PUT {"rating":4}',
      ]);
      expect(await sent((a) => a.updateNumericUserRating(_film, rating: 7)), [
        'PUT {"rating":4}',
      ]);
      expect(siloStarsFromRating(10), 5);
      expect(siloStarsFromRating(1), 1);
      expect(siloStarsFromRating(0), 1, reason: 'Silo\'s lowest is 1 star');
      expect(siloStarsFromRating(12), 5);
    });

    test('clearing', () async {
      expect(await sent((a) => a.deleteUserRating(_film)), ['DELETE']);
    });

    test('the profile\'s rating reads back out of 10', () {
      Map userDataOf(Map<String, Object?> extra) =>
          siloItemToBaseItemDto({
                'content_id': _film,
                'type': 'movie',
                'title': 'Film',
                ...extra,
              })!['UserData']
              as Map;
      expect(userDataOf({'user_rating': 4})['Rating'], 8.0);
      expect(userDataOf({}).containsKey('Rating'), isFalse);
      expect(userDataOf({}).containsKey('Likes'), isFalse);
    });
  });
}
