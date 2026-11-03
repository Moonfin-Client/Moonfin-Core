import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';
import 'silo_test_client.dart';

const _film = 'movie-imdb-tt0295701';
const _admin = '/api/v2/admin/items/$_film';

ResponseBody Function(RequestOptions) _json(Object body) =>
    (_) => FixtureServer.json(200, jsonEncode(body));

Map<String, dynamic> _body(RequestOptions request) =>
    request.data as Map<String, dynamic>;

/// A poster and a backdrop from TMDB, and the folder's own poster, which Silo
/// previews inline.
const _choices = {
  'current': {'poster_url': 'tmdb/movies/7451/poster/original.a.webp'},
  'items': [
    {
      'provider_id': 'tmdb',
      'url': 'https://image.tmdb.org/t/p/w300/poster.jpg',
      'original_url': 'tmdb://poster/poster.jpg',
      'type': 'poster',
      'language': 'en',
      'width': 2000,
      'height': 3000,
      'rating': 5.4,
    },
    {
      'provider_id': 'tmdb',
      'url': 'https://image.tmdb.org/t/p/w300/backdrop.jpg',
      'original_url': 'tmdb://backdrop/backdrop.jpg',
      'type': 'backdrop',
      'language': '',
      'width': 3840,
      'height': 2160,
      'rating': 5.1,
    },
    {
      'provider_id': 'local',
      'url': 'data:image/webp;base64,AAAA',
      'original_url': 'file:///media/xXx (2002)/poster.jpg',
      'type': 'poster',
      'language': '',
      'width': 0,
      'height': 0,
      'rating': 0,
    },
  ],
  'page': {'has_more': false},
};

