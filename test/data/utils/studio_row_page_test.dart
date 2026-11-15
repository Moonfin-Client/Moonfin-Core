import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/aggregated_item_sort.dart';
import 'package:moonfin/data/utils/studio_row_page.dart';
import 'package:server_core/server_core.dart';

class _ItemsApi extends Mock implements ItemsApi {}

var _nextKey = 0;

void main() {
  // A server holding [total] studios that, like Jellyfin, lists them by name
  // whatever sort it is asked for. Each call records the page and the sort.
  ({
    List<(int, int)> calls,
    List<String> sorts,
    Future<Map<String, dynamic>> Function(int, int, String, String) fetch,
  })
  server(int total) {
    final calls = <(int, int)>[];
    final sorts = <String>[];
    Future<Map<String, dynamic>> fetch(
      int startIndex,
      int limit,
      String sortBy,
      String sortOrder,
    ) async {
      calls.add((startIndex, limit));
      sorts.add('$sortBy $sortOrder');
      final end = (startIndex + limit).clamp(0, total);
      return {
        'Items': [
          for (var i = startIndex; i < end; i++) {'Id': '$i'},
        ],
        'TotalRecordCount': total,
      };
    }

    return (calls: calls, sorts: sorts, fetch: fetch);
  }

  Future<List<(int, int)>> pagesRead(
    int total, {
    required String sortBy,
    String sortOrder = 'Ascending',
    bool serverSorts = false,
    List<String>? sorts,
  }) async {
    final s = server(total);
    await fetchStudioRowPage(
      s.fetch,
      sortBy: sortBy,
      sortOrder: sortOrder,
      limit: 15,
      pageSize: 200,
      serverSorts: serverSorts,
      cacheKey: '${_nextKey++}',
    );
    sorts?.addAll(s.sorts);
    return s.calls;
  }

  test('name ascending reads just the row', () async {
    expect(await pagesRead(1000, sortBy: 'SortName'), [(0, 15)]);
  });

  test('name descending reads the end of the list', () async {
    expect(await pagesRead(1000, sortBy: 'SortName', sortOrder: 'Descending'), [
      (0, 200),
      (800, 200),
    ]);
  });

  test('random reads a page from anywhere in the list', () async {
    final calls = await pagesRead(1000, sortBy: 'Random');
    expect(calls, hasLength(2));
    expect(calls.last.$1, inInclusiveRange(0, 800));
    expect(calls.last.$2, 200);
  });

  const everyPage = [(0, 200), (200, 200), (400, 200), (600, 200), (800, 200)];

  test('date added reads every page', () async {
    expect(await pagesRead(1000, sortBy: 'DateCreated,SortName'), everyPage);
  });

  test('item count keeps the whole list for a day per server and user', () async {
    final s = server(1000);
    Future<Map<String, dynamic>> read(String key) => fetchStudioRowPage(
      s.fetch,
      sortBy: 'ItemCount',
      sortOrder: 'Descending',
      limit: 15,
      pageSize: 200,
      serverSorts: false,
      cacheKey: key,
    );
    final start = DateTime(2026, 11, 15);

    final all = await withClock(Clock.fixed(start), () => read('a|me'));
    expect((all['Items'] as List).last, {'Id': '999'});
    await withClock(
      Clock.fixed(start.add(const Duration(hours: 23))),
      () => read('a|me'),
    );
    expect(s.calls, hasLength(5));

    await withClock(Clock.fixed(start), () => read('b|me'));
    expect(s.calls, hasLength(10));

    await withClock(
      Clock.fixed(start.add(const Duration(days: 1))),
      () => read('a|me'),
    );
    expect(s.calls, hasLength(15));
  });

  test('a list that fits in one page is read once', () async {
    expect(await pagesRead(120, sortBy: 'Random'), [(0, 200)]);
    expect(await pagesRead(120, sortBy: 'SortName', sortOrder: 'Descending'), [
      (0, 200),
    ]);
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

  test('a server that sorts gets the sort and serves just the row', () async {
    final sorts = <String>[];
    expect(
      await pagesRead(
        1000,
        sortBy: 'DateCreated,SortName',
        sortOrder: 'Descending',
        serverSorts: true,
        sorts: sorts,
      ),
      [(0, 15)],
    );
    expect(sorts, ['DateCreated,SortName Descending']);
  });

  test('item count reads by name even from a server that sorts', () async {
    final sorts = <String>[];
    expect(
      await pagesRead(
        1000,
        sortBy: 'ItemCount',
        sortOrder: 'Descending',
        serverSorts: true,
        sorts: sorts,
      ),
      everyPage,
    );
    expect(sorts.toSet(), {'SortName Ascending'});
  });

  test('last played reads by name even from a server that sorts', () async {
    final sorts = <String>[];
    expect(
      await pagesRead(
        1000,
        sortBy: 'DatePlayed,SortName',
        sortOrder: 'Descending',
        serverSorts: true,
        sorts: sorts,
      ),
      everyPage,
    );
    expect(sorts.toSet(), {'SortName Ascending'});
  });
}
