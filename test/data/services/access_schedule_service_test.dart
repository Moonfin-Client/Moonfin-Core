import 'dart:async';

import 'package:clock/clock.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/access_schedule_service.dart';
import 'package:server_core/server_core.dart';

AccessSchedule _entry(String day, num start, num end) => AccessSchedule(
  dayOfWeek: day,
  startHour: start.toDouble(),
  endHour: end.toDouble(),
);

// 2026-10-19 is a Monday.
DateTime _at(int day, int hour, [int minute = 0, int second = 0]) =>
    DateTime(2026, 10, day, hour, minute, second);

/// A service on a fake clock that starts at [start], with the schedule the
/// test hands back from [loadSchedules] and a count of how often it blocked.
class _Harness {
  _Harness(
    this.async,
    DateTime start, {
    List<AccessSchedule>? Function(int call)? schedules,
    bool? refuses,
    Future<ServerTime?> Function(int call)? serverTime,
  }) : clock = async.getClock(start) {
    service = AccessScheduleService(
      now: () => clock.now(),
      loadSchedules: (userId) async {
        loads.add(userId);
        return schedules == null ? const [] : schedules(loads.length);
      },
      onBlocked: () async => blocked++,
      serverRefuses: () async {
        asks++;
        return refuses;
      },
      loadServerTime: serverTime == null
          ? null
          : () {
              timeAsks++;
              return serverTime(timeAsks);
            },
    );
  }

  final FakeAsync async;
  final Clock clock;
  late final AccessScheduleService service;
  final loads = <String>[];
  int blocked = 0;
  int asks = 0;
  int timeAsks = 0;

  void settle() => async.flushMicrotasks();

