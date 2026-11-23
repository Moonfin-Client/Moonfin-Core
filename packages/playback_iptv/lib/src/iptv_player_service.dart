import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

/// Reports playback lifecycle to the IPTV backend, which persists watch
/// progress locally per profile instead of calling a remote server.
class IptvPlayerService implements PlayerService {
  final MediaServerClient _client;

  IptvPlayerService(this._client);

  Map<String, dynamic> _report(dynamic mediaItem, int positionTicks) => {
    'ItemId': MediaStreamResolver.extractItemId(mediaItem),
    'PositionTicks': positionTicks,
    'RunTimeTicks': ?_runTimeTicks(mediaItem),
  };

  // Playback hands over the wrapped item, which keeps the server map in
  // rawData.
  static int? _runTimeTicks(dynamic mediaItem) {
    try {
      final Map? raw = mediaItem is Map
          ? mediaItem
          : (mediaItem as dynamic).rawData as Map?;
      return (raw?['RunTimeTicks'] as num?)?.toInt();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    await _client.playbackApi.reportPlaybackStart(
      _report(mediaItem, positionTicks ?? 0),
    );
  }

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {
    await _client.playbackApi.reportPlaybackProgress(
      _report(mediaItem, position.inMicroseconds * 10),
    );
  }

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async {
    await _client.playbackApi.reportPlaybackStopped(
      _report(mediaItem, position.inMicroseconds * 10),
    );
  }

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}
