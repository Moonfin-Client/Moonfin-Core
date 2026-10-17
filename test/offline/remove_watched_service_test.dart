import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/database/offline_database.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/remove_watched_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockItemsApi extends Mock implements ItemsApi {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OfflineDatabase db;
  late OfflineRepository repo;
  late UserPreferences prefs;
  late MediaServerClient client;
  late ItemsApi items;
  late List<String> deleted;
  late bool deleteSucceeds;
  late _ServiceBuilder build;
  late RemoveWatchedService service;
  // Turning the rule on stamps the real time, so the fixture's watches
  // come after it and the pass runs an hour after them.
  late DateTime downloadedAt;
  late DateTime playedAt;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    db = OfflineDatabase(DatabaseConnection(NativeDatabase.memory()));
    repo = OfflineRepository(db);
    client = _MockClient();
    items = _MockItemsApi();
    when(() => client.baseUrl).thenReturn('http://server-a.test');
    when(() => client.itemsApi).thenReturn(items);
    deleted = [];
    deleteSucceeds = true;
    downloadedAt = DateTime.now().toUtc().subtract(const Duration(days: 1));
    playedAt = DateTime.now().toUtc().add(const Duration(minutes: 1));
    build =
        ({
          DeleteServerDownload? deleteDownload,
          bool syncing = false,
          String serverId = 'server-a',
        }) => RemoveWatchedService(
          repository: repo,
          prefs: prefs,
          deleteDownload:
              deleteDownload ??
              (AggregatedItem item, {required String serverId}) async {
                deleted.add(item.id);
                return deleteSucceeds;
              },
          signedInServer: () => (client: client, serverId: serverId),
          syncInFlight: () => syncing,
          now: () => playedAt.add(const Duration(hours: 1)),
          stopDebounce: Duration.zero,
        );
    service = build();
  });

  tearDown(() async {
    service.dispose();
    await db.close();
  });

  Future<void> download(
    String id, {
    String serverId = 'server-a',
    String type = 'Movie',
    bool played = true,
    DateTime? lastPlayed,
    String source = 'manual',
    String? metadataJson,
  }) => repo.upsertItem(
    DownloadedItemsCompanion(
      itemId: Value(id),
      serverId: Value(serverId),
      type: Value(type),
      name: Value(id),
      metadataJson: Value(
        metadataJson ??
            jsonEncode({
              'Id': id,
              'Type': type,
              'UserData': {
                'Played': played,
                if (played)
                  'LastPlayedDate': (lastPlayed ?? playedAt).toIso8601String(),
              },
            }),
      ),
      downloadStatus: const Value(2),
      downloadedAt: Value(downloadedAt),
      downloadSource: Value(source),
    ),
  );

  Future<void> enable() => prefs.setRemoveWatchedAfterHours(0);

  void serverSays(String id, {required bool played}) {
    when(() => items.getItem(id)).thenAnswer(
      (_) async => {
        'Id': id,
        'UserData': {
          'Played': played,
          'LastPlayedDate': playedAt.toIso8601String(),
        },
      },
    );
  }

  group('a pass', () {
    test('does nothing while the rule is set to never', () async {
      await download('m1');
      expect(await service.run(client, serverId: 'server-a'), 0);
      expect(deleted, isEmpty);
    });

    test('leaves automatic downloads to their own settings', () async {
      await enable();
      await download('manual');
      await download('auto', type: 'Episode', source: 'auto');
      await service.run(client, serverId: 'server-a');
      expect(deleted, ['manual']);
    });

    test("removes only the synced server's watched downloads", () async {
      await enable();
      await download('a-watched');
      await download('a-unwatched', played: false);
      await download('a-track', type: 'Audio');
      await download('b-watched', serverId: 'server-b');
      // Rows from older builds store the server's URL instead of its id.
      await download('a-by-url', serverId: 'http://server-a.test');

      expect(await service.run(client, serverId: 'server-a'), 2);
      expect(deleted, unorderedEquals(['a-watched', 'a-by-url']));
    });

    test('a Keep on one server does not keep the same id on another', () async {
      await enable();
      await download('m1');
      await prefs.setDownloadKept('server-b', 'm1', keep: true);
      await service.run(client, serverId: 'server-a');
      expect(deleted, ['m1']);

      deleted.clear();
      await prefs.setDownloadKept('server-a', 'm1', keep: true);
      await service.run(client, serverId: 'server-a');
      expect(deleted, isEmpty);
    });

    test('only removes what was watched after it was turned on', () async {
      await download(
        'before',
        lastPlayed: downloadedAt.add(const Duration(hours: 1)),
      );
      await download('after');
      await enable();
      expect(await service.run(client, serverId: 'server-a'), 1);
      expect(deleted, ['after']);
    });

    test('rechecks a Keep set while the pass deletes', () async {
      await enable();
      await download('m1');
      await download('m2');
      service = build(
        deleteDownload: (item, {required serverId}) async {
          deleted.add(item.id);
          await prefs.setDownloadKept('server-a', 'm2', keep: true);
          return true;
        },
      );
      expect(await service.run(client, serverId: 'server-a'), 1);
      expect(deleted, ['m1']);
    });

    test('hands the deletes the server it planned for', () async {
      await enable();
      await download('m1');
      final servers = <String>[];
      service = build(
        deleteDownload: (item, {required serverId}) async {
          servers.add(serverId);
          return true;
        },
      );
      await service.run(client, serverId: 'server-a');
      expect(servers, ['server-a']);
    });

    test(
      'turning it on stamps when, and changing the delay does not',
      () async {
        await prefs.setRemoveWatchedAfterHours(24);
        final since = prefs.get(UserPreferences.downloadRemoveWatchedSince);
        expect(DateTime.tryParse(since), isNotNull);

        await prefs.setRemoveWatchedAfterHours(0);
        expect(prefs.get(UserPreferences.downloadRemoveWatchedSince), since);
      },
    );

    test('waits for offline progress to reach the server', () async {
      await enable();
      await download('m1');
      await repo.updatePlaybackPosition('m1', 42);
      expect(await service.run(client, serverId: 'server-a'), 0);
    });

    test('skips a row with unreadable metadata and carries on', () async {
      await enable();
      await download('broken', metadataJson: '');
      await download('m1');
      expect(await service.run(client, serverId: 'server-a'), 1);
      expect(deleted, ['m1']);
    });

    test('counts only the deletes that went through', () async {
      await enable();
      await download('m1');
      deleteSucceeds = false;
      expect(await service.run(client, serverId: 'server-a'), 0);
      expect(deleted, ['m1']);
    });

    test('leaves a row that was re-queued since the pass began', () async {
      await enable();
      await download('m1');
      await download('m2');
      service = build(
        deleteDownload: (item, {required serverId}) async {
          deleted.add(item.id);
          // Deleting m1 races a re-download of m2 at another quality.
          if (item.id == 'm1') await repo.updateDownloadStatus('m2', 1);
          return true;
        },
      );
      expect(await service.run(client, serverId: 'server-a'), 1);
      expect(deleted, ['m1']);
    });

    test(
      'checks its own server row, not another server sharing the id',
      () async {
        await enable();
        // Emby ids are plain numbers, so two servers can each have a 42.
        // upsertItem replaces a row of the same id whatever its server, so
        // the second goes straight in.
        await download('42');
        await db
            .into(db.downloadedItems)
            .insert(
              DownloadedItemsCompanion.insert(
                itemId: '42',
                serverId: 'server-b',
                type: 'Movie',
                name: '42',
                metadataJson: '{"Id":"42","UserData":{"Played":false}}',
                downloadStatus: 2,
                // Newer, so an unscoped lookup of 42 lands on this row.
                downloadedAt: Value(downloadedAt.add(const Duration(hours: 1))),
              ),
            );
        expect(await service.run(client, serverId: 'server-a'), 1);
        expect(deleted, ['42']);
      },
    );

    test('never overlaps: a pass asked for meanwhile waits', () async {
      await enable();
      await download('m1');
      final gate = Completer<void>();
      var running = 0;
      var overlapped = false;
      service = build(
        deleteDownload: (item, {required serverId}) async {
          running++;
          if (running > 1) overlapped = true;
          await gate.future;
          running--;
          deleted.add(item.id);
          await repo.deleteItem(item.id);
          return true;
        },
      );
      final first = service.run(client, serverId: 'server-a');
      final second = service.run(client, serverId: 'server-a');
      final third = service.run(client, serverId: 'server-a');
      await pumpEventQueue();
      gate.complete();
      expect(await first, 1);
      // The waiting pass finds the download gone.
      expect(await second, 0);
      expect(await third, 0);
      expect(overlapped, isFalse);
      expect(deleted, ['m1']);
    });

    test('the signed-in pass leaves the reconnect sync to its own', () async {
      await enable();
      await download('m1');
      service = build(syncing: true);
      expect(await service.runForSignedInServer(), 0);
      expect(deleted, isEmpty);
    });
  });

  group('after a download stops', () {
    test('pulls its played state, then removes it', () async {
      await enable();
      await download('m1', played: false);
      // Watched online through the local file: progress not yet synced.
      await repo.updatePlaybackPosition('m1', 0);
      serverSays('m1', played: true);

      service.onItemStopped('m1');
      await pumpEventQueue();

      expect(deleted, ['m1']);
    });

    test('fetches every item stopped within the debounce', () async {
      await enable();
      await download('e1', type: 'Episode', played: false);
      await download('e2', type: 'Episode', played: false);
      serverSays('e1', played: true);
      serverSays('e2', played: false);

      // e1 ends, e2 auto-starts and is stopped straight away.
      service.onItemStopped('e1');
      service.onItemStopped('e2');
      await pumpEventQueue();

      verify(() => items.getItem('e1')).called(1);
      verify(() => items.getItem('e2')).called(1);
      expect(deleted, ['e1']);
    });

    test("writes only its own server's row of a shared id", () async {
      await enable();
      await download('42', played: false);
      await repo.updatePlaybackPosition('42', 0);
      await db
          .into(db.downloadedItems)
          .insert(
            DownloadedItemsCompanion.insert(
              itemId: '42',
              serverId: 'server-b',
              type: 'Movie',
              name: '42',
              metadataJson: '{"Id":"42","UserData":{"Played":false}}',
              downloadStatus: 2,
              playbackPositionTicks: const Value(42),
              progressSynced: const Value(false),
            ),
          );
      serverSays('42', played: true);

      service.onItemStopped('42');
      await pumpEventQueue();

      final other = await (db.select(
        db.downloadedItems,
      )..where((t) => t.serverId.equals('server-b'))).getSingle();
      expect(other.progressSynced, isFalse);
      expect(other.playbackPositionTicks, 42);
      expect(other.metadataJson, contains('"Played":false'));
    });

    test('leaves it when the server says it is not finished', () async {
      await enable();
      await download('m1', played: false);
      serverSays('m1', played: false);

      service.onItemStopped('m1');
      await pumpEventQueue();

      expect(deleted, isEmpty);
    });

    test('does not ask the server while the rule is off', () async {
      await download('m1', played: false);
      service.onItemStopped('m1');
      await pumpEventQueue();
      verifyNever(() => items.getItem(any()));
    });
  });
}

typedef _ServiceBuilder = RemoveWatchedService Function({
  DeleteServerDownload? deleteDownload,
  bool syncing,
  String serverId,
});
