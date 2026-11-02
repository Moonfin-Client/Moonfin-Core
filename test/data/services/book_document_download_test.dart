import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:moonfin/data/services/book_document_service.dart';

// Issue #1969: the web build downloads books through package:http, since
// dart:io's HttpClient throws in a browser.
void main() {
  final missing = Uri.parse('http://server/Items/a/Download');
  final book = Uri.parse('http://server/Items/b/Download');
  const auth = {'Authorization': 'MediaBrowser Token="t"'};

  test('a download skips a source that fails and sends the auth', () async {
    final seen = <http.BaseRequest>[];
    final client = MockClient((request) async {
      seen.add(request);
      return request.url == book
          ? http.Response.bytes([1, 2, 3], 200)
          : http.Response('', 404);
    });

    final bytes = await BookDocumentService.downloadBytesOverHttp(client, [
      missing,
      book,
    ], auth);

    expect(bytes, [1, 2, 3]);
    expect(seen.map((r) => r.url), [missing, book]);
    expect(seen.last.headers['Authorization'], auth['Authorization']);
    expect(seen.last.headers.containsKey('User-Agent'), isFalse);
  });

  test('a download with no working source says why', () async {
    final client = MockClient((_) async => http.Response('', 403));

    await expectLater(
      BookDocumentService.downloadBytesOverHttp(client, [book], auth),
      throwsA(
        isA<http.ClientException>().having(
          (e) => e.message,
          'message',
          contains('HTTP 403'),
        ),
      ),
    );
  });

  test('a probe asks for one byte and reads the file name', () async {
    late http.BaseRequest seen;
    final client = MockClient((request) async {
      seen = request;
      return http.Response(
        '',
        206,
        headers: {
          'content-disposition': 'attachment; filename="Issue 1.cbz"',
          'content-type': 'application/octet-stream',
        },
      );
    });

    final extension = await BookDocumentService.probeExtensionOverHttp(
      client,
      [book],
      auth,
    );

    expect(extension, 'cbz');
    expect(seen.headers['Range'], 'bytes=0-0');
    expect(seen.headers['Authorization'], auth['Authorization']);
  });

  test('a probe falls back to the content type', () async {
    final client = MockClient(
      (_) async => http.Response(
        '',
        200,
        headers: {'content-type': 'application/pdf; charset=binary'},
      ),
    );

    expect(
      await BookDocumentService.probeExtensionOverHttp(client, [book], auth),
      'pdf',
    );
  });

  test(
    'the browser downloads without dart:io',
    () async {
      final bytes = await BookDocumentService.downloadBytes([
        Uri.parse(
          'data:application/octet-stream;base64,${base64Encode([4, 5, 6])}',
        ),
      ], const {});

      expect(bytes, [4, 5, 6]);
    },
    testOn: 'browser',
  );

  group('native', () {
    late HttpServer server;
    final authSeen = <String?>[];

    setUp(() async {
      authSeen.clear();
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((request) {
        authSeen.add(request.headers.value('Authorization'));
        final response = request.response;
        switch (request.uri.path) {
          case '/named':
            response.headers.set(
              'content-disposition',
              'attachment; filename="Issue 1.cbz"',
            );
            response.headers.contentType = ContentType('application', 'pdf');
            response.add([7, 8, 9]);
          case '/typed.epub':
            response.headers.contentType = ContentType('application', 'pdf');
          case '/book.epub':
            response.headers.contentType = ContentType.binary;
          default:
            response.statusCode = 404;
        }
        response.close();
      });
    });

    tearDown(() => server.close(force: true));

    Uri at(String path) => Uri.parse('http://127.0.0.1:${server.port}$path');

    test('a download still goes through HttpClient', () async {
      final bytes = await BookDocumentService.downloadBytes([
        at('/missing'),
        at('/named'),
      ], auth);

      expect(bytes, [7, 8, 9]);
      expect(authSeen, [auth['Authorization'], auth['Authorization']]);
    }, testOn: 'vm');

    test('a probe checks the file name, then the type, then the URL', () async {
      Future<String?> probe(String path) =>
          BookDocumentService.probeExtensionFromResponse([at(path)], auth);

      expect(await probe('/named'), 'cbz');
      expect(await probe('/typed.epub'), 'pdf');
      expect(await probe('/book.epub'), 'epub');
      expect(await probe('/missing'), isNull);
    }, testOn: 'vm');
  });
}
