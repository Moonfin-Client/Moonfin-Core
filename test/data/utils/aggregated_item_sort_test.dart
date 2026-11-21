import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/aggregated_item_sort.dart';
import 'package:moonfin/preference/preference_constants.dart';

AggregatedItem _studio(
  String name, {
  String? sortName,
  String? added,
  int? movies,
  int? series,
}) => AggregatedItem(
  id: name,
  serverId: 'server',
  rawData: {
    'Name': name,
    'SortName': ?sortName,
    'DateCreated': ?added,
    'MovieCount': ?movies,
    'SeriesCount': ?series,
  },
);

void main() {
  test('date added puts the newest picked studio first', () {
    final sorted = sortAggregatedItems(
      [
        _studio('A24', added: '2024-01-01T00:00:00Z'),
        _studio('Pixar', added: '2026-01-01T00:00:00Z'),
        _studio('HBO', added: '2025-01-01T00:00:00Z'),
      ],
      sortBy: 'DateCreated,SortName',
      sortOrder: 'Descending',
    );
    expect(sorted.map((s) => s.name), ['Pixar', 'HBO', 'A24']);
  });

  test('any other saved sort orders picked studios by name', () {
    for (final sort in LibrarySortBy.values) {
      if (sort == LibrarySortBy.dateAdded || sort == LibrarySortBy.random) {
        continue;
      }
      final sorted = sortAggregatedItems(
        [_studio('A24'), _studio('Pixar'), _studio('HBO')],
        sortBy: sort.apiValue,
        sortOrder: 'Descending',
      );
      expect(sorted.map((s) => s.name), [
        'Pixar',
        'HBO',
        'A24',
      ], reason: sort.name);
    }
  });

  test('name order follows the sort name, so a leading article is skipped', () {
    final sorted = sortAggregatedItems(
      [_studio('Pixar'), _studio('The Asylum', sortName: 'Asylum')],
      sortBy: 'SortName',
      sortOrder: 'Ascending',
    );
    expect(sorted.map((s) => s.name), ['The Asylum', 'Pixar']);
  });

  test('item count ranks studios by their movies and shows together', () {
    final sorted = sortAggregatedItems(
      [
        _studio('A24', movies: 3),
        _studio('HBO', series: 2, movies: 4),
        _studio('Pixar', movies: 5),
        _studio('Unknown'),
      ],
      sortBy: 'ItemCount',
      sortOrder: 'Descending',
    );
    expect(sorted.map((s) => s.name), ['HBO', 'Pixar', 'A24', 'Unknown']);
  });

  test('a studio counted on its own ranks by that total', () {
    final sorted = sortAggregatedItems(
      [
        _studio('A24', movies: 3),
        AggregatedItem(
          id: 'Toho',
          serverId: 'server',
          rawData: {'Name': 'Toho', 'ChildCount': 56},
        ),
      ],
      sortBy: 'ItemCount',
      sortOrder: 'Descending',
    );
    expect(sorted.map((s) => s.name), ['Toho', 'A24']);
  });
}
