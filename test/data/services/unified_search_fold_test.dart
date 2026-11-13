import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_search_fold.dart';

AggregatedItem _item(
  String serverId,
  String id,
  String name, {
  String type = 'Movie',
  Map<String, String>? ids,
  bool played = false,
  int positionTicks = 0,
  bool favorite = false,
}) => AggregatedItem(
  id: id,
  serverId: serverId,
  rawData: {
    'Id': id,
    'Name': name,
    'Type': type,
    'ProviderIds': ?ids,
    'UserData': {
      'Played': played,
      'PlaybackPositionTicks': positionTicks,
      'IsFavorite': favorite,
    },
  },
);

const _servers = [
  UnifiedServerInfo(id: 'a', name: 'Server a'),
  UnifiedServerInfo(id: 'b', name: 'Server b'),
];

List<String> _keys(List<AggregatedItem> items) => [
  for (final item in items) '${item.serverId}:${item.id}',
];

void main() {
  test('a title two servers hold becomes one result listing both copies', () {
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(_keys(folded), ['a:a1']);
    expect(folded.single.rawData[unifiedServerIdKey], 'a');
    final copies = unifiedCopiesOf(folded.single.rawData);
    expect(
      [
        for (final copy in copies)
          (copy.serverId, copy.itemId, copy.serverName),
      ],
      [('a', 'a1', 'Server a'), ('b', 'b1', 'Server b')],
    );
  });

  test('servers that know a title by different ids still fold', () {
    // Emby and Jellyfin spell the provider differently, and one of them
    // only knows the IMDb id.
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001', 'Imdb': 'tt9000003'}),
      _item('b', 'b1', 'Altovar', ids: {'IMDB': 'tt9000003'}),
    ], _servers);

    expect(_keys(folded), ['a:a1']);
    expect(unifiedCopiesOf(folded.single.rawData).length, 2);
  });

  test('a folded title stands where its first copy stood', () {
    final folded = foldSharedTitles([
      _item('a', 'a2', 'Hodrimel', ids: {'Tmdb': '1002'}),
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('b', 'b3', 'Rusquin', ids: {'Tmdb': '1007'}),
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(_keys(folded), ['a:a2', 'a:a1', 'b:b3']);
  });

  test('the copy shown follows the merged library\'s rule', () {
    final copies = [
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}),
    ];

    // The server listed first, which is the one being browsed.
    expect(_keys(foldSharedTitles(copies, _servers)), ['a:a1']);
    expect(_keys(foldSharedTitles(copies, _servers.reversed.toList())), [
      'b:b1',
    ]);

    // A copy the viewer is part way through is shown before the first
    // server's copy.
    final resumed = foldSharedTitles([
      copies.first,
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}, positionTicks: 500),
    ], _servers);
    expect(_keys(resumed), ['b:b1']);
  });

  test('a title watched or a favorite on one server shows as such on the '
      'card', () {
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      _item(
        'b',
        'b1',
        'Altovar',
        ids: {'Tmdb': '1001'},
        played: true,
        favorite: true,
      ),
    ], _servers).single;

    expect(folded.isPlayed, isTrue);
    expect(folded.isFavorite, isTrue);
  });

  test('titles without an external id are never folded', () {
    final items = [
      _item('a', 'a1', 'Altovar'),
      _item('b', 'b1', 'Altovar'),
      _item('a', 'a2', 'Hodrimel', ids: {}),
      _item('b', 'b2', 'Hodrimel', ids: {'Tmdb': ''}),
    ];

    final folded = foldSharedTitles(items, _servers);

    expect(folded, same(items));
  });

  test('a movie and a series sharing an id are two titles', () {
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Fendral', ids: {'Tmdb': '1009'}),
      _item('b', 'b1', 'Fendral', type: 'Series', ids: {'Tmdb': '1009'}),
    ], _servers);

    expect(_keys(folded), ['a:a1', 'b:b1']);
    expect(unifiedCopiesOf(folded.first.rawData).length, 0);
  });

  test('only movies and series fold', () {
    final items = [
      for (final type in [
        'Episode',
        'Season',
        'MusicAlbum',
        'BoxSet',
        'Person',
      ])
        for (final server in ['a', 'b'])
          _item(server, '$server-$type', type, type: type, ids: {'Tmdb': '1'}),
    ];

    final folded = foldSharedTitles(items, _servers);

    expect(_keys(folded), _keys(items));
    expect(
      folded.every((item) => unifiedCopiesOf(item.rawData).isEmpty),
      isTrue,
    );
  });

  test('series fold like movies, and never with them', () {
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Dastrel', type: 'Series', ids: {'Tvdb': '1011'}),
      _item('a', 'a2', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('b', 'b1', 'Dastrel', type: 'Series', ids: {'Tvdb': '1011'}),
      _item('b', 'b2', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(_keys(folded), ['a:a1', 'a:a2']);
    expect(unifiedCopiesOf(folded[0].rawData).length, 2);
    expect(unifiedCopiesOf(folded[1].rawData).length, 2);
  });

  test('results of a server missing from the server list are left '
      'unfolded', () {
    final plex = _item('plex', 'p1', 'Altovar', ids: {'Tmdb': '1001'});
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      plex,
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(_keys(folded), ['a:a1', 'plex:p1']);
    expect(folded[1], same(plex));
    expect(unifiedCopiesOf(folded[0].rawData).map((copy) => copy.serverId), [
      'a',
      'b',
    ]);
  });

  test('a title found on one server only is returned as the same object', () {
    final otherMovie = _item('a', 'a2', 'Hodrimel', ids: {'Tmdb': '1002'});
    final folded = foldSharedTitles([
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      otherMovie,
      _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(folded[1], same(otherMovie));
    expect(otherMovie.rawData.containsKey(unifiedCopiesKey), isFalse);
  });

  test('two copies on one server are one result that lists both', () {
    final folded = foldSharedTitles([
      _item('a', 'a-hd', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('a', 'a-4k', 'Altovar', ids: {'Tmdb': '1001'}),
    ], _servers);

    expect(folded, hasLength(1));
    expect(
      unifiedCopiesOf(folded.single.rawData).map((copy) => copy.itemId).toSet(),
      {'a-hd', 'a-4k'},
    );
  });

  test('results added later leave the ones already folded in place', () {
    final first = [
      _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'}),
      _item('a', 'a2', 'Hodrimel', ids: {'Tmdb': '1002'}),
      _item('a', 'a3', 'Rusquin', ids: {'Tmdb': '1007'}),
    ];
    final before = foldSharedTitles(first, _servers);

    final after = foldSharedTitles([
      ...first,
      _item('b', 'b2', 'Hodrimel', ids: {'Tmdb': '1002'}),
      _item('b', 'b9', 'Altovars', ids: {'Tmdb': '1010'}),
    ], _servers);

    expect(_keys(before), ['a:a1', 'a:a2', 'a:a3']);
    expect(_keys(after), ['a:a1', 'a:a2', 'a:a3', 'b:b9']);
    expect(unifiedCopiesOf(after[1].rawData).length, 2);
  });

  test('the items passed in are not modified', () {
    final a = _item('a', 'a1', 'Altovar', ids: {'Tmdb': '1001'});
    final b = _item('b', 'b1', 'Altovar', ids: {'Tmdb': '1001'}, played: true);

    foldSharedTitles([a, b], _servers);

    expect(a.rawData.containsKey(unifiedCopiesKey), isFalse);
    expect(a.isPlayed, isFalse);
  });

  group('with the copies the stored catalog knows', () {
    UnifiedCatalogEntry entry(AggregatedItem item) => UnifiedCatalogEntry(
      serverId: item.serverId,
      itemId: item.id,
      itemType: item.type!,
      raw: item.rawData,
    );

    const sharedIds = {'Tmdb': '1005'};
    final english = _item('a', 'a1', 'The Ledger of the Tides', ids: sharedIds);
    final french = _item('b', 'b1', 'Le Sablier des marées', ids: sharedIds);

    /// A stored catalog that knows the copies in [stored].
    Iterable<UnifiedCatalogEntry> Function(UnifiedCatalogEntry) holding(
      List<AggregatedItem> stored,
    ) => (found) => [
      for (final copy in stored.map(entry))
        if (copy.matchKeys.any(found.matchKeys.contains)) copy,
    ];

    test('a title one server found gains the copy the stored catalog knows '
        'on another', () {
      final otherMovie = _item('a', 'a2', 'Hodrimel', ids: {'Tmdb': '1002'});
      final folded = foldSharedTitles(
        [otherMovie, french],
        _servers,
        knownCopies: holding([english, french, otherMovie]),
      );

      expect(_keys(folded), ['a:a2', 'a:a1']);
      expect(folded.first, same(otherMovie));
      expect(folded.last.name, 'The Ledger of the Tides');
      expect(
        [
          for (final copy in unifiedCopiesOf(folded.last.rawData))
            (copy.serverId, copy.itemId, copy.name),
        ],
        [
          ('a', 'a1', 'The Ledger of the Tides'),
          ('b', 'b1', 'Le Sablier des marées'),
        ],
      );
    });

    test('a found copy the stored catalog lacks is kept, and a found '
        'copy\'s state wins over its stored state', () {
      final watched = _item(
        'b',
        'b1',
        'Le Sablier des marées',
        ids: {'Tmdb': '1005'},
        played: true,
      );
      final fresh = _item('b', 'b7', 'Le Sablier 4K', ids: {'Tmdb': '1005'});
      final folded = foldSharedTitles(
        [watched, fresh],
        _servers,
        knownCopies: holding([english, french]),
      ).single;

      final copies = unifiedCopiesOf(folded.rawData);
      expect([for (final copy in copies) copy.key], ['a|a1', 'b|b1', 'b|b7']);
      expect(copies[1].played, isTrue);
    });

    test('a title with no other stored copy is returned as the same list', () {
      final items = [french];
      expect(
        foldSharedTitles(items, _servers, knownCopies: holding([french])),
        same(items),
      );
      expect(
        foldSharedTitles(items, _servers, knownCopies: (_) => const []),
        same(items),
      );
    });

    test('a stored copy on a server that is not searched is left out', () {
      final items = [french];
      final elsewhere = _item('c', 'c1', 'LOTT', ids: {'Tmdb': '1005'});
      expect(
        foldSharedTitles(items, _servers, knownCopies: holding([elsewhere])),
        same(items),
      );
    });
  });
}
