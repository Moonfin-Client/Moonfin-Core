import 'arr_queue.dart';
import 'seerr_api_models.dart';

/// Where a download stands, read from the Radarr/Sonarr queue status Seerr
/// passes along, or from the arr itself when Moonbase can read its queue.
/// When several downloads make up one request the summary shows the one that
/// ranks last here. Stalled and failed outrank everything, and
/// downloading outranks paused and queued, since one active download means
/// the request is moving.
enum SeerrDownloadState {
  /// Fully downloaded and waiting for Radarr or Sonarr to import it. A blocked
  /// import sits here too, since the download client reports it as completed.
  waitingForImport,
  paused,
  queued,
  downloading,

  /// The queue's "warning", which for a torrent usually means no seeders.
  stalled,

  /// Downloaded, but the arr refuses to import it, for example because the
  /// release holds an executable. Only the arr's own queue can say this.
  importBlocked,
  failed,
}

/// Aggregated download progress for a Seerr media item, combining the
/// Radarr/Sonarr queue entries the server reports in downloadStatus.
class SeerrDownloadSummary {
  /// Overall progress from 0 to 1, weighted by item size so a large episode
  /// counts more than a small one.
  final double fraction;

  /// What the downloads are doing, so a stalled or paused one doesn't read as
  /// a bar that is merely slow.
  final SeerrDownloadState state;

  /// How long until the slowest active download finishes, or null when the
  /// client can't tell or nothing is actively downloading.
  final Duration? timeLeft;

  /// Total bytes and how many have arrived. The UI shows these next to the
  /// percentage. Zero when the server reports no usable sizes.
  final int totalBytes;
  final int downloadedBytes;

  /// The arr's own words for what the deciding download is doing, such as
  /// "qBittorrent cannot resolve magnet link with DHT disabled". Only the
  /// arr's queue carries them, so it is null for Seerr's download status.
  final String? reason;

  /// The arr's queue id and release name of the download that decided
  /// [state], set only when it is stuck, so an admin can swap it out.
  final int? stuckItemId;
  final String? stuckRelease;

  const SeerrDownloadSummary({
    required this.fraction,
    this.state = SeerrDownloadState.downloading,
    this.timeLeft,
    this.totalBytes = 0,
    this.downloadedBytes = 0,
    this.reason,
    this.stuckItemId,
    this.stuckRelease,
  });

  int get percent => (fraction * 100).round();

  /// Whether the byte counts are worth showing.
  bool get hasSize => totalBytes > 0;

  /// True when every item has finished downloading and is waiting on the
  /// import, so the UI can label the full bar instead of showing a stuck 100%.
  bool get isWaitingForImport => state == SeerrDownloadState.waitingForImport;

  /// Not going to finish by itself: stalled, refused at import, or failed.
  bool get isStuck => _isStuck(state);

  static bool _isStuck(SeerrDownloadState state) => switch (state) {
    SeerrDownloadState.stalled ||
    SeerrDownloadState.importBlocked ||
    SeerrDownloadState.failed => true,
    _ => false,
  };

  static const _statusProcessing = 3;
  static const _statusPartiallyAvailable = 4;

  /// Builds a summary for one quality flavor of a media item, or null when
  /// nothing is downloading and the status chip alone should show. The status
  /// gate keeps stale queue entries from drawing a bar after availability.
  ///
  /// [arrQueue] is what Moonbase read from the arr, when it could. It replaces
  /// Seerr's [items], which miss the arr's reasons and are empty altogether
  /// when Seerr doesn't scan the arr. Moonbase only reads the default arr, so
  /// a title it doesn't find there went to another one, and Seerr's [items]
  /// stay the better source.
  static SeerrDownloadSummary? forMedia({
    required int? status,
    required List<SeerrDownloadingItem>? items,
    ArrQueue? arrQueue,
  }) {
    if (status != _statusProcessing && status != _statusPartiallyAvailable) {
      return null;
    }
    if (arrQueue != null && arrQueue.inArr) {
      return fromArrItems(arrQueue.items);
    }
    return fromItems(items);
  }

