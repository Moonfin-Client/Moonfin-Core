import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import '../../playback_silo/test/silo_contract.dart';
import 'fixture_server.dart';

var _now = DateTime.utc(2026, 10, 18, 20);

const _device = DeviceInfo(
  id: 'device-1',
  name: 'Test TV',
  appName: 'Moonfin',
  appVersion: '2.7.0',
);

const _mainId = 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63';

Map<String, dynamic> _fixture(String name) =>
    jsonDecode(fixture('silo/$name')) as Map<String, dynamic>;

ResponseBody Function(RequestOptions) _json(Object body, {int status = 200}) =>
    (_) => FixtureServer.json(status, jsonEncode(body));

/// The captured capability with [changes] merged in.
Map<String, dynamic> _capability([Map<String, dynamic> changes = const {}]) => {
  ..._fixture('downloads_capabilities.json'),
  ...changes,
};

SiloMediaServerClient _client(FixtureServer server) =>
    SiloMediaServerClient(
        baseUrl: 'https://silo.example',
        deviceInfo: _device,
        httpClientAdapter: server,
        platform: 'macos',
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
      ..profileId = _mainId;

const _fileUrl = 'https://silo.example/api/v2/downloads/dl_01HSCRUBBED/file';

int _reads(FixtureServer server) => server.requests
    .where((r) => r.uri.path == '/api/v2/capabilities/downloads')
    .length;

void main() {
  setUp(() => _now = DateTime.utc(2026, 10, 18, 20));

  group('capability', () {
    test('the captured capability fits the contract and reads back', () async {
      expect(siloSchemaErrors('DownloadCapability', _capability()), isEmpty);
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': _json(_capability()),
      });

      final capability = await _client(server).downloadsApi.capability();

      expect(capability.state, 'available');
      expect(capability.enabled, isTrue);
      expect(capability.allowed, isTrue);
      expect(capability.qualityPresets, ['original']);
      expect(capability.qualityOptions.single.preset, 'original');
      expect(capability.qualityOptions.single.bitrateKbps, isNull);
      expect(capability.prepareAgain, isTrue);
      expect(capability.permitsDownloads, isTrue);

      final read = server.requests.single;
      expect(read.headers['X-Profile-Id'], _mainId);
      expect(read.headers['X-Silo-Device-Id'], isNotEmpty);
    });

    test('quality options carry their bitrate and height', () async {
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': _json(
          _capability({
            'quality_presets': ['original', '10mbps', '2mbps'],
            'quality_options': [
              {'preset': 'original'},
              {'preset': '10mbps', 'bitrate_kbps': 10000, 'max_height': 1080},
              {'preset': '2mbps', 'bitrate_kbps': 2000, 'max_height': 720},
            ],
          }),
        ),
      });

      final options = (await _client(
        server,
      ).downloadsApi.capability()).qualityOptions;

      expect(options.map((o) => o.preset), ['original', '10mbps', '2mbps']);
      expect(options[1].bitrateKbps, 10000);
      expect(options[1].maxHeight, 1080);
    });

    for (final (name, changes) in [
      ('switched off on the server', {'enabled': false}),
      ('refused for this login (demo mode)', {'allowed': false}),
      ('not configured', {'state': 'not_configured'}),
      ('offering no quality', {'quality_presets': <String>[]}),
    ]) {
      test('downloads $name are not permitted', () async {
        final server = FixtureServer({
          '/api/v2/capabilities/downloads': _json(_capability(changes)),
        });

        final capability = await _client(server).downloadsApi.capability();

        expect(capability.permitsDownloads, isFalse);
      });
    }

    test('is read once a minute, and concurrent reads share one', () async {
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': _json(_capability()),
      });
      final api = _client(server).downloadsApi;

      await Future.wait([api.capability(), api.capability()]);
      await api.capability();
      expect(_reads(server), 1);

      _now = _now.add(const Duration(minutes: 1, seconds: 1));
      await api.capability();
      expect(_reads(server), 2);

      api.invalidateCapability();
      await api.capability();
      expect(_reads(server), 3);
    });

    test('a failed read reaches the caller and is not kept', () async {
      var fail = true;
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': (o) => fail
            ? FixtureServer.problem(503, 'unavailable', 'Try again.')
            : FixtureServer.json(200, jsonEncode(_capability())),
      });
      final api = _client(server).downloadsApi;

      await expectLater(api.capability(), throwsA(isA<DioException>()));
      fail = false;
      expect((await api.capability()).permitsDownloads, isTrue);
    });
  });

  group('the user download permission (getCurrentUser)', () {
    ResponseBody Function(RequestOptions) account(bool downloadAllowed) =>
        _json({
          ..._fixture('account_me.json'),
          'download_allowed': downloadAllowed,
        });

    Future<bool?> canDownload(FixtureServer server) async => (await _client(
      server,
    ).usersApi.getCurrentUser()).policy?.enableContentDownloading;

    test('on when the account may download and the server allows it', () async {
      final server = FixtureServer({
        '/api/v2/account/me': account(true),
        '/api/v2/profiles': _json(_fixture('profiles.json')),
        '/api/v2/capabilities/downloads': _json(_capability()),
      });

      expect(await canDownload(server), isTrue);
    });

    test('off when the server has downloads switched off', () async {
      final server = FixtureServer({
        '/api/v2/account/me': account(true),
        '/api/v2/profiles': _json(_fixture('profiles.json')),
        '/api/v2/capabilities/downloads': _json(
          _capability({'enabled': false, 'quality_presets': <String>[]}),
        ),
      });

      expect(await canDownload(server), isFalse);
    });

    test('the capability never turns on what the account may not', () async {
      final server = FixtureServer({
        '/api/v2/account/me': account(false),
        '/api/v2/profiles': _json(_fixture('profiles.json')),
        '/api/v2/capabilities/downloads': _json(_capability()),
      });

      expect(await canDownload(server), isFalse);
    });

    test('an unreadable capability keeps the account flag', () async {
      final server = FixtureServer({
        '/api/v2/account/me': account(true),
        '/api/v2/profiles': _json(_fixture('profiles.json')),
      });

      expect(await canDownload(server), isTrue);
    });

    test(
      'each read asks Silo again (sign-in, start, access changed)',
      () async {
        final server = FixtureServer({
          '/api/v2/account/me': account(true),
          '/api/v2/profiles': _json(_fixture('profiles.json')),
          '/api/v2/capabilities/downloads': _json(_capability()),
        });
        final client = _client(server);

        await client.usersApi.getCurrentUser();
        await client.usersApi.getCurrentUser();

        expect(_reads(server), 2);
      },
    );
  });

  group('prepareDownload', () {
    Map<String, dynamic> created([Map<String, dynamic> changes = const {}]) {
      final body = _fixture('download_created.json');
      final entry = (body['items'] as List).first as Map<String, dynamic>;
      entry.addAll(changes);
      return body;
    }

    Map<String, dynamic> listed(
      List<Map<String, dynamic>> entries, {
      String? next,
    }) => {
      'items': entries,
      'page': {'has_more': next != null, 'next_cursor': ?next},
    };

    Map<String, dynamic> entry(Map<String, dynamic> changes) => {
      ...(_fixture('download_created.json')['items'] as List).first
          as Map<String, dynamic>,
      ...changes,
    };

    FixtureServer silo({
      Map<String, dynamic>? capability,
      List<Map<String, dynamic>> entries = const [],
      ResponseBody Function(RequestOptions)? create,
    }) => FixtureServer({
      '/api/v2/capabilities/downloads': _json(capability ?? _capability()),
      '/api/v2/downloads': (o) => o.method == 'GET'
          ? FixtureServer.json(200, jsonEncode(listed(entries)))
          : (create ?? _json(created(), status: 202))(o),
    });

    RequestOptions creation(FixtureServer server) =>
        server.requests.singleWhere(
          (r) => r.uri.path == '/api/v2/downloads' && r.method == 'POST',
        );

    const movie = ServerDownloadRequest(
      itemId: 'movie-imdb-tt0295701',
      mediaSourceId: '4567',
    );

    test('the fixture fits the contract', () {
      expect(siloSchemaErrors('DownloadCreated', created()), isEmpty);
    });

    test('a season queued at once lists the device\'s entries once', () async {
      final server = silo();
      final downloads = _client(server).downloadsApi;

      for (var e = 1; e <= 3; e++) {
        await downloads.prepareDownload(
          ServerDownloadRequest(
            itemId: 'episode-imdb-tt1641384-1-$e',
            seriesId: 'series-imdb-tt1641384',
          ),
        );
      }

      final lists = server.requests.where(
        (r) => r.uri.path == '/api/v2/downloads' && r.method == 'GET',
      );
      expect(lists, hasLength(1));
    });

    test('registers a new download and answers its file', () async {
      final server = silo();

      final ticket = await _client(server).downloadsApi.prepareDownload(movie);

      final list = server.requests.firstWhere(
        (r) => r.uri.path == '/api/v2/downloads',
      );
      expect(list.method, 'GET');
      expect(list.uri.queryParameters['limit'], '100');
      final create = creation(server);
      expect(create.data, {
        'content_id': 'movie-imdb-tt0295701',
        'media_file_id': '4567',
        'quality': 'original',
        'expected_revision': 0,
      });
      expect(siloSchemaErrors('DownloadCreateBody', create.data), isEmpty);
      expect(create.headers['X-Silo-Device-Id'], isNotEmpty);
      expect(create.headers['X-Profile-Id'], _mainId);

      expect(ticket.id, 'dl_01HSCRUBBED');
      expect(ticket.itemId, 'movie-imdb-tt0295701');
      expect(
        ticket.url.toString(),
        'https://silo.example/api/v2/downloads/dl_01HSCRUBBED/file',
      );
      expect(ticket.headers['Authorization'], 'Bearer access-1');
      expect(ticket.headers['X-Profile-Id'], _mainId);
      expect(ticket.headers['X-Silo-Device-Id'], isNotEmpty);
      expect(ticket.headers['Accept'], 'application/octet-stream');
      expect(ticket.revision, 1);
      expect(ticket.sizeBytes, 2048);
      expect(ticket.container, isNull);
      expect(ticket.mediaSourceId, '4567');
    });

    test("a ticket sends the login's current token", () async {
      final client = _client(silo());
      final ticket = await client.downloadsApi.prepareDownload(movie);

      client.session.setTokens(
        SiloTokens(
          accessToken: 'access-2',
          refreshToken: 'refresh-2',
          expiresAt: _now.add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      );

      expect(ticket.headers['Authorization'], 'Bearer access-2');
    });

    test("an episode is its series' content with the episode named", () async {
      final server = silo(
        create: _json(
          created({
            'content_id': 'series-imdb-tt1641384',
            'episode_id': 'episode-imdb-tt1641384-1-1',
          }),
          status: 202,
        ),
      );

      final ticket = await _client(server).downloadsApi.prepareDownload(
        const ServerDownloadRequest(
          itemId: 'episode-imdb-tt1641384-1-1',
          seriesId: 'series-imdb-tt1641384',
        ),
      );

      expect(creation(server).data, {
        'content_id': 'series-imdb-tt1641384',
        'episode_id': 'episode-imdb-tt1641384-1-1',
        'quality': 'original',
        'expected_revision': 0,
      });
      expect(ticket.itemId, 'episode-imdb-tt1641384-1-1');
    });

    test("the device's existing entry is named with its revision", () async {
      final server = silo(
        entries: [
          entry({
            'id': 'dl_other',
            'content_id': 'series-x',
            'episode_id': 'episode-x',
          }),
          entry({'id': 'dl_old', 'revision': 3, 'status': 'completed'}),
        ],
      );

      await _client(server).downloadsApi.prepareDownload(movie);

      final body = creation(server).data as Map<String, dynamic>;
      expect(body['expected_revision'], 3);
      expect(body['expected_download_id'], 'dl_old');
      expect(siloSchemaErrors('DownloadCreateBody', body), isEmpty);
    });

    test('the entry scan follows the cursor and stops at the end', () async {
      var page = 0;
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': _json(_capability()),
        '/api/v2/downloads': (o) {
          if (o.method == 'POST') {
            return FixtureServer.json(202, jsonEncode(created()));
          }
          page++;
          return FixtureServer.json(
            200,
            jsonEncode(
              page == 1
                  ? listed([
                      entry({'id': 'dl_a', 'content_id': 'movie-a'}),
                    ], next: 'c2')
                  : listed([
                      entry({'id': 'dl_b', 'revision': 2}),
                    ]),
            ),
          );
        },
      });

      await _client(server).downloadsApi.prepareDownload(movie);

      final reads = server.requests
          .where((r) => r.uri.path == '/api/v2/downloads' && r.method == 'GET')
          .toList();
      expect(reads, hasLength(2));
      expect(reads[1].uri.queryParameters['cursor'], 'c2');
      expect((creation(server).data as Map)['expected_download_id'], 'dl_b');
    });

    test(
      'downloads switched off are refused before anything is sent',
      () async {
        final server = silo(capability: _capability({'enabled': false}));

        await expectLater(
          _client(server).downloadsApi.prepareDownload(movie),
          throwsA(isA<ServerDownloadRefused>()),
        );
        expect(
          server.requests.where((r) => r.uri.path == '/api/v2/downloads'),
          isEmpty,
        );
      },
    );

    test('a title Silo has no file for is refused with its reason', () async {
      final server = silo(
        create: _json({
          'items': <Object>[],
          'skipped': [
            {'episode_id': '', 'reason': 'no_file'},
          ],
          'page': {'has_more': false},
        }, status: 202),
      );

      await expectLater(
        _client(server).downloadsApi.prepareDownload(movie),
        throwsA(
          isA<ServerDownloadRefused>()
              .having((e) => e.reason, 'reason', 'no_file')
              .having((e) => e.message, 'message', contains('no file')),
        ),
      );
    });

    test("a refused policy carries Silo's words", () async {
      final server = silo(
        create: (_) => FixtureServer.problem(
          403,
          'permission_denied',
          'This original is above your download quality limit.',
        ),
      );

      await expectLater(
        _client(server).downloadsApi.prepareDownload(movie),
        throwsA(
          isA<ServerDownloadRefused>()
              .having((e) => e.reason, 'reason', 'permission_denied')
              .having((e) => e.message, 'message', contains('quality limit')),
        ),
      );
    });

    test('a file Silo is still preparing is waited for', () async {
      final server = silo(
        entries: [
          entry({'status': 'ready', 'delivery_format': 'remux'}),
        ],
        create: _json(
          created({'status': 'preparing', 'delivery_format': 'remux'}),
          status: 202,
        ),
      );

      final ticket =
          await (_client(server).downloadsApi
                ..preparationPollInterval = Duration.zero)
              .prepareDownload(movie);

      expect(ticket.container, 'mp4');
    });

    test(
      'an earlier, completed download of the item is served again',
      () async {
        final server = silo(
          entries: [
            entry({'revision': 2, 'status': 'completed'}),
          ],
          create: _json(
            created({'revision': 2, 'status': 'completed'}),
            status: 202,
          ),
        );

        final ticket = await _client(
          server,
        ).downloadsApi.prepareDownload(movie);

        expect(ticket.id, 'dl_01HSCRUBBED');
        expect(ticket.revision, 2);
      },
    );

    test('a server error reaches the caller and is sent once', () async {
      final server = silo(
        create: (_) => FixtureServer.problem(503, 'unavailable', 'Try again.'),
      );

      await expectLater(
        _client(server).downloadsApi.prepareDownload(movie),
        throwsA(isA<DioException>()),
      );
      expect(
        server.requests.where(
          (r) => r.uri.path == '/api/v2/downloads' && r.method == 'POST',
        ),
        hasLength(1),
      );
    });
  });

  group('after the transfer', () {
    test('a finished file is reported completed for its revision', () async {
      final server = FixtureServer({
        '/api/v2/downloads/dl_1': (o) => FixtureServer.json(
          200,
          jsonEncode(
            (_fixture('download_created.json')['items'] as List).first,
          ),
        ),
      });

      await _client(server).downloadsApi.downloadFinished(
        ServerDownloadTicket(
          id: 'dl_1',
          itemId: 'movie-1',
          url: Uri.parse('https://silo.example/api/v2/downloads/dl_1/file'),
          headers: () => const {},
          revision: 2,
        ),
      );

      final patch = server.requests.single;
      expect(patch.method, 'PATCH');
      expect(patch.data, {
        'status': 'completed',
        'updated_at': '2026-10-18T20:00:00.000Z',
        'revision': 2,
      });
      expect(siloSchemaErrors('DownloadStatusBody', patch.data), isEmpty);
    });

    test('a clock ahead of the server is retried on the server\'s clock '
        '(15.2 fix)', () async {
      final sent = <String>[];
      final server = FixtureServer({
        '/api/v2/downloads/dl_1': (o) {
          final at = (o.data as Map)['updated_at'] as String;
          sent.add(at);
          if (sent.length == 1) {
            return ResponseBody.fromString(
              jsonEncode({
                'type':
                    'https://siloserver.org/docs/api/v2/problems/malformed_request',
                'title': 'Bad Request',
                'status': 400,
                'detail': 'invalid download status event',
              }),
              400,
              headers: {
                Headers.contentTypeHeader: ['application/problem+json'],
                // The server's clock: 19:59:40, 20 s behind the device.
                'date': ['Sun, 18 Oct 2026 19:59:40 GMT'],
              },
            );
          }
          return FixtureServer.json(
            200,
            jsonEncode(
              (_fixture('download_created.json')['items'] as List).first,
            ),
          );
        },
      });

      await _client(server).downloadsApi.downloadFinished(
        ServerDownloadTicket(
          id: 'dl_1',
          itemId: 'movie-1',
          url: Uri.parse('https://silo.example/api/v2/downloads/dl_1/file'),
          headers: () => const {},
          revision: 1,
        ),
      );

      expect(sent, ['2026-10-18T20:00:00.000Z', '2026-10-18T19:59:39.000Z']);
    });

    test('another refusal of the report reaches the caller', () async {
      final server = FixtureServer({
        '/api/v2/downloads/dl_1': (_) =>
            FixtureServer.problem(409, 'conflict', 'Another revision.'),
      });

      await expectLater(
        _client(server).downloadsApi.downloadFinished(
          ServerDownloadTicket(
            id: 'dl_1',
            itemId: 'movie-1',
            url: Uri.parse('https://silo.example/api/v2/downloads/dl_1/file'),
            headers: () => const {},
            revision: 1,
          ),
        ),
        throwsA(isA<DioException>()),
      );
      expect(server.requests, hasLength(1));
    });

    test("deleted items remove the device's entries for them", () async {
      final deleted = <String>[];
      final server = FixtureServer({
        '/api/v2/downloads': _json({
          'items': [
            {
              ...(_fixture('download_created.json')['items'] as List).first
                  as Map<String, dynamic>,
              'id': 'dl_movie',
            },
            {
              ...(_fixture('download_created.json')['items'] as List).first
                  as Map<String, dynamic>,
              'id': 'dl_ep',
              'content_id': 'series-x',
              'episode_id': 'episode-x-1-1',
            },
            {
              ...(_fixture('download_created.json')['items'] as List).first
                  as Map<String, dynamic>,
              'id': 'dl_keep',
              'content_id': 'movie-other',
            },
          ],
          'page': {'has_more': false},
        }),
        '/api/v2/downloads/dl_movie': (o) {
          deleted.add('dl_movie');
          return ResponseBody.fromString('', 204);
        },
        '/api/v2/downloads/dl_ep': (o) {
          deleted.add('dl_ep');
          return FixtureServer.problem(404, 'not_found', 'Gone already.');
        },
      });

      await _client(server).downloadsApi.downloadsRemoved([
        'movie-imdb-tt0295701',
        'episode-x-1-1',
      ]);

      expect(deleted, ['dl_movie', 'dl_ep']);
      expect(
        server.requests
            .where((r) => r.method == 'DELETE')
            .map((r) => r.uri.path),
        ['/api/v2/downloads/dl_movie', '/api/v2/downloads/dl_ep'],
      );
    });

    test('a browser gets a short-lived link for the original', () async {
      final server = FixtureServer({
        '/api/v2/direct-download/links': _json({
          'url': '/api/v2/direct-download?dl=abc&file_id=4567',
          'proxy_url': '/api/v2/direct-download-proxy?dl=abc&file_id=4567',
          'expires_at': '2026-10-18T20:05:00.000Z',
        }),
      });

      final link = await _client(server).downloadsApi.browserDownloadUrl(
        const ServerDownloadRequest(itemId: 'movie-1', mediaSourceId: '4567'),
      );

      expect(
        link.toString(),
        'https://silo.example/api/v2/direct-download?dl=abc&file_id=4567',
      );
      expect(server.requests.single.data, {'file_id': '4567'});
      expect(
        siloSchemaErrors('DirectDownloadLinkBody', server.requests.single.data),
        isEmpty,
      );
    });

    test('no link without a file, or for a converted download', () async {
      final api = _client(FixtureServer({})).downloadsApi;

      expect(
        await api.browserDownloadUrl(
          const ServerDownloadRequest(itemId: 'movie-1'),
        ),
        isNull,
      );
      expect(
        await api.browserDownloadUrl(
          const ServerDownloadRequest(
            itemId: 'movie-1',
            mediaSourceId: '4567',
            maxVideoBitrate: 2000000,
          ),
        ),
        isNull,
      );
    });
  });

  group('converted downloads', () {
    test('Moonfin qualities map onto the presets the account may use', () {
      const all = ['original', '20mbps', '10mbps', '5mbps', '2mbps', '1mbps'];
      // 1080p (4 Mbit/s), 720p (2), 480p (1), 360p (0.5).
      expect(siloDownloadPreset(4000000, allowed: all), '5mbps');
      expect(siloDownloadPreset(2000000, allowed: all), '2mbps');
      expect(siloDownloadPreset(1000000, allowed: all), '1mbps');
      expect(siloDownloadPreset(500000, allowed: all), '1mbps');
      // Not allowed: the next lower one, never a higher one.
      expect(
        siloDownloadPreset(4000000, allowed: ['original', '10mbps', '2mbps']),
        '2mbps',
      );
      expect(
        siloDownloadPreset(2000000, allowed: ['original', '20mbps', '10mbps']),
        isNull,
      );
      expect(siloDownloadPreset(4000000, allowed: ['original']), isNull);
    });

    Map<String, dynamic> entry(Map<String, dynamic> changes) => {
      ...(_fixture('download_created.json')['items'] as List).first
          as Map<String, dynamic>,
      ...changes,
    };

    const capabilityAll = {
      'transcode_enabled': true,
      'quality_presets': [
        'original',
        '20mbps',
        '10mbps',
        '5mbps',
        '2mbps',
        '1mbps',
      ],
    };

    const hd = ServerDownloadRequest(
      itemId: 'movie-imdb-tt0295701',
      mediaSourceId: '4567',
      maxVideoBitrate: 4000000,
      maxWidth: 1920,
    );

    /// A Silo that answers the create with [created] and then lists the
    /// entry as each of [listed] in turn (the last one repeats).
    FixtureServer preparing(
      Map<String, dynamic> created,
      List<Map<String, dynamic>> listed, {
      Map<String, dynamic> capability = capabilityAll,
      List<String>? paths,
    }) {
      var lists = 0;
      return FixtureServer({
        '/api/v2/capabilities/downloads': _json(_capability(capability)),
        '/api/v2/downloads': (o) {
          paths?.add('${o.method} ${o.uri.path}');
          if (o.method == 'POST') {
            return FixtureServer.json(
              202,
              jsonEncode({
                'items': [created],
                'skipped': <Object>[],
                'page': {'has_more': false},
              }),
            );
          }
          // The first list is the scan before creating: nothing yet.
          final page = lists == 0
              ? <Map<String, dynamic>>[]
              : [listed[(lists - 1).clamp(0, listed.length - 1)]];
          lists++;
          return FixtureServer.json(
            200,
            jsonEncode({
              'items': page,
              'page': {'has_more': false},
            }),
          );
        },
        '/api/v2/downloads/dl_01HSCRUBBED/prepare': (o) {
          paths?.add('${o.method} ${o.uri.path}');
          return FixtureServer.json(
            200,
            jsonEncode(entry({'status': 'preparing', 'revision': 1})),
          );
        },
      });
    }

    SiloDownloadsApi api(FixtureServer server) =>
        _client(server).downloadsApi..preparationPollInterval = Duration.zero;

    test('converts only where an allowed preset fits', () async {
      Future<List<bool>> converts(Map<String, dynamic> capability) async {
        final downloads = api(
          FixtureServer({
            '/api/v2/capabilities/downloads': _json(_capability(capability)),
          }),
        );
        return [
          for (final bitrate in [4000000, 2000000, 500000])
            await downloads.convertsDownloadsAt(bitrate),
        ];
      }

      expect(await converts(capabilityAll), [true, true, true]);
      expect(
        await converts({
          'transcode_enabled': true,
          'quality_presets': ['original', '20mbps', '10mbps'],
        }),
        [false, false, false],
      );
      expect(
        await converts({
          'transcode_enabled': false,
          'quality_presets': ['original'],
        }),
        [false, false, false],
      );
    });

    test('waits while Silo makes the file, reporting its progress', () async {
      final converted = {
        'quality': '5mbps',
        'effective_quality': '5mbps',
        'delivery_format': 'transcode',
        'target_bitrate_kbps': 5000,
      };
      final server = preparing(entry({...converted, 'status': 'preparing'}), [
        entry({
          ...converted,
          'status': 'preparing',
          'preparation': {'state': 'queued', 'queue_position': 2},
        }),
        entry({
          ...converted,
          'status': 'preparing',
          'preparation': {
            'state': 'running',
            'progress': 0.4,
            'remaining_seconds': 90,
          },
        }),
        entry({...converted, 'status': 'ready', 'file_size': 900}),
      ]);
      final seen = <ServerDownloadPreparation>[];

      final ticket = await api(
        server,
      ).prepareDownload(hd, onPreparing: seen.add);

      final create = server.requests.firstWhere((r) => r.method == 'POST');
      expect((create.data as Map)['quality'], '5mbps');
      expect(siloSchemaErrors('DownloadCreateBody', create.data), isEmpty);
      expect(seen.map((p) => p.queuePosition), [null, 2, null]);
      expect(seen.last.progress, 0.4);
      expect(seen.last.remainingSeconds, 90);
      expect(ticket.sizeBytes, 900);
      expect(ticket.container, 'mp4');
    });

    test('a failed preparation is refused', () async {
      final server = preparing(entry({'status': 'preparing'}), [
        entry({'status': 'failed'}),
      ]);

      await expectLater(
        api(server).prepareDownload(hd),
        throwsA(
          isA<ServerDownloadRefused>().having((e) => e.reason, 'r', 'failed'),
        ),
      );
    });

    test('an entry that disappears while preparing is refused', () async {
      var lists = 0;
      final server = FixtureServer({
        '/api/v2/capabilities/downloads': _json(_capability(capabilityAll)),
        '/api/v2/downloads': (o) {
          if (o.method == 'POST') {
            return FixtureServer.json(
              202,
              jsonEncode({
                'items': [
                  entry({'status': 'preparing'}),
                ],
                'skipped': <Object>[],
                'page': {'has_more': false},
              }),
            );
          }
          lists++;
          return FixtureServer.json(
            200,
            jsonEncode({
              'items': <Object>[],
              'page': {'has_more': false},
            }),
          );
        },
      });

      await expectLater(
        api(server).prepareDownload(hd),
        throwsA(
          isA<ServerDownloadRefused>().having(
            (e) => e.reason,
            'r',
            'not_found',
          ),
        ),
      );
      expect(lists, 2);
    });

    test('a cancelled download stops waiting', () async {
      final server = preparing(entry({'status': 'preparing'}), [
        entry({'status': 'preparing'}),
      ]);

      await expectLater(
        api(server).prepareDownload(hd, isCancelled: () => true),
        throwsA(isA<ServerDownloadCancelled>()),
      );
    });

    test(
      'a quality the account may not use is refused before creating',
      () async {
        final server = preparing(entry({}), [], capability: const {});

        await expectLater(
          api(server).prepareDownload(hd),
          throwsA(
            isA<ServerDownloadRefused>().having(
              (e) => e.reason,
              'r',
              'quality_unavailable',
            ),
          ),
        );
        expect(server.requests.where((r) => r.method == 'POST'), isEmpty);
      },
    );

    test('a converted file Silo cleaned up is prepared again', () async {
      final paths = <String>[];
      final converted = {'delivery_format': 'transcode', 'quality': '5mbps'};
      final server = preparing(entry({...converted, 'status': 'completed'}), [
        entry({...converted, 'status': 'ready'}),
      ], paths: paths);

      final ticket = await api(server).prepareDownload(hd);

      expect(paths, [
        'GET /api/v2/downloads',
        'POST /api/v2/downloads',
        'POST /api/v2/downloads/dl_01HSCRUBBED/prepare',
        'GET /api/v2/downloads',
      ]);
      expect(ticket.id, 'dl_01HSCRUBBED');
    });
  });

  group('artwork', () {
    final ticket = ServerDownloadTicket(
      id: 'dl_01HSCRUBBED',
      itemId: 'episode-imdb-tt1641384-1-1',
      url: Uri.parse(_fileUrl),
      headers: () => const {},
      revision: 1,
    );

    test('the episode manifest fixture fits the contract', () {
      expect(
        siloSchemaErrors(
          'DownloadManifest',
          _fixture('download_manifest_episode.json'),
        ),
        isEmpty,
      );
    });

    test("the manifest's artwork links, made absolute, read once", () async {
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': _json(
          _fixture('download_manifest_episode.json'),
        ),
      });
      final api = _client(server).downloadsApi;

      final artwork = await api.downloadArtwork(ticket);
      await api.downloadArtwork(ticket);

      const base = 'https://silo.example/api/v2/downloads/dl_01HSCRUBBED';
      expect(artwork, {
        ServerDownloadArtworkKind.poster: Uri.parse('$base/artwork/poster'),
        ServerDownloadArtworkKind.backdrop: Uri.parse('$base/artwork/backdrop'),
        ServerDownloadArtworkKind.logo: Uri.parse('$base/artwork/logo'),
        ServerDownloadArtworkKind.seriesPoster: Uri.parse(
          '$base/artwork/series_poster',
        ),
      });
      final read = server.requests.single;
      expect(read.headers['X-Silo-Device-Id'], isNotEmpty);
      expect(read.headers['X-Profile-Id'], _mainId);
    });

    test('kinds the item has no artwork for are left out', () async {
      final manifest = _fixture('download_manifest_episode.json')
        ..['artwork_urls'] = {
          'poster': '/api/v2/downloads/dl_01HSCRUBBED/artwork/poster',
        };
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': _json(manifest),
      });

      final artwork = await _client(
        server,
      ).downloadsApi.downloadArtwork(ticket);

      expect(artwork.keys, [ServerDownloadArtworkKind.poster]);
    });

    test('links off the server are left out', () async {
      final manifest = _fixture('download_manifest_episode.json')
        ..['artwork_urls'] = {
          'poster': 'https://elsewhere.example/poster',
          'backdrop': '@elsewhere.example/backdrop',
          'logo': '/api/v2/downloads/dl_01HSCRUBBED/artwork/logo',
        };
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': _json(manifest),
      });

      final artwork = await _client(
        server,
      ).downloadsApi.downloadArtwork(ticket);

      expect(artwork.keys, [ServerDownloadArtworkKind.logo]);
    });

    test('a manifest that failed is read again next time', () async {
      var fail = true;
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': (o) => fail
            ? FixtureServer.problem(503, 'unavailable', 'Try again.')
            : FixtureServer.json(
                200,
                jsonEncode(_fixture('download_manifest_episode.json')),
              ),
      });
      final api = _client(server).downloadsApi;

      await expectLater(api.downloadArtwork(ticket), throwsA(anything));
      fail = false;
      expect(await api.downloadArtwork(ticket), hasLength(4));
    });
  });

  group('subtitles', () {
    // A version with two embedded ASS tracks and one sidecar, as Silo lists
    // them: embedded first, sidecars after, marked external.
    final version = {
      'file_id': 4567,
      'container': 'mkv',
      'video_tracks': [
        {'codec': 'h264', 'width': 1920, 'height': 1080},
      ],
      'audio_tracks': [
        {'codec': 'aac', 'language': 'en', 'channels': 2},
      ],
      'subtitle_tracks': [
        {'index': 2, 'codec': 'ass', 'language': 'en', 'external': false},
        {'index': 3, 'codec': 'ass', 'language': 'es', 'external': false},
        {'index': 4, 'codec': 'srt', 'language': 'en', 'external': true},
      ],
    };
    final mediaSource = siloVersionToMediaSource(
      version,
      itemId: 'episode-imdb-tt1641384-1-1',
    )!;

    final ticket = ServerDownloadTicket(
      id: 'dl_01HSCRUBBED',
      itemId: 'episode-imdb-tt1641384-1-1',
      url: Uri.parse(_fileUrl),
      headers: () => const {},
      mediaSourceId: '4567',
    );

    Map<String, dynamic> manifest({
      String delivery = 'original',
    }) => _fixture('download_manifest_episode.json')
      ..['delivery_format'] = delivery
      ..['subtitles'] = [
        {
          'language': 'en',
          'format': 'srt',
          'forced': false,
          'hearing_impaired': false,
          'external': true,
          'fetch_url': '/api/v2/downloads/dl_01HSCRUBBED/subtitles/external:0',
        },
        {
          'language': 'es',
          'format': 'ass',
          'forced': false,
          'hearing_impaired': false,
          'external': false,
          'fetch_url': '/api/v2/downloads/dl_01HSCRUBBED/subtitles/embedded:1',
        },
        {
          'language': 'fr',
          'format': 'srt',
          'forced': false,
          'hearing_impaired': false,
          'external': false,
          'fetch_url':
              '/api/v2/downloads/dl_01HSCRUBBED/subtitles/downloaded:77',
        },
      ];

    Future<List<ServerDownloadSubtitle>> subtitles(
      Map<String, dynamic> manifest,
    ) {
      expect(siloSchemaErrors('DownloadManifest', manifest), isEmpty);
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': _json(manifest),
      });
      return _client(
        server,
      ).downloadsApi.downloadSubtitles(ticket, mediaSource: mediaSource);
    }

    int streamOf(int ordinal) =>
        siloStreamIndexForTrack(mediaSource, SiloTrackKind.subtitle, ordinal)!;

    test('an original gets its sidecars, named by their stream', () async {
      final result = await subtitles(manifest());

      expect(result, hasLength(2));
      final sidecar = result.first;
      expect(
        sidecar.url.toString(),
        'https://silo.example/api/v2/downloads/dl_01HSCRUBBED/subtitles/external:0',
      );
      // The sidecar is the version's third subtitle track.
      expect(sidecar.streamIndex, streamOf(2));
      expect(sidecar.streamIndex, 4);
      expect(sidecar.format, 'srt');
      expect(sidecar.stream, isNull);
    });

    test('a downloaded subtitle gets a stream after the file\'s own', () async {
      final downloaded = (await subtitles(manifest())).last;

      expect(
        downloaded.url.toString(),
        'https://silo.example/api/v2/downloads/dl_01HSCRUBBED/subtitles/downloaded:77',
      );
      expect(downloaded.streamIndex, siloNextStreamIndex(mediaSource));
      expect(downloaded.streamIndex, 5);
      expect(downloaded.format, 'srt');
      expect(downloaded.stream, {
        'Type': 'Subtitle',
        'Index': 5,
        'Codec': 'srt',
        'Language': 'fr',
        'DisplayTitle': 'French',
        'IsForced': false,
        'IsHearingImpaired': false,
        'IsDefault': false,
        'IsExternal': true,
        'IsTextSubtitleStream': true,
        'SupportsExternalStream': true,
      });
    });

    test(
      'a converted file also gets its ASS and PGS tracks as sidecars',
      () async {
        final result = await subtitles(manifest(delivery: 'transcode'));

        expect(result.map((s) => (s.streamIndex, s.format)), [
          (4, 'srt'),
          (streamOf(1), 'ass'),
          (5, 'srt'),
        ]);
        expect(streamOf(1), 3);
      },
    );

    test("a reference the version doesn't have is left out", () async {
      final m = manifest(delivery: 'transcode')
        ..['subtitles'] = [
          {
            'language': 'en',
            'format': 'srt',
            'forced': false,
            'hearing_impaired': false,
            'external': true,
            'fetch_url':
                '/api/v2/downloads/dl_01HSCRUBBED/subtitles/external:5',
          },
          {
            'language': 'en',
            'format': 'ass',
            'forced': false,
            'hearing_impaired': false,
            'external': false,
            // The sidecar's place: not an embedded track.
            'fetch_url':
                '/api/v2/downloads/dl_01HSCRUBBED/subtitles/embedded:2',
          },
        ];

      expect(await subtitles(m), isEmpty);
    });

    test("a format that isn't a plain extension is left out", () async {
      final m = manifest()
        ..['subtitles'] = [
          {
            'format': 'srt/../../evil',
            'fetch_url':
                '/api/v2/downloads/dl_01HSCRUBBED/subtitles/external:0',
          },
        ];
      final server = FixtureServer({
        '/api/v2/downloads/dl_01HSCRUBBED/manifest': _json(m),
      });

      final result = await _client(
        server,
      ).downloadsApi.downloadSubtitles(ticket, mediaSource: mediaSource);

      expect(result, isEmpty);
    });
  });
}
