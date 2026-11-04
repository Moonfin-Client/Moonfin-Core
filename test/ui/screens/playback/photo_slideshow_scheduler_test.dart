import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/playback/photo_slideshow_scheduler.dart';

void main() {
  const interval = Duration(seconds: 5);

  group('PhotoSlideshowScheduler', () {
    test('counts the interval from when the photo loads, not when it was '
        'requested', () {
      fakeAsync((async) {
        var advances = 0;
        final scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () => advances++,
        );
        final loaded = Completer<void>();
        scheduler.start(loaded.future);

        // A slow photo: still loading well past the interval.
        async.elapse(const Duration(seconds: 8));
        expect(advances, 0);

        loaded.complete();
        async.elapse(const Duration(seconds: 4, milliseconds: 900));
        expect(advances, 0);
        async.elapse(const Duration(milliseconds: 100));
        expect(advances, 1);

        scheduler.dispose();
      });
    });

    test('restarts the countdown for each new photo', () {
      fakeAsync((async) {
        var advances = 0;
        late PhotoSlideshowScheduler scheduler;
        final loads = <Completer<void>>[];
        Future<void> nextPhoto() {
          final c = Completer<void>();
          loads.add(c);
          return c.future;
        }

        scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () {
            advances++;
            scheduler.photoChanged(nextPhoto());
          },
        );
        scheduler.start(Future.value());
        async.elapse(interval);
        expect(advances, 1);

        // Second photo takes 3s to load, then gets its own full interval.
        async.elapse(const Duration(seconds: 3));
        loads.last.complete();
        async.elapse(const Duration(seconds: 4));
        expect(advances, 1);
        async.elapse(const Duration(seconds: 1));
        expect(advances, 2);

        scheduler.dispose();
      });
    });

    test('a photo that fails to load still advances after the interval', () {
      fakeAsync((async) {
        var advances = 0;
        final scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () => advances++,
        );
        scheduler.start(Future.error(Exception('404')));
        async.elapse(interval);
        expect(advances, 1);
        scheduler.dispose();
      });
    });

    test('a manual skip discards the previous photo\'s countdown', () {
      fakeAsync((async) {
        var advances = 0;
        final scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () => advances++,
        );
        scheduler.start(Future.value());
        async.elapse(const Duration(seconds: 4));

        final skippedTo = Completer<void>();
        scheduler.photoChanged(skippedTo.future);
        async.elapse(const Duration(seconds: 2));
        expect(advances, 0);

        skippedTo.complete();
        async.elapse(interval);
        expect(advances, 1);

        scheduler.dispose();
      });
    });

    test('a load that finishes after the photo changed is ignored', () {
      fakeAsync((async) {
        var advances = 0;
        final scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () => advances++,
        );
        final stale = Completer<void>();
        scheduler.start(stale.future);
        final current = Completer<void>();
        scheduler.photoChanged(current.future);

        stale.complete();
        async.elapse(interval * 2);
        expect(advances, 0);

        scheduler.dispose();
      });
    });

    test('stop cancels a pending advance and photoChanged is a no-op while '
        'stopped', () {
      fakeAsync((async) {
        var advances = 0;
        final scheduler = PhotoSlideshowScheduler(
          interval: interval,
          onAdvance: () => advances++,
        );
        scheduler.start(Future.value());
        async.elapse(const Duration(seconds: 2));
        scheduler.stop();
        expect(scheduler.isRunning, isFalse);

        scheduler.photoChanged(Future.value());
        async.elapse(interval * 3);
        expect(advances, 0);
      });
    });
  });
}
