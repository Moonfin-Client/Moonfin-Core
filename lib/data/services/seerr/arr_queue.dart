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
  final List<ArrQueueItem> items;

  const ArrQueue({
    required this.service,
    required this.inArr,
    this.monitored,
    this.canRemove = false,
    this.hasFile,
    this.isAvailable,
    this.items = const [],
  });

  factory ArrQueue.fromJson(Map<String, dynamic> json) => ArrQueue(
    service: (json['service'] as String? ?? '').toLowerCase(),
    inArr: json['inArr'] == true,
    monitored: json['monitored'] as bool?,
    canRemove: json['canRemove'] == true,
    hasFile: json['hasFile'] as bool?,
    isAvailable: json['isAvailable'] as bool?,
    items: [
      for (final raw in json['items'] as List? ?? const [])
        if (raw is Map) ArrQueueItem.fromJson(raw.cast<String, dynamic>()),
    ],
  );

  bool get isRadarr => service == 'radarr';

  /// The arr's name as people know it, for messages.
  String get serviceName => isRadarr ? 'Radarr' : 'Sonarr';

  /// Only the items for [seasons], for a request that asked for some seasons
  /// of a series. Movies and an empty list keep everything.
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
      items: [
        for (final item in items)
          if (item.seasonNumber == null || wanted.contains(item.seasonNumber))
            item,
      ],
    );
  }

  /// Radarr has the released movie, is watching for it and hasn't got it,
  /// yet nothing is downloading. Sonarr can't say whether a season has aired,
  /// so it never answers yes.
  bool get isNotFoundYet =>
      isRadarr &&
      inArr &&
      monitored == true &&
      hasFile == false &&
      isAvailable == true &&
      items.isEmpty;
}

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
