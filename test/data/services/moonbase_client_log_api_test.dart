import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/moonbase_client_log_api.dart';
import 'package:moonfin/data/services/moonbase_endpoint.dart';
import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_plex/server_plex.dart';
import 'package:server_silo/server_silo.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '2.5.1',
);

/// Answers the Moonbase lookup and the upload before anything hits the
/// network, keeping the upload so the test can check exactly what was sent.
class _FakeMoonbase extends Interceptor {
  bool installed = true;
  int status = 200;
  Object? reply = {'FileName': 'upload_Moonfin_2.5.1_20260913T101500123.txt'};
  final uploads = <RequestOptions>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) {
    switch (options.uri.path) {
      case '/Moonfin/Ping':
        h.resolve(
          Response(
            requestOptions: options,
            // Without the companion, Plex itself answers.
            data: installed
                ? {'installed': true}
                : {
                    'MediaContainer': {'size': 0},
                  },
          ),
        );
      case '/api/v2/settings/plugins':
        h.resolve(
          Response(
            requestOptions: options,
            data: {
              'items': [
                {'id': '12', 'plugin_id': siloMoonbasePluginId},
              ],
            },
          ),
        );
      default:
        uploads.add(options);
        final response = Response(
          requestOptions: options,
          statusCode: status,
          data: reply,
        );
        if (status == 200) {
          h.resolve(response);
        } else {
          h.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.badResponse,
              response: response,
            ),
          );
        }
    }
  }
}

(Dio, _FakeMoonbase) _server() {
  final fake = _FakeMoonbase();
  return (Dio()..interceptors.add(fake), fake);
}

// Where Moonbase was found is kept per server, so each test has its own.
PlexMediaServerClient _plex(String host) =>
    PlexMediaServerClient(baseUrl: 'http://$host:32400', deviceInfo: _device)
      ..accessToken = 'pms-token';

SiloMediaServerClient _silo(String host) {
  final now = DateTime.now().toUtc();
  return SiloMediaServerClient(baseUrl: 'https://$host', deviceInfo: _device)
    ..session.setTokens(
      SiloTokens(
        accessToken: 'access',
        refreshToken: 'refresh',
        expiresAt: now.add(const Duration(hours: 1)),
        lifetime: const Duration(hours: 1),
      ),
    )
    ..profileId = '7'
    ..profileToken = 'pin-proof';
}

void main() {
  group('Plex', () {
    test('posts the report to the Moonbase companion as plain text', () async {
      final (dio, moonbase) = _server();
      final api = MoonbaseClientLogApi(_plex('192.168.50.81'), dio: dio);

      final fileName = await api.uploadDocument('the report');

      final request = moonbase.uploads.single;
      expect(request.method, 'POST');
      expect(
        request.uri.toString(),
        'http://192.168.50.81:32500/Moonfin/ClientLog/Document',
      );
      expect(request.headers['X-Plex-Token'], 'pms-token');
      expect(request.data, 'the report');
      expect(request.contentType, startsWith('text/plain'));
      expect(fileName, 'upload_Moonfin_2.5.1_20260913T101500123.txt');
    });

    test('never posts to Plex itself when there is no companion', () async {
      final (dio, moonbase) = _server();
      moonbase.installed = false;
      final api = MoonbaseClientLogApi(_plex('192.168.50.82'), dio: dio);

      await expectLater(
        api.uploadDocument('the report'),
        throwsA(isA<StateError>()),
      );
      expect(moonbase.uploads, isEmpty);
    });

    test('lets a rejection reach the caller', () async {
      final (dio, moonbase) = _server();
      moonbase
        ..status = 503
        ..reply = {'Error': 'Client log upload is disabled'};
      final api = MoonbaseClientLogApi(_plex('192.168.50.83'), dio: dio);

      await expectLater(
        api.uploadDocument('the report'),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('Silo', () {
    test('posts the report to the Moonbase plugin as the profile', () async {
      final (dio, moonbase) = _server();
      final api = MoonbaseClientLogApi(_silo('silo-log.example'), dio: dio);

      final fileName = await api.uploadDocument('the report');

      final request = moonbase.uploads.single;
      expect(request.method, 'POST');
      expect(
        request.uri.toString(),
        'https://silo-log.example/api/v2/plugin-content/plugins/12'
        '/Moonfin/ClientLog/Document',
      );
      expect(request.headers['Authorization'], 'Bearer access');
      expect(request.headers['X-Profile-Id'], '7');
      expect(request.data, 'the report');
      expect(request.contentType, startsWith('text/plain'));
      expect(fileName, 'upload_Moonfin_2.5.1_20260913T101500123.txt');
    });

    test('returns null when the server names no file', () async {
      final (dio, moonbase) = _server();
      moonbase.reply = {'Success': true};
      final api = MoonbaseClientLogApi(_silo('silo-unnamed.example'), dio: dio);

      expect(await api.uploadDocument('the report'), isNull);
    });
  });

  test('Jellyfin and Emby keep their own uploader', () {
    final jellyfin = JellyfinMediaServerClient(
      baseUrl: 'https://jf.example',
      deviceInfo: _device,
    );
    final emby = EmbyMediaServerClient(
      baseUrl: 'https://emby.example',
      deviceInfo: _device,
    );

    expect(clientLogApiOf(jellyfin), same(jellyfin.clientLogApi));
    expect(clientLogApiOf(emby), same(emby.clientLogApi));
    expect(clientLogApiOf(_plex('192.168.50.84')), isA<MoonbaseClientLogApi>());
    expect(
      clientLogApiOf(_silo('silo-of.example')),
      isA<MoonbaseClientLogApi>(),
    );
  });
}
