import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_game.dart';
import 'package:moonfin/ui/screens/after_hours/after_hours_scores.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:shared_preferences/shared_preferences.dart';

ArcadeScore _s(String name, int score, [int minute = 0]) =>
    ArcadeScore(name, score, DateTime.utc(2026, 11, 7, 12, minute));

/// A Moonbase with the scores route, one row per user, top 3 back.
class _Moonbase implements HttpClientAdapter {
  _Moonbase({this.status = 200});

  int status;
  final Map<String, Map<String, int>> best = {};
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final match = RegExp(r'^/Moonfin/MiniGames/([a-z-]+)/Scores$')
        .firstMatch(options.uri.path);
    if (status != 200 || match == null) {
      return ResponseBody.fromString('', status == 200 ? 404 : status);
    }
    final board = best.putIfAbsent(match.group(1)!, () => {});
    Object body;
    if (options.method == 'POST') {
      final score = (options.data as Map)['score'] as int;
      if (score > (board['moonfin'] ?? -1)) board['moonfin'] = score;
      final sorted = board.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      final i = sorted.indexWhere((e) => e.key == 'moonfin');
      body = {'rank': i < 3 && board['moonfin'] == score ? i + 1 : null};
    } else {
      final sorted = board.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      body = [
        for (final e in sorted.take(3))
          {'userName': e.key, 'score': e.value, 'at': '2026-11-06T21:04:00Z'},
      ];
    }
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

void main() {
  group('placeOnBoard', () {
    test('keeps three rows, best first, ties to the earlier run', () {
      var board = <ArcadeScore>[];
      board = placeOnBoard(board, _s('a', 100, 1)).board;
      board = placeOnBoard(board, _s('b', 300, 2)).board;
      board = placeOnBoard(board, _s('c', 200, 3)).board;
      final tie = placeOnBoard(board, _s('d', 200, 4));
      expect(tie.rank, 3);
      expect(tie.board.map((s) => s.userName), ['b', 'c', 'd']);
      final early = placeOnBoard(tie.board, _s('e', 200, 0));
      expect(early.rank, 2);
      expect(early.board.map((s) => s.userName), ['b', 'e', 'c']);
    });

    test('holds one row per person, their best', () {
      var placed = placeOnBoard(const [], _s('Jamie', 500));
      placed = placeOnBoard(placed.board, _s('jamie', 300));
      expect(placed.rank, isNull);
      expect(placed.board.single.score, 500);
      placed = placeOnBoard(placed.board, _s('jamie', 900));
      expect(placed.rank, 1);
      expect(placed.board.single.score, 900);
    });

    test('a run off the board has no rank', () {
      final board = [_s('a', 30), _s('b', 20), _s('c', 10)];
      final placed = placeOnBoard(board, _s('d', 5));
      expect(placed.rank, isNull);
      expect(placed.board, board);
    });
  });

  group('AfterHoursScores', () {
    late PreferenceStore store;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      store = PreferenceStore();
      await store.init();
    });

    JellyfinMediaServerClient client() => JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    )..accessToken = 'token';

    test('without a server it keeps a device top 3 that survives', () async {
      final scores = AfterHoursScores(store, null, viewerName: 'jamie');
      await scores.load();
      expect(scores.fromServer, isFalse);
      expect(await scores.submit(ArcadeGameId.caseStack, 412), 1);
      expect(await scores.submit(ArcadeGameId.caseStack, 100), isNull);

      final again = AfterHoursScores(store, null, viewerName: 'jamie');
      expect(again.boards[ArcadeGameId.caseStack]!.single.score, 412);
      expect(again.boards[ArcadeGameId.bufferRun], isEmpty);
    });

    test(
      'reads and posts to the plugin, and still keeps the device board',
      () async {
        final server = _Moonbase();
        server.best['buffer-run'] = {'moviebuff': 18420, 'nightowl': 12305};
        final scores = AfterHoursScores(
          store,
          client(),
          viewerName: 'moonfin',
          serverName: 'Living Room',
          dio: Dio()..httpClientAdapter = server,
        );
        await scores.load();
        expect(scores.fromServer, isTrue);
        expect(
          scores.boards[ArcadeGameId.bufferRun]!.first.userName,
          'moviebuff',
        );

        expect(await scores.submit(ArcadeGameId.bufferRun, 15960), 2);
        expect(scores.boards[ArcadeGameId.bufferRun]!.map((s) => s.userName), [
          'moviebuff',
          'moonfin',
          'nightowl',
        ]);
        final post = server.requests.firstWhere((r) => r.method == 'POST');
        expect(
          post.uri.toString(),
          'https://jf.example/Moonfin/MiniGames/buffer-run/Scores',
        );
        expect(post.headers['Authorization'], contains('Token="token"'));
        expect(post.data, {'score': 15960});

        final device = AfterHoursScores(store, null, viewerName: 'moonfin');
        expect(device.boards[ArcadeGameId.bufferRun]!.single.score, 15960);
      },
    );

    test('a missing plugin falls back to the device', () async {
      final scores = AfterHoursScores(
        store,
        client(),
        viewerName: 'moonfin',
        dio: Dio()..httpClientAdapter = _Moonbase(status: 404),
      );
      await scores.load();
      expect(scores.fromServer, isFalse);
      expect(await scores.submit(ArcadeGameId.pixelPurge, 3480), 1);
      expect(scores.fromServer, isFalse);
      expect(scores.boards[ArcadeGameId.pixelPurge]!.single.score, 3480);
    });

    test('a load that lands after dispose is dropped', () async {
      final scores = AfterHoursScores(store, null, viewerName: 'jamie');
      final loading = scores.load();
      scores.dispose();
      await loading;
    });

    test('caps a score at what the server accepts', () async {
      final server = _Moonbase();
      final scores = AfterHoursScores(
        store,
        client(),
        viewerName: 'moonfin',
        dio: Dio()..httpClientAdapter = server,
      );
      await scores.submit(ArcadeGameId.cableCrawl, 123456789);
      final post = server.requests.firstWhere((r) => r.method == 'POST');
      expect(post.data, {'score': AfterHoursScores.maxScore});
    });
  });
}
