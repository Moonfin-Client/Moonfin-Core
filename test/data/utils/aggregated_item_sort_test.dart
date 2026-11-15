import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/utils/aggregated_item_sort.dart';

AggregatedItem _studio(
  String name, {
  int? movies,
  int? series,
  String? sortName,
}) => AggregatedItem(
  id: name,
  serverId: 'server',
  rawData: {
    'Name': name,
    'SortName': ?sortName,
    'MovieCount': ?movies,
    'SeriesCount': ?series,
  },
);

void main() {
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

  test('name order follows the sort name, so a leading article is skipped', () {
    final sorted = sortAggregatedItems(
      [
        _studio('Pixar'),
        _studio('The Asylum', sortName: 'Asylum'),
      ],
      sortBy: 'SortName',
      sortOrder: 'Ascending',
    );
    expect(sorted.map((s) => s.name), ['The Asylum', 'Pixar']);
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
