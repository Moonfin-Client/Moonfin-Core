import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:server_core/server_core.dart';

import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/item_membership_service.dart';

class _MockItemsApi extends Mock implements ItemsApi {}

class _MockClient extends Mock implements MediaServerClient {}

AggregatedItem _movie({String id = 'movie-1', String serverId = 'server-1'}) =>
    AggregatedItem(
      id: id,
      serverId: serverId,
      rawData: {'Id': id, 'Type': 'Movie', 'Name': 'Test Movie'},
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockClient client;
  late _MockItemsApi itemsApi;
  late UserRepository users;

  setUp(() {
    client = _MockClient();
    itemsApi = _MockItemsApi();
    when(() => client.itemsApi).thenReturn(itemsApi);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);

    users = UserRepository();
    users.setCurrentUser(
      PrivateUser(
        id: 'u1',
        name: 'Test',
        serverId: 'server-1',
        accessToken: 'token',
        lastUsed: DateTime(2026),
        isAdministrator: true,
        canManageCollections: true,
      ),
    );

    GetIt.instance.registerSingleton<MediaServerClient>(client);
    GetIt.instance.registerSingleton<UserRepository>(users);
    ItemMembershipService.instance.clearCache();
  });

  tearDown(() {
    GetIt.instance.reset();
    ItemMembershipService.instance.clearCache();
  });

  group('ItemMembershipService', () {
    test('discovers playlists containing item and caches results', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
            {'Id': 'pl-2', 'Name': 'Other Playlist'},
          ],
        },
      );

      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-100'},
          ],
        },
      );

      when(
        () => itemsApi.getPlaylistItems('pl-2', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-2', 'PlaylistItemId': 'entry-200'},
          ],
        },
      );

      final movie1 = _movie(id: 'movie-1');
      final memberships =
          await ItemMembershipService.instance.getPlaylistsContaining(movie1);

      expect(memberships.length, equals(1));
      expect(memberships.first.playlistId, equals('pl-1'));
      expect(memberships.first.playlistName, equals('The Hux List'));
      expect(memberships.first.entryId, equals('entry-100'));

      // Subsequent call uses cache without re-hitting getPlaylists
      final cached =
          await ItemMembershipService.instance.getPlaylistsContaining(movie1);
      expect(cached.length, equals(1));
      verify(() => itemsApi.getPlaylists()).called(1);

      // Other movie has no playlists
      final movie2 = _movie(id: 'movie-99');
      final noPlaylists =
          await ItemMembershipService.instance.getPlaylistsContaining(movie2);
      expect(noPlaylists, isEmpty);
    });

    test('scans playlists a few at a time for their entry ids only', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            for (var i = 0; i < 20; i++) {'Id': 'pl-$i', 'Name': 'List $i'},
          ],
        },
      );
      var running = 0;
      var mostAtOnce = 0;
      when(
        () => itemsApi.getPlaylistItems(any(), fields: 'PlaylistItemId'),
      ).thenAnswer((_) async {
        running++;
        if (running > mostAtOnce) mostAtOnce = running;
        await Future<void>.delayed(Duration.zero);
        running--;
        return {'Items': <dynamic>[]};
      });

      await ItemMembershipService.instance.getPlaylistsContaining(_movie());

      verify(
        () => itemsApi.getPlaylistItems(any(), fields: 'PlaylistItemId'),
      ).called(20);
      expect(mostAtOnce, 8);
    });

    test('skips playlist entries the server gives no entry id for', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        },
      );
      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: 'PlaylistItemId'),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1'},
          ],
        },
      );

      final memberships =
          await ItemMembershipService.instance.getPlaylistsContaining(_movie());

      expect(memberships, isEmpty);
    });

    test('keeps a playlist\'s last entries when fetching them fails', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        },
      );
      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: 'PlaylistItemId'),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-100'},
          ],
        },
      );
      await ItemMembershipService.instance.getPlaylistsContaining(_movie());

      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: 'PlaylistItemId'),
      ).thenThrow(Exception('playlist items failed'));
      final memberships = await ItemMembershipService.instance
          .getPlaylistsContaining(_movie(), forceRefresh: true);

      expect(memberships.single.entryId, 'entry-100');
    });

    test('updates playlist cache on removal notification', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        },
      );

      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-100'},
          ],
        },
      );

      final movie = _movie(id: 'movie-1');
      var list =
          await ItemMembershipService.instance.getPlaylistsContaining(movie);
      expect(list.length, equals(1));

      // Notify removal
      ItemMembershipService.instance
          .notifyItemRemovedFromPlaylist('server-1', 'pl-1', 'movie-1');

      final cachedAfter =
          ItemMembershipService.instance.getCachedPlaylistsContaining(movie);
      expect(cachedAfter, isEmpty);
    });

    test('discovers collections containing item and caches results', () async {
      when(() => itemsApi.getAncestors('movie-1')).thenAnswer((_) async => []);

      when(
        () => itemsApi.getItems(
          includeItemTypes: const ['BoxSet'],
          recursive: true,
          sortBy: 'SortName',
          fields: 'BasicSyncInfo',
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'col-1', 'Name': 'Alien Collection'},
          ],
        },
      );

      when(
        () => itemsApi.getItems(
          parentId: 'col-1',
          fields: 'BasicSyncInfo',
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1'},
          ],
        },
      );

      final movie = _movie(id: 'movie-1');
      final collections =
          await ItemMembershipService.instance.getCollectionsContaining(movie);

      expect(collections.length, equals(1));
      expect(collections.first.collectionId, equals('col-1'));
      expect(collections.first.collectionName, equals('Alien Collection'));

      // Removal notification updates cache
      ItemMembershipService.instance
          .notifyItemRemovedFromCollection('server-1', 'col-1', 'movie-1');

      final cachedAfter =
          ItemMembershipService.instance.getCachedCollectionsContaining(movie);
      expect(cachedAfter, isEmpty);
    });

    test('evicts deleted playlists and collections on subsequent sync', () async {
      var playlistsResponse = [
        {'Id': 'pl-1', 'Name': 'The Hux List'},
      ];
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {'Items': playlistsResponse},
      );
      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-100'},
          ],
        },
      );

      final movie = _movie(id: 'movie-1');
      final first = await ItemMembershipService.instance.getPlaylistsContaining(
        movie,
        forceRefresh: true,
      );
      expect(first.length, equals(1));

      // Playlist deleted on server
      playlistsResponse = [];
      final second = await ItemMembershipService.instance.getPlaylistsContaining(
        movie,
        forceRefresh: true,
      );
      expect(second, isEmpty);
    });

    test('validates ancestor BoxSet direct membership before displaying', () async {
      when(() => itemsApi.getAncestors('movie-1')).thenAnswer(
        (_) async => [
          {'Id': 'col-outer', 'Name': 'Outer BoxSet', 'Type': 'BoxSet'},
          {'Id': 'col-direct', 'Name': 'Direct BoxSet', 'Type': 'BoxSet'},
        ],
      );

      when(
        () => itemsApi.getItems(
          includeItemTypes: const ['BoxSet'],
          recursive: true,
          sortBy: 'SortName',
          fields: 'BasicSyncInfo',
        ),
      ).thenAnswer((_) async => {'Items': []});

      // Outer collection contains col-direct, not movie-1 directly
      when(
        () => itemsApi.getItems(
          parentId: 'col-outer',
          fields: 'BasicSyncInfo',
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'col-direct'},
          ],
        },
      );

      // Direct collection contains movie-1 directly
      when(
        () => itemsApi.getItems(
          parentId: 'col-direct',
          fields: 'BasicSyncInfo',
        ),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1'},
          ],
        },
      );

      final movie = _movie(id: 'movie-1');
      final collections =
          await ItemMembershipService.instance.getCollectionsContaining(movie);

      expect(collections.map((c) => c.collectionId).toList(), equals(['col-direct']));
    });

    test('notifyItemAddedToPlaylist refreshes server-assigned PlaylistItemId instead of synthesizing entryId', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        },
      );
      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'server-entry-999'},
          ],
        },
      );

      ItemMembershipService.instance.notifyItemAddedToPlaylist(
        'server-1',
        'pl-1',
        ['movie-1'],
      );

      final movie = _movie(id: 'movie-1');
      final playlists =
          await ItemMembershipService.instance.getPlaylistsContaining(movie);
      expect(playlists.length, equals(1));
      expect(playlists.first.entryId, equals('server-entry-999'));
    });

    test('clearCache invalidates in-flight syncs so stale user data is discarded', () async {
      final oldUserPlaylists = Completer<Map<String, dynamic>>();
      var callCount = 0;

      when(() => itemsApi.getPlaylists()).thenAnswer((_) {
        callCount++;
        if (callCount == 1) {
          return oldUserPlaylists.future;
        }
        return Future.value({'Items': []});
      });

      final movie = _movie(id: 'movie-1');
      final oldLookup =
          ItemMembershipService.instance.getPlaylistsContaining(movie);

      // Account switch occurs while old sync is in flight
      ItemMembershipService.instance.clearCache();

      // New user lookup starts a separate request instead of joining old sync
      final newResult =
          await ItemMembershipService.instance.getPlaylistsContaining(movie);
      expect(newResult, isEmpty);
      expect(callCount, equals(2));

      // Old request finishes late with previous user's playlist
      oldUserPlaylists.complete({
        'Items': [
          {'Id': 'pl-old', 'Name': 'Old User Playlist'},
        ],
      });
      final oldResult = await oldLookup;
      expect(oldResult, isEmpty);
      expect(
        ItemMembershipService.instance.getCachedPlaylistsContaining(movie),
        isEmpty,
      );
    });

    test('concurrent playlist and collection mutations invalidate in-flight scans and queue replacement playlist sync', () async {
      final firstPlaylistScan = Completer<Map<String, dynamic>>();
      var playlistScanCount = 0;

      when(() => itemsApi.getPlaylists()).thenAnswer((_) {
        playlistScanCount++;
        if (playlistScanCount == 1) {
          return firstPlaylistScan.future;
        }
        return Future.value({
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        });
      });

      when(
        () => itemsApi.getPlaylistItems('pl-1', fields: any(named: 'fields')),
      ).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-after-add'},
          ],
        },
      );

      final movie = _movie(id: 'movie-1');
      final lookupFuture =
          ItemMembershipService.instance.getPlaylistsContaining(movie);

      // While scan 1 is in flight, item is added to playlist
      ItemMembershipService.instance.notifyItemAddedToPlaylist(
        'server-1',
        'pl-1',
        ['movie-1'],
      );

      // Scan 1 completes with stale empty playlists; should be discarded and replaced by scan 2
      firstPlaylistScan.complete({'Items': []});

      final playlists = await lookupFuture;
      expect(playlistScanCount, equals(2));
      expect(playlists.length, equals(1));
      expect(playlists.first.entryId, equals('entry-after-add'));
    });
  });
}

