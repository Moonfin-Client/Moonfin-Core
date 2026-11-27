import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/util/home_row_title_localizer.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

/// An `ItemsApi` whose server curates rows of its own (Silo).
class _MockSectionsItemsApi extends Mock
    implements ItemsApi, ServerHomeSectionsApi {}

void main() {
  test('a server row loads the server\'s own row', () async {
    final api = _MockSectionsItemsApi();
    when(() => api.getServerHomeSectionItems('s1')).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': 'movie-1', 'Name': 'One', 'Type': 'Movie'},
          {'Id': 'series-2', 'Name': 'Two', 'Type': 'Series'},
        ],
        'TotalRecordCount': 2,
        'StartIndex': 0,
      },
    );
    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(api);

    final row = await RowDataSource(client).loadDynamicSection(
      rowId: 'pluginDynamic:server:srv:s1:',
      section: 's1',
      title: 'Trending on Server',
      serverId: 'srv',
      pluginSource: HomeSectionPluginSource.server,
    );

    expect(row.id, 'pluginDynamic:server:srv:s1:');
    expect(row.title, 'Trending on Server');
    expect(row.rowType, HomeRowType.pluginDynamic);
    expect(row.items.map((i) => i.id), ['movie-1', 'series-2']);
    expect(row.items.first.serverId, 'srv');
    // The whole row came at once, so nothing more is asked when scrolling.
    expect(row.totalCount, 2);
  });

  group('a server row\'s title', () {
    // In French, so a title that skipped the translation shows as English.
    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      await prefs.set(UserPreferences.languageOverride, 'fr');
      GetIt.instance.registerSingleton<UserPreferences>(prefs);
    });
    tearDown(() => GetIt.instance.reset());

    Future<HomeRow> rowOf(
      String section,
      Future<List<ServerHomeSection>> Function() sections, {
      String stored = 'stored title',
    }) async {
      final api = _MockSectionsItemsApi();
      when(
        () => api.getServerHomeSectionItems(section),
      ).thenAnswer((_) async => {'Items': <Object>[]});
      when(api.getServerHomeSections).thenAnswer((_) => sections());
      final client = _MockClient();
      when(() => client.itemsApi).thenReturn(api);
      final row = await RowDataSource(client).loadDynamicSection(
        rowId: 'r',
        section: section,
        title: stored,
        serverId: 'srv',
        pluginSource: HomeSectionPluginSource.server,
      );
      return row;
    }

    Future<String> titleOf(
      String section,
      Future<List<ServerHomeSection>> Function() sections, {
      String stored = 'stored title',
    }) async =>
        (await rowOf(section, sections, stored: stored)).title;

    const keyed = ServerHomeSection(
      id: 's1',
      title: 'Recently Added',
      kind: 'recently_added',
      titleKey: 'home.section.recentlyAdded',
    );

    test('comes from the key the server sent', () async {
      expect(await titleOf('s1', () async => [keyed]), 'Ajouts récents');
    });

    test('of a row named by its kind keeps the name Moonbase gave it', () async {
      // Under the server's own title it is translated, whatever its case
      // (Moonbase's stock names are in sentence case).
      expect(
        await titleOf(
          'type:recently_added',
          () async => [keyed],
          stored: 'Recently Added',
        ),
        'Ajouts récents',
      );
      expect(
        await titleOf(
          'type:recently_added',
          () async => [keyed],
          stored: 'Recently added',
        ),
        'Ajouts récents',
      );
      expect(
        await titleOf('type:recently_added', () async => [keyed]),
        'stored title',
      );
    });

    test('follows a language picked after the row loaded', () async {
      final row = await rowOf('s1', () async => [keyed]);
      final english = await AppLocalizations.delegate.load(const Locale('en'));
      expect(localizeHomeRowTitle(row: row, l10n: english), 'Recently Added');
    });

    test('stays as stored when the server\'s rows can\'t be read', () async {
      expect(
        await titleOf('s1', () async => throw Exception('offline')),
        'stored title',
      );
      expect(await titleOf('s1', () async => []), 'stored title');
    });
  });

  test('a server without its own rows gives an empty row', () async {
    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(_MockItemsApi());

    final row = await RowDataSource(client).loadDynamicSection(
      rowId: 'r',
      section: 's1',
      title: 'Trending',
      serverId: 'srv',
      pluginSource: HomeSectionPluginSource.server,
    );
    expect(row.items, isEmpty);
    expect(row.rowType, HomeRowType.pluginDynamic);
  });

  test('server rows keep their source and identity when saved', () {
    final cfg = HomeSectionConfig.pluginDynamic(
      serverId: 'https://silo.example',
      pluginSection: '146552064657409332',
      pluginDisplayText: 'Trending on Server',
      pluginSource: HomeSectionPluginSource.server,
      enabled: false,
    );
    final back = HomeSectionConfig.fromJson(cfg.toJson());
    expect(back.pluginSource, HomeSectionPluginSource.server);
    expect(back.stableId, cfg.stableId);
    expect(
      cfg.stableId,
      'pluginDynamic:server:https://silo.example:146552064657409332:',
    );
  });
}
