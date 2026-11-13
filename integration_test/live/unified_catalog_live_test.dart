// Reads a real server's movies and series into the merged catalogue as if
// several servers held them, to see how the catalogue copes with many servers
// without owning that many. Skips unless the server is configured:
//
//   MOONFIN_LIVE_URL=<server url> MOONFIN_LIVE_TOKEN=<token> \
//   MOONFIN_LIVE_USER_ID=<user id> \
//   flutter test integration_test/live -d <device>
//
// MOONFIN_LIVE_COPIES sets how many servers to pretend there are (10).
// MOONFIN_LIVE_SERVER_TYPE=emby runs it against Emby.
// MOONFIN_LIVE_DEVICE_ID reuses a device the token already belongs to.
// It only reads: user views, the user's configuration and item lists.
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/models/server.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/repositories/multi_server_repository.dart';
import 'package:moonfin/data/services/unified_catalog_query.dart';
import 'package:moonfin/data/services/unified_catalog_service.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';

void main() {
  final env = Platform.environment;
  final url = env['MOONFIN_LIVE_URL'];
  final token = env['MOONFIN_LIVE_TOKEN'];
  final userId = env['MOONFIN_LIVE_USER_ID'];
  final configured =
      url != null &&
      url.isNotEmpty &&
      token != null &&
      token.isNotEmpty &&
      userId != null &&
      userId.isNotEmpty;
  final copies = int.tryParse(env['MOONFIN_LIVE_COPIES'] ?? '') ?? 10;
  final isEmby = env['MOONFIN_LIVE_SERVER_TYPE'] == 'emby';

  test(
    'one server read as $copies servers folds back into one library',
    skip: configured ? false : 'MOONFIN_LIVE_URL, _TOKEN and _USER_ID not set',
    timeout: const Timeout(Duration(minutes: 10)),
    () async {
      final deviceInfo = DeviceInfo(
        id: env['MOONFIN_LIVE_DEVICE_ID'] ?? 'moonfin-unified-catalog-live',
        name: 'Moonfin live test',
        appName: 'Moonfin',
        appVersion: '0.0.0',
      );
      final sessions = [
        for (var i = 0; i < copies; i++)
          ServerUserSession(
            server: Server(
              id: 'copy-$i',
              name: 'Copy $i',
              address: url!,
              version: '',
              serverType: isEmby ? ServerType.emby : ServerType.jellyfin,
              dateAdded: DateTime(2026),
            ),
            userId: userId!,
            client:
                (isEmby
                      ? EmbyMediaServerClient(
                          baseUrl: url,
                          deviceInfo: deviceInfo,
                        )
                      : JellyfinMediaServerClient(
                          baseUrl: url,
                          deviceInfo: deviceInfo,
                        ))
                  ..accessToken = token
                  ..userId = userId,
          ),
      ];

      final db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
      addTearDown(db.close);
      final service = UnifiedCatalogService(
        database: db,
        loadSessions: () async => sessions,
        activeServerId: () => 'copy-0',
      );
      addTearDown(service.dispose);

      final sync = Stopwatch()..start();
      await service.forceFullRead();
      sync.stop();
      // ignore: avoid_print
      print('read $copies servers in ${sync.elapsedMilliseconds} ms');
      expect(service.serverCounts, (upToDate: copies, total: copies));

      for (final kind in UnifiedLibraryKind.values) {
        final query = Stopwatch()..start();
        final result = service.query(
          kind,
          UnifiedCatalogQuery(itemTypes: kind.itemType),
        );
        query.stop();
        final items = (result['Items'] as List).cast<Map<String, dynamic>>();
        final rows = await (db.select(
          db.catalogEntries,
        )..where((t) => t.kind.equals(kind.itemType))).get();
        final perServer = rows.length ~/ copies;
        final firstKeys = [
          for (final row in rows)
            catalogMatchKeys(
              kind.itemType,
              jsonDecode(row.metadataJson) as Map<String, dynamic>,
            ).firstOrNull,
        ];
        final withoutId = firstKeys.where((key) => key == null).length;
        final folded = items
            .where((item) => unifiedCopiesOf(item).length == copies)
            .length;
        // ignore: avoid_print
        print(
          '${kind.name}: $perServer per server, ${rows.length} rows, '
          '${items.length} cards ($folded held by every server, '
          '${withoutId ~/ copies} with no external id), '
          'first query ${query.elapsedMilliseconds} ms',
        );

        // Without an external id a title stays a card per server.
        final distinctKeys = firstKeys.whereType<String>().toSet().length;
        expect(items.length, distinctKeys + withoutId);
        expect(folded, greaterThan(0));

        for (final sortBy in const [
          'DateCreated,SortName',
          'CommunityRating,SortName',
          'PremiereDate,SortName',
          'Random',
        ]) {
          final sort = Stopwatch()..start();
          final sorted = service.query(
            kind,
            UnifiedCatalogQuery(
              itemTypes: kind.itemType,
              sortBy: sortBy,
              descending: true,
            ),
            limit: 48,
          );
          sort.stop();
          expect(sorted['TotalRecordCount'], items.length);
          // ignore: avoid_print
          print('  $sortBy: ${sort.elapsedMilliseconds} ms');
        }
      }

      final reload = UnifiedCatalogService(
        database: db,
        loadSessions: () async => sessions,
        activeServerId: () => 'copy-0',
      );
      addTearDown(reload.dispose);
      final fromDisk = Stopwatch()..start();
      await reload.ensureLoaded();
      fromDisk.stop();
      // ignore: avoid_print
      print('reopened from disk in ${fromDisk.elapsedMilliseconds} ms');
      expect(reload.hasTitles(UnifiedLibraryKind.movies), isTrue);
    },
  );
}
