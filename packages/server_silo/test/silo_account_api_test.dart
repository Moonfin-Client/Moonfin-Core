import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

final _now = DateTime.utc(2026, 10, 14, 12);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

/// `GET /account/password/capability` as Silo build 4b2e921c answers it
/// (schema `AccountPasswordCapability`).
Map<String, dynamic> _capability({
  String state = 'available',
  bool allowed = true,
}) => {
  'requires_current_password': true,
  'minimum_password_length': 8,
  'maximum_password_bytes': 72,
  'revision': 'r1',
  'state': state,
  'allowed': allowed,
};

ResponseBody _validation(String member, String detail) =>
    ResponseBody.fromString(
      jsonEncode({
        'type': 'https://siloserver.org/docs/api/v2/problems/validation_failed',
        'title': 'Validation failed',
        'status': 422,
        'detail': 'The request did not pass validation; see errors.',
        'errors': [
          {'location': 'body.$member', 'code': 'invalid', 'detail': detail},
        ],
      }),
      422,
      headers: {
        Headers.contentTypeHeader: ['application/problem+json'],
      },
    );

SiloMediaServerClient _client(FixtureServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: _device,
        httpClientAdapter: server,
        clock: () => _now,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      );

void main() {
  group('passwordCapability', () {
    test('reads the limits and whether a change is allowed', () async {
      final server = FixtureServer({
        '/api/v2/account/password/capability': (_) =>
            FixtureServer.json(200, jsonEncode(_capability())),
      });

      final capability = await _client(server).accountApi.passwordCapability();

      expect(capability.state, 'available');
      expect(capability.allowed, isTrue);
      expect(capability.requiresCurrentPassword, isTrue);
      expect(capability.minimumLength, 8);
      expect(capability.maximumBytes, 72);
      expect(capability.canChange, isTrue);
      expect(
        server.requests.single.headers['Authorization'],
        'Bearer access-1',
      );
    });

    test('a change is not possible when not allowed or not available', () {
      expect(
        SiloPasswordCapability.fromJson(_capability(allowed: false)).canChange,
        isFalse,
      );
      expect(
        SiloPasswordCapability.fromJson(
          _capability(state: 'disabled'),
        ).canChange,
        isFalse,
      );
    });
  });

  group('changePassword', () {
    test('posts both passwords and accepts the 204', () async {
      final server = FixtureServer({
        '/api/v2/account/password': (_) => ResponseBody.fromString('', 204),
      });

      await _client(server).accountApi.changePassword(
        currentPassword: 'temporary',
        newPassword: 'brand new password',
      );

      final request = server.requests.single;
      expect(request.method, 'POST');
      expect(request.data, {
        'current_password': 'temporary',
        'new_password': 'brand new password',
      });
    });

    test('a refused new password is a typed error with Silo\'s text', () async {
      final server = FixtureServer({
        '/api/v2/account/password': (_) => _validation(
          'new_password',
          'Choose a password different from the temporary one.',
        ),
      });

      await expectLater(
        _client(server).accountApi.changePassword(
          currentPassword: 'temporary',
          newPassword: 'temporary',
        ),
        throwsA(
          isA<SiloPasswordRejectedError>()
              .having((e) => e.field, 'field', 'new_password')
              .having(
                (e) => e.detail,
                'detail',
                'Choose a password different from the temporary one.',
              ),
        ),
      );
    });

    test('a refused current password names that member', () async {
      final server = FixtureServer({
        '/api/v2/account/password': (_) =>
            _validation('current_password', 'Current password is incorrect.'),
      });

      await expectLater(
        _client(server).accountApi.changePassword(
          currentPassword: 'wrong',
          newPassword: 'brand new password',
        ),
        throwsA(
          isA<SiloPasswordRejectedError>().having(
            (e) => e.field,
            'field',
            'current_password',
          ),
        ),
      );
    });

    test('any other failure stays a DioException', () async {
      final server = FixtureServer({
        '/api/v2/account/password': (_) => FixtureServer.problem(
          409,
          'conflict',
          'This account does not use local password sign-in.',
        ),
      });

      await expectLater(
        _client(server).accountApi.changePassword(
          currentPassword: 'temporary',
          newPassword: 'brand new password',
        ),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            409,
          ),
        ),
      );
    });
  });
}
