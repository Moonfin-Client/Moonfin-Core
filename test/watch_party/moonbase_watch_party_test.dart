import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/watch_party/silo_watch_party_screen.dart';
import 'package:moonfin/ui/widgets/watch_party/watch_party_player_overlay.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:moonfin/watch_party/moonbase_watch_party_api.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:moonfin/watch_party/watch_party_rooms_service.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:server_jellyfin/server_jellyfin.dart';
import 'package:server_silo/server_silo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _device = DeviceInfo(
  id: 'device',
  name: 'Device',
  appName: 'Moonfin',
  appVersion: '1.0.0',
);

Map<String, dynamic> _room({
  String role = 'host',
  String phase = 'lobby',
  int generation = 1,
  bool hasPin = false,
}) => {
  'room_id': 'r1',
  'code': 'K7Q29M',
  'invite_path': '/Moonfin/Party/K7Q29M',
  'phase': phase,
  'playback_state': phase == 'lobby' ? 'idle' : 'paused',
  'selection_mode': 'host_pick',
  'selection_revision': 1,
  'selected_content_id': null,
  'guest_control_policy': 'host_only',
  'is_paused': true,
  'anchor_position_seconds': 0.0,
  'generation': generation,
  'self_role': role,
  'self_can_control_transport': role == 'host',
  'self_member_id': role == 'host' ? 'm-maya' : 'm-sam',
  'has_pin': hasPin,
  'chat_enabled': true,
  'reactions_enabled': true,
  'members': [
    {
      'profile_id': 'm-maya',
      'display_name': 'Maya',
      'is_host': true,
      'is_self': role == 'host',
      'connected': true,
      'user_id': 'u-maya',
      'status': 'in_sync',
      'avatar_url': '/Users/u-maya/Images/Primary',
    },
    {
      'profile_id': 'm-sam',
      'display_name': 'Sam',
      'is_host': false,
      'is_self': role != 'host',
      'connected': true,
      'user_id': 'u-sam',
      'status': 'joining',
    },
  ],
};

/// Moonbase's watch party routes, with one room and a held long-poll.
class _Moonbase implements HttpClientAdapter {
  final List<RequestOptions> requests = [];
  final List<Map<String, dynamic>> posted = [];
  final List<Map<String, dynamic>> _queue = [];
  final List<Map<String, dynamic>> extraRooms = [];
  Completer<void>? _wake;
  int cursor = 2;
  bool roomGone = false;
  bool failNextPoll = false;
  String role = 'host';
  String? requiredPin;
  Duration joinDelay = Duration.zero;

  /// Queues server messages for the next poll.
  void push(List<Map<String, dynamic>> messages) {
    _queue.addAll(messages);
    cursor += messages.length;
    _wake?.complete();
    _wake = null;
  }

