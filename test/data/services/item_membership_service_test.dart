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

      when(() => itemsApi.getPlaylistItems('pl-1')).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'movie-1', 'PlaylistItemId': 'entry-100'},
          ],
        },
      );

      when(() => itemsApi.getPlaylistItems('pl-2')).thenAnswer(
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

    test('updates playlist cache on removal notification', () async {
      when(() => itemsApi.getPlaylists()).thenAnswer(
        (_) async => {
          'Items': [
            {'Id': 'pl-1', 'Name': 'The Hux List'},
          ],
        },
      );

      when(() => itemsApi.getPlaylistItems('pl-1')).thenAnswer(
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
  });
}

