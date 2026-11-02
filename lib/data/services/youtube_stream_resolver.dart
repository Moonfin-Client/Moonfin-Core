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

typedef YouTubeVideoDetails = ({
  String? title,
  Duration? length,
  String? channel,
});

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
    _searches.clear();
    _details.clear();
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

  static final _searches = <String, Future<String?>>{};

  /// A YouTube link to the top search hit for [title]'s trailer, for a server
  /// that keeps no trailer links of its own. Asked as the web client, whose
  /// top hit is usually the studio's own upload. Kept per title, since the
  /// media bar comes back to the same slides, but a failed search isn't kept
  /// so the next try asks again.
  static Future<String?> searchTrailer(String title, {int? year}) {
    final query = [title, ?year, 'trailer'].join(' ');
    return _searches.putIfAbsent(
      query,
      () => _searchVideoId(query).then((id) {
        if (id == null) _searches.remove(query);
        return id == null ? null : 'https://www.youtube.com/watch?v=$id';
      }),
    );
  }

  static Future<String?> _searchVideoId(String query) async {
    try {
      final response = await _dio
          .post<Map<String, dynamic>>(
            'https://www.youtube.com/youtubei/v1/search?prettyPrint=false',
            data: {
              'context': {
                'client': {
                  'clientName': 'WEB',
                  'clientVersion': '2.20260101.00.00',
                  'hl': 'en',
                  'gl': 'US',
                },
              },
              'query': query,
              // Videos only, leaving out channels and playlists.
              'params': 'EgIQAQ%3D%3D',
            },
            options: Options(
              sendTimeout: _requestTimeout,
              receiveTimeout: _requestTimeout,
              headers: {
                'Content-Type': 'application/json',
                'Origin': _youtubeOrigin,
                'Referer': _youtubeReferer,
              },
            ),
          )
          .timeout(_resolveTimeout);
      return firstSearchVideoId(response.data);
    } catch (_) {
      return null;
    }
  }

  /// The first video in a search answer, in the order YouTube ranked them.
  @visibleForTesting
  static String? firstSearchVideoId(Object? node) {
    if (node is Map) {
      final video = node['videoRenderer'];
      if (video is Map && video['videoId'] is String) {
        return video['videoId'] as String;
      }
      node = node.values;
    }
    if (node is Iterable) {
      for (final child in node) {
        if (firstSearchVideoId(child) case final id?) return id;
      }
    }
    return null;
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

  /// What mpv opens for a preview, with [player] set up to match. A YouTube
  /// master is cut down to one variant, since mpv reads every variant of a
  /// master before it starts, which takes several seconds on a TV where one
  /// variant starts in about one. A master that can't be read keeps a 5 Mbps
  /// cap, which lands on YouTube's 1080p H.264 variant rather than 4K VP9. The
  /// player is reused, so anything else clears both settings.
  static Future<Media> previewMedia(
    Player player,
    String url, {
    required bool youTube,
    Map<String, String> headers = const {},
    int maxHeight = 1080,
    String? audioLanguage,
  }) async {
    final variant = youTube
        ? await _singleVariant(
            url,
            maxHeight: maxHeight,
            audioLanguage: audioLanguage,
          )
        : null;
    final platform = player.platform;
    if (platform is NativePlayer) {
      try {
        final dynamic mpv = platform;
        await mpv.setProperty('hls-bitrate', youTube ? '5000000' : 'max');
        // A path list splits on colons, so a URL goes in through change-list.
        await mpv.command(['change-list', 'audio-files', 'clr', '']);
        final audio = variant?.audio;
        if (audio != null) {
          await mpv.command([
            'change-list',
            'audio-files',
            'append',
            audio,
          ]);
        }
      } catch (_) {}
    }
    final mediaUrl = variant?.video ?? url;
    final mediaHeaders = youTube ? youtubeHeaders : headers;
    return mediaHeaders.isEmpty
        ? Media(mediaUrl)
        : Media(mediaUrl, httpHeaders: mediaHeaders);
  }

  /// One H.264 variant of a YouTube HLS master no taller than [maxHeight], and
  /// the audio that goes with it. Null when [url] isn't a master or can't be
  /// read.
  static Future<({String video, String? audio})?> _singleVariant(
    String url, {
    int maxHeight = 1080,
    String? audioLanguage,
  }) async {
    if (!url.contains('/hls_variant/')) return null;
    try {
      final response = await _dio
          .get<String>(
            url,
            options: Options(
              headers: youtubeHeaders,
              responseType: ResponseType.plain,
            ),
          )
          .timeout(_requestTimeout);
      return pickVariant(
        response.data ?? '',
        Uri.parse(url),
        maxHeight: maxHeight,
        audioLanguage: audioLanguage,
      );
    } catch (_) {
      return null;
    }
  }

  /// The best variant in [master] no taller than [maxHeight], H.264 first,
  /// with its original soundtrack. YouTube lists machine dubs ahead of the
  /// original and marks none as the default, so the original is looked for by
  /// name before [audioLanguage].
  @visibleForTesting
  static ({String video, String? audio})? pickVariant(
    String master,
    Uri base, {
    required int maxHeight,
    String? audioLanguage,
  }) {
    final lines = master.split('\n').map((line) => line.trim()).toList();
    final audioGroups = <String, List<Map<String, String>>>{};
    final variants = <({Map<String, String> attrs, String uri})>[];
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (line.startsWith('#EXT-X-MEDIA:')) {
        final attrs = _hlsAttributes(line);
        if (attrs['TYPE'] == 'AUDIO' && attrs['URI'] != null) {
          audioGroups.putIfAbsent(attrs['GROUP-ID'] ?? '', () => []).add(attrs);
        }
      } else if (line.startsWith('#EXT-X-STREAM-INF:') &&
          i + 1 < lines.length &&
          lines[i + 1].isNotEmpty &&
          !lines[i + 1].startsWith('#')) {
        variants.add((attrs: _hlsAttributes(line), uri: lines[i + 1]));
      }
    }
    if (variants.isEmpty) return null;

    int height(Map<String, String> attrs) =>
        int.tryParse(attrs['RESOLUTION']?.split('x').last ?? '') ?? 0;
    int bandwidth(Map<String, String> attrs) =>
        int.tryParse(attrs['BANDWIDTH'] ?? '') ?? 0;
    bool h264(Map<String, String> attrs) =>
        (attrs['CODECS'] ?? '').contains('avc1');

    final fitting = variants
        .where((v) => height(v.attrs) > 0 && height(v.attrs) <= maxHeight)
        .toList();
    final pool = fitting.any((v) => h264(v.attrs))
        ? fitting.where((v) => h264(v.attrs)).toList()
        : fitting;
    final chosen = pool.isNotEmpty
        ? pool.reduce(
            (a, b) => bandwidth(b.attrs) > bandwidth(a.attrs) ? b : a,
          )
        : variants.reduce(
            (a, b) => height(b.attrs) < height(a.attrs) ? b : a,
          );

    final group = audioGroups[chosen.attrs['AUDIO']] ?? const [];
    final language = audioLanguage?.toLowerCase();
    bool isOriginal(Map<String, String> track) =>
        (track['NAME'] ?? '').toLowerCase().contains('original');
    bool inLanguage(Map<String, String> track) =>
        language != null &&
        (track['LANGUAGE'] ?? '').toLowerCase().startsWith(language);
    final track =
        group.where(isOriginal).firstOrNull ??
        group.where(inLanguage).firstOrNull ??
        group.firstOrNull;
    final audioUri = track?['URI'];
    return (
      video: base.resolve(chosen.uri).toString(),
      audio: audioUri == null ? null : base.resolve(audioUri).toString(),
    );
  }

  static final _hlsAttribute = RegExp(r'([A-Z0-9-]+)=("[^"]*"|[^,]*)');

  static Map<String, String> _hlsAttributes(String line) {
    final list = line.substring(line.indexOf(':') + 1);
    return {
      for (final match in _hlsAttribute.allMatches(list))
        match.group(1)!: match.group(2)!.replaceAll('"', ''),
    };
  }

  static final _details = <String, Future<YouTubeVideoDetails?>>{};

  /// A video's title, length and channel, for listing it before it plays.
  /// Kept per video, but a failed lookup isn't kept so the next try asks
  /// again.
  static Future<YouTubeVideoDetails?> details(String videoId) =>
      _details.putIfAbsent(videoId, () async {
        YouTubeVideoDetails? details;
        try {
          details = videoDetailsOf(
            await _requestPlayerWithVisitor(
              videoId,
              _visionOs,
            ).timeout(_resolveTimeout),
          );
        } catch (_) {}
        if (details == null) _details.remove(videoId);
        return details;
      });

  @visibleForTesting
  static YouTubeVideoDetails? videoDetailsOf(Map<String, dynamic>? data) {
    final details = data?['videoDetails'];
    if (details is! Map) return null;
    final seconds = int.tryParse('${details['lengthSeconds']}');
    final title = details['title'];
    final author = details['author'];
    return (
      title: title is String && title.isNotEmpty ? title : null,
      length: seconds == null || seconds <= 0
          ? null
          : Duration(seconds: seconds),
      channel: author is String && author.isNotEmpty ? author : null,
    );
  }

  static const _visionOs = _InnertubeClient(
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
  );

  /// Turns captions on or off for the next load. media_kit turns on any
  /// subtitle track it finds, so off has to be asked for outright.
  static Future<void> showCaptions(
    Player player,
    bool show, {
    String? language,
  }) async {
    final platform = player.platform;
    if (platform is! NativePlayer) return;
    try {
      final dynamic native = platform;
      await Future<void>.value(native.setProperty('sid', show ? 'auto' : 'no'));
      await Future<void>.value(
        native.setProperty('slang', show ? language ?? '' : ''),
      );
    } catch (_) {}
  }

  static Future<YouTubeStream?> _tryInnertube(String videoId) async {
    const clients = [
      _visionOs,
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
