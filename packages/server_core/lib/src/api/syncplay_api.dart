import '../models/syncplay_models.dart';

class UtcTimeResponse {
  final int requestReceptionTimeMs;
  final int responseTransmissionTimeMs;

  const UtcTimeResponse({
    required this.requestReceptionTimeMs,
    required this.responseTransmissionTimeMs,
  });

  /// Timestamps are -1 when the server response was missing or unparseable,
  /// so a bad sample can be discarded instead of polluting the clock offset
  /// with local time.
  factory UtcTimeResponse.fromJson(Map<String, dynamic> json) =>
      UtcTimeResponse(
        requestReceptionTimeMs: SyncPlayUtils.tryParseISOToMs(
                json['RequestReceptionTime'] as String?) ??
            -1,
        responseTransmissionTimeMs: SyncPlayUtils.tryParseISOToMs(
                json['ResponseTransmissionTime'] as String?) ??
            -1,
      );
}

abstract class SyncPlayApi {
  Future<void> createGroup(String groupName);
  Future<void> joinGroup(String groupId);
  Future<void> leaveGroup();
  Future<SyncPlayGroupInfo> getGroup(String groupId);
  Future<List<SyncPlayGroupInfo>> getGroups();

  Future<void> sendUnpause();
  Future<void> sendPause();
  Future<void> sendSeek(int positionTicks);
  Future<void> sendStop();
  Future<void> sendBuffering({
    required bool isPlaying,
    required String playlistItemId,
    required int positionTicks,
    DateTime? when,
  });
  Future<void> sendReady({
    required bool isPlaying,
    required String playlistItemId,
    required int positionTicks,
    DateTime? when,
  });
  Future<void> sendPing(int ping);

  Future<void> setNewQueue({
    required List<String> itemIds,
    required int startIndex,
    required int startPositionTicks,
  });
  Future<void> setPlaylistItem(String playlistItemId);
  Future<void> removeFromPlaylist(
    List<String> playlistItemIds, {
    bool clearPlaylist = false,
    bool clearPlayingItem = false,
  });
  Future<void> movePlaylistItem({
    required String playlistItemId,
    required int newIndex,
  });
  Future<void> queue({
    required List<String> itemIds,
    SyncPlayQueueMode mode = SyncPlayQueueMode.queue,
  });
  Future<void> nextItem(String playlistItemId);
  Future<void> previousItem(String playlistItemId);
  Future<void> setRepeatMode(SyncPlayRepeatMode mode);
  Future<void> setShuffleMode(SyncPlayShuffleMode mode);
  Future<void> setIgnoreWait(bool ignore);

  Future<UtcTimeResponse> getUtcTime();
}
