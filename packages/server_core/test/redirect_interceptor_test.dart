import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('isSameOriginRedirect', () {
    bool same(String from, String to) =>
        isSameOriginRedirect(Uri.parse(from), Uri.parse(to));

    test('same host, scheme and port', () {
      expect(same('https://silo.example/a', 'https://silo.example/b'), isTrue);
      expect(
        same('https://silo.example/a', 'https://SILO.example:443/b'),
        isTrue,
      );
      expect(same('http://host:8090/a', 'http://host:8090/b'), isTrue);
    });

    test('another host or port', () {
      expect(same('https://silo.example/a', 'https://evil.example/a'), isFalse);
      expect(
        same('https://silo.example/a', 'https://cdn.silo.example/a'),
        isFalse,
      );
      expect(same('http://host:8090/a', 'http://host:8091/a'), isFalse);
    });

    test('http to https on the same host, to 443 or the same port', () {
      expect(same('http://silo.example/a', 'https://silo.example/a'), isTrue);
      expect(same('http://host:8090/a', 'https://host/a'), isTrue);
      expect(same('http://host:8090/a', 'https://host:8090/a'), isTrue);
      expect(same('http://host:8090/a', 'https://host:9443/a'), isFalse);
    });

    test('never a downgrade or another scheme', () {
      expect(same('https://silo.example/a', 'http://silo.example/a'), isFalse);
      expect(same('https://silo.example/a', 'ftp://silo.example/a'), isFalse);
    });
  });

  group('redirectInterceptor', () {
    late List<Uri> requested;

    Dio dioFor(String redirectTo, {required bool sameOriginOnly}) {
      requested = [];
      final dio = Dio(
        BaseOptions(baseUrl: 'https://silo.example', followRedirects: false),
      );
      dio.httpClientAdapter = _Adapter((options) {
        requested.add(options.uri);
        if (options.uri.path == '/start') {
          return ResponseBody.fromString(
            '',
            307,
            headers: {
              'location': [redirectTo],
            },
          );
        }
        return ResponseBody.fromString(
          '{"ok":true}',
          200,
          headers: {
            Headers.contentTypeHeader: ['application/json'],
          },
        );
      });
      dio.interceptors.add(
        redirectInterceptor(dio, sameOriginOnly: sameOriginOnly),
      );
      return dio;
    }

    Future<Object> send(Dio dio) async {
      try {
        return (await dio.post<dynamic>(
          '/start',
          data: {'password': 'secret'},
          options: Options(headers: {'Authorization': 'Bearer tok'}),
        )).statusCode!;
      } on DioException catch (e) {
        return e.response?.statusCode ?? e.type;
      }
    }

    test(
      'same-origin redirects are followed with the request intact',
      () async {
        final dio = dioFor('/elsewhere', sameOriginOnly: true);
        expect(await send(dio), 200);
        expect(requested.map((u) => u.toString()), [
          'https://silo.example/start',
          'https://silo.example/elsewhere',
        ]);
      },
    );

    test('cross-origin redirects are not followed when restricted', () async {
      final dio = dioFor('https://evil.example/steal', sameOriginOnly: true);
      expect(await send(dio), 307);
      expect(requested, hasLength(1));
    });

    test('unrestricted, the old behavior follows anywhere', () async {
      final dio = dioFor('https://other.example/next', sameOriginOnly: false);
      expect(await send(dio), 200);
      expect(requested.last.host, 'other.example');
    });
  });
}

class _Adapter implements HttpClientAdapter {
  _Adapter(this.respond);
  final ResponseBody Function(RequestOptions) respond;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => respond(options);

  @override
  void close({bool force = false}) {}
}
