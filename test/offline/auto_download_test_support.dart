import 'dart:async';

import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/download_quality.dart';
import 'package:moonfin/data/models/download_source.dart';
import 'package:moonfin/data/services/auto_download_downloader.dart';

const server = 'server-a';
const user = 'user-a';

/// When test subscriptions were created; episodes are "new" after this.
final followedAt = DateTime(2026, 9, 1);

AggregatedItem episode(
  String id, {
  String series = 'series-1',
  int season = 1,
  int? number = 1,
  bool played = false,
  int size = 100,
  DateTime? added,
  Map<String, dynamic> extra = const {},
}) => AggregatedItem(
  id: id,
  serverId: server,
  rawData: {
    'Id': id,
    'Type': 'Episode',
    'Name': 'Episode $id',
    'SeriesId': series,
    'SeriesName': 'Series $series',
    'ParentIndexNumber': season,
    'IndexNumber': ?number,
    'UserData': {'Played': played},
    'DateCreated': (added ?? followedAt.add(const Duration(days: 1)))
        .toIso8601String(),
    'MediaSources': [
      {'Id': 'src-$id', 'Size': size},
    ],
    ...extra,
  },
);

/// When test downloads finished.
final downloadedAt = DateTime.utc(2026, 9, 5);

/// An episode the user finished a day after [downloadedAt].
AggregatedItem watched(
  String id, {
  String series = 'series-1',
  int season = 1,
  int? number,
  DateTime? playedAt,
}) => episode(
  id,
  series: series,
  season: season,
  number: number,
  played: true,
  extra: {
    'UserData': {
      'Played': true,
      'LastPlayedDate': (playedAt ?? downloadedAt.add(const Duration(days: 1)))
          .toIso8601String(),
    },
  },
);

int sizeOf(AggregatedItem item) =>
    ((item.rawData['MediaSources'] as List).first['Size'] as int?) ?? 0;

AggregatedItem series(String id) => AggregatedItem(
  id: id,
  serverId: server,
  rawData: {'Id': id, 'Type': 'Series', 'Name': 'Series $id'},
);

/// One call to the downloader's queue method, as the fake recorded it.
class QueuedBatch {
  QueuedBatch(this.items, this.quality, this.source);
  final List<AggregatedItem> items;
  final DownloadQuality quality;
  final DownloadSource source;
}

/// Stands in for DownloadService: serves episodes from memory and records
/// what a check asked it to queue or delete.
class FakeDownloader implements AutoDownloadDownloader {
  final Map<String, List<AggregatedItem>> episodesBySeries = {};
  final Set<String> inFlight = {};
  final List<QueuedBatch> batches = [];
  final List<String> deleted = [];
  final List<String> fetched = [];
  bool wifiAllowed = true;
  int? headroomBytes;
  final Set<String> failSeries = {};
  Completer<void>? fetchGate;
  void Function()? onFetch;

  List<String> get queuedIds => [
    for (final batch in batches)
      for (final item in batch.items) item.id,
  ];

  @override
  Set<String> get inFlightItemIds => Set.of(inFlight);

  @override
  String get serverBaseUrl => 'https://media.example';

  @override
  Future<List<AggregatedItem>> fetchEpisodes(
    String seriesId, {
    String? seasonId,
  }) async {
    fetched.add(seriesId);
    onFetch?.call();
    final gate = fetchGate;
    if (gate != null) await gate.future;
    if (failSeries.contains(seriesId)) throw StateError('offline');
    return episodesBySeries[seriesId] ?? const [];
  }

  /// How many episodes the fake server's recently played list sends at once.
  int historyPageSize = 100;

  @override
  Future<List<AggregatedItem>> fetchRecentlyPlayedEpisodes({
    DateTime? playedAfter,
  }) {
    final history = [
      for (final list in episodesBySeries.values)
        for (final item in list)
          if (item.isPlayed && item.lastPlayedDate != null) item,
    ]..sort((a, b) => b.lastPlayedDate!.compareTo(a.lastPlayedDate!));
    return readRecentlyPlayedEpisodes(
      (startIndex) async {
        final page = history.skip(startIndex).take(historyPageSize).toList();
        return (read: page.length, items: page);
      },
      playedAfter: playedAfter,
      pageSize: historyPageSize,
    );
  }

  @override
  Future<DownloadBatch> queueDownloads(
    List<AggregatedItem> items, {
    DownloadQuality quality = DownloadQuality.original,
    DownloadSource source = DownloadSource.manual,
  }) async {
    final accepted = items.where((i) => !inFlight.contains(i.id)).toList();
    inFlight.addAll(accepted.map((i) => i.id));
    batches.add(QueuedBatch(accepted, quality, source));
    return DownloadBatch(queued: accepted, done: Future.value());
  }

  @override
  Future<bool> deleteDownloadedFiles(AggregatedItem item) async {
    deleted.add(item.id);
    return true;
  }

  @override
  Future<bool> wifiPolicyAllowsDownload() async => wifiAllowed;

  @override
  Future<int?> storageHeadroomBytes() async => headroomBytes;

  @override
  Future<bool> canTransferInBackground(DownloadQuality quality) async =>
      !quality.isTranscoded;

  @override
  Future<void> waitForNativeHandoff({required Duration timeout}) async {}
}
