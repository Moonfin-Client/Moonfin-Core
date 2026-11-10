import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/home_row_cache_store.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/data/viewmodels/media_bar_view_model.dart';
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

class _Cache extends Fake implements HomeRowCacheStore {}

void main() {
  tearDown(() => GetIt.instance.reset());

  test('a section loads with the sort passed in, not the saved one', () async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    await prefs.set(UserPreferences.enableMultiServerLibraries, false);
    await prefs.set(UserPreferences.playlistsRowSortBy, LibrarySortBy.name);

    final pluginSync = _PluginSync();
    when(() => pluginSync.seerrAvailable).thenReturn(false);
    when(() => pluginSync.pluginAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
    GetIt.instance.registerSingleton<SeerrPreferences>(_SeerrPrefs());

    final source = _DataSource();
    when(
      () => source.loadPlaylists(
        any(),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
      ),
    ).thenAnswer(
      (_) async => const HomeRow(
        id: 'playlists',
        title: 'Playlists',
        rowType: HomeRowType.playlists,
        items: [],
      ),
    );
    final client = _Client();
    when(() => client.userId).thenReturn('user');
    when(() => client.baseUrl).thenReturn('http://server');
    final vm = HomeViewModel(
      dataSource: source,
      prefs: prefs,
      client: client,
      mediaBarViewModel: _MediaBar(),
      multiServerRepo: _MultiServer(),
      cacheStore: _Cache(),
    );
    addTearDown(vm.dispose);

    await vm.loadSectionSorted(
      HomeSectionType.playlists,
      sortBy: LibrarySortBy.dateAdded,
      sortOrder: SortDirection.descending,
    );

    verify(
      () => source.loadPlaylists(
        any(),
        sortBy: LibrarySortBy.dateAdded.apiValue,
        sortOrder: SortDirection.descending.apiValue,
      ),
    ).called(1);
    expect(prefs.get(UserPreferences.playlistsRowSortBy), LibrarySortBy.name);
  });
}
