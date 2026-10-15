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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _MockDataSource source;
  late HomeViewModel model;
  late UserPreferences prefs;

  setUp(() async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.setHomeSectionsConfig([
      for (final config in HomeSectionConfig.defaults())
        config.copyWith(enabled: config.type == HomeSectionType.onNow),
    ]);
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
    final client = _MockClient();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://server.test');
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

  void stubLiveTvRows() {
    when(() => source.hasLiveTvChannels()).thenAnswer((_) async => true);
    when(() => source.loadOnNow('http://server.test')).thenAnswer(
      (_) async => HomeRow(
        id: 'liveTvOnNow',
        title: 'On Now',
        rowType: HomeRowType.liveTvOnNow,
        items: [
          AggregatedItem(
            id: 'program',
            serverId: 'http://server.test',
            rawData: {'Type': 'Program'},
          ),
        ],
      ),
    );
    when(() => source.loadFavoritesChannels('http://server.test')).thenAnswer(
      (_) async => const HomeRow(
        id: 'liveTvFavorites',
        title: 'Favorite Channels',
        rowType: HomeRowType.liveTvFavorites,
      ),
    );
  }

  Future<HomeRow> loadPopulatedRow() async {
    stubLiveTvRows();
    await model.load();
    return model.rows.single;
  }

  test(
    'a failed channel check preserves the visible row during refresh',
    () async {
      final existing = await loadPopulatedRow();
      when(() => source.hasLiveTvChannels())
          .thenThrow(Exception('unavailable'));

      await model.load(preserveExisting: true);

      expect(model.rows.single, same(existing));
      expect(model.isLoading, isFalse);
    },
  );

  test(
    'a failed program request preserves the visible row during refresh',
    () async {
      final existing = await loadPopulatedRow();
      when(() => source.loadOnNow('http://server.test'))
          .thenThrow(Exception('EPG unavailable'));

      await model.load(preserveExisting: true);

      expect(model.rows.single, same(existing));
      expect(model.isLoading, isFalse);
    },
  );

  test(
    'confirmed absence of channels removes the visible row during refresh',
    () async {
      await loadPopulatedRow();
      when(() => source.hasLiveTvChannels()).thenAnswer((_) async => false);

      await model.load(preserveExisting: true);

      expect(model.rows, isEmpty);
    },
  );

  test(
    'a successful empty EPG response removes the visible row during refresh',
    () async {
      await loadPopulatedRow();
      when(() => source.loadOnNow('http://server.test')).thenAnswer(
        (_) async => const HomeRow(
          id: 'liveTvOnNow',
          title: 'On Now',
          rowType: HomeRowType.liveTvOnNow,
        ),
      );

      await model.load(preserveExisting: true);

      expect(model.rows, isEmpty);
    },
  );

  test(
    'no Live TV channels skips program loading and clears the placeholder',
    () async {
      when(() => source.hasLiveTvChannels()).thenAnswer((_) async => false);

      await model.load();

      verify(() => source.hasLiveTvChannels()).called(1);
      verifyNever(() => source.loadOnNow(any()));
      expect(model.rows, isEmpty);
      expect(model.isLoading, isFalse);
    },
  );

  test('a failed channel check skips program loading without leaving a placeholder', () async {
    when(() => source.hasLiveTvChannels()).thenThrow(Exception('unavailable'));

    await model.load();

    verify(() => source.hasLiveTvChannels()).called(1);
    verifyNever(() => source.loadOnNow(any()));
    expect(model.rows, isEmpty);
    expect(model.isLoading, isFalse);
  });

  Future<void> enableSections(Set<HomeSectionType> types) =>
      prefs.setHomeSectionsConfig([
        for (final config in HomeSectionConfig.defaults())
          config.copyWith(enabled: types.contains(config.type)),
      ]);

  test(
    'Live TV leaves On Now to the standalone section when both are on',
    () async {
      await enableSections({HomeSectionType.liveTv, HomeSectionType.onNow});
      stubLiveTvRows();

      await model.load();

      expect(model.rows.map((row) => row.id), ['liveTv', 'onNow']);
      verify(() => source.loadOnNow('http://server.test')).called(1);
    },
  );

  test(
    'Live TV keeps its own On Now row when the standalone section is off',
    () async {
      await enableSections({HomeSectionType.liveTv});
      stubLiveTvRows();

      await model.load();

      expect(model.rows.map((row) => row.id), ['liveTv', 'liveTvOnNow']);
    },
  );

  test(
    'available channels load airing programs as the standalone row',
    () async {
      when(() => source.hasLiveTvChannels()).thenAnswer((_) async => true);
      final program = AggregatedItem(
        id: 'program',
        serverId: 'http://server.test',
        rawData: {'Type': 'Program'},
      );
      when(() => source.loadOnNow('http://server.test')).thenAnswer(
        (_) async => HomeRow(
          id: 'liveTvOnNow',
          title: 'On Now',
          rowType: HomeRowType.liveTvOnNow,
          items: [program],
        ),
      );

      await model.load();

      expect(model.rows.single.id, 'onNow');
      expect(model.rows.single.items, [program]);
      expect(model.isLoading, isFalse);
    },
  );
}
