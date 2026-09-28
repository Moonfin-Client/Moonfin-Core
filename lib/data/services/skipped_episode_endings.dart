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

/// UserData.LastPlayedDate, or null when absent or unparseable.
DateTime? episodeLastPlayed(Map<String, dynamic> item) {
  final raw = _userData(item)?['LastPlayedDate'];
  if (raw is! String || raw.isEmpty) return null;
  return DateTime.tryParse(raw);
}

bool _isLaterCoordinate(_SeasonEpisode later, _SeasonEpisode current) =>
    later.$1 > current.$1 || (later.$1 == current.$1 && later.$2 > current.$2);

/// The later episode must have been played after the candidate was last
/// played. Without both dates there is no evidence of moving on, so the
/// candidate stays. This also keeps the series' most recently played episode
/// (the one being watched now) from ever being auto-completed, including when
/// the viewer goes back to rewatch an earlier episode.
bool _isLaterViewingActivity(
  Map<String, dynamic> later,
  Map<String, dynamic> candidate,
) {
  if (!_viewed(later)) return false;
  final laterPlayed = episodeLastPlayed(later);
  final candidatePlayed = episodeLastPlayed(candidate);
  if (laterPlayed == null || candidatePlayed == null) return false;
  return laterPlayed.isAfter(candidatePlayed);
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
