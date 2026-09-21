// Classification for auto-completing leftover in-progress episodes after the
// viewer has moved on to a later episode in the same series.

const defaultSkippedEpisodeProgressThreshold = 50;

/// Clamps [value] to a whole number from 1 to 100; invalid input → default 50.
int skippedEpisodeProgressThreshold(Object? value) {
  final parsed = switch (value) {
    num n => n.toDouble(),
    String s => double.tryParse(s),
    _ => null,
  };
  if (parsed == null || !parsed.isFinite) {
    return defaultSkippedEpisodeProgressThreshold;
  }
  final rounded = parsed.round();
  if (rounded < 1) return 1;
  if (rounded > 100) return 100;
  return rounded;
}

Map<String, dynamic>? _userData(Map<String, dynamic> item) {
  final raw = item['UserData'];
  if (raw is Map<String, dynamic>) return raw;
  if (raw is Map) return raw.cast<String, dynamic>();
  return null;
}

num? _asNum(Object? value) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value);
  return null;
}

/// Progress 0–100 from PlayedPercentage, else ticks / runtime.
double? episodeProgress(Map<String, dynamic> episode) {
  final userData = _userData(episode);
  final percentage = _asNum(userData?['PlayedPercentage']);
  if (percentage != null) {
    if (!percentage.isFinite) return null;
    return percentage.clamp(0, 100).toDouble();
  }
  final position = _asNum(userData?['PlaybackPositionTicks']);
  final runtime =
      _asNum(userData?['RunTimeTicks']) ?? _asNum(episode['RunTimeTicks']);
  if (position == null || runtime == null || runtime <= 0) return null;
  return ((position / runtime) * 100).clamp(0, 100).toDouble();
}

typedef _SeasonEpisode = (int season, int episode);

_SeasonEpisode? _coordinate(Map<String, dynamic> item) {
  final season = _asNum(item['ParentIndexNumber'])?.toInt();
  final episode = _asNum(item['IndexNumber'])?.toInt();
  if (season == null || episode == null) return null;
  if (season < 1 || episode < 0) return null;
  return (season, episode);
}

bool _viewed(Map<String, dynamic> item) {
  final userData = _userData(item);
  if (userData?['Played'] == true) return true;
  if ((_asNum(userData?['PlayedPercentage']) ?? 0) > 0) return true;
  if ((_asNum(userData?['PlaybackPositionTicks']) ?? 0) > 0) return true;
  return false;
}

bool _inProgress(Map<String, dynamic> item) {
  final userData = _userData(item);
  if (userData?['Played'] == true) return false;
  if ((_asNum(userData?['PlayedPercentage']) ?? 0) > 0) return true;
  if ((_asNum(userData?['PlaybackPositionTicks']) ?? 0) > 0) return true;
  return false;
}

int _lastPlayedMs(Map<String, dynamic> item) {
  final raw = _userData(item)?['LastPlayedDate'];
  if (raw is! String || raw.isEmpty) return 0;
  return DateTime.tryParse(raw)?.millisecondsSinceEpoch ?? 0;
}

bool _isLaterCoordinate(_SeasonEpisode later, _SeasonEpisode current) =>
    later.$1 > current.$1 || (later.$1 == current.$1 && later.$2 > current.$2);

/// Later episode must be started after the candidate, not merely watched earlier.
bool _isLaterViewingActivity(
  Map<String, dynamic> later,
  Map<String, dynamic> candidate,
) {
  if (!_viewed(later)) return false;
  if (_inProgress(later)) return true;
  final laterMs = _lastPlayedMs(later);
  final candidateMs = _lastPlayedMs(candidate);
  if (laterMs == 0 || candidateMs == 0) return false;
  return laterMs > candidateMs;
}

/// Leading in-progress episode for a series; never auto-completed.
String? frontierEpisodeId(List<Map<String, dynamic>> seriesEpisodes) {
  Map<String, dynamic>? frontier;
  _SeasonEpisode? frontierCoord;
  for (final episode in seriesEpisodes) {
    if (episode['Type'] != 'Episode' || !_inProgress(episode)) continue;
    final coord = _coordinate(episode);
    if (coord == null) continue;
    if (frontierCoord == null || _isLaterCoordinate(coord, frontierCoord)) {
      frontier = episode;
      frontierCoord = coord;
    }
  }
  return frontier?['Id']?.toString();
}

/// True when [candidate] is a leftover resume point superseded by a later episode.
bool isStaleSkippedEpisode(
  Map<String, dynamic> candidate,
  List<Map<String, dynamic>> seriesEpisodes, [
  Object? progressThreshold = defaultSkippedEpisodeProgressThreshold,
]) {
  // Played=true is not enough to leave Resume: Jellyfin 10.11 Resume is
  // PlaybackPositionTicks > 0 and does not exclude Played items.
  if (candidate['Type'] != 'Episode') return false;
  final seriesId = candidate['SeriesId']?.toString();
  if (seriesId == null || seriesId.isEmpty) return false;
  final current = _coordinate(candidate);
  final progress = episodeProgress(candidate);
  final minProgress = skippedEpisodeProgressThreshold(progressThreshold);
  if (current == null || progress == null || progress < minProgress) {
    return false;
  }
  final candidateId = candidate['Id']?.toString();
  return seriesEpisodes.any((episode) {
    if (episode['Id']?.toString() == candidateId) return false;
    if (episode['Type'] != 'Episode') return false;
    if (episode['SeriesId']?.toString() != seriesId) return false;
    final next = _coordinate(episode);
    return next != null &&
        _isLaterCoordinate(next, current) &&
        _isLaterViewingActivity(episode, candidate);
  });
}
