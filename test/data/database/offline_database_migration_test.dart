import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;

OfflineDatabase _open(sqlite.Database raw) =>
    OfflineDatabase(NativeDatabase.opened(raw, closeUnderlyingOnClose: false));

/// Creates the current schema, which a test then alters into an older one.
Future<void> _createCurrent(sqlite.Database raw) async {
  final db = _open(raw);
  await db.customSelect('SELECT 1').get();
  await db.close();
}

List<String> _columns(sqlite.Database raw, String table) => [
  for (final row in raw.select('PRAGMA table_info($table)'))
    row['name'] as String,
];

bool _hasTable(sqlite.Database raw, String table) => raw.select(
  "SELECT 1 FROM sqlite_master WHERE type = 'table' AND name = ?",
  [table],
).isNotEmpty;

Future<OfflineDatabase> _upgrade(sqlite.Database raw) async {
  final db = _open(raw);
  await db.customSelect('SELECT 1').get();
  return db;
}

void main() {
  late sqlite.Database raw;

  setUp(() => raw = sqlite.sqlite3.openInMemory());
  tearDown(() => raw.dispose());

  test('a fresh install has the server total and full sync columns', () async {
    final db = await _upgrade(raw);
    addTearDown(db.close);

    expect(raw.userVersion, 3);
    expect(
      _columns(raw, 'catalog_sync_states'),
      containsAll(['server_total', 'last_full_sync_at']),
    );

    final synced = DateTime.utc(2026, 11, 13, 9);
    await db
        .into(db.catalogSyncStates)
        .insert(
          CatalogSyncStatesCompanion.insert(
            serverId: 's1',
            userId: 'u1',
            kind: 'Movie',
            lastSyncedAt: synced,
            serverTotal: const Value(412),
            lastFullSyncAt: Value(synced),
          ),
        );
    final row = await db.select(db.catalogSyncStates).getSingle();
    expect(row.serverTotal, 412);
    expect(row.lastFullSyncAt?.toUtc(), synced);
  });

  test('a fresh row leaves the server total and full sync time null', () async {
    final db = await _upgrade(raw);
    addTearDown(db.close);

    await db
        .into(db.catalogSyncStates)
        .insert(
          CatalogSyncStatesCompanion.insert(
            serverId: 's1',
            userId: 'u1',
            kind: 'Series',
            lastSyncedAt: DateTime.utc(2026),
          ),
        );
    final row = await db.select(db.catalogSyncStates).getSingle();
    expect(row.serverTotal, isNull);
    expect(row.lastFullSyncAt, isNull);
  });

  test('version 2 upgrades to 3 with both catalog tables', () async {
    await _createCurrent(raw);
    raw
      ..execute('DROP TABLE catalog_sync_states')
      ..execute('DROP TABLE catalog_entries')
      ..userVersion = 2;

    final db = await _upgrade(raw);
    addTearDown(db.close);

    expect(raw.userVersion, 3);
    expect(_hasTable(raw, 'catalog_entries'), isTrue);
    final columns = _columns(raw, 'catalog_sync_states');
    expect(columns.where((c) => c == 'server_total'), hasLength(1));
    expect(columns.where((c) => c == 'last_full_sync_at'), hasLength(1));
    expect(await db.select(db.catalogSyncStates).get(), isEmpty);
  });

  test('upgrading when the tables already exist keeps their rows', () async {
    // A build that created the tables and was closed before the version
    // was written finds them there on the next launch.
    await _createCurrent(raw);
    raw
      ..execute(
        'INSERT INTO catalog_sync_states '
        '(server_id, user_id, kind, last_synced_at, item_count, '
        'server_total, last_full_sync_at) '
        "VALUES ('s1', 'u1', 'Series', 1790000000, 5, 9, 1790000100)",
      )
      ..userVersion = 2;

    final db = await _upgrade(raw);
    addTearDown(db.close);

    expect(raw.userVersion, 3);
    final row = await db.select(db.catalogSyncStates).getSingle();
    expect(row.serverTotal, 9);
    expect(
      row.lastFullSyncAt,
      DateTime.fromMillisecondsSinceEpoch(1790000100 * 1000),
    );
  });

  test('a stored catalog row holds nothing but the item and its ids', () async {
    final db = await _upgrade(raw);
    addTearDown(db.close);

    expect(_columns(raw, 'catalog_entries'), [
      'server_id',
      'user_id',
      'item_id',
      'kind',
      'metadata_json',
    ]);
  });
}
