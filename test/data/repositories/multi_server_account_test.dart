import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

class _AuthStore extends Mock implements AuthenticationStore {}

class _Credentials extends Mock implements CredentialStore {}

class _ClientFactory extends Mock implements MediaServerClientFactory {}

class _Session extends Mock implements SessionRepository {}

class _Client extends Mock implements MediaServerClient {}

void main() {
  late _AuthStore store;
  late _Credentials credentials;
  late _Client bar;
  late MultiServerRepository repository;

  Server server(String id, ServerType type) => Server(
    id: id,
    name: id,
    address: 'http://$id',
    version: '4.9.0',
    serverType: type,
    dateAdded: DateTime(2026),
  );

  PrivateUser user(String serverId, String id, String name) => PrivateUser(
    id: id,
    name: name,
    serverId: serverId,
    accessToken: 'token-$id',
    lastUsed: DateTime(2026),
  );

  setUp(() {
    store = _AuthStore();
    credentials = _Credentials();
    final session = _Session();
    final factory = _ClientFactory();
    bar = _Client();
    when(store.getServers).thenReturn([
      server('foo', ServerType.jellyfin),
      server('bar', ServerType.emby),
    ]);
    when(() => store.getUsers('foo')).thenReturn([
      user('foo', 'alice-foo', 'Alice'),
      user('foo', 'john-foo', 'John'),
    ]);
    when(() => session.activeServerId).thenReturn('foo');
    when(() => session.activeUserId).thenReturn('john-foo');
    when(() => credentials.getToken('bar')).thenAnswer((_) async => null);
    when(
      () => factory.getClient(
        serverId: 'foo',
        serverType: ServerType.jellyfin,
        baseUrl: 'http://foo',
      ),
    ).thenReturn(_Client());
    when(
      () => factory.getClient(
        serverId: 'bar',
        serverType: ServerType.emby,
        baseUrl: 'http://bar',
      ),
    ).thenReturn(bar);
    repository = MultiServerRepository(store, credentials, factory, session);
  });

  test('uses the matching Bar user and that user’s token', () async {
    when(() => store.getUsers('bar')).thenReturn([
      user('bar', 'alice-bar', 'Alice'),
      user('bar', 'john-bar', 'JOHN'),
    ]);
    when(() => credentials.getToken('bar'))
        .thenAnswer((_) async => 'token-alice-bar');

    final sessions = await repository.getLoggedInServers();

    expect(sessions.map((session) => session.userId), ['john-foo', 'john-bar']);
    verify(() => bar.accessToken = 'token-john-bar').called(1);
    verify(() => bar.userId = 'john-bar').called(1);
  });

  test('uses the previous Bar selection when no saved name matches', () async {
    when(() => store.getUsers('bar'))
        .thenReturn([user('bar', 'alice-bar', 'Alice')]);
    when(() => credentials.getToken('bar'))
        .thenAnswer((_) async => 'server-token');

    final sessions = await repository.getLoggedInServers();

    expect(sessions.map((session) => session.userId), [
      'john-foo',
      'alice-bar',
    ]);
    verify(() => bar.accessToken = 'server-token').called(1);
  });

  test(
    'uses the previous Bar selection when the saved name is ambiguous',
    () async {
      when(() => store.getUsers('bar')).thenReturn([
        user('bar', 'alice-bar', 'Alice'),
        user('bar', 'john-bar', 'John'),
        user('bar', 'another-john-bar', 'john'),
      ]);

      final sessions = await repository.getLoggedInServers();

      expect(sessions.map((session) => session.userId), [
        'john-foo',
        'alice-bar',
      ]);
      verify(() => bar.accessToken = 'token-alice-bar').called(1);
    },
  );
}
