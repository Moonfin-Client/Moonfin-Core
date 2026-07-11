import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class JellyfinSyncPlayApi implements SyncPlayApi {
  final Dio _dio;

  JellyfinSyncPlayApi(this._dio);

  @override
  Future<void> createGroup(String groupName) async {
    await _dio.post('/SyncPlay/New', data: {'GroupName': groupName});
  }

  @override
  Future<void> joinGroup(String groupId) async {
    await _dio.post('/SyncPlay/Join', data: {'GroupId': groupId});
  }

  @override
  Future<void> leaveGroup() async {
    await _dio.post('/SyncPlay/Leave');
  }

  @override
  Future<SyncPlayGroupInfo> getGroup(String groupId) async {
    final res = await _dio.get<Map<String, dynamic>>('/SyncPlay/$groupId');
    return SyncPlayGroupInfo.fromJson(res.data ?? const {});
  }

  @override
  Future<List<SyncPlayGroupInfo>> getGroups() async {
    final res = await _dio.get<List<dynamic>>('/SyncPlay/List');
    final data = res.data ?? const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map(SyncPlayGroupInfo.fromJson)
        .toList();
  }

  @override
  Future<void> sendUnpause() async {
    await _dio.post('/SyncPlay/Unpause');
  }

  @override
  Future<void> sendPause() async {
    await _dio.post('/SyncPlay/Pause');
  }

  @override
  Future<void> sendSeek(int positionTicks) async {
    await _dio.post('/SyncPlay/Seek', data: {'PositionTicks': positionTicks});
  }

  @override
  Future<void> sendStop() async {
    await _dio.post('/SyncPlay/Stop');
  }

  @override
  Future<void> sendBuffering({
    required bool isPlaying,
    required String playlistItemId,
    required int positionTicks,
    DateTime? when,
  }) async {
    await _dio.post('/SyncPlay/Buffering', data: {
      'When': when?.toUtc().toIso8601String() ?? SyncPlayUtils.nowIsoUtc(),
      'PositionTicks': positionTicks,
      'IsPlaying': isPlaying,
      'PlaylistItemId': playlistItemId,
    });
  }

  @override
  Future<void> sendReady({
    required bool isPlaying,
    required String playlistItemId,
    required int positionTicks,
    DateTime? when,
  }) async {
    await _dio.post('/SyncPlay/Ready', data: {
      'When': when?.toUtc().toIso8601String() ?? SyncPlayUtils.nowIsoUtc(),
      'PositionTicks': positionTicks,
      'IsPlaying': isPlaying,
      'PlaylistItemId': playlistItemId,
    });
  }

  @override
  Future<void> sendPing(int ping) async {
    await _dio.post('/SyncPlay/Ping', data: {'Ping': ping});
  }

  @override
  Future<void> setNewQueue({
    required List<String> itemIds,
    required int startIndex,
    required int startPositionTicks,
  }) async {
    await _dio.post('/SyncPlay/SetNewQueue', data: {
      'PlayingQueue': itemIds,
      'PlayingItemPosition': startIndex,
      'StartPositionTicks': startPositionTicks,
    });
  }

  @override
  Future<void> setPlaylistItem(String playlistItemId) async {
    await _dio.post('/SyncPlay/SetPlaylistItem',
        data: {'PlaylistItemId': playlistItemId});
  }

  @override
  Future<void> removeFromPlaylist(
    List<String> playlistItemIds, {
    bool clearPlaylist = false,
    bool clearPlayingItem = false,
  }) async {
    await _dio.post('/SyncPlay/RemoveFromPlaylist', data: {
      'PlaylistItemIds': playlistItemIds,
      'ClearPlaylist': clearPlaylist,
      'ClearPlayingItem': clearPlayingItem,
    });
  }

  @override
  Future<void> movePlaylistItem({
    required String playlistItemId,
    required int newIndex,
  }) async {
    await _dio.post('/SyncPlay/MovePlaylistItem', data: {
      'PlaylistItemId': playlistItemId,
      'NewIndex': newIndex,
    });
  }

  @override
  Future<void> queue({
    required List<String> itemIds,
    SyncPlayQueueMode mode = SyncPlayQueueMode.queue,
  }) async {
    await _dio.post('/SyncPlay/Queue', data: {
      'ItemIds': itemIds,
      'Mode': mode.serverValue,
    });
  }

  @override
  Future<void> nextItem(String playlistItemId) async {
    await _dio.post('/SyncPlay/NextItem',
        data: {'PlaylistItemId': playlistItemId});
  }

  @override
  Future<void> previousItem(String playlistItemId) async {
    await _dio.post('/SyncPlay/PreviousItem',
        data: {'PlaylistItemId': playlistItemId});
  }

  @override
  Future<void> setRepeatMode(SyncPlayRepeatMode mode) async {
    await _dio.post('/SyncPlay/SetRepeatMode',
        data: {'Mode': mode.serverValue});
  }

  @override
  Future<void> setShuffleMode(SyncPlayShuffleMode mode) async {
    await _dio.post('/SyncPlay/SetShuffleMode',
        data: {'Mode': mode.serverValue});
  }

  @override
  Future<void> setIgnoreWait(bool ignore) async {
    await _dio.post('/SyncPlay/SetIgnoreWait',
        data: {'IgnoreWait': ignore});
  }

  @override
  Future<UtcTimeResponse> getUtcTime() async {
    final res = await _dio.get<Map<String, dynamic>>('/GetUtcTime');
    return UtcTimeResponse.fromJson(res.data ?? const {});
  }
}