void main() {
  group('identify', () {
    test('searches by title, year and ids, answered as Jellyfin', () async {
      final server = FixtureServer({
        '$_admin/match/search': _json({
          'candidates': [
            {
              'title': 'xXx',
              'year': 2002,
              'content_type': 'movie',
              'provider_ids': {'tmdb': '7451', 'imdb': 'tt0295701'},
              'image_url': 'https://image.tmdb.org/t/p/w300/xxx.jpg',
              'overview': 'An extreme sports star turns spy.',
              'sources': ['tmdb'],
              'agreement_hints': [],
            },
          ],
          'truncated': false,
        }),
      });
      final api = siloTestClient(server).adminItemsApi;
      final results = await api.searchRemote('Movie', {
        'ItemId': _film,
        'SearchInfo': {
          'Name': ' xXx ',
          'Year': 2002,
          'ProviderIds': {'Imdb': 'tt0295701', 'Tmdb': ''},
        },
      });
      final body = _body(server.requests.single);
      expect(body, {'title': 'xXx', 'year': 2002, 'imdb_id': 'tt0295701'});
      expect(siloSchemaErrors('AdminMatchSearchBody', body), isEmpty);
      expect(results.single['Name'], 'xXx');
      expect(results.single['ProductionYear'], 2002);
      expect(results.single['ProviderIds'], {
        'Tmdb': '7451',
        'Imdb': 'tt0295701',
      });
      expect(results.single['SearchProviderName'], 'TheMovieDb');
    });

    test('applying sends the match\'s ids as Silo gave them', () async {
      final server = FixtureServer({
        '$_admin/match/apply': _json({'content_id': _film, 'updated': true}),
      });
      final api = siloTestClient(server).adminItemsApi;
      final movedTo = await api.applyRemoteSearchResult(_film, {
        'Name': 'xXx',
        'ProviderIds': {'Tmdb': '7451'},
        SiloAdminItemsApi.siloProviderIdsKey: {'tmdb': '7451'},
      });
      final body = _body(server.requests.single);
      expect(body, {
        'provider_ids': {'tmdb': '7451'},
      });
      expect(siloSchemaErrors('AdminMatchApplyInputBody', body), isEmpty);
      expect(movedTo, isNull);
    });

    test('matching an unmatched item answers its new id', () async {
      const local = 'local-3863beba4de487e814739e8fa8e2';
      final server = FixtureServer({
        '/api/v2/admin/items/$local/match/apply': _json({
          'content_id': 'movie-tmdb-812',
          'updated': true,
        }),
      });
      final api = siloTestClient(server).adminItemsApi;
      final movedTo = await api.applyRemoteSearchResult(local, {
        SiloAdminItemsApi.siloProviderIdsKey: {'tmdb': '812'},
      });
      expect(movedTo, 'movie-tmdb-812');
    });

    test('the id fields are the ones Silo searches by', () async {
      final api = siloTestClient(FixtureServer({})).adminItemsApi;
      final infos = await api.getExternalIdInfos(_film);
      expect(infos.map((i) => i['Key']), ['Tmdb', 'Imdb', 'Tvdb']);
    });
  });

  test('a full refresh is Silo\'s complete mode', () async {
    final server = FixtureServer({
      '$_admin/refresh-metadata': (_) =>
          FixtureServer.json(202, jsonEncode({'id': 'job-1'})),
    });
    final api = siloTestClient(server).adminItemsApi;
    await api.refreshItem(_film);
    await api.refreshItem(
      _film,
      metadataRefreshMode: MetadataRefreshMode.fullRefresh,
    );
    expect(server.requests.map((r) => _body(r)['mode']), ['quick', 'complete']);
    expect(
      siloSchemaErrors(
        'AdminItemMetadataRefreshInputBody',
        _body(server.requests.first),
      ),
      isEmpty,
    );
  });

  group('artwork', () {
    test('each kind lists its linked choices from one read', () async {
      final server = FixtureServer({'$_admin/images': _json(_choices)});
      final api = siloTestClient(server).adminItemsApi;
      final posters = await api.getRemoteImages(
        _film,
        imageType: ImageType.primary,
      );
      final backdrops = await api.getRemoteImages(
        _film,
        imageType: ImageType.backdrop,
      );
      final banners = await api.getRemoteImages(
        _film,
        imageType: ImageType.banner,
      );
      expect(server.requests, hasLength(1));
      expect(posters['Images'], [
        {
          'Url': 'https://image.tmdb.org/t/p/w300/poster.jpg',
          'ProviderName': 'TheMovieDb',
          'Width': 2000,
          'Height': 3000,
          'CommunityRating': 5.4,
          'Language': 'en',
        },
      ]);
      expect((backdrops['Images'] as List).single, isNot(contains('Language')));
      expect(banners['Images'], isEmpty);
    });

    test('picking one applies the choice it previews', () async {
      final server = FixtureServer({
        '$_admin/images': _json(_choices),
        '$_admin/images/apply': _json({
          'content_id': _film,
          'stored_path': 'tmdb/movies/7451/poster/original.b.webp',
          'thumbhash': 'abc',
        }),
      });
      final api = siloTestClient(server).adminItemsApi;
      await api.downloadRemoteImage(
        _film,
        imageType: ImageType.primary,
        imageUrl: 'https://image.tmdb.org/t/p/w300/poster.jpg',
      );
      final apply = server.requests.last;
      expect(_body(apply), {
        'original_url': 'tmdb://poster/poster.jpg',
        'type': 'poster',
        'provider_id': 'tmdb',
      });
      expect(
        siloSchemaErrors('AdminImageApplyInputBody', _body(apply)),
        isEmpty,
      );
    });

    test('uploading and deleting are refused', () {
      final api = siloTestClient(FixtureServer({})).adminItemsApi;
      expect(
        api.uploadItemImage(
          _film,
          imageType: ImageType.primary,
          bytes: const [1],
          contentType: 'image/jpeg',
        ),
        throwsUnsupportedError,
      );
      expect(
        api.deleteItemImage(_film, imageType: ImageType.primary),
        throwsUnsupportedError,
      );
    });
  });
}
