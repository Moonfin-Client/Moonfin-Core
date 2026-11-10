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
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/preference_constants.dart';
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

  Future<Map<String, dynamic>> itemsCall(_MockItemsApi api) => api.getItems(
    includeItemTypes: any(named: 'includeItemTypes'),
    sortBy: any(named: 'sortBy'),
    sortOrder: any(named: 'sortOrder'),
    recursive: any(named: 'recursive'),
    startIndex: any(named: 'startIndex'),
    limit: any(named: 'limit'),
    isFavorite: any(named: 'isFavorite'),
    fields: any(named: 'fields'),
    enableImageTypes: any(named: 'enableImageTypes'),
    imageTypeLimit: any(named: 'imageTypeLimit'),
  );

  // Each server answers already sorted by name, the way a server would for
  // the 'SortName' tie-break, so only the merge decides the final order.
  void stubItems(
    String serverId,
    String type,
    List<(String, String?)> items, {
    int? total,
  }) {
    when(() => itemsCall(itemsApis[serverId]!)).thenAnswer(
      (_) async => {
        'Items': [
          for (final (name, date) in items)
            {
              'Id': '$serverId-$name',
              'Name': name,
              'Type': type,
              if (date != null) 'DateCreated': '${date}T00:00:00.0000000Z',
              if (date != null) 'PremiereDate': '${date}T00:00:00.0000000Z',
              'ChildCount': 3,
              'RecursiveItemCount': 3,
            },
        ],
        'TotalRecordCount': total ?? items.length,
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

  group('merged rows keep the sort the row asked for', () {
    setUp(() {
      stubItems('a', 'BoxSet', [
        ('Alien', '2020-01-01'),
        ('Zodiac', '2024-01-01'),
      ]);
      stubItems('b', 'BoxSet', [
        ('Batman', '2022-01-01'),
        ('Yojimbo', '2018-01-01'),
      ]);
    });

    test('Date Added, newest first', () async {
      final row = await multiServer.getAggregatedCollections(
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Descending',
      );

      expect(row.items.map((item) => item.name), [
        'Zodiac',
        'Batman',
        'Alien',
        'Yojimbo',
      ]);
    });

    test('Premiere Date, oldest first', () async {
      final row = await multiServer.getAggregatedCollections(
        sortBy: 'PremiereDate,SortName',
        sortOrder: 'Ascending',
      );

      expect(row.items.map((item) => item.name), [
        'Yojimbo',
        'Alien',
        'Batman',
        'Zodiac',
      ]);
    });

    // The server counts a missing value as the lowest, so it trails when the
    // newest come first and leads when the oldest do.
    test('items without a date go last when newest comes first', () async {
      stubItems('a', 'BoxSet', [('Alien', '2020-01-01'), ('Undated', null)]);

      final row = await multiServer.getAggregatedCollections(
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Descending',
      );

      expect(row.items.map((item) => item.name), [
        'Batman',
        'Alien',
        'Yojimbo',
        'Undated',
      ]);
    });

    test('items without a date go first when oldest comes first', () async {
      stubItems('a', 'BoxSet', [('Alien', '2020-01-01'), ('Undated', null)]);

      final row = await multiServer.getAggregatedCollections(
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Ascending',
      );

      expect(row.items.map((item) => item.name), [
        'Undated',
        'Yojimbo',
        'Alien',
        'Batman',
      ]);
    });

    test('items with the same date fall back to name order', () async {
      stubItems('a', 'BoxSet', [('Zodiac', '2020-01-01')]);
      stubItems('b', 'BoxSet', [('Alien', '2020-01-01')]);

      final ascending = await multiServer.getAggregatedCollections(
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Ascending',
      );
      final descending = await multiServer.getAggregatedCollections(
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Descending',
      );

      expect(ascending.items.map((item) => item.name), ['Alien', 'Zodiac']);
      expect(descending.items.map((item) => item.name), ['Zodiac', 'Alien']);
    });

    test('Name still sorts by name', () async {
      final row = await multiServer.getAggregatedCollections(
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      );

      expect(row.items.map((item) => item.name), [
        'Alien',
        'Batman',
        'Yojimbo',
        'Zodiac',
      ]);
    });
  });

  test('playlist rows keep the sort too', () async {
    stubItems('a', 'Playlist', [
      ('Chill', '2019-01-01'),
      ('Workout', '2025-01-01'),
    ]);
    stubItems('b', 'Playlist', [
      ('Focus', '2023-01-01'),
      ('Party', '2017-01-01'),
    ]);

    final row = await multiServer.getAggregatedPlaylists(
      sortBy: 'DateCreated,SortName',
      sortOrder: 'Descending',
    );

    expect(row.items.map((item) => item.name), [
      'Workout',
      'Focus',
      'Chill',
      'Party',
    ]);
  });

  test('loading more playlists keeps the sort', () async {
    final prefs = GetIt.instance<UserPreferences>();
    await prefs.set(
      UserPreferences.playlistsRowSortBy,
      LibrarySortBy.dateAdded,
    );
    await prefs.set(
      UserPreferences.playlistsRowSortOrder,
      SortDirection.descending,
    );
    stubItems('a', 'Playlist', [('Chill', '2019-01-01')], total: 30);
    stubItems('b', 'Playlist', [('Focus', '2023-01-01')], total: 30);
    final firstPage = await multiServer.getAggregatedPlaylists(
      sortBy: 'DateCreated,SortName',
      sortOrder: 'Descending',
    );

    stubItems('a', 'Playlist', [('Workout', '2025-01-01')], total: 30);
    stubItems('b', 'Playlist', [('Party', '2017-01-01')], total: 30);
    final (items, _) = await multiServer.loadMore(row: firstPage);

    expect(items.map((item) => item.name), [
      'Workout',
      'Focus',
      'Chill',
      'Party',
    ]);
  });
}
