import 'stream_resolution_result.dart';

/// Reasons the client can work out on its own by holding what came back
/// against the profile it asked with.
///
/// Jellyfin states its reasons on the media source. Emby has no field for them
/// at all, so an Emby transcode reads as "Unknown" everywhere they are shown
/// and the play method collapses to a bare "Transcoding". These fill that in
/// using the same tokens Jellyfin sends, so both servers read alike.
///
/// [serverReasons] always come first and are never second guessed, so a server
/// that explained itself keeps its own wording.
List<String> mergeTranscodeReasons({
  required StreamPlayMethod playMethod,
  List<String> serverReasons = const <String>[],
  List<Map<String, dynamic>> mediaStreams = const <Map<String, dynamic>>[],
  String? container,
  int? sourceBitrate,
  int? maxStreamingBitrate,
  int? audioStreamIndex,
  int? subtitleStreamIndex,
  Map<String, dynamic>? deviceProfile,
}) {
  final reasons = List<String>.of(serverReasons);
  if (playMethod != StreamPlayMethod.transcode) return reasons;

  final seen = reasons.map((r) => r.toLowerCase()).toSet();
  void add(String reason, [Set<String> alsoCovers = const <String>{}]) {
    final lower = reason.toLowerCase();
    if (seen.contains(lower) || alsoCovers.any(seen.contains)) return;
    reasons.add(reason);
    seen.add(lower);
  }

  // A ceiling the source runs past is the one thing servers word half a dozen
  // ways, so any of those spellings counts as already said.
  if (maxStreamingBitrate != null &&
      sourceBitrate != null &&
      sourceBitrate > maxStreamingBitrate) {
    add('VideoBitrateNotSupported', _bitrateReasons);
  }

  // With no streams there is nothing to hold the profile against.
  if (mediaStreams.isEmpty) return reasons;

  // An audio source has to be read against the audio profile. Judging a flac
  // by the video containers would call every music transcode a container
  // problem.
  final video = _streamsOfType(mediaStreams, 'video');
  final profiles = _directPlayProfiles(
    deviceProfile,
    video.isEmpty ? 'audio' : 'video',
  );
  if (profiles.isEmpty) return reasons;

  final normalizedContainer = container?.toLowerCase().trim();
  if (normalizedContainer != null &&
      normalizedContainer.isNotEmpty &&
      _rejects(profiles, 'Container', normalizedContainer)) {
    add('ContainerNotSupported');
  }

  final videoCodec = _codecOf(video.firstOrNull);
  if (videoCodec != null && _rejects(profiles, 'VideoCodec', videoCodec)) {
    add('VideoCodecNotSupported');
  }

  final audioCodec = _codecOf(
    _selectedStream(mediaStreams, 'audio', audioStreamIndex),
  );
  if (audioCodec != null && _rejects(profiles, 'AudioCodec', audioCodec)) {
    add('AudioCodecNotSupported');
  }

  // A transcode caused only by the subtitle did not carry a reason in
  // TranscodingReasons, so the reason list reads as empty. Projecting
  // the profile against the picked stream gives it back.
  final subtitleProfiles = _subtitleProfiles(deviceProfile);
  if (subtitleProfiles.isNotEmpty &&
      subtitleStreamIndex != null &&
      subtitleStreamIndex >= 0) {
    final subtitleStream = _selectedStream(
      mediaStreams,
      'subtitle',
      subtitleStreamIndex,
    );
    final subtitleCodec = _codecOf(subtitleStream);
    if (subtitleCodec != null &&
        _subtitleNeedsBurnIn(subtitleProfiles, subtitleCodec)) {
      add('SubtitleCodecNotSupported');
    }
  }

  return reasons;
}

