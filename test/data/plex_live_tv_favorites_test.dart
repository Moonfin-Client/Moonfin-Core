import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:moonfin/data/services/plex_live_tv_favorites.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/data/viewmodels/search_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:server_plex/server_plex.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(id: 'device', name: 'Test', appName: 'Moonfin', appVersion: '1');
const _channel = <String, dynamic>{
  'Id': 'channel-plex-free123', 'Name': 'Free Channel',
  'Type': 'TvChannel',
  'ImageTags': {'Primary': 'https://example.test/logo.png'},
};
const _source = 'provider://tv.plex.provider.epg';

class _FailingPlexPreferences extends UserPreferences {
  _FailingPlexPreferences(super.store);

  @override
  Future<void> set<T>(Preference<T> pref, T value) async {
    if (pref.key.startsWith('plex_live_tv_favorite_keys_')) {
      throw StateError('Local preference write failed');
    }
    await super.set(pref, value);
  }
}

PlexMediaServerClient _plex({bool cloudOnly = false, String userId = 'plex-user'}) {
  final client = PlexMediaServerClient(
      baseUrl: cloudOnly ? 'https://plex.tv' : 'https://pms.example',
      deviceInfo: _device, cloudOnly: cloudOnly,
    )..userId = userId
     ..accessToken = cloudOnly ? 'cloud-token' : 'pms-token';
  addTearDown(client.dispose);
  return client;
}

bool _saved(MediaServerClient client, String id) =>
    (PlexLiveTvFavorites.applyToItem(client, {
      ..._channel, 'Id': id,
    })['UserData'] as Map)['IsFavorite'] == true;

class _LineupApi extends Mock implements LiveTvApi, DirectChannelGroupApi {}

class _LineupClient extends PlexMediaServerClient {
  _LineupClient(this.liveTvApi, {super.cloudOnly}) : super(baseUrl: 'https://pms.example', deviceInfo: _device);
  @override
  final LiveTvApi liveTvApi;
}

