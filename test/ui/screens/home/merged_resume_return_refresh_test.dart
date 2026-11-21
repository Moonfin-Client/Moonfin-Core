import 'package:flutter/foundation.dart';
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

class _MockDataSource extends Mock implements RowDataSource {}

class _MockClient extends Mock implements MediaServerClient {}

class _MockMediaBar extends Mock implements MediaBarViewModel {}

class _MockMultiServer extends Mock implements MultiServerRepository {}

class _MockSync extends Mock implements PluginSyncService {}

class _MockSeerrPrefs extends Mock implements SeerrPreferences {}

const _server = 'http://server.test';

/// Played [minutesAgo] minutes before the newest, so the row's order is fixed.
AggregatedItem _episode(String id, int minutesAgo) => AggregatedItem(
  id: id,
  serverId: _server,
  rawData: {
    'Type': 'Episode',
    'UserData': {
      'LastPlayedDate': DateTime.utc(
        2026,
        11,
        17,
        23,
      ).subtract(Duration(minutes: minutesAgo)).toIso8601String(),
    },
  },
);

HomeRow _resume(List<AggregatedItem> items) => HomeRow(
  id: 'resume',
  title: 'Continue Watching',
  rowType: HomeRowType.resume,
  items: items,
  totalCount: 30,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _MockDataSource source;
  late HomeViewModel model;

  setUp(() async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final config in HomeSectionConfig.defaults())
        config.copyWith(
          enabled:
              config.type == HomeSectionType.resume ||
              config.type == HomeSectionType.nextUp,
        ),
    ]);
    await prefs.set(UserPreferences.mergeContinueWatchingNextUp, true);
    await prefs.set(
      UserPreferences.lastExternalRowsRefreshTime,
      DateTime.now().millisecondsSinceEpoch,
    );

    final sync = _MockSync();
    when(() => sync.seerrAvailable).thenReturn(false);
    when(() => sync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
    GetIt.instance.registerSingleton<SeerrPreferences>(_MockSeerrPrefs());

    source = _MockDataSource();
    when(() => source.loadNextUp(_server, startIndex: any(named: 'startIndex')))
        .thenAnswer(
          (_) async => const HomeRow(
            id: 'nextUp',
            title: 'Next Up',
            rowType: HomeRowType.nextUp,
          ),
        );
    final client = _MockClient();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn(_server);
    final mediaBar = _MockMediaBar();
    when(() => mediaBar.load(force: any(named: 'force')))
        .thenAnswer((_) async {});
    model = HomeViewModel(
      dataSource: source,
      prefs: prefs,
      client: client,
      mediaBarViewModel: mediaBar,
      multiServerRepo: _MockMultiServer(),
    );
  });

  tearDown(() async {
    model.dispose();
    debugDefaultTargetPlatformOverride = null;
    await GetIt.instance.reset();
  });

  void serveResume(List<AggregatedItem> Function(int start) page) {
    when(() => source.loadResume(_server, startIndex: any(named: 'startIndex')))
        .thenAnswer((invocation) async {
          final start = invocation.namedArguments[#startIndex] as int? ?? 0;
          return _resume(page(start));
        });
  }

  HomeRow merged() => model.rows.singleWhere((row) => row.id == 'resume');

  // Paging the row used to keep it as it was on every later return, so an
  // episode watched since stayed on it until the app reloaded.
  test('returning to Home after paging the merged row refreshes it', () async {
    serveResume(
      (start) => [for (var i = start; i < start + 15; i++) _episode('e$i', i)],
    );
    await model.load();
    await pumpEventQueue();
    await model.loadMoreForRow(model.rows.indexOf(merged()));
    expect(merged().items, hasLength(30));

    // e0 was watched to the end and a new episode was started.
    serveResume(
      (start) => [
        _episode('started', 0),
        for (var i = start + 1; i < start + 15; i++) _episode('e$i', i),
      ],
    );
    await model.refreshResumeAndNextUp();

    expect(merged().items.first.id, 'started');
    expect(merged().items.map((item) => item.id), isNot(contains('e0')));
  });
}
