import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/subtitle_appearance_schedule.dart';

void main() {
  group('subtitleAppearanceDelays', () {
    test('waits long enough for a queued metadata refresh', () {
      // The old fixed schedule gave up after four seconds, which a busy server
      // misses. Anything under fifteen is back to guessing.
      final window = subtitleAppearanceDelays.fold(
        Duration.zero,
        (total, delay) => total + delay,
      );
      expect(window.inSeconds, greaterThanOrEqualTo(15));
      expect(window.inSeconds, lessThanOrEqualTo(30));
    });

    test('starts tight so a quick server still feels instant', () {
      expect(subtitleAppearanceDelays.first.inMilliseconds, lessThan(500));
      final firstThree = subtitleAppearanceDelays
          .take(3)
          .fold(Duration.zero, (total, delay) => total + delay);
      expect(firstThree.inMilliseconds, lessThan(1500));
    });

    test('never steps back down', () {
      for (var i = 1; i < subtitleAppearanceDelays.length; i++) {
        expect(
          subtitleAppearanceDelays[i],
          greaterThanOrEqualTo(subtitleAppearanceDelays[i - 1]),
          reason: 'delay $i is shorter than the one before it',
        );
      }
    });

    test('does not hammer the item endpoint', () {
      expect(subtitleAppearanceDelays.length + 1, lessThanOrEqualTo(15));
    });
  });

  group('pollForSubtitleAppearance', () {
    test('returns the first thing the probe turns up', () async {
      var calls = 0;
      final found = await pollForSubtitleAppearance<String>(() async {
        calls++;
        return calls >= 2 ? 'found' : null;
      });

      expect(found, 'found');
      expect(calls, 2);
    });

    test('stops when the caller asks it to', () async {
      var calls = 0;
      final found = await pollForSubtitleAppearance<String>(() async {
        calls++;
        return null;
      }, keepGoing: () => calls < 3);

      expect(found, isNull);
      expect(calls, 3);
    });

    test('stops before probing when the caller has gone away', () async {
      var calls = 0;
      final found = await pollForSubtitleAppearance<String>(() async {
        calls++;
        return 'found';
      }, keepGoing: () => false);

      expect(found, isNull);
      expect(calls, 0);
    });
  });
}
