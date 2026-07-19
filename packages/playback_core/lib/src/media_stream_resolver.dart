import 'stream_resolution_result.dart';
import 'web_platform.dart';

abstract class MediaStreamResolver {
  static String extractItemId(dynamic mediaItem) {
    if (mediaItem is Map) return mediaItem['Id'] as String;
    return mediaItem.id as String;
  }

  static String? resolveStaticMediaSourceId(
    dynamic mediaItem,
    String? mediaSourceId,
  ) {
    if (mediaSourceId == null || mediaSourceId.isEmpty) return mediaSourceId;
    final sources = _staticMediaSources(mediaItem);
    if (sources == null || sources.isEmpty) return mediaSourceId;
    final staticIds = sources.map(_mediaSourceId).toSet();
    if (staticIds.contains(mediaSourceId)) return mediaSourceId;
    return staticIds.first;
  }

  static List<dynamic>? _staticMediaSources(dynamic mediaItem) {
    if (mediaItem is Map) return mediaItem['MediaSources'] as List<dynamic>?;
    try {
      return mediaItem.mediaSources as List<dynamic>?;
    } catch (_) {
      return null;
    }
  }

  static String _mediaSourceId(dynamic source) {
    if (source is Map) return (source['Id'] ?? source['id']).toString();
    return source.id.toString();
  }

  /// Whether a managed live stream (Live TV) should be played directly from its
  /// source `path` instead of the server's HLS transcode session.
  ///
  /// Live sources are reported by the server as transcode-only, so without this
  /// they always transcode. The source `path` is a direct/remux feed: either the
  /// upstream URL, or the server's own remuxed stream (e.g. Jellyfin's
  /// `/LiveTv/LiveStreamFiles/.../stream.ts`). Playing it directly avoids the
  /// re-encoding HLS pipeline (the manager's error -> re-resolve-with-transcode
  /// fallback covers codecs the player can't handle). Excluded on web
  /// (cross-origin direct play is blocked there).
  static bool isLiveSourceDirectPlayEligible({
    required bool enableDirectPlay,
    required bool isManagedLiveStream,
    required String? path,
  }) {
    if (!enableDirectPlay || isWebPlatform || !isManagedLiveStream) return false;
    return path != null &&
        (path.startsWith('http://') || path.startsWith('https://'));
  }

  /// Whether a remote HTTP source `path` (typically a `.strm` file, which the
  /// server reports as `Protocol: Http` + `IsRemote: true` with the URL from the
  /// file as its `Path`) can be fetched by this client instead of streaming
  /// through the server.
  ///
  /// A `.strm` URL is written from the server's point of view, so it often names
  /// a host only the server can reach: loopback, or a LAN address. Handing that
  /// to the player from a device outside that network gives a black screen. The
  /// server can always reach it, so the safe answer is to fall through to
  /// `/Videos/{id}/stream` and let the server pull the source.
  ///
  /// Loopback is never usable. A private/LAN host is only usable when we reached
  /// the server itself over a private address, which means we're on that network.
  /// Public hosts stay direct so genuine internet sources aren't proxied for no
  /// reason. Excluded on web (cross-origin direct play is blocked there) and
  /// whenever direct play is off, so a forced transcode isn't handed a raw URL.
  static bool isRemoteDirectPlayEligible({
    required bool enableDirectPlay,
    required bool isRemote,
    required bool isManagedLiveStream,
    required bool supportsDirectPlay,
    required String? protocol,
    required String? path,
    required String serverBaseUrl,
  }) {
    if (!enableDirectPlay || isWebPlatform) return false;
    if (!isRemote || !supportsDirectPlay || isManagedLiveStream) return false;
    if (protocol?.toLowerCase() != 'http') return false;
    if (path == null ||
        !(path.startsWith('http://') || path.startsWith('https://'))) {
      return false;
    }

    final host = Uri.tryParse(path)?.host.toLowerCase() ?? '';
    if (host.isEmpty || _isLoopbackHost(host)) return false;
    if (!_isPrivateHost(host)) return true;

    final serverHost = Uri.tryParse(serverBaseUrl)?.host.toLowerCase() ?? '';
    return _isPrivateHost(serverHost);
  }

  static final RegExp _privateIpv6 = RegExp(r'^(f[cd]|fe[89ab])');

  static bool _isLoopbackHost(String host) =>
      host == 'localhost' || host == '::1' || host.startsWith('127.');

  /// Hosts that only resolve inside the server's own network: RFC1918 and
  /// link-local ranges, unique-local and link-local IPv6, mDNS names, and bare
  /// single-label hostnames.
  static bool _isPrivateHost(String host) {
    if (_isLoopbackHost(host)) return true;
    if (host.contains(':')) return _privateIpv6.hasMatch(host);
    if (host.startsWith('10.') ||
        host.startsWith('192.168.') ||
        host.startsWith('169.254.')) {
      return true;
    }
    if (host.startsWith('172.')) {
      final parts = host.split('.');
      final secondOctet = parts.length > 1 ? int.tryParse(parts[1]) : null;
      if (secondOctet != null && secondOctet >= 16 && secondOctet <= 31) {
        return true;
      }
    }
    if (host.endsWith('.local')) return true;
    return !host.contains('.');
  }