  ResponseBody _json(Object body, [int status = 200]) =>
      ResponseBody.fromString(
        jsonEncode(body),
        status,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final path = options.uri.path.replaceFirst('/Moonfin/WatchParty', '');
    final body = options.data is Map
        ? Map<String, dynamic>.from(options.data as Map)
        : <String, dynamic>{};
    switch ((options.method, path)) {
      case ('GET', '/Config'):
        return _json({'enabled': true, 'chat': true, 'version': 1});
      case ('GET', '/Rooms'):
        return _json({
          'rooms': [
            ...extraRooms,
            {
              'room_id': 'old',
              'host_name': 'Leo',
              'member_count': 1,
              'created_at': '2026-11-09T20:00:00.000Z',
            },
            {
              'room_id': 'new',
              'host_name': 'Maya',
              'member_count': 3,
              'members_preview': ['Maya', 'Sam', 'Jordan'],
              'phase': 'playing',
              'has_pin': true,
              'selected_content_id': 'avatar',
              'content_title': 'Avatar: The Way of Water',
              'created_at': '2026-11-09T21:00:00.000Z',
            },
          ],
        });
      case ('POST', '/Rooms'):
        role = 'host';
        return _json({
          'room': _room(hasPin: body['pin'] != null),
          'token': 'tok',
        });
      case ('POST', '/Join'):
        await Future<void>.delayed(joinDelay);
        if (requiredPin != null && body['pin'] != requiredPin) {
          return _json({
            'code': body['pin'] == null ? 'pin_required' : 'wrong_pin',
            'message': 'PIN',
          }, 403);
        }
        role = 'guest';
        return _json({'room': _room(role: 'guest'), 'token': 'tok'});
      case ('GET', '/Rooms/r1/Events'):
        if (roomGone) {
          return _json({'code': 'not_found', 'message': 'gone'}, 404);
        }
        final from = int.parse(options.uri.queryParameters['cursor'] ?? '0');
        if (failNextPoll && from > 0) {
          failNextPoll = false;
          return ResponseBody.fromString('', 502);
        }
        if (from == 0) {
          return _json({
            'cursor': cursor,
            'messages': [
              {'type': 'snapshot', 'room': _room(role: role)},
              {
                'type': 'chat_history',
                'messages': [
                  {
                    'id': 'c1',
                    'member_id': 'm-maya',
                    'display_name': 'Maya',
                    'text': 'everyone got snacks?',
                    'sent_at': '2026-11-09T21:02:00.000Z',
                  },
                ],
              },
            ],
          });
        }
        if (_queue.isEmpty && options.uri.queryParameters['wait'] != '0') {
          await (_wake ??= Completer<void>()).future;
        }
        if (roomGone) {
          return _json({'code': 'not_found', 'message': 'gone'}, 404);
        }
        final out = List.of(_queue);
        _queue.clear();
        return _json({'cursor': cursor, 'messages': out});
      case ('POST', '/Rooms/r1/Messages'):
        final messages = [
          for (final m in body['messages'] as List)
            Map<String, dynamic>.from(m),
        ];
        posted.addAll(messages);
        return _json({
          'messages': [
            for (final m in messages)
              if (m['type'] == 'ping')
                {
                  'type': 'pong',
                  'client_sent_at': m['client_sent_at'],
                  'server_received_at': m['client_sent_at'],
                  'server_sent_at': m['client_sent_at'],
                },
          ],
        });
      case ('POST', '/Rooms/r1/Start'):
        return _json({'room': _room(phase: 'playing')});
      case ('POST', '/Rooms/r1/Leave'):
      case ('POST', '/Rooms/r1/Close'):
        return ResponseBody.fromString('', 204);
    }
    return _json({'code': 'not_found', 'message': path}, 404);
  }

  /// Ends a poll that's waiting, as when the room is closed.
  void closeRoom() {
    roomGone = true;
    _wake?.complete();
    _wake = null;
  }

  @override
  void close({bool force = false}) {}
}

/// No player until a test opens one, then one that loads until [load].
class _Player extends Fake implements PlaybackManager {
  @override
  final PlayerState state = PlayerState();
  String? session;
  @override
  PlaybackBringupState bringupState = const PlaybackBringupState.idle();
  final List<String> calls = [];
  final List<double> seeks = [];

  void open(String id) {
    session = id;
    bringupState = const PlaybackBringupState(
      phase: PlaybackBringupPhase.waitingForReady,
    );
  }

  void load() {
    bringupState = const PlaybackBringupState(
      phase: PlaybackBringupPhase.ready,
    );
    state.setDuration(const Duration(hours: 2));
  }

  @override
  StreamResolutionResult? get currentResolution => session == null
      ? null
      : StreamResolutionResult(
          streamUrl: 'https://jf.example/stream',
          mediaSourceId: 'avatar',
          playSessionId: session,
          playMethod: StreamPlayMethod.directPlay,
        );

  Future<bool> Function(TransportAction action, {Duration? position})?
  interceptor;

  @override
  void setTransportInterceptor(
    Future<bool> Function(TransportAction action, {Duration? position})?
    interceptor,
  ) => this.interceptor = interceptor;

  @override
  Future<void> seekTo(Duration position) async {
    calls.add('seek');
    seeks.add(position.inMilliseconds / 1000);
    state.setPosition(position);
  }

  @override
  Future<void> setPlaybackSpeed(double speed) async {
    calls.add('rate');
    state.setPlaybackSpeed(speed);
  }

  @override
  Future<void> resume() async {
    calls.add('resume');
    state.setPlaying(true);
  }

  @override
  Future<void> pause() async {
    calls.add('pause');
    state.setPlaying(false);
  }

  @override
  Future<void> stop({bool userInitiated = true}) async {}
}

