import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/recording_from_start.dart';

void main() {
  group('activeRecordingForTimer', () {
    test('picks the recording the timer is making', () {
      final recordings = [
        {'Id': '1', 'TimerId': 'aaaa'},
        {'Id': '2', 'TimerId': '254d0f02e3f94794b8d62380758983ff'},
      ];

      final match = activeRecordingForTimer(
        recordings,
        '254d0f02-e3f9-4794-b8d6-2380758983ff',
      );

      expect(match?['Id'], '2');
    });

    test('finds nothing when no recording belongs to the timer', () {
      final recordings = [
        {'Id': '1', 'TimerId': 'aaaa'},
        {'Id': '2'},
      ];

      expect(activeRecordingForTimer(recordings, 'bbbb'), isNull);
      expect(activeRecordingForTimer(const [], 'bbbb'), isNull);
    });
  });
}
