import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';

final _now = DateTime.utc(2026, 10, 18, 20);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

SiloMediaServerClient _client(FixtureServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: _device,
        httpClientAdapter: server,
        clock: () => _now,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access-1',
          refreshToken: 'refresh-1',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'main';

/// One success per item, apart from [refused], which Silo refuses.
ResponseBody Function(RequestOptions) _answer({
  Set<String> refused = const {},
}) => (o) {
  final items = (o.data as Map)['items'] as List;
  final results = [
    for (final (i, raw) in items.indexed)
      if (refused.contains((raw as Map)['media_item_id']))
        {
          'index': i,
          'media_item_id': raw['media_item_id'],
          'status': 'failure',
          'failure': {
            'type': 'https://siloserver.org/docs/api/v2/problems/not_found',
            'title': 'Not Found',
            'status': 404,
            'detail': 'No such item.',
          },
        }
      else
        {
          'index': i,
          'media_item_id': raw['media_item_id'],
          'status': 'success',
        },
  ];
  return FixtureServer.json(
    200,
    jsonEncode({
      'items': results,
      'summary': {
        'total': items.length,
        'succeeded': items.length - refused.length,
        'failed': refused.length,
      },
    }),
  );
};

OfflineProgressEntry _entry(
  String id, {
  int minutes = 40,
  bool played = false,
}) => OfflineProgressEntry(
  itemId: id,
  position: Duration(minutes: minutes, milliseconds: 500),
  runtime: const Duration(minutes: 100),
  played: played,
  recordedAt: DateTime.utc(2026, 10, 18, 19, 30),
);

void main() {
  test('sends the queued progress in one request, as milliseconds', () async {
    final server = FixtureServer({'/api/v2/sync/progress': _answer()});
    final api = _client(server).userLibraryApi as OfflineProgressSyncApi;

    final taken = await api.syncOfflineProgress([
      _entry('movie-imdb-tt0295701'),
      _entry('episode-imdb-tt1641384-1-1', played: true),
    ]);

    expect(taken, [true, true]);
    final request = server.requests.single;
    expect(request.method, 'POST');
    expect(request.headers['X-Profile-Id'], 'main');
    expect(request.data, {
      'items': [
        {
          'media_item_id': 'movie-imdb-tt0295701',
          'position_ms': 2400500,
          'duration_ms': 6000000,
          'updated_at': '2026-10-18T19:30:00.000Z',
          'client_ref': '0',
        },
        {
          // Played: sent as having reached the end.
          'media_item_id': 'episode-imdb-tt1641384-1-1',
          'position_ms': 6000000,
          'duration_ms': 6000000,
          'updated_at': '2026-10-18T19:30:00.000Z',
          'client_ref': '1',
        },
      ],
    });
    expect(siloSchemaErrors('ProgressSyncInputBody', request.data), isEmpty);
  });

  test('an item Silo refused is false, by its index', () async {
    final server = FixtureServer({
      '/api/v2/sync/progress': _answer(refused: {'movie-b'}),
    });
    final api = _client(server).userLibraryApi as OfflineProgressSyncApi;

    final taken = await api.syncOfflineProgress([
      _entry('movie-a'),
      _entry('movie-b'),
      _entry('movie-c'),
    ]);

    expect(taken, [true, false, true]);
  });

  test("Silo's answers fit the contract", () async {
    final server = FixtureServer({
      '/api/v2/sync/progress': _answer(refused: {'movie-b'}),
    });
    final api = _client(server).userLibraryApi as OfflineProgressSyncApi;
    await api.syncOfflineProgress([_entry('movie-a'), _entry('movie-b')]);
    final answer =
        jsonDecode(
              utf8.decode(
                await _answer(refused: {'movie-b'})(
                  server.requests.single,
                ).stream.expand((b) => b).toList(),
              ),
            )
            as Map<String, dynamic>;

    final items = answer['items'] as List;
    expect(siloSchemaErrors('ProgressSyncSuccess', items[0]), isEmpty);
    expect(siloSchemaErrors('ProgressSyncFailure', items[1]), isEmpty);
    expect(siloSchemaErrors('BulkSummary', answer['summary']), isEmpty);
  });

  test('a failed request reaches the caller and is sent once', () async {
    final server = FixtureServer({
      '/api/v2/sync/progress': (_) =>
          FixtureServer.problem(503, 'unavailable', 'Try again.'),
    });
    final api = _client(server).userLibraryApi as OfflineProgressSyncApi;

    await expectLater(
      api.syncOfflineProgress([_entry('movie-a')]),
      throwsA(isA<DioException>()),
    );
    expect(server.requests, hasLength(1));
  });

  test('nothing to send, nothing sent; batches are at most 100', () async {
    final server = FixtureServer({});
    final api = _client(server).userLibraryApi as OfflineProgressSyncApi;

    expect(await api.syncOfflineProgress(const []), isEmpty);
    expect(server.requests, isEmpty);
    expect(api.offlineProgressBatchLimit, 100);
  });
}
