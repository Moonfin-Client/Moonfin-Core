/// One entry of a user's access schedule, as Jellyfin stores it: the days it
/// covers and the hours of those days the user may use the server.
class AccessSchedule {
  /// `Sunday` to `Saturday`, or `Everyday`, `Weekday` (Monday to Friday) or
  /// `Weekend` (Saturday and Sunday).
  final String dayOfWeek;

  /// Hours since midnight, fractional for half hours and the like.
  final double startHour;
  final double endHour;

  const AccessSchedule({
    required this.dayOfWeek,
    required this.startHour,
    required this.endHour,
  });

  factory AccessSchedule.fromJson(Map<String, dynamic> json) => AccessSchedule(
    dayOfWeek: json['DayOfWeek'] as String? ?? '',
    startHour: (json['StartHour'] as num?)?.toDouble() ?? 0,
    endHour: (json['EndHour'] as num?)?.toDouble() ?? 0,
  );

  /// Whether this entry covers [weekday], where Monday is 1 and Sunday is 7
  /// as in [DateTime.weekday]. A name the server doesn't use covers no day.
  bool coversWeekday(int weekday) => switch (dayOfWeek) {
    'Everyday' => true,
    'Weekday' => weekday >= DateTime.monday && weekday <= DateTime.friday,
    'Weekend' => weekday == DateTime.saturday || weekday == DateTime.sunday,
    'Monday' => weekday == DateTime.monday,
    'Tuesday' => weekday == DateTime.tuesday,
    'Wednesday' => weekday == DateTime.wednesday,
    'Thursday' => weekday == DateTime.thursday,
    'Friday' => weekday == DateTime.friday,
    'Saturday' => weekday == DateTime.saturday,
    'Sunday' => weekday == DateTime.sunday,
    _ => false,
  };

  /// This entry's start on the day of [date], to the minute.
  DateTime startOn(DateTime date) => _at(date, startHour);

  /// This entry's end on the day of [date], to the minute. An end of 24 is
  /// midnight at the end of that day.
  DateTime endOn(DateTime date) => _at(date, endHour);

  static DateTime _at(DateTime date, double hour) {
    final minutes = (hour * 60).round();
    return DateTime(date.year, date.month, date.day, 0, minutes);
  }
}

/// Whether and when a user may use the server, by the rules Jellyfin itself
/// applies: an entry allows the time when it covers the day and the hour of day
/// is between its start and its end, both included. A user with no entries is
/// always allowed. Administrators are exempt, which is for the caller to check.
class AccessScheduleEvaluator {
  const AccessScheduleEvaluator._();

  /// How far ahead [nextAccessStart] and [nextBoundary] look.
  static const _lookAheadDays = 8;

  static bool isAllowed(List<AccessSchedule> schedules, DateTime now) {
    if (schedules.isEmpty) return true;
    final hour = now.hour + now.minute / 60 + now.second / 3600;
    return schedules.any(
      (s) =>
          s.coversWeekday(now.weekday) &&
          hour >= s.startHour &&
          hour <= s.endHour,
    );
  }

  /// The next time the user is allowed in, or null when they are allowed now
  /// or no entry opens within the next week.
  static DateTime? nextAccessStart(
    List<AccessSchedule> schedules,
    DateTime now,
  ) {
    if (isAllowed(schedules, now)) return null;
    DateTime? earliest;
    for (var offset = 0; offset < _lookAheadDays; offset++) {
      final day = DateTime(now.year, now.month, now.day + offset);
      for (final schedule in schedules) {
        if (!schedule.coversWeekday(day.weekday)) continue;
        final start = schedule.startOn(day);
        if (!start.isAfter(now)) continue;
        if (earliest == null || start.isBefore(earliest)) earliest = start;
      }
    }
    return earliest;
  }

  /// The next moment the answer of [isAllowed] could change, or null when no
  /// entry has one in the next week. That is every start, and the second after
  /// every end since the end itself is still allowed.
  static DateTime? nextBoundary(List<AccessSchedule> schedules, DateTime now) {
    DateTime? earliest;
    void consider(DateTime moment) {
      if (!moment.isAfter(now)) return;
      if (earliest == null || moment.isBefore(earliest!)) earliest = moment;
    }

    for (var offset = 0; offset < _lookAheadDays; offset++) {
      final day = DateTime(now.year, now.month, now.day + offset);
      for (final schedule in schedules) {
        if (!schedule.coversWeekday(day.weekday)) continue;
        consider(schedule.startOn(day));
        consider(schedule.endOn(day).add(const Duration(seconds: 1)));
      }
    }
    return earliest;
  }
}

/// The signed in user's access window as the Moonfin plugin works it out on
/// the server's clock, with Jellyfin's own rule: whether they're let in now,
/// and how long until that changes. The durations are relative, so they need
/// no clock or time zone on this device to use.
class AccessWindow {
  const AccessWindow({required this.allowed, this.untilClose, this.untilOpen});

  final bool allowed;

  /// When [allowed], how long until the schedule closes, or null when it
  /// doesn't close within a week or there is no schedule.
  final Duration? untilClose;

  /// When not [allowed], how long until the schedule next opens, or null when
  /// it doesn't open within a week.
  final Duration? untilOpen;

  /// Reads the plugin's `{ allowed, secondsUntilClose, secondsUntilOpen }`,
  /// or null for an answer without `allowed`.
  static AccessWindow? tryParse(Object? json) {
    if (json is! Map) return null;
    final allowed = json['allowed'];
    if (allowed is! bool) return null;
    Duration? seconds(Object? value) =>
        value is num && value >= 0 ? Duration(seconds: value.ceil()) : null;
    return AccessWindow(
      allowed: allowed,
      untilClose: seconds(json['secondsUntilClose']),
      untilOpen: seconds(json['secondsUntilOpen']),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AccessWindow &&
      other.allowed == allowed &&
      other.untilClose == untilClose &&
      other.untilOpen == untilOpen;

  @override
  int get hashCode => Object.hash(allowed, untilClose, untilOpen);
}
