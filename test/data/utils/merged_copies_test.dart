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

    test('a random order has nothing to merge on', () {
      expect(mergedSortComparator('Random', descending: false), isNull);
    });
  });
}
