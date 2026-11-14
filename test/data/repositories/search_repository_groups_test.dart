import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/search_repository.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  late _MockClient client;
  late _MockItemsApi itemsApi;

  const groups = [
    ['Movie'],
    ['Series'],
    ['Episode'],
    ['Program'],
    ['Folder', 'CollectionFolder', 'UserView'],
  ];

  List<Map<String, dynamic>> items(String type, int count) => [
    for (var i = 0; i < count; i++) {'Id': '$type$i', 'Type': type},
  ];

  Future<Map<String, dynamic>> searchFor(
    List<String>? types, {
    List<String>? exclude,
  }) => itemsApi.getItems(
    searchTerm: 'harry potter',
    parentId: any(named: 'parentId'),
    includeItemTypes: types,
    excludeItemTypes: exclude,
    limit: any(named: 'limit'),
    recursive: any(named: 'recursive'),
    fields: any(named: 'fields'),
    studios: any(named: 'studios'),
  );

  setUp(() {
    client = _MockClient();
    itemsApi = _MockItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(
      () => searchFor(
        any(named: 'includeItemTypes'),
        exclude: any(named: 'excludeItemTypes'),
      ),
    ).thenAnswer((_) async => {'Items': []});
  });

  Future<Map<String?, int>> searchGroups() async {
    final found = await SearchRepository(client)
        .searchGroups('harry potter', groups, perGroup: 24, limit: 240);
    return {
      for (final type in {for (final item in found) item.type})
        type: found.where((item) => item.type == type).length,
    };
  }

  test(
    'Jellyfin leaves the types search has no group for off the page',
    () async {
      when(() => searchFor(null, exclude: any(named: 'excludeItemTypes')))
          .thenAnswer((_) async => {'Items': items('Movie', 8)});

      expect(await searchGroups(), {'Movie': 8});
      final excluded = verify(
        () => searchFor(
          any(named: 'includeItemTypes'),
          exclude: captureAny(named: 'excludeItemTypes'),
        ),
      ).captured;
      expect(excluded, [
        ['Person', 'Studio', 'Genre', 'MusicGenre', 'TvChannel'],
      ]);
    },
  );

  test('a full page searches each group it left short again', () async {
    when(() => searchFor(null, exclude: any(named: 'excludeItemTypes')))
        .thenAnswer(
          (_) async => {
            'Items': [
              ...items('Episode', 238),
              ...items('Program', 1),
              ...items('Movie', 1),
            ],
          },
        );
    when(() => searchFor(['Movie']))
        .thenAnswer((_) async => {'Items': items('Movie', 3)});
    when(() => searchFor(['Series']))
        .thenAnswer((_) async => {'Items': items('Series', 1)});
    when(() => searchFor(['Folder', 'CollectionFolder', 'UserView']))
        .thenThrow(Exception('down'));

    // Jellyfin finds no programs when asked for them by type, so the one on
    // the page stays, and the movie it already had isn't counted twice. A
    // refill that fails leaves the rest.
    expect(await searchGroups(), {
      'Episode': 238,
      'Program': 1,
      'Movie': 3,
      'Series': 1,
    });
    verifyNever(() => searchFor(['Episode']));
    verify(() => searchFor(['Folder', 'CollectionFolder', 'UserView']))
        .called(1);
  });

  for (final type in [ServerType.emby, ServerType.plex, ServerType.silo]) {
    test(
      '${type.name} keeps its one search even when the page is full',
      () async {
        when(() => client.serverType).thenReturn(type);
        when(() => searchFor(null))
            .thenAnswer((_) async => {'Items': items('Episode', 240)});

        expect(await searchGroups(), {'Episode': 240});
        final asked = verify(
          () => searchFor(
            captureAny(named: 'includeItemTypes'),
            exclude: captureAny(named: 'excludeItemTypes'),
          ),
        ).captured;
        expect(asked, [null, null]);
      },
    );
  }
}
