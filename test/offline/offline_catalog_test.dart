import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/offline/offline_catalog.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';

void main() {
  late OfflineDatabase db;
  late OfflineRepository repo;
  late OfflineCatalog catalog;

  Future<void> addMovie(String id, {String name = 'Movie'}) {
    return repo.upsertItem(
      DownloadedItemsCompanion(
        itemId: Value(id),
        serverId: const Value('server-1'),
        type: const Value('Movie'),
        name: Value(name),
        metadataJson: Value(
          jsonEncode({
            'Id': id,
            'Type': 'Movie',
            'Name': name,
            'RunTimeTicks': 1000000000,
          }),
        ),
        downloadStatus: const Value(2),
      ),
    );
  }

  setUp(() async {
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    catalog = OfflineCatalog(repo);
    await addMovie('a');
    await addMovie('b');
    await catalog.warm();
  });

  tearDown(() async {
    catalog.dispose();
    await db.close();
  });

  test('a position save keeps the other entries and updates its own', () async {
    final untouched = catalog.byId('b');
    final rebuilt = catalog.changes.first;

    await repo.updatePlaybackPosition('a', 300000000);
    await rebuilt.timeout(const Duration(seconds: 2));

    expect(catalog.byId('b'), same(untouched));
    expect(catalog.byId('a')!.userData!['PlaybackPositionTicks'], 300000000);
  });

  test('changed metadata is parsed again', () async {
    final before = catalog.byId('a');
    final rebuilt = catalog.changes.first;

    await addMovie('a', name: 'Renamed');
    await rebuilt.timeout(const Duration(seconds: 2));

    expect(catalog.byId('a'), isNot(same(before)));
    expect(catalog.byId('a')!.metadata['Name'], 'Renamed');
  });

  test('a download that is no longer complete drops out', () async {
    final rebuilt = catalog.changes.first;

    await repo.updateDownloadStatus('a', 3, error: 'File not found');
    await rebuilt.timeout(const Duration(seconds: 2));

    expect(catalog.byId('a'), isNull);
    expect(catalog.byId('b'), isNotNull);
  });

  test('new and removed downloads show up', () async {
    var rebuilt = catalog.changes.first;
    await addMovie('c');
    await rebuilt.timeout(const Duration(seconds: 2));
    expect(catalog.byId('c'), isNotNull);

    rebuilt = catalog.changes.first;
    await repo.deleteItem('b');
    await rebuilt.timeout(const Duration(seconds: 2));
    expect(catalog.byId('b'), isNull);
    expect(catalog.entries.map((e) => e.id), unorderedEquals(['a', 'c']));
  });
}
