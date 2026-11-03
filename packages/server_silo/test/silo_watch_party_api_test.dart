import 'dart:convert';

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

// A room socket snapshot as a test server sent it, names changed.
const _snapshot = {
  'room_id': '31366623-4606-488f-b5c0-c837c80d0227',
  'phase': 'playing',
  'playback_state': 'waiting',
  'selection_mode': 'host_pick',
  'selection_revision': 2,
  'selected_content_id': 'movie-41',
  'selected_file_id': 77,
  'code': 'L2NVBPNE',
  'guest_control_policy': 'host_only',
  'is_paused': true,
  'anchor_position_seconds': 12.5,
  'anchor_updated_at': '2026-10-29T23:00:14Z',
  'generation': 5,
  'member_count': 2,
  'host_connected': true,
  'self_role': 'guest',
  'self_can_control_transport': false,
  'self_can_manage_room': false,
  'self_ignore_wait': false,
  'attached_session_id': 'ps_1',
  'invite_path': '/rooms/join?token=WSNKCQ47AFFJYGXRUF39NQE3',
  'members': [
    {
      'user_id': 2,
      'profile_id': 'p1',
      'display_name': 'Host',
      'is_host': true,
      'is_self': false,
      'connected': true,
      'lobby_ready': false,
    },
    {
      'user_id': 3,
      'profile_id': 'p2',
      'display_name': 'Guest',
      'is_host': false,
      'is_self': true,
      'connected': false,
      'lobby_ready': false,
    },
  ],
};

