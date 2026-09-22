import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

AggregatedItem item(String id, {String? lastPlayed}) => AggregatedItem(
  id: id,
  serverId: 's1',
  rawData: {
    'Name': id,
    if (lastPlayed != null) 'UserData': {'LastPlayedDate': lastPlayed},
  },
);

List<String> idsOf(List<AggregatedItem> items) =>
    items.map((i) => i.id).toList();

void main() {
  group('paging the merged Continue Watching row', () {
    test('leaves the items already on the row where they are', () {
      final existing = [
        item('a', lastPlayed: '2026-09-01T00:00:00Z'),
        item('b', lastPlayed: '2026-08-01T00:00:00Z'),
        item('c', lastPlayed: '2026-07-01T00:00:00Z'),
      ];
      // Dated between b and c, so a whole row sort would not leave it last.
      final incoming = [item('d', lastPlayed: '2026-08-15T00:00:00Z')];

      expect(idsOf(HomeViewModel.appendNewArrivals(existing, incoming)), [
        'a',
        'b',
        'c',
        'd',
      ]);
    });

    test('orders the arrivals among themselves, newest first', () {
      final existing = [item('a', lastPlayed: '2026-09-01T00:00:00Z')];
      final incoming = [
        item('older', lastPlayed: '2026-01-01T00:00:00Z'),
        item('newer', lastPlayed: '2026-06-01T00:00:00Z'),
      ];

      expect(idsOf(HomeViewModel.appendNewArrivals(existing, incoming)), [
        'a',
        'newer',
        'older',
      ]);
    });

    test('drops arrivals the row already holds', () {
      final existing = [item('a'), item('b')];

      expect(
        idsOf(HomeViewModel.appendNewArrivals(existing, [item('b'), item('c')])),
        ['a', 'b', 'c'],
      );
    });

    test('keeps the first of two arrivals sharing an id', () {
      final resume = item('shared', lastPlayed: '2026-01-01T00:00:00Z');
      final nextUp = item('shared', lastPlayed: '2026-09-01T00:00:00Z');

      final merged = HomeViewModel.appendNewArrivals(const [], [
        resume,
        nextUp,
      ]);

      expect(merged, hasLength(1));
      expect(identical(merged.single, resume), isTrue);
    });

    test('an item the user never played goes last', () {
      final incoming = [
        item('undated'),
        item('dated', lastPlayed: '2026-01-01T00:00:00Z'),
      ];

      expect(idsOf(HomeViewModel.appendNewArrivals(const [], incoming)), [
        'dated',
        'undated',
      ]);
    });
  });
}
