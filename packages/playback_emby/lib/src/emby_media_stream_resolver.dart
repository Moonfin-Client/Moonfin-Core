
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

    final staticMediaSourceId =
        MediaStreamResolver.resolveStaticMediaSourceId(mediaItem, mediaSourceId);
    // A channel item's lone placeholder source is left off so the server
    // answers with the source it probes.
    final resolvedMediaSourceId = MediaStreamResolver.isStreamlessStaticSource(
      mediaItem,
      staticMediaSourceId,
    )
        ? null
        : staticMediaSourceId;
    final isLiveChannel = MediaStreamResolver.isLiveTvItem(mediaItem);
    final requestProfile = MediaStreamResolver.shortenLiveHlsStartup(
      MediaStreamResolver.preferMpegTsHlsForLive(
        deviceProfile,
        isLiveChannel: isLiveChannel,
      ),
      isLiveChannel: isLiveChannel,
    );

    Future<PlaybackInfoResult> fetchPlaybackInfo(String? sourceId) async {
      final request = PlaybackInfoRequest(
        itemId: itemId,
        mediaSourceId: sourceId,
        deviceProfile: requestProfile,
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
      final parsed = PlaybackInfoResult.fromJson(rawInfo);
      if (parsed.errorCode != null) {
        throw Exception('Playback error: ${parsed.errorCode}');
      }
      if (parsed.mediaSources.isEmpty) {
        throw Exception('No media sources available for item $itemId');
      }
      return parsed;
    }

    // An id the item does not list passes through so the server can resolve
    // drifted ids without discarding an explicit version pick.
    PlaybackInfoResult? info;
    try {
      info = await fetchPlaybackInfo(resolvedMediaSourceId);
    } catch (_) {
      if (!MediaStreamResolver.canRetryWithoutMediaSourceId(
        mediaItem,
        resolvedMediaSourceId,
      )) {
        rethrow;
      }
    }
    var playbackInfo = info ?? await fetchPlaybackInfo(null);

    var source = _selectBestSource(playbackInfo.mediaSources, preferredId: resolvedMediaSourceId);

    // The same placeholder reached through an item that came without its
    // sources: the server hands back a source with no streams that it can only
    // transcode. Ask again without the id and take a probed source if one
    // comes back, otherwise keep what the caller picked. An item known to
    // have several versions is left alone, since the sources that come back
    // without the id would be its other versions.
    if (resolvedMediaSourceId != null &&
        MediaStreamResolver.staticMediaSourceIds(mediaItem).length <= 1 &&
        source.isUnprobedPlaceholder) {
      try {
        final retry = await fetchPlaybackInfo(null);
        final probed = retry.mediaSources
            .where((s) => s.mediaStreams.isNotEmpty)
            .toList();
        if (probed.isNotEmpty) {
          playbackInfo = retry;
          source = _selectBestSource(probed);
        }
      } catch (_) {}
    }

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
    final embeddedTextSubs = MediaStreamResolver.extractEmbeddedTextSubtitles(
      source.mediaStreams,
      _client.baseUrl,
      itemId: itemId,
      mediaSourceId: source.id,
    ).map((s) => s.withDeliveryUrl(_appendAuth(s.deliveryUrl))).toList();
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
      playSessionId: playbackInfo.playSessionId,
      playMethod: playMethod,
      container: source.container,
      videoRangeType: videoRangeType,
      mediaType: mediaType,
      normalizationGainDb: normalizationGainDb,
      externalSubtitles: authedSubs,
      embeddedTextSubtitles: embeddedTextSubs,
      mediaStreams: source.mediaStreams,
      selectedAudioStreamIndex: source.defaultAudioStreamIndex,
      selectedSubtitleStreamIndex: source.defaultSubtitleStreamIndex,
      transcodingReasons: mergeTranscodeReasons(
        playMethod: playMethod,
        serverReasons: source.transcodingReasons,
        mediaStreams: source.mediaStreams,
        container: source.container,
        sourceBitrate: source.bitrate,
        maxStreamingBitrate: maxStreamingBitrate,
        audioStreamIndex: audioStreamIndex ?? source.defaultAudioStreamIndex,
        subtitleStreamIndex:
            subtitleStreamIndex ?? source.defaultSubtitleStreamIndex,
        deviceProfile: requestProfile,
      ),
      serverOfferedDirectPlay: source.supportsDirectPlay,
      directPlayRequested: enableDirectPlay,
      sourceBitrate: source.bitrate,
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

    // Live TV: a remote upstream plays as is instead of the HLS transcode.
    // Emby answers 404 when a client asks for its own LiveStreamFiles copy, so
    // that one goes out through the DirectStreamUrl below.
    if (MediaStreamResolver.isLiveSourceDirectPlayEligible(
      enableDirectPlay: enableDirectPlay,
      isManagedLiveStream: isManagedLiveStream,
      path: remotePath,
    )) {
      final resolvedPath =
          MediaStreamResolver.rebaseLiveServerPath(remotePath!, _client.baseUrl);
      if (!resolvedPath.startsWith(_client.baseUrl)) {
        return (resolvedPath, StreamPlayMethod.directPlay);
      }
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
