import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/utils/chapter_markers.dart';

List<Map<String, dynamic>> _chapters(List<int> startsMs) =>
    [for (final ms in startsMs) {'title': 'Chapter', 'startMs': ms}];

void main() {
  test('keeps the starts that fall inside the runtime, in order', () {
    expect(
      chapterMarkerPositions(_chapters([90000, 30000, 60000]), 120000),
      [30000, 60000, 90000],
    );
  });

  test('drops a start at zero, at the runtime, or past it', () {
    expect(
      chapterMarkerPositions(_chapters([0, 30000, 120000, 130000]), 120000),
      [30000],
    );
  });

  test('collapses duplicate starts', () {
    expect(
      chapterMarkerPositions(_chapters([30000, 30000, 60000]), 120000),
      [30000, 60000],
    );
  });

  test('is empty without a runtime to place marks against', () {
    expect(chapterMarkerPositions(_chapters([30000]), 0), isEmpty);
    expect(chapterMarkerPositions(_chapters([30000]), -1), isEmpty);
  });

  test('is empty when the item has no chapters', () {
    expect(chapterMarkerPositions(const [], 120000), isEmpty);
  });

  test('skips an entry with no usable start', () {
    expect(
      chapterMarkerPositions(const [
        {'title': 'Chapter'},
        {'title': 'Chapter', 'startMs': 'nope'},
        {'title': 'Chapter', 'startMs': 30000},
      ], 120000),
      [30000],
    );
  });
}
