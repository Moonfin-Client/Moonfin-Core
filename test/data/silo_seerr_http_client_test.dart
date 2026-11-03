import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_discover_sliders.dart';
import 'package:moonfin/data/services/seerr/seerr_error.dart';
import 'package:moonfin/data/services/seerr/silo_seerr_http_client.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// Answers Silo routes from [routes] ("METHOD /path" to status and body) and
/// records each request.
class _Silo implements HttpClientAdapter {
  _Silo(this.routes);

  final Map<String, (int, Object?)> routes;
  final List<String> calls = [];
  final Map<String, Object?> bodies = {};

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final key = '${options.method} ${options.uri.path}';
    calls.add('$key${options.uri.hasQuery ? '?${options.uri.query}' : ''}');
    if (requestStream != null) {
      final bytes = await requestStream.expand((b) => b).toList();
      if (bytes.isNotEmpty) bodies[key] = jsonDecode(utf8.decode(bytes));
    }
    final (status, body) =
        routes[key] ??
        (
          404,
          {
            'type': 'https://siloserver.org/docs/api/v2/problems/not_found',
            'status': 404,
          },
        );
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

SiloSeerrHttpClient _client(_Silo silo) {
  final now = DateTime.now().toUtc();
  final client =
      SiloMediaServerClient(
          baseUrl: 'https://silo.example',
          deviceInfo: _device,
          httpClientAdapter: silo,
        )
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access',
            refreshToken: 'refresh',
            expiresAt: now.add(const Duration(hours: 1)),
            lifetime: const Duration(hours: 1),
          ),
        )
        ..profileId = 'p1';
  return SiloSeerrHttpClient(client);
}

(int, Object?) _problem(int status, String code) => (
  status,
  {
    'type': 'https://siloserver.org/docs/api/v2/problems/$code',
    'title': code,
    'status': status,
  },
);

const _heat = {
  'media_type': 'movie',
  'tmdb_id': 949,
  'title': 'Heat',
  'year': 1995,
  'poster_path': '/heat.jpg',
  'release_date': '1995-12-15',
  'availability': 'available',
  'library_content_id': 'movie-imdb-tt0113277',
  'request': {'requestable': false, 'following': false},
  'in_watchlist': false,
};

const _severance = {
  'media_type': 'series',
  'tmdb_id': 95396,
  'title': 'Severance',
  'availability': 'missing',
  'request': {
    'requestable': false,
    'status': 'pending',
    'state': 'pending',
    'request_id': '7390012345678901234',
    'requested_by_viewer': true,
    'following': true,
  },
  'in_watchlist': true,
};

Map<String, (int, Object?)> _base({bool admin = false}) => {
  'GET /api/v2/requests/status': (
    200,
    {'state': 'enabled', 'allowed': true, 'requests_enabled': true},
  ),
  'GET /api/v2/admin/requests/capabilities': admin
      ? (200, {'state': 'enabled'})
      : _problem(403, 'permission_denied'),
  'GET /api/v2/account/me': (200, {'id': 7, 'username': 'pat'}),
};

