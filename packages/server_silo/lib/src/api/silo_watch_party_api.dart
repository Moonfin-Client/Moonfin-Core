import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

/// One member of a Watch Party room, as the room socket lists them.
class SiloRoomMember {
  const SiloRoomMember({
    required this.profileId,
    required this.displayName,
    required this.isHost,
    required this.isSelf,
    required this.connected,
  });

  factory SiloRoomMember.fromJson(Map<String, dynamic> json) => SiloRoomMember(
    profileId: json['profile_id'] as String? ?? '',
    displayName: json['display_name'] as String? ?? '',
    isHost: json['is_host'] == true,
    isSelf: json['is_self'] == true,
    connected: json['connected'] == true,
  );

  /// Silo's profile id, which is Moonfin's user id for the profile.
  final String profileId;
  final String displayName;
  final bool isHost;
  final bool isSelf;
  final bool connected;
}

/// A Watch Party room snapshot (`WatchTogetherRoomSnapshot`), as the room
/// HTTP routes and the room socket's `snapshot` frame send it.
class SiloRoom {
  const SiloRoom({
    required this.roomId,
    required this.phase,
    required this.playbackState,
    required this.selectionMode,
    required this.selectionRevision,
    required this.selectedContentId,
    required this.selectedFileId,
    required this.code,
    required this.guestControlPolicy,
    required this.isPaused,
    required this.anchorPositionSeconds,
    required this.generation,
    required this.isHost,
    required this.canControlTransport,
    required this.attachedSessionId,
    required this.invitePath,
    required this.members,
  });

  factory SiloRoom.fromJson(Map<String, dynamic> json) {
    final selected = json['selected_content_id'];
    final file = json['selected_file_id'];
    final attached = json['attached_session_id'];
    return SiloRoom(
      roomId: json['room_id'] as String? ?? '',
      phase: json['phase'] as String? ?? 'lobby',
      playbackState: json['playback_state'] as String? ?? 'idle',
      selectionMode: json['selection_mode'] as String? ?? 'host_pick',
      selectionRevision: (json['selection_revision'] as num?)?.toInt() ?? 0,
      selectedContentId: selected is String && selected.isNotEmpty
          ? selected
          : null,
      selectedFileId: file is num || (file is String && file.isNotEmpty)
          ? '$file'
          : null,
      code: json['code'] as String? ?? '',
      guestControlPolicy:
          json['guest_control_policy'] as String? ?? 'host_only',
      isPaused: json['is_paused'] != false,
      anchorPositionSeconds:
          (json['anchor_position_seconds'] as num?)?.toDouble() ?? 0,
      generation: (json['generation'] as num?)?.toInt() ?? 0,
      isHost: json['self_role'] == 'host',
      canControlTransport: json['self_can_control_transport'] == true,
      attachedSessionId: attached is String && attached.isNotEmpty
          ? attached
          : null,
      invitePath: switch (json['invite_path']) {
        final String path when path.isNotEmpty => path,
        _ => null,
      },
      members: [
        for (final m in json['members'] as List? ?? const [])
          if (asJsonMap(m) case final member?) SiloRoomMember.fromJson(member),
      ],
    );
  }

  final String roomId;

  /// `lobby`, `playing` or `ended`.
  final String phase;

  /// `idle`, `waiting`, `paused` or `playing`.
  final String playbackState;

  /// `host_pick` or `vote`.
  final String selectionMode;

  /// The playback epoch: advances when playback starts, restarts or stops.
  final int selectionRevision;

  /// The staged or playing item, a Silo content id (Moonfin's item id).
  final String? selectedContentId;

  /// The file the room pins, when it pins one (Moonfin's media source id).
  /// A session playing another file is refused.
  final String? selectedFileId;

  /// What guests type to join.
  final String code;

  /// `host_only` or `guest_play_pause`.
  final String guestControlPolicy;
  final bool isPaused;
  final double anchorPositionSeconds;

  /// Orders snapshots: an older one never replaces a newer one.
  final int generation;
  final bool isHost;
  final bool canControlTransport;

