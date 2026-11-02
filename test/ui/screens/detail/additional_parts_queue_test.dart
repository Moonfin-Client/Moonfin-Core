import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';

AggregatedItem _item(String id) =>
    AggregatedItem(id: id, serverId: 's', rawData: {'Id': id});

List<String> _ids(List<AggregatedItem> items) => [for (final i in items) i.id];

void main() {
  final e1 = _item('e1');
  final e2 = _item('e2');
  final e3 = _item('e3');
  final part = _item('e2-part2');

  test('parts play right after the started item, before the next one', () {
    final queue = queueWithAdditionalParts(
      [e1, e2, e3],
      startIndex: 1,
      target: e2,
      parts: [part],
    );

    expect(_ids(queue), ['e1', 'e2', 'e2-part2', 'e3']);
  });

  test('a queue that does not start on the target is left alone', () {
    final queue = queueWithAdditionalParts(
      [e1, e2, e3],
      startIndex: 0,
      target: e2,
      parts: [part],
    );

    expect(_ids(queue), ['e1', 'e2', 'e3']);
  });

  test('a resume point past the first file starts in the part holding it', () {
    final parts = [
      for (final id in ['pt2', 'pt3'])
        AggregatedItem(
          id: id,
          serverId: 's',
          rawData: {'Id': id, 'RunTimeTicks': 900000000},
        ),
    ];
    (int, Duration) start(int seconds) => startInParts(
      startIndex: 1,
      startPosition: Duration(seconds: seconds),
      firstFile: const Duration(seconds: 90),
      parts: parts,
    );

    expect(start(30), (1, const Duration(seconds: 30)));
    expect(start(120), (2, const Duration(seconds: 30)));
    expect(start(200), (3, const Duration(seconds: 20)));
  });
}
