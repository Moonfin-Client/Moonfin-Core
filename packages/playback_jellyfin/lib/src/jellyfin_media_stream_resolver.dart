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

    final PlaybackInfoResult info;
    try {
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
      info = parsed;
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

    final reasons = List<String>.from(source.transcodingReasons);
    if (playMethod == StreamPlayMethod.transcode) {
      final mediaBitrate = source.bitrate;
      if (maxStreamingBitrate != null &&
          mediaBitrate != null &&
          mediaBitrate > maxStreamingBitrate) {
        final lowerReasons = reasons.map((r) => r.toLowerCase()).toSet();
        if (!lowerReasons.contains('videobitratenotsupported') &&
            !lowerReasons.contains('containerbitrateexceedslimit')) {
          reasons.add('VideoBitrateNotSupported');
        }
      }
    }

    if (playMethod == StreamPlayMethod.transcode || playMethod == StreamPlayMethod.directStream) {
      url = MediaStreamResolver.applyStreamIndices(url, audioStreamIndex, subtitleStreamIndex);
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

    final serverPlayMethod = source.defaultPlayMethod;
    if (serverPlayMethod != null) {
      if (serverPlayMethod == PlayMethod.directPlay && source.supportsDirectPlay) {
        if (isAudio) {
          return (
            _buildDirectPlayAudioUrl(itemId, source),
            StreamPlayMethod.directPlay,
          );
        }
        return (
          _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id, liveStreamId: source.liveStreamId),
          StreamPlayMethod.directPlay,
        );
      }
      if (serverPlayMethod == PlayMethod.directStream && source.supportsDirectStream && source.directStreamUrl != null) {
        var dsUrl = '${_client.baseUrl}${source.directStreamUrl}';
        if (source.liveStreamId != null) {
          dsUrl = '$dsUrl${dsUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
        }
        return (dsUrl, StreamPlayMethod.directStream);
      }
      if (serverPlayMethod == PlayMethod.transcode && source.supportsTranscoding && source.transcodingUrl != null) {
        var tcUrl = '${_client.baseUrl}${source.transcodingUrl}';
        if (source.liveStreamId != null) {
          tcUrl = '$tcUrl${tcUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
        }
        return (tcUrl, StreamPlayMethod.transcode);
      }
    }

    const videoReEncodeReasons = <String>{
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
    final lowerReasons = source.transcodingReasons.map((e) => e.toLowerCase()).toSet();
    var requiresVideoTranscode = lowerReasons.any(videoReEncodeReasons.contains);
    final mediaBitrate = source.bitrate;
    if (maxStreamingBitrate != null && mediaBitrate != null && mediaBitrate > maxStreamingBitrate) {
      requiresVideoTranscode = true;
    }

    if (source.supportsDirectPlay && isAudio) {
      return (
        _buildDirectPlayAudioUrl(itemId, source),
        StreamPlayMethod.directPlay,
      );
    }

    if (source.supportsDirectPlay) {
      return (
        _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id, liveStreamId: source.liveStreamId),
        StreamPlayMethod.directPlay,
      );
    }
    if (source.supportsDirectStream && source.directStreamUrl != null && !requiresVideoTranscode) {
      var dsUrl = '${_client.baseUrl}${source.directStreamUrl}';
      if (source.liveStreamId != null) {
        dsUrl = '$dsUrl${dsUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
      }
      return (dsUrl, StreamPlayMethod.directStream);
    }
    if (source.supportsTranscoding && source.transcodingUrl != null) {
      var tcUrl = '${_client.baseUrl}${source.transcodingUrl}';
      if (source.liveStreamId != null) {
        tcUrl = '$tcUrl${tcUrl.contains('?') ? '&' : '?'}LiveStreamId=${Uri.encodeComponent(source.liveStreamId!)}';
      }
      return (tcUrl, StreamPlayMethod.transcode);
    }
    return (
      _client.playbackApi.getStreamUrl(itemId, mediaSourceId: source.id, liveStreamId: source.liveStreamId),
      StreamPlayMethod.directPlay,
    );
  }
}