/// A playing room's snapshot, with this member's player attached as `s1`.
Map<String, dynamic> _playingRoom({
  required String playbackState,
  double anchor = 0,
  DateTime? anchorAt,
}) => {
  ..._room(role: 'guest', phase: 'playing', generation: 2),
  'playback_state': playbackState,
  'selected_content_id': 'avatar',
  'attached_session_id': 's1',
  'is_paused': playbackState != 'playing',
  'anchor_position_seconds': anchor,
  'anchor_at': ?anchorAt?.toUtc().toIso8601String(),
};

Map<String, dynamic> _command(
  String id,
  String action,
  String playbackState,
  double position,
  DateTime executeAt,
) => {
  'type': 'transport_command',
  'command': {
    'command_id': id,
    'action': action,
    'position_seconds': position,
    'playback_state': playbackState,
    'execute_at': executeAt.toUtc().toIso8601String(),
    'selection_revision': 1,
  },
};

Dio _dio(_Moonbase server) => Dio()..httpClientAdapter = server;

MoonbaseWatchPartyApi _api(_Moonbase server) => MoonbaseWatchPartyApi(
  _dio(server),
  () async => (base: 'https://jf.example', headers: {'Authorization': 'x'}),
);

/// Lets queued answers and the stream events after them land.
Future<void> _settle() async {
  for (var i = 0; i < 20; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  test('a code comes from what people paste, in any spelling', () {
    expect(MoonbaseWatchPartyApi.codeFrom('k7q 29m'), 'K7Q29M');
    expect(MoonbaseWatchPartyApi.codeFrom(' K7Q-29M '), 'K7Q29M');
    expect(
      MoonbaseWatchPartyApi.codeFrom('https://jf.example/Moonfin/Party/K7Q29M'),
      'K7Q29M',
    );
    expect(
      MoonbaseWatchPartyApi.codeFrom(
        'moonfin://party?server=abc&code=k7q29m&address=https%3A%2F%2Fjf',
      ),
      'K7Q29M',
    );
    expect(MoonbaseWatchPartyApi.displayCode('K7Q29M'), 'K7Q 29M');
  });

  testWidgets('the native player gets each reaction as a square PNG', (
    tester,
  ) async {
    for (final kind in WatchPartyReaction.kinds) {
      final png = await tester.runAsync(() => watchPartyReactionPng(kind, 64));
      expect(png!.sublist(1, 4), utf8.encode('PNG'), reason: kind);
      final codec = await tester.runAsync(() => ui.instantiateImageCodec(png));
      final frame = await tester.runAsync(() => codec!.getNextFrame());
      expect([frame!.image.width, frame.image.height], [64, 64], reason: kind);
    }
  });

  test('room calls carry the room token, and errors keep their code', () async {
    final server = _Moonbase()..requiredPin = '1234';
    final api = _api(server);

    final created = await api.create('r1', pin: '1234');
    expect(created.token, 'tok');
    expect(created.room.hasPin, isTrue);
    expect(created.room.selfMemberId, 'm-maya');
    expect(created.room.members.first.status, 'in_sync');
    expect(
      server.requests.last.uri.toString(),
      'https://jf.example/Moonfin/WatchParty/Rooms',
    );
    expect(server.requests.last.data, {'room_id': 'r1', 'pin': '1234'});

    await api.leave('r1', 'tok');
    expect(server.requests.last.headers['X-Moonfin-Room-Token'], 'tok');
    expect(server.requests.last.headers['Authorization'], 'x');

    Object? error;
    try {
      await api.join('', roomId: 'r1', pin: '9999');
    } catch (e) {
      error = e;
    }
    expect(MoonbaseWatchPartyApi.errorCode(error!), 'wrong_pin');
    expect(server.requests.last.data, {'room_id': 'r1', 'pin': '9999'});

    expect(
      api.inviteUri(created.room).toString(),
      'https://jf.example/Moonfin/Party/K7Q29M',
    );
  });

  test('the invite is the server\'s own link when it sends one, and Start '
      'carries where to begin', () async {
    final server = _Moonbase();
    final api = _api(server);
    await api.create('r1');
    final room = SiloRoom.fromJson({
      ..._room(),
      'invite_url': 'https://watch.example.com/Moonfin/Party/K7Q29M',
    });
    expect(
      api.inviteUri(room).toString(),
      'https://watch.example.com/Moonfin/Party/K7Q29M',
    );
    // Without one, the path joins the address this client uses.
    expect(
      api.inviteUri(SiloRoom.fromJson(_room())).toString(),
      'https://jf.example/Moonfin/Party/K7Q29M',
    );

    await api.start('r1', 'tok', atSeconds: 754);
    expect(server.requests.last.data, {'position_seconds': 754});
  });

  test('the room list comes newest first', () async {
    final rooms = await _api(_Moonbase()).rooms();
    expect(rooms.map((r) => r.roomId), ['new', 'old']);
    expect(rooms.first.hasPin, isTrue);
    expect(rooms.first.isPlaying, isTrue);
  });

  test('the long-poll delivers the snapshot, then what comes after the '
      'cursor, and ends when the room goes', () async {
    final server = _Moonbase();
    final api = _api(server);
    final channel = await api.connect('r1', 'tok');
    final got = <Map<String, dynamic>>[];
    final done = Completer<void>();
    channel.messages.listen(got.add, onDone: done.complete);

    await _settle();
    expect(got.map((m) => m['type']), ['snapshot', 'chat_history']);

    server.push([
      {'type': 'reaction', 'member_id': 'm-sam', 'reaction': 'fire'},
    ]);
    await _settle();
    expect(got.last['type'], 'reaction');
    final polls = server.requests
        .where((r) => r.uri.path.endsWith('/Events'))
        .map((r) => r.uri.queryParameters['cursor'])
        .toList();
    expect(polls.take(3), ['0', '2', '3']);
    expect(server.requests.last.uri.queryParameters['wait'], '25');

    // Two state reports queued behind a slow POST go as one, the newest.
    channel.send({'type': 'ping', 'client_sent_at': 'a'});
    channel.send({'type': 'state_report', 'position_seconds': 1});
    channel.send({'type': 'state_report', 'position_seconds': 2});
    await _settle();
    expect(server.posted.map((m) => m['type']), ['ping', 'state_report']);
    expect(server.posted.last['position_seconds'], 2);
    expect(got.last['type'], 'pong');

    server.closeRoom();
    await done.future;
    expect(got.last['type'], 'room_closed');
  });

  test('a dropped poll ends the channel, and the next one picks up from '
      'its cursor without waiting', () async {
    final server = _Moonbase();
    final api = _api(server);
    final first = await api.connect('r1', 'tok');
    final done = Completer<void>();
    final got = <String>[];
    first.messages.listen(
      (m) => got.add(m['type'] as String),
      onDone: done.complete,
    );
    await _settle();
    // The poll that's waiting gets this one, the next one fails.
    server.failNextPoll = true;
    server.push([
      {'type': 'reaction', 'member_id': 'm-sam', 'reaction': 'wow'},
    ]);
    await done.future;
    // A gateway error isn't the room ending.
    expect(got, ['snapshot', 'chat_history', 'reaction']);

    // Sent while nobody was polling.
    server.push([
      {'type': 'chat_history', 'messages': []},
      {'type': 'reaction', 'member_id': 'm-sam', 'reaction': 'fire'},
    ]);
    final eventsBefore = server.requests
        .where((r) => r.uri.path.endsWith('/Events'))
        .length;
    final again = await api.connect('r1', 'tok');
    final missed = <String>[];
    again.messages.listen((m) => missed.add(m['type'] as String));
    await _settle();
    final resumed = server.requests
        .where((r) => r.uri.path.endsWith('/Events'))
        .last;
    expect(missed, ['chat_history', 'reaction']);
    final reopen = server.requests
        .where((r) => r.uri.path.endsWith('/Events'))
        .elementAt(eventsBefore);
    expect(reopen.uri.queryParameters, {'cursor': '3', 'wait': '0'});
    expect(resumed.uri.queryParameters['wait'], '25');
    await again.close();
  });

  group('manager on Moonbase', () {
    late _Moonbase server;
    late SiloWatchPartyManager manager;
    late _Player player;

    setUp(() {
      server = _Moonbase();
      final client = JellyfinMediaServerClient(
        baseUrl: 'https://jf.example',
        deviceInfo: _device,
      )..accessToken = 'token';
      GetIt.instance.registerSingleton<MediaServerClient>(client);
      player = _Player();
      manager = SiloWatchPartyManager(player, dio: _dio(server));
    });

    tearDown(() async {
      manager.dispose();
      server.closeRoom();
      await GetIt.instance.reset();
    });

    test('knows the server hosts parties', () async {
      expect(await manager.availability(), WatchPartyService.moonbase);
      expect(manager.moonbaseAvailable, isTrue);
    });

    test('a room brings chat, reactions and toasts naming who', () async {
      final toasts = <WatchPartyToast>[];
      final reactions = <WatchPartyReaction>[];
      manager.toasts.listen(toasts.add);
      manager.reactions.listen(reactions.add);

      expect(await manager.create(), isTrue);
      await _settle();
      expect(manager.isMoonbase, isTrue);
      expect(manager.connected, isTrue);
      expect(manager.room?.code, 'K7Q29M');
      expect(manager.chat.single.text, 'everyone got snacks?');
      expect(
        manager.inviteUri.toString(),
        'https://jf.example/Moonfin/Party/K7Q29M',
      );

      server.push([
        {
          'type': 'notice',
          'kind': 'joined',
          'member_id': 'm-jordan',
          'display_name': 'Jordan',
        },
        {
          'type': 'chat',
          'message': {
            'id': 'c2',
            'member_id': 'm-jordan',
            'display_name': 'Jordan',
            'text': 'made it',
            'sent_at': '2026-11-09T21:06:00.000Z',
          },
        },
        {
          'type': 'reaction',
          'member_id': 'm-jordan',
          'display_name': 'Jordan',
          'reaction': 'haha',
        },
        // A repeat of a message already shown is dropped.
        {
          'type': 'chat',
          'message': {
            'id': 'c2',
            'member_id': 'm-jordan',
            'display_name': 'Jordan',
            'text': 'made it',
            'sent_at': '2026-11-09T21:06:00.000Z',
          },
        },
      ]);
      await _settle();
      expect(toasts.single.kind, WatchPartyToastKind.joined);
      expect(toasts.single.name, 'Jordan');
      expect(manager.chat.map((e) => e.notice?.kind ?? e.text), [
        'everyone got snacks?',
        WatchPartyToastKind.joined,
        'made it',
      ]);
      expect(reactions.single.reaction, 'haha');

      expect(manager.sendChat('  hi  '), isTrue);
      expect(manager.sendReaction('popcorn'), isTrue);
      expect(manager.sendReaction('thumbs'), isFalse);
      await _settle();
      expect(
        server.posted
            .where((m) => m['type'] == 'chat' || m['type'] == 'reaction')
            .toList(),
        [
          {'type': 'chat', 'text': 'hi'},
          {'type': 'reaction', 'reaction': 'popcorn'},
        ],
      );
    });

    test(
      'a member says it is ready in the lobby, and only on Moonbase',
      () async {
        expect(await manager.create(), isTrue);
        await _settle();
        // The snapshot showed this member in sync, not ready, so it reports.
        expect(server.posted.where((m) => m['type'] == 'state_report'), [
          {
            'type': 'state_report',
            'session_id': null,
            'position_seconds': 0,
            'is_paused': true,
            'status': 'ready',
          },
        ]);

        // Once per change: the same status again sends nothing, a new one does.
        Map<String, dynamic> showing(String status) => {
          ..._room(),
          'members': [
            {
              ..._room()['members'][0] as Map<String, dynamic>,
              'status': status,
            },
          ],
        };
        server.push([
          {'type': 'snapshot', 'room': showing('in_sync')},
        ]);
        await _settle();
        server.push([
          {'type': 'snapshot', 'room': showing('joining')},
        ]);
        await _settle();
        server.push([
          {'type': 'snapshot', 'room': showing('joining')},
        ]);
        await _settle();
        expect(
          server.posted.where((m) => m['type'] == 'state_report'),
          hasLength(2),
        );
      },
    );

    test('a guest hears who paused, and who ended the party', () async {
      final toasts = <WatchPartyToast>[];
      manager.toasts.listen(toasts.add);
      expect(await manager.join('k7q 29m'), isTrue);
      await _settle();
      expect(
        server.requests.firstWhere((r) => r.uri.path.endsWith('/Join')).data,
        {'code': 'K7Q29M'},
      );

      final at = DateTime.now().toUtc().add(const Duration(seconds: 30));
      server.push([
        {
          'type': 'transport_command',
          'command': {
            'command_id': 'x1',
            'generation': 1,
            'selection_revision': 1,
            'action': 'pause',
            'position_seconds': 10.0,
            'execute_at': at.toIso8601String(),
            'playback_state': 'paused',
            'by_member_id': 'm-maya',
            'by_display_name': 'Maya',
          },
        },
        {
          'type': 'transport_command',
          'command': {
            'command_id': 'x2',
            'generation': 1,
            'selection_revision': 1,
            'action': 'play',
            'position_seconds': 0.0,
            'execute_at': at.toIso8601String(),
            'playback_state': 'playing',
            'by_member_id': 'm-maya',
            'by_display_name': 'Maya',
            'countdown': true,
          },
        },
      ]);
      await _settle();
      expect(toasts.single.kind, WatchPartyToastKind.paused);
      expect(toasts.single.name, 'Maya');
      // The counted-down start shows a countdown, not a toast.
      expect(manager.countdownTo, isNotNull);

      server.push([
        {'type': 'room_closed', 'reason': 'closed'},
      ]);
      await _settle();
      expect(manager.room, isNull);
      expect(manager.endedReason, 'closed');
      expect(toasts.last.kind, WatchPartyToastKind.ended);
      expect(toasts.last.name, 'Maya');
    });

    test('a locked room asks for its PIN and keeps the reason', () async {
      server.requiredPin = '4321';
      expect(await manager.join('', roomId: 'r1'), isFalse);
      expect(manager.errorCode, 'pin_required');
      expect(await manager.join('', roomId: 'r1', pin: '1111'), isFalse);
      expect(manager.errorCode, 'wrong_pin');
      expect(await manager.join('', roomId: 'r1', pin: '4321'), isTrue);
      expect(manager.errorCode, isNull);
    });

    test('alerts only for rooms that start after the first look, while '
        'Party alerts is on', () async {
      SharedPreferences.setMockInitialValues({});
      final store = PreferenceStore();
      await store.init();
      final prefs = UserPreferences(store);
      final rooms = WatchPartyRoomsService(manager, prefs);
      addTearDown(rooms.dispose);
      final alerts = <MoonbaseRoomSummary>[];
      rooms.alerts.listen(alerts.add);

      await rooms.refresh();
      expect(rooms.rooms.map((r) => r.roomId), ['new', 'old']);
      expect(rooms.hasRooms, isTrue);

      Map<String, dynamic> started(String id) => {
        'room_id': id,
        'host_name': 'Priya',
        'member_count': 2,
        'selected_content_id': 'inception',
        'content_title': 'Inception',
        'created_at': '2026-11-09T22:00:00.000Z',
      };
      // Off by default.
      server.extraRooms.add(started('quiet'));
      await rooms.refresh();
      await prefs.set(UserPreferences.watchPartyAlerts, true);
      // Two at once announce only the newest, the one first in the row.
      server.extraRooms.add({
        ...started('older'),
        'created_at': '2026-11-09T21:59:00.000Z',
      });
      server.extraRooms.add(started('loud'));
      // A room this member is already in, or one with nothing picked, says
      // nothing, and neither does it once the member leaves.
      server.extraRooms.add({...started('mine'), 'is_member': true});
      server.extraRooms.add({...started('empty'), 'selected_content_id': null});
      await rooms.refresh();
      await _settle();
      expect(alerts.map((r) => r.roomId), ['loud']);
      server.extraRooms
        ..removeWhere((r) => r['room_id'] == 'mine')
        ..add(started('mine'));
      await rooms.refresh();
      await _settle();
      expect(alerts.map((r) => r.roomId), ['loud']);

      // A room this member was in, though no look happened meanwhile, says
      // nothing once the member leaves it either.
      expect(await manager.create(), isTrue);
      await _settle();
      manager.leave();
      await _settle();
      server.extraRooms.add(started('r1'));
      await rooms.refresh();
      await _settle();
      expect(alerts.map((r) => r.roomId), ['loud']);

      // The Watch Parties switch empties the list.
      await prefs.set(UserPreferences.syncPlayEnabled, false);
      await rooms.refresh();
      expect(rooms.hasRooms, isFalse);
    });

    bool isReady(Map<String, dynamic> m) =>
        m['type'] == 'state_report' && m['is_ready'] == true;

    test('ready waits until the player can start, and so does the waiting '
        'command', () async {
      expect(await manager.join('k7q 29m'), isTrue);
      await _settle();
      player.open('s1');
      server.push([
        {'type': 'snapshot', 'room': _playingRoom(playbackState: 'waiting')},
        _command('c-wait', 'seek', 'waiting', 30, DateTime.now()),
      ]);
      await Future<void>.delayed(const Duration(milliseconds: 1200));
      expect(server.posted.where(isReady), isEmpty);
      expect(player.calls, isEmpty);
      expect(server.posted.where((m) => m['type'] == 'state_report').last, {
        'type': 'state_report',
        'session_id': null,
        'position_seconds': 0,
        'is_paused': true,
        'status': 'joining',
      });

      player.load();
      await Future<void>.delayed(const Duration(milliseconds: 1200));
      expect(player.calls, ['seek']);
      expect(player.seeks.single, 30);
      final ready = server.posted.firstWhere(isReady);
      expect(ready['command_id'], 'c-wait');
      expect(ready['session_id'], 's1');
      expect(ready['status'], 'ready');
    });

    Future<DateTime> openLate() async {
      expect(await manager.join('k7q 29m'), isTrue);
      await _settle();
      final started = DateTime.now().subtract(const Duration(seconds: 10));
      server.push([
        {
          'type': 'snapshot',
          'room': _playingRoom(
            playbackState: 'playing',
            anchor: 100,
            anchorAt: started,
          ),
        },
        _command('c-play', 'play', 'playing', 100, started),
      ]);
      await _settle();
      player
        ..open('s1')
        ..load();
      while (!player.calls.contains('resume')) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      return started;
    }

    test(
      'a player opened after the play lines up from the anchor, once',
      () async {
        final started = await openLate();
        final elapsed =
            DateTime.now().difference(started).inMilliseconds / 1000;
        expect(player.calls, ['seek', 'resume']);
        expect(player.seeks.single, closeTo(100 + elapsed, 0.5));
        // The next report doesn't line it up again.
        await Future<void>.delayed(const Duration(milliseconds: 1600));
        expect(player.seeks, hasLength(1));

        // It says catching up while its seek lands, then nothing, so the
        // server judges from the position. It never claims to be in sync.
        await Future<void>.delayed(const Duration(milliseconds: 2400));
        final reports = server.posted
            .where(
              (m) => m['type'] == 'state_report' && m['session_id'] == 's1',
            )
            .toList();
        expect(reports.map((m) => m['status']), contains('catching_up'));
        expect(reports.last.containsKey('status'), isFalse);
        expect(reports.where((m) => m['status'] == 'in_sync'), isEmpty);
      },
    );

    Widget app(Widget home) {
      GetIt.instance.registerSingleton<SiloWatchPartyManager>(manager);
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: home),
      );
    }

    testWidgets('a Join on a room that took a PIN since the list loaded '
        'asks for it', (tester) async {
      server
        ..requiredPin = '4321'
        ..joinDelay = const Duration(milliseconds: 200);
      final room = MoonbaseRoomSummary.fromJson({
        'room_id': 'r1',
        'host_name': 'Maya',
        'member_count': 1,
        'selected_content_id': 'avatar',
      });
      expect(room.hasPin, isFalse);
      // The list is rebuilt without its tile while the join is out, as the
      // Watch Parties screen's can be.
      await tester.pumpWidget(
        app(
          ListenableBuilder(
            listenable: manager,
            builder: (context, _) => manager.busy || manager.error != null
                ? const Text('error')
                : Builder(
                    builder: (tile) => TextButton(
                      onPressed: () => joinListedRoom(tile, room),
                      child: const Text('Join'),
                    ),
                  ),
          ),
        ),
      );
      await tester.tap(find.text('Join'));
      await tester.pump();
      expect(find.text('Join'), findsNothing);
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 50));
      }
      final l10n = lookupAppLocalizations(const Locale('en'));
      expect(find.text(l10n.watchPartyRoomPin), findsOneWidget);
    });

    testWidgets('Down from the TV quick replies goes on to Type and the '
        'people, never straight to Leave', (tester) async {
      PlatformDetection.setTvMode(true);
      addTearDown(() => PlatformDetection.setTvMode(false));
      await tester.runAsync(() async {
        expect(await manager.join('k7q 29m'), isTrue);
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showWatchPartyPanel(context),
              child: const Text('Party'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Party'));
      await tester.pumpAndSettle();
      final l10n = lookupAppLocalizations(const Locale('en'));
      String? focused() {
        final context = FocusManager.instance.primaryFocus?.context;
        if (context == null) return null;
        String? text;
        void find(Element e) {
          if (text == null && e.widget is Text) {
            text = (e.widget as Text).data;
          }
          if (text == null) e.visitChildren(find);
        }

        context.visitChildElements(find);
        return text;
      }

      Focus.of(tester.element(find.text(l10n.watchPartyReplyBrb)))
          .requestFocus();
      await tester.pump();
      expect(focused(), l10n.watchPartyReplyBrb);
      final order = <String?>[];
      for (var i = 0; i < 4; i++) {
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();
        order.add(focused());
      }
      expect(order.take(2), [l10n.watchPartyReplyAgain, l10n.watchPartyType]);
      expect(order.first, isNot(contains(l10n.watchPartyLeave)));
    });

    List<String> transport(_Player player) =>
        player.calls.where((c) => c != 'rate').toList();

    test('a guest who can\'t control playback hears so, and its player '
        'stays as it was', () async {
      final toasts = <WatchPartyToast>[];
      manager.toasts.listen(toasts.add);
      await openLate();
      final before = transport(player);
      expect(await player.interceptor!(TransportAction.pause), isTrue);
      await _settle();
      expect(toasts.last.kind, WatchPartyToastKind.hostOnly);
      expect(transport(player), before);
      expect(
        server.posted.where((m) => m['type'] == 'transport_request'),
        isEmpty,
      );
    });

    test('a pause stops the player, then puts it on the paused spot', () async {
      await openLate();
      final at = player.state.position.inMilliseconds / 1000;
      server.push([
        _command('c-pause', 'pause', 'paused', at - 0.5, DateTime.now()),
      ]);
      while (!player.calls.contains('pause')) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
      expect(transport(player), ['seek', 'resume', 'pause', 'seek']);
      expect(player.seeks.last, closeTo(at - 0.5, 0.01));

      // Within 0.3 s of the next pause's spot, it stays put.
      server.push([
        _command('c-pause-2', 'pause', 'paused', at - 0.3, DateTime.now()),
      ]);
      await Future<void>.delayed(const Duration(milliseconds: 400));
      expect(transport(player), ['seek', 'resume', 'pause', 'seek']);
    });

    test('a player that stalls and then fails reports not watching', () async {
      expect(await manager.join('k7q 29m'), isTrue);
      await _settle();
      server.push([
        {
          'type': 'snapshot',
          'room': _playingRoom(
            playbackState: 'playing',
            anchor: 0,
            anchorAt: DateTime.now(),
          ),
        },
      ]);
      await _settle();
      // Still opening, then stalled past the grace.
      player.open('s1');
      player.state.setBuffering(true);
      while (!server.posted.any((m) => m['type'] == 'buffering')) {
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }
      // The player gives up and closes, its session left behind.
      player.bringupState = const PlaybackBringupState(
        phase: PlaybackBringupPhase.failed,
      );
      await Future<void>.delayed(const Duration(milliseconds: 2200));
      expect(server.posted.last, {
        'type': 'state_report',
        'session_id': null,
        'position_seconds': 0,
        'is_paused': true,
        'status': 'not_watching',
      });
    });

    test(
      'a player behind with little buffered seeks back to the room',
      () async {
        final started = await openLate();
        double expected() =>
            100 + DateTime.now().difference(started).inMilliseconds / 1000;
        final behind = Duration(
          milliseconds: ((expected() - 3) * 1000).round(),
        );
        player.state
          ..setBuffer(behind + const Duration(seconds: 2))
          ..setPosition(behind);
        for (var i = 0; i < 60 && player.seeks.length < 2; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 50));
        }
        expect(player.seeks, hasLength(2));
        expect(player.seeks.last, closeTo(expected(), 0.5));
        expect(player.calls, isNot(contains('rate')));
      },
    );

    test('leaving tells the room, so the next member takes over', () async {
      expect(await manager.create(), isTrue);
      await _settle();
      manager.leave();
      await _settle();
      expect(manager.room, isNull);
      expect(
        server.requests.where((r) => r.uri.path.endsWith('/Leave')),
        hasLength(1),
      );
    });
  });
}
