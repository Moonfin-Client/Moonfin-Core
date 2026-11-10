import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

AggregatedItem _outside(String id, {String? localItemId, double? popularity}) =>
    AggregatedItem(
      id: id,
      serverId: 'seerr',
      rawData: {
        ...ImdbExternalListItem(
          imdbId: id,
          title: 'Outside $id',
          type: 'Movie',
          localItemId: localItemId,
        ).cardData,
        'Popularity': ?popularity,
        'UserRating': '4.5',
        'ShowUserRatings': true,
      },
    );

void main() {
  late _MockItemsApi api;
  late RowDataSource dataSource;

  setUp(() {
    api = _MockItemsApi();
    final client = _MockClient();
    when(() => client.itemsApi).thenReturn(api);
    dataSource = RowDataSource(client);
  });

  void answerWith(List<Map<String, dynamic>> items) {
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        )).thenAnswer((_) async => {'Items': items});
  }

  test('matched entries become the library items, in place', () async {
    answerWith([
      {'Id': 'abc123', 'Name': 'Library Movie', 'Type': 'Movie', 'ImageTags': {'Primary': 'tag'}},
    ]);

    final items = await dataSource.withLibraryCopies('srv', [
      _outside('tt1'),
      _outside('tt2', localItemId: 'abc123', popularity: 42),
      _outside('tt3'),
    ]);

    expect(items.map((i) => i.id), ['tt1', 'abc123', 'tt3']);
    final local = items[1];
    expect(local.serverId, 'srv');
    expect(local.name, 'Library Movie');
    expect(local.rawData['ImageTags'], {'Primary': 'tag'});
    // The list's own sort and rating fields come along.
    expect(local.rawData['Popularity'], 42);
    expect(local.rawData['UserRating'], '4.5');
    expect(local.rawData['ShowUserRatings'], true);
    expect(items[0].serverId, 'seerr');
  });

  test('one request covers the row and asks only for matched ids', () async {
    answerWith([]);

    await dataSource.withLibraryCopies('srv', [
      _outside('tt1', localItemId: 'a'),
      _outside('tt2', localItemId: 'b'),
      _outside('tt3', localItemId: 'a'),
    ]);

    final captured = verify(() => api.getItems(
          ids: captureAny(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).captured;
    expect(captured, hasLength(1));
    expect(captured.single, unorderedEquals(['a', 'b']));
  });

  test('ids match with or without dashes', () async {
    answerWith([
      {'Id': '8ef1d085-9563-2007-df0d-8f285cba3b50', 'Name': 'Obsession', 'Type': 'Movie'},
    ]);

    final items = await dataSource.withLibraryCopies('srv', [
      _outside('tt1', localItemId: '8EF1D08595632007DF0D8F285CBA3B50'),
    ]);

    expect(items.single.serverId, 'srv');
    expect(items.single.name, 'Obsession');
  });

  test('a row without matches asks the server nothing', () async {
    final row = [_outside('tt1'), _outside('tt2')];

    expect(await dataSource.withLibraryCopies('srv', row), same(row));
    verifyNever(() => api.getItems(ids: any(named: 'ids')));
  });

  test('a library copy that does not come back leaves the entry outside', () async {
    answerWith([]);

    final items = await dataSource.withLibraryCopies('srv', [
      _outside('tt1', localItemId: 'gone'),
    ]);

    expect(items.single.id, 'tt1');
    expect(items.single.serverId, 'seerr');
  });

  test('a failed request keeps the row as it was', () async {
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        )).thenThrow(Exception('offline'));
    final row = [_outside('tt1', localItemId: 'a')];

    expect(await dataSource.withLibraryCopies('srv', row), same(row));
  });

  test('a long chart is looked up in batches of a hundred', () async {
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        )).thenAnswer((call) async => {
          'Items': [
            for (final id in call.namedArguments[#ids] as List<String>)
              {'Id': id, 'Name': 'Library $id', 'Type': 'Movie'},
          ],
        });

    final items = await dataSource.withLibraryCopies('srv', [
      for (var i = 0; i < 250; i++) _outside('tt$i', localItemId: 'id$i'),
    ]);

    final batches = verify(() => api.getItems(
          ids: captureAny(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).captured.cast<List<String>>();
    expect(batches.map((b) => b.length), [100, 100, 50]);
    expect(batches.expand((b) => b).toSet(), hasLength(250));
    expect(items.map((i) => i.serverId).toSet(), {'srv'});
    expect(items.map((i) => i.id), [for (var i = 0; i < 250; i++) 'id$i']);
  });

  test('a failed batch leaves only its own entries outside', () async {
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        )).thenAnswer((call) async {
      final ids = call.namedArguments[#ids] as List<String>;
      if (ids.contains('id0')) throw Exception('request line too long');
      return {
        'Items': [
          for (final id in ids) {'Id': id, 'Name': 'Library $id', 'Type': 'Movie'},
        ],
      };
    });

    final items = await dataSource.withLibraryCopies('srv', [
      for (var i = 0; i < 150; i++) _outside('tt$i', localItemId: 'id$i'),
    ]);

    expect(items.take(100).map((i) => i.serverId).toSet(), {'seerr'});
    expect(items.skip(100).map((i) => i.serverId).toSet(), {'srv'});
  });

  group('list entries', () {
    test('carry the library id through the device cache', () {
      final item = ImdbExternalListItem(imdbId: 'tt1', title: 'T', type: 'Movie', localItemId: 'abc');
      final back = ImdbExternalListItem.fromJson(item.toJson());

      expect(back.localItemId, 'abc');
      expect(back.cardData['LocalItemId'], 'abc');
    });

    test('without a library id leave it out of the card and the cache', () {
      final item = ImdbExternalListItem(imdbId: 'tt1', title: 'T', type: 'Movie');

      expect(item.cardData.containsKey('LocalItemId'), isFalse);
      expect(item.toJson().containsKey('localItemId'), isFalse);
      expect(ImdbExternalListItem.fromJson(item.toJson()).localItemId, isNull);
    });
  });
}
