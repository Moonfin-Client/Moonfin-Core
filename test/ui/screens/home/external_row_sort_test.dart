import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

AggregatedItem item(String name, {int? year, double? rating}) => AggregatedItem(
  id: name,
  serverId: 'seerr',
  rawData: {'Name': name, 'ProductionYear': ?year, 'CommunityRating': ?rating},
);

List<String> namesOf(List<AggregatedItem> items) =>
    items.map((i) => i.name).toList();

void main() {
  final items = [
    item('Metropolis', year: 1927, rating: 8.3),
    item('M', year: 1931, rating: 8.3),
    item('City Lights', year: 1931, rating: 8.5),
    item('The Kid', year: 1921, rating: 8.2),
  ];

  List<String> sorted(ExternalRowSortBy by, SortDirection order) =>
      namesOf(HomeViewModel.applyExternalRowSort(items, by, order));

  test('the default keeps the list order', () {
    expect(sorted(ExternalRowSortBy.none, SortDirection.ascending), [
      'Metropolis',
      'M',
      'City Lights',
      'The Kid',
    ]);
  });

  test('a shared year falls back to the name in either direction', () {
    expect(sorted(ExternalRowSortBy.releaseDate, SortDirection.ascending), [
      'The Kid',
      'Metropolis',
      'City Lights',
      'M',
    ]);
    expect(sorted(ExternalRowSortBy.releaseDate, SortDirection.descending), [
      'City Lights',
      'M',
      'Metropolis',
      'The Kid',
    ]);
  });

  test('rating sorts by the community rating', () {
    expect(sorted(ExternalRowSortBy.rating, SortDirection.descending), [
      'City Lights',
      'M',
      'Metropolis',
      'The Kid',
    ]);
  });

  test('shuffle keeps every item', () {
    expect(sorted(ExternalRowSortBy.shuffle, SortDirection.ascending)..sort(), [
      'City Lights',
      'M',
      'Metropolis',
      'The Kid',
    ]);
  });
}
