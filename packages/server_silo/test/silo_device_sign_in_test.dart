import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

// The pinned contract's validator, shared with playback_silo's tests. It
// reads the contract by a path relative to the package directory, which
// resolves from here too.
import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';

final _now = DateTime.utc(2026, 10, 18, 20);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

SiloMediaServerClient _client(FixtureServer server) => SiloMediaServerClient(
  baseUrl: 'https://silo.example',
  deviceInfo: _device,
  httpClientAdapter: server,
  platform: 'macos',
  clock: () => _now,
);

Map<String, dynamic> _fixture(String name) =>
    jsonDecode(fixture('silo/$name.json')) as Map<String, dynamic>;

ResponseBody Function(RequestOptions) _answer(
  Map<String, dynamic> body, {
  int status = 200,
}) =>
    (_) => FixtureServer.json(status, jsonEncode(body));

/// A server whose capability says [state], and whose start and poll answer
/// the fixtures (the poll answers [poll]).
FixtureServer _silo({String state = 'available', Map<String, dynamic>? poll}) =>
    FixtureServer({
      '/api/v2/auth/device/capability': _answer({
        ..._fixture('device_login_capability'),
        'state': state,
      }),
      '/api/v2/auth/device/start': _answer(
        _fixture('device_login_start'),
        status: 201,
      ),
      '/api/v2/auth/device/poll': _answer(
        poll ?? _fixture('device_login_poll_pending'),
      ),
    });

Map<String, dynamic> _poll(String status) => {
  ..._fixture('device_login_poll_pending'),
  'status': status,
  'opened': false,
}..remove('expires_at');