  /// Re-authorities a server-owned Live TV path onto the connected server base.
  ///
  /// Emby/Jellyfin can return the server's own remux endpoint
  /// (`/LiveTv/LiveStreamFiles/{id}/stream.ts`) as an ABSOLUTE URL built with
  /// the server's internal bind address — loopback or a container-private host
  /// (e.g. `http://127.0.0.1:8096/LiveTv/LiveStreamFiles/…`) — when it sits
  /// behind a reverse proxy that doesn't set a published server URL. That host
  /// is unreachable from a remote client, so the direct-play/-stream branch must
  /// not use it verbatim. This swaps the scheme+host+port to [baseUrl] while
  /// preserving the path and query. Genuine remote upstream URLs (not a server
  /// LiveStreamFiles endpoint and not a loopback host) are returned unchanged.
  static String rebaseLiveServerPath(String path, String baseUrl) {
    final uri = Uri.tryParse(path);
    if (uri == null || !uri.hasAuthority) return path;

    final host = uri.host.toLowerCase();
    final isLoopback =
        host == 'localhost' || host == '::1' || host.startsWith('127.');
    final isServerRemux = uri.path.contains('/LiveTv/LiveStreamFiles/');
    if (!isLoopback && !isServerRemux) return path;

    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return uri.hasQuery ? '$base${uri.path}?${uri.query}' : '$base${uri.path}';
  }

  static String applyStreamIndices(String url, int? audioStreamIndex, int? subtitleStreamIndex) {
    try {
      final uri = Uri.parse(url);
      final params = Map<String, String>.from(uri.queryParameters);

      // Emby & Jellyfin streaming URLs use PascalCase stream indices. Emby's
      // query-parameter binding is case-INSENSITIVE, so emitting BOTH
      // `AudioStreamIndex` and `audioStreamIndex` makes the server merge the two
      // values into "1,1", which fails integer parsing -> HTTP 500 on the
      // manifest ("Failed to open" / source error, especially when resuming an
      // audio-transcoded stream). Emit a single canonical key and strip every
      // other casing (exact-key remove would miss e.g. server-echoed variants).
      if (audioStreamIndex != null) {
        params.removeWhere((key, _) => key.toLowerCase() == 'audiostreamindex');
        params['AudioStreamIndex'] = '$audioStreamIndex';
      }

      if (subtitleStreamIndex != null &&
          (subtitleStreamIndex >= 0 || subtitleStreamIndex == -1)) {
        params.removeWhere(
          (key, _) => key.toLowerCase() == 'subtitlestreamindex',
        );
        if (subtitleStreamIndex >= 0) {
          params['SubtitleStreamIndex'] = '$subtitleStreamIndex';
        }
      }

      return uri.replace(queryParameters: params).toString();
    } catch (_) {
      return url;
    }
  }

  static List<ExternalSubtitle> extractExternalSubtitles(
    List<Map<String, dynamic>> mediaStreams,
    String baseUrl,
  ) {
    final subs = <ExternalSubtitle>[];
    for (final stream in mediaStreams) {
      if (stream['Type'] != 'Subtitle') continue;
      final deliveryUrl = stream['DeliveryUrl'] as String?;
      if (deliveryUrl == null || deliveryUrl.isEmpty) continue;
      final isExternal = stream['IsExternal'] == true;
      final supportsExternal = stream['SupportsExternalStream'] == true;
      if (!isExternal && !supportsExternal) continue;
      subs.add(ExternalSubtitle(
        deliveryUrl: '$baseUrl$deliveryUrl',
        title: stream['DisplayTitle'] as String? ??
            stream['Title'] as String?,
        language: stream['Language'] as String?,
        codec: (stream['Codec'] as String?) ?? 'srt',
        isDefault: stream['IsDefault'] as bool? ?? false,
        isForced: stream['IsForced'] as bool? ?? false,
        streamIndex: stream['Index'] as int?,
      ));
    }
    return subs;
  }

  static String detectMediaType(
    List<Map<String, dynamic>> mediaStreams, {
    String fallbackUrl = '',
  }) {
    var hasVideo = false;
    var hasAudio = false;

    for (final stream in mediaStreams) {
      final type = stream['Type']?.toString().toUpperCase();
      if (type == 'VIDEO') {
        hasVideo = true;
      } else if (type == 'AUDIO') {
        hasAudio = true;
      }
      if (hasVideo && hasAudio) {
        break;
      }
    }

    if (hasVideo) {
      return 'video';
    }
    if (hasAudio) {
      return 'audio';
    }

    final uri = Uri.tryParse(fallbackUrl);
    final path = uri?.path.toLowerCase() ?? fallbackUrl.toLowerCase();
    const audioExtensions = <String>{
      '.mp3',
      '.flac',
      '.aac',
      '.m4a',
      '.ogg',
      '.opus',
      '.wav',
      '.alac',
      '.ape',
      '.wma',
    };
    for (final ext in audioExtensions) {
      if (path.endsWith(ext)) {
        return 'audio';
      }
    }

    return 'video';
  }

  static double? extractNormalizationGainDb(
    List<Map<String, dynamic>> mediaStreams,
  ) {
    for (final stream in mediaStreams) {
      if ((stream['Type']?.toString().toUpperCase() ?? '') != 'AUDIO') {
        continue;
      }

      for (final key in const <String>[
        'NormalizationGain',
        'normalizationGain',
        'ReplayGain',
        'replayGain',
        'TrackGain',
        'trackGain',
      ]) {
        final parsed = _parseGain(stream[key]);
        if (parsed != null) {
          return parsed;
        }
      }
    }
    return null;
  }

  static double? _parseGain(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      final normalized = value.trim().replaceAll(
        RegExp(r'\s*dB\s*$', caseSensitive: false),
        '',
      );
      return double.tryParse(normalized);
    }
    return null;
  }

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
  });
}
