import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/repositories/item_mutation_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/background_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/detail_backdrop_target.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

AggregatedItem _item(String id, Map<String, dynamic> rawData) =>
    AggregatedItem(id: id, serverId: 'server', rawData: {'Id': id, ...rawData});

Map<String, dynamic> _track(String id, String albumId) => {
  'Id': id,
  'Name': id,
  'Type': 'Audio',
  'AlbumId': albumId,
  'ImageTags': {'Primary': '$albumId-cover'},
};

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

class _PluginSyncService extends Mock implements PluginSyncService {}

class _ImageApi extends Fake implements ImageApi {
  @override
  String getPrimaryImageUrl(
    String itemId, {
    int? maxWidth,
    int? maxHeight,
    String? tag,
  }) => 'primary/$itemId?tag=$tag';

  @override
  String getBackdropImageUrl(
    String itemId, {
    int? maxWidth,
    int? index,
    String? tag,
  }) => 'backdrop/$itemId/$index?tag=$tag';
}

/// A server with one playlist of two tracks from different albums. The
/// playlist items are held back until [releaseTracks], so a test can look at
/// the page before and after they arrive, the way the reporter saw it.
class _ItemsApi extends Fake implements ItemsApi {
  _ItemsApi({required this.playlistBackdropTags});

  final List<String> playlistBackdropTags;
  final _tracksGate = Completer<void>();

  void releaseTracks() => _tracksGate.complete();

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? fields,
    String? mediaSourceId,
  }) async => {
    'Id': itemId,
    'Name': 'Road Trip',
    'Type': 'Playlist',
    'MediaType': 'Audio',
    'BackdropImageTags': playlistBackdropTags,
    'UserData': {'IsFavorite': false},
  };

  @override
  Future<Map<String, dynamic>> getPlaylistItems(
    String playlistId, {
    int? startIndex,
    int? limit,
    String? fields,
  }) async {
    await _tracksGate.future;
    final items = [
      _track('red-1', 'album-red'),
      _track('green-1', 'album-green'),
    ];
    return {'Items': items, 'TotalRecordCount': items.length};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #getItems) {
      return Future.value({'Items': const [], 'TotalRecordCount': 0});
    }
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('backdropTargetFor', () {
    final tracks = [
      _item('t1', {'Type': 'Audio'}),
      _item('t2', {'Type': 'Audio'}),
    ];

    test('a playlist with its own backdrop keeps it once its tracks load', () {
      final playlist = _item('p', {
        'Type': 'Playlist',
        'BackdropImageTags': ['custom'],
      });

      expect(usesFirstTrackBackdrop(playlist, tracks), isFalse);
      expect(backdropTargetFor(playlist, tracks), same(playlist));
    });

    test('a playlist with no backdrop borrows its first track', () {
      final playlist = _item('p', {'Type': 'Playlist'});

      expect(usesFirstTrackBackdrop(playlist, tracks), isTrue);
      expect(backdropTargetFor(playlist, tracks), same(tracks.first));
    });

    test('a playlist with no tracks yet shows itself', () {
      final bare = _item('p', {'Type': 'Playlist'});
      final custom = _item('q', {
        'Type': 'Playlist',
        'BackdropImageTags': ['custom'],
      });

      expect(backdropTargetFor(bare, const []), same(bare));
      expect(backdropTargetFor(custom, const []), same(custom));
    });

    test('an album with a backdrop shows its own, tracks or not', () {
      final album = _item('a', {
        'Type': 'MusicAlbum',
        'BackdropImageTags': ['album'],
      });

      expect(usesFirstTrackBackdrop(album, tracks), isFalse);
      expect(backdropTargetFor(album, tracks), same(album));
    });

    test('an album with no backdrop still shows itself, not a track', () {
      final album = _item('a', {'Type': 'MusicAlbum'});

      expect(backdropTargetFor(album, tracks), same(album));
    });
  });

  group('a playlist page as its view model fills in', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late _Client client;
    late BackgroundService backgrounds;

    setUp(() async {
      await GetIt.instance.reset();
      userDataSync.reset();
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
      final pluginSync = _PluginSyncService();
      when(() => pluginSync.seerrAvailable).thenReturn(false);
      GetIt.instance.registerSingleton<PluginSyncService>(pluginSync);
      client = _Client();
      when(() => client.baseUrl).thenReturn('http://server');
      when(() => client.imageApi).thenReturn(_ImageApi());
      final factory = _Factory();
      when(() => factory.clientForServerOrActive(any())).thenReturn(client);
      GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
      backgrounds = BackgroundService();
    });

    tearDown(() {
      backgrounds.dispose();
      userDataSync.reset();
      return GetIt.instance.reset();
    });

    /// Loads the playlist the way the detail screen does and, on every notify,
    /// hands the background service what the screen would pick. Returns the
    /// view model and the backdrop shown after each notify.
    (ItemDetailViewModel, List<String?>) openPlaylist(_ItemsApi itemsApi) {
      when(() => client.itemsApi).thenReturn(itemsApi);
      final tmdbRepository = TmdbRepository(client);
      final vm = ItemDetailViewModel(
        itemId: 'playlist-1',
        client: client,
        mutations: ItemMutationRepository(client),
        mdbListRepository: MdbListRepository(client, tmdbRepository),
        tmdbRepository: tmdbRepository,
      );
      final shown = <String?>[];
      vm.addListener(() {
        final item = vm.item;
        if (item == null) return;
        backgrounds.setBackground(backdropTargetFor(item, vm.tracks));
        shown.add(backgrounds.currentUrl);
      });
      addTearDown(vm.dispose);
      return (vm, shown);
    }

    test(
      'a custom backdrop stays through tracks loading and a favourite',
      () async {
        const custom = 'backdrop/playlist-1/0?tag=custom';
        final itemsApi = _ItemsApi(playlistBackdropTags: ['custom']);
        final (vm, shown) = openPlaylist(itemsApi);

        await vm.load();
        await pumpEventQueue();
        expect(vm.state, ItemDetailState.ready);
        expect(vm.tracks, isEmpty, reason: 'the tracks are still on their way');
        expect(backgrounds.currentUrl, custom);

        itemsApi.releaseTracks();
        await pumpEventQueue();
        expect(vm.tracks.map((t) => t.id), ['red-1', 'green-1']);
        expect(backgrounds.currentUrl, custom);

        userDataSync.publish('playlist-1', {'IsFavorite': true});
        await pumpEventQueue();
        expect(vm.item?.isFavorite, isTrue);
        expect(backgrounds.currentUrl, custom);

        expect(shown, isNotEmpty);
        expect(shown, everyElement(custom));
      },
    );

    test('a playlist without a backdrop moves to its first track once the '
        'tracks arrive', () async {
      final itemsApi = _ItemsApi(playlistBackdropTags: const []);
      final (vm, _) = openPlaylist(itemsApi);

      await vm.load();
      await pumpEventQueue();
      expect(vm.tracks, isEmpty);
      expect(backgrounds.currentUrl, isNull);

      itemsApi.releaseTracks();
      await pumpEventQueue();
      expect(backgrounds.currentUrl, 'primary/red-1?tag=album-red-cover');
    });
  });
}
