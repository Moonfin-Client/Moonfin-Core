enum CalendarEntryKind { episode, movie }

/// Episodes air. Movies have up to three release dates, one entry each.
enum CalendarRelease { airing, cinema, digital, physical }

enum CalendarBadge {
  seriesPremiere,
  seasonPremiere,
  midseasonFinale,
  seasonFinale,
  seriesFinale,
}

enum CalendarStatus { ready, upcoming, missing }

/// One episode airing or one movie release from the Sonarr or Radarr calendar.
class CalendarEntry {
  const CalendarEntry({
    required this.key,
    required this.kind,
    required this.release,
    required this.date,
    required this.hasTime,
    required this.title,
    this.episodeTitle,
    this.seasonNumber,
    this.episodeNumber,
    this.overview,
    this.posterUrl,
    this.backdropUrl,
    this.stillUrl,
    this.network,
    this.runtimeMinutes,
    this.year,
    this.tvdbId,
    this.tmdbId,
    this.imdbId,
    this.hasFile = false,
    this.monitored = true,
    this.itemId,
    this.episodeId,
    this.libraryIds = const [],
    this.badge,
    this.hasDigitalDate = false,
  });

  final String key;
  final CalendarEntryKind kind;
  final CalendarRelease release;

  /// Local time. Only meaningful to the minute when [hasTime] is true, since
  /// movie release dates carry no time of day.
  final DateTime date;
  final bool hasTime;

  /// The series name for an episode, the movie name for a movie.
  final String title;
  final String? episodeTitle;
  final int? seasonNumber;
  final int? episodeNumber;
  final String? overview;
  final String? posterUrl;
  final String? backdropUrl;
  final String? stillUrl;
  final String? network;
  final int? runtimeMinutes;
  final int? year;
  final int? tvdbId;
  final int? tmdbId;
  final String? imdbId;
  final bool hasFile;
  final bool monitored;

  /// The library's series or movie, when the title is on the server.
  final String? itemId;

  /// The library's episode, when that episode is on the server.
  final String? episodeId;
  final List<String> libraryIds;
  final CalendarBadge? badge;

  /// For a movie, whether Radarr knows a digital release date at all, even
  /// one outside the range asked for.
  final bool hasDigitalDate;

  bool get isEpisode => kind == CalendarEntryKind.episode;
  bool get isMovie => kind == CalendarEntryKind.movie;

  /// What Play opens. A movie counts once its file is on the server.
  String? get playableId => isEpisode ? episodeId : (hasFile ? itemId : null);
  bool get inLibrary => playableId != null;

  DateTime get day => DateTime(date.year, date.month, date.day);

  CalendarStatus statusAt(DateTime now) {
    if (inLibrary) return CalendarStatus.ready;
    final airedBy = hasTime ? date : day.add(const Duration(days: 1));
    return airedBy.isAfter(now)
        ? CalendarStatus.upcoming
        : CalendarStatus.missing;
  }

  /// The id the server stores a reminder under. Null when the arr gave no id
  /// the server could match a new library item against.
  String? get reminderKey {
    if (isEpisode) {
      if (tvdbId == null || seasonNumber == null || episodeNumber == null) {
        return null;
      }
      return 'episode:$tvdbId:$seasonNumber:$episodeNumber';
    }
    if (tmdbId != null) return 'movie:$tmdbId';
    if (imdbId != null && imdbId!.isNotEmpty) return 'movie:imdb:$imdbId';
    return null;
  }

  Map<String, dynamic> reminderBody() => {
    'kind': isEpisode ? 'episode' : 'movie',
    'tvdbId': ?tvdbId,
    'tmdbId': ?tmdbId,
    'imdbId': ?imdbId,
    'seasonNumber': ?seasonNumber,
    'episodeNumber': ?episodeNumber,
    'title': title,
    'subtitle': episodeTitle,
  };
}

/// What the user has watched of a series the calendar lists.
class CalendarSeriesProgress {
  const CalendarSeriesProgress({
    this.favorite = false,
    this.started = false,
    this.unplayed = 0,
  });

  final bool favorite;
  final bool started;
  final int unplayed;

  bool get followed => favorite || started;
  bool get behind => started && unplayed > 0;
}

