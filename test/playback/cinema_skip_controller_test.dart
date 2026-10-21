import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/cinema_skip_controller.dart';
import 'package:playback_core/playback_core.dart';

void main() {
  test("stale readiness can't overwrite a new trailer, and reindexing is harmless", () {
    final skip = CinemaSkipController(onSkip: () async {});
    addTearDown(skip.dispose);
    skip.configure(enabled: true);
    final first = Object(), second = Object();

    void sync(Object item, int index, int token, int seconds) {
      skip.synchronize(
        item: item,
        index: index,
        preroll: {'Id': 'same', 'RunTimeTicks': 900000000},
        itemId: 'same',
        source: PlaybackBringupState(
          phase: PlaybackBringupPhase.ready,
          sessionToken: token,
          itemId: 'same',
        ),
        duration: Duration(seconds: seconds),
        playing: true,
      );
    }

    sync(first, 0, 1, 30);
    expect(skip.duration, const Duration(seconds: 30));
    sync(first, 1, 1, 30);
    expect(skip.generation, 1);
    sync(second, 2, 1, 45);
    expect(skip.duration, const Duration(seconds: 90));
    sync(second, 2, 2, 45);
    expect(skip.duration, const Duration(seconds: 45));
    sync(second, 0, 2, 45);
    expect(skip.generation, 2);
    sync(second, 1, 3, 25);
    expect(skip.generation, 3);
  });

  test('duration, pause and auto-hide control eligibility and visibility', () {
    fakeAsync((time) {
      final skip = CinemaSkipController(onSkip: () async {});
      skip.enter({'Id': 'clip'});
      skip.configure(enabled: true);
      expect(skip.visible, isFalse);
      skip.updatePlayback(duration: const Duration(seconds: 10), playing: true);
      expect(skip.visible, isFalse);
      skip.updatePlayback(duration: const Duration(seconds: 11), playing: true);
      expect(skip.visible, isTrue);
      time.elapse(const Duration(seconds: 9));
      skip.updatePlayback(duration: Duration.zero, playing: false);
      time.elapse(const Duration(minutes: 1));
      expect(skip.visible, isTrue);
      skip.updatePlayback(duration: Duration.zero, playing: true);
      time.elapse(const Duration(seconds: 10));
      expect(skip.visible, isFalse);
      skip.activate();
      expect(skip.visible, isTrue);
      skip.hide();
      expect(skip.visible, isFalse);
      skip.dispose();
    });
  });

  test('hidden Fast Forward, cooldown, failures and stale completions', () {
    fakeAsync((time) {
      var attempts = 0;
      final pending = <Completer<void>>[];
      final skip = CinemaSkipController(onSkip: () {
        attempts++;
        final next = Completer<void>();
        pending.add(next);
        return next.future;
      });
      skip.enter({'RunTimeTicks': 50000000});
      skip.skip(requireVisible: false);
      expect(attempts, 0);
      skip.configure(enabled: true);
      skip.skip();
      expect(attempts, 0);
      skip.skip(requireVisible: false);
      expect(attempts, 1);
      skip.enter({'RunTimeTicks': 900000000});
      skip.skip();
      expect(attempts, 1);
      time.elapse(const Duration(milliseconds: 400));
      skip.skip();
      expect(attempts, 2);
      skip.enter({'RunTimeTicks': 900000000});
      pending[1].completeError(StateError('old trailer failed'));
      time.flushMicrotasks();
      expect(skip.visible, isTrue);
      time.elapse(const Duration(milliseconds: 400));
      skip.skip();
      expect(attempts, 3);
      pending[2].completeError(StateError('failed'));
      time.flushMicrotasks();
      expect(skip.visible, isTrue);
      skip.dispose();
      pending[0].complete();
      time.flushMicrotasks();
    });
  });
}
