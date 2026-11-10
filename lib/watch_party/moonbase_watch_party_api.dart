import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../data/services/moonbase_endpoint.dart';
import 'watch_party_backend.dart';

/// What `GET /Moonfin/WatchParty/Config` says this Moonbase allows.
class MoonbaseWatchPartyConfig {
  const MoonbaseWatchPartyConfig({
    required this.enabled,
    this.alerts = true,
    this.everyoneControlAllowed = true,
  });

  factory MoonbaseWatchPartyConfig.fromJson(Map<String, dynamic> json) =>
      MoonbaseWatchPartyConfig(
        enabled: json['enabled'] == true,
        alerts: json['alerts'] != false,
        everyoneControlAllowed: json['everyone_control_allowed'] != false,
      );

  final bool enabled;
  final bool alerts;
  final bool everyoneControlAllowed;
}

/// One room in `GET /Rooms`. It carries no code: a listed room is joined by
/// its id, plus the PIN when it has one.
class MoonbaseRoomSummary {
  const MoonbaseRoomSummary({
    required this.roomId,
    required this.hostName,
    required this.memberCount,
    required this.phase,
    required this.playbackState,
    required this.positionSeconds,
    this.selectionMode = 'host_pick',
    required this.selectedContentId,
    required this.contentTitle,
    required this.contentType,
    required this.seriesName,
    required this.season,
    required this.episode,
    required this.hasPin,
    required this.guestControlPolicy,
    required this.isMember,
    required this.createdAt,
  });

