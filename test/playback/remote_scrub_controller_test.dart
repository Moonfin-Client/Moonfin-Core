import 'package:fake_async/fake_async.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/remote_scrub_controller.dart';

const _right = LogicalKeyboardKey.arrowRight;
const _left = LogicalKeyboardKey.arrowLeft;
const _holdDelay = RemoteScrubController.holdDelay;
const _speeds = RemoteScrubController.speeds;
const _second = Duration(seconds: 1);

/// A controller over a target that moves as the player's does, between 0 and
/// [len], with every call back to the player recorded.
class _Rig {
  _Rig({this.len = const Duration(seconds: 6000), this.stepMs = 10000}) {
    c = RemoteScrubController(
      enabled: () => enabled,
      runOn: () => runOn,
      step: () => stepMs,
      skipForward: () => 30000,
      skipBack: () => 10000,
      position: () => pos,
      duration: () => len,
      onReveal: () => reveals++,
      onSkip: skips.add,
      onStep: (ms) {
        steps.add(ms);
        final next = pos + Duration(milliseconds: ms);
        pos = next < Duration.zero ? Duration.zero : (next > len ? len : next);
      },
      onFinish: finishes.add,
    );
  }

  Duration len;
  int stepMs;
  bool enabled = true;
  bool runOn = false;
  Duration pos = const Duration(seconds: 60);
  final steps = <int>[];
  final skips = <int>[];
  final finishes = <bool>[];
  var reveals = 0;
  late final RemoteScrubController c;

  bool send(KeyEvent e, {bool onSeekbar = true, bool visible = true}) =>
      c.handleKey(e, onSeekbar: onSeekbar, controlsVisible: visible);
  bool down(
    LogicalKeyboardKey k, {
    bool onSeekbar = true,
    bool visible = true,
  }) =>
      send(_event(KeyDownEvent.new, k), onSeekbar: onSeekbar, visible: visible);
  bool up(LogicalKeyboardKey k) => send(_event(KeyUpEvent.new, k));

  void press(LogicalKeyboardKey k) {
    down(k);
    up(k);
  }

  /// A key held past the hold delay: a scrub at level 1, the key still down.
  void startHold(FakeAsync async, LogicalKeyboardKey k) {
    down(k);
    async.elapse(_holdDelay);
  }
}

KeyEvent _event(Function constructor, LogicalKeyboardKey key) =>
    Function.apply(constructor, const [], {
      #physicalKey: PhysicalKeyboardKey.abort,
      #logicalKey: key,
      #timeStamp: Duration.zero,
    }) as KeyEvent;

