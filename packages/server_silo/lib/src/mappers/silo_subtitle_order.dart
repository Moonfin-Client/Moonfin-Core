import 'silo_media_source_mapper.dart';

// Silo numbers a file's subtitles in one **combined** space: its external
// sidecar files first, then the tracks embedded in the container, then
// downloaded subtitles, densely from 0. Moonfin numbers them inside the
// file's stream index space. These two map one to the other for the file's
// own subtitles.

/// Moonfin's subtitle stream indices of a mapped [source], in Silo's
/// combined order.
List<int> siloSubtitleOrder(Map<String, dynamic>? source) {
  if (source == null) return const [];
  final streams = [
    for (final s in (source['MediaStreams'] as List?) ?? const [])
      if (s is Map && s['Type'] == 'Subtitle' && s['Index'] is int)
        s.cast<String, dynamic>(),
  ];
  int ordinal(Map<String, dynamic> s) =>
      siloTrackForStreamIndex(source, s['Index'] as int)?.ordinal ?? 1 << 30;
  streams.sort((a, b) => ordinal(a).compareTo(ordinal(b)));
  return [
    for (final s in streams)
      if (s['IsExternal'] == true) s['Index'] as int,
    for (final s in streams)
      if (s['IsExternal'] != true) s['Index'] as int,
  ];
}

/// Silo's combined index of Moonfin's subtitle stream [index], or null when
/// it is none of [source]'s subtitles.
int? siloSubtitleCombinedIndex(Map<String, dynamic>? source, int? index) {
  if (index == null || index < 0) return null;
  final at = siloSubtitleOrder(source).indexOf(index);
  return at < 0 ? null : at;
}
