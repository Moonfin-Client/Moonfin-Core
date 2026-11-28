import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/login_state.dart';
import 'package:moonfin/auth/repositories/auth_repository.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/auth/store/authentication_preferences.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:server_core/server_core.dart';

// A server that answers sign-in with a body the app can't read: the token
// is a number, not a string, so reading it throws.
const _unreadable = <String, dynamic>{'AccessToken': 42, 'UserId': 'user'};

class _UnreadableAuthApi extends Fake implements AuthApi {
  @override
  Future<Map<String, dynamic>> authenticateByName(
    String username,
    String password,
  ) async => _unreadable;

  @override
  Future<Map<String, dynamic>> authenticateWithQuickConnect(
    String secret,
  ) async => _unreadable;
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

AuthRepository _repository() =>
    AuthRepository(_Store(), _Prefs(), _Sessions(), _Users());

final _client = _Client(_UnreadableAuthApi());

/// Runs [signIn] and checks it ends in an error, both as the state it
/// returns and as the last state on [AuthRepository.stateStream], which
/// would otherwise be left at [Authenticating].
Future<void> _expectEndsInError(
  Future<LoginState> Function(AuthRepository repository) signIn,
) async {
  final repository = _repository();
  final states = <LoginState>[];
  repository.stateStream.listen(states.add);

  final state = await signIn(repository);
  await pumpEventQueue();

  expect(state, isA<ApiClientError>());
  expect(states.last, isA<ApiClientError>());
}

void main() {
  test('a password sign-in with an unreadable answer ends in an error', () {
    return _expectEndsInError(
      (repository) => repository.authenticate(
        client: _client,
        serverId: 'server',
        username: 'user',
        password: 'secret',
      ),
    );
  });

  test('a QuickConnect sign-in with an unreadable answer ends in an error', () {
    return _expectEndsInError(
      (repository) => repository.authenticateWithQuickConnect(
        client: _client,
        serverId: 'server',
        secret: 'secret',
      ),
    );
  });
}
