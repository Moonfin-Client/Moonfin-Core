import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/cinema_mode_controller.dart';

void main() {
  late Completer<void> completion;
  late CinemaModeController controller;

  setUp(() {
    controller = CinemaModeController(
      seerr: () => throw StateError('Seerr should not be used'),
      accountKey: () => 'server/user',
      onSkip: () => completion.future,
    );
  });
  tearDown(() => controller.dispose());

  void enter({String id = 'first'}) {
    controller.enter(
      item: {'Id': id, 'RunTimeTicks': 900000000},
      resolveMedia: () async => null,
    );
    controller.updatePlayback(
      duration: const Duration(seconds: 90),
      playing: true,
    );
  }

  for (final fails in [false, true]) {
    final outcome = fails ? 'failed' : 'ignored';

    void finishSkip() {
      if (fails) {
        completion.completeError(StateError('Skip failed'));
      } else {
        completion.complete();
      }
    }

    test('$outcome Skip restores controls and auto-hide', () {
      fakeAsync((clock) {
        completion = Completer<void>();
        enter();
        controller.skip();
        expect(controller.visible, isFalse);

        finishSkip();
        clock.flushMicrotasks();
        expect(controller.visible, isTrue);

        clock.elapse(const Duration(seconds: 14));
        expect(controller.visible, isTrue);
        clock.elapse(const Duration(seconds: 1));
        expect(controller.visible, isFalse);
        controller.reveal();
        expect(controller.visible, isTrue);
      });
    });

    test('late $outcome Skip leaves the next trailer unchanged', () {
      fakeAsync((clock) {
        completion = Completer<void>();
        enter();
        controller.skip();
        enter(id: 'next');
        clock.flushMicrotasks();
        clock.elapse(const Duration(seconds: 10));
        expect(controller.visible, isTrue);
        var notifications = 0;
        controller.addListener(() => notifications++);

        finishSkip();
        clock.flushMicrotasks();
        expect(notifications, 0);
        expect(controller.visible, isTrue);

        // The next trailer must still hide on its original deadline.
        clock.elapse(const Duration(seconds: 5));
        expect(controller.visible, isFalse);
      });
    });
  }
}
