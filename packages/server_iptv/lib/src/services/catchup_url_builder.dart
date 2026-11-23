import '../db/iptv_database.dart';

/// Whether a program that started at [programStart] can still be replayed
/// from the channel's archive at [now].
bool channelSupportsCatchupAt(
  Channel channel,
  DateTime programStart,
  DateTime now,
) {
  final hasCatchup =
      (channel.catchupMode?.isNotEmpty ?? false) ||
      (channel.catchupSource?.isNotEmpty ?? false);
  if (!hasCatchup || !programStart.isBefore(now)) return false;
  final days = channel.catchupDays ?? 1;
  return programStart.isAfter(now.subtract(Duration(days: days)));
}

final _placeholder = RegExp(r'\$?\{(\w+)(?::([^}]*))?\}');

/// Fills a catchup template the way Kodi's IPTV Simple client does, which is
/// what playlists are written for. `{utc}` and `${start}` are the start in
/// Unix seconds, `{utcend}` and `${end}` the end, `{lutc}`, `${now}` and
/// `${timestamp}` the current time, and `{duration}` and `${offset}` are
/// seconds, divided by X in their `:X` forms. `{Y}` through `{S}` and the
/// `{utc:Y-m-d}` style formats read the start in local time.
String expandCatchupTemplate(
  String template, {
  required DateTime start,
  required DateTime end,
  required DateTime now,
}) {
  return template.replaceAllMapped(_placeholder, (match) {
    final name = match[1]!;
    final format = match[2];
    final time = switch (name) {
      'utc' || 'start' => start,
      'utcend' || 'end' => end,
      'lutc' || 'now' || 'timestamp' => now,
      _ => null,
    };
    if (time != null) {
      return format == null
          ? '${time.millisecondsSinceEpoch ~/ 1000}'
          : _formatLocal(time, format);
    }
    final span = switch (name) {
      'duration' => end.difference(start),
      'offset' => now.difference(start),
      _ => null,
    };
    if (span != null) {
      final divider = int.tryParse(format ?? '') ?? 1;
      final units = span.inSeconds ~/ (divider < 1 ? 1 : divider);
      return '${units < 0 ? 0 : units}';
    }
    if (const {'Y', 'm', 'd', 'H', 'M', 'S'}.contains(name)) {
      return _formatLocal(start, name);
    }
    return match[0]!;
  });
}

String _formatLocal(DateTime time, String format) {
  final t = time.toLocal();
  String two(int v) => v.toString().padLeft(2, '0');
  final buffer = StringBuffer();
  for (final char in format.split('')) {
    buffer.write(switch (char) {
      'Y' => t.year.toString().padLeft(4, '0'),
      'm' => two(t.month),
      'd' => two(t.day),
      'H' => two(t.hour),
      'M' => two(t.minute),
      'S' => two(t.second),
      _ => char,
    });
  }
  return buffer.toString();
}

final _flussonicStream = RegExp(
  r'^(https?://[^/]+)/(.*)/([^/]*)(mpegts|\.m3u8)(\?.+=.+)?$',
);
final _flussonicAny = RegExp(r'^(https?://[^/]+)/(.*)/([^?]*)(\?.+=.+)?$');
final _xtreamStream = RegExp(
  r'^(https?://[^/]+)/(?:live/)?([^/]+)/([^/]+)/([^/.]+)(\.m3u8?)?$',
);

/// The template a channel's catchup mode builds from its own stream URL when
/// the playlist names a mode without a full source.
String? _templateFor(String mode, String streamUrl, String? source) {
  switch (mode) {
    case 'append':
      return source == null ? null : '$streamUrl$source';
    case 'shift' || 'timeshift':
      final joiner = streamUrl.contains('?') ? '&' : '?';
      return '$streamUrl${joiner}utc={utc}&lutc={lutc}';
    case 'flussonic' || 'flussonic-hls' || 'flussonic-ts' || 'fs':
      if (_flussonicStream.firstMatch(streamUrl) case final m?) {
        final (host, channel, list, query) = (m[1], m[2], m[3]!, m[5] ?? '');
        if (m[4] == 'mpegts') {
          return '$host/$channel/timeshift_abs-\${start}.ts$query';
        }
        final prefix = list == 'index' ? '' : '$list-';
        return '$host/$channel/${prefix}timeshift_rel-{offset:1}.m3u8$query';
      }
      if (_flussonicAny.firstMatch(streamUrl) case final m?) {
        return '${m[1]}/${m[2]}/timeshift_rel-{offset:1}.m3u8${m[4] ?? ''}';
      }
      return null;
    case 'xc':
      final m = _xtreamStream.firstMatch(streamUrl);
      if (m == null) return null;
      return '${m[1]}/timeshift/${m[2]}/${m[3]}/{duration:60}/'
          '{Y}-{m}-{d}:{H}-{M}/${m[4]}${m[5] ?? '.ts'}';
    default:
      return source;
  }
}

/// The archive URL for a program on an M3U channel playing [streamUrl], or
/// null when its catchup settings can't produce one.
String? buildCatchupUrl({
  required String streamUrl,
  String? catchupMode,
  String? catchupSource,
  required DateTime start,
  required DateTime end,
  DateTime? now,
}) {
  final source = catchupSource?.trim();
  final template = _templateFor(
    catchupMode?.trim().toLowerCase() ?? '',
    streamUrl,
    source == null || source.isEmpty ? null : source,
  );
  if (template == null) return null;
  return expandCatchupTemplate(
    template,
    start: start,
    end: end,
    now: now ?? DateTime.now(),
  );
}