/// Parses one Sonarr calendar element. Returns null for anything without an
/// air date or a series.
CalendarEntry? parseSonarrEntry(Map<String, dynamic> json) {
  final series = json['series'];
  if (series is! Map) return null;
  final airUtc = DateTime.tryParse('${json['airDateUtc'] ?? ''}');
  final airDay = DateTime.tryParse('${json['airDate'] ?? ''}');
  if (airUtc == null && airDay == null) return null;
  final season = _int(json['seasonNumber']);
  final episode = _int(json['episodeNumber']);
  final seriesImages = _images(series['images']);
  final episodeImages = _images(json['images']);
  final episodeTitle = _text(json['title']);
  return CalendarEntry(
    key: 'sonarr:${json['id'] ?? '${series['tvdbId']}:$season:$episode'}',
    kind: CalendarEntryKind.episode,
    release: CalendarRelease.airing,
    date: airUtc?.toLocal() ?? DateTime(airDay!.year, airDay.month, airDay.day),
    hasTime: airUtc != null,
    title: _text(series['title']) ?? '',
    episodeTitle: episodeTitle == 'TBA' ? null : episodeTitle,
    seasonNumber: season,
    episodeNumber: episode,
    overview: _text(json['overview']),
    posterUrl: _sized(seriesImages['poster'], 'w500'),
    backdropUrl: _sized(seriesImages['fanart'], 'w1280'),
    stillUrl: _sized(episodeImages['screenshot'], 'w780'),
    network: _text(series['network']),
    runtimeMinutes: _int(json['runtime']) ?? _int(series['runtime']),
    year: _int(series['year']),
    tvdbId: _positive(series['tvdbId']),
    tmdbId: _positive(series['tmdbId']),
    imdbId: _text(series['imdbId']),
    hasFile: json['hasFile'] == true,
    monitored: json['monitored'] != false && series['monitored'] != false,
    itemId: _text(json['moonfinItemId']),
    episodeId: _text(json['moonfinEpisodeId']),
    libraryIds: _ids(json['moonfinLibraryIds']),
    badge: _episodeBadge(_text(json['finaleType']), season, episode),
  );
}

/// Parses one Radarr calendar element into an entry per release date that
/// falls inside [start, end), local days.
List<CalendarEntry> parseRadarrEntries(
  Map<String, dynamic> json, {
  required DateTime start,
  required DateTime end,
}) {
  final title = _text(json['title']);
  if (title == null) return const [];
  final images = _images(json['images']);
  final tmdbId = _positive(json['tmdbId']);
  final out = <CalendarEntry>[];
  for (final (field, release) in const [
    ('inCinemas', CalendarRelease.cinema),
    ('digitalRelease', CalendarRelease.digital),
    ('physicalRelease', CalendarRelease.physical),
  ]) {
    final parsed = DateTime.tryParse('${json[field] ?? ''}');
    if (parsed == null) continue;
    // Release dates are whole days stored as UTC midnight, so the calendar
    // day is read before any time zone shift.
    final day = DateTime(parsed.year, parsed.month, parsed.day);
    if (day.isBefore(start) || !day.isBefore(end)) continue;
    out.add(
      CalendarEntry(
        key: 'radarr:${tmdbId ?? json['id']}:${release.name}',
        kind: CalendarEntryKind.movie,
        release: release,
        date: day,
        hasTime: false,
        title: title,
        overview: _text(json['overview']),
        posterUrl: _sized(images['poster'], 'w500'),
        backdropUrl: _sized(images['fanart'], 'w1280'),
        network: _text(json['studio']),
        runtimeMinutes: _int(json['runtime']),
        year: _int(json['year']),
        tmdbId: tmdbId,
        imdbId: _text(json['imdbId']),
        hasFile: json['hasFile'] == true,
        monitored: json['monitored'] != false,
        itemId: _text(json['moonfinItemId']),
        libraryIds: _ids(json['moonfinLibraryIds']),
        hasDigitalDate:
            DateTime.tryParse('${json['digitalRelease'] ?? ''}') != null,
      ),
    );
  }
  return out;
}

CalendarBadge? _episodeBadge(String? finale, int? season, int? episode) {
  switch (finale) {
    case 'series':
      return CalendarBadge.seriesFinale;
    case 'season':
      return CalendarBadge.seasonFinale;
    case 'midseason':
      return CalendarBadge.midseasonFinale;
  }
  if (episode != 1 || season == null || season < 1) return null;
  return season == 1
      ? CalendarBadge.seriesPremiere
      : CalendarBadge.seasonPremiere;
}

/// The external artwork url per cover type. Local arr paths need the arr's
/// API key and aren't reachable from a remote client, so they're skipped.
Map<String, String> _images(Object? raw) {
  final out = <String, String>{};
  if (raw is! List) return out;
  for (final image in raw) {
    if (image is! Map) continue;
    final type = image['coverType'];
    final url = image['remoteUrl'] ?? image['url'];
    if (type is String && url is String && url.startsWith('http')) {
      out.putIfAbsent(type, () => url);
    }
  }
  return out;
}

/// TMDB serves the original file unless the path names a size.
String? _sized(String? url, String size) =>
    url?.replaceFirst('/t/p/original/', '/t/p/$size/');

String? _text(Object? value) {
  if (value == null) return null;
  final s = '$value'.trim();
  return s.isEmpty ? null : s;
}

int? _int(Object? value) =>
    value is num ? value.toInt() : int.tryParse('${value ?? ''}');

int? _positive(Object? value) {
  final v = _int(value);
  return v == null || v <= 0 ? null : v;
}

List<String> _ids(Object? value) => value is List
    ? [
        for (final v in value)
          if (v != null) '$v',
      ]
    : const [];
