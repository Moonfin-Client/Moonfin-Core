import 'dart:convert';
import 'dart:developer' as developer;

import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/services/log_service.dart';
import '../util/platform_detection.dart';
import 'audio_capability_profile.dart';

class PlaybackProfileDiagnostics {
  PlaybackProfileDiagnostics._();

  static final PlaybackProfileDiagnostics instance =
      PlaybackProfileDiagnostics._();

  Map<String, dynamic>? _lastDecision;

  Map<String, dynamic>? get lastDecision =>
      _lastDecision == null ? null : Map<String, dynamic>.from(_lastDecision!);

  void logPlaybackDecision({
    required PlaybackDecisionContext context,
    required AudioCapabilityProfile audioCapabilityProfile,
    required Map<String, dynamic> deviceAudioCapabilities,
    required List<String> audioSpdifCodecs,
    Map<String, dynamic> audioPreferenceContext = const <String, dynamic>{},
  }) {
    final resolution = context.resolution;
    final videoStream = _firstStreamOfType(resolution.mediaStreams, 'Video');
    final audioStream = _firstStreamOfType(resolution.mediaStreams, 'Audio');
    final subtitleStream = _firstStreamOfType(
      resolution.mediaStreams,
      'Subtitle',
    );

    final allowedAudioCodecs = _extractAllowedAudioCodecs(context.deviceProfile);
    final hlsAudioTargets = _extractHlsAudioTargets(context.deviceProfile);
    final advertisedMaxAudioChannels = _extractAdvertisedMaxAudioChannels(
      context.deviceProfile,
    );
    final transcodingMaxAudioChannels = _extractTranscodingMaxAudioChannels(
      context.deviceProfile,
    );

    final entry = <String, dynamic>{
      'timestamp': DateTime.now().toIso8601String(),
      'itemId': _extractItemId(context.mediaItem),
      'itemName': _extractItemName(context.mediaItem),
      'backend': context.backend.runtimeType.toString(),
      'mediaSourceId': resolution.mediaSourceId,
      'playMethod': resolution.playMethod.name,
      'transcodingReasons': List<String>.from(resolution.transcodingReasons),
      'directPlayVerdict': <String, dynamic>{
        'requestedByClient': resolution.directPlayRequested,
        'offeredByServer': resolution.serverOfferedDirectPlay,
        'sourceBitrate': resolution.sourceBitrate,
      },
      'selectedAudioStreamIndex': context.audioStreamIndex,
      'selectedSubtitleStreamIndex': context.subtitleStreamIndex,
      'container': (resolution.container ?? '').toUpperCase(),
      'mediaType': resolution.mediaType,
      'videoCodec': _streamCodec(videoStream),
      'videoProfile': _streamString(videoStream, 'Profile'),
      'videoLevel': _streamLevel(videoStream),
      'videoRange': _streamVideoRange(videoStream, resolution),
      // A "VideoRangeTypeNotSupported" transcode reason must trace back to one
      // of these values.
      'videoRangeCapabilities': <String, dynamic>{
        'hdr10': PlatformDetection.supportsHevcHdr10,
        'hdr10Plus': PlatformDetection.supportsHevcHdr10Plus,
        'dolbyVision': PlatformDetection.supportsHevcDolbyVision,
        'dolbyVisionEl': PlatformDetection.supportsHevcDolbyVisionEl,
        'dvProfile5': PlatformDetection.supportsDoViProfile5,
        'dvProfile7': PlatformDetection.supportsDoViProfile7,
        'dvProfile8': PlatformDetection.supportsDoViProfile8,
      },
      // What the decoder probe claimed, which is what the profile advertises,
      // and so what the server copies a stream through on. A decoder that
      // rejects a format it was handed disagrees with one of these.
      'videoCodecCapabilities': <String, dynamic>{
        'avc': PlatformDetection.supportsAvc,
        'avcLevel': PlatformDetection.avcMainLevel,
        'avcHigh10': PlatformDetection.supportsAvcHigh10,
        'avcHigh10Level': PlatformDetection.avcHigh10Level,
        'hevc': PlatformDetection.supportsHevc,
        'hevcLevel': PlatformDetection.hevcMainLevel,
        'hevcMain10': PlatformDetection.supportsHevcMain10,
        'hevcMain10Level': PlatformDetection.hevcMain10Level,
        'av1': PlatformDetection.supportsAv1,
        'av1Main10': PlatformDetection.supportsAv1Main10,
      },
      'audioCodec': _streamCodec(audioStream),
      'audioProfile': _streamString(audioStream, 'Profile'),
      'audioChannels': _streamChannels(audioStream),
      'subtitleCodec': _streamCodec(subtitleStream),
      // Every subtitle the server offered, paired with the track number the
      // backend is asked for. A track that plays the wrong language shows up
      // here as a stream whose ordinal points at a different row.
      'subtitleTracks': _subtitleTracks(context),
      'allowedAudioCodecs': allowedAudioCodecs,
      'hlsMpegTsAudioCodecs': hlsAudioTargets['mpegts'] ?? const <String>[],
      'hlsFmp4AudioCodecs': hlsAudioTargets['fmp4'] ?? const <String>[],
      // An "AudioChannelsNotSupported" transcode reason must trace back to
      // one of these two values.
      'advertisedMaxAudioChannels': advertisedMaxAudioChannels,
      'transcodingMaxAudioChannels': transcodingMaxAudioChannels,
      ...audioPreferenceContext,
      'audioSpdifCodecs': _normalizeCodecs(audioSpdifCodecs),
      'audioCapabilities': audioCapabilityProfile.toMap(),
      'activeRouteType': audioCapabilityProfile.activeRouteType.name,
      'routeSupportsHdAudio': audioCapabilityProfile.routeSupportsHdAudio,
      'deviceAudioCapabilities': Map<String, dynamic>.from(
        deviceAudioCapabilities,
      ),
      'maxStreamingBitrate': context.maxStreamingBitrate,
    };

    _lastDecision = entry;

    final json = _safeJson(entry);
    developer.log(
      json,
      name: 'PlaybackProfileDiagnostics',
    );

    if (GetIt.instance.isRegistered<LogService>()) {
      final name = entry['itemName'] ?? entry['itemId'] ?? 'unknown';
      GetIt.instance<LogService>().media(
        'Playback decision for "$name": ${resolution.playMethod.name}'
        '${resolution.transcodingReasons.isEmpty ? '' : ' '
            '(${resolution.transcodingReasons.join(', ')})'} '
        '— ${entry['videoCodec']}/${entry['audioCodec']} '
        '${entry['container']} @ ${context.maxStreamingBitrate}bps\n$json',
        level: LogLevel.info,
      );
    }
  }

  String _safeJson(Map<String, dynamic> payload) {
    try {
      return jsonEncode(payload);
    } catch (_) {
      return payload.toString();
    }
  }

  String? _extractItemId(dynamic item) {
    try {
      final dynamic dyn = item;
      final raw = dyn.id;
      if (raw != null) {
        final id = raw.toString().trim();
        if (id.isNotEmpty) {
          return id;
        }
      }
    } catch (_) {}

    if (item is Map) {
      final raw = item['Id'] ?? item['id'];
      if (raw != null) {
        final id = raw.toString().trim();
        if (id.isNotEmpty) {
          return id;
        }
      }
    }

    return null;
  }

  String? _extractItemName(dynamic item) {
    try {
      final dynamic dyn = item;
      final raw = dyn.name;
      if (raw != null) {
        final name = raw.toString().trim();
        if (name.isNotEmpty) {
          return name;
        }
      }
    } catch (_) {}

    if (item is Map) {
      final raw = item['Name'] ?? item['name'];
      if (raw != null) {
        final name = raw.toString().trim();
        if (name.isNotEmpty) {
          return name;
        }
      }
    }

    return null;
  }

  /// The subtitle rows the viewer picks from, each with the track number the
  /// backend gets asked for. The ordinal is worked out the same way playback
  /// works it out, so a mapping that has drifted is visible here rather than
  /// only on screen.
  List<Map<String, dynamic>> _subtitleTracks(PlaybackDecisionContext context) {
    final resolution = context.resolution;
    final streams = resolution.mediaStreams;
    if (streams.isEmpty) return const <Map<String, dynamic>>[];

    final stripped =
        resolution.playMethod == StreamPlayMethod.transcode ||
        resolution.playMethod == StreamPlayMethod.directStream ||
        !context.backend.demuxesEmbeddedSubtitles;
    final externals = resolution.externalSubtitles;

    final tracks = <Map<String, dynamic>>[];
    for (final stream in streams) {
      if ((stream['Type'] as String?)?.toLowerCase() != 'subtitle') continue;
      final index = stream['Index'];
      if (index is! int) continue;
      final deliveredExternally = externals.any((s) => s.streamIndex == index);
      tracks.add(<String, dynamic>{
        'index': index,
        'language': _streamString(stream, 'Language'),
        'title': _streamString(stream, 'DisplayTitle'),
        'codec': _streamCodec(stream),
        'isExternal': stream['IsExternal'] == true,
        'isForced': stream['IsForced'] == true,
        'isHearingImpaired': stream['IsHearingImpaired'] == true,
        'deliveryMethod': _streamString(stream, 'DeliveryMethod'),
        'deliveredExternally': deliveredExternally,
        'backendTrackId': TrackOrdinalMapper.mpvTrackIdForStream(
          streamIndex: index,
          type: 'Subtitle',
          mediaStreams: streams,
          externalSubtitles: externals,
          embeddedStripped: stripped,
        ),
      });
    }
    return tracks;
  }

  Map<String, dynamic>? _firstStreamOfType(
    List<Map<String, dynamic>> streams,
    String type,
  ) {
    final expected = type.toLowerCase();
    for (final stream in streams) {
      final actual = (stream['Type'] as String?)?.toLowerCase();
      if (actual == expected) {
        return stream;
      }
    }
    return null;
  }

  String _streamCodec(Map<String, dynamic>? stream) {
    if (stream == null) {
      return '';
    }
    final codec = (stream['Codec'] as String?)?.trim();
    if (codec == null || codec.isEmpty) {
      return '';
    }
    return codec.toUpperCase();
  }

  String _streamString(Map<String, dynamic>? stream, String key) {
    if (stream == null) {
      return '';
    }
    final value = stream[key]?.toString().trim() ?? '';
    return value;
  }

  String _streamLevel(Map<String, dynamic>? stream) {
    if (stream == null) {
      return '';
    }
    final level = stream['Level'];
    if (level is num) {
      return level.toString();
    }
    return (level?.toString().trim() ?? '');
  }

  String _streamVideoRange(
    Map<String, dynamic>? stream,
    StreamResolutionResult resolution,
  ) {
    final rangeType = _streamString(stream, 'VideoRangeType');
    if (rangeType.isNotEmpty) {
      return rangeType;
    }
    final fallbackRange = _streamString(stream, 'VideoRange');
    if (fallbackRange.isNotEmpty) {
      return fallbackRange;
    }
    return (resolution.videoRangeType ?? '').trim();
  }

  String _streamChannels(Map<String, dynamic>? stream) {
    if (stream == null) {
      return '';
    }

    final raw = stream['Channels'];
    if (raw is int) {
      return raw.toString();
    }
    if (raw is num) {
      return raw.toInt().toString();
    }
    return (raw?.toString().trim() ?? '');
  }

  List<String> _extractAllowedAudioCodecs(Map<String, dynamic> profile) {
    final codecs = <String>{};
    for (final entry in _readMaps(profile['DirectPlayProfiles'])) {
      final type = (entry['Type'] as String?)?.toLowerCase();
      if (type != 'video' && type != 'audio') {
        continue;
      }
      final audioCodec = entry['AudioCodec']?.toString();
      if (audioCodec == null || audioCodec.isEmpty) {
        continue;
      }
      for (final codec in audioCodec.split(',')) {
        final normalized = codec.trim();
        if (normalized.isNotEmpty) {
          codecs.add(normalized.toUpperCase());
        }
      }
    }

    final sorted = codecs.toList();
    sorted.sort();
    return sorted;
  }

  /// The `AudioChannels LessThanEqual` value from the general (codec-less)
  /// `VideoAudio` codec profile, which is the number the server compares a
  /// source's channel count against when deciding `AudioChannelsNotSupported`.
  String _extractAdvertisedMaxAudioChannels(Map<String, dynamic> profile) {
    for (final entry in _readMaps(profile['CodecProfiles'])) {
      if ((entry['Type'] as String?)?.toLowerCase() != 'videoaudio') {
        continue;
      }
      final codec = entry['Codec']?.toString() ?? '';
      if (codec.isNotEmpty) {
        continue;
      }
      for (final condition in _readMaps(entry['Conditions'])) {
        if ((condition['Property'] as String?)?.toLowerCase() ==
            'audiochannels') {
          return condition['Value']?.toString() ?? '';
        }
      }
    }
    return '';
  }

  /// Every `MaxAudioChannels` value emitted across TranscodingProfiles
  /// (empty when transcodes are uncapped).
  List<String> _extractTranscodingMaxAudioChannels(
    Map<String, dynamic> profile,
  ) {
    final values = <String>[];
    for (final entry in _readMaps(profile['TranscodingProfiles'])) {
      final value = entry['MaxAudioChannels']?.toString().trim() ?? '';
      if (value.isNotEmpty) {
        values.add(value);
      }
    }
    return values;
  }

  Map<String, List<String>> _extractHlsAudioTargets(
    Map<String, dynamic> profile,
  ) {
    final mpegTs = <String>{};
    final fmp4 = <String>{};

    for (final entry in _readMaps(profile['TranscodingProfiles'])) {
      final protocol = (entry['Protocol'] as String?)?.toLowerCase();
      if (protocol != 'hls') {
        continue;
      }

      final container = (entry['Container'] as String?)?.toLowerCase() ?? '';
      final audioCodec = entry['AudioCodec']?.toString();
      if (audioCodec == null || audioCodec.isEmpty) {
        continue;
      }

      Set<String>? target;
      if (container.contains('ts')) {
        target = mpegTs;
      } else if (container.contains('mp4')) {
        target = fmp4;
      }
      if (target == null) {
        continue;
      }

      for (final codec in audioCodec.split(',')) {
        final normalized = codec.trim();
        if (normalized.isNotEmpty) {
          target.add(normalized.toUpperCase());
        }
      }
    }

    final mpegTsList = mpegTs.toList()..sort();
    final fmp4List = fmp4.toList()..sort();
    return <String, List<String>>{
      'mpegts': mpegTsList,
      'fmp4': fmp4List,
    };
  }

  List<Map<String, dynamic>> _readMaps(dynamic value) {
    if (value is! List) {
      return const <Map<String, dynamic>>[];
    }

    final rows = <Map<String, dynamic>>[];
    for (final entry in value) {
      if (entry is Map<String, dynamic>) {
        rows.add(entry);
      } else if (entry is Map) {
        rows.add(
          entry.map(
            (key, value) => MapEntry(key.toString(), value),
          ),
        );
      }
    }
    return rows;
  }

  List<String> _normalizeCodecs(List<String> codecs) {
    final normalized = codecs
        .map((codec) => codec.trim())
        .where((codec) => codec.isNotEmpty)
        .map((codec) => codec.toUpperCase())
        .toSet()
        .toList();
    normalized.sort();
    return normalized;
  }
}
