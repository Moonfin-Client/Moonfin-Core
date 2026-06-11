import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/offline_database.dart';

class OfflineRepository {
  final OfflineDatabase _db;

  OfflineRepository(this._db);

  Future<void> upsertItem(DownloadedItemsCompanion item) async {
    if (!item.itemId.present) {
      await _db.into(_db.downloadedItems).insertOnConflictUpdate(item);
      return;
    }

    final id = item.itemId.value;
    await _db.transaction(() async {
      await (_db.delete(_db.downloadedItems)
            ..where((t) => t.itemId.equals(id)))
          .go();
      await _db.into(_db.downloadedItems).insertOnConflictUpdate(item);
    });
  }

  Future<void> updateDownloadStatus(
    String itemId,
    int status, {
    double? progress,
    String? error,
  }) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .write(DownloadedItemsCompanion(
      downloadStatus: Value(status),
      downloadProgress: progress != null ? Value(progress) : const Value.absent(),
      errorMessage: Value(error),
      downloadedAt: status == 2 ? Value(DateTime.now()) : const Value.absent(),
    ));
  }

  Future<void> setLocalFilePath(String itemId, String path, {int? fileSize}) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .write(DownloadedItemsCompanion(
      localFilePath: Value(path),
      fileSizeBytes: fileSize != null ? Value(fileSize) : const Value.absent(),
    ));
  }

  Future<void> setImagePaths(
    String itemId, {
    String? poster,
    String? backdrop,
    String? logo,
    String? thumb,
  }) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .write(DownloadedItemsCompanion(
      posterPath: poster != null ? Value(poster) : const Value.absent(),
      backdropPath: backdrop != null ? Value(backdrop) : const Value.absent(),
      logoPath: logo != null ? Value(logo) : const Value.absent(),
      thumbPath: thumb != null ? Value(thumb) : const Value.absent(),
    ));
  }

  Future<void> updatePlaybackPosition(String itemId, int positionTicks) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .write(DownloadedItemsCompanion(
      playbackPositionTicks: Value(positionTicks),
      progressSynced: const Value(false),
    ));
  }

  Future<void> markProgressSynced(String itemId) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .write(const DownloadedItemsCompanion(progressSynced: Value(true)));
  }

  Future<void> deleteItem(String itemId) async {
    await (_db.delete(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId)))
        .go();
  }

  Future<void> deleteSeriesItems(String seriesId) async {
    await (_db.delete(_db.downloadedItems)
          ..where((t) =>
              t.itemId.equals(seriesId) | t.seriesId.equals(seriesId)))
        .go();
  }

  Future<void> deleteSeasonItems(String seasonId) async {
    await (_db.delete(_db.downloadedItems)
          ..where((t) =>
              t.itemId.equals(seasonId) | t.seasonId.equals(seasonId)))
        .go();
  }

  Future<void> deleteAllItems() async {
    await _db.delete(_db.downloadedItems).go();
  }

  Future<List<DownloadedItem>> getItems({
    String? type,
    bool onlyCompleted = false,
  }) async {
    final query = _db.select(_db.downloadedItems);
    if (type != null) {
      query.where((t) => t.type.equals(type));
    }
    if (onlyCompleted) {
      query.where((t) => t.downloadStatus.equals(2));
    }
    return query.get();
  }

  Future<DownloadedItem?> getItem(String itemId) async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) => t.itemId.equals(itemId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.downloadStatus),
        (t) => OrderingTerm.desc(t.downloadedAt),
      ]);
    final rows = await query.get();
    return rows.isNotEmpty ? rows.first : null;
  }

  Future<bool> isAvailableOffline(String itemId) async {
    final item = await getItem(itemId);
    return item != null && item.downloadStatus == 2;
  }

  Future<List<DownloadedItem>> getUnsyncedProgress() async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) => t.progressSynced.equals(false));
    return query.get();
  }

  Future<List<DownloadedItem>> getSeriesEpisodes(String seriesId) async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) =>
          t.seriesId.equals(seriesId) &
          t.type.equals('Episode'))
      ..orderBy([
        (t) => OrderingTerm.asc(t.parentIndexNumber),
        (t) => OrderingTerm.asc(t.indexNumber),
      ]);
    return query.get();
  }

  Future<List<DownloadedItem>> getSeasonEpisodes(String seasonId) async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) =>
          t.seasonId.equals(seasonId) &
          t.type.equals('Episode'))
      ..orderBy([(t) => OrderingTerm.asc(t.indexNumber)]);
    return query.get();
  }

  Future<List<DownloadedItem>> getDownloadedSeries() async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) => t.type.equals('Series'));
    return query.get();
  }

  Future<List<DownloadedItem>> getDownloadedMovies() async {
    final query = _db.select(_db.downloadedItems)
      ..where((t) =>
          t.type.equals('Movie') &
          t.downloadStatus.equals(2));
    return query.get();
  }

  Future<int> getTotalStorageUsed() async {
    final result = await _db.customSelect(
      'SELECT COALESCE(SUM(file_size_bytes), 0) AS total FROM downloaded_items',
    ).getSingle();
    return result.read<int>('total');
  }

  Future<Map<String, int>> getCountsByType() async {
    final items = await getItems();
    final counts = <String, int>{};
    for (final item in items) {
      counts[item.type] = (counts[item.type] ?? 0) + 1;
    }
    return counts;
  }

  Stream<List<DownloadedItem>> watchItems({
    String? type,
    bool onlyCompleted = false,
  }) {
    final query = _db.select(_db.downloadedItems);
    if (type != null) {
      query.where((t) => t.type.equals(type));
    }
    if (onlyCompleted) {
      query.where((t) => t.downloadStatus.equals(2));
    }
    return query.watch();
  }

  Stream<DownloadedItem?> watchItem(String itemId) {
    final query = _db.select(_db.downloadedItems)
      ..where((t) => t.itemId.equals(itemId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.downloadStatus),
        (t) => OrderingTerm.desc(t.downloadedAt),
      ]);
    return query.watch().map((rows) => rows.isNotEmpty ? rows.first : null);
  }

  Stream<int> watchTotalStorageUsed() {
    return _db
        .customSelect(
          'SELECT COALESCE(SUM(file_size_bytes), 0) AS total FROM downloaded_items',
          readsFrom: {_db.downloadedItems},
        )
        .watch()
        .map((rows) => rows.first.read<int>('total'));
  }

  Stream<List<DownloadedItem>> watchDownloadedSeries() {
    final query = _db.select(_db.downloadedItems)
      ..where((t) => t.type.equals('Series'));
    return query.watch();
  }

  Stream<List<DownloadedItem>> watchSeriesEpisodes(String seriesId) {
    final query = _db.select(_db.downloadedItems)
      ..where((t) =>
          t.seriesId.equals(seriesId) &
          t.type.equals('Episode'))
      ..orderBy([
        (t) => OrderingTerm.asc(t.parentIndexNumber),
        (t) => OrderingTerm.asc(t.indexNumber),
      ]);
    return query.watch();
  }

  Stream<List<DownloadedItem>> watchSeasonEpisodes(String seasonId) {
    final query = _db.select(_db.downloadedItems)
      ..where((t) =>
          t.seasonId.equals(seasonId) &
          t.type.equals('Episode'))
      ..orderBy([(t) => OrderingTerm.asc(t.indexNumber)]);
    return query.watch();
  }

  Map<String, dynamic> rowToRawData(DownloadedItem row) {
    return jsonDecode(row.metadataJson) as Map<String, dynamic>;
  }

  Future<void> updateItemPaths({
    required String itemId,
    required String serverId,
    String? localFilePath,
    String? posterPath,
    String? backdropPath,
    String? logoPath,
    String? thumbPath,
  }) async {
    await (_db.update(_db.downloadedItems)
          ..where((t) => t.itemId.equals(itemId) & t.serverId.equals(serverId)))
        .write(DownloadedItemsCompanion(
      localFilePath: localFilePath != null ? Value(localFilePath) : const Value.absent(),
      posterPath: posterPath != null ? Value(posterPath) : const Value.absent(),
      backdropPath: backdropPath != null ? Value(backdropPath) : const Value.absent(),
      logoPath: logoPath != null ? Value(logoPath) : const Value.absent(),
      thumbPath: thumbPath != null ? Value(thumbPath) : const Value.absent(),
    ));
  }
}
