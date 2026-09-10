final _separators = RegExp(r'[\s_-]');

/// The HDR label for a video stream, from whichever range field the server
/// filled in. Jellyfin squashes `VideoRangeType` into a token like `HDR10`.
/// Emby types the range in `ExtendedVideoType` and only generates `VideoRange`
/// from it as display prose, `HDR 10` rather than `HDR10`, so the value is
/// normalized before it is read.
String videoRangeLabel(Map<String, dynamic> stream) {
  final raw = [
    stream['VideoRangeType'],
    stream['ExtendedVideoType'],
    stream['VideoRange'],
  ].whereType<String>().firstWhere(
    (value) => value.trim().isNotEmpty,
    orElse: () => '',
  );
  final range = raw.toUpperCase().replaceAll(_separators, '');

  if (range.contains('DOVI') || range.contains('DOLBYVISION')) {
    return 'Dolby Vision';
  }
  // Ahead of the plain HDR10 test, which its own name would satisfy first.
  if (range.contains('HDR10PLUS') || range.contains('HDR10+')) {
    return 'HDR10+';
  }
  if (range.contains('HDR10')) return 'HDR10';
  if (range.contains('HLG') || range.contains('HYPERLOGGAMMA')) return 'HLG';
  if (range.contains('HDR')) return 'HDR';
  return 'SDR';
}
