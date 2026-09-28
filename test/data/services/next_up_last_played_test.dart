import 'dart:async';

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
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockAuthStore extends Mock implements AuthenticationStore {}

class _MockCredentialStore extends Mock implements CredentialStore {}

class _MockClientFactory extends Mock implements MediaServerClientFactory {}

class _MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockItemsApi itemsApi;
  late _MockClient client;
  late Completer<Map<String, dynamic>> nextUp;
  late Map<String, dynamic> Function() recentPlays;
  late List<Object?> seriesLookups;
  late int recentPlaysAsks;

  const lastNight = '2026-09-26T21:00:00.0000000Z';
  const lastWeek = '2026-09-20T21:00:00.0000000Z';
  const addedToday = '2026-09-27T09:00:00.0000000Z';
  const addedLastYear = '2025-09-27T09:00:00.0000000Z';

  Map<String, dynamic> episode(String seriesId, String dateCreated) => {
    'Id': 'ep-$seriesId',
    'Type': 'Episode',
    'SeriesId': seriesId,
    'DateCreated': dateCreated,
    'UserData': {'Played': false},
  };

  Map<String, dynamic> played(String seriesId, String lastPlayed) => {
    'Id': 'played-$seriesId',
    'SeriesId': seriesId,
    'UserData': {'LastPlayedDate': lastPlayed},
  };

  Future<Map<String, dynamic>> callNextUp() => itemsApi.getNextUp(
    parentId: any(named: 'parentId'),
    startIndex: any(named: 'startIndex'),
    limit: any(named: 'limit'),
    fields: any(named: 'fields'),
    enableImageTypes: any(named: 'enableImageTypes'),
    imageTypeLimit: any(named: 'imageTypeLimit'),
    enableResumable: any(named: 'enableResumable'),
    nextUpDateCutoff: any(named: 'nextUpDateCutoff'),
  );

  Future<Map<String, dynamic>> callItems() => itemsApi.getItems(
    ids: any(named: 'ids'),
    includeItemTypes: any(named: 'includeItemTypes'),
    filters: any(named: 'filters'),
    recursive: any(named: 'recursive'),
    sortBy: any(named: 'sortBy'),
    sortOrder: any(named: 'sortOrder'),
    limit: any(named: 'limit'),
    fields: any(named: 'fields'),
  );

  bool isRecentPlaysLookup(Invocation call) =>
      (call.namedArguments[#filters] as List?)?.contains('IsPlayed') ?? false;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    itemsApi = _MockItemsApi();
    client = _MockClient();
    when(() => client.itemsApi).thenReturn(itemsApi);

    nextUp = Completer();
    recentPlays = () => {
      'Items': [played('s-recent', lastNight)],
    };
    seriesLookups = [];
    recentPlaysAsks = 0;
    when(callNextUp).thenAnswer((_) => nextUp.future);
    when(callItems).thenAnswer((call) async {
      if (isRecentPlaysLookup(call)) {
        recentPlaysAsks++;
        return recentPlays();
      }
      seriesLookups.add(call.namedArguments[#ids]);
      return {
        'Items': [
          {
            'Id': 's-old',
            'UserData': {'LastPlayedDate': lastWeek},
          },
        ],
      };
    });
  });

  tearDown(() => GetIt.instance.reset());

  DateTime? sortDateOf(HomeRow row, String seriesId) {
    final item = row.items.firstWhere(
      (item) => item.rawData['SeriesId'] == seriesId,
    );
    final date = item.rawData['UserData']['LastPlayedDate'] as String?;
    return date == null ? null : DateTime.parse(date);
  }

  test('an episode sorts by when its series was last played', () async {
    nextUp.complete({
      'Items': [episode('s-recent', addedLastYear)],
    });

    final row = await RowDataSource(client).loadNextUp('server');

    expect(sortDateOf(row, 's-recent'), DateTime.parse(lastNight));
    expect(seriesLookups, isEmpty);
  });

  test('an episode added after the last play sorts by when it was added',
      () async {
    nextUp.complete({
      'Items': [episode('s-recent', addedToday)],
    });

    final row = await RowDataSource(client).loadNextUp('server');

    expect(sortDateOf(row, 's-recent'), DateTime.parse(addedToday));
  });

  test('a series outside the recent plays is looked up on its own', () async {
    nextUp.complete({
      'Items': [
        episode('s-recent', addedLastYear),
        episode('s-old', addedLastYear),
      ],
    });

    final row = await RowDataSource(client).loadNextUp('server');

    expect(seriesLookups, [
      ['s-old'],
    ]);
    expect(sortDateOf(row, 's-old'), DateTime.parse(lastWeek));
  });

  test('a failed lookup leaves the episodes as the server sent them', () async {
    recentPlays = () => throw Exception('server went away');
    nextUp.complete({
      'Items': [episode('s-recent', addedLastYear)],
    });

    final row = await RowDataSource(client).loadNextUp('server');

    expect(sortDateOf(row, 's-recent'), isNull);
    expect(seriesLookups, isEmpty);
  });

  test('the recent plays go out while Next Up is still on its way', () async {
    final loading = RowDataSource(client).loadNextUp('server');
    await pumpEventQueue();

    expect(recentPlaysAsks, 1);

    nextUp.complete({'Items': <dynamic>[]});
    await loading;
  });

  test('a Next Up that fails leaves no stray error behind', () async {
    recentPlays = () => throw Exception('server went away');
    nextUp.completeError(Exception('next up failed'));

    await expectLater(
      RowDataSource(client).loadNextUp('server'),
      throwsException,
    );
    await pumpEventQueue();
  });

  test('a library Next Up row sorts the same way', () async {
    nextUp.complete({
      'Items': [episode('s-recent', addedLastYear)],
    });

    final row = await RowDataSource(client).loadLibraryNextUp('lib', 'server');

    expect(sortDateOf(row, 's-recent'), DateTime.parse(lastNight));
  });

  test('a multi-server home sends each lookup alongside its Next Up', () async {
    final authStore = _MockAuthStore();
    final sessionRepo = _MockSessionRepository();
    final clientFactory = _MockClientFactory();
    when(authStore.getServers).thenReturn([
      Server(
        id: 'srv',
        name: 'Home',
        address: 'http://server',
        version: '10.11.0',
        serverType: ServerType.jellyfin,
        dateAdded: DateTime(2026),
      ),
    ]);
    when(() => authStore.getUsers('srv')).thenReturn([
      PrivateUser(
        id: 'user',
        name: 'user',
        serverId: 'srv',
        accessToken: 'token',
        lastUsed: DateTime(2026),
      ),
    ]);
    when(() => sessionRepo.activeServerId).thenReturn('srv');
    when(() => sessionRepo.activeUserId).thenReturn('user');
    when(
      () => clientFactory.getClient(
        serverId: 'srv',
        serverType: ServerType.jellyfin,
        baseUrl: 'http://server',
      ),
    ).thenReturn(client);

    final loading = MultiServerRepository(
      authStore,
      _MockCredentialStore(),
      clientFactory,
      sessionRepo,
    ).getAggregatedNextUp();
    await pumpEventQueue();

    expect(recentPlaysAsks, 1);

    nextUp.complete({
      'Items': [episode('s-recent', addedLastYear)],
    });
    final row = await loading;

    expect(sortDateOf(row, 's-recent'), DateTime.parse(lastNight));
  });
}