class _Cloud extends Interceptor {
  final requests = <RequestOptions>[];
  List<Map<String, dynamic>> rows = [];
  int? getError, putError;
  Map<String, dynamic>? responseOverride;
  Future<void>? holdGet;
  Future<void>? holdPut;

  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) async {
    requests.add(request);
    final error = request.method == 'GET' ? getError : putError;
    if (error != null) {
      handler.reject(DioException(
        requestOptions: request,
        response: Response(requestOptions: request, statusCode: error),
        type: DioExceptionType.badResponse,
      ));
      return;
    }
    if (request.method == 'GET') {
      final response = Response(requestOptions: request, statusCode: 200,
        data: responseOverride ?? {'MediaContainer': {'FavoriteChannel': [
          for (final row in rows) {...row},
        ]}},
      );
      final pending = holdGet;
      if (pending == null) {
        handler.resolve(response);
      } else {
        unawaited(pending.then((_) => handler.resolve(response)));
      }
    } else {
      rows = [for (final row in request.data as List)
        Map<String, dynamic>.from(row as Map)];
      if (holdPut != null) await holdPut;
      handler.resolve(Response(requestOptions: request, statusCode: 200));
    }
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserPreferences prefs;
  late UserRepository users;
  late _Cloud cloud;
  late Dio http;

  setUp(() async {
    userDataSync.reset();
    PlexLiveTvFavorites.resetForTesting();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    users = UserRepository()..setCurrentUser(PrivateUser(
      id: 'plex-user', name: 'Plex User', serverId: 'plex-cloud',
      accessToken: 'pms-token', plexToken: 'account-token',
      lastUsed: DateTime.utc(2026),
    ));
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<UserRepository>(users);
    cloud = _Cloud();
    http = Dio()..interceptors.add(cloud);
    PlexLiveTvFavorites.testApi = PlexLiveTvFavoritesApi(dio: http);
  });

  tearDown(() async {
    userDataSync.reset();
    PlexLiveTvFavorites.resetForTesting();
    users.dispose();
    http.close();
    await GetIt.instance.reset();
  });

  for (final legacy in [false, true]) {
    test('Cloud and PMS share account favorites with a saved ${legacy ? 'legacy' : 'account'} token', () async {
      if (legacy) users.setCurrentUser(PrivateUser.fromJson('plex-user', 'pms', {'accessToken': 'legacy-owner-token'}));

      final direct = _plex(cloudOnly: true);
      final pms = _plex();

      cloud.rows = [
        {'source': _source, 'id': 'free123', 'title': 'Free Channel'},
        {'source': 'server://other/dvr', 'id': 'channel7', 'thumb': 'keep'},
      ];
      PlexLiveTvFavorites.applyToItem(direct, _channel);
      await PlexLiveTvFavorites.refresh(direct);
      expect(_saved(pms, 'channel-plex-free123'), isTrue);

      await ItemMutationRepository(pms).setFavorite('channel-plex-free123', isFavorite: false);
      expect(cloud.rows.single, containsPair('thumb', 'keep'));
      expect(_saved(direct, 'channel-plex-free123'), isFalse);

      await ItemMutationRepository(direct).setFavorite('channel-plex-free123', isFavorite: true);
      expect(_saved(pms, 'channel-plex-free123'), isTrue);
      expect(cloud.rows.last, containsPair('source', _source));
      expect(cloud.requests.map((r) => r.headers['X-Plex-Token']), everyElement(legacy ? 'legacy-owner-token' : 'account-token'));
      expect(cloud.requests.where((r) => r.method == 'PUT'), hasLength(2));
    });
  }

  test('cloud replaces older local favorites without uploading them', () async {
    final direct = _plex(cloudOnly: true);
    await prefs.set(Preference<List<String>>(
      key: 'plex_live_tv_favorite_keys_plex-user', defaultValue: [],
    ), ['provider://tv.plex.provider.epg\u0000free123']);
    PlexLiveTvFavorites.applyToItem(direct, _channel);
    expect(_saved(direct, 'channel-plex-free123'), isTrue);

    cloud.rows = [{'source': 'server://other/dvr', 'id': 'different'}];
    await PlexLiveTvFavorites.refresh(direct);
    expect(_saved(direct, 'channel-plex-free123'), isFalse);
    expect(cloud.rows.single['id'], 'different');
    expect(cloud.requests.where((r) => r.method == 'PUT'), isEmpty);

    cloud.getError = 503;
    await expectLater(PlexLiveTvFavorites.refresh(direct), throwsA(isA<DioException>()));
    expect(_saved(direct, 'channel-plex-free123'), isFalse);
    cloud.getError = null;
    cloud.responseOverride = {'MediaContainer': {'size': 2, 'FavoriteChannel': []}};
    final mutations = ItemMutationRepository(direct);
    Future<void> save() => mutations.setFavorite('channel-plex-free123', isFavorite: true);
    await expectLater(save(), throwsFormatException);
    expect(cloud.requests.where((r) => r.method == 'PUT'), isEmpty);
    cloud.responseOverride = null;
    cloud.putError = 403;
    await expectLater(save(), throwsA(isA<DioException>()));
    expect(_saved(direct, 'channel-plex-free123'), isFalse);
    expect(cloud.rows.single['id'], 'different');
  });

  test('an incomplete favorites list keeps the saved heart and a valid empty list clears it', () async {
    final client = _plex();
    cloud.rows = [{'source': _source, 'id': 'free123'}];
    await PlexLiveTvFavorites.refresh(client);
    cloud.rows = [{'id': 'free123'}];
    await expectLater(PlexLiveTvFavorites.refresh(client), throwsFormatException);
    expect(_saved(client, 'channel-plex-free123'), isTrue);
    cloud.rows.clear();
    await PlexLiveTvFavorites.refresh(client);
    expect(_saved(client, 'channel-plex-free123'), isFalse);
  });

  test('Search updates a visible favorite in a 2,001-channel Plex lineup', () async {
    final api = _LineupApi();
    final client = _LineupClient(api, cloudOnly: true)..userId = 'plex-user';
    addTearDown(client.dispose);
    when(() => api.getChannels(fields: 'ImageTags', enableTotalRecordCount: false, userId: 'plex-user'))
        .thenAnswer((_) async => {'Items': [
          _channel,
          for (var i = 0; i < 2000; i++) {'Id': 'channel-plex-$i', 'Type': 'TvChannel', 'Name': 'Other'},
        ]});
    final reply = Completer<void>();
    cloud.holdGet = reply.future;
    cloud.rows = [{'source': _source, 'id': 'free123'}];
    final model = SearchViewModel(SearchRepository(client), client);
    addTearDown(model.dispose);
    model.searchImmediate('Free Channel');
    await pumpEventQueue();
    expect(model.results.single.items.single.isFavorite, isFalse);
    reply.complete();
    await pumpEventQueue();
    expect(model.results.single.items.single.isFavorite, isTrue);
  });

  group('two DVRs with channel 4', () {
    late PlexMediaServerClient first, second;
    late Map<String, dynamic> a, b;
    const id = 'channel-2-4', sourceA = 'server://pms-a/epg', sourceB = 'server://pms-b/epg';
    setUp(() {
      first = _plex();
      second = _plex()..baseUrl = 'https://second-pms.example';
      Map<String, dynamic> station(PlexMediaServerClient client, String source) =>
          PlexLiveTvFavorites.applyToItem(client, {
            'Id': id, 'Type': 'TvChannel', 'Name': 'CBC', 'ChannelNumber': '4',
            'PlexFavoriteSource': source, 'PlexFavoriteId': '4',
            'ImageTags': {'Primary': 'http://pms.example/cbc.png'},
          });
      a = station(first, sourceA);
      b = station(second, sourceB);
    });

    test('favorite changes affect only the selected provider in the guide and on Home', () async {
      expect(a['PlexFavoriteSyncKey'], isNot(b['PlexFavoriteSyncKey']));
      await Future.wait([
        for (final client in [first, second]) ItemMutationRepository(client).setFavorite(id, isFavorite: true),
      ]);
      expect(cloud.rows.map((r) => r['source']), unorderedEquals([sourceA, sourceB]));
      expect(cloud.rows.every((r) => r['thumb'] == 'http://pms.example/cbc.png'), isTrue);
      await ItemMutationRepository(first).setFavorite(id, isFavorite: false);
      expect(cloud.rows.single['source'], sourceB);
      expect(GuideChannel.fromRawItem(a).withSyncedUserData().isFavorite, isFalse);
      expect(GuideChannel.fromRawItem(b).withSyncedUserData().isFavorite, isTrue);
      userDataSync.publish(id, {'IsFavorite': false});
      bool onHome(String server, Map<String, dynamic> row) =>
          userDataSync.apply(AggregatedItem(id: id, serverId: server, rawData: row)).isFavorite;
      expect(onHome('a', a), isFalse);
      expect(onHome('b', b), isTrue);
    });

    test('browsing another DVR picks up remote edits from the shared account cache', () async {
      final key = b['PlexFavoriteSyncKey'] as String;
      expect(userDataSync.favoriteFor(key), isNull);
      for (final saved in [true, false]) {
        cloud.rows = [if (saved) {'source': sourceB, 'id': '4'}];
        await PlexLiveTvFavorites.refresh(first);
        expect(await PlexLiveTvFavorites.refreshForBrowse(second), isTrue);
        expect(userDataSync.favoriteFor(key), saved);
        expect(cloud.requests.where((r) => r.method == 'GET'), hasLength(saved ? 1 : 2));
      }
    });
  });

  for (final pending in ['GET', 'PUT']) {
    test('session reset stops a favorite save waiting on $pending', () async {
      final client = _plex();
      final gate = Completer<void>();
      if (pending == 'GET') cloud.holdGet = gate.future;
      if (pending == 'PUT') cloud.holdPut = gate.future;
      final id = _channel['Id'] as String;
      PlexLiveTvFavorites.applyToItem(client, _channel);
      final save = ItemMutationRepository(client).setFavorite(id, isFavorite: true);
      await pumpEventQueue();
      expect(cloud.requests.last.method, pending);
      userDataSync.reset();
      gate.complete();
      await save;
      expect(cloud.requests.where((r) => r.method == 'PUT'), hasLength(pending == 'PUT' ? 1 : 0));
      expect(PlexLiveTvFavorites.favoriteListChanged.value, isNull);
      expect(_saved(client, id), isFalse);
    });
  }

  test('saving a Free TV favorite by ID succeeds even when the local cache write fails', () async {
    final client = _plex();
    await GetIt.instance.unregister<UserPreferences>();
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(
      _FailingPlexPreferences(store),
    );

    await ItemMutationRepository(client).setFavorite(
      'channel-plex-free123',
      isFavorite: true,
    );
    expect(cloud.requests.where((r) => r.method == 'PUT'), hasLength(1));
    expect(cloud.rows.single['id'], 'free123');
    expect(
      userDataSync.favoriteFor(PlexLiveTvFavorites.syncKey(
        client, 'channel-plex-free123')),
      isTrue,
    );
    // A failed cache write shouldn't make the cloud data look fresh.
    expect(await PlexLiveTvFavorites.refreshForBrowse(client), isFalse);
    expect(cloud.requests.where((r) => r.method == 'GET'), hasLength(2));
  });

  for (final partial in [false, true]) {
    test('a missing DVR channel during a favorite save (partial: $partial)', () async {
      final api = _LineupApi();
      final client = _LineupClient(api)..userId = 'plex-user'..accessToken = 'pms-token';
      addTearDown(client.dispose);
      when(() => api.getChannelGroups(userId: 'plex-user'))
          .thenAnswer((_) async => ChannelGroupLineup({}, channels: [], partial: partial));
      final guide = LiveTvGuideViewModel(client);
      addTearDown(guide.dispose);
      const id = 'channel-2-4';
      PlexLiveTvFavorites.applyToItem(client, {
        'Id': id, 'Type': 'TvChannel', 'PlexFavoriteSource': 'server://pms/epg', 'PlexFavoriteId': '4',
      });

      final gate = Completer<void>();
      cloud.holdGet = gate.future;
      final save = PlexLiveTvFavorites.setFavorite(client, id, isFavorite: true);
      await pumpEventQueue();
      expect(cloud.requests.single.method, 'GET');
      await guide.load();
      expect(guide.error, isNull);
      gate.complete();
      await expectLater(save, partial ? completes : throwsStateError);
      expect(cloud.requests.where((r) => r.method == 'PUT'), hasLength(partial ? 1 : 0));
    });
  }

  group('DVR favorite identity', () {
    const id = 'channel-2-4';
    late PlexMediaServerClient client;
    late ItemMutationRepository mutations;
    setUp(() {
      client = _plex();
      mutations = ItemMutationRepository(client);
    });
    Map<String, dynamic> publish(String? provider, {String favoriteId = '4'}) =>
        PlexLiveTvFavorites.applyToItem(client, {
          'Id': id, 'Type': 'TvChannel',
          if (provider != null) ...{'PlexFavoriteSource': provider, 'PlexFavoriteId': favoriteId},
        });
    Future<void> favorite() => PlexLiveTvFavorites.setFavorite(client, id, isFavorite: true);

    test('reassignment is checked at queue time and against the selected row', () async {
      final old = publish('server://old/epg');
      final queued = mutations.setFavorite(id, isFavorite: true);
      publish('server://old/epg', favoriteId: 'replacement');
      await expectLater(queued, throwsStateError);
      final current = publish('server://new/epg');
      Future<void> select(Map<String, dynamic> row) => mutations.setFavorite(
        id, isFavorite: true, isChannel: true, expectedChannelKey: channelFavoriteKey(row),
      );
      await expectLater(select(old), throwsStateError);
      expect(cloud.requests, isEmpty);
      await select(current);
      expect(cloud.rows.single['source'], 'server://new/epg');
    });

    for (final replacement in ['server://new/epg', null]) {
      test('a pending favorite cannot cross a provider change to $replacement', () async {
        publish('server://old/epg');
        expect(PlexLiveTvFavorites.syncKey(client, id), contains('old/epg'));
        final gate = Completer<void>();
        cloud.holdGet = gate.future;
        final refresh = replacement == null ? null : PlexLiveTvFavorites.refresh(client);
        final rejected = expectLater(favorite(), throwsStateError);
        await pumpEventQueue();
        expect(cloud.requests.single.method, 'GET');
        final updated = publish(replacement);
        gate.complete();
        await refresh;
        await rejected;
        if (replacement == null) {
          expect(updated['PlexFavoriteSyncKey'], isNot(contains('old/epg')));
          await expectLater(favorite(), throwsStateError);
        }
        expect(cloud.requests.map((r) => r.method), ['GET']);
      });
    }
  });

  test('serializes separate channel updates and rejects a different Home user', () async {
    final pms = _plex();
    PlexLiveTvFavorites.applyToItem(pms, _channel);
    PlexLiveTvFavorites.applyToItem(pms, {..._channel, 'Id': 'channel-plex-extra'});
    await PlexLiveTvFavorites.refresh(pms);
    await Future.wait([
      ItemMutationRepository(pms).setFavorite('channel-plex-free123', isFavorite: true),
      ItemMutationRepository(pms).setFavorite('channel-plex-extra', isFavorite: true),
    ]);
    expect(cloud.rows.map((row) => row['id']).toSet(), {'free123', 'extra'});

    users.setCurrentUser(PrivateUser(
      id: 'other-user', name: 'Other', serverId: 'plex-cloud',
      accessToken: 'other-pms', plexToken: 'other-cloud',
      lastUsed: DateTime.utc(2026),
    ));
    final requests = cloud.requests.length;
    await expectLater(PlexLiveTvFavorites.refresh(pms), throwsA(isA<StateError>()));
    expect(cloud.requests, hasLength(requests));
  });
}