void main() {
  test('the fixtures fit the pinned contract', () {
    expect(
      siloSchemaErrors(
        'DeviceLoginCapability',
        _fixture('device_login_capability'),
      ),
      isEmpty,
    );
    expect(
      siloSchemaErrors('DeviceLoginStart', _fixture('device_login_start')),
      isEmpty,
    );
    for (final name in [
      'device_login_poll_pending',
      'device_login_poll_approved',
    ]) {
      expect(siloSchemaErrors('DeviceLoginPoll', _fixture(name)), isEmpty);
    }
  });

  group('initiateQuickConnect', () {
    test('answers the code, the secret, the link for the QR code, the expiry '
        'and the poll interval', () async {
      final result = await _client(_silo()).authApi.initiateQuickConnect();

      expect(result['Code'], '48217730');
      expect(result['Secret'], 'dc_SCRUBBED');
      expect(result['Authenticated'], isFalse);
      expect(
        result[QuickConnectKeys.verificationUri],
        'https://silo.example/activate',
      );
      expect(
        result[QuickConnectKeys.verificationUriComplete],
        'https://silo.example/activate?code=48217730',
      );
      expect(result[QuickConnectKeys.expiresAt], '2026-10-18T20:15:00.000Z');
      expect(result[QuickConnectKeys.pollAfterSeconds], 3);
    });

    test('starts with the device name and platform, without a login, and '
        'the body fits the contract', () async {
      final server = _silo();
      final client = _client(server)..accessToken = 'left-over';

      await client.authApi.initiateQuickConnect();

      final start = server.requests.singleWhere(
        (r) => r.uri.path == '/api/v2/auth/device/start',
      );
      expect(start.method, 'POST');
      expect(start.data, {
        'device_name': 'Test TV',
        'device_platform': 'macos',
      });
      expect(
        siloSchemaErrors('StartDeviceLoginInputBody', start.data),
        isEmpty,
      );
      expect(start.headers.containsKey('Authorization'), isFalse);
      expect(start.headers['X-Silo-Device-Name'], 'Test TV');
    });

    test('without an expires_at, counts expires_in from now', () async {
      final start = _fixture('device_login_start')..remove('expires_at');
      final server = FixtureServer({
        '/api/v2/auth/device/capability': _answer(
          _fixture('device_login_capability'),
        ),
        '/api/v2/auth/device/start': _answer(start, status: 201),
      });

      final result = await _client(server).authApi.initiateQuickConnect();

      expect(result[QuickConnectKeys.expiresAt], '2026-10-18T20:15:00.000Z');
    });

    for (final state in ['disabled', 'not_configured', 'unsupported']) {
      test('a server with device sign-in $state is unavailable, and nothing '
          'is started', () async {
        final server = _silo(state: state);

        await expectLater(
          _client(server).authApi.initiateQuickConnect(),
          throwsA(
            isA<QuickConnectUnavailableError>().having(
              (e) => e.reason,
              'reason',
              state,
            ),
          ),
        );
        expect(
          server.requests.map((r) => r.uri.path),
          isNot(contains('/api/v2/auth/device/start')),
        );
      });
    }
  });

  group('checkQuickConnect', () {
    test('a pending request answers opened and its moved expiry', () async {
      final server = _silo();

      final result = await _client(server).authApi.checkQuickConnect('dc_1');

      expect(result['Authenticated'], isFalse);
      expect(result[QuickConnectKeys.opened], isTrue);
      expect(result[QuickConnectKeys.expiresAt], '2026-10-18T20:20:00.000Z');
      expect(result[QuickConnectKeys.pollAfterSeconds], 3);
      expect(result.containsKey(QuickConnectKeys.status), isFalse);

      final poll = server.requests.single;
      expect(poll.method, 'POST');
      expect(poll.data, {'device_code': 'dc_1'});
      expect(siloSchemaErrors('PollDeviceLoginInputBody', poll.data), isEmpty);
      expect(poll.headers.containsKey('Authorization'), isFalse);
    });

    for (final (silo, moonfin) in [
      ('denied', QuickConnectKeys.statusDenied),
      ('expired', QuickConnectKeys.statusExpired),
      ('consumed', QuickConnectKeys.statusUsed),
      ('canceled', QuickConnectKeys.statusUsed),
    ]) {
      test('$silo answers Status $moonfin', () async {
        final result = await _client(
          _silo(poll: _poll(silo)),
        ).authApi.checkQuickConnect('dc_1');

        expect(result['Authenticated'], isFalse);
        expect(result[QuickConnectKeys.status], moonfin);
      });
    }

    test('a device code Silo no longer knows (404) is expired', () async {
      final server = FixtureServer({});

      final result = await _client(server).authApi.checkQuickConnect('dc_1');

      expect(result[QuickConnectKeys.status], QuickConnectKeys.statusExpired);
    });

    test('another failure reaches the caller and is sent once', () async {
      final server = FixtureServer({
        '/api/v2/auth/device/poll': (_) =>
            FixtureServer.problem(503, 'unavailable', 'Try again.'),
      });

      await expectLater(
        _client(server).authApi.checkQuickConnect('dc_1'),
        throwsA(isA<DioException>()),
      );
      expect(server.requests, hasLength(1));
    });
  });

  group('authenticateWithQuickConnect', () {
    test('signs in with the pair the approving poll collected, once', () async {
      final server = _silo(poll: _fixture('device_login_poll_approved'));
      final client = _client(server);

      final check = await client.authApi.checkQuickConnect('dc_1');
      expect(check['Authenticated'], isTrue);
      expect(client.session.tokens, isNull);

      final result = await client.authApi.authenticateWithQuickConnect('dc_1');

      expect(result['AccessToken'], 'SCRUBBED');
      expect((result['User'] as Map)[siloAccountIdKey], '9');
      expect(result[SiloAuthApi.siloPasswordChangeRequiredKey], isFalse);
      expect(client.session.tokens?.refreshToken, 'SCRUBBED');
      expect(
        client.session.tokens?.expiresAt,
        _now.add(const Duration(hours: 1)),
      );

      // Silo issues the pair once, and it isn't kept for a second sign-in.
      await expectLater(
        client.authApi.authenticateWithQuickConnect('dc_1'),
        throwsStateError,
      );
    });

    test('flags an account that must change its password', () async {
      final approved = _fixture('device_login_poll_approved');
      (approved['tokens']['user'] as Map)['password_change_required'] = true;
      final client = _client(_silo(poll: approved));

      await client.authApi.checkQuickConnect('dc_1');
      final result = await client.authApi.authenticateWithQuickConnect('dc_1');

      expect(result[SiloAuthApi.siloPasswordChangeRequiredKey], isTrue);
    });

    test('an approval without tokens is an error, not a sign-in', () async {
      final approved = _fixture('device_login_poll_approved')..remove('tokens');
      final client = _client(_silo(poll: approved));

      await expectLater(
        client.authApi.checkQuickConnect('dc_1'),
        throwsFormatException,
      );
    });

    test('a code never approved signs nothing in', () async {
      final client = _client(_silo());

      await expectLater(
        client.authApi.authenticateWithQuickConnect('dc_1'),
        throwsStateError,
      );
    });
  });

  group('authorizeQuickConnect', () {
    SiloMediaServerClient signedIn(FixtureServer server) => _client(server)
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'main';

    FixtureServer approving(ResponseBody Function(RequestOptions) answer) =>
        FixtureServer({'/api/v2/auth/device/approve': answer});

    test(
      'approves the code as this login, and the body fits the contract',
      () async {
        final server = approving(_answer({'status': 'approved'}));

        final approved = await signedIn(
          server,
        ).authApi.authorizeQuickConnect('4821-7730', userId: 'main');

        expect(approved, isTrue);
        final request = server.requests.single;
        expect(request.method, 'POST');
        expect(request.data, {'code': '48217730'});
        expect(
          siloSchemaErrors('DecideDeviceLoginInputBody', request.data),
          isEmpty,
        );
        expect(
          siloSchemaErrors('DeviceLoginDecision', {'status': 'approved'}),
          isEmpty,
        );
        expect(request.headers['Authorization'], 'Bearer access-1');
      },
    );

    test('a decision other than approved is false', () async {
      final server = approving(_answer({'status': 'denied'}));

      expect(
        await signedIn(server).authApi.authorizeQuickConnect('48217730'),
        isFalse,
      );
    });

    for (final (status, code) in [
      (404, 'not_found'),
      (409, 'conflict'),
      (410, 'device_login_expired'),
    ]) {
      test('$status $code: no request is waiting with that code', () async {
        final server = approving(
          (_) => FixtureServer.problem(status, code, 'No.'),
        );

        expect(
          await signedIn(server).authApi.authorizeQuickConnect('48217730'),
          isFalse,
        );
        expect(server.requests, hasLength(1));
      });
    }

    for (final (status, code) in [
      (403, 'permission_denied'),
      (429, 'rate_limited'),
    ]) {
      test('$status $code reaches the caller', () async {
        final server = approving(
          (_) => FixtureServer.problem(status, code, 'No.'),
        );

        await expectLater(
          signedIn(server).authApi.authorizeQuickConnect('48217730'),
          throwsA(
            isA<DioException>().having(
              (e) => e.response?.statusCode,
              'status',
              status,
            ),
          ),
        );
      });
    }
  });
}
