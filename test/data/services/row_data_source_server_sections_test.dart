import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:server_core/server_core.dart';

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
