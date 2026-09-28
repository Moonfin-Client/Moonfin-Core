import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:media_kit/media_kit.dart';

class YouTubeStream {
  final String url;

  /// The trailer's own soundtrack language when YouTube lists machine dubbed
  /// ones beside it. A manifest flags none of them as the default, so a player
  /// left to choose takes the first, which is usually a dub.
  final String? audioLanguage;

  const YouTubeStream(this.url, {this.audioLanguage});
}

/// Resolves a YouTube trailer through YouTube's own player API, asked as the
/// Vision Pro app first for a manifest with every resolution in it, then as the
/// Android app, whose muxed file stops at 360p.
class YouTubeStreamResolver {
  static const _resolveTimeout = Duration(seconds: 8);
  static const _requestTimeout = Duration(seconds: 5);
  static Dio _dio = Dio();

  /// YouTube's visitor id outlives a single lookup, so the one it last handed
  /// over is kept.
  static String? _visitorData;

  @visibleForTesting
  static void setDioForTesting(Dio dio) {
    _dio = dio;
    _visitorData = null;
  }

  static const _youtubeOrigin = 'https://www.youtube.com';
  static const _youtubeReferer = 'https://www.youtube.com/';

  static const Map<String, String> youtubeHeaders = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0',
    'Referer': 'https://www.youtube.com/',
  };

  static Uri buildEmbedUri(
    String videoId, {
    required bool muted,
    bool autoplay = true,
    bool showControls = false,
    bool loop = true,
    bool enableJsApi = true,
  }) {
    final params = <String, String>{
      if (autoplay) 'autoplay': '1',
      'mute': muted ? '1' : '0',
      'controls': showControls ? '1' : '0',
      'playsinline': '1',
      'rel': '0',
      'iv_load_policy': '3',
      'fs': '0',
      'disablekb': '1',
      if (enableJsApi) 'enablejsapi': '1',
      if (loop) 'loop': '1',
      if (loop) 'playlist': videoId,
    };

    return Uri.https(
      'www.youtube-nocookie.com',
      '/embed/$videoId',
      params,
    );
  }

  static String buildEmbedUrl(
    String videoId, {
    required bool muted,
    bool autoplay = true,
    bool showControls = false,
    bool loop = true,
    bool enableJsApi = true,
  }) {
    return buildEmbedUri(
      videoId,
      muted: muted,
      autoplay: autoplay,
      showControls: showControls,
      loop: loop,
      enableJsApi: enableJsApi,
    ).toString();
  }

  /// Extracts a YouTube video ID from common URL formats.
  static String? extractVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    final host = uri.host.toLowerCase();

    if (host.contains('youtu.be')) {
      return uri.pathSegments.firstOrNull?.isNotEmpty == true
          ? uri.pathSegments.first
          : null;
    }

    if (host.contains('youtube.com')) {
      final v = uri.queryParameters['v'];
      if (v != null && v.isNotEmpty) return v;

      final parts = uri.pathSegments;
      for (var i = 0; i < parts.length - 1; i++) {
        if (parts[i] == 'embed' ||
            parts[i] == 'shorts' ||
            parts[i] == 'v') {
          final candidate = parts[i + 1];
          if (candidate.isNotEmpty) return candidate;
        }
      }
    }

    return null;
  }

  /// Resolves a YouTube video ID to a streamable URL.
  /// Returns null if resolution fails or times out.
  static Future<YouTubeStream?> resolve(String videoId) async {
    try {
      return await _tryInnertube(videoId)
          .timeout(_resolveTimeout, onTimeout: () => null);
    } catch (_) {
      return null;
    }
  }

  /// Resolves a playable stream from any trailer URL.
  ///
  /// For YouTube URLs this resolves to a stream URL.
  /// For non-YouTube URLs this returns the original URL.
  static Future<YouTubeStream?> resolveFromUrl(String trailerUrl) async {
    final videoId = extractVideoId(trailerUrl);
    if (videoId == null) {
      return YouTubeStream(trailerUrl);
    }
    return resolve(videoId);
  }

  /// Points mpv at [YouTubeStream.audioLanguage]. mpv keeps the choice across
  /// loads, so a reused player is cleared when there is no language.
  static Future<void> preferAudioLanguage(
    Player player,
    String? language,
  ) async {
    final platform = player.platform;
    if (platform is! NativePlayer) return;
    try {
      final dynamic native = platform;
      await Future<void>.value(native.setProperty('alang', language ?? ''));
    } catch (_) {}
  }

  static Future<YouTubeStream?> _tryInnertube(String videoId) async {
    const clients = [
      _InnertubeClient(
        name: 'VISIONOS',
        nameId: '101',
        version: '1.02',
        userAgent:
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 15_7_3) '
            'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 '
            'Safari/605.1.15',
        needsVisitor: true,
        extra: {
          'deviceMake': 'Apple',
          'deviceModel': 'RealityDevice17,1',
          'osName': 'visionOS',
          'osVersion': '26.5.23O471',
        },
      ),
      _InnertubeClient(
        name: 'ANDROID',
        nameId: '3',
        version: '20.10.41',
        userAgent:
            'com.google.android.youtube/20.10.41 (Linux; U; Android 11) gzip',
        apiKey: 'AIzaSyA8eiZmM1FaDVjRy-df2KTyQ_vz_yYM39w',
        platform: 'MOBILE',
        extra: {
          'deviceMake': 'Google',
          'deviceModel': 'Pixel 5',
          'osName': 'Android',
          'osVersion': '11',
          'androidSdkVersion': '30',
        },
      ),
    ];

    for (final client in clients) {
      try {
        final data = await _requestPlayerWithVisitor(videoId, client);
        if (data == null) continue;

        final url = extractInnertubeStreamUrl(data);
        if (url != null) {
          return YouTubeStream(url, audioLanguage: originalAudioLanguage(data));
        }
      } catch (_) {}
    }

    return null;
  }

  /// A client that wants a visitor id and has none kept gets turned away with a
  /// fresh one, so it asks once more with that. A kept id YouTube stops taking
  /// is dropped, so the next lookup starts over.
  static Future<Map<String, dynamic>?> _requestPlayerWithVisitor(
    String videoId,
    _InnertubeClient client,
  ) async {
    final sent = client.needsVisitor ? _visitorData : null;
    final data = await _requestPlayer(videoId, client, sent);
    if (!client.needsVisitor) return data;

    final fresh = freshVisitorData(data, sent);
    if (fresh == null) {
      if (isStaleVisitor(data, sent)) _visitorData = null;
      return data;
    }
    _visitorData = fresh;
    return _requestPlayer(videoId, client, fresh);
  }

  static Future<Map<String, dynamic>?> _requestPlayer(
    String videoId,
    _InnertubeClient client,
    String? visitor,
  ) async {
    final key = client.apiKey == null ? '' : 'key=${client.apiKey}&';
    final response = await _dio.post<Map<String, dynamic>>(
      'https://www.youtube.com/youtubei/v1/player?${key}prettyPrint=false',
      data: buildPlayerRequest(
        videoId,
        clientName: client.name,
        clientVersion: client.version,
        platform: client.platform,
        extra: client.extra,
        visitorData: visitor,
      ),
      options: Options(
        sendTimeout: _requestTimeout,
        receiveTimeout: _requestTimeout,
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': client.userAgent,
          'Origin': _youtubeOrigin,
          'Referer': _youtubeReferer,
          'X-YouTube-Client-Name': client.nameId,
          'X-YouTube-Client-Version': client.version,
          'X-Goog-Visitor-Id': ?visitor,
        },
      ),
    );
    return response.data;
  }

  @visibleForTesting
  static Map<String, dynamic> buildPlayerRequest(
    String videoId, {
    required String clientName,
    required String clientVersion,
    String? platform,
    Map<String, Object?> extra = const {},
    String? visitorData,
  }) {
    return {
      'videoId': videoId,
      'context': {
        'client': {
          'clientName': clientName,
          'clientVersion': clientVersion,
          'hl': 'en',
          'gl': 'US',
          'platform': ?platform,
          'visitorData': ?visitorData,
          ...extra,
        },
      },
      'contentCheckOk': true,
      'racyCheckOk': true,
    };
  }

  /// Every answer carries a visitor id, even one that turned the request away
  /// for lacking it, so asking again is only worth it when the id handed back
  /// isnt the one that was sent.
  @visibleForTesting
  static String? freshVisitorData(
    Map<String, dynamic>? playerResponse,
    String? sent,
  ) {
    if (playerResponse == null) return null;
    final playability =
        playerResponse['playabilityStatus'] as Map<String, dynamic>?;
    if (playability?['status'] == 'OK') return null;
    final context =
        playerResponse['responseContext'] as Map<String, dynamic>?;
    final fresh = context?['visitorData'] as String?;
    if (fresh == null || fresh.isEmpty || fresh == sent) return null;
    return fresh;
  }

  /// YouTube turned the sent id away and handed the same one back, so asking
  /// again with it gets nowhere.
  @visibleForTesting
  static bool isStaleVisitor(Map<String, dynamic>? playerResponse, String? sent) {
    if (sent == null || playerResponse == null) return false;
    final playability =
        playerResponse['playabilityStatus'] as Map<String, dynamic>?;
    if (playability?['status'] != 'LOGIN_REQUIRED') return false;
    final context =
        playerResponse['responseContext'] as Map<String, dynamic>?;
    return context?['visitorData'] == sent;
  }

  /// The language YouTube flags as the trailer's own soundtrack, or null when
  /// it lists no dubs beside it.
  @visibleForTesting
  static String? originalAudioLanguage(Map<String, dynamic> playerResponse) {
    final streamingData =
        playerResponse['streamingData'] as Map<String, dynamic>?;
    final formats = streamingData?['adaptiveFormats'] as List?;
    if (formats == null) return null;
    for (final format in formats.whereType<Map<String, dynamic>>()) {
      final track = format['audioTrack'] as Map<String, dynamic>?;
      if (track == null || track['audioIsDefault'] != true) continue;
      final language = (track['id'] as String? ?? '').split('.').first;
      return language.isEmpty ? null : language;
    }
    return null;
  }

  @visibleForTesting
  static String? extractInnertubeStreamUrl(Map<String, dynamic> playerResponse) {
    final playability = playerResponse['playabilityStatus'] as Map<String, dynamic>?;
    final status = playability?['status'] as String?;
    if (status != null && status != 'OK') {
      return null;
    }

    final streamingData = playerResponse['streamingData'] as Map<String, dynamic>?;
    if (streamingData == null) return null;

    final hlsUrl = streamingData['hlsManifestUrl'] as String?;
    if (hlsUrl != null && hlsUrl.isNotEmpty) {
      return hlsUrl;
    }

    final dashUrl = streamingData['dashManifestUrl'] as String?;
    if (dashUrl != null && dashUrl.isNotEmpty) {
      return dashUrl;
    }

    final formats = (streamingData['formats'] as List?)
            ?.whereType<Map<String, dynamic>>()
            .where((s) =>
                (s['url'] as String?) != null &&
                _streamHasAudio(s))
            .toList() ??
        const <Map<String, dynamic>>[];
    if (formats.isNotEmpty) {
      return _pickBestUrl(formats);
    }

    return null;
  }

  static String? _pickBestUrl(List<Map<String, dynamic>> streams) {
    if (streams.isEmpty) return null;

    String? bestUrl;
    int bestScore = -1 << 20;

    for (final s in streams) {
      final url = s['url'] as String?;
      if (url == null) continue;

      final score = _streamScore(s);
      if (score > bestScore) {
        bestScore = score;
        bestUrl = url;
      }
    }

    return bestUrl ?? (streams.first['url'] as String?);
  }

  static int _streamScore(Map<String, dynamic> stream) {
    final mime = (stream['mimeType'] as String? ?? '').toLowerCase();
    final quality = _qualityFromStream(stream);

    var score = 0;

    if (mime.contains('video/mp4')) score += 2500;
    if (mime.contains('avc1')) score += 2500;

    if (mime.contains('vp9') || mime.contains('vp09')) score -= 1500;
    if (mime.contains('av01')) score -= 2500;

    final clampedQuality = quality > 0 ? quality.clamp(144, 1080) : 480;
    final qualityDelta = (clampedQuality - 480).abs().toInt();
    score += 1000 - qualityDelta;

    return score;
  }

  static int _qualityFromStream(Map<String, dynamic> stream) {
    final label = stream['qualityLabel'] as String? ?? '';
    return int.tryParse(label.split(RegExp(r'[p@]')).first.trim()) ?? 0;
  }

  static bool _streamHasAudio(Map<String, dynamic> stream) {
    final mime = (stream['mimeType'] as String? ?? '').toLowerCase();
    return mime.contains('mp4a') ||
        mime.contains('opus') ||
        mime.contains('vorbis') ||
        mime.contains('audio');
  }
}

/// A client with [needsVisitor] turns away a request that carries no visitor id.
class _InnertubeClient {
  final String name;
  final String nameId;
  final String version;
  final String userAgent;
  final String? apiKey;
  final String? platform;
  final Map<String, Object?> extra;
  final bool needsVisitor;

  const _InnertubeClient({
    required this.name,
    required this.nameId,
    required this.version,
    required this.userAgent,
    this.apiKey,
    this.platform,
    this.extra = const {},
    this.needsVisitor = false,
  });
}
