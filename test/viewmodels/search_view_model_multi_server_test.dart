import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/auth/store/authentication_store.dart';
import 'package:moonfin/auth/store/credential_store.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
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
  late Map<String, _MockClient> clients;
  late Map<String, _MockItemsApi> itemsApis;
  late MultiServerRepository multiServer;

  Future<Map<String, dynamic>> itemsSearch(_MockItemsApi api) => api.getItems(
    searchTerm: any(named: 'searchTerm'),
    parentId: any(named: 'parentId'),
    includeItemTypes: any(named: 'includeItemTypes'),
    limit: any(named: 'limit'),
    recursive: any(named: 'recursive'),
    fields: any(named: 'fields'),
    studios: any(named: 'studios'),
  );

  Map<String, dynamic> movies(List<String> ids) => {
    'Items': [
      for (final id in ids) {'Id': id, 'Type': 'Movie', 'Name': id},
    ],
  };

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final authStore = _MockAuthStore();
    final credentials = _MockCredentialStore();
    final factory = _MockClientFactory();
    final session = _MockSessionRepository();
    clients = {};
    itemsApis = {};
    final servers = <Server>[];
    for (final id in ['a', 'b']) {
      final client = _MockClient();
      final itemsApi = _MockItemsApi();
      clients[id] = client;
      itemsApis[id] = itemsApi;
      when(() => client.itemsApi).thenReturn(itemsApi);
      when(() => client.imageApi).thenReturn(_MockImageApi());
      when(() => client.gamesApi).thenReturn(null);
      when(() => itemsApi.getPersons(
        searchTerm: any(named: 'searchTerm'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
      )).thenAnswer((_) async => {'Items': []});
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

  Future<SearchViewModel> search({
    MultiServerRepository? across,
    String query = 'alien',
  }) async {
    final vm = SearchViewModel(
      SearchRepository(clients['a']!),
      clients['a']!,
      multiServerRepository: across,
    );
    addTearDown(vm.dispose);
    vm.searchImmediate(query);
    while (vm.state == SearchState.loading) {
      await pumpEventQueue();
    }
    return vm;
  }

  List<(String, String)> movieResults(SearchViewModel vm) => [
    for (final item in vm.results.single.items) (item.id, item.serverId),
  ];

  test(
    'program search keeps the episode name from the server response',
    () async {
      when(() => itemsSearch(itemsApis['a']!)).thenAnswer(
        (_) async => {
          'Items': [
            {
              'Id': 'p1',
              'Type': 'Program',
              'Name': 'College Football',
              'EpisodeTitle': 'South Alabama at Kentucky',
              'ChannelId': 'c1',
            },
          ],
        },
      );
      final vm = await search(query: 'Kentucky');
      final item = vm.results.single.items.single;
      expect(vm.results.single.itemTypes, ['Program']);
      expect(item.name, 'College Football');
      expect(item.subtitle, 'South Alabama at Kentucky');
      expect(item.channelId, 'c1');
    },
  );

  test('results come from every signed-in server, taking turns', () async {
    when(() => itemsSearch(itemsApis['a']!))
        .thenAnswer((_) async => movies(['a1', 'a2']));
    when(() => itemsSearch(itemsApis['b']!))
        .thenAnswer((_) async => movies(['b1']));

    final vm = await search(across: multiServer);

    expect(movieResults(vm), [('a1', 'a'), ('b1', 'b'), ('a2', 'a')]);
    final fromB = vm.results.single.items[1];
    expect(vm.imageApiFor(fromB), clients['b']!.imageApi);
    expect(vm.serverNameFor(fromB), 'Server b');
  });

  test('a server that fails leaves the others to answer', () async {
    when(() => itemsSearch(itemsApis['a']!))
        .thenAnswer((_) async => movies(['a1']));
    when(() => itemsSearch(itemsApis['b']!)).thenThrow(Exception('offline'));

    final vm = await search(across: multiServer);

    expect(vm.state, SearchState.ready);
    expect(movieResults(vm), [('a1', 'a')]);
  });

  test('with multi-server search off only the active server is searched', () async {
    when(() => itemsSearch(itemsApis['a']!))
        .thenAnswer((_) async => movies(['a1']));

    final vm = await search();

    verifyNever(() => itemsSearch(itemsApis['b']!));
    expect(vm.serverNameFor(vm.results.single.items.single), isNull);
  });
}
