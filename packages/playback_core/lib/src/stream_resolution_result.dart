enum StreamPlayMethod { directPlay, directStream, transcode }

class ExternalSubtitle {
  final String deliveryUrl;
  final String? title;
  final String? language;
  final String codec;
  final bool isDefault;
  final bool isForced;
  final int? streamIndex;

  const ExternalSubtitle({
    required this.deliveryUrl,
    this.title,
    this.language,
    required this.codec,
    this.isDefault = false,
    this.isForced = false,
    this.streamIndex,
  });
}

class StreamResolutionResult {
  final String streamUrl;
  final String mediaSourceId;
  final String? liveStreamId;
  final String? playSessionId;
  final Map<String, String> requestHeaders;
  final StreamPlayMethod playMethod;
  final String? container;
  final String? videoRangeType;
  final String mediaType;
  final double? normalizationGainDb;
  final List<ExternalSubtitle> externalSubtitles;
  final List<Map<String, dynamic>> mediaStreams;
  final int? selectedAudioStreamIndex;
  final int? selectedSubtitleStreamIndex;
  final List<String> transcodingReasons;
  final String? hybridAudioUrl;

  /// Whether the server offered this source for direct play, and whether this
  /// resolve asked for it. A transcode that names no reason was declined by
  /// one of these two, and without them a report can't say which. Null where
  /// the source never went through a server decision.
  final bool? serverOfferedDirectPlay;
  final bool? directPlayRequested;

  /// Source bitrate as the server reported it, the figure the streaming
  /// ceiling is weighed against.
  final int? sourceBitrate;

  /// True when [streamUrl] is a local file path served from the downloads
  /// store rather than a server stream URL.
  final bool isLocalMedia;

  const StreamResolutionResult({
    required this.streamUrl,
    required this.mediaSourceId,
    this.liveStreamId,
    this.playSessionId,
    this.requestHeaders = const {},
    required this.playMethod,
    this.container,
    this.videoRangeType,
    this.mediaType = 'video',
    this.normalizationGainDb,
    this.externalSubtitles = const [],
    this.mediaStreams = const [],
    this.selectedAudioStreamIndex,
    this.selectedSubtitleStreamIndex,
    this.transcodingReasons = const [],
    this.hybridAudioUrl,
    this.serverOfferedDirectPlay,
    this.directPlayRequested,
    this.sourceBitrate,
    this.isLocalMedia = false,
  });

  /// Bits per second actually being delivered, when that differs from the
  /// source. A transcode carries its target in the stream URL, so reporting
  /// the source bitrate would name a figure that is not on the wire. Null for
  /// direct play, and null when the URL says nothing, which leaves callers on
  /// the source value.
  int? get deliveredBitrate {
    if (playMethod != StreamPlayMethod.transcode) return null;

    final query = Uri.tryParse(streamUrl)?.queryParameters;
    if (query == null || query.isEmpty) return null;

    // Servers differ on the casing of these, so match on a lowered key.
    final lowered = <String, String>{
      for (final entry in query.entries) entry.key.toLowerCase(): entry.value,
    };
    int? value(String key) {
      final parsed = int.tryParse(lowered[key] ?? '');
      return (parsed != null && parsed > 0) ? parsed : null;
    }

    // The server states the video and audio targets separately, so the pair
    // adds up to what it sends. Older URLs carry only the overall cap.
    final video = value('videobitrate');
    final audio = value('audiobitrate');
    if (video != null || audio != null) {
      return (video ?? 0) + (audio ?? 0);
    }
    return value('maxstreamingbitrate');
  }
}
