import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
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

class _Views extends Mock implements UserViewsApi {}

class _Users extends Mock implements UsersApi {}

void main() {
  late _AuthStore store;
  late _Credentials credentials;
  late _Client foo;
  late _Client bar;
  late _Session session;
  late MultiServerRepository repository;
  late List<LogEvent> warnings;

  void captureWarning(LogEvent event) {
    if (event.level == Level.warning) warnings.add(event);
  }

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
    warnings = [];
    Logger.addLogListener(captureWarning);
    addTearDown(() => Logger.removeLogListener(captureWarning));
    store = _AuthStore();
    credentials = _Credentials();
    session = _Session();
    foo = _Client();
    final factory = _ClientFactory();
    bar = _Client();
    when(store.getServers).thenReturn([
      server('foo', ServerType.jellyfin),
      server('bar', ServerType.emby),
    ]);
    final viewers = [
      user('foo', 'alice-foo', 'Alice'),
      user('foo', 'john-foo', 'John'),
    ];
    when(() => store.getUsers('foo')).thenReturn(viewers);
    for (final viewer in viewers) {
      when(() => store.getUser('foo', viewer.id)).thenReturn(viewer);
    }
    when(() => session.accountSelectionGeneration).thenReturn(0);
    when(() => session.activeServerId).thenReturn('foo');
    when(() => session.activeUserId).thenReturn('john-foo');
    when(() => credentials.getToken('bar')).thenAnswer((_) async => null);
    when(
      () => factory.getClient(
        serverId: 'foo',
        serverType: ServerType.jellyfin,
        baseUrl: 'http://foo',
      ),
    ).thenReturn(foo);
    when(
      () => factory.getClient(
        serverId: 'bar',
        serverType: ServerType.emby,
        baseUrl: 'http://bar',
      ),
    ).thenReturn(bar);
    repository = MultiServerRepository(store, credentials, factory, session);
  });

  test(
    'an older lookup cannot restore credentials after a profile switch',
    () async {
      when(store.getServers).thenReturn([
        server('bar', ServerType.emby),
        server('foo', ServerType.jellyfin),
      ]);
      when(() => store.getUsers('bar'))
          .thenReturn([user('bar', 'alice-bar', 'Alice')]);
      final readingToken = Completer<void>();
      final token = Completer<String?>();
      when(() => credentials.getToken('bar')).thenAnswer((_) {
        readingToken.complete();
        return token.future;
      });

      final staleLookup = repository.getLoggedInServers();
      await readingToken.future;

      when(() => session.accountSelectionGeneration).thenReturn(null);
      expect(await repository.getLoggedInServers(), isEmpty);

      when(() => session.accountSelectionGeneration).thenReturn(1);
      when(() => session.activeUserId).thenReturn('alice-foo');
      final currentSessions = await repository.getLoggedInServers();
      token.complete(null);

      expect(currentSessions.map((session) => session.userId), [
        'alice-bar',
        'alice-foo',
      ]);
      expect(await staleLookup, isEmpty);
      verifyNever(() => foo.accessToken = 'token-john-foo');
      verifyNever(() => foo.userId = 'john-foo');
    },
  );

  test('a new account gets its own in-flight library lookup', () async {
    when(store.getServers).thenReturn([
      server('bar', ServerType.emby),
      server('foo', ServerType.jellyfin),
    ]);
    when(() => store.getUsers('bar'))
        .thenReturn([user('bar', 'alice-bar', 'Alice')]);
    final readingToken = Completer<void>();
    final token = Completer<String?>();
    when(() => credentials.getToken('bar')).thenAnswer((_) {
      readingToken.complete();
      return token.future;
    });

    final views = _Views();
    final users = _Users();
    when(() => foo.userViewsApi).thenReturn(views);
    when(() => foo.usersApi).thenReturn(users);
    when(users.getUserConfiguration)
        .thenAnswer((_) async => const UserConfiguration());
    final readingViews = Completer<void>();
    final viewsResponse = Completer<Map<String, dynamic>>();
    when(() => views.getUserViews(includeHidden: true)).thenAnswer((_) {
      readingViews.complete();
      return viewsResponse.future;
    });

    final oldLookup = repository.getAggregatedLibraries();
    await readingToken.future;
    when(() => session.accountSelectionGeneration).thenReturn(1);
    when(() => session.activeUserId).thenReturn('alice-foo');
    when(store.getServers).thenReturn([server('foo', ServerType.jellyfin)]);
    final newLookup = repository.getAggregatedLibraries();
    expect(newLookup, isNot(same(oldLookup)));
    await readingViews.future;

    token.complete(null);
    expect(await oldLookup, isEmpty);
    expect(repository.getAggregatedLibraries(), same(newLookup));
    viewsResponse.complete({
      'Items': [
        {'Id': 'alice-library', 'Name': 'Alice’s library'},
      ],
    });
    expect((await newLookup).single.id, 'alice-library');
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
    expect(warnings, isEmpty);
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
    expect(warnings.map((warning) => warning.message), [
      'MultiServer: No usable username match on bar. '
          'Using the default account selection.',
    ]);
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
