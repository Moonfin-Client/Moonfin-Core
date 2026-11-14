import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/offline/offline_errors.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/blocked_content_gate.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:server_core/server_core.dart';

import '../services/unified_catalog_fakes.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _Factory extends Fake implements MediaServerClientFactory {
  _Factory(this._clients);

  final Map<String, MediaServerClient> _clients;

  @override
  MediaServerClient? getClientIfExists(String serverId) => _clients[serverId];
}

class _Catalog extends Fake implements UnifiedCatalogService {
  final removed = <(String, String)>[];

  @override
  Future<void> removeCopy(String serverId, String itemId) async {
    removed.add((serverId, itemId));
  }
}

/// Fails the way a lookup made after the item itself was read would.
class _FailingGate extends Fake implements BlockedContentGate {
  @override
  Future<bool> isBlocked(AggregatedItem item) => throw httpError(404);
}

void main() {
  late _Client client;
  late _ItemsApi itemsApi;
  late _Catalog catalog;

  ItemDetailViewModel viewModel() {
    final vm = ItemDetailViewModel(
      itemId: 'item-1',
      serverId: 'b',
      client: client,
      mutations: ItemMutationRepository(client),
      mdbListRepository: MdbListRepository(client, TmdbRepository(client)),
      tmdbRepository: TmdbRepository(client),
    );
    addTearDown(vm.dispose);
    return vm;
  }

  void itemAnswers(Future<Map<String, dynamic>> Function() answer) => when(
    () =>
        itemsApi.getItem('item-1', mediaSourceId: any(named: 'mediaSourceId')),
  ).thenAnswer((_) => answer());

  setUp(() {
    client = _Client();
    itemsApi = _ItemsApi();
    catalog = _Catalog();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.baseUrl).thenReturn('http://b.test');
    GetIt.instance.registerSingleton<UnifiedCatalogService>(catalog);
  });

  tearDown(() => GetIt.instance.reset());

  test('a title its own server says is gone leaves the stored '
      'catalog', () async {
    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _Factory({'b': client}),
    );
    itemAnswers(() async => throw httpError(404));
    final vm = viewModel();

    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect(catalog.removed, [('b', 'item-1')]);
  });

  test('a server that fails to answer says nothing about the title', () async {
    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _Factory({'b': client}),
    );
    itemAnswers(() async => throw httpError(500));
    final vm = viewModel();

    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect(catalog.removed, isEmpty);
  });

  test('offline, a title that is not downloaded is not gone', () async {
    // Offline, the client answers from the downloads and makes up its own
    // 404s.
    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _Factory({'b': client}),
    );
    itemAnswers(() async => throw offlineNotFound('/Items/item-1'));
    final vm = viewModel();

    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect(catalog.removed, isEmpty);
  });

  test('a 404 from another server is not the title being gone', () async {
    // No client for the title's server, so the page was handed the active
    // server's, which has never heard of this id.
    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _Factory({'a': client}),
    );
    itemAnswers(() async => throw httpError(404));
    final vm = viewModel();

    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect(catalog.removed, isEmpty);
  });

  test('a 404 from another request of the page is not the title being '
      'gone', () async {
    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _Factory({'b': client}),
    );
    GetIt.instance.registerSingleton<BlockedContentGate>(_FailingGate());
    itemAnswers(() async => catalogMovie('item-1', 'Altovar'));
    final vm = viewModel();

    await vm.load();

    expect(vm.state, ItemDetailState.error);
    expect(catalog.removed, isEmpty);
  });
}
