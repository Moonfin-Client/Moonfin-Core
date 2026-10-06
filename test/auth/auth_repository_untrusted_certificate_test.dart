import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/login_state.dart';
import 'package:moonfin/auth/repositories/auth_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';

class _FailingAuthApi extends Fake implements AuthApi {
  _FailingAuthApi(this.failure);

  final DioException failure;

  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) => Future.error(failure);
}

class _Client extends Fake implements MediaServerClient {
  _Client(this.authApi);

  @override
  final AuthApi authApi;
}

class _Store extends Fake implements AuthenticationStore {}

class _Prefs extends Fake implements AuthenticationPreferences {}

class _Sessions extends Fake implements SessionRepository {}

class _Users extends Fake implements UserRepository {}

Future<LoginState> _signInFailingWith(DioException failure) =>
    AuthRepository(_Store(), _Prefs(), _Sessions(), _Users()).authenticate(
      client: _Client(_FailingAuthApi(failure)),
      serverId: 'server',
      username: 'user',
      password: 'secret',
    );

void main() {
  final request = RequestOptions(path: '/Users/AuthenticateByName');

  test('a rejected certificate is reported as one', () async {
    final state = await _signInFailingWith(
      DioException(
        requestOptions: request,
        error:
            'HandshakeException: Handshake error in client (OS Error: '
            'CERTIFICATE_VERIFY_FAILED: self signed certificate)',
      ),
    );

    expect(state, isA<UntrustedCertificate>());
  });

  test('a wrong password still reads as a sign-in error', () async {
    final state = await _signInFailingWith(
      DioException(
        requestOptions: request,
        type: DioExceptionType.badResponse,
        response: Response(requestOptions: request, statusCode: 401),
      ),
    );

    expect(state, isA<ApiClientError>());
  });
}
