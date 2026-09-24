import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:moonfin/util/artwork_timing.dart';
import 'package:moonfin/util/image_file_service.dart';
import 'package:server_core/server_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    ServerLog.sink = null;
    ArtworkTimings.flushNow();
  });

  group('with diagnostic logging off', () {
    test('begin allocates nothing', () {
      ServerLog.sink = null;
      expect(ArtworkTimings.begin('http://h/Items/1/Images/Primary'), isNull);
      expect(ArtworkTimings.enabled, isFalse);
    });

    test('finish and index counters are no-ops', () {
      ServerLog.sink = null;
      ArtworkTimings.finish(null);
      ArtworkTimings.indexHit();
      ArtworkTimings.indexOpened(entries: 3, took: Duration.zero);
      ArtworkTimings.flushNow();
    });
  });

  group('loggableArtworkUrl', () {
    test('keeps the path and the requested size only', () {
      expect(
        loggableArtworkUrl(
          'https://my.server:8096/Items/abc/Images/Primary'
          '?maxWidth=420&quality=90&tag=deadbeef&api_key=secret',
        ),
        '/Items/abc/Images/Primary?maxWidth=420',
      );
    });

    test('keeps only the file name of a local path', () {
      expect(
        loggableArtworkUrl('/data/user/0/app/files/offline/x/poster.jpg'),
        'poster.jpg',
      );
    });
  });

  group('prepareReport', () {
    test('replays how the index came up when the sink appeared later', () {
      // At launch the index opens before LogService installs the sink, so
      // the live line is dropped and a report has to carry it instead.
      ServerLog.sink = null;
      ArtworkTimings.indexOpened(
        entries: 42,
        took: const Duration(milliseconds: 7),
      );

      final lines = <String>[];
      ServerLog.sink = (category, level, message, {error}) {
        if (category == 'artwork') lines.add(message);
      };
      ArtworkTimings.prepareReport();
      expect(lines, [
        'art in flight: 0',
        'art index at launch: opened n=42 in 7ms',
      ]);
    });

    test('a fallback is replayed as a warning with its reason', () {
      ServerLog.sink = null;
      ArtworkTimings.indexOpenFellBack(
        reason: 'timeout',
        took: const Duration(seconds: 2),
      );
      final levels = <ServerLogLevel>[];
      final lines = <String>[];
      ServerLog.sink = (category, level, message, {error}) {
        levels.add(level);
        lines.add(message);
      };
      ArtworkTimings.prepareReport();
      expect(
        lines.last,
        'art index at launch: open fell back: timeout after 2000ms',
      );
      expect(levels.last, ServerLogLevel.warning);
    });
  });

  group('with diagnostic logging on', () {
    late HttpServer server;
    late List<String> lines;

    setUp(() async {
      HttpOverrides.global = null;
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      lines = <String>[];
      ServerLog.sink = (category, level, message, {error}) {
        if (category == 'artwork') lines.add(message);
      };
    });

    tearDown(() => server.close(force: true));

    test('a fetch produces one aggregate line with its phases', () async {
      server.listen((request) {
        request.response.headers.contentType = ContentType('image', 'jpeg');
        request.response.add(List<int>.filled(2048, 0x41));
        request.response.close();
      });
      final service = BoundedImageFileService(http.Client());
      final response = await service.get(
        'http://127.0.0.1:${server.port}/Items/1/Images/Primary?maxWidth=280',
      );
      await response.content.drain<void>();

      ArtworkTimings.flushNow();
      expect(lines, hasLength(1));
      final line = lines.single;
      expect(line, startsWith('art 5s n=1 '));
      expect(line, contains('KB=2/2'));
      expect(line, contains('fail=0'));
      expect(line, contains('hits=0'));
    });

    test('a failed fetch is counted as a failure', () async {
      server.listen((request) {
        request.response.statusCode = HttpStatus.notFound;
        request.response.close();
      });
      final service = BoundedImageFileService(http.Client());
      final response = await service.get(
        'http://127.0.0.1:${server.port}/Items/2/Images/Primary',
      );
      // The cache manager treats a 404 as an error after reading headers, so
      // the record closes when the body stream ends.
      await response.content.drain<void>();
      ArtworkTimings.indexHit();
      ArtworkTimings.flushNow();
      expect(lines.single, contains('n=1 '));
      expect(lines.single, contains('hits=1'));
    });

    test('a timeout closes the record with an error', () async {
      server.listen((request) {
        // Never answer.
      });
      final service = BoundedImageFileService(
        http.Client(),
        headerTimeout: const Duration(milliseconds: 100),
      );
      await expectLater(
        service.get('http://127.0.0.1:${server.port}/Items/3/Images/Primary'),
        throwsA(isA<TimeoutException>()),
      );
      ArtworkTimings.flushNow();
      expect(lines.single, contains('fail=1'));
    });
  });
}
