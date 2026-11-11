import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/custom_external_lists_service.dart';
import 'package:moonfin/data/services/row_data_source.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

AggregatedItem _outside(
  String imdbId, {
  String tmdbId = '',
  String type = 'Movie',
  double? popularity,
}) =>
    AggregatedItem(
      id: imdbId.isNotEmpty ? imdbId : tmdbId,
      serverId: 'seerr',
      rawData: {
        ...ImdbExternalListItem(
          imdbId: imdbId,
          tmdbId: tmdbId,
          title: 'Outside $imdbId',
          type: type,
        ).cardData,
        'Popularity': ?popularity,
        'UserRating': '4.5',
        'ShowUserRatings': true,
      },
    );

Map<String, dynamic> _library(
  String id, {
  String? imdb,
  String? tmdb,
  String type = 'Movie',
}) =>
    {
      'Id': id,
      'Name': 'Library $id',
      'Type': type,
      'ProviderIds': {'Imdb': ?imdb, 'Tmdb': ?tmdb},
    };

void main() {
  late _MockItemsApi api;
  late _MockClient client;
  late RowDataSource dataSource;
  late List<Map<String, dynamic>> library;
  late int indexReads;
  late bool indexFails;

  Future<Map<String, dynamic>> byId(Invocation call) async {
    final ids = call.namedArguments[#ids] as List<String>;
    return {
      'Items': [
        for (final item in library)
          if (ids.contains(item['Id'])) item,
      ],
    };
  }

  setUp(() {
    api = _MockItemsApi();
    client = _MockClient();
    when(() => client.itemsApi).thenReturn(api);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.baseUrl).thenReturn('https://jellyfin.test');
    when(() => client.userId).thenReturn('user1');
    dataSource = RowDataSource(client);
    library = [];
    indexReads = 0;
    indexFails = false;

    when(() => api.getItems(
          recursive: true,
          includeItemTypes: any(named: 'includeItemTypes'),
          fields: 'ProviderIds',
          imageTypeLimit: 0,
          startIndex: any(named: 'startIndex'),
          limit: any(named: 'limit'),
          enableTotalRecordCount: false,
        )).thenAnswer((call) async {
      indexReads++;
      if (indexFails) throw Exception('offline');
      final start = call.namedArguments[#startIndex] as int;
      final limit = call.namedArguments[#limit] as int;
      return {'Items': library.skip(start).take(limit).toList()};
    });
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).thenAnswer(byId);
  });

  test('owned titles become the library items, in place', () async {
    library = [_library('lib2', imdb: 'tt2', tmdb: '2')];

    final items = await dataSource.withLibraryCopies('srv', [
      _outside('tt1'),
      _outside('tt2', popularity: 42),
      _outside('tt3'),
    ]);

    expect(items.map((i) => i.id), ['tt1', 'lib2', 'tt3']);
    final local = items[1];
    expect(local.serverId, 'srv');
    expect(local.name, 'Library lib2');
    expect(local.rawData['Popularity'], 42);
    expect(local.rawData['UserRating'], '4.5');
    expect(local.rawData['ShowUserRatings'], true);
    expect(items[0].serverId, 'seerr');
  });

  test('a TMDB id only matches a title of the same type', () async {
    library = [_library('show', tmdb: '603', type: 'Series')];

    final items = await dataSource.withLibraryCopies('srv', [
      _outside('', tmdbId: '603'),
      _outside('', tmdbId: '603', type: 'Series'),
    ]);

    expect(items.map((i) => i.serverId), ['seerr', 'srv']);
  });

  test('IMDb ids match whatever case the server writes them in', () async {
    library = [
      {'Id': 'lib1', 'Name': 'Library lib1', 'Type': 'Movie', 'ProviderIds': {'imdb': 'TT1'}},
    ];

    final items = await dataSource.withLibraryCopies('srv', [_outside('tt1')]);

    expect(items.single.id, 'lib1');
  });

  test('rows loading together share one read of the library', () async {
    library = [_library('lib1', imdb: 'tt1')];

    await Future.wait([
      dataSource.withLibraryCopies('srv', [_outside('tt1')]),
      dataSource.withLibraryCopies('srv', [_outside('tt1')]),
    ]);
    await dataSource.withLibraryCopies('srv', [_outside('tt1')]);

    expect(indexReads, 1);
  });

  test('the library is read a page at a time', () async {
    library = [for (var i = 0; i < 1500; i++) _library('lib$i', imdb: 'tt$i')];

    final items = await dataSource.withLibraryCopies('srv', [_outside('tt1499')]);

    expect(indexReads, 2);
    expect(items.single.id, 'lib1499');
  });

  test('another user gets their own read of the library', () async {
    library = [_library('lib1', imdb: 'tt1')];

    await dataSource.withLibraryCopies('srv', [_outside('tt1')]);
    when(() => client.userId).thenReturn('user2');
    await dataSource.withLibraryCopies('srv', [_outside('tt1')]);

    expect(indexReads, 2);
  });

  test('a failed read keeps the row as it was and is tried again next time', () async {
    library = [_library('lib1', imdb: 'tt1')];
    indexFails = true;
    final row = [_outside('tt1')];

    expect(await dataSource.withLibraryCopies('srv', row), same(row));

    indexFails = false;
    final items = await dataSource.withLibraryCopies('srv', row);
    expect(indexReads, 2);
    expect(items.single.id, 'lib1');
  });

  test('a long chart is fetched in batches of a hundred', () async {
    library = [for (var i = 0; i < 250; i++) _library('lib$i', imdb: 'tt$i')];

    final items = await dataSource.withLibraryCopies('srv', [
      for (var i = 0; i < 250; i++) _outside('tt$i'),
    ]);

    final batches = verify(() => api.getItems(
          ids: captureAny(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).captured.cast<List<String>>();
    expect(batches.map((b) => b.length), [100, 100, 50]);
    expect(items.map((i) => i.id), [for (var i = 0; i < 250; i++) 'lib$i']);
  });

  test('a failed batch leaves only its own entries outside', () async {
    library = [for (var i = 0; i < 150; i++) _library('lib$i', imdb: 'tt$i')];
    when(() => api.getItems(
          ids: any(named: 'ids'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).thenAnswer((call) async {
      if ((call.namedArguments[#ids] as List<String>).contains('lib0')) {
        throw Exception('request line too long');
      }
      return byId(call);
    });

    final items = await dataSource.withLibraryCopies('srv', [
      for (var i = 0; i < 150; i++) _outside('tt$i'),
    ]);

    expect(items.take(100).map((i) => i.serverId).toSet(), {'seerr'});
    expect(items.skip(100).map((i) => i.serverId).toSet(), {'srv'});
  });

  test('Emby is asked by provider id in batches and never read whole', () async {
    when(() => client.serverType).thenReturn(ServerType.emby);
    when(() => api.getItems(
          recursive: true,
          includeItemTypes: any(named: 'includeItemTypes'),
          anyProviderIdEquals: any(named: 'anyProviderIdEquals'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).thenAnswer((call) async {
      final tokens = (call.namedArguments[#anyProviderIdEquals] as String).split(',');
      return {
        'Items': [
          for (final token in tokens)
            if (token.startsWith('imdb.')) _library('lib$token', imdb: token.substring(5)),
        ],
      };
    });

    final items = await dataSource.withLibraryCopies('srv', [
      for (var i = 0; i < 60; i++) _outside('tt$i', tmdbId: '$i'),
    ]);

    final batches = verify(() => api.getItems(
          recursive: true,
          includeItemTypes: any(named: 'includeItemTypes'),
          anyProviderIdEquals: captureAny(named: 'anyProviderIdEquals'),
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: false,
        )).captured.cast<String>();
    expect(batches.map((b) => b.split(',').length), [100, 20]);
    expect(batches.first.split(','), containsAll(['tmdb.0', 'imdb.tt0']));
    expect(indexReads, 0);
    expect(items.map((i) => i.serverId).toSet(), {'srv'});
  });

  test('Plex is left as it was, without asking the server', () async {
    when(() => client.serverType).thenReturn(ServerType.plex);
    final row = [_outside('tt1')];

    expect(await dataSource.withLibraryCopies('srv', row), same(row));
    verifyZeroInteractions(api);
  });

  test('a row without ids asks the server nothing', () async {
    final row = [
      AggregatedItem(id: 'x', serverId: 'seerr', rawData: const {'Name': 'No ids', 'Type': 'Movie'}),
    ];

    expect(await dataSource.withLibraryCopies('srv', row), same(row));
    verifyZeroInteractions(api);
  });
}
