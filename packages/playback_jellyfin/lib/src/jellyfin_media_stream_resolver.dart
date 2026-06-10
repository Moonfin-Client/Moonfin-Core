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
      return type == 'audio';
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

    final request = PlaybackInfoRequest(
      itemId: itemId,
      mediaSourceId: mediaSourceId,
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

    final source = _selectBestSource(info.mediaSources, preferredId: mediaSourceId);
    final hasKnownMediaStreams = source.mediaStreams.isNotEmpty;
    final hasVideoStream = source.mediaStreams.any((stream) => stream['Type'] == 'Video');
    final isAudioByStreams = hasKnownMediaStreams && !hasVideoStream;
    final isAudio = isAudioByStreams || _isAudioMediaItem(mediaItem);
    var (url, playMethod) = _resolveStreamUrl(itemId, source, isAudio: isAudio);

    if (playMethod == StreamPlayMethod.transcode) {
      url = MediaStreamResolver.applyStreamIndices(url, audioStreamIndex, subtitleStreamIndex);
      url = url
          .replaceFirst(RegExp(r'\?StartTimeTicks=\d+&'), '?')
          .replaceFirst(RegExp(r'[&?]StartTimeTicks=\d+'), '');
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
      transcodingReasons: source.transcodingReasons,
    );
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
    return '$url${separator}api_key=${Uri.encodeComponent(token)}';
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
  }) {
    final remotePath = source.path;
    final isManagedLiveStream =
        source.liveStreamId != null && source.liveStreamId!.isNotEmpty;
    if (source.supportsDirectPlay &&
        source.isRemote &&
        !isManagedLiveStream &&
        source.protocol?.toLowerCase() == 'http' &&
        remotePath != null &&
        (remotePath.startsWith('http://') ||
            remotePath.startsWith('https://'))) {
      return (remotePath, StreamPlayMethod.directPlay);
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
    if (source.supportsDirectStream && source.directStreamUrl != null) {
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
