import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/blocked_content_gate.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/utils/blocked_ratings.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _PluginSyncService extends Mock implements PluginSyncService {}

/// Holds each item request open until the test answers it, so the page can be
/// looked at while the full item is still on its way.
class _ItemsApi extends Fake implements ItemsApi {
  final pending = <String, Completer<Map<String, dynamic>>>{};
  final ancestorsAskedFor = <String>[];

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) => (pending[itemId] = Completer<Map<String, dynamic>>()).future;

  @override
  Future<List<Map<String, dynamic>>> getAncestors(String itemId) async {
    ancestorsAskedFor.add(itemId);
    return const [];
  }
}

AggregatedItem _card(Map<String, dynamic> raw) =>
    AggregatedItem(id: raw['Id'] as String, serverId: 'srv1', rawData: raw);

const _movie = {'Id': 'movie-1', 'Name': 'A movie', 'Type': 'Movie'};
const _episode = {
  'Id': 'ep-1',
  'Name': 'An episode',
  'Type': 'Episode',
  'SeriesId': 'series-1',
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _Client client;
  late _ItemsApi itemsApi;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    userDataSync.reset();
    resetParentalFilterCache();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    final pluginSync = _PluginSyncService();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
    client = _Client();
    itemsApi = _ItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://server');
    GetIt.instance.registerSingleton<BlockedContentGate>(
      BlockedContentGate(client, prefs),
    );
    await prefs.set(UserPreferences.blockedParentalRatings, 'TV-MA');
  });

  tearDown(() async {
    userDataSync.reset();
    resetParentalFilterCache();
    await GetIt.instance.reset();
  });

  ItemDetailViewModel vmFor(String itemId, AggregatedItem? card) {
    final tmdbRepository = TmdbRepository(client);
    return ItemDetailViewModel(
      itemId: itemId,
      serverId: 'srv1',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, tmdbRepository),
      tmdbRepository: tmdbRepository,
      cardItem: card,
    );
  }

  test('an allowed card is drawn at once and inert until the item lands', () {
    final vm = vmFor('movie-1', _card({..._movie, 'OfficialRating': 'PG'}));
    unawaited(vm.load());

    expect(vm.state, ItemDetailState.ready);
    expect(vm.isCardCopy, isTrue);
    expect(vm.item?.name, 'A movie');
  });

  test('the card copy gives way to the full item', () async {
    final vm = vmFor('movie-1', _card({..._movie, 'OfficialRating': 'PG'}));
    final loading = vm.load();

    itemsApi.pending['movie-1']!.complete({
      ..._movie,
      'Name': 'A movie, in full',
      'OfficialRating': 'PG',
    });
    await loading;
    expect(vm.state, ItemDetailState.ready);
    expect(vm.isCardCopy, isFalse);
    expect(vm.item?.name, 'A movie, in full');
  });

  test('an allowed card whose full item is blocked ends blocked', () async {
    final vm = vmFor('movie-1', _card({..._movie, 'OfficialRating': 'PG'}));
    final loading = vm.load();
    expect(vm.isCardCopy, isTrue);

    itemsApi.pending['movie-1']!.complete({
      ..._movie,
      'OfficialRating': 'TV-MA',
    });
    await loading;
    expect(vm.state, ItemDetailState.blocked);
    expect(vm.item, isNull);
  });

  test('an unrated card waits while ratings are blocked', () {
    final vm = vmFor('movie-1', _card(_movie));
    unawaited(vm.load());

    expect(vm.state, ItemDetailState.loading);
    expect(vm.item, isNull);
  });

  test('a blocked card is never drawn', () async {
    final vm = vmFor('movie-1', _card({..._movie, 'OfficialRating': 'TV-MA'}));
    final loading = vm.load();

    expect(vm.state, ItemDetailState.loading);
    expect(vm.item, isNull);

    itemsApi.pending['movie-1']!.complete({
      ..._movie,
      'OfficialRating': 'TV-MA',
    });
    await loading;
    expect(vm.state, ItemDetailState.blocked);
    expect(vm.item, isNull);
  });

  test('an unrated episode waits for its series while ratings are blocked, '
      'and the series is looked up alongside the item', () async {
    final vm = vmFor('ep-1', _card(_episode));
    final loading = vm.load();
    await Future<void>.delayed(Duration.zero);

    expect(vm.state, ItemDetailState.loading);
    expect(vm.item, isNull);
    // Asked for before the episode came back.
    expect(itemsApi.pending.keys, containsAll(['ep-1', 'series-1']));

    itemsApi.pending['series-1']!.complete({
      'Id': 'series-1',
      'Type': 'Series',
      'OfficialRating': 'TV-MA',
    });
    itemsApi.pending['ep-1']!.complete(_episode);
    await loading;
    expect(vm.state, ItemDetailState.blocked);
    expect(vm.item, isNull);
  });

  test('an unrated episode is drawn at once when nothing is blocked', () async {
    await prefs.set(UserPreferences.blockedParentalRatings, '');
    final vm = vmFor('ep-1', _card(_episode));
    unawaited(vm.load());

    expect(vm.state, ItemDetailState.ready);
    expect(vm.isCardCopy, isTrue);
  });

  test("a person's card waits for the full item", () async {
    await prefs.set(UserPreferences.blockedParentalRatings, '');
    final vm = vmFor(
      'person-1',
      _card({'Id': 'person-1', 'Name': 'A person', 'Type': 'Person'}),
    );
    unawaited(vm.load());

    expect(vm.state, ItemDetailState.loading);
    expect(vm.item, isNull);
  });

  test('the collection scan waits for the full item', () async {
    final vm = vmFor('movie-1', _card({..._movie, 'OfficialRating': 'PG'}));
    final loading = vm.load();
    expect(vm.isCardCopy, isTrue);

    await vm.loadParentCollections();
    expect(itemsApi.ancestorsAskedFor, isEmpty);

    itemsApi.pending['movie-1']!.complete({..._movie, 'OfficialRating': 'PG'});
    await loading;
    await vm.loadParentCollections();
    expect(itemsApi.ancestorsAskedFor, ['movie-1']);
  });

  test('a card for another item is ignored', () {
    final vm = vmFor('movie-2', _card({..._movie, 'OfficialRating': 'PG'}));
    unawaited(vm.load());

    expect(vm.state, ItemDetailState.loading);
    expect(vm.item, isNull);
  });
}
