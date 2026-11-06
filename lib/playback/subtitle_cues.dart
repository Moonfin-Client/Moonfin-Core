import 'dart:math' as math;

/// One timed subtitle line, in seconds of the media.
class SubtitleCue {
  const SubtitleCue(this.start, this.end, this.text);

  final double start;
  final double end;
  final String text;
}

final _timing = RegExp(
  r'(\d+:)?(\d{1,2}):(\d{2})[,.](\d{1,3})\s*-->\s*(\d+:)?(\d{1,2}):(\d{2})[,.](\d{1,3})',
);
final _assTime = RegExp(r'^(\d+):(\d{2}):(\d{2})\.(\d{1,3})$');
final _markup = RegExp(r'<[^>]+>');
final _assOverride = RegExp(r'\{[^}]*\}');
final _blankLines = RegExp(r'\n{2,}');
final _lineEnds = RegExp(r'\r\n?');
final _assStart = RegExp(r'^\s*\[Script Info\]', multiLine: true);
final _assBreak = RegExp(r'\\[Nn]');

double _seconds(String? hours, String minutes, String secs, String fraction) =>
    int.parse(hours ?? '0') * 3600 +
    int.parse(minutes) * 60 +
    int.parse(secs) +
    int.parse(fraction.padRight(3, '0')) / 1000;

/// The lines of an SRT, WebVTT or ASS file, as a server hands a sidecar out.
List<SubtitleCue> parseSubtitleText(String text) {
  final body = text.replaceFirst('\uFEFF', '').replaceAll(_lineEnds, '\n');
  if (_assStart.hasMatch(body)) {
    return _parseAss(body);
  }
  final cues = <SubtitleCue>[];
  for (final block in body.split(_blankLines)) {
    final lines = block.split('\n');
    final at = lines.indexWhere(_timing.hasMatch);
    if (at < 0) continue;
    final m = _timing.firstMatch(lines[at])!;
    final words = lines
        .skip(at + 1)
        .join('\n')
        .replaceAll(_markup, '')
        .replaceAll(_assOverride, '')
        .trim();
    if (words.isEmpty) continue;
    String? hours(String? group) => group?.substring(0, group.length - 1);
    cues.add(SubtitleCue(
      _seconds(hours(m[1]), m[2]!, m[3]!, m[4]!),
      _seconds(hours(m[5]), m[6]!, m[7]!, m[8]!),
      words,
    ));
  }
  return cues;
}

// ASS keeps its lines as Dialogue entries, with the text last so it can hold
// commas of its own.
List<SubtitleCue> _parseAss(String text) {
  double? time(String value) {
    final m = _assTime.firstMatch(value.trim());
    return m == null ? null : _seconds(m[1], m[2]!, m[3]!, m[4]!);
  }

  final cues = <SubtitleCue>[];
  for (final line in text.split('\n')) {
    if (!line.startsWith('Dialogue:')) continue;
    final fields = line.substring('Dialogue:'.length).split(',');
    if (fields.length < 10) continue;
    final start = time(fields[1]);
    final end = time(fields[2]);
    final words = fields
        .sublist(9)
        .join(',')
        .replaceAll(_assOverride, '')
        .replaceAll(_assBreak, '\n')
        .trim();
    if (start == null || end == null || words.isEmpty) continue;
    cues.add(SubtitleCue(start, end, words));
  }
  return cues;
}

/// The lines in Jellyfin's and Emby's JSON subtitle format, which the server
/// makes from any text track, embedded or not.
List<SubtitleCue> cuesFromTrackEvents(Object? json) {
  final events = json is Map ? json['TrackEvents'] : null;
  if (events is! List) return const [];
  return [
    for (final event in events)
      if (event is Map &&
          event['StartPositionTicks'] is num &&
          event['EndPositionTicks'] is num)
        SubtitleCue(
          (event['StartPositionTicks'] as num) / 10000000,
          (event['EndPositionTicks'] as num) / 10000000,
          '${event['Text'] ?? ''}'
              .replaceAll(_markup, '')
              .replaceAll(_assOverride, '')
              .replaceAll(_assBreak, '\n')
              .trim(),
        ),
  ];
}

/// One line's bar on the timeline, as fractions of its width.
class SubtitleTimelineBar {
  const SubtitleTimelineBar(this.left, this.width, this.text, this.active);

  final double left;
  final double width;
  final String text;
  final bool active;
}

/// The lines around the playhead, laid out across a fixed window.
class SubtitleTimeline {
  const SubtitleTimeline(this.markers, this.bars, this.playhead);

  /// Whole seconds in the window, and where each falls.
  final List<(double, double)> markers;
  final List<SubtitleTimelineBar> bars;
  final double playhead;
}

const _window = 10.0;

// A line too short to see still gets a sliver, so it doesn't vanish.
const _minBarWidth = 0.004;

/// Lays out the lines around [position] with [delay] applied. The delay moves
/// the lines rather than the playhead, so the bars slide under a fixed mark
/// the same way the subtitles shift against the picture.
SubtitleTimeline buildSubtitleTimeline(
  List<SubtitleCue> cues,
  double position,
  double delay,
) {
  final start = math.max(0.0, position - _window / 2);
  final end = start + _window;
  double at(double time) => (time - start) / _window;

  final markers = <(double, double)>[
    for (var second = start.ceilToDouble(); second <= end; second++)
      (second, at(second)),
  ];
  final bars = <SubtitleTimelineBar>[];
  for (final cue in cues) {
    final from = cue.start + delay;
    final to = cue.end + delay;
    if (to <= start || from >= end) continue;
    final left = math.max(0.0, at(from));
    final width = math.min(1.0, at(to)) - left;
    bars.add(SubtitleTimelineBar(
      left,
      math.max(width, _minBarWidth),
      cue.text.replaceAll('\n', ' '),
      position >= from && position <= to,
    ));
  }
  return SubtitleTimeline(markers, bars, at(position));
}

/// A time on the timeline's ruler, as minutes and seconds.
String formatTimelineMarker(double seconds) {
  final whole = seconds.floor();
  return '${whole ~/ 60}:${(whole % 60).toString().padLeft(2, '0')}';
}
