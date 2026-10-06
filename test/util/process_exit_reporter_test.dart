import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/process_exit_reporter.dart';

void main() {
  group('the state summary', () {
    test('folds item ids and drops the query', () {
      expect(
        normalizedRoute('/item/98d9c73e71127838f7276b76373c05ce?serverId=abc'),
        '/item/:id',
      );
      expect(normalizedRoute('/player/video'), '/player/video');
    });

    test('says when the screensaver was up', () {
      expect(
        appStateSummary(route: '/home', screensaver: true),
        'route=/home screensaver',
      );
      expect(
        appStateSummary(route: '/home', screensaver: false),
        'route=/home',
      );
    });
  });

  group('a reported exit', () {
    test('a native crash names its signal and what was on screen', () {
      final exit = describeProcessExit({
        'timestampMs': 0,
        'reason': 'native crash',
        'importance': 'foreground',
        'signal': 11,
        'pssKb': 887 * 1024,
        'rssKb': 707 * 1024,
        'state': 'hc=media3-preview route=/home',
      });

      expect(
        exit.message,
        'Previous run ended: native crash (signal 11) while foreground',
      );
      expect(exit.details, contains('State: hc=media3-preview route=/home'));
      expect(exit.details, contains('Memory: PSS 887 MB, RSS 707 MB'));
      expect(
        exit.signature,
        'exit:native crash (signal 11)::hc=media3-preview route=/home',
      );
    });

    test('a native crash carries what its tombstone said', () {
      final exit = describeProcessExit({
        'reason': 'native crash',
        'importance': 'foreground',
        'signal': 6,
        'state': 'hc=none route=/home',
        'crashThread': 'mpv/core',
        'frames': ['#00 libc.so (abort+54)', '#01 libflutter.so (DLRT_x)'],
        'crashLogs': ['DartVM: Callback invoked after it has been deleted.'],
      });

      expect(exit.details, contains('Thread: mpv/core'));
      expect(
        exit.details,
        contains('Frames:\n#00 libc.so (abort+54)\n#01 libflutter.so (DLRT_x)'),
      );
      expect(
        exit.details,
        contains('Logs:\nDartVM: Callback invoked after it has been deleted.'),
      );
      expect(
        exit.signature,
        'exit:native crash (signal 6):mpv/core:hc=none route=/home',
      );
    });

    test('an ANR carries its main thread', () {
      final exit = describeProcessExit({
        'reason': 'ANR',
        'importance': 'foreground',
        'mainThread': '"main" prio=5 tid=1 Native\n  at a.b(C.kt:1)',
      });

      expect(exit.details, contains('Main thread:\n"main" prio=5'));
      expect(exit.details, contains('State: not recorded'));
    });
  });
}
