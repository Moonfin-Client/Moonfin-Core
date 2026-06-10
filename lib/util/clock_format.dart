String formatClockTime(DateTime time, {required bool use24Hour}) {
  final minute = time.minute.toString().padLeft(2, '0');
  if (use24Hour) {
    return '${time.hour.toString().padLeft(2, '0')}:$minute';
  }
  final hour12 =
      time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
  final period = time.hour >= 12 ? 'PM' : 'AM';
  return '$hour12:$minute $period';
}
