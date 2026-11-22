import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

/// What a picked row's next page asks the server for: the parent and genres.
Future<List<Object?>> _pagedQuery(
  String rowId, {
  HomeRowType rowType = HomeRowType.collections,
  String serverId = 'srv1',
}) async {
  final itemsApi = _MockItemsApi();
  when(
    () => itemsApi.getItems(
      parentId: any(named: 'parentId'),
      includeItemTypes: any(named: 'includeItemTypes'),
      excludeItemTypes: any(named: 'excludeItemTypes'),
      genreIds: any(named: 'genreIds'),
      filters: any(named: 'filters'),
      sortBy: any(named: 'sortBy'),
      sortOrder: any(named: 'sortOrder'),
      recursive: any(named: 'recursive'),
      startIndex: any(named: 'startIndex'),
      limit: any(named: 'limit'),
      isFavorite: any(named: 'isFavorite'),
      fields: any(named: 'fields'),
      enableImageTypes: any(named: 'enableImageTypes'),
      imageTypeLimit: any(named: 'imageTypeLimit'),
    ),
  ).thenAnswer((_) async => {'Items': <dynamic>[], 'TotalRecordCount': 0});
  final client = _MockClient();
  when(() => client.itemsApi).thenReturn(itemsApi);

  await RowDataSource(client).loadMore(
    row: HomeRow(
      id: rowId,
      title: 'Pinned',
      rowType: rowType,
      items: [AggregatedItem(id: 'a', serverId: serverId, rawData: const {})],
      totalCount: 50,
    ),
    serverId: serverId,
  );

  return verify(
    () => itemsApi.getItems(
      parentId: captureAny(named: 'parentId'),
      includeItemTypes: any(named: 'includeItemTypes'),
      excludeItemTypes: any(named: 'excludeItemTypes'),
      genreIds: captureAny(named: 'genreIds'),
      filters: any(named: 'filters'),
      sortBy: any(named: 'sortBy'),
      sortOrder: any(named: 'sortOrder'),
      recursive: any(named: 'recursive'),
      startIndex: any(named: 'startIndex'),
      limit: any(named: 'limit'),
      isFavorite: any(named: 'isFavorite'),
      fields: any(named: 'fields'),
      enableImageTypes: any(named: 'enableImageTypes'),
      imageTypeLimit: any(named: 'imageTypeLimit'),
    ),
  ).captured;
}

Future<String?> _pagedParentId(String rowId, {String serverId = 'srv1'}) async =>
    (await _pagedQuery(rowId, serverId: serverId)).first as String?;

Future<String?> _pagedGenreId(String rowId) async {
  final genreIds =
      (await _pagedQuery(rowId, rowType: HomeRowType.genres))[1] as List?;
  return genreIds?.single as String?;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() => GetIt.instance.reset());

  test('a pinned collection pages through its own id', () async {
    expect(
      await _pagedParentId('pluginDynamic:collections:srv1:collection:box-7'),
      'box-7',
    );
  });

  test('a Silo collection id keeps its colons', () async {
    expect(
      await _pagedParentId(
        'pluginDynamic:collections:srv1:collection:silo-libcollection:1:42',
      ),
      'silo-libcollection:1:42',
    );
  });

  test('a row saved under another address of the server keeps the id', () async {
    // Moonbase stamps the address it was opened at, which isn't how this
    // client reaches the server.
    expect(
      await _pagedParentId(
        'pluginDynamic:collections:http://192.168.1.5:8090:collection:'
        'silo-libcollection:1:42',
        serverId: 'https://silo.example.com',
      ),
      'silo-libcollection:1:42',
    );
  });

  test('a genre row pages through the whole Silo genre id', () async {
    expect(
      await _pagedGenreId(
        'pluginDynamic:genres:http://silo:8090:genre:silo-genre:Drama',
      ),
      'silo-genre:Drama',
    );
  });
}
