/// A date the server sent, as sent, or null when there isn't one.
///
/// Jellyfin and Emby send .NET's `DateTime.MinValue` (year 1) for a date they
/// don't have, so that counts as missing too. Checking before any conversion
/// keeps it out of year 0, where local time west of UTC would put it.
///
/// This doesn't convert to local time: a date-only value such as a premiere
/// date is midnight UTC and must stay on its day.
DateTime? parseServerDate(Object? value) {
  final date = value is String ? DateTime.tryParse(value) : null;
  if (date == null || date.year <= 1) return null;
  return date;
}
