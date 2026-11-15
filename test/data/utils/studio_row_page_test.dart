import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/aggregated_item_sort.dart';
import 'package:moonfin/data/utils/studio_row_page.dart';
import 'package:server_core/server_core.dart';

class _ItemsApi extends Mock implements ItemsApi {}

void main() {
  // A server holding [total] studios that, like Jellyfin, lists them by name.
  // Each call records the page it was asked for.
  Future<List<(int, int)>> pagesRead(
    int total, {
    required String sortBy,
    String sortOrder = 'Ascending',
  }) async {
    final calls = <(int, int)>[];
    await fetchStudioRowPage(
      (startIndex, limit) async {
        calls.add((startIndex, limit));
        return {'Items': const [], 'TotalRecordCount': total};
      },
      sortBy: sortBy,
      sortOrder: sortOrder,
      limit: 15,
      pageSize: 200,
    );
    return calls;
  }

  test('name ascending reads just the row', () async {
    expect(await pagesRead(1000, sortBy: 'SortName'), [(0, 15)]);
  });

  test('name descending reads the end of the list', () async {
    expect(await pagesRead(1000, sortBy: 'SortName', sortOrder: 'Descending'), [
      (0, 15),
      (985, 15),
    ]);
  });

  test('random reads a page from anywhere in the list', () async {
    final calls = await pagesRead(1000, sortBy: 'Random');
    expect(calls.first, (0, 200));
    expect(calls, hasLength(2));
    expect(calls.last.$1, inInclusiveRange(0, 800));
    expect(calls.last.$2, 200);
  });

  test('a list that fits is read once', () async {
    expect(await pagesRead(120, sortBy: 'Random'), [(0, 200)]);
    expect(await pagesRead(10, sortBy: 'SortName', sortOrder: 'Descending'), [
      (0, 15),
    ]);
  });

  test('with nothing picked, only name and random order apply', () {
    expect(unpickedStudioSort('SortName', 'Descending'), (
      'SortName',
      'Descending',
    ));
    expect(unpickedStudioSort('Random', 'Ascending'), ('Random', 'Ascending'));
    expect(unpickedStudioSort('DateCreated,SortName', 'Descending'), (
      'SortName',
      'Ascending',
    ));
  });

  test('last watched dates each studio by its newest play', () async {
    final api = _ItemsApi();
    when(
      () => api.getItems(
        parentId: any(named: 'parentId'),
        recursive: any(named: 'recursive'),
        includeItemTypes: any(named: 'includeItemTypes'),
        sortBy: any(named: 'sortBy'),
        sortOrder: any(named: 'sortOrder'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
      ),
    ).thenAnswer(
      (_) async => {
        'Items': [
          {
            'Type': 'Episode',
            'SeriesStudio': 'HBO',
            'UserData': {'LastPlayedDate': '2026-11-10T20:00:00Z'},
          },
          {
            'Type': 'Movie',
            'Studios': [
              {'Name': 'Pixar'},
              {'Name': 'HBO'},
            ],
            'UserData': {'LastPlayedDate': '2026-11-01T20:00:00Z'},
          },
          {
            'Type': 'Movie',
            'Studios': [
              {'Name': 'A24'},
            ],
            'UserData': {},
          },
        ],
      },
    );

    final lastPlayed = await fetchStudioLastPlayed(api, parentId: 'movies');
    expect(
      verify(
        () => api.getItems(
          parentId: captureAny(named: 'parentId'),
          recursive: any(named: 'recursive'),
          includeItemTypes: any(named: 'includeItemTypes'),
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
        ),
      ).captured,
      ['movies'],
    );
    expect(lastPlayed, {
      'hbo': '2026-11-10T20:00:00Z',
      'pixar': '2026-11-01T20:00:00Z',
    });

    final studios = [
      for (final name in ['A24', 'HBO', 'Pixar'])
        <String, dynamic>{'Name': name},
    ];
    markStudiosLastPlayed(studios, lastPlayed);
    final sorted = sortAggregatedItems(
      [
        for (final s in studios)
          AggregatedItem(id: s['Name'] as String, serverId: 'srv', rawData: s),
      ],
      sortBy: 'DatePlayed,SortName',
      sortOrder: 'Descending',
    );
    expect(sorted.map((s) => s.name), ['HBO', 'Pixar', 'A24']);
  });
}
