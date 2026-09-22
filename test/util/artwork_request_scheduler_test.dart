import 'package:clock/clock.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/artwork_request_scheduler.dart';
import 'package:moonfin/util/image_fetch_priority.dart';

void main() {
  /// Runs [body] under a fake clock so batch gaps are exact.
  void run(
    void Function(FakeAsync async, ArtworkRequestScheduler s) body, {
    int slots = 1,
  }) {
    fakeAsync((async) {
      withClock(Clock(() => async.getClock(DateTime(2026)).now()), () {
        body(async, ArtworkRequestScheduler(slots: slots));
      });
    });
  }

  List<String> order = <String>[];

  void want(
    ArtworkRequestScheduler s,
    String url, {
    ImageFetchPriority priority = ImageFetchPriority.normal,
  }) {
    s.acquire(url, priority: priority).then((_) => order.add(url));
  }

  setUp(() => order = <String>[]);

  test('first come first served inside one batch', () {
    run((async, s) {
      want(s, 'a');
      want(s, 'b');
      want(s, 'c');
      async.flushMicrotasks();
      expect(order, ['a']);
      s.release();
      async.flushMicrotasks();
      s.release();
      async.flushMicrotasks();
      expect(order, ['a', 'b', 'c']);
    });
  });

  test('a newer batch is admitted before the rest of an older one', () {
    run((async, s) {
      want(s, 'a1');
      want(s, 'a2');
      want(s, 'a3');
      async.elapse(const Duration(milliseconds: 9));
      want(s, 'b1');
      want(s, 'b2');
      async.flushMicrotasks();
      expect(order, ['a1']);
      for (var i = 0; i < 4; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['a1', 'b1', 'b2', 'a2', 'a3']);
    });
  });

  test('the batch gap boundary is exact', () {
    run((async, s) {
      want(s, 'a');
      want(s, 'b');
      async.elapse(ArtworkRequestScheduler.defaultBatchGap);
      want(s, 'same');
      async.elapse(
        ArtworkRequestScheduler.defaultBatchGap +
            const Duration(microseconds: 1),
      );
      want(s, 'next');
      async.flushMicrotasks();
      for (var i = 0; i < 3; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['a', 'next', 'b', 'same']);
    });
  });

  test('high beats every normal batch and low waits for an idle line', () {
    run((async, s) {
      want(s, 'first');
      want(s, 'low', priority: ImageFetchPriority.low);
      want(s, 'n1');
      async.elapse(const Duration(milliseconds: 20));
      want(s, 'n2');
      want(s, 'high', priority: ImageFetchPriority.high);
      async.flushMicrotasks();
      for (var i = 0; i < 4; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['first', 'high', 'n2', 'n1', 'low']);
    });
  });

  test('promote files a request as if it were made now', () {
    run((async, s) {
      want(s, 'first');
      want(s, 'old');
      async.elapse(const Duration(milliseconds: 20));
      want(s, 'newer');
      async.elapse(const Duration(milliseconds: 20));
      s.promote('old', ImageFetchPriority.normal);
      async.flushMicrotasks();
      for (var i = 0; i < 2; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['first', 'old', 'newer']);
    });
  });

  test('promote lifts a low prefetch into the normal lane', () {
    run((async, s) {
      want(s, 'first');
      want(s, 'prefetch', priority: ImageFetchPriority.low);
      want(s, 'visible');
      async.elapse(const Duration(milliseconds: 20));
      s.promote('prefetch', ImageFetchPriority.normal);
      async.flushMicrotasks();
      for (var i = 0; i < 2; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['first', 'prefetch', 'visible']);
    });
  });

  test('promote never lowers a lane and ignores unknown urls', () {
    run((async, s) {
      want(s, 'first');
      want(s, 'urgent', priority: ImageFetchPriority.high);
      want(s, 'plain');
      s.promote('urgent', ImageFetchPriority.low);
      s.promote('nobody', ImageFetchPriority.high);
      async.flushMicrotasks();
      for (var i = 0; i < 2; i++) {
        s.release();
        async.flushMicrotasks();
      }
      expect(order, ['first', 'urgent', 'plain']);
    });
  });

  test('slots bound what is admitted at once', () {
    run(slots: 2, (async, s) {
      for (final name in ['a', 'b', 'c', 'd']) {
        want(s, name);
      }
      async.flushMicrotasks();
      expect(order, ['a', 'b']);
      expect(s.running, 2);
      expect(s.queueDepth, 2);
      s.release();
      async.flushMicrotasks();
      expect(order, ['a', 'b', 'c']);
    });
  });

  test('a queued request is not held back by a stream of newer ones', () {
    // Newest batch first alone left the screensaver's request at the back of
    // the queue for as long as the app behind it kept cycling, so every slide
    // but the first stayed black.
    run((async, s) {
      want(s, 'in-flight');
      async.flushMicrotasks();
      want(s, 'slide-backdrop');
      async.flushMicrotasks();

      for (var i = 0; i < 30; i++) {
        async.elapse(const Duration(milliseconds: 200));
        want(s, 'background-$i');
        async.flushMicrotasks();
        s.release();
        async.flushMicrotasks();
      }

      expect(order, contains('slide-backdrop'));
    });
  });

  test('the wait ceiling does not disturb a settling screen', () {
    run((async, s) {
      want(s, 'in-flight');
      async.flushMicrotasks();
      want(s, 'old');
      async.elapse(const Duration(milliseconds: 20));
      want(s, 'new');
      async.flushMicrotasks();
      // Both queued well inside the ceiling, so the newer one still wins.
      s.release();
      async.flushMicrotasks();
      expect(order, ['in-flight', 'new']);
    });
  });

  test('release with an empty queue is harmless', () {
    run((async, s) {
      s.release();
      s.release();
      expect(s.running, 0);
      want(s, 'a');
      async.flushMicrotasks();
      expect(order, ['a']);
    });
  });

  test('the admission carries batch and depth for the log', () {
    run((async, s) {
      ArtworkAdmission? seen;
      s.acquire('a').then((admission) => seen = admission);
      s.acquire('b');
      s.acquire('c').then((admission) => seen = admission);
      async.flushMicrotasks();
      expect(seen?.queueDepth, 0);
      s.release();
      s.release();
      async.flushMicrotasks();
      expect(seen?.queueDepth, 1);
      expect(seen?.batch, 1);
    });
  });
}
