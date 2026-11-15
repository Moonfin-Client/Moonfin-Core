/// What Radarr or Sonarr holds for one title, as Moonbase reads it straight
/// from the arr. Unlike Seerr's download status it carries the arr's own
/// verdict on a download, such as an import it refuses, and it works whether
/// or not Seerr scans the arr.
class ArrQueue {
  /// "radarr" or "sonarr".
  final String service;

  /// Whether the arr has the title at all.
  final bool inArr;
  final bool? monitored;

  /// Whether this viewer may remove a download. Moonbase decides, from the
  /// Jellyfin admin flag.
  final bool canRemove;

  /// Radarr only. Null from Sonarr, or when Radarr didn't say.
  final bool? hasFile;

  /// Radarr only: the movie has reached its minimum availability.
  final bool? isAvailable;

  /// Radarr only: the day the movie reaches its minimum availability.
  final DateTime? releaseDate;

  /// Radarr only: when Radarr last searched the indexers for the movie.
  final DateTime? lastSearchTime;

  /// Whether the arr is searching the indexers for the title right now. Null
  /// from a Moonbase that doesn't say.
  final bool? searching;

  /// Sonarr only: each season's monitored aired and downloaded episode
  /// counts.
  final List<ArrSeason> seasons;

  /// The seasons a request asked for, or null for the whole series, which
  /// leaves the specials out of what it waits on.
  final Set<int>? requestedSeasons;

  final List<ArrQueueItem> items;

  const ArrQueue({
    required this.service,
    required this.inArr,
    this.monitored,
    this.canRemove = false,
    this.hasFile,
    this.isAvailable,
    this.releaseDate,
    this.lastSearchTime,
    this.searching,
    this.seasons = const [],
    this.requestedSeasons,
    this.items = const [],
  });

  factory ArrQueue.fromJson(Map<String, dynamic> json) => ArrQueue(
    service: (json['service'] as String? ?? '').toLowerCase(),
    inArr: json['inArr'] == true,
    monitored: json['monitored'] as bool?,
    canRemove: json['canRemove'] == true,
    hasFile: json['hasFile'] as bool?,
    isAvailable: json['isAvailable'] as bool?,
    releaseDate: _date(json['releaseDate']),
    lastSearchTime: _date(json['lastSearchTime']),
    searching: json['searching'] as bool?,
    seasons: [
      for (final raw in json['seasons'] as List? ?? const [])
        if (raw is Map && raw['seasonNumber'] is num)
          ArrSeason.fromJson(raw.cast<String, dynamic>()),
    ],
    items: [
      for (final raw in json['items'] as List? ?? const [])
        if (raw is Map) ArrQueueItem.fromJson(raw.cast<String, dynamic>()),
    ],
  );

  bool get isRadarr => service == 'radarr';

  /// The arr's name as people know it, for messages.
  String get serviceName => isRadarr ? 'Radarr' : 'Sonarr';

  /// Only the items and seasons for [seasons], for a request that asked for
  /// some seasons of a series. Movies and an empty list keep everything.
  ArrQueue forSeasons(Iterable<int> seasons) {
    final wanted = seasons.toSet();
    if (wanted.isEmpty || isRadarr) return this;
    return ArrQueue(
      service: service,
      inArr: inArr,
      monitored: monitored,
      canRemove: canRemove,
      hasFile: hasFile,
      isAvailable: isAvailable,
      releaseDate: releaseDate,
      lastSearchTime: lastSearchTime,
      searching: searching,
      seasons: this.seasons,
      requestedSeasons: wanted,
      items: [
        for (final item in items)
          if (item.seasonNumber == null || wanted.contains(item.seasonNumber))
            item,
      ],
    );
  }

  /// What the arr is waiting on for a monitored title with nothing in its
  /// queue, or null when there's nothing to say. A download in the queue has
  /// its own bar, so it's never a wait.
  ArrWait? get wait {
    if (!inArr || monitored != true || items.isNotEmpty) return null;
    if (searching == true) return const ArrSearching();
    return isRadarr ? _movieWait : _seriesWait;
  }

  ArrWait? get _movieWait {
    if (hasFile != false) return null;
    return switch (isAvailable) {
      true => ArrNotFoundYet(lastSearch: lastSearchTime),
      false => ArrNotReleased(date: releaseDate, nextEpisode: false),
      // Radarr couldn't say, so nothing is claimed.
      null => null,
    };
  }

  /// A season with aired episodes still missing is not found yet. Otherwise
  /// a season with an episode still to air is waiting on its next airing.
  ArrWait? get _seriesWait {
    final wanted = requestedSeasons;
    final watched = [
      for (final season in seasons)
        if (season.monitored == true &&
            (wanted?.contains(season.seasonNumber) ?? season.seasonNumber > 0))
          season,
    ];
    if (watched.any((s) => s.missingAired > 0)) return const ArrNotFoundYet();
    final airings = [for (final season in watched) ?season.nextAiring]..sort();
    return airings.isEmpty
        ? null
        : ArrNotReleased(date: airings.first, nextEpisode: true);
  }
}

