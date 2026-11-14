import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/repositories/anime_marker_repository.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/moonbase_endpoint.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Client extends Mock implements MediaServerClient {}

class _Factory extends Mock implements MediaServerClientFactory {}

/// On Plex the markers come from Moonbase for Plex, keyed by Plex ratingKeys
/// and signed with the PMS token, never from the Plex server itself.
void main() {
  late HttpServer companion;
  late List<String> hits;
  late MediaServerClient plex;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    hits = [];
    companion = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    companion.listen((request) {
      hits.add(
        '${request.uri.path}?${request.uri.query} '
        '${request.headers.value('X-Plex-Token')}',
      );
      final body = switch (request.uri.path) {
        '/Moonfin/Ping' => {'installed': true},
        '/Moonfin/AnimeMarkers/Series' => {
          'enabled': true,
          'matched': true,
          'pending': false,
          'episodes': {
            '201': {'kind': 'Filler', 'recap': true, 'audio': null},
            '202': {'kind': null, 'recap': false, 'audio': 'Subbed'},
          },
          'seasons': {
            '200': {'audio': 'Subbed'},
          },
          'placement': 'beside',
        },
        '/Moonfin/AnimeMarkers/Items' => {
          'enabled': true,
          'items': {
            '201': {'audio': 'Dubbed'},
          },
        },
        _ => null,
      };
      request.response
        ..statusCode = body == null ? 404 : 200
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(body))
        ..close();
    });

    final client = _Client();
    when(() => client.serverType).thenReturn(ServerType.plex);
    when(() => client.baseUrl).thenReturn('http://plex-server.invalid:32400');
    when(() => client.accessToken).thenReturn('pms-token');
    final factory = _Factory();
    when(() => factory.serverIdOf(client)).thenReturn('plex-1');
    GetIt.instance.registerSingleton<MediaServerClientFactory>(factory);
    await prefs.set(
      UserPreferences.moonbaseUrlForServer('plex-1'),
      'http://127.0.0.1:${companion.port}',
    );
    forgetMoonbaseEndpoint(client);
    plex = client;
  });

  tearDown(() async {
    await companion.close(force: true);
    await GetIt.instance.reset();
  });

  test('series markers come from the companion by ratingKey', () async {
    final repository = AnimeMarkerRepository(plex);

    final markers = await repository.getForSeries('20');

    expect(markers, isNotNull);
    expect(markers!['201']!.kind, AnimeEpisodeKind.filler);
    expect(markers['201']!.recap, isTrue);
    expect(markers['202']!.audio, AnimeAudioKind.subbed);
    expect(
      repository.peekSeason(seriesId: '20', seasonId: '200'),
      AnimeAudioKind.subbed,
    );
    expect(repository.placement, AnimeMarkerPlacement.beside);
    expect(
      hits,
      contains('/Moonfin/AnimeMarkers/Series?seriesId=20 pms-token'),
    );
    repository.dispose();
  });

  test('item audio comes from the companion too', () async {
    final repository = AnimeMarkerRepository(plex);

    expect(await repository.getForItem('201'), AnimeAudioKind.dubbed);
    expect(hits, contains('/Moonfin/AnimeMarkers/Items?ids=201 pms-token'));
    repository.dispose();
  });
}
