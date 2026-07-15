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
    this.isLocalMedia = false,
  });
}