/// What the arr is waiting on for a title it watches with nothing in its
/// queue.
sealed class ArrWait {
  const ArrWait();
}

/// The arr is searching the indexers for the title right now.
final class ArrSearching extends ArrWait {
  const ArrSearching();
}

/// The title is out and the arr watches for it, but no release was found.
final class ArrNotFoundYet extends ArrWait {
  /// When the arr last searched, if it said. Sonarr never does.
  final DateTime? lastSearch;

  const ArrNotFoundYet({this.lastSearch});
}

/// The title isn't out yet by the arr's reckoning, so it doesn't search.
final class ArrNotReleased extends ArrWait {
  /// Radarr's release date for the movie, or the next airing of a series.
  /// It can already be gone when the arr holds a title back past it, or until
  /// the queue is read again.
  final DateTime? date;

  /// Whether [date] is a series' next episode rather than a movie's release.
  final bool nextEpisode;

  const ArrNotReleased({this.date, required this.nextEpisode});
}

/// One Sonarr season as Moonbase reads it.
class ArrSeason {
  final int seasonNumber;
  final bool? monitored;

  /// Aired monitored episodes, plus any episode already downloaded.
  final int? episodeCount;
  final int? episodeFileCount;

  /// The next monitored episode to air, if one is scheduled.
  final DateTime? nextAiring;

  const ArrSeason({
    required this.seasonNumber,
    this.monitored,
    this.episodeCount,
    this.episodeFileCount,
    this.nextAiring,
  });

  factory ArrSeason.fromJson(Map<String, dynamic> json) => ArrSeason(
    seasonNumber: (json['seasonNumber'] as num).toInt(),
    monitored: json['monitored'] as bool?,
    episodeCount: (json['episodeCount'] as num?)?.toInt(),
    episodeFileCount: (json['episodeFileCount'] as num?)?.toInt(),
    nextAiring: _date(json['nextAiring']),
  );

  /// Aired episodes the arr watches for and hasn't got.
  int get missingAired => (episodeCount ?? 0) - (episodeFileCount ?? 0);
}

DateTime? _date(Object? value) =>
    value is String ? DateTime.tryParse(value)?.toLocal() : null;

/// One queue entry. Sonarr lists a season pack once per episode, every entry
/// sharing the pack's downloadId.
class ArrQueueItem {
  /// The arr's queue id, which a removal takes. Null if the arr left it out,
  /// which leaves nothing to remove.
  final int? id;

  /// The release name.
  final String? title;
  final String? status;
  final String? trackedDownloadState;
  final String? trackedDownloadStatus;
  final String? errorMessage;
  final List<ArrStatusMessage> statusMessages;
  final int? size;
  final int? sizeLeft;

  /// A .NET TimeSpan, "hh:mm:ss" or "d.hh:mm:ss". Often missing from Sonarr.
  final String? timeLeft;
  final String? downloadId;
  final int? seasonNumber;

  const ArrQueueItem({
    this.id,
    this.title,
    this.status,
    this.trackedDownloadState,
    this.trackedDownloadStatus,
    this.errorMessage,
    this.statusMessages = const [],
    this.size,
    this.sizeLeft,
    this.timeLeft,
    this.downloadId,
    this.seasonNumber,
  });

  factory ArrQueueItem.fromJson(Map<String, dynamic> json) => ArrQueueItem(
    id: (json['id'] as num?)?.toInt(),
    title: json['title'] as String?,
    status: json['status'] as String?,
    trackedDownloadState: json['trackedDownloadState'] as String?,
    trackedDownloadStatus: json['trackedDownloadStatus'] as String?,
    errorMessage: json['errorMessage'] as String?,
    statusMessages: [
      for (final raw in json['statusMessages'] as List? ?? const [])
        if (raw is Map) ArrStatusMessage.fromJson(raw.cast<String, dynamic>()),
    ],
    size: (json['size'] as num?)?.toInt(),
    sizeLeft: (json['sizeleft'] as num?)?.toInt(),
    timeLeft: json['timeleft'] as String?,
    downloadId: json['downloadId'] as String?,
    seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
  );

  /// The arr's own words for what is wrong, or null. The error first, since
  /// it is the one the arr shows in its own Activity view, then the first
  /// import message, then the title of a message group with no lines.
  String? get reason {
    final error = errorMessage?.trim();
    if (error != null && error.isNotEmpty) return error;
    for (final group in statusMessages) {
      for (final line in group.messages) {
        final text = line.trim();
        if (text.isNotEmpty) return text;
      }
    }
    for (final group in statusMessages) {
      final text = group.title?.trim();
      if (text != null && text.isNotEmpty) return text;
    }
    return null;
  }
}

class ArrStatusMessage {
  final String? title;
  final List<String> messages;

  const ArrStatusMessage({this.title, this.messages = const []});

  factory ArrStatusMessage.fromJson(Map<String, dynamic> json) =>
      ArrStatusMessage(
        title: json['title'] as String?,
        messages: [
          for (final m in json['messages'] as List? ?? const [])
            if (m is String) m,
        ],
      );
}
