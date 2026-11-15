import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
      'Descending',
    ));
  });

  test('a picked studio sent without counts is counted on its own', () async {
    final api = _ItemsApi();
    when(
      () => api.getItems(
        studios: any(named: 'studios'),
        includeItemTypes: any(named: 'includeItemTypes'),
        recursive: any(named: 'recursive'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((invocation) async {
      final name = (invocation.namedArguments[#studios] as List).single;
      return {'Items': const [], 'TotalRecordCount': name == 'Toho' ? 56 : 3};
    });
    final studios = [
      <String, dynamic>{'Name': 'Toho'},
      <String, dynamic>{'Name': 'A24'},
      <String, dynamic>{'Name': 'HBO', 'MovieCount': 4, 'SeriesCount': 2},
    ];

    await countStudios(api, studios);

    expect(studios[0]['ChildCount'], 56);
    expect(studios[1]['ChildCount'], 3);
    expect(studios[2].containsKey('ChildCount'), isFalse);
  });
}