  /// Summary for a request card, using the request's quality flavor and
  /// skipping requests that can no longer be downloading.
  ///
  /// [arrQueue] is the arr's queue for the title, already narrowed to the
  /// request's seasons. Moonbase only reads the default non-4K arr, so a 4K
  /// request ignores it.
  static SeerrDownloadSummary? forRequest(
    SeerrRequest request, {
    ArrQueue? arrQueue,
  }) {
    if (request.status == SeerrRequest.statusDeclined ||
        request.status == SeerrRequest.statusFailed) {
      return null;
    }
    final media = request.media;
    if (media == null) return null;
    return forMedia(
      status: request.is4k ? media.status4k : media.status,
      items: request.is4k ? media.downloadStatus4k : media.downloadStatus,
      arrQueue: request.is4k ? null : arrQueue,
    );
  }

  static SeerrDownloadSummary? fromItems(List<SeerrDownloadingItem>? items) =>
      _summarise([
        for (final item in items ?? const <SeerrDownloadingItem>[])
          (
            downloadId: item.downloadId,
            size: item.size,
            sizeLeft: item.sizeLeft,
            timeLeft: item.timeLeft,
            stateOf: (bool done) => _stateOf(item.status, done: done),
            reason: null,
            healthy: true,
            queueId: null,
            release: null,
          ),
      ]);

  /// The same summary from the arr's own queue entries, which add the arr's
  /// verdict on each download and its reason.
  static SeerrDownloadSummary? fromArrItems(List<ArrQueueItem> items) =>
      _summarise([
        for (final item in items)
          // The arr has stopped tracking an ignored download. A delay or
          // fallback entry is a release the arr is holding back on purpose:
          // nothing is downloading yet, and it may never be the one grabbed.
          if (item.trackedDownloadState?.toLowerCase() != 'ignored' &&
              !_heldBack.contains(item.status?.toLowerCase()))
            (
              downloadId: item.downloadId,
              size: item.size,
              sizeLeft: item.sizeLeft,
              timeLeft: item.timeLeft,
              stateOf: (bool done) => _stateOf(
                item.status,
                done: done,
                tracked: item.trackedDownloadState,
                trackedStatus: item.trackedDownloadStatus,
              ),
              reason: item.reason,
              healthy: switch (item.trackedDownloadStatus?.toLowerCase()) {
                null || 'ok' => true,
                _ => false,
              },
              queueId: item.id,
              release: item.title,
            ),
      ]);

  /// Queue statuses of a release the arr is holding back rather than
  /// downloading: a delay profile's wait, or a preferred protocol's fallback.
  static const _heldBack = {'delay', 'fallback'};

  static SeerrDownloadSummary? _summarise(List<_QueueEntry> items) {
    if (items.isEmpty) return null;
    var total = 0;
    var left = 0;
    SeerrDownloadState? state;
    _QueueEntry? decider;
    String? reason;
    Duration? timeLeft;
    var timeLeftKnown = true;
    final seen = <String>{};
    for (final item in items) {
      // Sonarr lists a season pack once per episode, each with the whole
      // pack's size, so a 9 episode pack counted 9 times. Count a download
      // once. An arr entry with no download id still counts once by its
      // queue id, since it can be stuck too. With neither there is nothing
      // to tell entries apart, so it is left out.
      final downloadId = item.downloadId;
      final queueId = item.queueId;
      final key = downloadId != null && downloadId.isNotEmpty
          ? 'download:$downloadId'
          : queueId != null
          ? 'queue:$queueId'
          : null;
      if (key == null || !seen.add(key)) continue;
      // A magnet with no peers never learns its size, so a sizeless download
      // still counts for its state. It just adds no bytes.
      final size = item.size ?? 0;
      final sizeLeft = item.sizeLeft;
      // No sizeLeft says nothing about how far along it is, so it counts as
      // not started rather than finished.
      final itemLeft = size > 0 ? (sizeLeft ?? size).clamp(0, size) : 0;
      total += size > 0 ? size : 0;
      left += itemLeft;

      final itemState = item.stateOf(
        size > 0 && sizeLeft != null && itemLeft <= 0,
      );
      // The arr's message, unless the download is simply moving along. The
      // arr fills it for a paused or delayed download too, and that still
      // says why the bar isn't moving.
      final itemReason =
          itemState == SeerrDownloadState.downloading && item.healthy
          ? null
          : item.reason;
      if (state == null ||
          itemState.index > state.index ||
          // Of two downloads in the same state, the one that says why.
          (itemState == state && reason == null && itemReason != null)) {
        state = itemState;
        decider = item;
        reason = itemReason;
      }
      if (itemState == SeerrDownloadState.waitingForImport ||
          itemState == SeerrDownloadState.importBlocked) {
        continue;
      }
      // A paused or queued sibling has no end in sight, so the request has
      // none either, however soon the active one finishes.
      final eta = itemState == SeerrDownloadState.downloading
          ? parseTimeLeft(item.timeLeft)
          : null;
      if (eta == null) {
        timeLeftKnown = false;
      } else if (timeLeft == null || eta > timeLeft) {
        timeLeft = eta;
      }
    }
    if (state == null) return null;
    final downloading = state == SeerrDownloadState.downloading;
    final stuck = _isStuck(state);
    var fraction = total > 0 ? ((total - left) / total).clamp(0.0, 1.0) : 0.0;
    if (state == SeerrDownloadState.waitingForImport ||
        state == SeerrDownloadState.importBlocked) {
      // The client can call a download completed before its byte count
      // settles, and the label says it's done, so the bar does too.
      fraction = 1.0;
    } else if (fraction > 0.99) {
      // A sizeless download adds no bytes, so the sized ones alone can add up
      // to 100% while it is still going. Hold the bar short of full.
      fraction = 0.99;
    }
    return SeerrDownloadSummary(
      fraction: fraction,
      state: state,
      // One download with no estimate leaves the whole request's unknown.
      timeLeft: downloading && timeLeftKnown ? timeLeft : null,
      totalBytes: total,
      downloadedBytes: total - left,
      reason: reason,
      stuckItemId: stuck ? decider?.queueId : null,
      stuckRelease: stuck ? decider?.release : null,
    );
  }

