import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

/// Returns a canned [ResponseBody] for each requested URI path.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.responder);

  final ResponseBody Function(Uri uri) responder;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async => responder(options.uri);

  @override
  void close({bool force = false}) {}
}

Dio _dioWith(ResponseBody Function(Uri uri) responder) {
  final dio = Dio(
    BaseOptions(
      // Mirror the native probe: 4xx/5xx throw, redirects are returned not followed.
      validateStatus: (status) => status != null && status < 400,
      followRedirects: false,
    ),
  );
  dio.httpClientAdapter = _FakeAdapter(responder);
  return dio;
}

ResponseBody _json(Map<String, dynamic> body) => ResponseBody.fromString(
  jsonEncode(body),
  200,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  },
);

ResponseBody _html(String body) => ResponseBody.fromString(
  body,
  200,
  headers: {
    Headers.contentTypeHeader: ['text/html; charset=utf-8'],
  },
);

ResponseBody _status(int code, {String? location}) => ResponseBody.fromString(
  '',
  code,
  headers: location == null
      ? null
      : {
          'location': [location],
        },
);

void main() {
  group('probeServerPublicInfo', () {
    test('finds Emby served only under /emby and keeps the prefix', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/emby/System/Info/Public') {
          return _json({'ProductName': 'Emby Server', 'Version': '4.9.3.30'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://host');

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.emby);
      expect(result.resolvedBaseUrl, 'https://host/emby');
    });

    test('finds a root server and keeps the bare base url', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server', 'Version': '10.10.0'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://host');

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.jellyfin);
      expect(result.resolvedBaseUrl, 'https://host');
    });

    test('follows a redirect and resolves the final base url', () async {
      final dio = _dioWith((uri) {
        if (uri.host == 'old.host') {
          return _status(301, location: 'https://new.host/System/Info/Public');
        }
        if (uri.host == 'new.host' && uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://old.host');

      expect(result, isNotNull);
      expect(result!.resolvedBaseUrl, 'https://new.host');
    });

    test('rethrows when neither path answers', () async {
      final dio = _dioWith((_) => _status(404));

      expect(
        () => probeServerPublicInfo(dio, 'https://host'),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('probeServerPublicInfo on Silo', () {
    // Silo 4b2e921c's public responses (fixtures in server_silo).
    const systemInfo = {
      'server_version': '4b2e921c+dirty',
      'api_major': 2,
      'contract_digest':
          '12ea11dd8223e9426ab5376aad1116c150a674b432989b3cb4e5dbc9458b960a',
    };

    ResponseBody silo(Uri uri, {String prefix = ''}) {
      final path = uri.path;
      if (path == '$prefix/api/v2/system/info') return _json(systemInfo);
      if (path == '$prefix/api/v2/system/identity') {
        return _json({'server_id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e'});
      }
      if (path == '$prefix/api/v2/theme/branding') {
        return _json({
          'server_name': 'Silo',
          'login_subtitle': 'Sign in with an existing account.',
          'storage_available': true,
        });
      }
      if (path == '$prefix/api/v2/system/setup') {
        return _json({'needs_setup': false, 'wizard_completed': true});
      }
      if (path == '$prefix/System/Info/Public') {
        // The native host answers Jellyfin paths with the web app's HTML.
        return _html('<!doctype html><html><title>Silo</title></html>');
      }
      return _status(404);
    }

    test('identifies Silo from the native system info', () async {
      final requested = <String>[];
      final dio = _dioWith((uri) {
        requested.add(uri.path);
        return silo(uri);
      });

      final result = await probeServerPublicInfo(dio, 'https://silo.host');

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'https://silo.host');
      expect(result.info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
      expect(result.info['ServerName'], 'Silo');
      expect(result.info['Version'], '4b2e921c+dirty');
      expect(result.info['ProductName'], 'Silo');
      expect(result.info['StartupWizardCompleted'], isTrue);
      expect(
        result.info['LoginDisclaimer'],
        'Sign in with an existing account.',
      );
      // Silo was found first, so the Jellyfin/Emby paths were never asked.
      expect(requested.first, '/api/v2/system/info');
      expect(requested, isNot(contains('/System/Info/Public')));
    });

    test('keeps a reverse-proxy path prefix', () async {
      final dio = _dioWith((uri) => silo(uri, prefix: '/silo'));

      final result = await probeServerPublicInfo(dio, 'https://host/silo/');

      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'https://host/silo');
      expect(result.info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
    });

    test('follows a redirect to the Silo host', () async {
      final dio = _dioWith((uri) {
        if (uri.host == 'old.host') {
          return _status(301, location: 'https://silo.host${uri.path}');
        }
        return silo(uri);
      });

      final result = await probeServerPublicInfo(dio, 'https://old.host');

      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'https://silo.host');
    });

    test('still identifies Silo when the cosmetic endpoints fail', () async {
      final dio = _dioWith(
        (uri) => uri.path == '/api/v2/system/info'
            ? _json(systemInfo)
            : _status(500),
      );

      final result = await probeServerPublicInfo(dio, 'https://silo.host');

      expect(result!.serverType, ServerType.silo);
      expect(result.info['Id'], isNull);
      expect(result.info['ServerName'], 'Silo');
    });

    test("Silo's Jellyfin-compatible port is still Jellyfin", () async {
      // Port 8096 has no /api/v2 and reports "Jellyfin Server".
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({
            'ProductName': 'Jellyfin Server',
            'Version': '10.10.7',
          });
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://silo.host:8096');

      expect(result!.serverType, ServerType.jellyfin);
    });

    test('an HTML page at /api/v2/system/info is not Silo', () async {
      // A Jellyfin or Emby web client behind a catch-all proxy rule.
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Emby Server', 'Version': '4.10.1.0'});
        }
        return _html('<!doctype html><html></html>');
      });

      final result = await probeServerPublicInfo(dio, 'https://emby.host');

      expect(result!.serverType, ServerType.emby);
    });

    test('JSON that is not Silo system info is not Silo', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/info') return _json({'status': 'ok'});
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(dio, 'https://host');

      expect(result!.serverType, ServerType.jellyfin);
    });

    test('an unreachable host fails once instead of once per path', () async {
      for (final type in [
        DioExceptionType.connectionError,
        DioExceptionType.connectionTimeout,
        DioExceptionType.badCertificate,
      ]) {
        var calls = 0;
        final dio = _dioWith((uri) {
          calls++;
          throw DioException(
            requestOptions: RequestOptions(path: uri.toString()),
            type: type,
          );
        });

        await expectLater(
          probeServerPublicInfo(dio, 'https://dead.host'),
          throwsA(isA<DioException>().having((e) => e.type, 'type', type)),
        );
        expect(calls, 1, reason: '$type');
      }
    });
  });

  group('looksLikeSiloJellyfinCompat', () {
    test('true when the branding disclaimer names Silo', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/Branding/Configuration') {
          return _json({
            'LoginDisclaimer':
                'Silo provides Jellyfin-compatible app support. Silo is not '
                'affiliated with or endorsed by the Jellyfin project.',
            'SplashscreenEnabled': false,
          });
        }
        return _status(404);
      });

      expect(await looksLikeSiloJellyfinCompat(dio, 'http://host:8096/'), isTrue);
    });

    test('false for a Jellyfin disclaimer, HTML or an error', () async {
      final jellyfin = _dioWith(
        (_) => _json({'LoginDisclaimer': 'Welcome!', 'CustomCss': ''}),
      );
      final html = _dioWith((_) => _html('<html>Silo</html>'));
      final missing = _dioWith((_) => _status(404));

      expect(await looksLikeSiloJellyfinCompat(jellyfin, 'http://h'), isFalse);
      expect(await looksLikeSiloJellyfinCompat(html, 'http://h'), isFalse);
      expect(await looksLikeSiloJellyfinCompat(missing, 'http://h'), isFalse);
    });
  });

  group('probeSiloServer', () {
    test('finds a native Silo host', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/info') {
          return _json({'server_version': 'bd9d59ea', 'api_major': 2});
        }
        return _status(404);
      });

      final result = await probeSiloServer(dio, 'http://host:8090/');

      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'http://host:8090');
    });

    test('null for a Jellyfin host', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server', 'Version': '10.11.0'});
        }
        return _html('<html></html>');
      });

      expect(await probeSiloServer(dio, 'http://host:8096'), isNull);
    });
  });

  group('a retired Silo API', () {
    test('the 410 tombstone throws SiloApiUnsupported', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/info') {
          return ResponseBody.fromString(
            jsonEncode({
              'type':
                  'https://siloserver.org/docs/api/v2/problems/client_upgrade_required',
              'status': 410,
              'title': 'Client upgrade required',
            }),
            410,
            headers: {
              Headers.contentTypeHeader: ['application/problem+json'],
            },
          );
        }
        return _status(404);
      });

      await expectLater(
        probeServerPublicInfo(dio, 'https://host'),
        throwsA(
          isA<SiloApiUnsupported>()
              .having((e) => e.apiMajor, 'apiMajor', isNull)
              .having((e) => e.serverIsNewer, 'serverIsNewer', isTrue),
        ),
      );
    });

    test('another 410 is not a tombstone', () {
      expect(isSiloClientUpgradeRequired(410, {'type': '/x/gone'}), isFalse);
      expect(isSiloClientUpgradeRequired(404, null), isFalse);
      expect(isSiloClientUpgradeRequired(426, null), isTrue);
    });

    test('an api_major tells newer from older', () {
      expect(const SiloApiUnsupported(apiMajor: 3).serverIsNewer, isTrue);
      expect(const SiloApiUnsupported(apiMajor: 1).serverIsNewer, isFalse);
    });
  });
}
