import 'dart:io';

import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:test/test.dart';

void main() {
  test(
    'adds server headers to login and rechecks scope on redirects',
    () async {
      final origin = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      final redirectTarget = await HttpServer.bind(
        InternetAddress.loopbackIPv4,
        0,
      );
      addTearDown(() => origin.close(force: true));
      addTearDown(() => redirectTarget.close(force: true));
      addTearDown(resetServerNetworkOverrides);

      final url = 'http://127.0.0.1:${origin.port}';
      final seen = <(String?, String?)>[];
      origin.listen((request) async {
        seen.add((
          request.headers.value('X-Custom-Header'),
          request.headers.value('User-Agent'),
        ));
        await request.drain<void>();
        request.response
          ..statusCode = HttpStatus.temporaryRedirect
          ..headers.set('location', 'http://127.0.0.1:${redirectTarget.port}/');
        await request.response.close();
      });
      redirectTarget.listen((request) async {
        seen.add((
          request.headers.value('X-Custom-Header'),
          request.headers.value('User-Agent'),
        ));
        await request.drain<void>();
        request.response.headers.contentType = ContentType.json;
        request.response.write('{}');
        await request.response.close();
      });

      final client = EmbyMediaServerClient(
        baseUrl: url,
        deviceInfo: const DeviceInfo(
          id: 'id',
          name: 'Phone',
          appName: 'Moonfin',
          appVersion: '1.0',
        ),
      );
      addTearDown(client.dispose);
      gServerRequestHeaders = [
        ServerRequestHeader.tryCreate(
          serverUrl: '$url/emby',
          name: 'X-Custom-Header',
          value: 'test',
        )!,
        ServerRequestHeader.tryCreate(
          serverUrl: url,
          name: 'User-Agent',
          value: 'Custom/1.0',
        )!,
      ];

      await client.authApi.authenticateByName('user', 'password');
      expect(seen, [('test', 'Custom/1.0'), (null, serverUserAgent)]);
    },
  );

  test('existing Emby clients send each saved identity on the next request', () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    addTearDown(resetServerNetworkOverrides);

    final received = <(String?, String?, String?)>[];
    server.listen((request) async {
      received.add((
        request.headers.value(HttpHeaders.userAgentHeader),
        request.headers.value(HttpHeaders.authorizationHeader),
        request.headers.value('X-Emby-Authorization'),
      ));
      await request.drain<void>();
      request.response.headers.contentType = ContentType.json;
      request.response.write('{}');
      await request.response.close();
    });

    final client = EmbyMediaServerClient(
      baseUrl: 'http://127.0.0.1:${server.port}',
      deviceInfo: const DeviceInfo(
        id: 'device-id',
        name: 'Phone',
        appName: 'Moonfin',
        appVersion: '1.0',
      ),
    );
    addTearDown(client.dispose);

    const defaultAgent = 'Mozilla/5.0 (compatible; Moonfin/Flutter)';
    const defaultIdentity =
        'Client="Moonfin", Device="Phone", DeviceId="device-id", Version="1.0"';
    const clientOnly =
        'Client="SenPlayer", Device="Phone", DeviceId="device-id", Version="1.0"';
    const customIdentity =
        'Client="SenPlayer", Device="Tablet", DeviceId="custom", Version="6.0.6"';

    await client.authApi.authenticateByName('user', 'password');
    expect(received.last, (defaultAgent, 'Emby $defaultIdentity', null));

    gServerClientNameOverride = 'SenPlayer';
    await client.authApi.authenticateByName('user', 'password');
    expect(received.last, (defaultAgent, 'Emby $clientOnly', null));

    gEmbyAuthorizationHeader = EmbyAuthorizationHeader.xEmbyAuthorization;
    await client.authApi.authenticateByName('user', 'password');
    expect(received.last, (defaultAgent, null, 'Emby $clientOnly'));

    gServerUserAgentOverride = 'SenPlayer/6.0.6';
    gEmbyAuthorizationScheme = EmbyAuthorizationScheme.mediaBrowser;
    gEmbyDeviceNameOverride = 'Tablet';
    gEmbyDeviceIdOverride = 'custom';
    gEmbyClientVersionOverride = '6.0.6';
    await client.authApi.authenticateByName('user', 'password');
    expect(received.last, (
      'SenPlayer/6.0.6',
      null,
      'MediaBrowser $customIdentity',
    ));

    client.accessToken = 'session-token';
    client.userId = 'session-user';
    await client.authApi.logout();
    const sessionHeader =
        'MediaBrowser Token="session-token", UserId="session-user", $customIdentity';
    expect(received.last, ('SenPlayer/6.0.6', null, sessionHeader));
    expect(serverAuthHeaders(client), {'X-Emby-Authorization': sessionHeader});

    resetServerNetworkOverrides();
    client.accessToken = null;
    client.userId = null;
    await client.authApi.authenticateByName('user', 'password');
    expect(received.last, (defaultAgent, 'Emby $defaultIdentity', null));
  });
}
