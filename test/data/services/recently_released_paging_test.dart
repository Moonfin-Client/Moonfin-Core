import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockUserViewsApi extends Mock implements UserViewsApi {}

Map<String, dynamic> _films(int count) => {
  'Items': [
    for (var i = 0; i < count; i++)
      {'Id': 'm$i', 'Name': 'Film $i', 'Type': 'Movie'},
  ],
  'TotalRecordCount': count,
};

void main() {
  late _MockItemsApi items;
  late _MockClient client;

  setUp(() {
    items = _MockItemsApi();
    final views = _MockUserViewsApi();
    when(() => views.getUserViews()).thenAnswer(
      (_) async => {
        'Items': [
          {'Id': '1', 'Name': 'Movies', 'CollectionType': 'movies'},
        ],
      },
    );
    client = _MockClient();
    when(() => client.itemsApi).thenReturn(items);
    when(() => client.userViewsApi).thenReturn(views);
  });

  HomeRow firstPage() => HomeRow(
    id: 'recently_released_1',
    title: 'Recently Released in Movies',
    rowType: HomeRowType.recentlyReleased,
    items: [
      for (var i = 0; i < 15; i++)
        AggregatedItem(id: 'm$i', serverId: 'srv', rawData: {'Id': 'm$i'}),
    ],
    totalCount: 100,
  );

  test('a library\'s Recently Released row loads more when scrolled', () async {
    when(
      () => items.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: any(named: 'recursive'),
      ),
    ).thenAnswer((_) async => _films(30));

    final (loaded, total) = await RowDataSource(client)
        .loadMore(row: firstPage(), serverId: 'srv');

    final call = verify(
      () => items.getRecentlyReleasedItems(
        parentId: captureAny(named: 'parentId'),
        includeItemTypes: captureAny(named: 'includeItemTypes'),
        limit: captureAny(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: captureAny(named: 'recursive'),
      ),
    ).captured;
    // Captured in alphabetical order of the named arguments.
    expect(call, [
      true,
      '1',
      ['Movie'],
      30,
    ]);
    expect(loaded.map((i) => i.id), [for (var i = 0; i < 30; i++) 'm$i']);
    expect(total, 100, reason: 'more may follow');
  });

  test('the end of the list stops paging', () async {
    when(
      () => items.getRecentlyReleasedItems(
        parentId: any(named: 'parentId'),
        includeItemTypes: any(named: 'includeItemTypes'),
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImageTypes: any(named: 'enableImageTypes'),
        imageTypeLimit: any(named: 'imageTypeLimit'),
        recursive: any(named: 'recursive'),
      ),
    ).thenAnswer((_) async => _films(15));

    final (loaded, total) = await RowDataSource(client)
        .loadMore(row: firstPage(), serverId: 'srv');
    expect(loaded, hasLength(15));
    expect(total, 15);
  });
}
