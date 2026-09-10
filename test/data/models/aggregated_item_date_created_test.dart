import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';

AggregatedItem itemWith(Map<String, dynamic> raw) =>
    AggregatedItem(id: 'i1', serverId: 'srv', rawData: raw);

void main() {
  test('the added date stays on the UTC the server sent', () {
    // Callers convert before showing it, or a viewer west of UTC reads the
    // next day for part of every day.
    final added = itemWith({
      'DateCreated': '2024-03-15T02:30:00.0000000Z',
    }).dateCreated;

    expect(added, isNotNull);
    expect(added!.isUtc, isTrue);
  });

  test('a missing or unreadable date is null', () {
    expect(itemWith(const {}).dateCreated, isNull);
    expect(itemWith(const {'DateCreated': 'not a date'}).dateCreated, isNull);
  });
}