void main() {
  test('status and user come from Silo, with request permissions only',
      () async {
    final silo = _Silo(_base());
    final status = await _client(silo).getMoonfinStatus();

    expect(status.enabled, isTrue);
    expect(status.authenticated, isTrue);
    expect(status.seerrUserId, 7);
    final user = SeerrUser(id: 7, permissions: status.permissions);
    expect(user.hasPermission(SeerrPermission.request), isTrue);
    expect(user.hasPermission(SeerrPermission.manageRequests), isFalse);
  });

  test('an acting admin may manage requests', () async {
    final status = await _client(_Silo(_base(admin: true))).getMoonfinStatus();
    expect(
      SeerrUser(id: 7, permissions: status.permissions)
          .hasPermission(SeerrPermission.manageRequests),
      isTrue,
    );
  });

  test('search results read as Seerr items with their state', () async {
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/search': (
        200,
        {
          'page': 1,
          'total_pages': 1,
          'total_results': 2,
          'results': [_heat, _severance],
        },
      ),
    });
    final client = _client(silo);
    await client.getMoonfinStatus();
    final page = SeerrDiscoverPage.fromJson(
      await client.search('heat', mediaType: 'tv'),
    );

    expect(silo.calls.last, contains('media_type=series'));
    expect(
      page.results.map((r) => r.id),
      [95396],
      reason: 'a title already in the library shows only with the library',
    );
    final severance = page.results.single;
    expect(severance.mediaType, 'tv');
    expect(severance.name, 'Severance');
    expect(severance.mediaInfo!.status, 2);
    expect(severance.mediaInfo!.requests!.single.requestedBy!.id, 7);
  });

  test('an admin row on Silo is a slider that reads that row', () async {
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/discover': (
        200,
        {
          'items': [],
          'row_order': [
            {'key': 'trending_movies', 'type': 'tmdb_chart', 'title': 'Trending Movies'},
            {'key': 'r_cozy', 'type': 'mdblist', 'title': 'Cozy Picks'},
            {'key': 'studios', 'type': 'studios', 'title': 'Studios'},
          ],
        },
      ),
      'GET /api/v2/requests/discover/rows/r_cozy': (
        200,
        {'key': 'r_cozy', 'page': 1, 'total_pages': 1, 'results': [_heat, _severance]},
      ),
    });
    final client = _client(silo);
    final sliders = await client.getDiscoverSliders();
    expect(sliders, hasLength(1));
    final slider = SeerrDiscoverSlider.tryFromJson(sliders.single)!;
    expect(slider.title, 'Cozy Picks');
    expect(slider.isSupported, isTrue);
    expect(
      SeerrDiscoverSlider.tryFromJson((await client.getDiscoverSliders()).single)!.id,
      slider.id,
      reason: 'a home row made from it finds it again',
    );

    final query = slider.query!;
    final page = SeerrDiscoverPage.fromJson(
      await client.getSliderPage(query.path, query.params),
    );
    expect(page.results.map((r) => r.id).toSet(), {949, 95396});
  });

  test('trending mixes films and series, popular reads the popular rows, '
      'and load more follows next_page', () async {
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/discover/trending_movies': (
        200,
        {'page': 1, 'total_pages': 1, 'results': [_heat]},
      ),
      'GET /api/v2/requests/discover/trending_series': (
        200,
        {'page': 1, 'total_pages': 1, 'results': [_severance]},
      ),
      'GET /api/v2/requests/discover/popular_movies': (
        200,
        {'page': 1, 'total_pages': 9, 'next_page': 3, 'results': [_heat]},
      ),
    });
    final client = _client(silo);
    final trending = SeerrDiscoverPage.fromJson(await client.getTrending());
    expect(trending.results.map((r) => r.mediaType).toSet(), {'movie', 'tv'});

    silo.routes['GET /api/v2/requests/discover/popular_movies'] = (
      200,
      {'page': 1, 'total_pages': 9, 'next_page': 3, 'results': [_heat]},
    );
    final popular = await client.getTrendingMovies();
    expect(silo.calls.last, contains('/popular_movies'));
    final asked = int.parse(Uri.parse('x:${silo.calls.last.split(' ').last}').queryParameters['page']!);
    expect(
      popular['page'],
      2 - (asked - 1),
      reason: 'the screens ask for page+1, which must be Silo\'s next_page',
    );
  });

  test('a series detail reads as Seerr detail with its seasons', () async {
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/detail/series/95396': (
        200,
        {
          ..._severance,
          'genres': ['Drama'],
          'networks': ['Apple TV+'],
          'cast': [
            {'name': 'Adam Scott', 'character': 'Mark', 'order': 0},
          ],
          'creators': ['Dan Erickson'],
          'recommendations': [_heat],
          'production_companies': [],
          'seasons': [
            {'season_number': 1, 'episode_count': 9, 'availability': 'available', 'requested': false},
            {'season_number': 2, 'episode_count': 10, 'availability': 'missing', 'requested': true},
          ],
        },
      ),
    });
    final client = _client(silo);
    final tv = SeerrTvDetails.fromJson(await client.getTvDetails(95396));

    expect(tv.name, 'Severance');
    expect(tv.seasons.map((s) => s.seasonNumber), [1, 2]);
    expect(tv.mediaInfo!.seasons!.map((s) => s.status), [5, 3]);
    expect(tv.genres.single.name, 'Drama');
    expect(tv.credits!.cast.single.name, 'Adam Scott');
    final similar = SeerrDiscoverPage.fromJson(await client.getSimilarTv(95396));
    expect(similar.results.single.id, 949);
  });

  test('a request carries the title Silo needs, and keeps Silo ids exact',
      () async {
    final created = {
      'id': '7390012345678901234',
      'media_type': 'series',
      'tmdb_id': 95396,
      'title': 'Severance',
      'status': 'pending',
      'outcome': 'active',
      'state': 'pending',
      'seasons': [2],
      'requested_by_user_id': '7',
      'targets': [],
      'created_at': '2026-01-02T03:04:05.000Z',
      'updated_at': '2026-01-02T03:04:05.000Z',
    };
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/detail/series/95396': (
        200,
        {..._severance, 'tvdb_id': 371980, 'year': 2022},
      ),
      'POST /api/v2/requests': (201, created),
      'POST /api/v2/requests/7390012345678901234/cancel': (200, created),
    });
    final client = _client(silo);

    final request = SeerrRequest.fromJson(
      await client.createRequest(
        mediaId: 95396,
        mediaType: 'tv',
        seasons: [2],
      ),
    );
    expect(silo.bodies['POST /api/v2/requests'], {
      'media_type': 'series',
      'tmdb_id': 95396,
      'tvdb_id': 371980,
      'title': 'Severance',
      'year': 2022,
      'seasons': [2],
    });
    expect(request.status, 1);
    expect(request.seasons!.single.seasonNumber, 2);

    await client.deleteRequest(request.id);
    expect(
      silo.calls.last,
      'POST /api/v2/requests/7390012345678901234/cancel',
    );
  });

  test('a refused request reads as the error the screens word', () async {
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/detail/movie/949': (200, _heat),
      'POST /api/v2/requests': _problem(409, 'conflict'),
    });

    await expectLater(
      _client(silo).createRequest(mediaId: 949, mediaType: 'movie'),
      throwsA(
        isA<SeerrRequestException>().having(
          (e) => e.kind,
          'kind',
          SeerrRequestErrorKind.duplicate,
        ),
      ),
    );
  });

  test('my requests page by offset over Silo cursors', () async {
    Map<String, Object> req(int n) => {
      'id': 'r-$n',
      'media_type': 'movie',
      'tmdb_id': n,
      'title': 'Movie $n',
      'status': 'pending',
      'outcome': 'active',
      'state': n.isEven ? 'pending' : 'available',
      'seasons': [],
      'requested_by_user_id': '7',
      'targets': [],
      'created_at': '2026-01-02T03:04:05.000Z',
      'updated_at': '2026-01-02T03:04:05.000Z',
    };
    final silo = _Silo({
      ..._base(),
      'GET /api/v2/requests/mine': (
        200,
        {
          'items': [for (var n = 1; n <= 4; n++) req(n)],
        },
      ),
    });
    final client = _client(silo);
    await client.getMoonfinStatus();

    final all = SeerrRequestListResponse.fromJson(
      await client.getRequests(limit: 3),
    );
    expect(all.results.map((r) => r.media!.tmdbId), [1, 2, 3]);
    final pending = SeerrRequestListResponse.fromJson(
      await client.getRequests(filter: 'pending', limit: 3),
    );
    expect(pending.results.map((r) => r.media!.tmdbId), [2, 4]);
  });

  test('an admin sees who made each request', () async {
    // Silo sends its ids as strings.
    Map<String, Object> req(int n, String by) => {
      'id': 'r-$n',
      'media_type': 'movie',
      'tmdb_id': n,
      'title': 'Movie $n',
      'state': 'pending',
      'seasons': [],
      'requested_by_user_id': by,
      'created_at': '2026-01-02T03:04:05.000Z',
      'updated_at': '2026-01-02T03:04:05.000Z',
    };
    final silo = _Silo({
      ..._base(admin: true),
      'GET /api/v2/admin/requests': (
        200,
        {
          'items': [req(1, '9'), req(2, '7')],
        },
      ),
      'GET /api/v2/admin/users': (
        200,
        {
          'items': [
            {'id': '9', 'username': 'sam'},
            {'id': '7', 'username': 'pat'},
          ],
        },
      ),
    });
    final client = _client(silo);
    await client.getMoonfinStatus();

    final list = SeerrRequestListResponse.fromJson(
      await client.getRequests(requestedBy: 9),
    );
    expect(list.results.map((r) => r.requestedBy?.bestName), ['sam', 'pat']);
    // The names are read once, not on every page.
    await client.getRequests(requestedBy: 9);
    expect(silo.calls.where((c) => c.startsWith('GET /api/v2/admin/users')).length, 1);
  });

  test('the badge counts what waits for approval without reading the queue',
      () async {
    final silo = _Silo({
      ..._base(admin: true),
      'GET /api/v2/admin/requests/counts': (
        200,
        {'needs_approval': 120, 'in_progress': 3, 'failed': 0, 'done': 9},
      ),
    });
    final counts = SeerrRequestCounts.fromJson(
      await _client(silo).getRequestCount(),
    );
    expect(counts.pending, 120);
    expect(silo.calls.where((c) => c.startsWith('GET /api/v2/admin/requests?')), isEmpty);
  });

  test('the arr calendars read Silo\'s calendar, with TMDB and TVDB ids '
      'from the catalog', () async {
    final silo = _Silo({
      'GET /api/v2/calendar': (
        200,
        {
          'events': [
            {
              'date': '2026-11-02',
              'items': [
                {
                  'content_id': 'episode-s-1-2',
                  'type': 'episode',
                  'title': 'Severance',
                  'episode_title': 'Goodbye',
                  'series_id': 'series-s',
                  'season_number': 1,
                  'episode_number': 2,
                  'air_date': '2026-11-02',
                  'air_at': '2026-11-03T02:00:00Z',
                  'poster_url': '/api/v2/artwork/s.webp?sig=x',
                },
                {
                  'content_id': 'movie-heat',
                  'type': 'movie',
                  'title': 'Heat',
                  'air_date': '2026-11-02',
                },
                {
                  'content_id': 'episode-u-1-1',
                  'type': 'episode',
                  'title': 'No ids',
                  'series_id': 'series-u',
                  'air_date': '2026-11-02',
                },
              ],
            },
          ],
        },
      ),
      'GET /api/v2/catalog/items/series-s': (
        200,
        {'tvdb_id': '371980', 'tmdb_id': '95396', 'overview': 'Work.'},
      ),
      'GET /api/v2/catalog/items/movie-heat': (
        200,
        {'tmdb_id': '949', 'year': 1995},
      ),
      'GET /api/v2/catalog/items/series-u': (200, {'tmdb_id': '1'}),
    });
    final client = _client(silo);

    final shows = await client.getSonarrCalendar(
      start: '2026-11-01',
      end: '2026-11-20',
    );
    expect(shows, hasLength(1), reason: 'Sonarr rows need a TVDB id');
    final ep = shows.single as Map;
    expect(ep['series'], containsPair('tvdbId', 371980));
    expect(ep['series'], containsPair('tmdbId', 95396));
    expect(ep['airDateUtc'], '2026-11-03T02:00:00.000Z');
    expect(ep['seasonNumber'], 1);
    expect(ep['episodeNumber'], 2);
    expect((ep['series'] as Map)['images'], [
      {
        'coverType': 'poster',
        'remoteUrl': 'https://silo.example/api/v2/artwork/s.webp?sig=x',
      },
    ]);

    final movies = await client.getRadarrCalendar(
      start: '2026-11-01',
      end: '2026-11-20',
    );
    expect(movies, hasLength(1));
    expect(movies.single, containsPair('tmdbId', 949));
    expect(
      DateTime.parse((movies.single as Map)['digitalRelease'] as String)
          .toLocal(),
      DateTime(2026, 11, 2),
      reason: 'a release without a time is the start of the viewer\'s day',
    );

    silo.calls.clear();
    await client.getRadarrCalendar(start: '2026-11-01', end: '2027-01-29');
    final windows = silo.calls
        .where((c) => c.startsWith('GET /api/v2/calendar'))
        .map((c) => Uri.parse('x:${c.split(' ').last}').queryParameters)
        .map((q) => '${q['start']}..${q['end']}')
        .toList();
    expect(windows, [
      '2026-11-01..2026-12-01',
      '2026-12-02..2027-01-01',
      '2027-01-02..2027-01-29',
    ], reason: 'Silo answers at most 31 days at a time');
  });
}