  /// [tracked] is the arr's trackedDownloadState, which outranks the download
  /// client's status: a client calls a blocked import "completed".
  /// [trackedStatus] is the arr's ok, warning or error on top of that.
  static SeerrDownloadState _stateOf(
    String? rawStatus, {
    required bool done,
    String? tracked,
    String? trackedStatus,
  }) {
    final flagged = switch (trackedStatus?.toLowerCase()) {
      'warning' || 'error' => true,
      _ => false,
    };
    switch (tracked?.toLowerCase()) {
      case 'importblocked':
        return SeerrDownloadState.importBlocked;
      // Radarr and Sonarr leave a release holding an executable here, with a
      // warning, until someone steps in, so it is as stuck as a blocked one.
      case 'importpending' || 'importing' when flagged:
        return SeerrDownloadState.importBlocked;
      case 'importpending' || 'importing' || 'imported':
        return SeerrDownloadState.waitingForImport;
      case 'failedpending' || 'failed':
        return SeerrDownloadState.failed;
    }
    final status = rawStatus?.toLowerCase();
    if (status == 'failed') return SeerrDownloadState.failed;
    if (done) return SeerrDownloadState.waitingForImport;
    return switch (status) {
      'completed' => SeerrDownloadState.waitingForImport,
      // An unreachable client isn't moving either, and the viewer can't tell
      // the difference from here.
      'warning' || 'downloadclientunavailable' => SeerrDownloadState.stalled,
      'paused' => SeerrDownloadState.paused,
      'queued' => SeerrDownloadState.queued,
      _ => SeerrDownloadState.downloading,
    };
  }

  /// Reads a .NET TimeSpan as Radarr and Sonarr serialise it: "hh:mm:ss",
  /// with a "d." day prefix past a day and an optional fraction of a second.
  static Duration? parseTimeLeft(String? value) {
    if (value == null) return null;
    final match = RegExp(r'^(?:(\d+)\.)?(\d+):(\d{2}):(\d{2})(?:\.\d+)?$')
        .firstMatch(value.trim());
    if (match == null) return null;
    return Duration(
      days: int.parse(match.group(1) ?? '0'),
      hours: int.parse(match.group(2)!),
      minutes: int.parse(match.group(3)!),
      seconds: int.parse(match.group(4)!),
    );
  }
}

/// One download as the summary reads it, from either source. [stateOf] takes
/// whether the bytes say it finished. [healthy] is false when the arr flags
/// the download with a warning or an error.
typedef _QueueEntry = ({
  String? downloadId,
  int? size,
  int? sizeLeft,
  String? timeLeft,
  SeerrDownloadState Function(bool done) stateOf,
  String? reason,
  bool healthy,
  int? queueId,
  String? release,
});
