import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';

const _device = DeviceInfo(
  id: 'a1b2c3d4-e5f6-7890-abcd-ef0123456789',
  name: 'Test Mac',
  appName: 'Moonfin for macOS',
  appVersion: '2.7.0',
);

const _capabilitiesPath = '/api/v2/playback/sessions/control/capabilities';
const _ticketPath = '/api/v2/playback/sessions/s-1/control/ws-ticket';

SiloMediaServerClient _client(
  FixtureServer server, {
  String baseUrl = 'https://silo.example',
}) =>
    SiloMediaServerClient(
        baseUrl: baseUrl,
        deviceInfo: _device,
        platform: 'macOS',
        httpClientAdapter: server,
      )
      ..session.setTokens(
        SiloTokens(
          accessToken: 'access',
          refreshToken: 'refresh',
          expiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
          lifetime: const Duration(hours: 1),
        ),
      )
      ..profileId = 'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63';

ResponseBody Function(RequestOptions) _json(Object body, [int status = 200]) =>
    (_) => FixtureServer.json(status, jsonEncode(body));

void main() {
  group('capabilities', () {
    test('a server serving the lane is usable', () async {
      final server = FixtureServer({
        _capabilitiesPath: _json({
          'revision': 'r1',
          'state': 'available',
          'allowed': true,
          'available': true,
          'protocol': SiloPlaybackControlApi.protocol,
        }),
      });
      final caps = await _client(server).playbackControlApi.capabilities();
      expect(caps.usable, isTrue);
    });

    test('another protocol is not usable', () async {
      final server = FixtureServer({
        _capabilitiesPath: _json({
          'available': true,
          'allowed': true,
          'protocol': 'silo.playback-control.v3',
        }),
      });
      final caps = await _client(server).playbackControlApi.capabilities();
      expect(caps.usable, isFalse);
    });

    test('a server older than the lane reads as not available', () async {
      final server = FixtureServer({
        _capabilitiesPath: (_) =>
            FixtureServer.problem(404, 'not_found', 'No such route.'),
      });
      final caps = await _client(server).playbackControlApi.capabilities();
      expect(caps.usable, isFalse);
    });

    test('is asked once while kept', () async {
      final server = FixtureServer({
        _capabilitiesPath: _json({
          'available': true,
          'allowed': true,
          'protocol': SiloPlaybackControlApi.protocol,
        }),
      });
      final api = _client(server).playbackControlApi;
      await api.capabilities();
      await api.capabilities();
      expect(server.requests, hasLength(1));
    });
  });

  group('createTicket', () {
    test('posts the installation and reads the ticket', () async {
      final server = FixtureServer({
        _ticketPath: _json({
          'ticket': 'abc',
          'expires_in': 30,
          'max_connection_seconds': 14400,
          'protocol': SiloPlaybackControlApi.protocol,
        }),
      });
      final ticket = await _client(
        server,
      ).playbackControlApi.createTicket('s-1', installationId: 'inst-1');

      final request = server.requests.single;
      expect(request.method, 'POST');
      expect(request.headers['Authorization'], 'Bearer access');
      expect(request.data, {'installation_id': 'inst-1'});
      expect(ticket.maxConnection, const Duration(hours: 4));
      expect(ticket.offeredProtocols, [
        SiloPlaybackControlApi.protocol,
        'silo.ticket.abc',
      ]);
    });

    test('a ticket for another protocol is refused', () async {
      final server = FixtureServer({
        _ticketPath: _json({
          'ticket': 'abc',
          'expires_in': 30,
          'max_connection_seconds': 14400,
          'protocol': 'silo.events.v2',
        }),
      });
      await expectLater(
        _client(
          server,
        ).playbackControlApi.createTicket('s-1', installationId: 'inst-1'),
        throwsFormatException,
      );
    });
  });

  test('final refusals are the ones no later ticket gets past', () {
    DioException refused(int status) => DioException(
      requestOptions: RequestOptions(path: '/'),
      response: Response(
        requestOptions: RequestOptions(path: '/'),
        statusCode: status,
      ),
    );
    for (final status in [401, 403, 404, 409, 410]) {
      expect(
        SiloPlaybackControlApi.isFinalRefusal(refused(status)),
        isTrue,
        reason: '$status',
      );
    }
    for (final status in [500, 502, 503]) {
      expect(
        SiloPlaybackControlApi.isFinalRefusal(refused(status)),
        isFalse,
        reason: '$status',
      );
    }
    expect(
      SiloPlaybackControlApi.isFinalRefusal(
        DioException(requestOptions: RequestOptions(path: '/')),
      ),
      isFalse,
    );
  });

  group('socketUri', () {
    test('wss with the port written out and no credential', () {
      final uri = _client(
        FixtureServer({}),
        baseUrl: 'https://silo.example/base/',
      ).playbackControlApi.socketUri('s 1');
      expect(
        uri.toString(),
        'wss://silo.example:443/base/api/v2/playback/sessions/s%201/control/ws',
      );
    });

    test('ws for http', () {
      final uri = _client(
        FixtureServer({}),
        baseUrl: 'http://192.168.1.5:8090',
      ).playbackControlApi.socketUri('s1');
      expect(
        uri.toString(),
        'ws://192.168.1.5:8090/api/v2/playback/sessions/s1/control/ws',
      );
    });
  });
}
