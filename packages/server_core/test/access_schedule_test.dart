import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

AccessSchedule _entry(String day, num start, num end) => AccessSchedule(
  dayOfWeek: day,
  startHour: start.toDouble(),
  endHour: end.toDouble(),
);

// 2026-10-19 is a Monday.
DateTime _at(int day, int hour, [int minute = 0, int second = 0]) =>
    DateTime(2026, 10, day, hour, minute, second);
const _monday = 19;
const _tuesday = 20;
const _friday = 23;
const _saturday = 24;
const _sunday = 25;

void main() {
  group('isAllowed', () {
    test('a user with no entries is always allowed', () {
      expect(AccessScheduleEvaluator.isAllowed([], _at(_monday, 3)), isTrue);
    });

    test('allows the hours of the day an entry covers', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 12)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 7, 59, 59)),
        isFalse,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 20, 0, 1)),
        isFalse,
      );
    });

    test('the start and the end themselves are still allowed', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 8)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 20)),
        isTrue,
      );
    });

    test('another day is not allowed', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_tuesday, 12)),
        isFalse,
      );
    });

    test('reads half hours', () {
      final schedules = [_entry('Monday', 8.5, 17.5)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 8, 29)),
        isFalse,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 8, 30)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 17, 30)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 17, 31)),
        isFalse,
      );
    });

    test('Everyday, Weekday and Weekend cover the days they say', () {
      final everyday = [_entry('Everyday', 8, 20)];
      final weekday = [_entry('Weekday', 8, 20)];
      final weekend = [_entry('Weekend', 8, 20)];

      for (final day in [_monday, _friday, _saturday, _sunday]) {
        expect(
          AccessScheduleEvaluator.isAllowed(everyday, _at(day, 12)),
          isTrue,
        );
      }
      expect(
        AccessScheduleEvaluator.isAllowed(weekday, _at(_friday, 12)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(weekday, _at(_saturday, 12)),
        isFalse,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(weekend, _at(_saturday, 12)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(weekend, _at(_sunday, 12)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(weekend, _at(_monday, 12)),
        isFalse,
      );
    });

    test('any one entry is enough', () {
      final schedules = [_entry('Monday', 8, 10), _entry('Monday', 18, 20)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 9)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 12)),
        isFalse,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 19)),
        isTrue,
      );
    });

    test('an end of 24 runs to the end of the day', () {
      final schedules = [_entry('Monday', 18, 24)];

      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_monday, 23, 59, 59)),
        isTrue,
      );
      expect(
        AccessScheduleEvaluator.isAllowed(schedules, _at(_tuesday, 0, 0, 1)),
        isFalse,
      );
    });

    test('a day name the server does not use covers nothing', () {
      expect(
        AccessScheduleEvaluator.isAllowed([
          _entry('Someday', 0, 24),
        ], _at(_monday, 12)),
        isFalse,
      );
    });
  });

  group('nextAccessStart', () {
    test('is null when the user is allowed now', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.nextAccessStart(schedules, _at(_monday, 12)),
        isNull,
      );
    });

    test('is a later start the same day', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.nextAccessStart(schedules, _at(_monday, 7)),
        _at(_monday, 8),
      );
    });

    test('is the next day an entry covers', () {
      final schedules = [_entry('Monday', 8, 20), _entry('Tuesday', 9, 20)];

      expect(
        AccessScheduleEvaluator.nextAccessStart(schedules, _at(_monday, 21)),
        _at(_tuesday, 9),
      );
    });

    test('skips the weekend for a weekday entry', () {
      final schedules = [_entry('Weekday', 8, 20)];

      expect(
        AccessScheduleEvaluator.nextAccessStart(schedules, _at(_friday, 21)),
        _at(26, 8),
      );
    });

    test('takes the earliest of several entries', () {
      final schedules = [_entry('Monday', 15, 20), _entry('Monday', 9, 10)];

      expect(
        AccessScheduleEvaluator.nextAccessStart(schedules, _at(_monday, 6)),
        _at(_monday, 9),
      );
    });

    test('is null when no entry opens in the next week', () {
      expect(
        AccessScheduleEvaluator.nextAccessStart([
          _entry('Someday', 8, 20),
        ], _at(_monday, 6)),
        isNull,
      );
    });
  });

  group('nextBoundary', () {
    test('is the second after the end while the user is allowed', () {
      final schedules = [_entry('Monday', 8, 20)];

      expect(
        AccessScheduleEvaluator.nextBoundary(schedules, _at(_monday, 12)),
        _at(_monday, 20, 0, 1),
      );
    });

    test('is the next start while the user is not allowed', () {
      final schedules = [_entry('Monday', 8, 20), _entry('Tuesday', 8, 20)];

      expect(
        AccessScheduleEvaluator.nextBoundary(schedules, _at(_monday, 21)),
        _at(_tuesday, 8),
      );
    });

    test('is null with no entries', () {
      expect(
        AccessScheduleEvaluator.nextBoundary([], _at(_monday, 12)),
        isNull,
      );
    });
  });

  group('UserPolicy.accessSchedules', () {
    test('reads the entries the server sent', () {
      final policy = UserPolicy.fromJson({
        'AccessSchedules': [
          {
            'Id': 1,
            'UserId': 'abc',
            'DayOfWeek': 'Weekday',
            'StartHour': 8,
            'EndHour': 20.5,
          },
        ],
      });

      final entries = policy.accessSchedules;
      expect(entries, hasLength(1));
      expect(entries.single.dayOfWeek, 'Weekday');
      expect(entries.single.startHour, 8.0);
      expect(entries.single.endHour, 20.5);
    });

    test('is empty when the server sent none or the key is missing', () {
      expect(
        UserPolicy.fromJson({'AccessSchedules': []}).accessSchedules,
        isEmpty,
      );
      expect(UserPolicy.fromJson({}).accessSchedules, isEmpty);
      expect(const UserPolicy().accessSchedules, isEmpty);
    });

    test('leaves what goes back to the server as it came', () {
      final json = {
        'AccessSchedules': [
          {
            'Id': 1,
            'UserId': 'abc',
            'DayOfWeek': 'Monday',
            'StartHour': 8,
            'EndHour': 20,
          },
        ],
      };

      expect(UserPolicy.fromJson(json).toJson(), json);
    });
  });
}
