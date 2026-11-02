import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
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

  group('the version that plays', () {
    Map<String, dynamic> chapter(String name, int seconds) => {
      'Name': name,
      'StartPositionTicks': seconds * 10000000,
    };
    final item = AggregatedItem(
      id: 'film',
      serverId: 's',
      rawData: {
        'Chapters': [chapter('Opening', 0)],
        'MediaSources': [
          {
            'Id': 'uhd',
            'Chapters': [chapter('Opening', 0)],
          },
          {
            'Id': 'hd',
            'Chapters': [chapter('Start', 0), chapter('Middle', 60)],
          },
          {'Id': 'plain'},
        ],
      },
    );

    test('a version with its own chapters gives those', () {
      expect(
        chaptersForItem(item, null, mediaSourceId: 'hd').map((c) => c['title']),
        ['Start', 'Middle'],
      );
      expect(
        chaptersForItem(item, null, mediaSourceId: 'hd').last['startMs'],
        60000,
      );
    });

    test('otherwise the item\'s', () {
      for (final id in [null, 'plain', 'unknown']) {
        expect(
          chaptersForItem(item, null, mediaSourceId: id).map((c) => c['title']),
          ['Opening'],
          reason: '$id',
        );
      }
    });
  });
}
