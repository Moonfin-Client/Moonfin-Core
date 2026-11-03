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

void main() {
  group('capabilities', () {
    test('reads the captured document', () async {
      final server = FixtureServer({
        '/api/v2/events/capabilities': FixtureServer.file(
          'silo/events_capabilities.json',
        ),
      });
      final caps = await _client(server).eventsApi.capabilities();
      expect(caps.available, isTrue);
      expect(caps.declaredChannels, isTrue);
      expect(caps.channels, containsAll(SiloEventsApi.followedChannels));
    });

    test('a server without the service is not available', () async {
      final server = FixtureServer({
        '/api/v2/events/capabilities': (_) => FixtureServer.json(
          200,
          '{"state":"not_configured","allowed":false,"channels":[],'
          '"declared_channels":false}',
        ),
      });
      expect(
        (await _client(server).eventsApi.capabilities()).available,
        isFalse,
      );
    });
  });

  group('createTicket', () {
    test('posts with the login and profile and reads the ticket', () async {
      final server = FixtureServer({
        '/api/v2/events/ws-ticket': FixtureServer.file(
          'silo/events_ws_ticket.json',
        ),
      });
      final ticket = await _client(server).eventsApi.createTicket();

      final request = server.requests.single;
      expect(request.method, 'POST');
      expect(request.headers['Authorization'], 'Bearer access');
      expect(
        request.headers['X-Profile-Id'],
        'eaddd2dc-4b4e-47e8-b0e2-8729dff5dc63',
      );
      expect(ticket.protocol, 'silo.events.v2');
      expect(ticket.maxConnection, const Duration(minutes: 5));
      expect(ticket.expiresIn, const Duration(seconds: 30));
      // The protocol first, then the credential. Silo selects only the first.
      expect(ticket.offeredProtocols, [
        'silo.events.v2',
        'silo.ticket.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      ]);
    });

    test('a refusal reaches the caller with Silo\'s problem', () async {
      final server = FixtureServer({
        '/api/v2/events/ws-ticket': (_) => FixtureServer.problem(
          503,
          'service_unavailable',
          'Realtime events are unavailable.',
        ),
      });
      await expectLater(
        _client(server).eventsApi.createTicket(),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            503,
          ),
        ),
      );
    });
  });

  group('socketUri', () {
    test('wss for https, the followed channels declared, no credential', () {
      final uri = _client(FixtureServer({})).eventsApi.socketUri();
      expect(
        uri.toString(),
        'wss://silo.example:443/api/v2/events/ws?channels=user_state,catalog',
      );
    });

    // A wss URL without a port reports port 0, and dart:io's WebSocket used
    // to connect to exactly that on macOS.
    test('the port is written out, so the socket reaches 443 or 80', () {
      final secure = _client(FixtureServer({})).eventsApi.socketUri();
      expect(secure.port, 443);
      expect(Uri.parse(secure.toString()).port, 443);
      final plain = _client(
        FixtureServer({}),
        baseUrl: 'http://silo.example',
      ).eventsApi.socketUri();
      expect(Uri.parse(plain.toString()).port, 80);
    });

    test('ws for http, below a path prefix', () {
      final uri = _client(
        FixtureServer({}),
        baseUrl: 'http://192.168.1.10:8080/silo/',
      ).eventsApi.socketUri(['catalog']);
      expect(
        uri.toString(),
        'ws://192.168.1.10:8080/silo/api/v2/events/ws?channels=catalog',
      );
    });
  });

  group('SiloEventFrame.parse', () {
    test('hello', () {
      final frame = SiloEventFrame.parse(
        '{"type":"hello","schema_version":1,"connection_id":"01J",'
        '"available_channels":["catalog","user_state"],'
        '"required_action":"none"}',
      )!;
      expect(frame.type, 'hello');
      expect(frame.requiredAction, 'none');
      expect(frame.channels, ['catalog', 'user_state']);
    });

    test('subscribed with a refusal', () {
      final frame = SiloEventFrame.parse(
        '{"type":"subscribed","channels":["user_state"],"rejected":'
        '[{"channel":"jobs","code":"forbidden","message":"No"}]}',
      )!;
      expect(frame.channels, ['user_state']);
      expect(frame.rejected, ['jobs']);
    });

    test('an event with its payload', () {
      final frame = SiloEventFrame.parse(
        '{"type":"event","channel":"user_state","event":"user_state.changed",'
        '"event_id":"e1","timestamp":"2026-10-18T12:00:00Z",'
        '"data":{"profile_id":"p","content_id":"movie-1","change":"watched",'
        '"played":true}}',
      )!;
      expect(frame.channel, 'user_state');
      expect(frame.event, 'user_state.changed');
      expect(frame.eventId, 'e1');
      expect(frame.data?['played'], isTrue);
    });

    test('a null snapshot has no data', () {
      final frame = SiloEventFrame.parse(
        '{"type":"snapshot","channel":"catalog","timestamp":"t","data":null}',
      )!;
      expect(frame.type, 'snapshot');
      expect(frame.data, isNull);
    });

    test('not a frame', () {
      expect(SiloEventFrame.parse('not json'), isNull);
      expect(SiloEventFrame.parse('[1]'), isNull);
      expect(SiloEventFrame.parse('{"no":"type"}'), isNull);
      expect(SiloEventFrame.parse(null), isNull);
    });
  });
}
