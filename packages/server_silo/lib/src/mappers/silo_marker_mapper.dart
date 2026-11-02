import 'package:server_core/server_core.dart';

import 'silo_ticks.dart';

/// Silo marker kinds as Jellyfin `MediaSegmentType`, which Moonfin's skip
/// prompts and segment actions read. Credits are Jellyfin's `Outro`.
const Map<String, String> siloSegmentTypes = {
  'intro': 'Intro',
  'credits': 'Outro',
  'recap': 'Recap',
  'preview': 'Preview',
};

/// A file's markers as Jellyfin `MediaSegmentDto`s (`Id`, `ItemId`, `Type`,
/// `StartTicks`, `EndTicks`), in start order, for `getMediaSegments`.
///
/// [markers] is anything that carries Silo's markers for one file: the
/// `FileMarkers` answer of `GET /markers/files/{id}` or `/markers/items/{id}`,
/// a version from `/watch` or an item detail.
///
/// `marker_segments` lists **every occurrence** (an episode can have a recap,
/// an intro and a second intro after a cold open), so it is used when Silo
/// sends it. Older answers and catalog versions only carry one segment per
/// kind (`intro`, `credits`, `recap`, `preview`), as `MarkerSegment`
/// (`start_seconds`/`end_seconds`) or `Marker` (`start`/`end`), and those
/// are the fallback.
///
/// A segment without an end runs to [runTimeSeconds] when it is given (Silo
/// defaults credits and previews to the end of the file), and is dropped
/// otherwise rather than guess its length. Empty, inverted and repeated
/// segments are dropped too.
List<Map<String, dynamic>> siloMarkersToMediaSegments(
  Map<String, dynamic> markers, {
  required String itemId,
  num? runTimeSeconds,
}) {
  final found = <({String kind, num start, num? end})>[];
  final occurrences = markers['marker_segments'];
  if (occurrences is List && occurrences.isNotEmpty) {
    for (final o in occurrences) {
      final occurrence = asJsonMap(o);
      final kind = occurrence?['kind'];
      final start = occurrence?['start_seconds'];
      if (kind is! String || start is! num) continue;
      final end = occurrence!['end_seconds'];
      found.add((kind: kind, start: start, end: end is num ? end : null));
    }
  } else {
    for (final kind in siloSegmentTypes.keys) {
      final segment = asJsonMap(markers[kind]);
      if (segment == null) continue;
      final start = segment['start_seconds'] ?? segment['start'];
      final end = segment['end_seconds'] ?? segment['end'];
      if (start is! num) continue;
      found.add((kind: kind, start: start, end: end is num ? end : null));
    }
  }

  final duration = runTimeSeconds != null && runTimeSeconds > 0
      ? runTimeSeconds
      : null;
  final seen = <String>{};
  final segments = <({String type, int start, int end})>[];
  for (final f in found) {
    final type = siloSegmentTypes[f.kind.trim().toLowerCase()];
    if (type == null) continue;
    final start = f.start < 0 ? 0 : f.start;
    final end = f.end ?? duration;
    if (end == null || end <= start) continue;
    final ticks = (
      type: type,
      start: secondsToTicks(start),
      end: secondsToTicks(end),
    );
    if (seen.add('${ticks.type}|${ticks.start}|${ticks.end}')) {
      segments.add(ticks);
    }
  }
  segments.sort((a, b) => a.start.compareTo(b.start));

  final perType = <String, int>{};
  return [
    for (final s in segments)
      {
        // Unique per occurrence: Moonfin tells segments apart by id.
        'Id':
            'silo-${s.type.toLowerCase()}-$itemId-${perType.update(s.type, (n) => n + 1, ifAbsent: () => 0)}',
        'ItemId': itemId,
        'Type': s.type,
        'StartTicks': s.start,
        'EndTicks': s.end,
      },
  ];
}
