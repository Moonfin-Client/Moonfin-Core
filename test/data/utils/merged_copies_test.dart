import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/aggregated_library.dart';
import 'package:moonfin/data/utils/merged_copies.dart';

AggregatedItem _movie(
  String id,
  String serverId, {
  Map<String, String> ids = const {},
  String? sortName,
  String? dateCreated,
}) => AggregatedItem(
  id: id,
  serverId: serverId,
  rawData: {
    'Id': id,
    'Name': sortName ?? id,
    'Type': 'Movie',
    'SortName': ?sortName,
    'DateCreated': ?dateCreated,
    'ProviderIds': ids,
  },
);

AggregatedLibrary _library(String id, String serverId, String type) =>
    AggregatedLibrary(
      id: id,
      name: id,
      collectionType: type,
      serverId: serverId,
      imageTags: {'Primary': 'tag-$id'},
    );

void main() {
  group('mergeLibrariesByType', () {
    String nameOf(String type) => type == 'movies' ? 'Movies' : 'TV Shows';

    test('one library per type stands in for every server holding it', () {
      final merged = mergeLibrariesByType([
        _library('a-movies', 'a', 'movies'),
        _library('a-music', 'a', 'music'),
        _library('b-movies', 'b', 'movies'),
        _library('b-shows', 'b', 'tvshows'),
      ], nameOf: nameOf);

      expect(merged.map((library) => library.id), [
        mergedLibraryId('movies'),
        'a-music',
        'b-shows',
      ]);
      final movies = merged.first;
      expect(movies.name, 'Movies');
      expect(movies.serverId, 'a');
      expect(movies.imageItemId, 'a-movies');
      expect(movies.imageTags, {'Primary': 'tag-a-movies'});
      expect(mergedLibraryType(movies.id), 'movies');
      expect(mergedLibraryType('a-movies'), isNull);
    });

    test('a type only one server holds stays as it is', () {
      final libraries = [
        _library('a-movies', 'a', 'movies'),
        _library('a-4k', 'a', 'movies'),
      ];

      expect(mergeLibrariesByType(libraries, nameOf: nameOf), libraries);
    });
  });

  test('placeholder provider ids never match', () {
    final keys = titleMatchKeys(
      _movie('1', 'a', ids: {'Tmdb': '0', 'Imdb': 'tt0000000', 'Tvdb': 'none'}),
    );
    expect(keys, isEmpty);
    expect(titleMatchKeys(_movie('1', 'a', ids: {'Imdb': 'TT0111161'})), {
      'Movie:imdb:tt0111161',
    });
  });

  test('copies fold into the first card, across calls', () {
    final holders = <String, AggregatedItem>{};
    final first = foldCopies([
      _movie('a1', 'a', ids: {'Tmdb': '603'}),
      _movie('a2', 'a'),
    ], holders);
    final second = foldCopies([
      _movie('b1', 'b', ids: {'Tmdb': '603', 'Imdb': 'tt0133093'}),
      _movie('c1', 'c', ids: {'Imdb': 'tt0133093'}),
      _movie('b2', 'b'),
    ], holders);

    expect(first.map((item) => item.id), ['a1', 'a2']);
    expect(second.map((item) => item.id), ['b2']);
    final card = first.first;
    expect(copiesOf(card).map((copy) => '${copy.serverId}/${copy.id}'), [
      'a/a1',
      'b/b1',
      'c/c1',
    ]);
    expect(serverCountOf(card), 3);
    expect(serverCountOf(first.last), 1);
  });

  test('a card refreshed after it was shown still gets later copies', () {
    final holders = <String, AggregatedItem>{};
    final shown = foldCopies([
      _movie('a1', 'a', ids: {'Tmdb': '603'}),
    ], holders).single;
    // A user data refresh swaps the card for one with a copied map.
    final refreshed = AggregatedItem(
      id: shown.id,
      serverId: shown.serverId,
      rawData: {
        ...shown.rawData,
        'UserData': {'Played': true},
      },
    );
    foldCopies([
      _movie('b1', 'b', ids: {'Tmdb': '603'}),
    ], holders);

    expect(copiesOf(refreshed).map((copy) => copy.id), ['a1', 'b1']);
  });

  group('with a preferred server', () {
    test("another server's copy waits to join that server's card", () {
      final preferred = PreferredCopies('a', {'Movie:tmdb:120'});
      final holders = <String, AggregatedItem>{};
      final french = _movie('b1', 'b', ids: {'Tmdb': '120'});
      final other = _movie('b2', 'b', ids: {'Tmdb': '7'});
      final english = _movie('a1', 'a', ids: {'Tmdb': '120'});

      expect(foldCopies([french, other], holders, preferred), [other]);
      expect(foldCopies([english], holders, preferred), [english]);
      expect(copiesOf(english).map((copy) => copy.id), ['a1', 'b1']);
      expect(preferred.takeAllWaiting(), isEmpty);
    });

    test('a copy still waiting is handed back once', () {
      final preferred = PreferredCopies('a', {
        'Movie:tmdb:120',
        'Movie:imdb:tt0120737',
      });
      final french = _movie(
        'b1',
        'b',
        ids: {'Tmdb': '120', 'Imdb': 'tt0120737'},
      );

      expect(foldCopies([french], {}, preferred), isEmpty);
      expect(preferred.takeAllWaiting(), [french]);
      expect(preferred.takeAllWaiting(), isEmpty);
    });
  });

  group('mergedSortComparator', () {
    test('orders by the sort fields, a missing value first', () {
      final items = [
        _movie('3', 'a', sortName: 'b', dateCreated: '2024-01-02T00:00:00Z'),
        _movie('1', 'b', sortName: 'c'),
        _movie('2', 'a', sortName: 'a', dateCreated: '2024-01-02T00:00:00Z'),
      ];
      final ascending = mergedSortComparator(
        'DateCreated,SortName',
        descending: false,
      )!;
      final descending = mergedSortComparator(
        'DateCreated,SortName',
        descending: true,
      )!;

      expect([...items]..sort(ascending), [items[1], items[2], items[0]]);
      expect([...items]..sort(descending), [items[0], items[2], items[1]]);
    });

    test('an accented title sorts with its plain letter', () {
      final items = [
        _movie('1', 'a', sortName: 'zorro'),
        _movie('2', 'b', sortName: 'été'),
        _movie('3', 'a', sortName: 'dune'),
        _movie('4', 'b', sortName: 'fargo'),
      ];
      final byName = mergedSortComparator('SortName', descending: false)!;

      expect(([...items]..sort(byName)).map((item) => item.id), [
        '3',
        '2',
        '4',
        '1',
      ]);
    });

    test('a random order has nothing to merge on', () {
      expect(mergedSortComparator('Random', descending: false), isNull);
    });
  });

  group('joinIndexedCopies', () {
    test('a card takes on the copy another server sorts far away, which '
        'folds in when paging reaches it', () {
      final original = _movie(
        '1',
        'a',
        ids: {'Tmdb': '1001'},
        sortName: 'Quillmere',
      );
      final translated = _movie(
        '9',
        'b',
        ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'},
        sortName: 'Les Jardins de Vortelle',
      );
      final index = indexCopies([
        original,
        translated,
        _movie('5', 'b', ids: {'Tmdb': '1'}),
      ]);
      final holders = <String, AggregatedItem>{};
      final card = foldCopies([original], holders).single;
      final shown = {'a|1'};
      bool isShown(AggregatedItem copy) =>
          shown.contains('${copy.serverId}|${copy.id}');

      expect(joinIndexedCopies(card, index, holders, isShown), isTrue);
      expect(copiesOf(card).map((copy) => copy.serverId), ['a', 'b']);

      final later = _movie(
        '9',
        'b',
        ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'},
      );
      expect(foldCopies([later], holders), isEmpty);
      expect(copiesOf(card), hasLength(2));
      expect(serverCountOf(card), 2);
    });

    test('the full copy paging folds in takes the place of the light one '
        'the index gave the card', () {
      final original = _movie(
        '1',
        'a',
        ids: {'Tmdb': '1001'},
        sortName: 'Quillmere',
      );
      final light = _movie('9', 'b', ids: {'Tmdb': '1001'});
      final index = indexCopies([original, light]);
      final holders = <String, AggregatedItem>{};
      final card = foldCopies([original], holders).single;
      final shown = {'a|1'};

      expect(
        joinIndexedCopies(
          card,
          index,
          holders,
          (copy) => shown.contains('${copy.serverId}|${copy.id}'),
        ),
        isTrue,
      );
      expect(copiesOf(card)[1].rawData.containsKey('UserData'), isFalse);

      final full = _movie(
        '9',
        'b',
        ids: {'Tmdb': '1001'},
        sortName: 'Les Jardins de Vortelle',
      );
      full.rawData['UserData'] = {'Played': true};
      full.rawData['ImageTags'] = {'Primary': 'tag-9'};
      expect(foldCopies([full], holders), isEmpty);

      final copies = copiesOf(card);
      expect(copies, hasLength(2));
      expect(copies.first.rawData['Id'], '1');
      expect(copies[1].serverId, 'b');
      expect(copies[1].id, '9');
      expect(copies[1].rawData['UserData'], {'Played': true});
      expect(copies[1].rawData['ImageTags'], {'Primary': 'tag-9'});
      expect(copies[1].rawData['SortName'], 'Les Jardins de Vortelle');
    });

    test('a title only one item holds stays out of the index', () {
      final index = indexCopies([
        _movie('1', 'a', ids: {'Tmdb': '1002'}),
        _movie('2', 'b', ids: {'Tmdb': '1002'}),
        _movie('3', 'a', ids: {'Tmdb': '1003'}),
      ]);
      expect(index.keys, ['Movie:tmdb:1002']);
    });

    test('a copy already on the card still leads to the copies its ids '
        'point at', () {
      final holders = <String, AggregatedItem>{};
      final card = foldCopies([
        _movie('1', 'a', ids: {'Tmdb': '1'}),
        _movie('2', 'b', ids: {'Tmdb': '1', 'Imdb': 'tt2'}),
      ], holders).single;
      final index = indexCopies([
        _movie('2', 'b', ids: {'Tmdb': '1', 'Imdb': 'tt2'}),
        _movie('3', 'c', ids: {'Imdb': 'tt2'}),
      ]);
      final shown = {'a|1', 'b|2'};
      joinIndexedCopies(
        card,
        index,
        holders,
        (copy) => shown.contains('${copy.serverId}|${copy.id}'),
      );
      expect(copiesOf(card).map((copy) => copy.serverId), ['a', 'b', 'c']);
    });

    test('a copy whose ids lead to two cards joins only one of them', () {
      final holders = <String, AggregatedItem>{};
      final cards = foldCopies([
        _movie('1', 'a', ids: {'Tmdb': '1001'}),
        _movie('2', 'b', ids: {'Imdb': 'tt9000001'}),
      ], holders);
      expect(cards, hasLength(2));
      final bridge = _movie(
        '3',
        'c',
        ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'},
      );
      final index = indexCopies([...cards, bridge]);
      final shown = {'a|1', 'b|2'};
      bool isShown(AggregatedItem copy) =>
          shown.contains('${copy.serverId}|${copy.id}');

      expect(joinIndexedCopies(cards[0], index, holders, isShown), isTrue);
      expect(joinIndexedCopies(cards[1], index, holders, isShown), isFalse);
      expect(copiesOf(cards[0]).map((copy) => copy.serverId), ['a', 'c']);
      expect(copiesOf(cards[1]).map((copy) => copy.serverId), ['b']);
    });

    test('the full copy folds into the card holding its light copy, not the '
        'first card its ids lead to', () {
      final holders = <String, AggregatedItem>{};
      final cards = foldCopies([
        _movie('1', 'a', ids: {'Tmdb': '1001'}),
        _movie('2', 'b', ids: {'Imdb': 'tt9000001'}),
      ], holders);
      final light = _movie(
        '3',
        'c',
        ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'},
      );
      final index = indexCopies([...cards, light]);
      final shown = {'a|1', 'b|2'};
      bool isShown(AggregatedItem copy) =>
          shown.contains('${copy.serverId}|${copy.id}');
      // The second card is up first, so the copy lands there.
      joinIndexedCopies(cards[1], index, holders, isShown);
      joinIndexedCopies(cards[0], index, holders, isShown);

      final full = _movie(
        '3',
        'c',
        ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'},
        sortName: 'Quillmere',
      );
      expect(foldCopies([full], holders), isEmpty);
      expect(copiesOf(cards[0]).map((copy) => copy.serverId), ['a']);
      expect(copiesOf(cards[1]).map((copy) => copy.serverId), ['b', 'c']);
      expect(copiesOf(cards[1])[1].rawData['SortName'], 'Quillmere');
    });

    test('a copy another copy brought to one card stays off the next', () {
      final holders = <String, AggregatedItem>{};
      final cards = foldCopies([
        _movie('1', 'a', ids: {'Tmdb': '1001'}),
        _movie('2', 'b', ids: {'Imdb': 'tt9000001'}),
      ], holders);
      final index = indexCopies([
        ...cards,
        _movie('3', 'c', ids: {'Tmdb': '1001', 'Imdb': 'tt9000001'}),
        _movie('4', 'd', ids: {'Tmdb': '1001'}),
      ]);
      final shown = {'a|1', 'b|2'};
      bool isShown(AggregatedItem copy) =>
          shown.contains('${copy.serverId}|${copy.id}');

      // The second card reaches d through c's ids.
      joinIndexedCopies(cards[1], index, holders, isShown);
      expect(joinIndexedCopies(cards[0], index, holders, isShown), isFalse);
      expect(copiesOf(cards[0]).map((copy) => copy.serverId), ['a']);
      expect(copiesOf(cards[1]).map((copy) => copy.serverId), ['b', 'c', 'd']);

      final full = _movie(
        '4',
        'd',
        ids: {'Tmdb': '1001'},
        sortName: 'Quillmere',
      );
      expect(foldCopies([full], holders), isEmpty);
      expect(copiesOf(cards[0]).map((copy) => copy.serverId), ['a']);
      expect(copiesOf(cards[1]).last.rawData['SortName'], 'Quillmere');
    });
  });
}
