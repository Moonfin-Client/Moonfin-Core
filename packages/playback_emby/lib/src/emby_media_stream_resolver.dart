
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class EmbyMediaStreamResolver implements MediaStreamResolver {
  final MediaServerClient _client;

  EmbyMediaStreamResolver(this._client);

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

    final resolvedMediaSourceId =
        MediaStreamResolver.resolveStaticMediaSourceId(mediaItem, mediaSourceId);

    final request = PlaybackInfoRequest(
      itemId: itemId,
      mediaSourceId: resolvedMediaSourceId,
      deviceProfile: deviceProfile,
      maxStreamingBitrate: maxStreamingBitrate,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      startTimeTicks: startTimeTicks,
      enableDirectPlay: enableDirectPlay,
      enableDirectStream: enableDirectStream,
      enableTranscoding: enableTranscoding,
    );

    final rawInfo = await _client.playbackApi.getPlaybackInfo(
      itemId,
      requestBody: request.toJson(),
      userId: _client.userId,
      startTimeTicks: startTimeTicks,
    );
    final info = PlaybackInfoResult.fromJson(rawInfo);

    if (info.errorCode != null) {
      throw Exception('Playback error: ${info.errorCode}');
    }
    if (info.mediaSources.isEmpty) {
      throw Exception('No media sources available for item $itemId');
    }

    final source = _selectBestSource(info.mediaSources, preferredId: resolvedMediaSourceId);
    var (url, playMethod) = _resolveStreamUrl(
      itemId,
      source,
      enableDirectPlay: enableDirectPlay,
    );

    if (playMethod == StreamPlayMethod.transcode || playMethod == StreamPlayMethod.directStream) {
      url = MediaStreamResolver.applyStreamIndices(url, audioStreamIndex, subtitleStreamIndex);
      url = url
          .replaceFirst(RegExp(r'\?StartTimeTicks=\d+&', caseSensitive: false), '?')
          .replaceFirst(RegExp(r'[&?]StartTimeTicks=\d+', caseSensitive: false), '');
    }

    url = _appendAuth(url);

    final externalSubs = MediaStreamResolver.extractExternalSubtitles(source.mediaStreams, _client.baseUrl);
    final authedSubs = externalSubs
        .map(
          (s) => ExternalSubtitle(
            deliveryUrl: _appendAuth(s.deliveryUrl),
            title: s.title,
            language: s.language,
            codec: s.codec,
            isDefault: s.isDefault,
            isForced: s.isForced,
            streamIndex: s.streamIndex,
          ),
        )
        .toList();

    final mediaType = MediaStreamResolver.detectMediaType(
      source.mediaStreams,
      fallbackUrl: url,
    );
    final videoRangeType = source.mediaStreams
        .where((stream) => stream['Type'] == 'Video')
        .map((stream) => stream['VideoRangeType']?.toString())
        .firstWhere((value) => value != null && value.isNotEmpty, orElse: () => null);
    final normalizationGainDb =
        MediaStreamResolver.extractNormalizationGainDb(source.mediaStreams);

    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: source.id,
      liveStreamId: source.liveStreamId,
      playSessionId: info.playSessionId,
      playMethod: playMethod,
      container: source.container,
      videoRangeType: videoRangeType,
      mediaType: mediaType,
      normalizationGainDb: normalizationGainDb,
      externalSubtitles: authedSubs,
      mediaStreams: source.mediaStreams,
      selectedAudioStreamIndex: source.defaultAudioStreamIndex,
      selectedSubtitleStreamIndex: source.defaultSubtitleStreamIndex,
      transcodingReasons: source.transcodingReasons,
    );
  }

  String _appendAuth(String url) {
    final token = _client.accessToken;
    if (token == null || token.isEmpty) {
      return url;
    }
    if (!url.startsWith(_client.baseUrl)) {
      return url;
    }
    final lower = url.toLowerCase();
    if (lower.contains('api_key=') || lower.contains('x-emby-token=')) {
      return url;
    }
    final separator = url.contains('?') ? '&' : '?';
    return '$url${separator}api_key=${Uri.encodeComponent(token)}';
  }

  PlaybackMediaSource _selectBestSource(
    List<PlaybackMediaSource> sources, {
    String? preferredId,
  }) {
    if (preferredId != null) {
      final preferred = sources.where((s) => s.id == preferredId).firstOrNull;
      if (preferred != null) return preferred;
    }
    PlaybackMediaSource? directStream;
    PlaybackMediaSource? transcode;
    for (final s in sources) {
      if (s.supportsDirectPlay) return s;
      directStream ??= s.supportsDirectStream ? s : null;
      transcode ??= s.supportsTranscoding ? s : null;
    }
    return directStream ?? transcode ?? sources.first;
  }

  (String, StreamPlayMethod) _resolveStreamUrl(
    String itemId,
    PlaybackMediaSource source, {
    bool enableDirectPlay = true,
  }) {
    final remotePath = source.path;
    final isManagedLiveStream =
        source.liveStreamId != null && source.liveStreamId!.isNotEmpty;
    if (MediaStreamResolver.isRemoteDirectPlayEligible(
      enableDirectPlay: enableDirectPlay,
      isRemote: source.isRemote,
      isManagedLiveStream: isManagedLiveStream,
      supportsDirectPlay: source.supportsDirectPlay,
      protocol: source.protocol,
      path: remotePath,
      serverBaseUrl: _client.baseUrl,
    )) {
      return (remotePath!, StreamPlayMethod.directPlay);
    }

    // Live TV: play the source path directly instead of the HLS transcode.
    // Server-served path is a remux -> directStream (keeps the live session);
    // a remote upstream -> directPlay.
    if (MediaStreamResolver.isLiveSourceDirectPlayEligible(
      enableDirectPlay: enableDirectPlay,
      isManagedLiveStream: isManagedLiveStream,
      path: remotePath,
    )) {
      final resolvedPath =
          MediaStreamResolver.rebaseLiveServerPath(remotePath!, _client.baseUrl);
      final method = resolvedPath.startsWith(_client.baseUrl)
          ? StreamPlayMethod.directStream
          : StreamPlayMethod.directPlay;
      return (resolvedPath, method);
    }

    if (source.supportsDirectPlay) {
      return (
        _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id),
        StreamPlayMethod.directPlay,
      );
    }
    if (source.supportsDirectStream && source.directStreamUrl != null) {
      return (
        '${_client.baseUrl}${source.directStreamUrl}',
        StreamPlayMethod.directStream,
      );
    }
    if (source.supportsTranscoding && source.transcodingUrl != null) {
      return (
        '${_client.baseUrl}${source.transcodingUrl}',
        StreamPlayMethod.transcode,
      );
    }
    return (
      _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id),
      StreamPlayMethod.directPlay,
    );
  }
}