  /// The playback session the server has attached for this viewer.
  final String? attachedSessionId;

  /// `/rooms/join?token=…`, sent to the host only.
  final String? invitePath;

  /// Host first.
  final List<SiloRoomMember> members;

  bool get isPlaying => phase == 'playing';
  bool get isVoting => selectionMode == 'vote';
  bool get isStaged => phase == 'lobby' && selectedContentId != null;
}

/// A room `transport_command`: what every attached player does, and when.
class SiloRoomCommand {
  const SiloRoomCommand({
    required this.commandId,
    required this.sessionId,
    required this.selectionRevision,
    required this.action,
    required this.positionSeconds,
    required this.executeAt,
    required this.playbackState,
  });

  static SiloRoomCommand? fromJson(Map<String, dynamic> json) {
    final id = json['command_id'];
    final executeAt = DateTime.tryParse(json['execute_at'] as String? ?? '');
    if (id is! String || id.isEmpty || executeAt == null) return null;
    final session = json['session_id'];
    return SiloRoomCommand(
      commandId: id,
      sessionId: session is String && session.isNotEmpty ? session : null,
      selectionRevision: (json['selection_revision'] as num?)?.toInt() ?? 0,
      action: json['action'] as String? ?? '',
      positionSeconds: (json['position_seconds'] as num?)?.toDouble() ?? 0,
      executeAt: executeAt,
      playbackState: json['playback_state'] as String? ?? '',
    );
  }

  final String commandId;

  /// Set when the command is meant for one viewer's session only.
  final String? sessionId;
  final int selectionRevision;

  /// `play`, `pause` or `seek`.
  final String action;

  /// The room's position at [executeAt].
  final double positionSeconds;

  /// Server time.
  final DateTime executeAt;

  /// The room's playback state once the command has run.
  final String playbackState;
}

/// A title put up for a vote in a vote room.
class SiloRoomSuggestion {
  const SiloRoomSuggestion({
    required this.id,
    required this.contentId,
    required this.title,
    required this.subtitle,
    required this.voteCount,
    required this.votedByMe,
    required this.createdAt,
  });

  static SiloRoomSuggestion? fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final contentId = json['content_id'];
    if (id is! String || contentId is! String) return null;
    return SiloRoomSuggestion(
      id: id,
      contentId: contentId,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
      votedByMe: json['voted_by_me'] == true,
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  final String id;
  final String contentId;
  final String title;
  final String subtitle;
  final int voteCount;

  /// Only an HTTP read says this; socket broadcasts always send false.
  final bool votedByMe;
  final DateTime createdAt;

  SiloRoomSuggestion withVote(bool voted) => SiloRoomSuggestion(
    id: id,
    contentId: contentId,
    title: title,
    subtitle: subtitle,
    voteCount: voteCount,
    votedByMe: voted,
    createdAt: createdAt,
  );

  /// The room's order: most votes first, then oldest.
  static int compare(SiloRoomSuggestion a, SiloRoomSuggestion b) {
    final votes = b.voteCount.compareTo(a.voteCount);
    if (votes != 0) return votes;
    final age = a.createdAt.compareTo(b.createdAt);
    return age != 0 ? age : a.id.compareTo(b.id);
  }
}

/// A room and the proof of membership its routes and socket ticket ask for
/// (`X-Room-Token`).
class SiloRoomAccess {
  const SiloRoomAccess(this.room, this.token);

  final SiloRoom room;
  final String token;
}

/// Silo's Watch Party (`/api/v2/watch-together`). Rooms are joined with a
/// code; the room socket (`silo.room.v2`) carries snapshots and transport
/// commands. Not a Moonfin interface: Jellyfin's SyncPlay works differently.
class SiloWatchPartyApi {
  SiloWatchPartyApi(this._dio, {required String Function() baseUrl})
    : _baseUrl = baseUrl;

  final Dio _dio;
  final String Function() _baseUrl;

  static const socketProtocol = 'silo.room.v2';

