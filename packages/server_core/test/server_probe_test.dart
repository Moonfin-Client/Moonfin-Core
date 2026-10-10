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

ResponseBody _status(int code, {String? location}) => ResponseBody.fromString(
  '',
  code,
  headers: location == null
      ? null
      : {
          'location': [location],
        },
);

ResponseBody _html(String body) => ResponseBody.fromString(
  body,
  200,
  headers: {
    Headers.contentTypeHeader: ['text/html; charset=utf-8'],
  },
);

// Captured from a Silo build 4e371f4c server.
const _siloSystemInfo = {
  'server_version': '4e371f4c',
  'api_major': 2,
  'contract_digest':
      'da012530cefeced156cd4ca3e8416718bf9eb81b8e6869e41a1ed42a7548bc7e',
  'links': {
    'openapi': '/api/v2/openapi.json',
    'capabilities': '/api/v2/capabilities',
    'identity': '/api/v2/system/identity',
  },
};

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
    ResponseBody silo(Uri uri, {String prefix = ''}) {
      switch (uri.path) {
        case final p when p == '$prefix/api/v2/system/info':
          return _json(_siloSystemInfo);
        case final p when p == '$prefix/api/v2/system/identity':
          return _json({'server_id': '7b72fbd5-e741-48f0-9d05-b438990f3a7e'});
        case final p when p == '$prefix/api/v2/theme/branding':
          return _json({
            'server_name': 'Snowy Silo',
            'login_subtitle': 'Sign in with an existing account.',
            'storage_available': true,
          });
        case final p when p == '$prefix/api/v2/system/setup':
          return _json({'needs_setup': false, 'wizard_completed': true});
        case final p when p == '$prefix/System/Info/Public':
          // Behind Cloudflare the native host answers unknown paths with the
          // web app's HTML and a 200.
          return _html('<!doctype html><html><title>Silo</title></html>');
      }
      return _status(404);
    }

    test('identifies Silo from the native system info first', () async {
      final dio = _dioWith(silo);

      final result = await probeServerPublicInfo(
        dio,
        'https://silo.host',
        detectSilo: true,
      );

      expect(result, isNotNull);
      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'https://silo.host');
      expect(result.info['Id'], '7b72fbd5-e741-48f0-9d05-b438990f3a7e');
      expect(result.info['ServerName'], 'Snowy Silo');
      expect(result.info['Version'], '4e371f4c');
      expect(result.info['ProductName'], 'Silo');
      expect(result.info['StartupWizardCompleted'], isTrue);
      expect(result.info['LoginDisclaimer'], 'Sign in with an existing account.');
      expect(result.info['SiloApiMajor'], 2);
    });

    test('leaves Silo undetected while support is off', () async {
      // Only the Jellyfin/Emby paths are tried, and on a native Silo host
      // those give back HTML or a 404, so no server is found.
      final dio = _dioWith(silo);

      await expectLater(
        probeServerPublicInfo(dio, 'https://silo.host', detectSilo: false),
        throwsA(isA<DioException>()),
      );
    });

    test('keeps a reverse-proxy path prefix', () async {
      final dio = _dioWith((uri) => silo(uri, prefix: '/silo'));

      final result = await probeServerPublicInfo(
        dio,
        'https://host/silo/',
        detectSilo: true,
      );

      expect(result!.serverType, ServerType.silo);
      expect(result.resolvedBaseUrl, 'https://host/silo');
      expect(result.info['ServerName'], 'Snowy Silo');
    });

    test('still identifies Silo when branding and identity fail', () async {
      final dio = _dioWith((uri) => uri.path == '/api/v2/system/info'
          ? _json(_siloSystemInfo)
          : _status(500));

      final result = await probeServerPublicInfo(
        dio,
        'https://silo.host',
        detectSilo: true,
      );

      expect(result!.serverType, ServerType.silo);
      expect(result.info['Id'], isNull);
      expect(result.info['ServerName'], 'Silo');
      expect(result.info['StartupWizardCompleted'], isTrue);
    });

    test('reports setup still needed', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/setup') {
          return _json({'needs_setup': true, 'wizard_completed': false});
        }
        return silo(uri);
      });

      final result = await probeServerPublicInfo(
        dio,
        'https://silo.host',
        detectSilo: true,
      );

      expect(result!.info['StartupWizardCompleted'], isFalse);
    });

    test('treats Silo\'s Jellyfin-compat listener as Jellyfin', () async {
      // Port 8096 on a Silo install speaks only the Jellyfin protocol.
      final dio = _dioWith((uri) {
        if (uri.path == '/System/Info/Public') {
          return _json({
            'ProductName': 'Jellyfin Server',
            'Version': '12.1.0',
            'Id': 'compat-id',
          });
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(
        dio,
        'http://silo.host:8096',
        detectSilo: true,
      );

      expect(result!.serverType, ServerType.jellyfin);
    });

    test('ignores an HTML page served at the Silo path', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/info') return _html('<html></html>');
        if (uri.path == '/System/Info/Public') {
          return _json({'ProductName': 'Jellyfin Server', 'Version': '10.11.0'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(
        dio,
        'https://host',
        detectSilo: true,
      );

      expect(result!.serverType, ServerType.jellyfin);
    });

    test('does not mistake JSON without the Silo fields for Silo', () async {
      final dio = _dioWith((uri) {
        if (uri.path == '/api/v2/system/info') return _json({'status': 'ok'});
        if (uri.path == '/emby/System/Info/Public') {
          return _json({'ProductName': 'Emby Server', 'Version': '4.10.1.0'});
        }
        return _status(404);
      });

      final result = await probeServerPublicInfo(
        dio,
        'https://host',
        detectSilo: true,
      );

      expect(result!.serverType, ServerType.emby);
      expect(result.resolvedBaseUrl, 'https://host/emby');
    });
  });

  group('ServerType', () {
    test('detects Silo from a product name', () {
      expect(
        ServerType.detect('Silo', '4e371f4c', allowSilo: true),
        ServerType.silo,
      );
    });

    test('ignores a Silo product name while support is off', () {
      expect(
        ServerType.detect('Silo', '4e371f4c', allowSilo: false),
        ServerType.jellyfin,
      );
      expect(
        ServerType.detect('Emby Server', '4.10.1.0', allowSilo: false),
        ServerType.emby,
      );
    });

    test('uses the token query param Silo media requests accept', () {
      expect(ServerType.silo.tokenQueryParam, 'token');
      expect(ServerType.emby.tokenQueryParam, 'api_key');
      expect(ServerType.jellyfin.tokenQueryParam, 'ApiKey');
    });
  });
}
