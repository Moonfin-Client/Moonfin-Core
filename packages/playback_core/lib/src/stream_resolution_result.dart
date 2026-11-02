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

  ExternalSubtitle withDeliveryUrl(String url) => ExternalSubtitle(
    deliveryUrl: url,
    title: title,
    language: language,
    codec: codec,
    isDefault: isDefault,
    isForced: isForced,
    streamIndex: streamIndex,
  );
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

  /// Embedded SRT and WebVTT tracks the server can serve as files, offered
  /// only as a secondary subtitle.
  final List<ExternalSubtitle> embeddedTextSubtitles;
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

  /// What to add to the player's position to get the position in the media.
  ///
  /// Zero when the stream starts at the start of the file, which is every
  /// Jellyfin and Emby stream: their transcodes keep the source timeline. A
  /// server can also cut a stream at the resume point (Silo's remuxes start
  /// at the keyframe before it), and the player then counts from that cut.
  /// The playback manager adds the offset to everything it reads from the
  /// player (position, duration) and takes it off every seek, so progress
  /// reports, the seek bar, chapters and trickplay stay on the media's own
  /// timeline.
  final Duration timelineOffset;

  /// The player can't seek this stream on its own: a seek goes to the server
  /// as a replan (see [StreamReplanner]), which answers a stream starting
  /// there. Silo's remuxes are produced as they play, so they have no bytes
  /// past what is produced and no ranges to seek in. False for every
  /// Jellyfin and Emby stream.
  final bool seeksThroughServer;

  /// How long the viewer can pause before the server drops the stream. A
  /// longer pause is resumed by replanning at the position (as a seek)
  /// rather than playing a stream the server has closed. Null when the
  /// server keeps it.
  final Duration? reopenAfterPause;

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
    this.embeddedTextSubtitles = const [],
    this.mediaStreams = const [],
    this.selectedAudioStreamIndex,
    this.selectedSubtitleStreamIndex,
    this.transcodingReasons = const [],
    this.hybridAudioUrl,
    this.serverOfferedDirectPlay,
    this.directPlayRequested,
    this.sourceBitrate,
    this.isLocalMedia = false,
    this.timelineOffset = Duration.zero,
    this.seeksThroughServer = false,
    this.reopenAfterPause,
  });

  /// What the server said it would send, read off the transcode URL.
  ///
  /// PlaybackInfo describes the file rather than the transcode, so the URL is
  /// the only place the target is stated. Null for direct play and for a URL
  /// that carries none of it, which leaves callers on the source values. Each
  /// field is null on its own too, since which ones the server states depends
  /// on what the profile constrained.
  ({
    String? container,
    String? videoCodec,
    String? audioCodec,
    int? videoBitrate,
    int? audioBitrate,
    int? totalBitrate,
  })?
  get deliveredFormat {
    if (playMethod != StreamPlayMethod.transcode) return null;

    final query = Uri.tryParse(streamUrl)?.queryParameters;
    if (query == null || query.isEmpty) return null;

    // Servers differ on the casing of these, so match on a lowered key.
    final lowered = <String, String>{
      for (final entry in query.entries) entry.key.toLowerCase(): entry.value,
    };
    String? text(String key) {
      final value = lowered[key]?.trim();
      return (value == null || value.isEmpty) ? null : value;
    }

    int? number(String key) {
      final parsed = int.tryParse(lowered[key] ?? '');
      return (parsed != null && parsed > 0) ? parsed : null;
    }

    final videoBitrate = number('videobitrate');
    final audioBitrate = number('audiobitrate');
    return (
      // HLS names the segment container, everything else names the container.
      container: text('segmentcontainer') ?? text('container'),
      videoCodec: text('videocodec'),
      audioCodec: text('audiocodec'),
      videoBitrate: videoBitrate,
      audioBitrate: audioBitrate,
      // The server states the two targets separately, so the pair adds up to
      // what it sends. Older URLs carry only the overall cap.
      totalBitrate: (videoBitrate == null && audioBitrate == null)
          ? number('maxstreamingbitrate')
          : (videoBitrate ?? 0) + (audioBitrate ?? 0),
    );
  }

  /// Bits per second on the wire, or null when that is the source figure.
  int? get deliveredBitrate => deliveredFormat?.totalBitrate;
}
