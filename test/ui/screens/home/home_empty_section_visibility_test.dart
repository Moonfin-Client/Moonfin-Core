import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
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

HomeRow placeholder(String id) => HomeRow(
  id: id,
  title: id,
  rowType: HomeRowType.pluginDynamic,
  isLoading: true,
);

HomeRow populated(String id) => placeholder(id).copyWith(
  isLoading: false,
  items: [
    AggregatedItem(id: id, serverId: 'server', rawData: {'Name': id}),
  ],
);

List<String> visibleIds(List<HomeRow> rows) =>
    HomeViewModel.rowsForDisplay(rows).map((row) => row.id).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'public rows getter hides placeholders during load and focus refresh',
    () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.setHomeSectionsConfig(
        HomeSectionConfig.defaults()
            .map(
              (cfg) => cfg.copyWith(
                enabled:
                    cfg.type == HomeSectionType.resume ||
                    cfg.type == HomeSectionType.nextUp,
              ),
            )
            .toList(),
      );
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
      addTearDown(() => GetIt.instance.reset());

      final client = _Client();
      when(() => client.userId).thenReturn('user');
      when(() => client.baseUrl).thenReturn('http://server');
      final mediaBar = _MediaBar();
      when(() => mediaBar.load(force: any(named: 'force')))
          .thenAnswer((_) async {});
      final source = _DataSource();
      var resume = Completer<HomeRow>();
      var resumeStarted = Completer<void>();
      when(() => source.loadResume('http://server')).thenAnswer((_) {
        resumeStarted.complete();
        return resume.future;
      });
      final nextUp = populated('nextUp').copyWith(rowType: HomeRowType.nextUp);
      when(() => source.loadNextUp('http://server'))
          .thenAnswer((_) async => nextUp);
      final vm = HomeViewModel(
        dataSource: source,
        prefs: prefs,
        client: client,
        mediaBarViewModel: mediaBar,
        multiServerRepo: _MultiServer(),
      );
      addTearDown(vm.dispose);

      final visibleSnapshots = <List<String>>[];
      vm.addListener(() {
        visibleSnapshots.add(vm.rows.map((row) => row.id).toList());
      });
      final loading = vm.load();
      await resumeStarted.future;
      // The resume request is outstanding, so its internal placeholder exists.
      expect(vm.rows.any((row) => row.id == 'resume'), isFalse);
      resume.complete(
        const HomeRow(
          id: 'resume',
          title: 'Continue Watching',
          rowType: HomeRowType.resume,
        ),
      );
      await loading;
      expect(vm.rows.map((row) => row.id), ['nextUp']);
      expect(vm.rows.single.items, nextUp.items);
      expect(visibleSnapshots.every((ids) => !ids.contains('resume')), isTrue);

      resume = Completer<HomeRow>();
      resumeStarted = Completer<void>();
      final refreshing = vm.refresh(preserveExisting: true);
      await resumeStarted.future;
      expect(vm.rows.map((row) => row.id), ['nextUp']);
      final newResume = populated('resume')
          .copyWith(rowType: HomeRowType.resume);
      resume.complete(newResume);
      await refreshing;
      expect(vm.rows.map((row) => row.id), ['resume', 'nextUp']);
      expect(vm.rows.first.items, newResume.items);
    },
  );

  group('empty Home sections on Web and native clients', () {
    test('never appear while a fresh load resolves', () {
      expect(
        visibleIds([placeholder('empty'), placeholder('latest')]),
        isEmpty,
      );
      expect(visibleIds([placeholder('empty'), populated('latest')]), [
        'latest',
      ]);
      expect(visibleIds([populated('latest')]), ['latest']);
    });

    test('stay hidden when focus regain recreates their placeholders', () {
      final latest = populated('latest');
      expect(visibleIds([latest]), ['latest']);
      expect(visibleIds([placeholder('empty'), latest]), ['latest']);
      expect(visibleIds([latest]), ['latest']);
    });

    test('hides loaded empty sections, including Continue Watching', () {
      for (final type in HomeRowType.values) {
        if (type == HomeRowType.liveTv) continue;
        final empty = HomeRow(id: type.name, title: type.name, rowType: type);
        expect(visibleIds([empty, populated('latest')]), ['latest']);
      }
    });

    test('a formerly empty section can gain content in configured order', () {
      final latest = populated('latest');
      expect(visibleIds([placeholder('resume'), latest]), ['latest']);
      expect(visibleIds([populated('resume'), latest]), ['resume', 'latest']);
    });

    test('keeps cached content and loaded action rows without media items', () {
      final liveTv = HomeRow(
        id: 'liveTv',
        title: 'Live TV',
        rowType: HomeRowType.liveTv,
      );
      expect(visibleIds([placeholder('empty'), populated('cached'), liveTv]), [
        'cached',
        'liveTv',
      ]);
      expect(visibleIds([populated('cached').copyWith(isLoading: true)]), [
        'cached',
      ]);
    });

    test('all clients hide titled Continue Watching loading placeholders', () {
      final resume = HomeRow(
        id: 'resume',
        title: 'Continue Watching',
        rowType: HomeRowType.resume,
        isLoading: true,
      );
      expect(visibleIds([resume, populated('latest')]), ['latest']);
    });
  });
}
