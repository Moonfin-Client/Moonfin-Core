import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/util/episode_playability.dart';
import 'package:moonfin/util/season_queue_context.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

/// The episode queue Moonfin builds, and the next season it moves on to,
/// from Silo's answers as the app reads them.
///
/// The queue logic is Moonfin's own (`season_queue_context.dart`,
/// `episode_playability.dart`, the next-season provider in the playback
/// module). These tests check that Silo's mapped seasons and episodes give
/// it what it relies on: season ids that match, numbers, runtimes, media
/// sources and air dates.

const _series = 'series-imdb-tt1641384';
const _s1 = 'season-imdb-tt1641384-1';
const _s2 = 'season-imdb-tt1641384-2';

String _fixture(String name) =>
    File('packages/server_silo/test/fixtures/silo/$name').readAsStringSync();

/// Season 1's captured episodes, and the same three moved to season 2.
String _seasonTwo() {
  final json = jsonDecode(_fixture('season_episodes.json')) as Map;
  for (final e in (json['items'] as List).cast<Map>()) {
    final n = e['episode_number'];
    e['content_id'] = 'episode-imdb-tt1641384-2-$n';
    e['season_number'] = 2;
  }
  return jsonEncode(json);
}

class _Silo implements HttpClientAdapter {
  final paths = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    paths.add(path);
    final body = switch (path) {
      '/api/v2/catalog/series/$_series/seasons' => _fixture(
        'series_seasons.json',
      ),
      '/api/v2/catalog/items/$_s1/episodes' => _fixture('season_episodes.json'),
      '/api/v2/catalog/items/$_s2/episodes' => _seasonTwo(),
      _ => null,
    };
    return ResponseBody.fromString(
      body ?? '{"status":404}',
      body == null ? 404 : 200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _client() =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'device-1',
          name: 'Test Mac',
          appName: 'Moonfin',
          appVersion: '1.9.0',
        ),
        httpClientAdapter: _Silo(),
        clock: () => DateTime.utc(2026, 10, 17, 12),
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.utc(2027),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

Future<List<AggregatedItem>> _episodes(
  MediaServerClient client,
  String seasonId,
) async {
  final data = await client.itemsApi.getEpisodes(
    _series,
    seasonId: seasonId,
    fields: kSeasonQueueEpisodeFields,
  );
  return orderSeasonEpisodes([
    for (final raw in (data['Items'] as List).cast<Map<String, dynamic>>())
      AggregatedItem(id: raw['Id'] as String, serverId: 's', rawData: raw),
  ]);
}

void main() {
  test('a season\'s episodes queue in order, all playable', () async {
    final client = _client();
    final queue = await _episodes(client, _s1);
    expect(queue.map((e) => e.indexNumber), [1, 2, 3]);
    final now = DateTime.utc(2026, 10, 17);
    expect(
      queue.every((e) => isEligibleNextEpisodeCandidate(e, now: now)),
      isTrue,
    );
    for (final e in queue) {
      expect(e.seriesId, _series);
      expect(e.seasonId, _s1);
      expect(e.parentIndexNumber, 1);
      expect(e.mediaSources, isNotEmpty);
    }
    expect(
      isSeasonScopedEpisodeQueue(
        queue,
        seriesId: _series,
        seasonId: _s1,
        seasonNumber: 1,
      ),
      isTrue,
    );
    // The queue's season is the one Moonfin continues from.
    final season = resolveQueueSeason(queue);
    expect(season?.seasonId, _s1);
    expect(season?.seasonNumber, 1);
  });

  test('the last episode ends the season; the next season follows', () async {
    final client = _client();
    final queue = await _episodes(client, _s1);
    expect(isSeasonFinale(queue.last, queue), isTrue);
    expect(isSeasonFinale(queue[1], queue), isFalse);

    // As the next-season provider picks it: the lowest season number above
    // the finished one.
    final seasons =
        ((await client.itemsApi.getSeasons(_series))['Items'] as List)
            .cast<Map<String, dynamic>>();
    final next = seasons
        .where((s) => (s['IndexNumber'] as int) > 1)
        .reduce(
          (a, b) =>
              (a['IndexNumber'] as int) < (b['IndexNumber'] as int) ? a : b,
        );
    expect(next['Id'], _s2);

    final nextEpisodes = await _episodes(client, _s2);
    expect(nextEpisodes.first.id, 'episode-imdb-tt1641384-2-1');
    expect(nextEpisodes.first.seasonId, _s2);
    expect(nextEpisodes.where(isEligibleNextEpisodeCandidate), hasLength(3));
  });

  test('an episode that hasn\'t aired yet is not queued', () async {
    final queue = await _episodes(_client(), _s1);
    // Episode 3 aired on 2011-01-21.
    expect(
      isEligibleNextEpisodeCandidate(queue[2], now: DateTime.utc(2011, 1, 1)),
      isFalse,
    );
  });
}
