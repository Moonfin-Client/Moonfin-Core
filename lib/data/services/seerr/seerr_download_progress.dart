import 'seerr_api_models.dart';

/// Where a download stands, read from the Radarr/Sonarr queue status Seerr
/// passes along. When several downloads make up one request the summary shows
/// the one that ranks last here. Stalled and failed outrank everything, and
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

  const SeerrDownloadSummary({
    required this.fraction,
    this.state = SeerrDownloadState.downloading,
    this.timeLeft,
    this.totalBytes = 0,
    this.downloadedBytes = 0,
  });

  int get percent => (fraction * 100).round();

  /// Whether the byte counts are worth showing.
  bool get hasSize => totalBytes > 0;

  /// True when every item has finished downloading and is waiting on the
  /// import, so the UI can label the full bar instead of showing a stuck 100%.
  bool get isWaitingForImport => state == SeerrDownloadState.waitingForImport;

  static const _statusProcessing = 3;
  static const _statusPartiallyAvailable = 4;

  /// Builds a summary for one quality flavor of a media item, or null when
  /// nothing is downloading and the status chip alone should show. The status
  /// gate keeps stale queue entries from drawing a bar after availability.
  static SeerrDownloadSummary? forMedia({
    required int? status,
    required List<SeerrDownloadingItem>? items,
  }) {
    if (status != _statusProcessing && status != _statusPartiallyAvailable) {
      return null;
    }
    return fromItems(items);
  }

  /// Summary for a request card, using the request's quality flavor and
  /// skipping requests that can no longer be downloading.
  static SeerrDownloadSummary? forRequest(SeerrRequest request) {
    if (request.status == SeerrRequest.statusDeclined ||
        request.status == SeerrRequest.statusFailed) {
      return null;
    }
    final media = request.media;
    if (media == null) return null;
    return forMedia(
      status: request.is4k ? media.status4k : media.status,
      items: request.is4k ? media.downloadStatus4k : media.downloadStatus,
    );
  }

  static SeerrDownloadSummary? fromItems(List<SeerrDownloadingItem>? items) {
    if (items == null || items.isEmpty) return null;
    var total = 0;
    var left = 0;
    SeerrDownloadState? state;
    Duration? timeLeft;
    var timeLeftKnown = true;
    final seen = <String>{};
    for (final item in items) {
      // Sonarr lists a season pack once per episode, each with the whole
      // pack's size, so a 9 episode pack counted 9 times. Count a download
      // once. No id means a release Sonarr or Radarr is holding back (a
      // delay profile): nothing is downloading yet, and it may never be the
      // release that gets grabbed, so it is left out.
      final id = item.downloadId;
      if (id == null || id.isEmpty || !seen.add(id)) continue;
      // A magnet with no peers never learns its size, so a sizeless download
      // still counts for its state. It just adds no bytes.
      final size = item.size ?? 0;
      final sizeLeft = item.sizeLeft;
      // No sizeLeft says nothing about how far along it is, so it counts as
      // not started rather than finished.
      final itemLeft = size > 0 ? (sizeLeft ?? size).clamp(0, size) : 0;
      total += size > 0 ? size : 0;
      left += itemLeft;

      final itemState = _stateOf(
        item,
        done: size > 0 && sizeLeft != null && itemLeft <= 0,
      );
      if (state == null || itemState.index > state.index) state = itemState;
      if (itemState == SeerrDownloadState.waitingForImport) continue;
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
    var fraction = total > 0 ? ((total - left) / total).clamp(0.0, 1.0) : 0.0;
    if (state == SeerrDownloadState.waitingForImport) {
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
    );
  }

  static SeerrDownloadState _stateOf(
    SeerrDownloadingItem item, {
    required bool done,
  }) {
    final status = item.status?.toLowerCase();
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
