import 'dart:collection';

import 'package:background_downloader/background_downloader.dart' as bgd;
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;

import '../auth/repositories/user_repository.dart';
import '../data/models/aggregated_item.dart';
import '../data/models/download_quality.dart';
import '../preference/user_preferences.dart';
import 'platform_detection.dart';

/// Whether download actions may be offered on this device at all.
///
/// Android TV keeps them hidden until the user enables offline downloads in
/// Settings -> Playback -> Offline Downloads. Every other platform that
/// supports downloads offers them unconditionally. Existing downloads and the
/// management screens are never affected by this gate.
bool showsTvDownloadActions(UserPreferences prefs) =>
    !PlatformDetection.isTV || prefs.get(UserPreferences.tvOfflineDownloads);

/// Whether the signed in user may start a download here.
///
/// Every entry point that offers a download has to ask this, because the
/// server can forbid downloading outright and a screen that skips the check
/// hands out a button the rest of the app would refuse.
bool userCanDownload() {
  final user = GetIt.instance<UserRepository>().currentUser;
  return PlatformDetection.supportsOfflineDownloads &&
      showsTvDownloadActions(GetIt.instance<UserPreferences>()) &&
      (user?.canDownload ?? false);
}

/// The base directory, directory and filename a download task needs to write
/// [savePath].
///
/// On Windows, Task.split strips the drive and pairs what is left with the root
/// base directory, which resolves to an empty string there, so the task writes
/// relative to the working directory instead of the drive the user picked. The
/// package wants the drive kept in the directory when the base is root.
Future<(bgd.BaseDirectory, String, String)> splitDownloadPath(
  String savePath,
) async {
  if (PlatformDetection.isWindows) {
    return (
      bgd.BaseDirectory.root,
      p.windows.normalize(p.windows.dirname(savePath)),
      p.windows.basename(savePath),
    );
  }
  return bgd.Task.split(filePath: savePath);
}

/// A download ETA as a short "1h 04m" or "4m 30s" style figure, coarse on
/// purpose since a transcode's pace drifts.
String formatEta(int seconds) {
  if (seconds >= 3600) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
  }
  if (seconds >= 60) {
    return '${seconds ~/ 60}m ${(seconds % 60).toString().padLeft(2, '0')}s';
  }
  return '${seconds}s';
}

/// Bytes a partly transferred file still needs on disk, or null when its
/// size was never known.
int? remainingTransferBytes({
  required int expectedFileSize,
  required double progress,
}) {
  if (expectedFileSize <= 0) return null;
  final done = (expectedFileSize * progress.clamp(0.0, 1.0)).round();
  return expectedFileSize - done;
}

String formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
}

int sourceSizeBytes(AggregatedItem item) {
  final sources = item.mediaSources;
  if (sources.isEmpty) return 0;
  return sources.first['Size'] as int? ?? 0;
}

Duration? runtimeForEstimate(AggregatedItem item) {
  final runtime = item.runtime;
  if (runtime != null && runtime.inMilliseconds > 0) {
    return runtime;
  }

  if (item.mediaSources.isEmpty) {
    return null;
  }

  final runTimeTicks = item.mediaSources.first['RunTimeTicks'] as int?;
  if (runTimeTicks == null || runTimeTicks <= 0) {
    return null;
  }

  return Duration(microseconds: runTimeTicks ~/ 10);
}

int? estimateTranscodedSizeBytes(AggregatedItem item, DownloadQuality quality) {
  if (!quality.isTranscoded) {
    return null;
  }

  final runtime = runtimeForEstimate(item);
  final totalBitRate = quality.totalBitRate;
  if (runtime == null || totalBitRate == null || totalBitRate <= 0) {
    return null;
  }

  return ((runtime.inMilliseconds * totalBitRate / 8000) * 1.03).round();
}

int estimateDownloadSizeBytes(AggregatedItem item, DownloadQuality quality) {
  if (!quality.isTranscoded) {
    return sourceSizeBytes(item);
  }

  return estimateTranscodedSizeBytes(item, quality) ?? sourceSizeBytes(item);
}

/// Rolling transfer-rate estimate for one download. Feeds the remaining-time
/// row for original-quality transfers, where the server has no ETA to offer.
///
/// Samples are kept for the last [window] so a stalled or bursty connection
/// changes the estimate within seconds rather than being averaged away by the
/// whole transfer so far.
class TransferRateTracker {
  TransferRateTracker({
    this.window = const Duration(seconds: 15),
    this.minSampleGap = const Duration(milliseconds: 500),
  });

  final Duration window;
  final Duration minSampleGap;
  final ListQueue<(DateTime, int)> _samples = ListQueue();

  /// Records that [bytes] have been received in total as of [now].
  void add(int bytes, DateTime now) {
    if (_samples.isNotEmpty) {
      final last = _samples.last;
      if (now.difference(last.$1) < minSampleGap) return;
      // A retry restarts the byte count; forget the old run.
      if (bytes < last.$2) _samples.clear();
    }
    _samples.add((now, bytes));
    while (_samples.length > 1 && now.difference(_samples.first.$1) > window) {
      _samples.removeFirst();
    }
  }

  /// When the most recent sample arrived, or null before the first one.
  DateTime? get lastSampleAt => _samples.isEmpty ? null : _samples.last.$1;

  /// Average rate over the retained window, or null until at least one
  /// second of samples exists or while nothing is arriving.
  int? get bytesPerSecond {
    if (_samples.length < 2) return null;
    final first = _samples.first;
    final last = _samples.last;
    final elapsedMs = last.$1.difference(first.$1).inMilliseconds;
    if (elapsedMs < 1000) return null;
    final rate = (last.$2 - first.$2) * 1000 / elapsedMs;
    return rate > 0 ? rate.round() : null;
  }

  /// Seconds left to reach [total] at the current rate, or null when the
  /// rate is unknown or the transfer is already complete.
  int? etaSeconds(int received, int total) {
    final rate = bytesPerSecond;
    if (rate == null || total <= received) return null;
    return ((total - received) / rate).ceil();
  }
}
