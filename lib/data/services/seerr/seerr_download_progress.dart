import 'seerr_api_models.dart';

/// Aggregated download progress for a Seerr media item, combining the
/// Radarr/Sonarr queue entries the server reports in downloadStatus.
class SeerrDownloadSummary {
  /// Overall progress from 0 to 1, weighted by item size so a large episode
  /// counts more than a small one.
  final double fraction;

  /// True when every item has finished downloading and is being imported, so
  /// the UI can label the full bar instead of showing a stuck 100%.
  final bool isImporting;

  const SeerrDownloadSummary({
    required this.fraction,
    required this.isImporting,
  });

  int get percent => (fraction * 100).round();

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
    for (final item in items) {
      final size = item.size;
      if (size == null || size <= 0) continue;
      total += size;
      left += (item.sizeLeft ?? 0).clamp(0, size);
    }
    if (total <= 0) return null;
    return SeerrDownloadSummary(
      fraction: ((total - left) / total).clamp(0.0, 1.0),
      isImporting: left <= 0,
    );
  }
}
