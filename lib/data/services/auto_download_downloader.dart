import '../models/aggregated_item.dart';
import '../models/download_quality.dart';
import '../models/download_source.dart';
import '../utils/next_up_enrichment.dart' show recentlyPlayedPageSize;

/// A batch handed to the download queue: what was accepted, and a future
/// for when every transfer in it has finished or failed.
class DownloadBatch {
  const DownloadBatch({required this.queued, required this.done});

  final List<AggregatedItem> queued;
  final Future<void> done;
}

/// The slice of the download service the auto-download check needs, so the
/// check can be tested against a fake instead of the real transfer engine.
abstract class AutoDownloadDownloader {
  Set<String> get inFlightItemIds;

  /// The URL of the server this downloader fetches from.
  String get serverBaseUrl;

  Future<List<AggregatedItem>> fetchEpisodes(
    String seriesId, {
    String? seasonId,
  });

  /// The episodes this user played most recently, newest first, with their
  /// series and user data. With [playedAfter], it reads further back until
  /// it reaches an episode played at or before it.
  Future<List<AggregatedItem>> fetchRecentlyPlayedEpisodes({
    DateTime? playedAfter,
  });

  Future<DownloadBatch> queueDownloads(
    List<AggregatedItem> items, {
    DownloadQuality quality,
    DownloadSource source,
  });

  Future<bool> deleteDownloadedFiles(AggregatedItem item);

  Future<bool> wifiPolicyAllowsDownload();

  /// Bytes still allowed under the storage limit, counting transfers that
  /// were admitted but have not written their file yet; null when unlimited.
  Future<int?> storageHeadroomBytes();

  /// Whether a transfer in [quality] survives the engine that queued it
  /// being suspended or destroyed. False for transcodes (the server must
  /// keep encoding, which no background slot can hold) and for anything
  /// the in-process legacy engine would carry.
  Future<bool> canTransferInBackground(DownloadQuality quality);

  /// Waits until every item queued so far is in the native engine's hands
  /// or has failed, up to [timeout]. Items still waiting for a concurrency
  /// slot are left for the next check.
  Future<void> waitForNativeHandoff({required Duration timeout});
}

/// Pages [readRecentlyPlayedEpisodes] reads at most, so a long gap between
/// checks can't turn into an unbounded walk through the watch history.
const recentlyPlayedMaxPages = 10;

/// The recently played episodes, newest first, read a page at a time. The
/// first page is always read whole. Later pages are read only while every
/// episode so far was played after [playedAfter], so nothing played after
/// it is missed. [fetchPage] returns the page at its index and how many
/// entries the server sent, counting any it couldn't turn into items.
Future<List<AggregatedItem>> readRecentlyPlayedEpisodes(
  Future<({int read, List<AggregatedItem> items})> Function(int startIndex)
  fetchPage, {
  DateTime? playedAfter,
  int pageSize = recentlyPlayedPageSize,
}) async {
  final items = <AggregatedItem>[];
  var read = 0;
  for (var page = 0; page < recentlyPlayedMaxPages; page++) {
    final result = await fetchPage(read);
    read += result.read;
    items.addAll(result.items);
    final oldest = items.lastOrNull?.lastPlayedDate;
    if (playedAfter == null ||
        result.read < pageSize ||
        oldest == null ||
        !oldest.isAfter(playedAfter)) {
      break;
    }
  }
  return items;
}
