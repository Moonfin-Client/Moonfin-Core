import 'package:server_silo/server_silo.dart';

/// Where a watch party's rooms live: Silo's own Watch Party, or Moonbase's
/// on Jellyfin, Emby and Plex. Moonbase mirrors Silo's room JSON and room
/// messages on purpose, so one manager drives either.
abstract class WatchPartyBackend {
  /// Moonbase's rooms, which add chat, reactions, statuses, PINs and a room
  /// list to Silo's.
  bool get isMoonbase;

  Future<SiloRoomAccess> create(String roomId, {String? pin});

  /// [input] is a room code or an invite link. A listed Moonbase room is
  /// joined by [roomId] instead.
  Future<SiloRoomAccess> join(String input, {String? roomId, String? pin});

  Future<SiloRoom> stage(String roomId, String token, String contentId);

  /// [atSeconds] is where Moonbase starts the room. Silo always starts at
  /// the beginning, and the host seeks it after.
  Future<SiloRoom> start(String roomId, String token, {int atSeconds = 0});
  Future<SiloRoom> stop(String roomId, String token);

  /// [policy] is one of the room's `guest_control_policy` values.
  Future<SiloRoom> setPolicy(String roomId, String token, String policy);
  Future<SiloRoom> setVoting(String roomId, String token, bool voting);

  Future<List<SiloRoomSuggestion>> suggestions(String roomId, String token);
  Future<void> suggest(
    String roomId,
    String token, {
    required String suggestionId,
    required String contentId,
    required String title,
    String? subtitle,
  });
  Future<void> vote(
    String roomId,
    String token,
    String suggestionId,
    bool voted,
  );
  Future<void> removeSuggestion(
    String roomId,
    String token,
    String suggestionId,
  );

  /// Where the room could pick [contentId] up, or null when nobody is part
  /// way through it or the server can't say.
  Future<SiloRoomResumePoint?> resumePoint(
    String roomId,
    String token,
    String contentId,
  );

  Future<void> close(String roomId, String token);

  /// Tells the server this member left. Silo has no call for it.
  Future<void> leave(String roomId, String token);

  /// The full invite link for [room], or null when there is none to share.
  Uri? inviteUri(SiloRoom room);

  /// Opens the room's message channel. Throws a [DioException] when the
  /// server refuses it.
  Future<WatchPartyChannel> connect(String roomId, String token);
}

/// A room's two-way message stream: Silo's room socket or Moonbase's
/// long-poll. Both carry the same JSON messages.
abstract class WatchPartyChannel {
  /// Inbound messages. It ends when the channel drops.
  Stream<Map<String, dynamic>> get messages;

  /// Sends one outbound message, or answers false when it can't.
  bool send(Map<String, Object?> message);

  Future<void> close();
}
