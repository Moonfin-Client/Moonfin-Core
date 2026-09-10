import '../models/aggregated_item.dart';
import '../models/download_quality.dart';
import '../models/download_source.dart';

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

  Future<List<AggregatedItem>> fetchEpisodes(
    String seriesId, {
    String? seasonId,
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