  /// Whether this server and login may use Watch Party rooms with the v2
  /// socket.
  Future<bool> available() async {
    final json = asJsonMap(
      (await _dio.get<dynamic>('/api/v2/watch-together/capabilities')).data,
    );
    return json?['state'] == 'available' &&
        json?['allowed'] == true &&
        json?['socket_protocol'] == socketProtocol;
  }

  /// `POST /rooms`: a host-pick room. [roomId] is a UUID the caller picks,
  /// so a retry after an uncertain result gets the same room back.
  Future<SiloRoomAccess> create(String roomId) => _access(
    _dio.post<dynamic>(
      '/api/v2/watch-together/rooms',
      data: {'room_id': roomId, 'selection_mode': 'host_pick'},
    ),
  );

  /// Joins with what a member typed or pasted: a room code, or an invite
  /// link or its token.
  Future<SiloRoomAccess> join(String input) {
    final text = input.trim();
    final token =
        Uri.tryParse(text)?.queryParameters['token'] ??
        // Codes are eight characters; invite tokens are longer.
        (text.length > 12 ? text : null);
    return _access(
      _dio.post<dynamic>(
        '/api/v2/watch-together/join',
        data: token != null
            ? {'join_token': token}
            : {'code': text.toUpperCase()},
      ),
    );
  }

  /// The full invite link for a room's `invite_path` (hosts only get one).
  /// It opens the room in Silo's web app; Moonfin takes it in the join box.
  Uri inviteUri(String invitePath) => Uri.parse(_baseUrl()).resolve(invitePath);

  /// Host only: stage [contentId] in the lobby without starting it.
  Future<SiloRoom> stage(String roomId, String contentId) => _room(
    _dio.put<dynamic>(
      '/api/v2/watch-together/rooms/$roomId/staged-selection',
      data: {'content_id': contentId},
    ),
  );

  /// Host only: start the staged item for everyone.
  Future<SiloRoom> start(String roomId) => _room(
    _dio.post<dynamic>('/api/v2/watch-together/rooms/$roomId/playback/start'),
  );

  /// Host only: back to the lobby, keeping the item staged.
  Future<SiloRoom> stop(String roomId) => _room(
    _dio.post<dynamic>('/api/v2/watch-together/rooms/$roomId/playback/stop'),
  );

  /// Host only.
  Future<SiloRoom> setGuestsCanPause(String roomId, bool allowed) => _room(
    _dio.patch<dynamic>(
      '/api/v2/watch-together/rooms/$roomId/policy',
      data: {
        'guest_control_policy': allowed ? 'guest_play_pause' : 'host_only',
      },
    ),
  );

  /// Host only, in the lobby: whether members vote on what to watch
  /// (`vote`) or the host picks (`host_pick`). Drops anything staged.
  Future<SiloRoom> setVoting(String roomId, bool voting) => _room(
    _dio.patch<dynamic>(
      '/api/v2/watch-together/rooms/$roomId/selection-mode',
      data: {'selection_mode': voting ? 'vote' : 'host_pick'},
    ),
  );

  /// Every suggestion in the room, in the room's order.
  Future<List<SiloRoomSuggestion>> suggestions(
    String roomId,
    String roomToken,
  ) async {
    final out = <SiloRoomSuggestion>[];
    String? cursor;
    // At most 200 suggestions in a room, so two pages of 100.
    for (var page = 0; page < 5; page++) {
      final response = await _dio.get<dynamic>(
        '/api/v2/watch-together/rooms/$roomId/suggestions',
        queryParameters: {'limit': 100, 'cursor': ?cursor},
        options: Options(headers: {'X-Room-Token': roomToken}),
      );
      final json = asJsonMap(response.data);
      for (final row in json?['items'] as List? ?? const []) {
        if (asJsonMap(row) case final map?) {
          if (SiloRoomSuggestion.fromJson(map) case final s?) out.add(s);
        }
      }
      final next = asJsonMap(json?['page']);
      if (next?['has_more'] != true) break;
      cursor = next?['next_cursor'] as String?;
      if (cursor == null) break;
    }
    return out..sort(SiloRoomSuggestion.compare);
  }

