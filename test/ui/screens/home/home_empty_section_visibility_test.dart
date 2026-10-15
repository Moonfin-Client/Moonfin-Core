import 'dart:async';

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
  _Cache(this.cached);

  final List<HomeRow>? cached;

  @override
  Future<List<HomeRow>?> read(String cacheKey) async => cached;

  @override
  Future<void> write(String cacheKey, List<HomeRow> rows) async {}
}

HomeRow populated(String id, HomeRowType type, {int totalCount = 0}) => HomeRow(
  id: id,
  title: id,
  rowType: type,
  totalCount: totalCount,
  items: [
    AggregatedItem(id: '$id-item', serverId: 'server', rawData: {'Name': id}),
  ],
);

const emptyResume = HomeRow(
  id: 'resume',
  title: 'Continue Watching',
  rowType: HomeRowType.resume,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserPreferences prefs;
  late _DataSource source;
  late Completer<HomeRow> resume;
  late Completer<void> resumeStarted;

  void expectResumeLoad() {
    resume = Completer<HomeRow>();
    resumeStarted = Completer<void>();
  }

  setUpAll(() => registerFallbackValue(emptyResume));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final cfg in HomeSectionConfig.defaults())
        cfg.copyWith(
          enabled:
              cfg.type == HomeSectionType.resume ||
              cfg.type == HomeSectionType.nextUp,
        ),
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

    source = _DataSource();
    expectResumeLoad();
    when(() => source.loadResume('http://server')).thenAnswer((_) {
      resumeStarted.complete();
      return resume.future;
    });
    when(() => source.loadNextUp('http://server')).thenAnswer(
      (_) async => populated('nextUp', HomeRowType.nextUp, totalCount: 10),
    );
  });

  tearDown(() => GetIt.instance.reset());

  HomeViewModel model({List<HomeRow>? cached}) {
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
      cacheStore: _Cache(cached),
    );
    addTearDown(vm.dispose);
    return vm;
  }

  List<String> ids(HomeViewModel vm) => vm.rows.map((row) => row.id).toList();

  Future<HomeViewModel> loadedWithEmptyResume() async {
    final vm = model();
    final loading = vm.load();
    await resumeStarted.future;
    resume.complete(emptyResume);
    await loading;
    expectResumeLoad();
    return vm;
  }

  test('a section keeps its placeholder until a load finds it empty', () async {
    final vm = model();
    final loading = vm.load();
    await resumeStarted.future;
    expect(vm.rows.first.id, 'resume');
    expect(vm.rows.first.isLoading, isTrue);

    resume.complete(emptyResume);
    await loading;
    expect(ids(vm), ['nextUp']);
  });

  test(
    'a section that came back empty stays hidden while it refreshes',
    () async {
      final vm = await loadedWithEmptyResume();

      final refreshing = vm.refresh();
      await resumeStarted.future;
      expect(ids(vm), ['nextUp']);

      resume.complete(populated('resume', HomeRowType.resume));
      await refreshing;
      expect(ids(vm), ['resume', 'nextUp']);
    },
  );

  test('paging reaches the row on screen past a hidden placeholder', () async {
    final vm = await loadedWithEmptyResume();
    when(
      () => source.loadMore(
        row: any(named: 'row'),
        serverId: any(named: 'serverId'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => (const <AggregatedItem>[], 10));

    final refreshing = vm.refresh();
    await resumeStarted.future;
    await vm.loadMoreForRow(0);

    verify(
      () => source.loadMore(
        row: any(
          named: 'row',
          that: predicate<HomeRow>((row) => row.id == 'nextUp'),
        ),
        serverId: any(named: 'serverId'),
        offset: any(named: 'offset'),
      ),
    ).called(1);

    resume.complete(emptyResume);
    await refreshing;
  });

  test('a page lands on its row after an earlier section settles', () async {
    final page = Completer<(List<AggregatedItem>, int)>();
    when(
      () => source.loadMore(
        row: any(named: 'row'),
        serverId: any(named: 'serverId'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) => page.future);
    final vm = model();
    final loading = vm.load();
    await resumeStarted.future;
    await pumpEventQueue();
    expect(ids(vm), ['resume', 'nextUp']);

    final paging = vm.loadMoreForRow(1);
    resume.complete(emptyResume);
    await loading;
    final more = populated('more', HomeRowType.nextUp).items;
    page.complete((more, 10));
    await paging;

    expect(ids(vm), ['nextUp']);
    expect(vm.rows.single.items, more);
  });

  test(
    'a row the quick refresh empties stays hidden on the next refresh',
    () async {
      final vm = model();
      final loading = vm.load();
      await resumeStarted.future;
      resume.complete(populated('resume', HomeRowType.resume));
      await loading;
      expectResumeLoad();

      final quick = vm.refreshResumeAndNextUp();
      await resumeStarted.future;
      resume.complete(emptyResume);
      await quick;
      expect(ids(vm), ['nextUp']);
      expectResumeLoad();

      final refreshing = vm.refresh();
      await resumeStarted.future;
      expect(ids(vm), ['nextUp']);

      resume.complete(emptyResume);
      await refreshing;
    },
  );

  test('a failed load is not taken for an empty section', () async {
    final vm = model();
    final loading = vm.load();
    await resumeStarted.future;
    resume.completeError(Exception('offline'));
    await loading;
    expectResumeLoad();

    final refreshing = vm.refresh();
    await resumeStarted.future;
    expect(ids(vm), ['resume', 'nextUp']);

    resume.complete(emptyResume);
    await refreshing;
  });

  test('a cold start hides sections the cache had nothing for', () async {
    final vm = model(cached: [populated('nextUp', HomeRowType.nextUp)]);
    final loading = vm.load();
    await resumeStarted.future;
    expect(ids(vm), ['nextUp']);

    resume.complete(populated('resume', HomeRowType.resume));
    await loading;
    expect(ids(vm), ['resume', 'nextUp']);
  });

  test('merged Continue Watching that came back empty stays hidden while it refreshes', () async {
    await prefs.set(UserPreferences.mergeContinueWatchingNextUp, true);
    when(() => source.loadNextUp('http://server')).thenAnswer(
      (_) async => const HomeRow(
        id: 'nextUp',
        title: 'Next Up',
        rowType: HomeRowType.nextUp,
      ),
    );
    final vm = model();
    await vm.load();
    await resumeStarted.future;
    resume.complete(emptyResume);
    await pumpEventQueue();
    expect(ids(vm), isEmpty);
    expectResumeLoad();

    await vm.refresh();
    await resumeStarted.future;
    expect(ids(vm), isEmpty);

    resume.complete(populated('resume', HomeRowType.resume));
    await pumpEventQueue();
    expect(ids(vm), ['resume']);
  });
}
