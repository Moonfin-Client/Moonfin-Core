final _separators = RegExp(r'[\s_-]');
final _embyDolbyVisionProfile = RegExp(
  r'doviprofile(\d)',
  caseSensitive: false,
);

/// The first range field the server filled in, upper-cased with its
/// separators dropped.
String _rangeToken(Map<String, dynamic> stream) {
  final raw = [
    stream['VideoRangeType'],
    stream['ExtendedVideoType'],
    stream['VideoRange'],
  ].whereType<String>().firstWhere(
    (value) => value.trim().isNotEmpty,
    orElse: () => '',
  );
  return raw.toUpperCase().replaceAll(_separators, '');
}

/// The HDR label for a video stream, from whichever range field the server
/// filled in. Jellyfin squashes `VideoRangeType` into a token like `HDR10`.
/// Emby types the range in `ExtendedVideoType` and only generates `VideoRange`
/// from it as display prose, `HDR 10` rather than `HDR10`, so the value is
/// normalized before it is read.
String videoRangeLabel(Map<String, dynamic> stream) {
  final range = _rangeToken(stream);

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

/// The detail screen's range badges: Dolby Vision with its profile when the
/// server gives one (`DV P8`), then the layer a display without Dolby Vision
/// falls back to. Jellyfin, Silo and Plex give the profile in `DvProfile`, Emby
/// names it in `ExtendedVideoSubType` (`DoviProfile81`). An SDR fallback gets
/// no badge of its own, and Dolby Vision the server calls invalid reads as HDR.
List<String> videoRangeBadges(Map<String, dynamic> stream) {
  final range = _rangeToken(stream);
  if (range == 'DOVIINVALID') return const ['HDR'];
  if (!range.contains('DOVI') && !range.contains('DOLBYVISION')) {
    return [videoRangeLabel(stream)];
  }
  final profile = _dolbyVisionProfile(stream);
  final fallback = range.contains('HDR10PLUS')
      ? 'HDR10+'
      : range.contains('HDR10')
      ? 'HDR10'
      : range.contains('HLG')
      ? 'HLG'
      : null;
  return [profile == null ? 'DV' : 'DV P$profile', ?fallback];
}

int? _dolbyVisionProfile(Map<String, dynamic> stream) {
  if (stream['DvProfile'] case final num profile when profile > 0) {
    return profile.toInt();
  }
  final subType = stream['ExtendedVideoSubType'];
  if (subType is! String) return null;
  final match = _embyDolbyVisionProfile.firstMatch(subType);
  return match == null ? null : int.parse(match.group(1)!);
}
