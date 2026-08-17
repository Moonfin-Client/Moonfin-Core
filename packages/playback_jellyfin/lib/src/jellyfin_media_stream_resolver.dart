import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class JellyfinMediaStreamResolver implements MediaStreamResolver {
  final MediaServerClient _client;

  JellyfinMediaStreamResolver(this._client);

  Map<String, String> _buildRequestHeaders() {
    final token = _client.accessToken;
    final headers = <String, String>{
      'Authorization': buildServerAuthorizationHeader(
        scheme: 'MediaBrowser',
        deviceInfo: _client.deviceInfo,
        accessToken: token,
      ),
    };
    if (token != null && token.isNotEmpty) {
      headers['X-Emby-Token'] = token;
    }
    return headers;
  }

  bool _isAudioMediaItem(dynamic mediaItem) {
    bool isAudioType(String? rawType) {
      final type = rawType?.trim().toLowerCase();
      return type == 'audio' || type == 'audiobook';
    }

    try {
      final dynamic dyn = mediaItem;
      if (isAudioType(dyn.type?.toString())) {
        return true;
      }
    } catch (_) {}

    if (mediaItem is Map && isAudioType(mediaItem['Type']?.toString())) {
      return true;
    }

    return false;
  }

  /// True when the server marked the selected subtitle for external delivery,
  /// meaning it belongs outside the transcode URL. A missing delivery method
  /// falls through to false so the index is still sent, matching older servers.
  bool _serverDeliversSubtitleExternally(
    List<Map<String, dynamic>> mediaStreams,
    int? subtitleStreamIndex,
  ) {
    if (subtitleStreamIndex == null || subtitleStreamIndex < 0) return false;
    for (final stream in mediaStreams) {
      if (stream['Type'] != 'Subtitle') continue;
      if (stream['Index'] != subtitleStreamIndex) continue;
      final method = (stream['DeliveryMethod'] as String?)?.toLowerCase();
      return method == 'external';
    }
    return false;
  }

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

    Future<PlaybackInfoResult> fetchPlaybackInfo(String? sourceId) async {
      final request = PlaybackInfoRequest(
        itemId: itemId,
        mediaSourceId: sourceId,
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
    // drifted ids without discarding an explicit version pick. If the server
    // cant resolve it either the id is just stale, so retry without it and
    // play the server's default version instead of failing outright.
    final staticIds = MediaStreamResolver.staticMediaSourceIds(mediaItem);
    final isUnverifiedSourceId = resolvedMediaSourceId != null &&
        resolvedMediaSourceId.isNotEmpty &&
        staticIds.isNotEmpty &&
        !staticIds.contains(resolvedMediaSourceId);

    final PlaybackInfoResult info;
    try {
      PlaybackInfoResult? result;
      try {
        result = await fetchPlaybackInfo(resolvedMediaSourceId);
      } catch (_) {
        if (!isUnverifiedSourceId) rethrow;
      }
      info = result ?? await fetchPlaybackInfo(null);
    } catch (e) {
      if (_isAudioMediaItem(mediaItem)) {
        return _buildAudioUniversalFallback(
          itemId,
          resolvedMediaSourceId,
          maxStreamingBitrate,
          startTimeTicks,
        );
      }
      rethrow;
    }

    final source = _selectBestSource(info.mediaSources, preferredId: resolvedMediaSourceId);
    final hasKnownMediaStreams = source.mediaStreams.isNotEmpty;
    final hasVideoStream = source.mediaStreams.any((stream) => stream['Type'] == 'Video');
    final isAudioByStreams = hasKnownMediaStreams && !hasVideoStream;
    final isAudio = isAudioByStreams || _isAudioMediaItem(mediaItem);
    var (url, playMethod) = _resolveStreamUrl(
      itemId,
      source,
      isAudio: isAudio,
      enableDirectPlay: enableDirectPlay,
      maxStreamingBitrate: maxStreamingBitrate,
    );

    final reasons = mergeTranscodeReasons(
      playMethod: playMethod,
      serverReasons: source.transcodingReasons,
      mediaStreams: source.mediaStreams,
      container: source.container,
      sourceBitrate: source.bitrate,
      maxStreamingBitrate: maxStreamingBitrate,
      audioStreamIndex: audioStreamIndex ?? source.defaultAudioStreamIndex,
      deviceProfile: deviceProfile,
    );

    if (playMethod == StreamPlayMethod.transcode || playMethod == StreamPlayMethod.directStream) {
      // When the server chose to deliver the subtitle externally, it leaves the
      // index off the transcode URL on purpose so the sub stays a separate
      // track the player renders with its own styling. Adding it back here
      // makes the server burn it into the video instead, so drop it for that
      // one case. Encode, Embed, and Hls keep the index since the server needs
      // it and none of them burn a text sub.
      final urlSubtitleIndex =
          playMethod == StreamPlayMethod.transcode &&
              _serverDeliversSubtitleExternally(
                source.mediaStreams,
                subtitleStreamIndex,
              )
          ? null
          : subtitleStreamIndex;
      url = MediaStreamResolver.applyStreamIndices(url, audioStreamIndex, urlSubtitleIndex);
      url = url
          .replaceFirst(RegExp(r'\?StartTimeTicks=\d+&', caseSensitive: false), '?')
          .replaceFirst(RegExp(r'[&?]StartTimeTicks=\d+', caseSensitive: false), '');
    }

    // Append auth token for mpv (which doesn't use our Dio interceptors).
    url = _appendAuth(url);

    final externalSubs = MediaStreamResolver.extractExternalSubtitles(source.mediaStreams, _client.baseUrl);
    final authedSubs = externalSubs.map((s) => ExternalSubtitle(
      deliveryUrl: _appendAuth(s.deliveryUrl),
      title: s.title,
      language: s.language,
      codec: s.codec,
      isDefault: s.isDefault,
      isForced: s.isForced,
      streamIndex: s.streamIndex,
    )).toList();

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
    final requestHeaders = _isServerUrl(url)
        ? _buildRequestHeaders()
        : const <String, String>{};

    final hasEac3Audio = source.mediaStreams.any((stream) =>
        stream['Type'] == 'Audio' &&
        (stream['Codec']?.toString().toLowerCase() ?? '') == 'eac3');
    final hybridAudioUrl = (hasVideoStream && hasEac3Audio)
        ? _buildHybridAudioRemuxUrl(
            itemId,
            source,
            info.playSessionId,
            source.defaultAudioStreamIndex,
          )
        : null;

    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: source.id,
      liveStreamId: source.liveStreamId,
      playSessionId: info.playSessionId,
      requestHeaders: requestHeaders,
      playMethod: playMethod,
      container: source.container,
      videoRangeType: videoRangeType,
      mediaType: mediaType,
      normalizationGainDb: normalizationGainDb,
      externalSubtitles: authedSubs,
      mediaStreams: source.mediaStreams,
      selectedAudioStreamIndex: source.defaultAudioStreamIndex,
      selectedSubtitleStreamIndex: source.defaultSubtitleStreamIndex,
      transcodingReasons: reasons,
      hybridAudioUrl: hybridAudioUrl,
      serverOfferedDirectPlay: source.supportsDirectPlay,
      directPlayRequested: enableDirectPlay,
      sourceBitrate: source.bitrate,
    );
  }

  String? _buildHybridAudioRemuxUrl(
    String itemId,
    PlaybackMediaSource source,
    String? playSessionId,
    int? audioStreamIndex,
  ) {
    if (itemId.isEmpty) return null;
    final params = <String, String>{
      'AudioCodec': 'copy',
      'SegmentContainer': 'mp4',
      'AllowAudioStreamCopy': 'true',
      'EnableAutoStreamCopy': 'true',
      if (source.id.isNotEmpty) 'MediaSourceId': source.id,
      if (playSessionId != null && playSessionId.isNotEmpty)
        'PlaySessionId': playSessionId,
      if (_client.deviceInfo.id.isNotEmpty) 'DeviceId': _client.deviceInfo.id,
      if (audioStreamIndex != null) 'AudioStreamIndex': '$audioStreamIndex',
    };
    final query = params.entries
        .map((entry) => '${entry.key}=${Uri.encodeQueryComponent(entry.value)}')
        .join('&');
    return _appendAuth('${_client.baseUrl}/Audio/$itemId/main.m3u8?$query');
  }

  PlaybackMediaSource _selectBestSource(
    List<PlaybackMediaSource> sources, {
    String? preferredId,
  }) {
    if (preferredId != null) {
      final preferred = sources.where((s) => s.id == preferredId).firstOrNull;
      if (preferred != null) {
        return preferred;
      }
    }
    PlaybackMediaSource? directStream;
    PlaybackMediaSource? transcode;
    for (final s in sources) {
      if (s.supportsDirectPlay) {
        return s;
      }
      directStream ??= s.supportsDirectStream ? s : null;
      transcode ??= s.supportsTranscoding ? s : null;
    }
    return directStream ?? transcode ?? sources.first;
  }

  bool _isServerUrl(String url) => url.startsWith(_client.baseUrl);

  String _appendAuth(String url) {
    final token = _client.accessToken;
    if (token == null || token.isEmpty) return url;
    if (!_isServerUrl(url)) return url;
    final lowerUrl = url.toLowerCase();
    if (lowerUrl.contains('api_key=') || lowerUrl.contains('apikey=')) return url;
    final separator = url.contains('?') ? '&' : '?';
    return '$url${separator}ApiKey=${Uri.encodeComponent(token)}';
  }

  StreamResolutionResult _buildAudioUniversalFallback(
    String itemId,
    String? mediaSourceId,
    int? maxStreamingBitrate,
    int? startTimeTicks,
  ) {
    final msid = (mediaSourceId != null && mediaSourceId.isNotEmpty)
        ? mediaSourceId
        : itemId;
    final params = <String, String>{
      if (_client.userId != null && _client.userId!.isNotEmpty)
        'UserId': _client.userId!,
      if (_client.deviceInfo.id.isNotEmpty) 'DeviceId': _client.deviceInfo.id,
      'MaxStreamingBitrate': '${maxStreamingBitrate ?? 320000000}',
      'Container':
          'mp3,aac,m4a,m4b,flac,alac,ogg,oga,opus,wav,wma,ape,mka,webma',
      'TranscodingContainer': 'ts',
      'TranscodingProtocol': 'hls',
      'AudioCodec': 'aac',
      'StartTimeTicks': '${startTimeTicks ?? 0}',
      'EnableRedirection': 'true',
      'MediaSourceId': msid,
    };
    final query = params.entries
        .map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
    final url = _appendAuth('${_client.baseUrl}/Audio/$itemId/universal?$query');
    return StreamResolutionResult(
      streamUrl: url,
      mediaSourceId: msid,
      playMethod: StreamPlayMethod.directStream,
      requestHeaders: _buildRequestHeaders(),
      mediaType: 'audio',
    );
  }

  String _buildDirectPlayAudioUrl(String itemId, PlaybackMediaSource source) {
    final params = <String, String>{
      if (source.id.isNotEmpty) 'MediaSourceId': source.id,
      if (source.container != null && source.container!.isNotEmpty)
        'Container': source.container!,
      if (source.eTag != null && source.eTag!.isNotEmpty)
        'Tag': source.eTag!,
      if (source.liveStreamId != null && source.liveStreamId!.isNotEmpty)
        'LiveStreamId': source.liveStreamId!,
      'Static': 'true',
    };
    final query = params.entries
        .map((entry) => '${entry.key}=${Uri.encodeQueryComponent(entry.value)}')
        .join('&');
    return '${_client.baseUrl}/Audio/$itemId/stream?$query';
  }

  (String, StreamPlayMethod) _resolveStreamUrl(
    String itemId,
    PlaybackMediaSource source, {
    bool isAudio = false,
    bool enableDirectPlay = true,
    int? maxStreamingBitrate,
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
    // Server-served path (e.g. Jellyfin LiveStreamFiles) is a remux ->
    // directStream (keeps the live session); a remote upstream -> directPlay.
    if (MediaStreamResolver.isLiveSourceDirectPlayEligible(
      enableDirectPlay: enableDirectPlay,
      isManagedLiveStream: isManagedLiveStream,
      path: remotePath,
    )) {
      final resolvedPath =
          MediaStreamResolver.rebaseLiveServerPath(remotePath!, _client.baseUrl);
      final method = _isServerUrl(resolvedPath)
          ? StreamPlayMethod.directStream
          : StreamPlayMethod.directPlay;
      return (resolvedPath, method);
    }

    final route = chooseStreamRoute(
      serverPlayMethod: source.defaultPlayMethod,
      supportsDirectPlay: source.supportsDirectPlay,
      supportsDirectStream: source.supportsDirectStream,
      hasDirectStreamUrl: source.directStreamUrl != null,
      supportsTranscoding: source.supportsTranscoding,
      hasTranscodingUrl: source.transcodingUrl != null,
      enableDirectPlay: enableDirectPlay,
      isAudio: isAudio,
      transcodingReasons: source.transcodingReasons,
      bitrate: source.bitrate,
      maxStreamingBitrate: maxStreamingBitrate,
    );

    switch (route) {
      case JellyfinStreamRoute.audioDirectPlay:
        return (
          _buildDirectPlayAudioUrl(itemId, source),
          StreamPlayMethod.directPlay,
        );
      case JellyfinStreamRoute.directPlay:
      case JellyfinStreamRoute.terminalDirectPlay:
        return (
          _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id, liveStreamId: source.liveStreamId),
          StreamPlayMethod.directPlay,
        );
      case JellyfinStreamRoute.directStream:
        var dsUrl = '${_client.baseUrl}${source.directStreamUrl}';
        if (source.liveStreamId != null) {
          dsUrl = '$dsUrl${dsUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
        }
        return (dsUrl, StreamPlayMethod.directStream);
      case JellyfinStreamRoute.transcode:
        var tcUrl = '${_client.baseUrl}${source.transcodingUrl}';
        if (source.liveStreamId != null) {
          tcUrl = '$tcUrl${tcUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
        }
        return (tcUrl, StreamPlayMethod.transcode);
    }
  }

  static const _videoReEncodeReasons = <String>{
    'videocodecnotsupported',
    'videoprofilenotsupported',
    'videolevelnotsupported',
    'videoresolutionnotsupported',
    'videobitratenotsupported',
    'videoframeratenotsupported',
    'videorangenotsupported',
    'videorangetypenotsupported',
    'videobitdepthnotsupported',
    'anamorphicvideonotsupported',
    'interlacedvideonotsupported',
    'refframesnotsupported',
    'containerbitrateexceedslimit',
    'videobitrateexceedslimit',
    'bitratelimitexceeded',
    'containerbitratenotsupported',
    'resolutionnotsupported',
  };

  /// Picks the route for a source, leaving URL building to the caller.
  ///
  /// Direct play has to lose to a forced transcode and to any video re-encode
  /// reason. The server reports what the source could do, not what this
  /// resolve asked for, so following it alone hands back the original file the
  /// caller was trying to move away from. The server's own verdict still wins
  /// among the routes that survive those gates.
  static JellyfinStreamRoute chooseStreamRoute({
    required PlayMethod? serverPlayMethod,
    required bool supportsDirectPlay,
    required bool supportsDirectStream,
    required bool hasDirectStreamUrl,
    required bool supportsTranscoding,
    required bool hasTranscodingUrl,
    required bool enableDirectPlay,
    required bool isAudio,
    required List<String> transcodingReasons,
    required int? bitrate,
    required int? maxStreamingBitrate,
  }) {
    final lowerReasons = transcodingReasons.map((e) => e.toLowerCase()).toSet();
    var requiresVideoTranscode = lowerReasons.any(
      _videoReEncodeReasons.contains,
    );
    if (maxStreamingBitrate != null &&
        bitrate != null &&
        bitrate > maxStreamingBitrate) {
      requiresVideoTranscode = true;
    }

    final canDirectPlay =
        enableDirectPlay && !requiresVideoTranscode && supportsDirectPlay;
    // A remux copies the video stream through untouched, so a reason to
    // re-encode it rules this out the same way it rules out direct play.
    final canDirectStream =
        supportsDirectStream && hasDirectStreamUrl && !requiresVideoTranscode;
    final canTranscode = supportsTranscoding && hasTranscodingUrl;
    final directPlayRoute = isAudio
        ? JellyfinStreamRoute.audioDirectPlay
        : JellyfinStreamRoute.directPlay;

    if (serverPlayMethod == PlayMethod.directPlay && canDirectPlay) {
      return directPlayRoute;
    }
    if (serverPlayMethod == PlayMethod.directStream && canDirectStream) {
      return JellyfinStreamRoute.directStream;
    }
    if (serverPlayMethod == PlayMethod.transcode && canTranscode) {
      return JellyfinStreamRoute.transcode;
    }

    if (canDirectPlay) return directPlayRoute;
    if (canDirectStream) return JellyfinStreamRoute.directStream;
    if (canTranscode) return JellyfinStreamRoute.transcode;
    return JellyfinStreamRoute.terminalDirectPlay;
  }
}

/// How a Jellyfin source should play.
///
/// [terminalDirectPlay] is the last resort when nothing else resolved, so a
/// source with no remux or transcode URL still plays rather than erroring. It
/// stays separate from [directPlay] because it keeps the plain stream URL even
/// for audio, and because it is the one route no gate can suppress.
enum JellyfinStreamRoute {
  audioDirectPlay,
  directPlay,
  directStream,
  transcode,
  terminalDirectPlay,
}
