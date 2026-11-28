import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class AbsMediaStreamResolver implements MediaStreamResolver {
  final MediaServerClient _client;

  AbsMediaStreamResolver(this._client);

  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async {
    final itemId = MediaStreamResolver.extractItemId(mediaItem);
    final info = PlaybackInfoResult.fromJson(
      await _client.playbackApi.getPlaybackInfo(
        itemId,
        requestBody: {'DeviceProfile': ?deviceProfile},
        startTimeTicks: startTimeTicks,
        waitForMediaProbe: true,
      ),
    );
    final source = info.mediaSources.firstOrNull;
    final directPlay = source?.supportsDirectPlay ?? false;
    final url = directPlay ? source?.path : source?.transcodingUrl;
    if (source == null || url == null) {
      throw StateError('Audiobookshelf has no stream for $itemId');
    }
    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: source.id,
      playSessionId: info.playSessionId,
      playMethod: directPlay
          ? StreamPlayMethod.directPlay
          : StreamPlayMethod.transcode,
      container: source.container,
      mediaType: 'Audio',
      mediaStreams: source.mediaStreams,
      selectedAudioStreamIndex: 0,
      serverOfferedDirectPlay: directPlay,
      directPlayRequested: enableDirectPlay,
      sourceBitrate: source.bitrate,
    );
  }
}

/// Reports a play through the Audiobookshelf session the resolver opened.
class AbsPlaySessionService implements PlayerService {
  final MediaServerClient _client;

  AbsPlaySessionService(this._client);

  Map<String, dynamic> _report(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    int positionTicks, {
    bool isPaused = false,
  }) => {
    'ItemId': MediaStreamResolver.extractItemId(mediaItem),
    'PlaySessionId': resolution.playSessionId,
    'PositionTicks': positionTicks,
    'IsPaused': isPaused,
    'RunTimeTicks': ?_runTimeTicks(mediaItem),
  };

  static int? _runTimeTicks(dynamic mediaItem) {
    try {
      final Map? raw = mediaItem is Map
          ? mediaItem
          : (mediaItem as dynamic).rawData as Map?;
      return raw?['RunTimeTicks'] as int?;
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
  }) => _client.playbackApi.reportPlaybackStart(
    _report(mediaItem, resolution, positionTicks ?? 0),
  );

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
  }) => _client.playbackApi.reportPlaybackProgress(
    _report(
      mediaItem,
      resolution,
      position.inMicroseconds * 10,
      isPaused: isPaused,
    ),
  );

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) => _client.playbackApi.reportPlaybackStopped(
    _report(mediaItem, resolution, position.inMicroseconds * 10),
  );

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}