  void elapse(Duration duration) {
    async.elapse(duration);
    async.flushMicrotasks();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a user with no schedule is never blocked', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 12));
      h.service.setUser('child');
      h.settle();

      expect(h.service.status.allowed, isTrue);
      h.elapse(const Duration(days: 2));
      expect(h.service.status.allowed, isTrue);
      expect(h.blocked, 0);
      h.service.dispose();
    });
  });

  test('nobody is watched until a user is set, or after it is cleared', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 12));
      h.settle();
      expect(h.loads, isEmpty);

      h.service.setUser('child');
      h.settle();
      expect(h.loads, ['child']);

      h.service.setUser(null);
      h.elapse(const Duration(hours: 1));
      expect(h.loads, ['child']);
      expect(h.service.status.allowed, isTrue);
      h.service.dispose();
    });
  });

  test('blocks at the moment the window closes, and once', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 19, 59, 50),
        schedules: (_) => [_entry('Monday', 8, 20)],
      );
      h.service.setUser('child');
      h.settle();
      expect(h.service.status.allowed, isTrue);
      expect(h.blocked, 0);

      h.elapse(const Duration(seconds: 5));
      expect(
        h.service.status.allowed,
        isTrue,
        reason: 'the end is still allowed',
      );

      h.elapse(const Duration(seconds: 10));
      expect(h.service.status.allowed, isFalse);
      expect(h.blocked, 1);
      expect(h.service.status.nextAccess, _at(26, 8));

      h.elapse(const Duration(minutes: 30));
      expect(h.blocked, 1, reason: 'staying out does not stop playback again');
      h.service.dispose();
    });
  });

  test('is blocked at once when the user arrives outside the window', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        schedules: (_) => [_entry('Monday', 8, 20), _entry('Tuesday', 8, 20)],
      );
      h.service.setUser('child');
      h.settle();

      expect(h.service.status.allowed, isFalse);
      expect(h.service.status.nextAccess, _at(20, 8));
      expect(h.blocked, 1);
      h.service.dispose();
    });
  });

  test('lifts the block when the window opens again', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        schedules: (_) => [_entry('Monday', 8, 20), _entry('Tuesday', 8, 20)],
      );
      h.service.setUser('child');
      h.settle();
      expect(h.service.isBlocked, isTrue);

      h.elapse(const Duration(hours: 11) + const Duration(seconds: 1));
      expect(h.service.status.allowed, isTrue);
      h.service.dispose();
    });
  });

  test('a parent extending the window before it closes is picked up', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 19, 59, 55),
        // The first look sees a window to 20:00, the later ones one to 22:00.
        schedules: (call) => [_entry('Monday', 8, call == 1 ? 20 : 22)],
      );
      h.service.setUser('child');
      h.settle();

      h.elapse(const Duration(seconds: 10));
      expect(h.service.status.allowed, isTrue);
      expect(h.blocked, 0);

      h.elapse(const Duration(hours: 2));
      expect(h.service.status.allowed, isFalse);
      expect(h.blocked, 1);
      h.service.dispose();
    });
  });

  test('a parent shortening the window is picked up within the poll', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 15),
        schedules: (call) => [_entry('Monday', 8, call == 1 ? 20 : 14.9)],
      );
      h.service.setUser('child');
      h.settle();
      expect(h.service.status.allowed, isTrue);

      h.elapse(AccessScheduleService.pollInterval + const Duration(seconds: 1));
      expect(h.service.status.allowed, isFalse);
      expect(h.blocked, 1);
      h.service.dispose();
    });
  });

  test('a refused request makes it look at once, but not in a burst', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 15),
        schedules: (call) => [_entry('Monday', 8, call == 1 ? 20 : 14.9)],
      );
      h.service.setUser('child');
      h.settle();
      expect(h.loads.length, 1);

      h.service.noteRefused();
      h.service.noteRefused();
      h.service.noteRefused();
      h.settle();

      expect(h.loads.length, 2);
      expect(h.service.isBlocked, isTrue);
      h.service.dispose();
    });
  });

  test('a refused request with nobody signed in does nothing', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 15));
      h.service.noteRefused();
      h.settle();

      expect(h.loads, isEmpty);
      h.service.dispose();
    });
  });

  test('looks every minute while blocked, so extra time shows up quickly', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        // Closed at first, then a parent gives the user until midnight.
        schedules: (call) => [_entry('Monday', 8, call == 1 ? 20 : 24)],
      );
      h.service.setUser('child');
      h.settle();
      expect(h.service.isBlocked, isTrue);

      h.elapse(AccessScheduleService.pollInterval + const Duration(seconds: 1));
      expect(h.service.status.allowed, isTrue);
      h.service.dispose();
    });
  });

  test(
    'a schedule that cannot be read leaves the last one and tries again',
    () {
      fakeAsync((async) {
        final h = _Harness(
          async,
          _at(19, 19, 59, 50),
          schedules: (call) => call == 1 ? [_entry('Monday', 8, 20)] : null,
        );
        h.service.setUser('child');
        h.settle();

        h.elapse(const Duration(seconds: 15));
        expect(
          h.service.status.allowed,
          isFalse,
          reason: 'the old schedule holds',
        );
        expect(h.blocked, 1);

        final before = h.loads.length;
        h.elapse(
          AccessScheduleService.retryInterval + const Duration(seconds: 1),
        );
        expect(h.loads.length, greaterThan(before));
        h.service.dispose();
      });
    },
  );

  test('an answer for the previous user is not applied to the next', () {
    fakeAsync((async) {
      final slow = Completer<List<AccessSchedule>?>();
      final clock = async.getClock(_at(19, 21));
      final service = AccessScheduleService(
        now: () => clock.now(),
        loadSchedules: (userId) =>
            userId == 'first' ? slow.future : Future.value(const []),
        onBlocked: () async {},
      );

      service.setUser('first');
      service.setUser('second');
      async.flushMicrotasks();
      slow.complete([_entry('Monday', 8, 20)]);
      async.flushMicrotasks();

      expect(service.status.allowed, isTrue);
      service.dispose();
    });
  });

  test('an older look finishing late does not undo a newer one', () {
    fakeAsync((async) {
      final slow = Completer<List<AccessSchedule>?>();
      final clock = async.getClock(_at(19, 21));
      var calls = 0;
      final service = AccessScheduleService(
        now: () => clock.now(),
        loadSchedules: (userId) {
          calls++;
          // The first look is slow and still sees the longer window. The
          // look a refusal starts sees it shortened, and answers first.
          return calls == 1
              ? slow.future
              : Future.value([_entry('Monday', 8, 20)]);
        },
        onBlocked: () async {},
      );

      service.setUser('child');
      service.noteRefused();
      async.flushMicrotasks();
      expect(service.status.allowed, isFalse);

      slow.complete([_entry('Monday', 8, 22)]);
      async.flushMicrotasks();

      expect(service.status.allowed, isFalse);
      service.dispose();
    });
  });

  test('an answer is kept when a look started after it fails', () {
    fakeAsync((async) {
      final slow = Completer<List<AccessSchedule>?>();
      final clock = async.getClock(_at(19, 21));
      var calls = 0;
      final service = AccessScheduleService(
        now: () => clock.now(),
        loadSchedules: (userId) {
          calls++;
          return calls == 1 ? slow.future : Future.error(Exception('offline'));
        },
        onBlocked: () async {},
      );

      service.setUser('child');
      service.noteRefused();
      async.flushMicrotasks();
      expect(service.status.allowed, isTrue);

      slow.complete([_entry('Monday', 8, 20)]);
      async.flushMicrotasks();

      expect(service.status.allowed, isFalse);
      service.dispose();
    });
  });

  test('coming back to the app looks at the schedule again', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 12), schedules: (_) => const []);
      h.service.setUser('child');
      h.settle();
      expect(h.loads, hasLength(1));

      final binding = TestWidgetsFlutterBinding.instance;
      binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
      binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      h.settle();

      expect(h.loads, hasLength(2));
      h.service.dispose();
    });
  });

  test('setting the same user again does nothing', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 12));
      h.service.setUser('child');
      h.settle();
      h.service.setUser('child');
      h.settle();

      expect(h.loads, hasLength(1));
      h.service.dispose();
    });
  });

  test('the server turning the user away decides, whatever the clock says', () {
    fakeAsync((async) {
      // Open by this device's clock, but the server keeps another time zone.
      final h = _Harness(
        async,
        _at(19, 15),
        schedules: (_) => [_entry('Monday', 8, 20)],
        refuses: true,
      );
      h.service.setUser('child');
      h.settle();

      expect(h.service.isBlocked, isTrue);
      expect(h.blocked, 1);
      expect(
        h.service.status.nextAccess,
        isNull,
        reason: "this device's clock can't say when the server opens",
      );
      h.service.dispose();
    });
  });

  test('a server still answering keeps it open, whatever the clock says', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 15),
        schedules: (_) => [_entry('Monday', 8, 14)],
        refuses: false,
      );
      h.service.setUser('child');
      h.settle();

      expect(h.service.status.allowed, isTrue);
      expect(h.blocked, 0);
      h.service.dispose();
    });
  });

  test('a server and clock that agree name the time to come back', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        schedules: (_) => [_entry('Everyday', 8, 20)],
        refuses: true,
      );
      h.service.setUser('child');
      h.settle();

      expect(h.service.status.nextAccess, _at(20, 8));
      h.service.dispose();
    });
  });

  test("a server that can't be asked leaves it to the clock", () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        schedules: (_) => [_entry('Monday', 8, 20)],
      );
      h.service.setUser('child');
      h.settle();

      expect(h.asks, 1);
      expect(h.service.isBlocked, isTrue);
      h.service.dispose();
    });
  });

  test('without a schedule the server is not asked and looks are rarer', () {
    fakeAsync((async) {
      final h = _Harness(async, _at(19, 12), refuses: true);
      h.service.setUser('child');
      h.settle();
      expect(h.loads.length, 1);

      h.elapse(AccessScheduleService.pollInterval + const Duration(seconds: 1));
      expect(h.loads.length, 1);
      h.elapse(AccessScheduleService.idlePollInterval);
      expect(h.loads.length, 2);
      expect(h.asks, 0);
      expect(h.service.status.allowed, isTrue);
      h.service.dispose();
    });
  });

  test('a refused request while blocked does not look again', () {
    fakeAsync((async) {
      final h = _Harness(
        async,
        _at(19, 21),
        schedules: (_) => [_entry('Monday', 8, 20)],
        refuses: true,
      );
      h.service.setUser('child');
      h.settle();
      expect(h.service.isBlocked, isTrue);

      h.service.noteRefused();
      h.settle();
      expect(h.loads.length, 1);
      h.service.dispose();
    });
  });

  group('with the server clock', () {
    // The device says Monday 21:00, after the window. What the server says is
    // its UTC time and offset, so the wall clock the tests want is the first
    // plus the second, whatever zone the machine running them is in.
    Future<ServerTime?> serverAt(int day, int utcHour, int offsetHours) async =>
        ServerTime(
          utcTime: DateTime.utc(2026, 10, day, utcHour),
          utcOffset: Duration(hours: offsetHours),
        );

    test('stays open when the server clock says the window is open', () {
      fakeAsync((async) {
        final h = _Harness(
          async,
          _at(19, 21),
          schedules: (_) => [_entry('Monday', 8, 20)],
          serverTime: (_) => serverAt(19, 21, -8),
        );
        h.service.setUser('child');
        h.settle();

        expect(h.service.status.allowed, isTrue);
        expect(h.blocked, 0);
        expect(h.service.scheduleNow.hour, 13);
        h.service.dispose();
      });
    });

    test(
      'blocks when the server clock says closed though the device says open',
      () {
        fakeAsync((async) {
          final h = _Harness(
            async,
            _at(19, 12),
            schedules: (_) => [_entry('Monday', 8, 20)],
            serverTime: (_) => serverAt(19, 12, 9),
          );
          h.service.setUser('child');
          h.settle();

          expect(h.service.status.allowed, isFalse);
          expect(h.blocked, 1);
          expect(h.service.status.nextAccess, DateTime.utc(2026, 10, 26, 8));
          h.service.dispose();
        });
      },
    );

    test('lets the server answer of the user still decide', () {
      fakeAsync((async) {
        final h = _Harness(
          async,
          _at(19, 21),
          schedules: (_) => [_entry('Monday', 8, 20)],
          refuses: true,
          serverTime: (_) => serverAt(19, 21, -8),
        );
        h.service.setUser('child');
        h.settle();

        expect(h.service.status.allowed, isFalse);
        h.service.dispose();
      });
    });

    test(
      'goes by the device clock and stops asking when the server has no time',
      () {
        fakeAsync((async) {
          final h = _Harness(
            async,
            _at(19, 21),
            schedules: (_) => [_entry('Monday', 8, 20)],
            serverTime: (_) async => null,
          );
          h.service.setUser('child');
          h.settle();

          expect(h.service.status.allowed, isFalse);
          expect(h.service.scheduleNow, _at(19, 21));
          h.elapse(const Duration(minutes: 5));
          expect(h.timeAsks, 1);
          h.service.dispose();
        });
      },
    );

    test('keeps the last server clock when a later read fails', () {
      fakeAsync((async) {
        final h = _Harness(
          async,
          _at(19, 21),
          schedules: (_) => [_entry('Monday', 8, 20)],
          serverTime: (call) => call == 1
              ? serverAt(19, 21, -8)
              : Future.error(StateError('offline')),
        );
        h.service.setUser('child');
        h.settle();
        h.elapse(const Duration(minutes: 2));

        expect(h.timeAsks, greaterThan(1));
        expect(h.service.status.allowed, isTrue);
        expect(h.service.scheduleNow.hour, 13);
        h.service.dispose();
      });
    });

    test(
      'keeps reading the clock while blocked, so its offset stays right',
      () {
        fakeAsync((async) {
          // Blocked at 21:00 UTC with a server offset of 0. The server then
          // moves to UTC+1 a few minutes later, as across a daylight saving
          // change, which moves its wall clock to 22:05, inside the window.
          late final _Harness h;
          h = _Harness(
            async,
            DateTime.utc(2026, 10, 19, 21).toLocal(),
            schedules: (_) => [
              _entry('Monday', 8, 20),
              _entry('Monday', 22, 23),
            ],
            serverTime: (call) async => ServerTime(
              utcTime: h.clock.now().toUtc(),
              utcOffset: Duration(hours: call == 1 ? 0 : 1),
            ),
          );
          h.service.setUser('child');
          h.settle();
          expect(h.service.isBlocked, isTrue);
          expect(h.timeAsks, 1);

          h.elapse(const Duration(minutes: 5));
          expect(h.timeAsks, greaterThan(1));
          expect(h.service.scheduleNow.hour, 22);
          expect(h.service.status.allowed, isTrue);
          h.service.dispose();
        });
      },
    );

    test('reads a launch that is already closed on the server clock', () {
      fakeAsync((async) {
        // Monday 12:00 UTC is 21:00 on the server, nine hours ahead:
        // closed, and the next opening is the server's Tuesday 08:00.
        late final _Harness h;
        h = _Harness(
          async,
          DateTime.utc(2026, 10, 19, 12).toLocal(),
          schedules: (_) => [_entry('Weekday', 8, 20)],
          refuses: true,
          serverTime: (_) async => ServerTime(
            utcTime: h.clock.now().toUtc(),
            utcOffset: const Duration(hours: 9),
          ),
        );
        h.service.setUser('child');
        h.settle();

        expect(h.service.isBlocked, isTrue);
        expect(h.service.status.nextAccess, DateTime.utc(2026, 10, 20, 8));
        h.service.dispose();
      });
    });

    test('blocks on a refusal without waiting for a slow clock', () {
      fakeAsync((async) {
        // Monday 21:00 UTC is Tuesday 06:00 on a server nine hours ahead, so
        // once the clock answers the next opening is the server's 08:00.
        final slow = Completer<ServerTime?>();
        late final _Harness h;
        h = _Harness(
          async,
          DateTime.utc(2026, 10, 19, 21).toLocal(),
          schedules: (_) => [_entry('Weekday', 8, 20)],
          refuses: true,
          serverTime: (_) => slow.future,
        );
        h.service.setUser('child');
        h.settle();
        expect(h.asks, 1);
        expect(h.timeAsks, 1, reason: 'both are asked at once');
        expect(h.service.isBlocked, isTrue, reason: 'before the clock answers');
        expect(h.blocked, 1);

        slow.complete(
          ServerTime(
            utcTime: h.clock.now().toUtc(),
            utcOffset: const Duration(hours: 9),
          ),
        );
        h.settle();
        expect(h.service.isBlocked, isTrue);
        expect(h.blocked, 1, reason: 'playback is stopped once');
        expect(h.service.status.nextAccess, DateTime.utc(2026, 10, 20, 8));
        h.service.dispose();
      });
    });

    test('lets the user back in without waiting for a slow clock', () {
      fakeAsync((async) {
        // Refused on the first look, answered on the next while the clock
        // read hangs.
        final clock = async.getClock(_at(19, 21));
        final slow = Completer<ServerTime?>();
        var refusing = true;
        final service = AccessScheduleService(
          now: () => clock.now(),
          loadSchedules: (_) async => [_entry('Monday', 8, 20)],
          onBlocked: () async {},
          serverRefuses: () async => refusing,
          loadServerTime: () => slow.future,
        );
        service.setUser('child');
        async.flushMicrotasks();
        expect(service.isBlocked, isTrue);

        refusing = false;
        unawaited(service.refresh());
        async.flushMicrotasks();
        expect(service.isBlocked, isFalse, reason: 'before the clock answers');

        slow.complete(null);
        async.flushMicrotasks();
        expect(service.isBlocked, isFalse);
        service.dispose();
      });
    });

    test('tells listeners when the clock moves while blocked', () {
      fakeAsync((async) {
        // Both looks find the user blocked with the same opening, the
        // server's Tuesday 08:00, but the second clock runs half an hour
        // ahead of the first, which moves the time the screen reads.
        late final _Harness h;
        h = _Harness(
          async,
          DateTime.utc(2026, 10, 19, 21).toLocal(),
          schedules: (_) => [_entry('Weekday', 8, 20)],
          refuses: true,
          serverTime: (call) async => ServerTime(
            utcTime: h.clock.now().toUtc().add(
              Duration(minutes: call == 1 ? 0 : 30),
            ),
            utcOffset: const Duration(hours: 9),
          ),
        );
        h.service.setUser('child');
        h.settle();
        final opening = h.service.status.nextAccess;
        expect(opening, DateTime.utc(2026, 10, 20, 8));
        var told = 0;
        h.service.addListener(() => told++);

        h.elapse(AccessScheduleService.pollInterval);
        expect(h.timeAsks, 2);
        expect(h.service.status.nextAccess, opening);
        expect(told, greaterThan(0));
        expect(h.service.scheduleNow.minute, 31);
        h.service.dispose();
      });
    });

    test('a failed read does not undo a clock an overlapping look brought', () {
      fakeAsync((async) {
        // Two looks overlap. The first one's clock answers; the second, which
        // started before that answer came, then fails to read the clock. The
        // first one's clock stays.
        final first = Completer<ServerTime?>();
        final second = Completer<ServerTime?>();
        late final _Harness h;
        h = _Harness(
          async,
          DateTime.utc(2026, 10, 19, 21).toLocal(),
          schedules: (_) => [_entry('Weekday', 8, 20)],
          serverTime: (call) => call == 1 ? first.future : second.future,
        );
        h.service.setUser('child');
        h.settle();
        unawaited(h.service.refresh());
        h.settle();
        expect(h.timeAsks, 2);

        first.complete(
          ServerTime(
            utcTime: h.clock.now().toUtc(),
            utcOffset: const Duration(hours: 9),
          ),
        );
        h.settle();
        expect(h.service.scheduleNow.hour, 6);

        second.completeError(StateError('offline'));
        h.settle();
        expect(h.service.scheduleNow.isUtc, isTrue);
        expect(h.service.scheduleNow.hour, 6);
        h.service.dispose();
      });
    });

    test('is not asked of a user without a schedule', () {
      fakeAsync((async) {
        final h = _Harness(
          async,
          _at(19, 12),
          serverTime: (_) => serverAt(19, 12, 0),
        );
        h.service.setUser('child');
        h.settle();

        expect(h.timeAsks, 0);
        h.service.dispose();
      });
    });
  });

  test('stopping playback going wrong does not undo the block', () {
    fakeAsync((async) {
      final clock = async.getClock(_at(19, 21));
      final service = AccessScheduleService(
        now: () => clock.now(),
        loadSchedules: (_) async => [_entry('Monday', 8, 20)],
        onBlocked: () async => throw StateError('no player'),
      );

      service.setUser('child');
      async.flushMicrotasks();

      expect(service.status.allowed, isFalse);
      service.dispose();
    });
  });
}
