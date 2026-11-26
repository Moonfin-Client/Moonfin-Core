import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/home_row_cache_store.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _ItemsApi extends Mock implements ItemsApi {}

class _DataSource extends Mock implements RowDataSource {}

class _MediaBar extends Mock implements MediaBarViewModel {}

class _MultiServer extends Mock implements MultiServerRepository {}

class _PluginSync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Cache extends Fake implements HomeRowCacheStore {
  @override
  Future<List<HomeRow>?> read(String cacheKey) async => null;

  @override
  Future<void> write(String cacheKey, List<HomeRow> rows) async {}
}

// Issue #1028: a collection picked from another signed-in server loads from
// that server while multi-server libraries are on.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _DataSource source;
  late _ItemsApi otherItems;
  late _MultiServer multiServer;

  setUpAll(
    () => registerFallbackValue(HomeSectionPluginSource.collections),
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final cfg in HomeSectionConfig.defaults())
        cfg.copyWith(enabled: false),
      HomeSectionConfig.pluginDynamic(
        serverId: 'http://other',
        pluginSection: 'collection',
        pluginAdditionalData: 'marvel',
        pluginDisplayText: 'Marvel',
      ),
    ]);
    await prefs.set(UserPreferences.displayCollectionsRows, true);
    await prefs.set(
      UserPreferences.lastExternalRowsRefreshTime,
      DateTime.now().millisecondsSinceEpoch,
    );

    final pluginSync = _PluginSync();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
    GetIt.instance.registerSingleton<SeerrPreferences>(_SeerrPrefs());

    source = _DataSource();
    otherItems = _ItemsApi();
    when(
      () => otherItems.getItems(
        parentId: 'marvel',
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        recursive: any(named: 'recursive'),
        startIndex: any(named: 'startIndex'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'iron-man', 'Name': 'Iron Man', 'Type': 'Movie'},
        ],
        'TotalRecordCount': 1,
      },
    );
    final otherClient = _Client();
    when(() => otherClient.serverType).thenReturn(ServerType.emby);
    when(() => otherClient.baseUrl).thenReturn('http://other');
    when(() => otherClient.itemsApi).thenReturn(otherItems);
    multiServer = _MultiServer();
    when(() => multiServer.getLoggedInServers()).thenAnswer(
      (_) async => [
        ServerUserSession(
          server: Server(
            id: 'other-id',
            name: 'Other',
            address: 'http://other',
            version: '4.10',
            serverType: ServerType.emby,
            dateAdded: DateTime(2026),
          ),
          userId: 'user',
          client: otherClient,
        ),
      ],
    );
  });

  tearDown(() => GetIt.instance.reset());

  HomeViewModel model() {
    final client = _Client();
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://server');
    final mediaBar = _MediaBar();
    when(() => mediaBar.load(force: any(named: 'force')))
        .thenAnswer((_) async {});
    final vm = HomeViewModel(
      dataSource: source,
      prefs: prefs,
      client: client,
      mediaBarViewModel: mediaBar,
      multiServerRepo: multiServer,
      cacheStore: _Cache(),
    );
    addTearDown(vm.dispose);
    return vm;
  }

  void verifyActiveServerUnused() => verifyNever(
    () => source.loadDynamicSection(
      rowId: any(named: 'rowId'),
      section: any(named: 'section'),
      title: any(named: 'title'),
      serverId: any(named: 'serverId'),
      additionalData: any(named: 'additionalData'),
      pluginSource: any(named: 'pluginSource'),
      forceRefresh: any(named: 'forceRefresh'),
    ),
  );

  test('loads from its own server with multi-server libraries on', () async {
    await prefs.set(UserPreferences.enableMultiServerLibraries, true);
    final vm = model();
    await vm.load();

    final row = vm.rows.single;
    expect(row.title, 'Marvel');
    expect(row.items.single.id, 'iron-man');
    expect(row.items.single.serverId, 'other-id');
    verifyActiveServerUnused();
  });

  test('stays off Home with multi-server libraries off', () async {
    await prefs.set(UserPreferences.enableMultiServerLibraries, false);
    final vm = model();
    await vm.load();

    expect(vm.rows, isEmpty);
    verifyActiveServerUnused();
  });
}
