import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/anime_marker_repository.dart';
import 'package:moonfin/data/repositories/mdblist_repository.dart';
import 'package:moonfin/data/repositories/tmdb_repository.dart';
import 'package:moonfin/data/services/audiobook_bookmarks_service.dart';
import 'package:moonfin/data/services/audiobook_notes_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/user_ratings_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:server_core/server_core.dart';

class _Client extends Mock implements MediaServerClient {}

class _Sync extends Mock implements PluginSyncService {}

class _Factory extends Mock implements MediaServerClientFactory {}

/// The TMDB, MDBList and anime-marker proxies and the personal ratings,
/// audiobook bookmarks and notes stores live in the Moonfin plugin at the
/// server root, which Silo never has. Against a Silo server (here one whose
/// Moonbase installation can't be looked up) they must send nothing to its
/// root. The same calls against Emby reach the server, which shows the test
/// would notice a request.
void main() {
  late HttpServer server;
  late List<String> hits;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sync = _Sync();
    when(() => sync.currentDeviceProfile).thenReturn('desktop');
    GetIt.instance.registerSingleton<PluginSyncService>(sync);
    hits = [];
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) {
      hits.add(request.uri.path);
      request.response
        ..statusCode = 404
        ..close();
    });
  });

  tearDown(() async {
    await server.close(force: true);
    await GetIt.instance.reset();
  });

  MediaServerClient client(ServerType type) {
    final c = _Client();
    when(() => c.serverType).thenReturn(type);
    when(() => c.baseUrl).thenReturn('http://127.0.0.1:${server.port}');
    when(() => c.accessToken).thenReturn('token');
    when(() => c.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );
    final factory = _Factory();
    when(() => factory.getClientIfExists(any())).thenReturn(c);
    if (GetIt.instance.isRegistered<MediaServerClientFactory>()) {
      GetIt.instance.unregister<MediaServerClientFactory>();
    }
    GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
    return c;
  }

  Future<void> askEverything(MediaServerClient c) async {
    final tmdb = TmdbRepository(c);
    await tmdb.getEpisodeRating(tmdbId: '1', season: 1, episode: 1);
    await MdbListRepository(
      c,
      tmdb,
    ).getRatings(tmdbId: '2', mediaType: 'movie');
    await AnimeMarkerRepository(c).getForSeries('series-1');
    await fetchMyUserRatings(c);
    final bookmarks = AudiobookBookmarksService();
    await bookmarks.add('s1', 'book-1', positionMs: 1000, label: 'Here');
    await bookmarks.syncFromServer('s1', 'book-1');
    final notes = AudiobookNotesService();
    await notes.add('s1', 'book-1', positionMs: 1000, body: 'A note');
    await notes.syncFromServer('s1', 'book-1');
  }

  test('Silo: no proxy request and no proxy URL', () async {
    final silo = client(ServerType.silo);

    await askEverything(silo);

    expect(hits, isEmpty);
    expect(TmdbRepository(silo).thumbUrl(type: 'movie', tmdbId: '1'), isNull);
    expect(await fetchMyUserRatings(silo), isNull);
    // Kept on the device.
    expect(
      await AudiobookBookmarksService().load('s1', 'book-1'),
      hasLength(1),
    );
    expect(await AudiobookNotesService().load('s1', 'book-1'), hasLength(1));
  });

  test('Emby: the same calls reach the server', () async {
    final emby = client(ServerType.emby);

    await askEverything(emby);

    expect(hits, contains('/Moonfin/Tmdb/EpisodeRating'));
    expect(hits, contains('/Moonfin/MdbList/Ratings'));
    expect(hits, contains('/Moonfin/AnimeMarkers/Series'));
    expect(hits, contains('/Moonfin/UserRatings/Mine'));
    expect(hits, contains('/Moonfin/Bookmarks/book-1'));
    expect(hits, contains('/Moonfin/Bookmarks/book-1/Notes'));
    expect(
      TmdbRepository(emby).thumbUrl(type: 'movie', tmdbId: '1'),
      isNotNull,
    );
  });
}
