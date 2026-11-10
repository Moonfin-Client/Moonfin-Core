import 'dart:convert';

import 'package:server_silo/server_silo.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'watch_party_backend.dart';

/// Silo's Watch Party (`/api/v2/watch-together`) and its room socket.
class SiloWatchPartyBackend implements WatchPartyBackend {
  SiloWatchPartyBackend(this._api);

  final SiloWatchPartyApi _api;

  @override
  bool get isMoonbase => false;

  @override
  Future<SiloRoomAccess> create(String roomId, {String? pin}) =>
      _api.create(roomId);

  @override
  Future<SiloRoomAccess> join(String input, {String? roomId, String? pin}) =>
      _api.join(input);

  @override
  Future<SiloRoom> stage(String roomId, String token, String contentId) =>
      _api.stage(roomId, contentId);

  @override
  Future<SiloRoom> start(String roomId, String token, {int atSeconds = 0}) =>
      _api.start(roomId);

  @override
  Future<SiloRoom> stop(String roomId, String token) => _api.stop(roomId);

  @override
  Future<SiloRoom> setPolicy(String roomId, String token, String policy) =>
      _api.setGuestsCanPause(roomId, policy == 'guest_play_pause');

  @override
  Future<SiloRoom> setVoting(String roomId, String token, bool voting) =>
      _api.setVoting(roomId, voting);

  @override
  Future<List<SiloRoomSuggestion>> suggestions(String roomId, String token) =>
      _api.suggestions(roomId, token);

  @override
  Future<void> suggest(
    String roomId,
    String token, {
    required String suggestionId,
    required String contentId,
    required String title,
    String? subtitle,
  }) => _api.suggest(
    roomId,
    token,
    suggestionId: suggestionId,
    contentId: contentId,
    title: title,
    subtitle: subtitle,
  );

  @override
  Future<void> vote(
    String roomId,
    String token,
    String suggestionId,
    bool voted,
  ) => _api.vote(roomId, token, suggestionId, voted);

  @override
  Future<void> removeSuggestion(
    String roomId,
    String token,
    String suggestionId,
  ) => _api.removeSuggestion(roomId, token, suggestionId);

  @override
  Future<SiloRoomResumePoint?> resumePoint(
    String roomId,
    String token,
    String contentId,
  ) => _api.resumePoint(roomId, token, contentId);

  @override
  Future<void> close(String roomId, String token) => _api.close(roomId);

  // A host's room closes on its own two minutes after they go.
  @override
  Future<void> leave(String roomId, String token) async {}

  @override
  Uri? inviteUri(SiloRoom room) {
    final path = room.invitePath;
    return path == null ? null : _api.inviteUri(path);
  }

  @override
  Future<WatchPartyChannel> connect(String roomId, String token) async {
    final ticket = await _api.socketTicket(roomId, token);
    final channel = WebSocketChannel.connect(
      _api.socketUri(roomId),
      protocols: [SiloWatchPartyApi.socketProtocol, 'silo.ticket.$ticket'],
    );
    await channel.ready;
    return _SiloSocket(channel);
  }
}

class _SiloSocket implements WatchPartyChannel {
  _SiloSocket(this._channel);

  final WebSocketChannel _channel;

  @override
  late final Stream<Map<String, dynamic>> messages = _channel.stream.expand((
    data,
  ) {
    try {
      final decoded = jsonDecode(data as String);
      return decoded is Map<String, dynamic> ? [decoded] : const [];
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  });

  @override
  bool send(Map<String, Object?> message) {
    _channel.sink.add(jsonEncode(message));
    return true;
  }

  @override
  Future<void> close() async {
    await _channel.sink.close();
  }
}
