/// Calendar days from [from]'s date to [to]'s date: 1 for tomorrow, -1 for
/// yesterday. Counted on UTC dates, so a daylight saving change that makes a
/// local day 23 or 25 hours long doesn't change the answer.
int calendarDaysBetween(DateTime from, DateTime to) =>
    DateTime.utc(to.year, to.month, to.day)
        .difference(DateTime.utc(from.year, from.month, from.day))
        .inDays;
