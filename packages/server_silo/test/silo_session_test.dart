import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

typedef _Handler = Future<ResponseBody> Function(RequestOptions options);

/// Routes each request to a handler and records what was sent.
class _Adapter implements HttpClientAdapter {
  _Adapter(this.handle);

  final _Handler handle;
  final sent = <({Uri uri, String? bearer, Object? body})>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    sent.add((
      uri: options.uri,
      bearer: options.headers['Authorization'] as String?,
      body: options.data,
    ));
    return handle(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(Object body, [int status = 200]) => ResponseBody.fromString(
  jsonEncode(body),
  status,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  },
);

ResponseBody _expired() => _json({
  'type': 'https://silo.dev/problems/invalid_token',
  'title': 'Invalid token',
  'status': 401,
}, 401);

ResponseBody _redirect(String location, [int status = 307]) =>
    ResponseBody.fromString('', status, headers: {
      'location': [location],
    });

const _account = {
  'id': 'acct-1',
  'username': 'testuser',
  'role': 'user',
  'email': '',
  'permissions': <String>[],
  'download_allowed': true,
  'password_change_required': false,
};

SiloMediaServerClient _client(_Adapter adapter) {
  final client = SiloMediaServerClient(
    baseUrl: 'https://silo.test',
    deviceInfo: const DeviceInfo(
      id: 'device-1',
      name: 'Test TV',
      appName: 'Moonfin',
      appVersion: '2.7.0',
    ),
    httpClientAdapter: adapter,
  );
  client.session.setTokens(
    SiloTokens(
      accessToken: 'old-access',
      refreshToken: 'refresh-1',
      expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
      lifetime: const Duration(hours: 1),
    ),
  );
  return client;
}

Dio _rawDio(_Adapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://silo.test'))..httpClientAdapter = adapter;

Iterable<String> _paths(_Adapter a, String path) =>
    a.sent.where((s) => s.uri.path == path).map((s) => s.bearer ?? '');

void main() {
  group('refresh and replay', () {
    test('an expired token is refreshed and the request replayed', () async {
      late _Adapter adapter;
      adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/auth/refresh':
            return _json({
              'access_token': 'new-access',
              'refresh_token': 'refresh-2',
              'expires_in': 3600,
            });
          case '/api/v2/account/me':
            return o.headers['Authorization'] == 'Bearer new-access'
                ? _json(_account)
                : _expired();
        }
        return _json({}, 404);
      });
      final client = _client(adapter);

      final info = await client.systemApi.getSystemInfo();

      expect((info['SiloAccount'] as Map)['username'], 'testuser');
      expect(_paths(adapter, '/api/v2/account/me'), [
        'Bearer old-access',
        'Bearer new-access',
      ]);
    });

    test('a switch of profile mid-refresh fails the request instead of '
        'replaying it as the new profile', () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/auth/refresh':
            // The app switches profile while the refresh is in flight.
            client.profileId = 'profile-2';
            return _json({
              'access_token': 'new-access',
              'refresh_token': 'refresh-2',
              'expires_in': 3600,
            });
          case '/api/v2/account/me':
            return _expired();
        }
        return _json({}, 404);
      });
      client = _client(adapter);
      client.profileId = 'profile-1';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_paths(adapter, '/api/v2/account/me'), hasLength(1));
    });

    test('a request waiting on an early refresh is not sent if the profile '
        'changes meanwhile', () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/auth/refresh':
            client.profileId = 'profile-2';
            return _json({
              'access_token': 'new-access',
              'refresh_token': 'refresh-2',
              'expires_in': 3600,
            });
          case '/api/v2/account/me':
            return _json(_account);
        }
        return _json({}, 404);
      });
      client = _client(adapter);
      // Close enough to expiry that the request refreshes before it is sent.
      client.session.setTokens(
        SiloTokens(
          accessToken: 'old-access',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.now().toUtc().add(const Duration(seconds: 30)),
          lifetime: const Duration(hours: 1),
        ),
      );
      client.profileId = 'profile-1';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_paths(adapter, '/api/v2/account/me'), isEmpty);
    });

    test('an early refresh with no identity change still sends the request',
        () async {
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/auth/refresh':
            return _json({
              'access_token': 'new-access',
              'refresh_token': 'refresh-2',
              'expires_in': 3600,
            });
          case '/api/v2/account/me':
            return _json(_account);
        }
        return _json({}, 404);
      });
      final client = _client(adapter);
      client.session.setTokens(
        SiloTokens(
          accessToken: 'old-access',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.now().toUtc().add(const Duration(seconds: 30)),
          lifetime: const Duration(hours: 1),
        ),
      );

      await client.systemApi.getSystemInfo();

      expect(_paths(adapter, '/api/v2/account/me'), ['Bearer new-access']);
    });

    test('a refresh that finishes after a new sign-in reports no success',
        () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        // Someone else signs in while the old refresh is in flight.
        client.session.setTokens(
          SiloTokens(
            accessToken: 'other-access',
            refreshToken: 'other-refresh',
            expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
            lifetime: const Duration(hours: 1),
          ),
        );
        return _json({
          'access_token': 'new-access',
          'refresh_token': 'refresh-2',
          'expires_in': 3600,
        });
      });
      client = _client(adapter);

      final refreshed = await client.session.refresh(
        Dio(BaseOptions(baseUrl: 'https://silo.test'))
          ..httpClientAdapter = adapter,
      );

      expect(refreshed, isFalse);
      expect(client.session.accessToken, 'other-access');
    });
  });

  group('redispatch after an identity change', () {
    test('a redirect that arrives after a profile switch is not followed',
        () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/account/me':
            client.profileId = 'profile-2';
            return _redirect('/silo/api/v2/account/me');
          case '/silo/api/v2/account/me':
            return _json(_account);
        }
        return _json({}, 404);
      });
      client = _client(adapter);
      client.profileId = 'profile-1';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_paths(adapter, '/silo/api/v2/account/me'), isEmpty);
    });

    test('a redirect that arrives after sign-out is not followed', () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/account/me':
            client.session.clear();
            return _redirect('/silo/api/v2/account/me');
          case '/silo/api/v2/account/me':
            return _json(_account);
        }
        return _json({}, 404);
      });
      client = _client(adapter);

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_paths(adapter, '/silo/api/v2/account/me'), isEmpty);
    });

    test('a dead-connection retry after a profile switch is not sent',
        () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/account/me':
            client.profileId = 'profile-2';
            throw const SocketException('Connection reset by peer');
        }
        return _json({}, 404);
      });
      client = _client(adapter);
      client.profileId = 'profile-1';

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(_paths(adapter, '/api/v2/account/me'), hasLength(1));
    });

    test('a dead-connection retry with no identity change is still sent',
        () async {
      var attempts = 0;
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/account/me':
            if (attempts++ == 0) {
              throw const SocketException('Connection reset by peer');
            }
            return _json(_account);
        }
        return _json({}, 404);
      });
      final client = _client(adapter);

      final info = await client.systemApi.getSystemInfo();

      expect((info['SiloAccount'] as Map)['username'], 'testuser');
      expect(_paths(adapter, '/api/v2/account/me'), hasLength(2));
    });
  });

  group('profile proof belongs to its login', () {
    SiloMediaServerClient withProfile() {
      final client = _client(_Adapter((o) async => _json({}, 404)));
      client.profileId = 'profile-1';
      client.profileToken = 'pin-proof';
      return client;
    }

    test('sign-out drops the profile and its PIN proof', () {
      final client = withProfile();

      client.session.clear();

      expect(client.profileId, isNull);
      expect(client.profileToken, isNull);
      expect(client.authHeaders().keys, isNot(contains('X-Profile-Token')));
    });

    test('a new login drops the previous profile and PIN proof', () {
      final client = withProfile();

      client.session.setTokens(
        SiloTokens(
          accessToken: 'other-access',
          refreshToken: 'other-refresh',
          expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      );

      expect(client.profileId, isNull);
      expect(client.profileToken, isNull);
    });

    test('a refused refresh drops the profile and its PIN proof', () async {
      late SiloMediaServerClient client;
      final adapter = _Adapter((o) async => _expired());
      client = _client(adapter);
      client.profileId = 'profile-1';
      client.profileToken = 'pin-proof';

      expect(await client.session.refresh(_rawDio(adapter)), isFalse);
      expect(client.profileId, isNull);
      expect(client.profileToken, isNull);
    });

    test('a refresh of the same login keeps the profile', () async {
      final adapter = _Adapter((o) async => _json({
        'access_token': 'new-access',
        'refresh_token': 'refresh-2',
        'expires_in': 3600,
      }));
      final client = _client(adapter);
      client.profileId = 'profile-1';
      client.profileToken = 'pin-proof';

      expect(await client.session.refresh(_rawDio(adapter)), isTrue);
      expect(client.profileId, 'profile-1');
      expect(client.profileToken, 'pin-proof');
    });
  });

  group('refresh failures settle cleanly', () {
    test('a malformed refresh answer fails without throwing and keeps the '
        'login', () async {
      final adapter = _Adapter((o) async => _json({
        'access_token': 'new-access',
        'refresh_token': 'refresh-2',
        'expires_in': 'soon',
      }));
      final client = _client(adapter);

      expect(await client.session.refresh(_rawDio(adapter)), isFalse);
      expect(client.session.accessToken, 'old-access');
    });

    test('a failing token-save callback still completes the refresh',
        () async {
      final adapter = _Adapter((o) async => _json({
        'access_token': 'new-access',
        'refresh_token': 'refresh-2',
        'expires_in': 3600,
      }));
      final client = _client(adapter);
      client.session.onTokensChanged = (_) => throw StateError('disk full');

      expect(await client.session.refresh(_rawDio(adapter)), isTrue);
      expect(client.session.accessToken, 'new-access');
    });

    test('a failing session-ended callback does not throw', () async {
      final adapter = _Adapter((o) async => _expired());
      final client = _client(adapter);
      client.session.onSessionEnded = (_) => throw StateError('boom');

      expect(await client.session.refresh(_rawDio(adapter)), isFalse);
      expect(client.session.accessToken, isNull);
    });
  });

  group('redirects', () {
    test('a refresh redirected to another host is not followed', () async {
      final adapter = _Adapter((o) async {
        if (o.uri.host != 'silo.test') return _json({'access_token': 'x'});
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/auth/refresh':
            return _redirect('https://evil.test/steal');
          case '/api/v2/account/me':
            return _expired();
        }
        return _json({}, 404);
      });
      final client = _client(adapter);

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(adapter.sent.where((s) => s.uri.host == 'evil.test'), isEmpty);
    });

    test('an authenticated request redirected to another host is not '
        'followed', () async {
      final adapter = _Adapter((o) async {
        if (o.uri.host != 'silo.test') return _json(_account);
        if (o.uri.path == '/api/v2/system/info') {
          return _json({'server_version': 'x', 'api_major': 2});
        }
        return _redirect('https://evil.test${o.uri.path}', 302);
      });
      final client = _client(adapter);

      await expectLater(
        client.systemApi.getSystemInfo(),
        throwsA(isA<DioException>()),
      );
      expect(adapter.sent.where((s) => s.uri.host == 'evil.test'), isEmpty);
    });

    test('a redirect on the same server is still followed', () async {
      final adapter = _Adapter((o) async {
        switch (o.uri.path) {
          case '/api/v2/system/info':
            return _json({'server_version': 'x', 'api_major': 2});
          case '/api/v2/account/me':
            return _redirect('/silo/api/v2/account/me', 308);
          case '/silo/api/v2/account/me':
            return _json(_account);
        }
        return _json({}, 404);
      });
      final client = _client(adapter);

      final info = await client.systemApi.getSystemInfo();

      expect((info['SiloAccount'] as Map)['username'], 'testuser');
    });
  });

  test('same-origin redirect rule', () {
    final from = Uri.parse('http://silo.test:8080/a');
    expect(isSameOriginRedirect(from, Uri.parse('http://silo.test:8080/b')),
        isTrue);
    // An upgrade from a nondefault HTTP port to the default HTTPS port.
    expect(isSameOriginRedirect(from, Uri.parse('https://silo.test/b')),
        isTrue);
    expect(isSameOriginRedirect(from, Uri.parse('https://silo.test:443/b')),
        isTrue);
    // TLS on the same port is the same listener.
    expect(isSameOriginRedirect(from, Uri.parse('https://silo.test:8080/b')),
        isTrue);
    // Any other HTTPS port on the host may be another service.
    expect(isSameOriginRedirect(from, Uri.parse('https://silo.test:9443/b')),
        isFalse);
    expect(
      isSameOriginRedirect(
        Uri.parse('http://silo.test/a'),
        Uri.parse('https://silo.test:8443/b'),
      ),
      isFalse,
    );
    expect(isSameOriginRedirect(from, Uri.parse('http://silo.test:9090/b')),
        isFalse);
    expect(isSameOriginRedirect(from, Uri.parse('http://other.test:8080/b')),
        isFalse);
    expect(
      isSameOriginRedirect(
        Uri.parse('https://silo.test/a'),
        Uri.parse('http://silo.test/b'),
      ),
      isFalse,
    );
  });
}
