import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _UserLibraryApi extends Mock implements UserLibraryApi {}

class _PluginSyncService extends Mock implements PluginSyncService {}

/// A server holding one season of three episodes. Marking the season played
/// marks every episode, the way Jellyfin does, and no socket message follows.
class _ItemsApi extends Fake implements ItemsApi {
  final userData = <String, Map<String, dynamic>>{
    'season-1': {'Played': false},
    'ep-1': {'Played': true},
    'ep-2': {
      'Played': false,
      'PlaybackPositionTicks': 400,
      'PlayedPercentage': 40,
    },
    'ep-3': {'Played': false},
  };

  /// Holds back the answer to the next user data read until completed.
  Completer<void>? nextReadGate;

  void markSeasonPlayed() {
    for (final id in userData.keys) {
      userData[id] = {'Played': true, 'PlaybackPositionTicks': 0};
    }
  }

  /// Jellyfin leaves out the percentage once there is no resume point.
  void markSeasonUnplayed() {
    for (final id in userData.keys) {
      userData[id] = {'Played': false, 'PlaybackPositionTicks': 0};
    }
  }

  Map<String, dynamic> _episode(String id, int number) => {
    'Id': id,
    'Name': id,
    'Type': 'Episode',
    'SeriesId': 'series-1',
    'SeasonId': 'season-1',
    'IndexNumber': number,
    'UserData': userData[id],
  };

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) async => {
    'Id': itemId,
    'Name': 'Season 1',
    'Type': 'Season',
    'SeriesId': 'series-1',
    'UserData': userData[itemId],
  };

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final named = invocation.namedArguments;
    if (invocation.memberName == #getEpisodes) {
      final items = [
        _episode('ep-1', 1),
        _episode('ep-2', 2),
        _episode('ep-3', 3),
      ];
      return Future.value({'Items': items, 'TotalRecordCount': items.length});
    }
    if (invocation.memberName == #getItems && named[#fields] == 'UserData') {
      final ids = named[#ids] as List<String>? ?? const [];
      // Read when asked, answered when the gate opens.
      final items = [
        for (final id in ids)
          if (userData.containsKey(id)) {'Id': id, 'UserData': userData[id]},
      ];
      final answer = {'Items': items, 'TotalRecordCount': items.length};
      final gate = nextReadGate;
      nextReadGate = null;
      return gate == null
          ? Future.value(answer)
          : gate.future.then((_) => answer);
    }
    if (invocation.memberName == #getItems) {
      return Future.value({'Items': const [], 'TotalRecordCount': 0});
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late _UserLibraryApi userLibraryApi;

  setUp(() async {
    await GetIt.instance.reset();
    userDataSync.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
    client = _Client();
    itemsApi = _ItemsApi();
    userLibraryApi = _UserLibraryApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.userLibraryApi).thenReturn(userLibraryApi);
    when(() => client.baseUrl).thenReturn('http://server');
    when(() => userLibraryApi.markPlayed(any())).thenAnswer((_) async {
      itemsApi.markSeasonPlayed();
    });
    when(() => userLibraryApi.unmarkPlayed(any())).thenAnswer((_) async {
      itemsApi.markSeasonUnplayed();
    });
  });

  ItemDetailViewModel seasonPage() {
    final tmdbRepository = TmdbRepository(client);
    return ItemDetailViewModel(
      itemId: 'season-1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdbRepository),
      tmdbRepository: tmdbRepository,
    );
  }

  tearDown(() {
    userDataSync.reset();
    return GetIt.instance.reset();
  });

  test('marking a season played shows its episodes played without waiting '
      'for the socket', () async {
    final vm = seasonPage();
    await vm.load();
    await pumpEventQueue();
    expect(vm.episodes.map((e) => e.id), ['ep-1', 'ep-2', 'ep-3']);
    expect(vm.episodes.every((e) => e.isPlayed), isFalse);

    await vm.togglePlayed();

    expect(vm.item?.isPlayed, isTrue);
    expect(vm.episodes.every((e) => e.isPlayed), isTrue);
    expect(vm.episodes[1].playbackPositionTicks, 0);
  });

  test('marking a season unplayed drops the resume point its play button '
      'and up next card read', () async {
    itemsApi.userData['season-1'] = {'Played': true};
    final vm = seasonPage();
    await vm.load();
    await pumpEventQueue();
    expect(vm.item?.isPlayed, isTrue);
    expect(vm.episodes[1].playedPercentage, 40);

    await vm.togglePlayed();

    expect(vm.item?.isPlayed, isFalse);
    // What the season decides Play against Resume, and its up next bar, by.
    for (final episode in vm.episodes) {
      expect(episode.isPlayed, isFalse, reason: episode.id);
      expect(episode.playedPercentage, isNull, reason: episode.id);
      expect(episode.playbackPositionTicks, 0, reason: episode.id);
    }
  });

  test('a read already out when the season is marked played is followed by '
      'another', () async {
    final vm = seasonPage();
    await vm.load();
    await pumpEventQueue();
    // Something on the page changed, so a pass reads the episodes back, and
    // its answer is slow to arrive.
    userDataSync.publish('ep-3', {'IsFavorite': true});
    final gate = itemsApi.nextReadGate = Completer<void>();
    final earlierPass = vm.syncUserDataIfStale();
    expect(itemsApi.nextReadGate, isNull, reason: 'the read is out');

    final toggle = vm.togglePlayed();
    await pumpEventQueue();
    // The answer read before the toggle lands after it.
    gate.complete();
    await Future.wait([earlierPass, toggle]);
    await pumpEventQueue();

    expect(vm.item?.isPlayed, isTrue);
    for (final episode in vm.episodes) {
      expect(episode.isPlayed, isTrue, reason: episode.id);
    }
  });

  test('every caller waiting on a pass also waits for the one that follows '
      'it', () async {
    final vm = seasonPage();
    await vm.load();
    await pumpEventQueue();
    userDataSync.publish('ep-3', {'IsFavorite': true});
    final gate = itemsApi.nextReadGate = Completer<void>();
    final earlierPass = vm.syncUserDataIfStale();
    expect(itemsApi.nextReadGate, isNull, reason: 'the read is out');

    // Two callers queue up behind the pass, after the page was invalidated.
    var toggleDone = false;
    var syncDone = false;
    final toggle = vm.togglePlayed().whenComplete(() => toggleDone = true);
    await pumpEventQueue();
    final sync = vm.syncUserDataIfStale().whenComplete(() => syncDone = true);

    final followUpGate = itemsApi.nextReadGate = Completer<void>();
    gate.complete();
    await earlierPass;
    await pumpEventQueue();
    expect(itemsApi.nextReadGate, isNull, reason: 'the follow-up read is out');
    expect(toggleDone, isFalse);
    expect(syncDone, isFalse);

    followUpGate.complete();
    await Future.wait([toggle, sync]);

    expect(vm.item?.isPlayed, isTrue);
    for (final episode in vm.episodes) {
      expect(episode.isPlayed, isTrue, reason: episode.id);
    }
  });
}