void main() {
  test('a click skips, with the controls up or hidden, and never scrubs', () {
    fakeAsync((async) {
      final rig = _Rig();
      expect(rig.down(_left, onSeekbar: false, visible: false), isTrue);
      expect(rig.reveals, 1);
      async.elapse(_holdDelay ~/ 2);
      expect(rig.up(_left), isFalse);
      expect(rig.skips, [-10000]);
      expect(rig.steps, isEmpty);

      expect(rig.down(_right), isTrue);
      async.elapse(_holdDelay ~/ 2);
      expect(rig.up(_right), isFalse);
      expect(rig.skips, [-10000, 30000]);
      expect(rig.steps, isEmpty);
      async.elapse(_second * 2);
      expect(rig.c.isScrubbing, isFalse);
      expect(rig.steps, isEmpty);
    });
  });

  test('a hold starts at level 1 with one step at once, then one a period', () {
    fakeAsync((async) {
      // A 10 s picture at level 1 (32 s a second) is a step every 312.5 ms.
      final rig = _Rig();
      rig.startHold(async, _right);
      expect(rig.c.isScrubbing, isTrue);
      expect(rig.c.level, 1);
      expect(rig.steps, [10000]);
      async.elapse(const Duration(milliseconds: 312));
      expect(rig.steps, [10000]);
      async.elapse(const Duration(milliseconds: 1));
      expect(rig.steps, List.filled(2, 10000));
      async.elapse(const Duration(milliseconds: 686));
      expect(rig.c.level, 1);
      expect(rig.steps, List.filled(4, 10000));
    });
  });

  test('a hold backward steps back one picture at a time', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _left);
      expect(rig.c.direction, RemoteScrubDirection.backward);
      expect(rig.steps, [-10000]);
      async.elapse(_second * 3);
      expect(rig.steps.every((ms) => ms == -10000), isTrue);
      expect(rig.steps.length, greaterThan(2));
    });
  });

  test('holding climbs a level a second, and the period follows', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _right);
      for (var level = 2; level <= _speeds.length; level++) {
        async.elapse(_second);
        expect(rig.c.level, level);
      }
      // A 10 s picture at 400 s a second is a step every 25 ms, 40 a second.
      var before = rig.steps.length;
      async.elapse(_second);
      expect(rig.steps.length - before, 40);
      // Another second changes nothing: it stays at the top level.
      before = rig.steps.length;
      async.elapse(_second);
      expect(rig.c.level, _speeds.length);
      expect(rig.steps.length - before, 40);
    });
  });

  test('a level change keeps the phase of the clock', () {
    fakeAsync((async) {
      // Level 1 steps at 0, 600, 1200 ms; level 2 is a step every 300 ms.
      // The climb at 1000 ms leaves the last step at 600, so the next is due
      // at 900: overdue, and it lands at once. A restarted clock would wait
      // until 1300.
      final rig = _Rig(stepMs: 19200);
      rig.startHold(async, _right);
      async.elapse(const Duration(milliseconds: 999));
      expect(rig.c.level, 1);
      expect(rig.steps.length, 2);
      async.elapse(const Duration(milliseconds: 1));
      expect(rig.c.level, 2);
      expect(rig.steps.length, 3);
      // The step after it is due at 1200, not 1300.
      async.elapse(const Duration(milliseconds: 200));
      expect(rig.steps.length, 4);
    });
  });

  test('a level change lands the next step one new period after the last', () {
    fakeAsync((async) {
      // Level 1 steps every 312.5 ms: 0, 312.5, 625, 937.5. The climb at
      // 1000 ms halves the period, so the next step is due at 1093.75, not
      // 1156.25 as a restarted clock would give.
      final rig = _Rig();
      rig.startHold(async, _right);
      async.elapse(_second);
      expect(rig.c.level, 2);
      expect(rig.steps.length, 4);
      async.elapse(const Duration(milliseconds: 93));
      expect(rig.steps.length, 4);
      async.elapse(const Duration(milliseconds: 1));
      expect(rig.steps.length, 5);
      // Then one every 156.25 ms: the next is due at 1250.
      async.elapse(const Duration(milliseconds: 155));
      expect(rig.steps.length, 5);
      async.elapse(const Duration(milliseconds: 1));
      expect(rig.steps.length, 6);
    });
  });

  test('no step is longer than one picture, at any level', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _right);
      async.elapse(_second * 6);
      expect(rig.steps.length, greaterThan(40));
      expect(rig.steps.every((ms) => ms == 10000), isTrue);
    });
  });

  test('a clock that runs late catches up the steps it missed', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _right);
      async.elapse(_second * 4);
      expect(rig.c.level, _speeds.length);
      final before = rig.steps.length;
      final at = rig.pos;
      // A second goes by with no timer firing, as when the UI isolate stalls.
      async.elapseBlocking(_second);
      async.elapse(Duration.zero);
      expect(rig.steps.length - before, 40);
      expect(rig.pos, at + const Duration(seconds: 400));
    });
  });

  test('release stops the scrub and declines the key', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _right);
      async.elapse(_second * 2);
      expect(rig.up(_right), isFalse);
      expect(rig.c.isScrubbing, isFalse);
      expect(rig.c.level, 0);
      final at = rig.pos;
      async.elapse(_second * 3);
      expect(rig.pos, at);
    });
  });

  test('the end stops the scrub, and release ends it', () {
    fakeAsync((async) {
      final rig = _Rig(len: const Duration(seconds: 100));
      rig.startHold(async, _right);
      async.elapse(_second * 10);
      expect(rig.pos, const Duration(seconds: 100));
      expect(rig.steps, List.filled(4, 10000));
      expect(rig.c.level, 0);
      expect(rig.c.isScrubbing, isTrue);
      expect(rig.up(_right), isFalse);
      expect(rig.c.isScrubbing, isFalse);
    });
  });

  test('a scrub that starts at the end stops at once', () {
    fakeAsync((async) {
      final rig = _Rig(len: const Duration(seconds: 70));
      rig.startHold(async, _right);
      expect(rig.steps, [10000]);
      expect(rig.c.level, 0);
      async.elapse(_second * 3);
      expect(rig.steps, [10000]);
    });
  });

  test('the controls and the skip button keep Left and Right', () {
    final rig = _Rig();
    expect(rig.down(_right, onSeekbar: false), isFalse);
  });

  test('only Left and Right are taken, and only when enabled', () {
    final rig = _Rig();
    final select = _event(KeyDownEvent.new, LogicalKeyboardKey.select);
    expect(rig.c.takes(select), isFalse);
    expect(rig.send(select), isFalse);
    expect(rig.c.takes(_event(KeyDownEvent.new, _left)), isTrue);
    rig.enabled = false;
    expect(rig.c.takes(_event(KeyDownEvent.new, _left)), isFalse);
    expect(rig.down(_left), isFalse);
  });

  test('stop ends a hold in progress and a running scrub', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.down(_right);
      rig.c.stop();
      async.elapse(_holdDelay);
      expect(rig.c.isScrubbing, isFalse);
      rig.startHold(async, _right);
      rig.c.stop();
      final at = rig.pos;
      async.elapse(_second);
      expect(rig.pos, at);
    });
  });

  test('another key pressed during a hold is taken and changes nothing', () {
    fakeAsync((async) {
      final rig = _Rig();
      rig.startHold(async, _right);
      expect(rig.down(_left), isTrue);
      expect(rig.up(_left), isTrue);
      expect(rig.c.direction, RemoteScrubDirection.forward);
      expect(rig.c.isScrubbing, isTrue);
    });
  });

  test('with no length a hold stays a click', () {
    fakeAsync((async) {
      final rig = _Rig(len: Duration.zero);
      rig.down(_right);
      async.elapse(_holdDelay);
      expect(rig.c.isScrubbing, isFalse);
      rig.up(_right);
      expect(rig.skips, [30000]);
      expect(rig.steps, isEmpty);
    });
  });

  group('Keep Scrubbing After Release', () {
    _Rig runOnRig({Duration? len}) {
      final rig = len == null ? _Rig() : _Rig(len: len);
      rig.runOn = true;
      return rig;
    }

    test('a hold runs on after release at its level, one picture a period', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.down(_right);
        async.elapse(_holdDelay);
        expect(rig.up(_right), isTrue);
        expect(rig.c.isScrubbing, isTrue);
        expect(rig.c.level, 1);
        expect(rig.steps, [10000]);
        async.elapse(_second * 5);
        // A 10 s picture at 32 s a second is a step every 312.5 ms: one at
        // the start, then 16 in 5 s.
        expect(rig.steps, List.filled(17, 10000));
        expect(rig.pos, const Duration(seconds: 230));
      });
    });

    test(
      'presses go up to the cap, down, and turn around; FF and Rewind too',
      () {
        fakeAsync((async) {
          final rig = runOnRig();
          rig.startHold(async, _right);
          rig.up(_right);
          for (var i = 0; i < _speeds.length + 1; i++) {
            rig.press(_right);
          }
          expect(rig.c.level, _speeds.length);
          for (var i = 0; i < _speeds.length; i++) {
            rig.press(_left);
          }
          expect(rig.c.direction, RemoteScrubDirection.backward);
          expect(rig.c.level, 1);
          rig.down(LogicalKeyboardKey.mediaRewind);
          expect(rig.c.level, 2);
          rig.down(LogicalKeyboardKey.mediaFastForward);
          expect(rig.c.level, 1);
        });
      },
    );

    test('a release at level 3 runs on at that level', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.down(_right);
        async.elapse(_holdDelay + _second * 2);
        expect(rig.c.level, 3);
        expect(rig.up(_right), isTrue);
        expect(rig.c.level, 3);
        final at = rig.pos;
        async.elapse(const Duration(milliseconds: 1250));
        // A 10 s picture at 128 s a second is a step every 78.125 ms: 16 steps
        // in 1.25 s.
        expect(rig.pos, at + const Duration(seconds: 160));
      });
    });

    test('a hold that reaches the top level stops on release', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.down(_right);
        async.elapse(_holdDelay + _second * (_speeds.length - 1));
        expect(rig.c.level, _speeds.length);
        expect(rig.up(_right), isFalse);
        expect(rig.c.level, 0);
        expect(rig.c.isScrubbing, isTrue);
        expect(rig.c.atEnd, isFalse);
        final at = rig.pos;
        async.elapse(_second);
        expect(rig.pos, at);
      });
    });

    test('presses up to the top level keep it running there', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.startHold(async, _right);
        rig.up(_right);
        for (var i = 1; i < _speeds.length; i++) {
          expect(rig.down(_right), isTrue);
          expect(rig.up(_right), isTrue);
        }
        expect(rig.c.level, _speeds.length);
        final at = rig.pos;
        async.elapse(_second);
        expect(rig.pos, at + Duration(seconds: _speeds.last));
      });
    });

    test('the end stops the scrub and a press starts it again', () {
      fakeAsync((async) {
        final rig = runOnRig(len: const Duration(seconds: 70));
        rig.startHold(async, _right);
        rig.up(_right);
        expect(rig.c.level, 0);
        expect(rig.c.atEnd, isTrue);
        rig.down(_left);
        rig.up(_left);
        expect(rig.c.level, 1);
        expect(rig.c.atEnd, isFalse);
        expect(rig.pos, const Duration(seconds: 60));
      });
    });

    test('a restart after a long wait at the end steps once, not a burst', () {
      fakeAsync((async) {
        final rig = runOnRig(len: const Duration(seconds: 70));
        rig.startHold(async, _right);
        rig.up(_right);
        expect(rig.c.atEnd, isTrue);
        async.elapse(_second * 30);
        final before = rig.steps.length;
        rig.press(_left);
        expect(rig.steps.length - before, 1);
        expect(rig.pos, const Duration(seconds: 60));
        async.elapse(const Duration(milliseconds: 311));
        expect(rig.steps.length - before, 1);
      });
    });

    test(
      'OK and Play finish and play, Pause finishes paused, Back is left',
      () {
        fakeAsync((async) {
          final rig = runOnRig();
          rig.startHold(async, _right);
          rig.up(_right);
          expect(rig.down(LogicalKeyboardKey.goBack), isFalse);
          rig.down(LogicalKeyboardKey.select);
          rig.down(LogicalKeyboardKey.mediaPlay);
          rig.down(LogicalKeyboardKey.mediaPause);
          expect(rig.finishes, [true, true, false]);
        });
      },
    );

    test('a running scrub takes Up and Down, and so the player does not', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.startHold(async, _right);
        rig.up(_right);
        final up = _event(KeyDownEvent.new, LogicalKeyboardKey.arrowUp);
        expect(rig.c.takes(up), isTrue);
        expect(rig.send(up), isTrue);
        expect(rig.down(LogicalKeyboardKey.arrowDown), isTrue);
        rig.c.stop();
        expect(rig.c.takes(up), isFalse);
      });
    });

    test('with it off, a hold leaves OK and Up to the player', () {
      fakeAsync((async) {
        final rig = _Rig();
        rig.startHold(async, _right);
        final select = _event(KeyDownEvent.new, LogicalKeyboardKey.select);
        expect(rig.c.takes(select), isFalse);
        expect(rig.send(select), isFalse);
        expect(rig.down(LogicalKeyboardKey.arrowUp), isFalse);
        expect(rig.finishes, isEmpty);
      });
    });

    test('a stray release during a scrub is taken', () {
      fakeAsync((async) {
        final rig = runOnRig();
        rig.down(_right);
        async.elapse(_holdDelay);
        rig.down(_left);
        expect(rig.up(_right), isTrue);
      });
    });
  });
}
