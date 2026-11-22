
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
import 'package:server_plex/server_plex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockDataSource extends Mock implements RowDataSource {}

class _MockClient extends Mock implements MediaServerClient {}

class _MockPlexClient extends Mock implements PlexMediaServerClient {}

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

  HomeRow favoriteChannels([List<AggregatedItem> items = const []]) =>
      HomeRow(
        id: 'liveTvFavorites',
        title: 'Favorite Channels',
        rowType: HomeRowType.liveTvFavorites,
        items: items,
      );

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
    when(() => source.loadFavoritesChannels('http://server.test'))
        .thenAnswer((_) async => favoriteChannels());
  }

  void stubFavoriteChannel() {
    when(() => source.loadFavoritesChannels('http://server.test')).thenAnswer(
      (_) async => favoriteChannels([
        AggregatedItem(
          id: 'favorite',
          serverId: 'http://server.test',
          rawData: {'Type': 'TvChannel'},
        ),
      ]),
    );
  }

  Future<HomeRow> loadPopulatedRow() async {
    stubLiveTvRows();
    await model.load();
    return model.rows.single;
  }

  for (final channelCheckFails in [true, false]) {
    test(
      'a failed ${channelCheckFails ? 'channel check' : 'program request'} '
      'preserves the visible row during refresh',
      () async {
        final existing = await loadPopulatedRow();
        if (channelCheckFails) {
          when(() => source.hasLiveTvChannels())
              .thenThrow(Exception('unavailable'));
        } else {
          when(() => source.loadOnNow('http://server.test'))
              .thenThrow(Exception('EPG unavailable'));
        }
        await model.load(preserveExisting: true);
        expect(model.rows.single, same(existing));
        expect(model.isLoading, isFalse);
      },
    );
  }

  for (final noChannels in [true, false]) {
    test(
      noChannels
          ? 'confirmed absence of channels removes the visible row during refresh'
          : 'a successful empty EPG response removes the visible row during refresh',
      () async {
        await loadPopulatedRow();
        if (noChannels) {
          when(() => source.hasLiveTvChannels()).thenAnswer((_) async => false);
        } else {
          when(() => source.loadOnNow('http://server.test')).thenAnswer(
            (_) async => const HomeRow(
              id: 'liveTvOnNow',
              title: 'On Now',
              rowType: HomeRowType.liveTvOnNow,
            ),
          );
        }
        await model.load(preserveExisting: true);
        expect(model.rows, isEmpty);
      },
    );
  }

  for (final channelCheckFails in [false, true]) {
    test(
      channelCheckFails
          ? 'a failed channel check skips program loading without leaving a placeholder'
          : 'no Live TV channels skips program loading and clears the placeholder',
      () async {
        if (channelCheckFails) {
          when(() => source.hasLiveTvChannels())
              .thenThrow(Exception('unavailable'));
        } else {
          when(() => source.hasLiveTvChannels()).thenAnswer((_) async => false);
        }
        await model.load();
        verify(() => source.hasLiveTvChannels()).called(1);
        verifyNever(() => source.loadOnNow(any()));
        expect(model.rows, isEmpty);
        expect(model.isLoading, isFalse);
      },
    );
  }

  Future<void> enableSections(Set<HomeSectionType> types) =>
      prefs.setHomeSectionsConfig([
        for (final config in HomeSectionConfig.defaults())
          config.copyWith(enabled: types.contains(config.type)),
      ]);

  for (final standaloneOnNow in [true, false]) {
    test(
      standaloneOnNow
          ? 'Live TV leaves On Now to the standalone section when both are on'
          : 'Live TV keeps its own On Now row when the standalone section is off',
      () async {
        await enableSections({
          HomeSectionType.liveTv,
          if (standaloneOnNow) HomeSectionType.onNow,
        });
        stubLiveTvRows();
        await model.load();
        expect(
          model.rows.map((row) => row.id),
          standaloneOnNow ? ['liveTv', 'onNow'] : ['liveTv', 'liveTvOnNow'],
        );
        if (standaloneOnNow) {
          verify(() => source.loadOnNow('http://server.test')).called(1);
        }
      },
    );
  }

  test('failed On Now listings do not hide favorite channels', () async {
    await enableSections({HomeSectionType.liveTv});
    stubLiveTvRows();
    when(() => source.loadOnNow('http://server.test'))
        .thenAnswer((_) async => throw Exception('EPG unavailable'));
    stubFavoriteChannel();

    await model.load();

    expect(model.rows.map((row) => row.id), ['liveTv', 'liveTvFavorites']);
    verify(() => source.loadFavoritesChannels('http://server.test')).called(1);
  });

  test('Kids Mode hides every Live TV row without removing saved rows', () async {
    await enableSections({HomeSectionType.liveTv});
    stubLiveTvRows();
    stubFavoriteChannel();
    await model.load();
    final ids = model.rows.map((row) => row.id).toList();
    expect(ids, ['liveTv', 'liveTvOnNow', 'liveTvFavorites']);

    await prefs.set(UserPreferences.kidsModeEnabled, true);
    expect(model.rows, isEmpty);
    await prefs.set(UserPreferences.kidsModeEnabled, false);
    expect(model.rows.map((row) => row.id), ids);
  });

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



  for (final (serverType, cloudOnly) in [
    (ServerType.jellyfin, false),
    (ServerType.emby, false),
    (ServerType.plex, false),
    (ServerType.plex, true),
  ]) {
    test('returning from the guide updates ${cloudOnly ? 'Plex Cloud' : serverType.name} channel favorites', () async {
      await enableSections({HomeSectionType.liveTv});
      stubLiveTvRows();
      final MediaServerClient serverClient;
      if (serverType == ServerType.plex) {
        final plex = _MockPlexClient();
        when(() => plex.cloudOnly).thenReturn(cloudOnly);
        serverClient = plex;
      } else {
        serverClient = _MockClient();
      }
      when(() => serverClient.serverType).thenReturn(serverType);
      when(() => serverClient.userId).thenReturn('user');
      when(() => serverClient.baseUrl).thenReturn('http://server.test');

      var favorites = <AggregatedItem>[];
      when(() => source.loadFavoritesChannels('http://server.test'))
          .thenAnswer((_) async => favoriteChannels(List.of(favorites)));
      model.dispose();
      final mediaBar = _MockMediaBar();
      when(() => mediaBar.load(force: any(named: 'force')))
          .thenAnswer((_) async {});
      model = HomeViewModel(
        dataSource: source,
        prefs: prefs,
        client: serverClient,
        mediaBarViewModel: mediaBar,
        multiServerRepo: _MockMultiServer(),
      );
      await model.load();
      expect(model.rows.any((r) => r.rowType == HomeRowType.liveTvFavorites), isFalse);

      favorites = [
        AggregatedItem(
          id: 'favorite-channel',
          serverId: 'http://server.test',
          rawData: {'Type': 'TvChannel', 'Name': 'Favorite Channel'},
        ),
      ];
      await model.refreshResumeAndNextUp();
      expect(model.rows.map((r) => r.id), contains('liveTvFavorites'));
      expect(
        model.rows.firstWhere((r) => r.rowType == HomeRowType.liveTvFavorites).items.single.id,
        'favorite-channel',
      );

      favorites = [];
      await model.refreshResumeAndNextUp();
      expect(model.rows.any((r) => r.rowType == HomeRowType.liveTvFavorites), isFalse);
      verify(() => source.loadFavoritesChannels('http://server.test')).called(3);
      if (cloudOnly) {
        verifyNever(() => source.hasLiveTvChannels());
      } else {
        verify(() => source.hasLiveTvChannels()).called(1);
      }
    });
  }


}
