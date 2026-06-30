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

  static String applyStreamIndices(String url, int? audioStreamIndex, int? subtitleStreamIndex) {
    try {
      final uri = Uri.parse(url);
      final params = Map<String, String>.from(uri.queryParameters);

      // Emby & Jellyfin streaming URLs use PascalCase stream indices. Emby's
      // query-parameter binding is case-INSENSITIVE, so emitting BOTH
      // `AudioStreamIndex` and `audioStreamIndex` makes the server merge the two
      // values into "1,1", which fails integer parsing -> HTTP 500 on the
      // manifest ("Failed to open" / source error, especially when resuming an
      // audio-transcoded stream). Emit a single canonical key and strip any
      // camelCase variant.
      if (audioStreamIndex != null) {
        params.remove('audioStreamIndex');
        params['AudioStreamIndex'] = '$audioStreamIndex';
      }

      if (subtitleStreamIndex != null) {
        if (subtitleStreamIndex >= 0) {
          params.remove('subtitleStreamIndex');
          params['SubtitleStreamIndex'] = '$subtitleStreamIndex';
        } else if (subtitleStreamIndex == -1) {
          params.remove('SubtitleStreamIndex');
          params.remove('subtitleStreamIndex');
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
