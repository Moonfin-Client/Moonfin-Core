import 'dart:convert';

import 'package:drift/drift.dart';

part 'offline_database.g.dart';

extension DownloadedItemMetadata on DownloadedItem {
  Map<String, dynamic> get parsedMetadata {
    try {
      final raw = jsonDecode(metadataJson);
      if (raw is Map<String, dynamic>) return raw;
    } catch (_) {}
    return const {};
  }
}

class DownloadedItems extends Table {
  TextColumn get itemId => text()();
  TextColumn get serverId => text()();
  TextColumn get type => text()();
  TextColumn get name => text()();
  TextColumn get localFilePath => text().nullable()();
  TextColumn get metadataJson => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  TextColumn get thumbPath => text().nullable()();
  IntColumn get downloadStatus => integer()();
  RealColumn get downloadProgress => real().withDefault(const Constant(0.0))();
  TextColumn get errorMessage => text().nullable()();
  IntColumn get fileSizeBytes => integer().withDefault(const Constant(0))();
  IntColumn get playbackPositionTicks => integer().withDefault(const Constant(0))();
  BoolColumn get progressSynced => boolean().withDefault(const Constant(true))();
  DateTimeColumn get downloadedAt => dateTime().nullable()();
  TextColumn get qualityPreset => text().withDefault(const Constant('original'))();
  TextColumn get seriesId => text().nullable()();
  TextColumn get seasonId => text().nullable()();
  TextColumn get seriesName => text().nullable()();
  TextColumn get seasonName => text().nullable()();
  IntColumn get indexNumber => integer().nullable()();
  IntColumn get parentIndexNumber => integer().nullable()();

  /// Who queued the download: `manual` for the user, `auto` for an
  /// auto-download subscription. Only auto rows are ever removed by the
  /// subscription's delete-after-watched rule.
  TextColumn get downloadSource =>
      text().withDefault(const Constant('manual'))();

  @override
  Set<Column> get primaryKey => {itemId, serverId};
}

/// A series the user asked to keep downloading new episodes for. One row per
/// series per server account; the keep/delete rules are global preferences.
class AutoDownloadSubscriptions extends Table {
  TextColumn get seriesId => text()();
  TextColumn get serverId => text()();
  TextColumn get userId => text()();
  TextColumn get seriesName => text()();
  TextColumn get qualityPreset => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastCheckedAt => dateTime().nullable()();
  IntColumn get lastQueuedCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();

  @override
  Set<Column> get primaryKey => {seriesId, serverId, userId};
}

@DriftDatabase(tables: [DownloadedItems, AutoDownloadSubscriptions])
class OfflineDatabase extends _$OfflineDatabase {
  OfflineDatabase(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(downloadedItems, downloadedItems.downloadSource);
        await m.createTable(autoDownloadSubscriptions);
      }
    },
  );
}