  /// Puts a movie up for the vote. [suggestionId] is a UUID the caller
  /// picks, so a retry is recognised.
  Future<void> suggest(
    String roomId,
    String roomToken, {
    required String suggestionId,
    required String contentId,
    required String title,
    String? subtitle,
  }) => _dio.post<dynamic>(
    '/api/v2/watch-together/rooms/$roomId/suggestions',
    data: {
      'suggestion_id': suggestionId,
      'content_id': contentId,
      'content_type': 'movie',
      'title': title,
      if (subtitle != null && subtitle.isNotEmpty) 'subtitle': subtitle,
    },
    options: Options(headers: {'X-Room-Token': roomToken}),
  );

  Future<void> vote(
    String roomId,
    String roomToken,
    String suggestionId,
    bool voted,
  ) {
    final path =
        '/api/v2/watch-together/rooms/$roomId/suggestions/$suggestionId/vote';
    final options = Options(headers: {'X-Room-Token': roomToken});
    return voted
        ? _dio.post<dynamic>(path, options: options)
        : _dio.delete<dynamic>(path, options: options);
  }

  Future<void> removeSuggestion(
    String roomId,
    String roomToken,
    String suggestionId,
  ) => _dio.delete<dynamic>(
    '/api/v2/watch-together/rooms/$roomId/suggestions/$suggestionId',
    options: Options(headers: {'X-Room-Token': roomToken}),
  );

  /// Host only: plays [suggestionId] for everyone, whatever the tally.
  Future<SiloRoom> promote(
    String roomId,
    String roomToken,
    String suggestionId,
  ) => _room(
    _dio.post<dynamic>(
      '/api/v2/watch-together/rooms/$roomId/suggestions/promote',
      data: {'suggestion_id': suggestionId},
      options: Options(headers: {'X-Room-Token': roomToken}),
    ),
  );

  /// Host only: ends the room for everyone.
  Future<void> close(String roomId) =>
      _dio.delete<dynamic>('/api/v2/watch-together/rooms/$roomId');

  /// One handshake's credential (single use, at most 30 seconds). Never put
  /// in the URL; it rides in the offered protocols.
  Future<String> socketTicket(String roomId, String roomToken) async {
    final response = await _dio.post<dynamic>(
      '/api/v2/watch-together/rooms/$roomId/ws-ticket',
      options: Options(headers: {'X-Room-Token': roomToken}),
    );
    final json = asJsonMap(response.data);
    final ticket = json?['ticket'];
    if (ticket is! String ||
        ticket.isEmpty ||
        json?['protocol'] != socketProtocol) {
      throw const FormatException('Silo sent no room socket ticket');
    }
    return ticket;
  }

  /// The room socket's URL. The port is always written out, as for the
  /// events socket: `dart:io` connects a `wss://` URL without one to port 0.
  Uri socketUri(String roomId) {
    final base = Uri.parse(_baseUrl());
    final path = base.path.endsWith('/')
        ? base.path.substring(0, base.path.length - 1)
        : base.path;
    return base.replace(
      scheme: base.scheme == 'https' ? 'wss' : 'ws',
      port: base.port,
      path: '$path/api/v2/watch-together/rooms/$roomId/ws',
    );
  }

  Future<SiloRoomAccess> _access(Future<Response<dynamic>> request) async {
    final json = asJsonMap((await request).data);
    final room = asJsonMap(json?['room']);
    final token = json?['room_access_token'];
    if (room == null || token is! String || token.isEmpty) {
      throw const FormatException('Expected a Watch Party room from Silo');
    }
    return SiloRoomAccess(SiloRoom.fromJson(room), token);
  }

  Future<SiloRoom> _room(Future<Response<dynamic>> request) async {
    final room = asJsonMap(asJsonMap((await request).data)?['room']);
    if (room == null) {
      throw const FormatException('Expected a Watch Party room from Silo');
    }
    return SiloRoom.fromJson(room);
  }
}
