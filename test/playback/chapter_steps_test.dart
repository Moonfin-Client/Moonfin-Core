import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

const _starts = [
  Duration.zero,
  Duration(minutes: 5),
  Duration(minutes: 10),
];

void main() {
  group('stepping forward', () {
    test('lands on the next chapter start', () {
      expect(
        nextChapterStart(_starts, const Duration(minutes: 2)),
        const Duration(minutes: 5),
      );
    });

    // What tells the caller to move on to the next item, or to run the last
    // chapter out to the end.
    test('is null once there is nothing after the position', () {
      expect(nextChapterStart(_starts, const Duration(minutes: 10)), isNull);
      expect(nextChapterStart(_starts, const Duration(minutes: 30)), isNull);
    });

    test('is null without chapters', () {
      expect(nextChapterStart(const [], const Duration(minutes: 2)), isNull);
    });
  });

  group('stepping back', () {
    test('lands on the start of the chapter the position is in', () {
      expect(
        previousChapterStart(_starts, const Duration(minutes: 7)),
        const Duration(minutes: 5),
      );
    });

    // Standing on a start, or a second past it, means the one before. Without
    // that grace the press would seek to where the position already is.
    test('skips a start the position is on or has only just cleared', () {
      expect(
        previousChapterStart(_starts, const Duration(minutes: 5)),
        Duration.zero,
      );
      expect(
        previousChapterStart(
          _starts,
          const Duration(minutes: 5, seconds: 2),
        ),
        Duration.zero,
      );
    });

    // Null hands it back to the queue, which restarts the item or steps to
    // the one before depending on how far in the position is.
    test('is null before the first chapter', () {
      expect(previousChapterStart(
        const [Duration(minutes: 1)],
        const Duration(seconds: 2),
      ), isNull);
    });

    test('is null without chapters', () {
      expect(
        previousChapterStart(const [], const Duration(minutes: 2)),
        isNull,
      );
    });
  });
}
