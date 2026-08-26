import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/server_message.dart';
import 'package:moonfin/data/services/server_messages_service.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

/// Serves whatever the test puts in [items] from /Moonfin/Messages.
class _MessagesAdapter implements HttpClientAdapter {
  List<Map<String, dynamic>> items = [];
  int status = 200;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    calls++;
    if (status != 200) {
      return ResponseBody.fromString('', status);
    }
    return ResponseBody.fromString(
      jsonEncode({'items': items}),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _message(
  String id, {
  String color = 'white',
  String delivery = 'inbox',
  String createdUtc = '2026-08-24T12:00:00Z',
}) => {
  'id': id,
  'title': 'Title $id',
  'body': 'Body $id',
  'color': color,
  'delivery': delivery,
  'createdUtc': createdUtc,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MessagesAdapter adapter;
  late ServerMessagesService service;
  late _MockClient client;
  late PreferenceStore store;

  setUp(() async {
    SharedPreferences.setMockInitialValues({'pref_last_user_id': 'user1'});
    store = PreferenceStore();
    await store.init();

    client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );

    adapter = _MessagesAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    service = ServerMessagesService(store, dio: dio);
    service.setSupported(true);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('no request is made when the plugin does not support messages', () async {
    service.setSupported(false);
    adapter.items = [_message('a')];

    await service.refresh(client);

    expect(adapter.calls, 0);
    expect(service.messages, isEmpty);
  });

  test('messages keep the order the server sent them', () async {
    adapter.items = [_message('c'), _message('a'), _message('b')];

    await service.refresh(client);

    expect(service.messages.map((m) => m.id), ['c', 'a', 'b']);
  });

  test('the unread flag clears once everything is read', () async {
    adapter.items = [_message('a'), _message('b')];
    await service.refresh(client);

    expect(service.hasUnread, isTrue);
    expect(service.unreadCount, 2);

    await service.markRead('a');
    expect(service.hasUnread, isTrue);

    await service.markRead('b');
    expect(service.hasUnread, isFalse);
    expect(service.unreadCount, 0);
  });

  test('read state survives a reload of the service', () async {
    adapter.items = [_message('a'), _message('b')];
    await service.refresh(client);
    await service.markRead('a');

    final reloaded = ServerMessagesService(store, dio: Dio()..httpClientAdapter = adapter);
    reloaded.setSupported(true);
    await reloaded.refresh(client);

    expect(reloaded.isRead('a'), isTrue);
    expect(reloaded.isRead('b'), isFalse);
    expect(reloaded.unreadCount, 1);
  });

  test('read IDs for deleted messages are dropped', () async {
    adapter.items = [_message('a'), _message('b')];
    await service.refresh(client);
    await service.markRead('a');
    await service.markRead('b');

    // The admin deletes both and posts a new one.
    adapter.items = [_message('c')];
    await service.refresh(client);

    expect(service.unreadCount, 1);
    expect(service.isRead('a'), isFalse);

    // The stored list was really trimmed, not just filtered in memory: a fresh
    // service reading the same preferences also sees "a" as unread.
    final readKey = store.keys
        .where((key) => key.startsWith('pref_server_messages_read_'))
        .single;
    expect(store.getStringList(readKey), isEmpty);
  });

  test('only popup messages are pending, and marking them clears them', () async {
    adapter.items = [
      _message('quiet', delivery: 'inbox'),
      _message('loud', delivery: 'popup'),
    ];
    await service.refresh(client);

    expect(service.pendingPopups.map((m) => m.id), ['loud']);

    await service.markPopupsRead();

    expect(service.pendingPopups, isEmpty);
    expect(service.isRead('loud'), isTrue);
    expect(service.isRead('quiet'), isFalse, reason: 'only popups were marked');
  });

  test('a failed request keeps the messages already loaded', () async {
    adapter.items = [_message('a')];
    await service.refresh(client);
    expect(service.messages, hasLength(1));

    adapter.status = 500;
    await service.refresh(client);

    expect(service.messages, hasLength(1));
  });

  test('clear forgets everything so the next user starts fresh', () async {
    adapter.items = [_message('a')];
    await service.refresh(client);
    await service.markRead('a');

    service.clear();

    expect(service.messages, isEmpty);
    expect(service.unreadCount, 0);
    expect(service.isRead('a'), isFalse);
    expect(service.supported, isFalse);
  });

  group('parsing', () {
    test('PascalCase keys from Emby are read', () {
      final message = ServerMessage.fromJson({
        'Id': 'x',
        'Title': 'Hello',
        'Body': 'World',
        'Color': 'red',
        'Delivery': 'popup',
      });

      expect(message, isNotNull);
      expect(message!.title, 'Hello');
      expect(message.color, ServerMessageColor.red);
      expect(message.delivery, ServerMessageDelivery.popup);
    });

    test('unknown colour and delivery fall back to the quiet defaults', () {
      final message = ServerMessage.fromJson({
        'id': 'x',
        'title': 'Hello',
        'color': 'chartreuse',
        'delivery': 'smoke-signal',
      });

      expect(message!.color, ServerMessageColor.white);
      expect(message.delivery, ServerMessageDelivery.inbox);
    });

    test('a message with no ID or no text is skipped', () {
      expect(ServerMessage.fromJson({'title': 'No id'}), isNull);
      expect(
        ServerMessage.fromJson({'id': 'x', 'title': '  ', 'body': ''}),
        isNull,
      );
    });

    test('an action needs both a label and a link to count', () {
      final full = ServerMessage.fromJson({
        'id': 'x',
        'title': 'T',
        'actionLabel': 'Open',
        'actionUrl': 'https://example.com',
      });
      expect(full!.hasAction, isTrue);

      final labelOnly = ServerMessage.fromJson({
        'id': 'y',
        'title': 'T',
        'actionLabel': 'Open',
      });
      expect(labelOnly!.hasAction, isFalse);
    });

    test('an action link has to be a web address', () {
      ServerMessage parse(String url) => ServerMessage.fromJson({
        'id': 'x',
        'title': 'T',
        'actionLabel': 'Open',
        'actionUrl': url,
      })!;

      expect(parse('https://example.com/a').hasAction, isTrue);
      expect(parse('http://example.com').hasAction, isTrue);

      // Anything else would go straight to the system launcher.
      for (final url in [
        'javascript:alert(1)',
        'file:///etc/passwd',
        'moonfin://server/item/1',
        'intent://x#Intent;scheme=http;end',
        'data:text/html,hi',
        'example.com',
        'ht tp://broken',
        ':::',
      ]) {
        expect(parse(url).hasAction, isFalse, reason: url);
        expect(parse(url).actionUrl, isNull, reason: url);
      }
    });

    test('links inside the body are held to the same rule', () {
      expect(ServerMessage.webLink('https://a.test/x'), 'https://a.test/x');
      expect(ServerMessage.webLink('  https://a.test/x  '), 'https://a.test/x');
      expect(ServerMessage.webLink('javascript:alert(1)'), isNull);
      expect(ServerMessage.webLink('moonfin://x'), isNull);
      expect(ServerMessage.webLink('http://[bad'), isNull);
      expect(ServerMessage.webLink('https://'), isNull);
      expect(ServerMessage.webLink(''), isNull);
      expect(ServerMessage.webLink(null), isNull);
    });
  });
}
