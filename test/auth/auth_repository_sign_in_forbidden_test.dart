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

DioException _refusal(int status, Object? body) {
  final request = RequestOptions(path: '/Users/AuthenticateByName');
  return DioException(
    requestOptions: request,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: request, statusCode: status, data: body),
  );
}

void main() {
  test('a 403 is reported as the account being refused', () async {
    final state = await _signInFailingWith(
      // What Jellyfin sends outside development, whatever the reason was.
      _refusal(403, 'Error processing request.'),
    );

    expect(state, isA<SignInForbidden>());
  });

  test('a 403 is the same whatever the body says', () async {
    for (final body in [
      '[192.168.1.5] User is not allowed access at this time.',
      'User account has been disabled.',
      null,
    ]) {
      final state = await _signInFailingWith(_refusal(403, body));

      expect(state, isA<SignInForbidden>());
    }
  });

  test('a wrong password is not mistaken for it', () async {
    final state = await _signInFailingWith(
      _refusal(401, 'Error processing request.'),
    );

    expect(state, isA<ApiClientError>());
    expect((state as ApiClientError).error, 'Invalid username or password');
  });

  test('other failures keep their own messages', () async {
    final state = await _signInFailingWith(_refusal(500, 'Error'));

    expect(state, isA<ApiClientError>());
    expect((state as ApiClientError).statusCode, 500);
  });
}
