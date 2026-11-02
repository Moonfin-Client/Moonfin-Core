import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/playback/server_shuffle_queue.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

const _series = 'series-imdb-tt1641384';

Map<String, dynamic> _card(int season, int episode) => {
  'content_id': 'episode-imdb-tt1641384-$season-$episode',
  'type': 'episode',
  'title': 'Episode $episode',
  'series_id': _series,
  'season_number': season,
  'episode_number': episode,
  'genres': <String>[],
  'keywords': <String>[],
  'status': 'matched',
};

String _id(int season, int episode) =>
    'episode-imdb-tt1641384-$season-$episode';

/// A Silo shuffle over [order]: it starts at the first, and each advance
/// from the current item moves one on.
class _Silo implements HttpClientAdapter {
  _Silo(this.order);

  final List<(int, int)> order;
  var at = 0;
  final advancedFrom = <Object?>[];

  Map<String, dynamic> _shuffle() => {
    'id': 'sh-1',
    'scope': {'kind': 'series', 'id': _series, 'title': 'Young Justice'},
    'current': _card(order[at].$1, order[at].$2),
    'next': _card(
      order[(at + 1) % order.length].$1,
      order[(at + 1) % order.length].$2,
    ),
    'created_at': '2026-10-17T12:00:00.000Z',
    'updated_at': '2026-10-17T12:00:00.000Z',
  };

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Object? body = switch (options.uri.path) {
      '/api/v2/shuffles/capabilities' => {
        'revision': 'r',
        'state': 'available',
        'allowed': true,
        'scope_kinds': ['series', 'season', 'library'],
      },
      '/api/v2/shuffles' => _shuffle(),
      '/api/v2/shuffles/sh-1/advance' => () {
        final from = (options.data as Map)['from_content_id'];
        advancedFrom.add(from);
        final (s, e) = order[at];
        if (from == _id(s, e)) at = (at + 1) % order.length;
        return _shuffle();
      }(),
      _ => null,
    };
    return ResponseBody.fromString(
      body == null ? '{"status":404}' : jsonEncode(body),
      body == null ? 404 : 200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

SiloMediaServerClient _client(_Silo server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: const DeviceInfo(
          id: 'device-1',
          name: 'Test Mac',
          appName: 'Moonfin',
          appVersion: '1.9.0',
        ),
        httpClientAdapter: server,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: DateTime.now().add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'p1';

final _show = AggregatedItem(
  id: _series,
  serverId: 's1',
  rawData: const {'Id': _series, 'Type': 'Series'},
);

void main() {
  final queue = ServerShuffleQueue.instance;

  setUp(queue.reset);

  test(
    'a show\'s shuffle queues two, then grows one at a time',
    () async {
      final server = _Silo([(2, 4), (1, 9), (3, 2), (1, 1)]);
      final first = await queue.start(_client(server), _show);
      expect(first?.map((e) => e.id), [_id(2, 4), _id(1, 9)]);
      expect(first?.first.serverId, 's1');

      // Playing the first: nothing to add yet.
      expect(await queue.extend(first!.first), isNull);
      // The second is the queue's last: Silo moves on from the first.
      final more = await queue.extend(first.last);
      expect(more?.map((e) => e.id), [_id(3, 2)]);
      expect(server.advancedFrom, [_id(2, 4)]);
      // Asked again for the same item (the end of the queue after the
      // prefetch), nothing more.
      expect(await queue.extend(first.last), isNull);
      // And the next.
      final again = await queue.extend(more!.single);
      expect(again?.map((e) => e.id), [_id(1, 1)]);
      expect(server.advancedFrom, [_id(2, 4), _id(1, 9)]);
    },
  );

  test('a server that doesn\'t shuffle it: Moonfin shuffles', () async {
    final server = _Silo([(1, 1), (1, 2)]);
    final film = AggregatedItem(
      id: 'movie-imdb-tt0295701',
      serverId: 's1',
      rawData: const {'Id': 'movie-imdb-tt0295701', 'Type': 'Movie'},
    );
    expect(await queue.start(_client(server), film), isNull);
    expect(await queue.extend(film), isNull);
  });
}
