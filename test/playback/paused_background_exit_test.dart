import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/paused_background_exit.dart';

void main() {
  late bool paused;
  late int closes;
  late PausedBackgroundExit exit;

  setUp(() {
    paused = true;
    closes = 0;
    exit = PausedBackgroundExit(mayClose: () => paused, close: () => closes++);
  });

  void go(List<AppLifecycleState> states) {
    for (final state in states) {
      exit.onLifecycleChanged(state);
    }
  }

  const away = [
    AppLifecycleState.inactive,
    AppLifecycleState.hidden,
    AppLifecycleState.paused,
  ];

  test('closes a paused player once it has been away long enough', () {
    fakeAsync((async) {
      go(away);
      async.elapse(const Duration(seconds: 14));
      expect(closes, 0);
      async.elapse(const Duration(seconds: 1));
      expect(closes, 1);
    });
  });

  test('a return in time keeps it', () {
    fakeAsync((async) {
      go(away);
      async.elapse(const Duration(seconds: 10));
      go([
        AppLifecycleState.hidden,
        AppLifecycleState.inactive,
        AppLifecycleState.resumed,
      ]);
      async.elapse(const Duration(seconds: 30));
      expect(closes, 0);
    });
  });

  test('leaves a pause that came after leaving alone', () {
    fakeAsync((async) {
      paused = false;
      exit.onLifecycleChanged(AppLifecycleState.inactive);
      // A lock pauses playing video on its way out.
      paused = true;
      go([AppLifecycleState.hidden, AppLifecycleState.paused]);
      async.elapse(const Duration(seconds: 30));
      expect(closes, 0);
    });
  });

  test('keeps it when playback picks up again while away', () {
    fakeAsync((async) {
      go(away);
      paused = false;
      async.elapse(const Duration(seconds: 30));
      expect(closes, 0);
    });
  });
}