void main() {
  test('reads a room snapshot', () {
    final room = SiloRoom.fromJson(_snapshot);
    expect(room.isPlaying, isTrue);
    expect(room.isStaged, isFalse);
    expect(room.playbackState, 'waiting');
    expect(room.selectionRevision, 2);
    expect(room.selectedContentId, 'movie-41');
    expect(room.selectedFileId, '77');
    expect(room.anchorPositionSeconds, 12.5);
    expect(room.isHost, isFalse);
    expect(room.canControlTransport, isFalse);
    expect(room.attachedSessionId, 'ps_1');
    expect(room.members.map((m) => m.displayName), ['Host', 'Guest']);
    expect(room.members.last.connected, isFalse);
  });

  test('a lobby with a selection is staged', () {
    final room = SiloRoom.fromJson({
      ..._snapshot,
      'phase': 'lobby',
      'playback_state': 'idle',
    });
    expect(room.isStaged, isTrue);
    expect(
      SiloRoom.fromJson(
        {..._snapshot, 'phase': 'lobby'}..remove('selected_content_id'),
      ).isStaged,
      isFalse,
    );
  });

  test('reads a transport command and refuses one without an id', () {
    final command = SiloRoomCommand.fromJson({
      'command_id': 'c1',
      'session_id': 'ps_1',
      'selection_revision': 2,
      'action': 'seek',
      'position_seconds': 30,
      'execute_at': '2026-10-29T23:00:15.250Z',
      'issued_at': '2026-10-29T23:00:14.750Z',
      'playback_state': 'waiting',
    })!;
    expect(command.positionSeconds, 30.0);
    expect(command.sessionId, 'ps_1');
    expect(command.executeAt, DateTime.utc(2026, 10, 29, 23, 0, 15, 250));
    expect(SiloRoomCommand.fromJson({'action': 'play'}), isNull);
  });

  test('create and join send what Silo expects and keep the proof', () async {
    final server = FixtureServer({
      '/api/v2/watch-together/rooms': (_) => FixtureServer.json(
        201,
        jsonEncode({'room': _snapshot, 'room_access_token': 'proof'}),
      ),
      '/api/v2/watch-together/join': (_) => FixtureServer.json(
        200,
        jsonEncode({'room': _snapshot, 'room_access_token': 'proof2'}),
      ),
    });
    final api = _client(server).watchPartyApi;
    final created = await api.create('room-uuid');
    expect(created.token, 'proof');
    final joined = await api.join(' l2nvbpne ');
    expect(joined.token, 'proof2');
    expect(server.requests.first.data, {
      'room_id': 'room-uuid',
      'selection_mode': 'host_pick',
    });
    expect(server.requests.last.data, {'code': 'L2NVBPNE'});
    expect(server.requests.last.headers['X-Profile-Id'], isNotNull);
  });

  test('a ticket rides on the room proof and must be v2', () async {
    const path = '/api/v2/watch-together/rooms/r1/ws-ticket';
    final server = FixtureServer({
      path: (_) => FixtureServer.json(
        200,
        '{"ticket":"t","expires_in":29,"max_connection_seconds":300,'
        '"protocol":"silo.room.v2"}',
      ),
    });
    final api = _client(server).watchPartyApi;
    expect(await api.socketTicket('r1', 'proof'), 't');
    expect(server.requests.single.headers['X-Room-Token'], 'proof');

    final old = FixtureServer({
      path: (_) =>
          FixtureServer.json(200, '{"ticket":"t","protocol":"silo.room.v1"}'),
    });
    expect(
      _client(old).watchPartyApi.socketTicket('r1', 'proof'),
      throwsFormatException,
    );
  });

  test('the socket URL writes out the port', () {
    final uri = _client(FixtureServer({})).watchPartyApi.socketUri('r1');
    expect(
      uri.toString(),
      'wss://silo.example:443/api/v2/watch-together/rooms/r1/ws',
    );
    final local = _client(
      FixtureServer({}),
      baseUrl: 'http://10.0.0.2:8090/silo/',
    ).watchPartyApi.socketUri('r1');
    expect(
      local.toString(),
      'ws://10.0.0.2:8090/silo/api/v2/watch-together/rooms/r1/ws',
    );
  });

  test('reads the vote list across pages, most votes first', () async {
    const path = '/api/v2/watch-together/rooms/r1/suggestions';
    Map<String, Object?> row(String id, int votes, String at) => {
      'id': id,
      'room_id': 'r1',
      'suggester_user_id': '2',
      'suggester_profile_id': 'p1',
      'content_id': 'movie-$id',
      'content_type': 'movie',
      'title': 'Title $id',
      'subtitle': '2014',
      'poster_url': '',
      'note': '',
      'vote_count': votes,
      'voted_by_me': id == 'b',
      'created_at': at,
    };
    final server = FixtureServer({
      path: (options) => FixtureServer.json(
        200,
        jsonEncode(
          options.uri.queryParameters['cursor'] == null
              ? {
                  'items': [row('a', 0, '2026-10-29T23:00:00Z')],
                  'page': {'has_more': true, 'next_cursor': 'c2'},
                }
              : {
                  'items': [
                    row('b', 2, '2026-10-29T23:01:00Z'),
                    row('c', 0, '2026-10-29T22:59:00Z'),
                  ],
                  'page': {'has_more': false},
                },
        ),
      ),
    });
    final list = await _client(server).watchPartyApi.suggestions('r1', 'proof');
    expect(list.map((s) => s.id), ['b', 'c', 'a']);
    expect(list.first.votedByMe, isTrue);
    expect(list.first.withVote(false).votedByMe, isFalse);
    expect(server.requests.last.uri.queryParameters['cursor'], 'c2');
    expect(server.requests.first.headers['X-Room-Token'], 'proof');
  });

  test('a vote is a POST and taking it back a DELETE', () async {
    const path = '/api/v2/watch-together/rooms/r1/suggestions/s1/vote';
    final server = FixtureServer({path: (_) => FixtureServer.json(204, '')});
    final api = _client(server).watchPartyApi;
    await api.vote('r1', 'proof', 's1', true);
    await api.vote('r1', 'proof', 's1', false);
    expect(server.requests.map((r) => r.method), ['POST', 'DELETE']);
  });

  test('joins with a code, an invite link or its token', () async {
    final server = FixtureServer({
      '/api/v2/watch-together/join': (_) => FixtureServer.json(
        200,
        jsonEncode({'room': _snapshot, 'room_access_token': 'proof'}),
      ),
    });
    final api = _client(server).watchPartyApi;
    await api.join(' l2nvbpne ');
    await api.join(
      'https://silo.example/rooms/join?token=WSNKCQ47AFFJYGXRUF39NQE3',
    );
    await api.join('WSNKCQ47AFFJYGXRUF39NQE3');
    expect(server.requests.map((r) => r.data), [
      {'code': 'L2NVBPNE'},
      {'join_token': 'WSNKCQ47AFFJYGXRUF39NQE3'},
      {'join_token': 'WSNKCQ47AFFJYGXRUF39NQE3'},
    ]);
  });

  test('the invite link is the server address and the room\'s path', () {
    final api = _client(
      FixtureServer({}),
      baseUrl: 'https://silo.example/silo/',
    ).watchPartyApi;
    expect(
      api.inviteUri('/rooms/join?token=T').toString(),
      'https://silo.example/rooms/join?token=T',
    );
    expect(
      SiloRoom.fromJson(_snapshot).invitePath,
      '/rooms/join?token=WSNKCQ47AFFJYGXRUF39NQE3',
    );
  });
}
