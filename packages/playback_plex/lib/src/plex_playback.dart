import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class PlexMediaStreamResolver implements MediaStreamResolver {
  final MediaServerClient _client;

  PlexMediaStreamResolver(this._client);

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
        requestBody: PlaybackInfoRequest(
          itemId: itemId,
          mediaSourceId: mediaSourceId,
          audioStreamIndex: audioStreamIndex,
          subtitleStreamIndex: subtitleStreamIndex,
          maxStreamingBitrate: maxStreamingBitrate,
          deviceProfile: deviceProfile,
          enableDirectPlay: enableDirectPlay,
          enableDirectStream: enableDirectStream,
          enableTranscoding: enableTranscoding,
        ).toJson(),
      ),
    );
    final source = info.mediaSources.first;
    final directPlay = source.supportsDirectPlay;
    final path = directPlay ? source.path : source.transcodingUrl;
    if (path == null) throw StateError('Plex has no stream for $itemId');

    final streams = source.mediaStreams;
    return StreamResolutionResult(
      // Free Live TV channels stream straight from plex.tv.
      streamUrl: _withToken(
        path.startsWith('http') ? path : '${_client.baseUrl}$path',
      ),
      mediaSourceId: source.id,
      playSessionId: info.playSessionId,
      playMethod: directPlay
          ? StreamPlayMethod.directPlay
          : StreamPlayMethod.transcode,
      container: directPlay ? source.container : 'ts',
      mediaType: MediaStreamResolver.detectMediaType(streams),
      mediaStreams: streams,
      externalSubtitles: [
        for (final subtitle in MediaStreamResolver.extractExternalSubtitles(
          streams,
          _client.baseUrl,
        ))
          subtitle.withDeliveryUrl(_withToken(subtitle.deliveryUrl)),
      ],
      selectedAudioStreamIndex: source.defaultAudioStreamIndex,
      selectedSubtitleStreamIndex: source.defaultSubtitleStreamIndex,
      serverOfferedDirectPlay: directPlay,
      directPlayRequested: enableDirectPlay,
      transcodingReasons: source.transcodingReasons,
      sourceBitrate: source.bitrate,
    );
  }

  /// Players load these URLs without the client's headers, so the token
  /// rides in the query.
  String _withToken(String url) {
    final token = _client.accessToken;
    if (token == null) return url;
    return '$url${url.contains('?') ? '&' : '?'}'
        'X-Plex-Token=${Uri.encodeQueryComponent(token)}';
  }
}

class PlexPlaySessionService implements PlayerService {
  final MediaServerClient _client;

  PlexPlaySessionService(this._client);

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
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {
    try {
      await _client.playbackApi.stopActiveEncodings(
        deviceId: _client.deviceInfo.id,
        playSessionId: resolution.playSessionId,
      );
    } catch (_) {
      // A transcode Plex already ended has nothing left to stop.
    }
  }

  @override
  void dispose() {}
}
