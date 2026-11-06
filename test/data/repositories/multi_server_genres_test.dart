import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockImageApi extends Mock implements ImageApi {}

class _MockAuthStore extends Mock implements AuthenticationStore {}

class _MockCredentialStore extends Mock implements CredentialStore {}

class _MockClientFactory extends Mock implements MediaServerClientFactory {}

class _MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  late Map<String, _MockItemsApi> itemsApis;
  late MultiServerRepository multiServer;

  Future<Map<String, dynamic>> genresCall(_MockItemsApi api) => api.getGenres(
    sortBy: any(named: 'sortBy'),
    sortOrder: any(named: 'sortOrder'),
    recursive: any(named: 'recursive'),
    limit: any(named: 'limit'),
    fields: any(named: 'fields'),
    includeItemTypes: any(named: 'includeItemTypes'),
  );

  Future<Map<String, dynamic>> artworkCall(_MockItemsApi api) => api.getItems(
    genreIds: any(named: 'genreIds'),
    includeItemTypes: any(named: 'includeItemTypes'),
    excludeItemTypes: any(named: 'excludeItemTypes'),
    sortBy: any(named: 'sortBy'),
    sortOrder: any(named: 'sortOrder'),
    recursive: any(named: 'recursive'),
    limit: any(named: 'limit'),
    fields: any(named: 'fields'),
    enableImageTypes: any(named: 'enableImageTypes'),
    imageTypeLimit: any(named: 'imageTypeLimit'),
  );

  Map<String, dynamic> genres(String serverId, int count) => {
    'Items': [
      for (var i = 0; i < count; i++)
        {
          'Id': '$serverId-genre-$i',
          'Name': '$serverId genre ${i.toString().padLeft(2, '0')}',
          'Type': 'Genre',
          'MovieCount': 3,
        },
    ],
    'TotalRecordCount': count,
  };

  void stubGenres(String serverId, int count) {
    final api = itemsApis[serverId]!;
    when(() => genresCall(api)).thenAnswer((_) async => genres(serverId, count));
    when(() => artworkCall(api)).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': '$serverId-movie', 'Type': 'Movie', 'Name': 'movie'},
        ],
        'TotalRecordCount': 3,
      },
    );
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final authStore = _MockAuthStore();
    final credentials = _MockCredentialStore();
    final factory = _MockClientFactory();
    final session = _MockSessionRepository();
    itemsApis = {};
    final servers = <Server>[];
    for (final id in ['a', 'b']) {
      final client = _MockClient();
      final itemsApi = _MockItemsApi();
      itemsApis[id] = itemsApi;
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => client.imageApi).thenReturn(_MockImageApi());
      when(() => client.serverType).thenReturn(ServerType.jellyfin);
      servers.add(
        Server(
          id: id,
          name: 'Server $id',
          address: 'http://$id',
          version: '10.11.0',
          serverType: ServerType.jellyfin,
          dateAdded: DateTime(2026),
        ),
      );
      when(() => authStore.getUsers(id)).thenReturn([
        PrivateUser(
          id: 'user-$id',
          name: 'user',
          serverId: id,
          accessToken: 'token-$id',
          lastUsed: DateTime(2026),
        ),
      ]);
      when(() => credentials.getToken(id)).thenAnswer((_) async => null);
      when(
        () => factory.getClient(
          serverId: id,
          serverType: ServerType.jellyfin,
          baseUrl: 'http://$id',
        ),
      ).thenReturn(client);
      when(() => factory.getClientIfExists(id)).thenReturn(client);
    }
    when(authStore.getServers).thenReturn(servers);
    when(() => session.activeServerId).thenReturn('a');
    when(() => session.activeUserId).thenReturn('user-a');
    multiServer = MultiServerRepository(
      authStore,
      credentials,
      factory,
      session,
    );
  });

  tearDown(() => GetIt.instance.reset());

  test('a server that fails keeps the other server\'s genres in the row', () async {
    stubGenres('b', 3);
    when(
      () => genresCall(itemsApis['a']!),
    ).thenAnswer((_) async => throw Exception('server a is down'));

    final row = await multiServer.getAggregatedGenres();

    expect(row.items.map((item) => item.serverId).toSet(), {'b'});
    expect(row.items, hasLength(3));
  });

  test('throws when every server fails', () async {
    for (final api in itemsApis.values) {
      when(
        () => genresCall(api),
      ).thenAnswer((_) async => throw Exception('down'));
    }

    await expectLater(multiServer.getAggregatedGenres(), throwsStateError);
  });

  test('a server that never answers keeps the other server\'s genres in the row', () {
    fakeAsync((async) {
      stubGenres('b', 3);
      when(
        () => genresCall(itemsApis['a']!),
      ).thenAnswer((_) => Completer<Map<String, dynamic>>().future);

      HomeRow? row;
      multiServer.getAggregatedGenres().then((value) => row = value);
      async.elapse(const Duration(seconds: 9));

      expect(row, isNotNull);
      expect(row!.items.map((item) => item.serverId).toSet(), {'b'});
    });
  });

  test('only looks up artwork for as many genres as the row can show', () async {
    stubGenres('a', 34);
    stubGenres('b', 2);

    final row = await multiServer.getAggregatedGenres(limit: 15);

    verify(() => artworkCall(itemsApis['a']!)).called(15);
    verify(() => artworkCall(itemsApis['b']!)).called(2);
    expect(row.items, hasLength(15));
    expect(row.totalCount, 36);
  });
}
