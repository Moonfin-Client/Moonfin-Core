import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

/// Answers the plugin and keeps every settings stream open for the test to
/// write into, the way the server holds it open between events.
class _StreamAdapter implements HttpClientAdapter {
  final List<StreamController<Uint8List>> streams = [];
  final List<RequestOptions> streamRequests = [];

  void send(String text) =>
      streams.last.add(Uint8List.fromList(utf8.encode(text)));

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    if (path.endsWith('/Moonfin/Settings/Stream')) {
      final body = StreamController<Uint8List>();
      streams.add(body);
      streamRequests.add(options);
      return ResponseBody(
        body.stream,
        200,
        headers: {
          Headers.contentTypeHeader: ['text/event-stream'],
        },
      );
    }
    Map<String, dynamic>? body;
    if (path.endsWith('/Moonfin/Ping')) {
      body = {'installed': true, 'settingsSyncEnabled': true};
    } else if (path.contains('/Moonfin/Settings/')) {
      body = {};
    }
    if (body == null) return ResponseBody.fromString('', 404);
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _seerrEvent({String route = '/seerr/media/1'}) => {
  'type': 'seerrNotification',
  'title': 'New request',
  'body': 'Ada requested Heat',
  'route': route,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PluginSyncService service;
  late _StreamAdapter adapter;
  late _MockClient client;

  setUp(() async {
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    final store = PreferenceStore();
    await store.init();
    final prefs = UserPreferences(store);

    final session = _MockSessionRepository();
    when(() => session.activeUserId).thenReturn('user1');
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, session),
    );

    client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );
    GetIt.instance.registerSingleton<MediaServerClient>(client);

    adapter = _StreamAdapter();
    service = PluginSyncService(
      prefs,
      store,
      dio: Dio(pluginRequestOptions())..httpClientAdapter = adapter,
    );
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
  });

  tearDown(() => GetIt.instance.reset());

  group('settings stream', () {
    test('a quiet stream stays open past the server heartbeat', () {
      fakeAsync((async) {
        final heard = <SeerrNotificationEvent>[];
        service.seerrNotifications.listen(heard.add);
        service.syncOnLogin(client, serverId: 'srv1');
        async.elapse(const Duration(seconds: 5));
        adapter.send(':connected\n\n');

        async.elapse(const Duration(seconds: 45));
        adapter.send('data: ${jsonEncode(_seerrEvent())}\n\n');
        async.flushMicrotasks();

        expect(adapter.streams, hasLength(1));
        expect(heard.single.title, 'New request');
        service.dispose();
      });
    });

    test('Moonbase for Plex streams from the companion', () {
      when(() => client.serverType).thenReturn(ServerType.plex);
      when(() => client.baseUrl).thenReturn('http://plex.test:32400');
      fakeAsync((async) {
        final heard = <SeerrNotificationEvent>[];
        service.seerrNotifications.listen(heard.add);
        service.syncOnLogin(client, serverId: 'srv1');
        async.elapse(const Duration(seconds: 5));
        adapter.send(':connected\n\n');
        adapter.send(
          'data: ${jsonEncode(_seerrEvent(route: '/item/777'))}\n\n',
        );
        async.flushMicrotasks();

        final request = adapter.streamRequests.single;
        expect(
          request.uri.toString(),
          'http://plex.test:32500/Moonfin/Settings/Stream',
        );
        expect(request.headers['X-Plex-Token'], 'token');
        expect(heard.single.route, '/item/777');
        service.dispose();
      });
    });

    test('a stream quiet past the idle limit opens again', () {
      fakeAsync((async) {
        service.syncOnLogin(client, serverId: 'srv1');
        async.elapse(const Duration(seconds: 5));
        adapter.send(':connected\n\n');

        async.elapse(const Duration(seconds: 90));

        expect(adapter.streams, hasLength(2));
        service.dispose();
      });
    });
  });

  group('Seerr notifications', () {
    test('every listener hears one, even after another stops', () async {
      final kept = <SeerrNotificationEvent>[];
      final dropped = service.seerrNotifications.listen((_) {});
      service.seerrNotifications.listen(kept.add);
      await dropped.cancel();

      await service.handleServerEvent(client, _seerrEvent());
      await pumpEventQueue();

      expect(kept.single.route, '/seerr/media/1');
    });

    test('one with nowhere to go still comes through', () async {
      final heard = <SeerrNotificationEvent>[];
      service.seerrNotifications.listen(heard.add);

      await service.handleServerEvent(client, _seerrEvent(route: ''));
      await pumpEventQueue();

      expect(heard.single.route, isEmpty);
      expect(heard.single.body, 'Ada requested Heat');
    });
  });
}