  factory MoonbaseRoomSummary.fromJson(Map<String, dynamic> json) {
    String? text(String key) {
      final value = json[key];
      return value is String && value.isNotEmpty ? value : null;
    }

    return MoonbaseRoomSummary(
      roomId: text('room_id') ?? '',
      hostName: text('host_name') ?? '',
      memberCount: (json['member_count'] as num?)?.toInt() ?? 0,
      phase: text('phase') ?? 'lobby',
      playbackState: text('playback_state') ?? 'idle',
      positionSeconds: (json['position_seconds'] as num?)?.toDouble() ?? 0,
      selectionMode: text('selection_mode') ?? 'host_pick',
      selectedContentId: text('selected_content_id'),
      contentTitle: text('content_title'),
      contentType: text('content_type'),
      seriesName: text('series_name'),
      season: (json['season'] as num?)?.toInt(),
      episode: (json['episode'] as num?)?.toInt(),
      hasPin: json['has_pin'] == true,
      guestControlPolicy: text('guest_control_policy') ?? 'host_only',
      isMember: json['is_member'] == true,
      createdAt:
          DateTime.tryParse(text('created_at') ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  final String roomId;
  final String hostName;
  final int memberCount;
  final String phase;
  final String playbackState;
  final double positionSeconds;

  /// `host_pick` or `vote`.
  final String selectionMode;
  final String? selectedContentId;
  final String? contentTitle;
  final String? contentType;
  final String? seriesName;
  final int? season;
  final int? episode;
  final bool hasPin;
  final String guestControlPolicy;
  final bool isMember;
  final DateTime createdAt;

  bool get isPlaying => phase == 'playing';
}

/// Moonbase's watch parties (`<moonbase>/Moonfin/WatchParty`) on Jellyfin,
/// Emby and Plex. Room calls carry the member's room token, and the server
/// talks back over a long-poll, so it works behind any proxy and on players
/// that can't hold a socket.
class MoonbaseWatchPartyApi implements WatchPartyBackend {
  MoonbaseWatchPartyApi(this._dio, this._endpoint);

  /// For [client]'s Moonbase, found the way every other Moonbase call is.
  factory MoonbaseWatchPartyApi.forClient(MediaServerClient client, Dio dio) =>
      MoonbaseWatchPartyApi(dio, () => moonbaseEndpoint(client, dio));

  final Dio _dio;
  final Future<MoonbaseEndpoint?> Function() _endpoint;
  final Logger _logger = Logger();

  /// The last base an answer came from, for invite links.
  String? _base;

  /// The newest message each room's long-poll has seen, so a dropped poll
  /// picks up where it left off and gets what it missed.
  final Map<String, int> _cursors = {};

  static const roomTokenHeader = 'X-Moonfin-Room-Token';

  /// The server caps a poll's wait at this many seconds.
  static const pollWaitSeconds = 25;
  static const _pollTimeout = Duration(seconds: 35);

  /// The `code` of a Moonbase error answer, like `wrong_pin` or `full`.
  static String? errorCode(Object error) {
    if (error is! DioException) return null;
    final data = error.response?.data;
    final code = data is Map ? data['code'] : null;
    return code is String && code.isNotEmpty ? code : null;
  }

  /// Turns what a member typed or pasted into a room code: an invite link
  /// (`.../Moonfin/Party/K7Q29M`), a `moonfin://party` link, or the code
  /// itself in any case, with spaces and dashes.
  static String codeFrom(String input) {
    final text = input.trim();
    final uri = Uri.tryParse(text);
    if (uri != null && uri.hasScheme) {
      final fromQuery = uri.queryParameters['code'];
      if (fromQuery != null && fromQuery.isNotEmpty) {
        return codeFrom(fromQuery);
      }
      final segments = uri.pathSegments;
      final at = segments.indexWhere((s) => s.toLowerCase() == 'party');
      if (at >= 0 && at + 1 < segments.length) {
        return codeFrom(segments[at + 1]);
      }
    }
    return text.replaceAll(RegExp(r'[\s-]'), '').toUpperCase();
  }

  /// A code as people read it out: `K7Q 29M`.
  static String displayCode(String code) =>
      code.length == 6 ? '${code.substring(0, 3)} ${code.substring(3)}' : code;

  @override
  bool get isMoonbase => true;

  Future<MoonbaseEndpoint> _resolve() async {
    final ep = await _endpoint();
    if (ep == null) {
      throw const FormatException('This server has no Moonbase');
    }
    _base = ep.base;
    return ep;
  }

  Future<dynamic> _call(
    String method,
    String path, {
    String? token,
    Object? data,
    Map<String, dynamic>? query,
    CancelToken? cancel,
    Duration? receiveTimeout,
  }) async {
    final ep = await _resolve();
    final response = await _dio.request<dynamic>(
      '${ep.base}/Moonfin/WatchParty$path',
      data: data,
      queryParameters: query,
      cancelToken: cancel,
      options: Options(
        method: method,
        headers: {...ep.headers, roomTokenHeader: ?token},
        receiveTimeout: receiveTimeout,
      ),
    );
    return response.data;
  }

  /// Null when this Moonbase can't host parties (an older one answers 404).
  Future<MoonbaseWatchPartyConfig?> config() async {
    try {
      final json = asJsonMap(await _call('GET', '/Config'));
      return json == null ? null : MoonbaseWatchPartyConfig.fromJson(json);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  /// The rooms this user can watch, newest first.
  Future<List<MoonbaseRoomSummary>> rooms() async {
    final json = asJsonMap(await _call('GET', '/Rooms'));
    return [
      for (final row in json?['rooms'] as List? ?? const [])
        if (asJsonMap(row) case final map?) MoonbaseRoomSummary.fromJson(map),
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<SiloRoomAccess> create(String roomId, {String? pin}) async => _access(
    await _call('POST', '/Rooms', data: {'room_id': roomId, 'pin': ?pin}),
  );

  @override
  Future<SiloRoomAccess> join(
    String input, {
    String? roomId,
    String? pin,
  }) async => _access(
    await _call(
      'POST',
      '/Join',
      data: {
        if (roomId != null) 'room_id': roomId else 'code': codeFrom(input),
        'pin': ?pin,
      },
    ),
  );

  @override
  Future<SiloRoom> stage(String roomId, String token, String contentId) =>
      _roomCall('/Rooms/$roomId/Stage', token, {'content_id': contentId});

  @override
  Future<SiloRoom> start(String roomId, String token, {int atSeconds = 0}) =>
      _roomCall('/Rooms/$roomId/Start', token, {'position_seconds': atSeconds});

  @override
  Future<SiloRoom> stop(String roomId, String token) =>
      _roomCall('/Rooms/$roomId/Stop', token, null);

  @override
  Future<SiloRoom> setPolicy(String roomId, String token, String policy) =>
      _roomCall('/Rooms/$roomId/Policy', token, {
        'guest_control_policy': policy,
      });

  @override
  Future<SiloRoom> setVoting(String roomId, String token, bool voting) =>
      _roomCall('/Rooms/$roomId/Voting', token, {'voting': voting});

  /// Host: 4 to 8 digits, or null to drop the PIN.
  Future<SiloRoom> setPin(String roomId, String token, String? pin) =>
      _roomCall('/Rooms/$roomId/Pin', token, {'pin': pin});

  /// Host: hands the room to [memberId].
  Future<SiloRoom> promote(String roomId, String token, String memberId) =>
      _roomCall('/Rooms/$roomId/Promote', token, {'member_id': memberId});

  /// Host: takes [memberId] out of the room.
  Future<void> remove(String roomId, String token, String memberId) => _call(
    'POST',
    '/Rooms/$roomId/Remove',
    token: token,
    data: {'member_id': memberId},
  );

  @override
  Future<List<SiloRoomSuggestion>> suggestions(
    String roomId,
    String token,
  ) async {
    final json = asJsonMap(
      await _call('GET', '/Rooms/$roomId/Suggestions', token: token),
    );
    return [
      for (final row in json?['suggestions'] as List? ?? const [])
        if (asJsonMap(row) case final map?) ?SiloRoomSuggestion.fromJson(map),
    ]..sort(SiloRoomSuggestion.compare);
  }

  // Moonbase names the title itself from the library.
  @override
  Future<void> suggest(
    String roomId,
    String token, {
    required String suggestionId,
    required String contentId,
    required String title,
    String? subtitle,
  }) => _call(
    'POST',
    '/Rooms/$roomId/Suggestions',
    token: token,
    data: {'content_id': contentId},
  );

  @override
  Future<void> vote(
    String roomId,
    String token,
    String suggestionId,
    bool voted,
  ) => _call(
    'POST',
    '/Rooms/$roomId/Suggestions/$suggestionId/Vote',
    token: token,
    data: {'voted': voted},
  );

  @override
  Future<void> removeSuggestion(
    String roomId,
    String token,
    String suggestionId,
  ) =>
      _call('DELETE', '/Rooms/$roomId/Suggestions/$suggestionId', token: token);

  @override
  Future<SiloRoomResumePoint?> resumePoint(
    String roomId,
    String token,
    String contentId,
  ) async => null;

  @override
  Future<void> close(String roomId, String token) async {
    _cursors.remove(roomId);
    await _call('POST', '/Rooms/$roomId/Close', token: token);
  }

  @override
  Future<void> leave(String roomId, String token) async {
    _cursors.remove(roomId);
    await _call('POST', '/Rooms/$roomId/Leave', token: token);
  }

  @override
  Uri? inviteUri(SiloRoom room) {
    // The server's own address beats the one this client signed in with,
    // which can be local-only (127.0.0.1, the emulator's 10.0.2.2).
    final url = Uri.tryParse(room.inviteUrl ?? '');
    if (url != null && url.hasScheme) return url;
    final path = room.invitePath;
    final base = _base;
    if (path == null || base == null) return null;
    final root = Uri.parse(base.endsWith('/') ? base : '$base/');
    return root.resolve(path.startsWith('/') ? path.substring(1) : path);
  }

  @override
  Future<WatchPartyChannel> connect(String roomId, String token) async {
    final channel = _LongPoll(this, roomId, token);
    await channel.open();
    return channel;
  }

  /// One poll: what came after [cursor], waiting up to [wait] seconds.
  Future<Map<String, dynamic>> _events(
    String roomId,
    String token,
    int cursor,
    CancelToken cancel, {
    int wait = pollWaitSeconds,
  }) async {
    final json = asJsonMap(
      await _call(
        'GET',
        '/Rooms/$roomId/Events',
        token: token,
        query: {'cursor': cursor, 'wait': wait},
        cancel: cancel,
        receiveTimeout: _pollTimeout,
      ),
    );
    if (json == null) throw const FormatException('Expected room events');
    return json;
  }

  Future<List<Map<String, dynamic>>> _post(
    String roomId,
    String token,
    List<Map<String, Object?>> messages,
  ) async {
    final json = asJsonMap(
      await _call(
        'POST',
        '/Rooms/$roomId/Messages',
        token: token,
        data: {'messages': messages},
      ),
    );
    return [
      for (final reply in json?['messages'] as List? ?? const [])
        ?asJsonMap(reply),
    ];
  }

  Future<SiloRoom> _roomCall(
    String path,
    String token,
    Map<String, Object?>? data,
  ) async {
    final room = asJsonMap(
      asJsonMap(await _call('POST', path, token: token, data: data))?['room'],
    );
    if (room == null) {
      throw const FormatException('Expected a watch party room from Moonbase');
    }
    return SiloRoom.fromJson(room);
  }

  SiloRoomAccess _access(dynamic data) {
    final json = asJsonMap(data);
    final room = asJsonMap(json?['room']);
    final token = json?['token'];
    if (room == null || token is! String || token.isEmpty) {
      throw const FormatException('Expected a watch party room from Moonbase');
    }
    final access = SiloRoomAccess(SiloRoom.fromJson(room), token);
    _cursors.remove(access.room.roomId);
    return access;
  }
}

/// The room's messages over HTTP: a poll held open until something new
/// comes, sent again at once, and POSTs the other way.
class _LongPoll implements WatchPartyChannel {
  _LongPoll(this._api, this._roomId, this._token);

  final MoonbaseWatchPartyApi _api;
  final String _roomId;
  final String _token;
  final _controller = StreamController<Map<String, dynamic>>();
  final _cancel = CancelToken();
  final List<Map<String, Object?>> _outbox = [];
  bool _flushing = false;
  bool _closed = false;

  @override
  Stream<Map<String, dynamic>> get messages => _controller.stream;

  /// The first poll doesn't wait, so a refusal surfaces here and a channel
  /// only counts as open once the server has answered. From cursor 0 it
  /// brings the snapshot, from a later one whatever was missed.
  Future<void> open() async {
    final cursor = _api._cursors[_roomId] ?? 0;
    _deliver(await _api._events(_roomId, _token, cursor, _cancel, wait: 0));
    unawaited(_loop());
  }

  void _deliver(Map<String, dynamic> page) {
    final cursor = (page['cursor'] as num?)?.toInt();
    if (cursor != null) _api._cursors[_roomId] = cursor;
    for (final raw in page['messages'] as List? ?? const []) {
      if (asJsonMap(raw) case final message? when !_closed) {
        _controller.add(message);
      }
    }
  }

  Future<void> _loop() async {
    while (!_closed) {
      try {
        final page = await _api._events(
          _roomId,
          _token,
          _api._cursors[_roomId] ?? 0,
          _cancel,
        );
        if (_closed) return;
        _deliver(page);
      } on DioException catch (e) {
        if (_closed) return;
        final status = e.response?.statusCode;
        // The room is gone, or this member is no longer in it.
        if (status == 404 || MoonbaseWatchPartyApi.errorCode(e) == 'disabled') {
          _controller.add({'type': 'room_closed', 'reason': 'closed'});
        } else if (status == 403) {
          _controller.add({
            'type': 'removed',
            'reason': MoonbaseWatchPartyApi.errorCode(e) ?? 'removed',
          });
        }
        await _finish();
        return;
      } catch (_) {
        await _finish();
        return;
      }
    }
  }

  @override
  bool send(Map<String, Object?> message) {
    if (_closed) return false;
    // Only the newest state report matters.
    if (message['type'] == 'state_report') {
      _outbox.removeWhere((m) => m['type'] == 'state_report');
    }
    _outbox.add(message);
    if (!_flushing) unawaited(_flush());
    return true;
  }

  /// One POST at a time. Whatever queued up behind it goes in the next one.
  Future<void> _flush() async {
    _flushing = true;
    try {
      while (_outbox.isNotEmpty && !_closed) {
        final batch = List.of(_outbox);
        _outbox.clear();
        try {
          final replies = await _api._post(_roomId, _token, batch);
          for (final reply in replies) {
            if (!_closed) _controller.add(reply);
          }
        } catch (e) {
          _api._logger.d('Watch Party: sending to the room failed', error: e);
        }
      }
    } finally {
      _flushing = false;
    }
  }

  Future<void> _finish() async {
    if (_closed) return;
    _closed = true;
    _outbox.clear();
    await _controller.close();
  }

  @override
  Future<void> close() async {
    _cancel.cancel();
    await _finish();
  }
}
