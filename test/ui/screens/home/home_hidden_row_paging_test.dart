import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/home_row_cache_store.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

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

const _page = 15;

/// Next Up as the server lists it, one episode for each of 40 series.
final _server = [
  for (var i = 0; i < 40; i++)
    AggregatedItem(
      id: 'ep$i',
      serverId: 'http://server',
      rawData: {'Type': 'Episode', 'SeriesId': 'series$i'},
    ),
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _DataSource source;

  setUpAll(
    () => registerFallbackValue(
      const HomeRow(id: 'x', title: 'x', rowType: HomeRowType.nextUp),
    ),
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final cfg in HomeSectionConfig.defaults())
        cfg.copyWith(enabled: cfg.type == HomeSectionType.nextUp),
    ]);
    await prefs.set(UserPreferences.mergeContinueWatchingNextUp, false);
    await prefs.set(UserPreferences.enableMultiServerLibraries, false);
    await prefs.set(
      UserPreferences.lastExternalRowsRefreshTime,
      DateTime.now().millisecondsSinceEpoch,
    );

    final pluginSync = _PluginSync();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
    GetIt.instance.registerSingleton<SeerrPreferences>(_SeerrPrefs());

    // Shaped like the real data source: the first page, then each later page
    // read from the offset it's given and appended to the row.
    source = _DataSource();
    when(() => source.loadNextUp('http://server')).thenAnswer(
      (_) async => HomeRow(
        id: 'nextUp',
        title: 'Next Up',
        rowType: HomeRowType.nextUp,
        items: _server.take(_page).toList(),
        totalCount: _server.length,
      ),
    );
    when(
      () => source.loadMore(
        row: any(named: 'row'),
        serverId: any(named: 'serverId'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((invocation) async {
      final row = invocation.namedArguments[#row] as HomeRow;
      final offset = invocation.namedArguments[#offset] as int;
      return (
        [...row.items, ..._server.skip(offset).take(_page)],
        _server.length,
      );
    });
  });

  tearDown(() => GetIt.instance.reset());

  Future<HomeViewModel> loaded() async {
    final client = _Client();
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
      multiServerRepo: _MultiServer(),
      cacheStore: _Cache(),
    );
    addTearDown(vm.dispose);
    await vm.load();
    return vm;
  }

  HomeRow nextUp(HomeViewModel vm) =>
      vm.rows.singleWhere((row) => row.id == 'nextUp');

  Future<void> pageToTheEnd(HomeViewModel vm) async {
    for (var i = 0; i < 10 && nextUp(vm).hasMore; i++) {
      await vm.loadMoreForRow(vm.rows.indexOf(nextUp(vm)));
    }
    expect(nextUp(vm).hasMore, isFalse);
  }

  test('hidden series stay hidden on every page and nothing repeats', () async {
    // Hides most of the first page and all of the second.
    for (var i = 0; i < 30; i++) {
      if (i < 8 || i >= _page) await prefs.hideFromNextUp('series$i');
    }

    final vm = await loaded();
    expect(nextUp(vm).items.map((item) => item.id), [
      for (var i = 8; i < _page; i++) 'ep$i',
    ]);

    await pageToTheEnd(vm);

    expect(nextUp(vm).items.map((item) => item.id), [
      for (var i = 8; i < _page; i++) 'ep$i',
      for (var i = 30; i < _server.length; i++) 'ep$i',
    ]);
  });

  test('paging carries on from the end of the first page', () async {
    for (var i = 0; i < 8; i++) {
      await prefs.hideFromNextUp('series$i');
    }

    final vm = await loaded();
    await vm.loadMoreForRow(vm.rows.indexOf(nextUp(vm)));

    verify(
      () => source.loadMore(
        row: any(named: 'row'),
        serverId: any(named: 'serverId'),
        offset: _page,
      ),
    ).called(1);
  });
}
