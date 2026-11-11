final _separators = RegExp(r'[\s_-]');
final _embyDolbyVisionProfile = RegExp(
  r'doviprofile(\d+)',
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
/// no badge of its own, Dolby Vision the server calls invalid reads as the
/// `VideoRange` the picture has, and a stream with no range field has none.
List<String> videoRangeBadges(Map<String, dynamic> stream) {
  final range = _rangeToken(stream);
  if (range.isEmpty) return const [];
  if (range == 'DOVIINVALID') {
    return [stream['VideoRange'] == 'HDR' ? 'HDR' : 'SDR'];
  }
  if (!range.contains('DOVI') && !range.contains('DOLBYVISION')) {
    return [videoRangeLabel(stream)];
  }
  final profile = _dolbyVisionProfile(stream);
  final fallback = _dolbyVisionBaseLayer(range, stream);
  return [profile == null ? 'DV' : 'DV P$profile', ?fallback];
}

/// The layer under the Dolby Vision, from the name after `DOVIWith` in
/// Jellyfin's range type (a profile 7 enhancement layer sits on HDR10 unless
/// HDR10+ is named with it), or from Emby's sub type. Null for an SDR layer or
/// none at all.
String? _dolbyVisionBaseLayer(String range, Map<String, dynamic> stream) {
  final named = RegExp(r'^DOVIWITH(?:EL)?(.*)$').firstMatch(range);
  if (named != null) {
    final base = named.group(1)!;
    if (base.isEmpty) return 'HDR10';
    final label = videoRangeLabel({'VideoRangeType': base});
    return label == 'SDR' ? null : label;
  }
  final subType = _embySubType(stream);
  if (subType == '61' || subType == '81' || subType.startsWith('7')) {
    return 'HDR10';
  }
  if (subType == '84') return 'HLG';
  return null;
}

/// The digits after `DoviProfile` in Emby's sub type, such as `81`.
String _embySubType(Map<String, dynamic> stream) {
  final subType = stream['ExtendedVideoSubType'];
  if (subType is! String) return '';
  return _embyDolbyVisionProfile.firstMatch(subType)?.group(1) ?? '';
}

/// The profile from `DvProfile`, or Emby's sub type, where the first digit is
/// the profile (`DoviProfile81` is 8) except for profile 10 (`DoviProfile10x`).
int? _dolbyVisionProfile(Map<String, dynamic> stream) {
  if (stream['DvProfile'] case final num profile when profile > 0) {
    return profile.toInt();
  }
  final digits = _embySubType(stream);
  if (digits.isEmpty) return null;
  if (digits.startsWith('1')) return 10;
  final profile = int.parse(digits[0]);
  return profile > 0 ? profile : null;
}