List<Map<String, dynamic>> _subtitleProfiles(
  Map<String, dynamic>? deviceProfile,
) {
  final raw = deviceProfile?['SubtitleProfiles'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((e) => e.cast<String, dynamic>())
      .toList(growable: false);
}

/// The methods that hand the subtitle over as it is. Anything else, Encode
/// above all, means the server has to burn it into the picture.
const Set<String> _directSubtitleMethods = <String>{'embed', 'external', 'hls'};

/// Whether the profile has no way to carry [format] without burning it in.
bool _subtitleNeedsBurnIn(
  List<Map<String, dynamic>> subtitleProfiles,
  String format,
) {
  for (final profile in subtitleProfiles) {
    final formats = (profile['Format']?.toString() ?? '')
        .split(',')
        .map((e) => e.trim().toLowerCase());
    if (!formats.contains(format)) continue;
    final methods = (profile['Method']?.toString() ?? '')
        .split(',')
        .map((e) => e.trim().toLowerCase())
        .toSet();
    if (_directSubtitleMethods.intersection(methods).isNotEmpty) return false;
  }
  return true;
}

/// The stream the server worked from, falling back to the first of that
/// [type] when nothing said which. Guessing the wrong track would name a
/// codec the stream never carried.
Map<String, dynamic>? _selectedStream(
  List<Map<String, dynamic>> mediaStreams,
  String type,
  int? streamIndex,
) {
  final ofType = _streamsOfType(mediaStreams, type);
  if (ofType.isEmpty) return null;
  if (streamIndex != null) {
    for (final stream in ofType) {
      if (stream['Index'] == streamIndex) return stream;
    }
  }
  return ofType.first;
}

/// Whether [value] is missing from what the profiles list under [key]. A
/// profile that leaves the key off accepts anything, so an empty list is no
/// opinion rather than a rejection.
bool _rejects(List<Map<String, dynamic>> profiles, String key, String value) {
  final allowed = _csvValues(profiles, key);
  return allowed.isNotEmpty && !allowed.contains(value);
}

List<Map<String, dynamic>> _directPlayProfiles(
  Map<String, dynamic>? deviceProfile,
  String type,
) {
  final raw = deviceProfile?['DirectPlayProfiles'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((e) => e.cast<String, dynamic>())
      .where((e) => e['Type']?.toString().toLowerCase() == type)
      .toList(growable: false);
}

Set<String> _csvValues(List<Map<String, dynamic>> profiles, String key) {
  final values = <String>{};
  for (final profile in profiles) {
    final raw = profile[key]?.toString();
    if (raw == null || raw.isEmpty) continue;
    for (final value in raw.split(',')) {
      final trimmed = value.trim().toLowerCase();
      if (trimmed.isNotEmpty) values.add(trimmed);
    }
  }
  return values;
}

List<Map<String, dynamic>> _streamsOfType(
  List<Map<String, dynamic>> mediaStreams,
  String type,
) => mediaStreams
    .where((s) => s['Type']?.toString().toLowerCase() == type)
    .toList(growable: false);

/// Reads a stream field that should be a whole number. Servers send these as
/// an int, but a double or a quoted string both turn up, and a plain cast
/// throws on either rather than falling through.
int? _wholeNumber(Object? value) {
  if (value is num) return value.toInt();
  return int.tryParse(value?.toString() ?? '');
}

String? _codecOf(Map<String, dynamic>? stream) {
  final codec = stream?['Codec']?.toString().toLowerCase().trim();
  return (codec == null || codec.isEmpty) ? null : codec;
}

const Set<String> _bitrateReasons = <String>{
  'videobitratenotsupported',
  'containerbitrateexceedslimit',
  'videobitrateexceedslimit',
  'bitratelimitexceeded',
  'containerbitratenotsupported',
  'audiobitratenotsupported',
};

/// Structured details describing why a media source cannot direct play,
/// used to format helpful messages and actionable configuration hints.
class DirectPlayFailureDetail {
  final String reason;
  final String? codec;
  final String? container;
  final int? sourceBitrate;
  final int? maxStreamingBitrate;
  final int? audioChannels;
  final String? rangeType;
  final String? videoProfile;

  const DirectPlayFailureDetail({
    required this.reason,
    this.codec,
    this.container,
    this.sourceBitrate,
    this.maxStreamingBitrate,
    this.audioChannels,
    this.rangeType,
    this.videoProfile,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectPlayFailureDetail &&
          runtimeType == other.runtimeType &&
          reason == other.reason &&
          codec == other.codec &&
          container == other.container &&
          sourceBitrate == other.sourceBitrate &&
          maxStreamingBitrate == other.maxStreamingBitrate &&
          audioChannels == other.audioChannels &&
          rangeType == other.rangeType &&
          videoProfile == other.videoProfile;

  @override
  int get hashCode => Object.hash(
        reason,
        codec,
        container,
        sourceBitrate,
        maxStreamingBitrate,
        audioChannels,
        rangeType,
        videoProfile,
      );

  @override
  String toString() =>
      'DirectPlayFailureDetail(reason: $reason, codec: $codec, container: $container)';
}

/// Identifies why a source cannot direct play against [deviceProfile].
///
/// Unlike [mergeTranscodeReasons] which requires [StreamPlayMethod.transcode],
/// this evaluates direct play compatibility directly so the media details view
/// can present rich descriptions and actionable tips even when the server omitted
/// [transcodingReasons].
List<DirectPlayFailureDetail> resolveDirectPlayFailureDetails({
  List<String> serverReasons = const <String>[],
  List<Map<String, dynamic>> mediaStreams = const <Map<String, dynamic>>[],
  String? container,
  int? sourceBitrate,
  int? maxStreamingBitrate,
  int? audioStreamIndex,
  int? subtitleStreamIndex,
  Map<String, dynamic>? deviceProfile,
}) {
  final details = <DirectPlayFailureDetail>[];
  final seen = <String>{};

  void add(DirectPlayFailureDetail detail, [Set<String> alsoCovers = const <String>{}]) {
    final lower = detail.reason.toLowerCase();
    if (seen.contains(lower) || alsoCovers.any(seen.contains)) return;
    details.add(detail);
    seen.add(lower);
  }

  final video = _streamsOfType(mediaStreams, 'video');
  final isAudioOnly = video.isEmpty && _streamsOfType(mediaStreams, 'audio').isNotEmpty;
  final directPlayType = isAudioOnly ? 'audio' : 'video';
  final profiles = _directPlayProfiles(deviceProfile, directPlayType);
  final normalizedContainer = container?.toLowerCase().trim();

  final audioStream = _selectedStream(mediaStreams, 'audio', audioStreamIndex);
  final audioCodec = _codecOf(audioStream);
  final videoStream = video.firstOrNull;
  final videoCodec = _codecOf(videoStream);
  final subtitleStream = (subtitleStreamIndex != null && subtitleStreamIndex >= 0)
      ? _selectedStream(mediaStreams, 'subtitle', subtitleStreamIndex)
      : null;
  final subtitleCodec = _codecOf(subtitleStream);

  // 1. Preserve server reasons as primary, enriched with stream data when matching
  for (final r in serverReasons) {
    if (r.isEmpty) continue;
    final rLower = r.toLowerCase();
    if (rLower == 'audiocodecnotsupported') {
      details.add(DirectPlayFailureDetail(reason: r, codec: audioCodec));
    } else if (rLower == 'videocodecnotsupported') {
      details.add(DirectPlayFailureDetail(reason: r, codec: videoCodec));
    } else if (rLower == 'subtitlecodecnotsupported') {
      details.add(DirectPlayFailureDetail(reason: r, codec: subtitleCodec));
    } else if (rLower == 'containernotsupported') {
      details.add(DirectPlayFailureDetail(reason: r, container: normalizedContainer));
    } else if (_bitrateReasons.contains(rLower)) {
      details.add(DirectPlayFailureDetail(
        reason: r,
        sourceBitrate: sourceBitrate,
        maxStreamingBitrate: maxStreamingBitrate,
      ));
    } else if (rLower == 'audiochannelsnotsupported') {
      final channels = audioStream != null
          ? _wholeNumber(audioStream['Channels'])
          : null;
      details.add(DirectPlayFailureDetail(
        reason: r,
        codec: audioCodec,
        audioChannels: channels,
      ));
    } else {
      details.add(DirectPlayFailureDetail(reason: r));
    }
    seen.add(rLower);
  }

  // 2. Check bitrate limit
  if (maxStreamingBitrate != null &&
      sourceBitrate != null &&
      sourceBitrate > maxStreamingBitrate) {
    add(
      DirectPlayFailureDetail(
        reason: 'VideoBitrateExceedsLimit',
        sourceBitrate: sourceBitrate,
        maxStreamingBitrate: maxStreamingBitrate,
      ),
      _bitrateReasons,
    );
  }

  // 3. Check container
  if (normalizedContainer != null &&
      normalizedContainer.isNotEmpty &&
      profiles.isNotEmpty &&
      _rejects(profiles, 'Container', normalizedContainer)) {
    add(DirectPlayFailureDetail(
      reason: 'ContainerNotSupported',
      container: normalizedContainer,
    ));
  }

  if (mediaStreams.isEmpty) return details;

  // 4. Check video codec
  if (videoCodec != null && profiles.isNotEmpty && _rejects(profiles, 'VideoCodec', videoCodec)) {
    add(DirectPlayFailureDetail(
      reason: 'VideoCodecNotSupported',
      codec: videoCodec,
    ));
  }

  // 5. Check video range / dynamic range from CodecProfiles
  if (videoStream != null && videoCodec != null) {
    final rangeType = videoStream['VideoRangeType']?.toString().trim();
    if (rangeType != null && rangeType.isNotEmpty) {
      final normalizedStreamRange = _normalizeRangeToken(rangeType);
      final videoCodecProfiles = _codecProfiles(deviceProfile, 'Video', videoCodec);
      for (final cp in videoCodecProfiles) {
        final conditions = cp['Conditions'] as List<dynamic>? ?? const [];
        for (final cond in conditions.whereType<Map>()) {
          final prop = cond['Property']?.toString();
          if (prop == 'VideoRangeType') {
            final op = cond['Condition']?.toString();
            final val = cond['Value']?.toString() ?? '';
            final rejectedTokens = val
                .split('|')
                .map((t) => _normalizeRangeToken(t))
                .where((t) => t.isNotEmpty)
                .toSet();
            if (op == 'NotEquals' && rejectedTokens.contains(normalizedStreamRange)) {
              add(DirectPlayFailureDetail(
                reason: 'VideoRangeTypeNotSupported',
                codec: videoCodec,
                rangeType: rangeType,
              ));
              break;
            } else if (op == 'EqualsAny' && !rejectedTokens.contains(normalizedStreamRange)) {
              add(DirectPlayFailureDetail(
                reason: 'VideoRangeTypeNotSupported',
                codec: videoCodec,
                rangeType: rangeType,
              ));
              break;
            }
          }
        }
      }
    }

    // 6. Check video profile from CodecProfiles
    final streamProfile = videoStream['Profile']?.toString().trim().toLowerCase();
    if (streamProfile != null && streamProfile.isNotEmpty) {
      final videoCodecProfiles = _codecProfiles(deviceProfile, 'Video', videoCodec);
      for (final cp in videoCodecProfiles) {
        final conditions = cp['Conditions'] as List<dynamic>? ?? const [];
        for (final cond in conditions.whereType<Map>()) {
          final prop = cond['Property']?.toString();
          if (prop == 'VideoProfile') {
            final op = cond['Condition']?.toString();
            final val = cond['Value']?.toString().toLowerCase() ?? '';
            final tokens = val.split('|').map((t) => t.trim()).toSet();
            if (op == 'EqualsAny' && !tokens.contains(streamProfile)) {
              add(DirectPlayFailureDetail(
                reason: 'VideoProfileNotSupported',
                codec: videoCodec,
                videoProfile: streamProfile,
              ));
              break;
            } else if (op == 'NotEquals' && tokens.contains(streamProfile)) {
              add(DirectPlayFailureDetail(
                reason: 'VideoProfileNotSupported',
                codec: videoCodec,
                videoProfile: streamProfile,
              ));
              break;
            }
          }
        }
      }
    }

    // 7. Check video bit depth
    final bitDepth = _wholeNumber(videoStream['BitDepth']);
    if (bitDepth != null) {
      final videoCodecProfiles = _codecProfiles(deviceProfile, 'Video', videoCodec);
      for (final cp in videoCodecProfiles) {
        final conditions = cp['Conditions'] as List<dynamic>? ?? const [];
        for (final cond in conditions.whereType<Map>()) {
          if (cond['Property']?.toString() == 'VideoBitDepth') {
            final maxDepth = int.tryParse(cond['Value']?.toString() ?? '');
            if (cond['Condition']?.toString() == 'LessThanEqual' &&
                maxDepth != null &&
                bitDepth > maxDepth) {
              add(DirectPlayFailureDetail(
                reason: 'VideoBitDepthNotSupported',
                codec: videoCodec,
              ));
              break;
            }
          }
        }
      }
    }
  }

  // 8. Check audio codec
  if (audioCodec != null && profiles.isNotEmpty && _rejects(profiles, 'AudioCodec', audioCodec)) {
    add(DirectPlayFailureDetail(
      reason: 'AudioCodecNotSupported',
      codec: audioCodec,
    ));
  }

  // 9. Check audio channels cap
  if (audioStream != null) {
    final channels = _wholeNumber(audioStream['Channels']);
    if (channels != null && audioCodec != null) {
      final audioCodecProfiles = _codecProfiles(deviceProfile, 'VideoAudio', audioCodec);
      for (final cp in audioCodecProfiles) {
        final conditions = cp['Conditions'] as List<dynamic>? ?? const [];
        for (final cond in conditions.whereType<Map>()) {
          if (cond['Property']?.toString() == 'AudioChannels') {
            final maxChannels = int.tryParse(cond['Value']?.toString() ?? '');
            if (cond['Condition']?.toString() == 'LessThanEqual' &&
                maxChannels != null &&
                channels > maxChannels) {
              add(DirectPlayFailureDetail(
                reason: 'AudioChannelsNotSupported',
                codec: audioCodec,
                audioChannels: channels,
              ));
              break;
            }
          }
        }
      }
    }
  }

  // 10. Check subtitle burn-in
  final subtitleProfiles = _subtitleProfiles(deviceProfile);
  if (subtitleProfiles.isNotEmpty) {
    int? targetSubtitleIndex = subtitleStreamIndex;
    if (targetSubtitleIndex == null) {
      for (final s in _streamsOfType(mediaStreams, 'subtitle')) {
        if (s['IsDefault'] == true || s['IsForced'] == true) {
          targetSubtitleIndex = _wholeNumber(s['Index']);
          break;
        }
      }
    }
    if (targetSubtitleIndex != null && targetSubtitleIndex >= 0) {
      final subtitleStream = _selectedStream(
        mediaStreams,
        'subtitle',
        targetSubtitleIndex,
      );
      final subtitleCodec = _codecOf(subtitleStream);
      if (subtitleCodec != null &&
          _subtitleNeedsBurnIn(subtitleProfiles, subtitleCodec)) {
        add(DirectPlayFailureDetail(
          reason: 'SubtitleCodecNotSupported',
          codec: subtitleCodec,
        ));
      }
    }
  }

  // 11. Graceful fallback if no reasons identified but direct play is not possible
  if (details.isEmpty && serverReasons.isEmpty) {
    details.add(const DirectPlayFailureDetail(reason: 'DirectPlayError'));
  }

  return details;
}

/// Convenience method returning raw reason keys from [resolveDirectPlayFailureDetails].
List<String> resolveDirectPlayFailureReasons({
  List<String> serverReasons = const <String>[],
  List<Map<String, dynamic>> mediaStreams = const <Map<String, dynamic>>[],
  String? container,
  int? sourceBitrate,
  int? maxStreamingBitrate,
  int? audioStreamIndex,
  int? subtitleStreamIndex,
  Map<String, dynamic>? deviceProfile,
}) =>
    resolveDirectPlayFailureDetails(
      serverReasons: serverReasons,
      mediaStreams: mediaStreams,
      container: container,
      sourceBitrate: sourceBitrate,
      maxStreamingBitrate: maxStreamingBitrate,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      deviceProfile: deviceProfile,
    ).map((d) => d.reason).toList(growable: false);

List<Map<String, dynamic>> _codecProfiles(
  Map<String, dynamic>? deviceProfile,
  String type,
  String? codec,
) {
  final raw = deviceProfile?['CodecProfiles'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((e) => e.cast<String, dynamic>())
      .where((e) {
        final profileType = e['Type']?.toString().toLowerCase();
        if (profileType != type.toLowerCase()) return false;
        final profileCodec = e['Codec']?.toString().toLowerCase();
        if (codec != null && profileCodec != null && profileCodec != codec.toLowerCase()) {
          return false;
        }
        return true;
      })
      .toList(growable: false);
}

String _normalizeRangeToken(String token) =>
    token.toLowerCase().replaceAll('_', '').trim();
