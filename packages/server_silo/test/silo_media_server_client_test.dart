import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

void main() {
  const device = DeviceInfo(
    id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
    name: 'Test Mac',
    appName: 'Moonfin for macOS',
    appVersion: '2.7.0',
  );

  SiloMediaServerClient newClient() => SiloMediaServerClient(
    baseUrl: 'https://silo.example',
    deviceInfo: device,
    platform: 'macOS',
  );

  test('identifies as a Silo client', () {
    final client = newClient();
    expect(client.serverType, ServerType.silo);
    expect(client.baseUrl, 'https://silo.example');
    client.baseUrl = 'https://silo.example/proxy';
    expect(client.baseUrl, 'https://silo.example/proxy');
    client.dispose();
  });

  group('requestHeaders', () {
    test('before sign-in: device and app only', () {
      final headers = newClient().requestHeaders;
      expect(headers['X-Silo-Device-Id'], device.id);
      expect(headers['X-Silo-Device-Name'], 'Test Mac');
      expect(headers['X-Silo-Device-Platform'], 'macOS');
      expect(headers['X-Silo-Client'], 'Moonfin for macOS');
      expect(headers['X-Silo-Client-Version'], '2.7.0');
      expect(headers.keys, isNot(contains('Authorization')));
      expect(headers.keys, isNot(contains('X-Profile-Id')));
    });

    test('follow the token and profile as they change', () {
      final client = newClient()
        ..accessToken = 'tok'
        ..profileId = 'p1'
        ..profileToken = 'pvt_1';
      expect(client.requestHeaders['Authorization'], 'Bearer tok');
      expect(client.requestHeaders['X-Profile-Id'], 'p1');
      expect(client.requestHeaders['X-Profile-Token'], 'pvt_1');

      client.profileToken = null;
      expect(client.requestHeaders.keys, isNot(contains('X-Profile-Token')));
      expect(client.requestHeaders['X-Profile-Id'], 'p1');

      // Signing out drops the profile too: it belongs to the login.
      client.accessToken = null;
      expect(client.requestHeaders.keys, isNot(contains('Authorization')));
      expect(client.requestHeaders.keys, isNot(contains('X-Profile-Id')));
    });

    test('authHeaders, for requests outside the client, match', () {
      final client = newClient()
        ..accessToken = 'tok'
        ..profileId = 'p1';
      expect(client, isA<ProfileAwareClient>());
      expect(client.authHeaders(), client.requestHeaders);
      expect(serverAuthHeaders(client)['Authorization'], 'Bearer tok');
      expect(clientProfileId(client), 'p1');
    });

    test('accessToken and userId round-trip like the other clients', () {
      final client = newClient()
        ..accessToken = 'tok'
        ..userId = 'p1';
      expect(client.accessToken, 'tok');
      expect(client.userId, 'p1');
    });
  });

  test('sessions are not supported, and say so', () {
    expect(
      () => newClient().sessionApi.getSessions(),
      throwsA(
        isA<UnsupportedError>().having(
          (e) => e.message,
          'message',
          'SessionApi.getSessions is not supported on Silo',
        ),
      ),
    );
  });

  test('an image of an unseen item is a placeholder its client resolves', () {
    final client = newClient();
    final url = client.imageApi.getPrimaryImageUrl(
      'movie-imdb-tt0295701',
      maxWidth: 300,
    );
    expect(parseSiloImagePlaceholder(url)?.itemId, 'movie-imdb-tt0295701');
    expect(client.imageResolver.owns(url), isTrue);
    expect(SiloImageResolution.resolve(url), isNotNull);
    client.dispose();
    expect(
      client.imageResolver.owns(url),
      isTrue,
      reason: 'still its URL, but no longer reachable app-wide',
    );
  });

  group('permanently unsupported', () {
    final client = newClient();

    test('Live TV reads are empty, writes are refused', () async {
      final channels = await client.liveTvApi.getChannels();
      expect(channels['Items'], isEmpty);
      expect(channels['TotalRecordCount'], 0);
      expect((await client.liveTvApi.getGuide())['Items'], isEmpty);
      expect((await client.liveTvApi.getTimers())['Items'], isEmpty);
      expect(
        () => client.liveTvApi.createTimer('p'),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('Instant Mix is empty', () async {
      final mix = await client.instantMixApi.getInstantMix('x');
      expect(mix['Items'], isEmpty);
    });

    test('admin APIs are refused', () {
      expect(() => client.adminSystemApi, throwsA(isA<UnsupportedError>()));
      expect(() => client.adminUsersApi, throwsA(isA<UnsupportedError>()));
    });

    test('optional APIs are absent', () {
      expect(client.trickplayApi, isNull);
      expect(client.syncPlayApi, isNull);
      expect(client.clientLogApi, isNull);
      expect(client.gamesApi, isNull);
    });
  });
}
