import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

/// Personal collections, a Movies library (`1`) with curated ones and a TV
/// library (`3`) whose list can't be read.
FixtureServer _server() => FixtureServer({
  '/api/v2/user/libraries': FixtureServer.file('silo/user_libraries.json'),
  '/api/v2/collections': siloJson({
    'items': [
      {'id': 'p-2', 'name': 'later', 'item_count': 3},
      {'id': 'p-1', 'name': 'Date night', 'item_count': 12},
    ],
  }),
  '/api/v2/library/1/collections': siloJson({
    'library_id': '1',
    'collections': [
      {'id': 'c-fast', 'title': 'Fast & Furious', 'item_count': 10},
      {'id': 'c-bond', 'title': 'Bond', 'item_count': 25},
    ],
  }),
  '/api/v2/library/3/collections': (_) =>
      FixtureServer.problem(503, 'unavailable', 'try later'),
});

/// What Home's Collections row asks (`RowDataSource.loadCollections`).
Future<List<String>> _row({String order = 'Ascending', String? sortBy}) async {
  final page = await siloTestClient(_server()).itemsApi.getItems(
    includeItemTypes: ['BoxSet'],
    sortBy: sortBy ?? 'SortName',
    sortOrder: order,
    recursive: true,
    limit: 20,
  );
  return [
    for (final box in (page['Items'] as List).cast<Map<String, dynamic>>())
      box['Name'] as String,
  ];
}

void main() {
  test(
    'every collection: personal ones and each library\'s, by name',
    () async {
      // The TV library's list failed and is skipped.
      expect(await _row(), ['Bond', 'Date night', 'Fast & Furious', 'later']);
      expect(await _row(order: 'Descending'), [
        'later',
        'Fast & Furious',
        'Date night',
        'Bond',
      ]);
    },
  );

  test('other sorts keep Silo\'s order: personal, then by library', () async {
    expect(await _row(sortBy: 'DateCreated'), [
      'later',
      'Date night',
      'Fast & Furious',
      'Bond',
    ]);
  });

  test('ids say where each came from', () async {
    final page = await siloTestClient(
      _server(),
    ).itemsApi.getItems(includeItemTypes: ['BoxSet'], sortBy: 'SortName');
    final boxes = (page['Items'] as List).cast<Map<String, dynamic>>();
    final bond = boxes.firstWhere((b) => b['Name'] == 'Bond');
    expect(bond['ParentId'], '1');
    expect(bond['Id'], startsWith('silo-libcollection:1:'));
    final date = boxes.firstWhere((b) => b['Name'] == 'Date night');
    expect(date['Id'], startsWith('silo-collection:'));
    expect(page['TotalRecordCount'], 4);
  });
}
