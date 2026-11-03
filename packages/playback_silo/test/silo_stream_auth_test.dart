import 'dart:convert';
import 'dart:io';

import 'package:playback_silo/playback_silo.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'silo_test_server.dart';

const _session = '5d1b6a0e-7f3c-4a7e-9a51-2f0c9e8b7a11';

final _profile =
    jsonDecode(File('test/fixtures/device_profile_mpv.json').readAsStringSync())
        as Map<String, dynamic>;

/// The remux decision with its stream at [url].
SiloRoute _decisionWithStream(String url) {
  final decision = fixtureJson('decision_remux.json');
  ((decision['playback_plan'] as Map)['stream'] as Map)['url'] = url;
  return SiloTestServer.json(decision, status: 201);
}

SiloTestServer _server(SiloRoute start) => SiloTestServer({
  capabilitiesPath: SiloTestServer.file('silo/playback_capabilities.json'),
  startPath: start,
  '/api/v2/auth/refresh': SiloTestServer.json({
    'access_token': 'fresh',
    'refresh_token': 'refresh-2',
    'expires_in': 3600,
  }),
});

void main() {
  test(
    'a stream on the server: headers, and the token for the player',
    () async {
      final server = _server(
        SiloTestServer.file('decision_remux.json', status: 201),
      );
      final result = await SiloPlugin(siloTestClient(server))
          .createStreamResolver()
          .resolve(
            siloTestItem('silo/watch_movie.json'),
            deviceProfile: _profile,
          );
      expect(result.requestHeaders, {
        'Authorization': 'Bearer access-1',
        'X-Profile-Id': 'p1',
      });
      // The signed reference and the seek stay as Silo wrote them.
      expect(
        result.streamUrl,
        'https://silo.example/api/v2/stream/$_session'
        '?seek=593.4&st=c2lnbmVk&token=access-1',
      );
    },
  );

  test('HLS goes by headers alone', () async {
    final server = _server(
      _decisionWithStream(
        '/api/v2/playback/transcode/$_session/master.m3u8?st=c2lnbmVk',
      ),
    );
    final result = await SiloPlugin(siloTestClient(server))
        .createStreamResolver()
        .resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        );
    expect(
      result.streamUrl,
      'https://silo.example/api/v2/playback/transcode/$_session/master.m3u8'
      '?st=c2lnbmVk',
    );
    expect(result.requestHeaders['Authorization'], 'Bearer access-1');
  });

  test('a player without headers gets the token on HLS too', () async {
    final server = _server(
      _decisionWithStream(
        '/api/v2/playback/transcode/$_session/master.m3u8?st=c2lnbmVk',
      ),
    );
    final result =
        await SiloPlugin(
          siloTestClient(server),
          environment: () => const SiloPlaybackEnvironment(
            formFactor: 'web',
            platform: 'web',
            traits: SiloPlayerTraits.web,
          ),
        ).createStreamResolver().resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        );
    expect(
      result.streamUrl,
      'https://silo.example/api/v2/playback/transcode/$_session/master.m3u8'
      '?st=c2lnbmVk&token=access-1',
    );
  });

  test('a proxy node gets no credentials', () async {
    const proxy = 'https://edge.example/stream/v3/$_session?st=c2lnbmVk';
    final server = _server(_decisionWithStream(proxy));
    final result = await SiloPlugin(siloTestClient(server))
        .createStreamResolver()
        .resolve(
          siloTestItem('silo/watch_movie.json'),
          deviceProfile: _profile,
        );
    expect(result.streamUrl, proxy);
    expect(result.requestHeaders, isEmpty);
  });

  test(
    'a token past half its life is refreshed before the stream opens',
    () async {
      final server = _server(
        SiloTestServer.file('decision_remux.json', status: 201),
      );
      final client = siloTestClient(server)
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: siloTestNow.add(const Duration(minutes: 20)),
            lifetime: const Duration(hours: 1),
          ),
        )
        // New tokens are a new login, which drops the profile.
        ..profileId = 'p1';
      final result = await SiloPlugin(client).createStreamResolver().resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
      );
      expect(server.to('/api/v2/auth/refresh'), hasLength(1));
      expect(result.requestHeaders['Authorization'], 'Bearer fresh');
      expect(result.streamUrl, endsWith('&token=fresh'));
    },
  );

  test('a cast receiver gets a nearly fresh token', () async {
    Future<int> refreshesWith(Duration left, SiloPlayerTraits traits) async {
      final server = _server(
        SiloTestServer.file('decision_remux.json', status: 201),
      );
      final client = siloTestClient(server)
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: siloTestNow.add(left),
            lifetime: const Duration(hours: 1),
          ),
        )
        ..profileId = 'p1';
      await SiloPlugin(
        client,
        environment: () => SiloPlaybackEnvironment(traits: traits),
      ).createStreamResolver().resolve(
        siloTestItem('silo/watch_movie.json'),
        deviceProfile: _profile,
      );
      return server.to('/api/v2/auth/refresh').length;
    }

    // 45 minutes left: kept for the phone, renewed for a receiver.
    const left = Duration(minutes: 45);
    expect(await refreshesWith(left, SiloPlayerTraits.aether), 0);
    expect(await refreshesWith(left, SiloPlayerTraits.castReceiver), 1);
    // 57 minutes left is fresh enough for both.
    const fresh = Duration(minutes: 57);
    expect(await refreshesWith(fresh, SiloPlayerTraits.castReceiver), 0);
  });

  group('siloAuthorizeUrl', () {
    const base = 'https://silo.example';

    test('only Silo\'s stream routes on its own origin', () {
      expect(
        siloAuthorizeUrl(
          '$base/api/v2/stream/s/subtitles/0.vtt?file_id=1',
          base,
          't',
        ),
        '$base/api/v2/stream/s/subtitles/0.vtt?file_id=1&token=t',
      );
      expect(
        siloAuthorizeUrl('$base/api/v2/stream/s', base, 't'),
        '$base/api/v2/stream/s?token=t',
      );
      for (final url in [
        '$base/api/v2/artwork/tmdb/poster/1/w342.abc.webp?exp=1&sig=2',
        '$base/api/v2/playback/transcode/s/master.m3u8?st=x',
        'https://edge.example/api/v2/stream/s?st=x',
      ]) {
        expect(siloAuthorizeUrl(url, base, 't'), url, reason: url);
      }
    });

    test('every media route for a player without headers, never artwork', () {
      expect(
        siloAuthorizeUrl(
          '$base/api/v2/playback/transcode/s/master.m3u8?st=x',
          base,
          't',
          allMedia: true,
        ),
        '$base/api/v2/playback/transcode/s/master.m3u8?st=x&token=t',
      );
      for (final url in [
        '$base/api/v2/artwork/tmdb/poster/1/w342.abc.webp?exp=1&sig=2',
        'https://edge.example/api/v2/playback/transcode/s/master.m3u8',
      ]) {
        expect(
          siloAuthorizeUrl(url, base, 't', allMedia: true),
          url,
          reason: url,
        );
      }
    });

    test('a URL that has one keeps it; the token is encoded', () {
      expect(
        siloAuthorizeUrl('$base/api/v2/stream/s?token=old', base, 'new'),
        '$base/api/v2/stream/s?token=old',
      );
      expect(
        siloAuthorizeUrl('$base/api/v2/stream/s', base, 'a+b/c='),
        '$base/api/v2/stream/s?token=a%2Bb%2Fc%3D',
      );
    });
  });
}
