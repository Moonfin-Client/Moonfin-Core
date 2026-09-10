import 'package:playback_core/playback_core.dart';

import '../l10n/app_localizations.dart';
import '../playback/hdr_stream_capability.dart';
import '../playback/known_defects.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import 'platform_detection.dart';

/// Represents a formatted direct play failure reason with an optional actionable tip.
class DirectPlayReasonItem {
  final String description;
  final String? hint;

  const DirectPlayReasonItem({
    required this.description,
    this.hint,
  });

  @override
  String toString() =>
      hint != null ? '$description (Hint: $hint)' : description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectPlayReasonItem &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          hint == other.hint;

  @override
  int get hashCode => Object.hash(description, hint);
}

/// Evaluates client-side Dolby Vision and display HDR constraints that force
/// transcoding on Android TV when direct play is requested.
String? checkClientDolbyVisionTranscodeReason(
  List<Map<String, dynamic>> streams,
  UserPreferences prefs, {
  bool? isAndroidTv,
  bool? supportsDolbyVision,
  bool? supportsAnyHdr,
  bool? supportsHdr10,
  bool? supportsHevcDolbyVision,
}) {
  final isAtv = isAndroidTv ??
      (PlatformDetection.isAndroid && PlatformDetection.isTV);
  if (!isAtv) {
    return null;
  }

  final allowDolbyVisionProfile7ElDirectPlay =
      KnownDefects.shouldAllowDolbyVisionProfile7ElDirectPlay(
    behavior: prefs.get(
      UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
    ),
    hasHardwareDolbyVisionDecoder:
        supportsHevcDolbyVision ?? PlatformDetection.supportsHevcDolbyVision,
    hasDoviCompat: PlatformDetection.isAndroid,
  );

  for (final stream in streams) {
    if (HdrStreamCapability.streamNeedsDolbyVisionProfileTranscode(
      stream,
      allowDolbyVisionProfile7ElDirectPlay:
          allowDolbyVisionProfile7ElDirectPlay,
    )) {
      return 'dolbyVisionProfileNotDirectPlayable';
    }
  }

  final needsFallback =
      streams.any(HdrStreamCapability.needsDolbyVisionFallback);
  if (!needsFallback) {
    return null;
  }

  final dViSupported =
      supportsDolbyVision ?? PlatformDetection.supportsDolbyVision;
  if (dViSupported) {
    return null;
  }

  final anyHdrSupported = supportsAnyHdr ?? PlatformDetection.supportsAnyHdr;
  if (!anyHdrSupported) {
    return 'displayReportsNoHdr';
  }

  final selected = prefs.get(UserPreferences.dolbyVisionFallbackBehavior);
  if (selected == DolbyVisionFallbackBehavior.transcode) {
    return 'dolbyVisionFallbackPreferenceTranscode';
  }

  final hdr10Supported = supportsHdr10 ?? PlatformDetection.supportsHdr10;
  if (selected == DolbyVisionFallbackBehavior.hdr10Fallback &&
      !hdr10Supported) {
    return 'displayLacksHdr10ForFallback';
  }

  return null;
}

/// Formats a [DirectPlayFailureDetail] into a user-facing [DirectPlayReasonItem],
/// providing contextual guidance and configuration hints based on user preferences.
DirectPlayReasonItem formatDirectPlayReason(
  DirectPlayFailureDetail detail,
  AppLocalizations l10n,
  UserPreferences prefs,
) {
  String description;
  String? hint;

  final reason = detail.reason;
  final codec = detail.codec?.toUpperCase();

  switch (reason) {
    case 'AudioCodecNotSupported':
      if (codec != null && codec.isNotEmpty) {
        description = l10n.transcodeAudioCodecWithCodec(codec);
        final passthroughMode =
            prefs.get(UserPreferences.audioPassthroughMode);
        if (passthroughMode == AudioPassthroughMode.disabled ||
            passthroughMode == AudioPassthroughMode.auto) {
          hint = l10n.transcodeAudioCodecHintPassthrough(codec);
        }
      } else {
        description = l10n.transcodeAudioCodecNotSupported;
      }
      break;

    case 'AudioChannelsNotSupported':
      if (detail.audioChannels != null) {
        description =
            l10n.transcodeAudioChannelsExceeded(detail.audioChannels!);
      } else {
        description = l10n.transcodeAudioChannelsNotSupported;
      }
      hint = l10n.transcodeAudioChannelsHint;
      break;

    case 'SubtitleCodecNotSupported':
      final subCodec = (detail.codec ?? '').toLowerCase();
      if (subCodec.contains('ass') || subCodec.contains('ssa')) {
        if (!prefs.get(UserPreferences.assDirectPlay)) {
          description = l10n.transcodeSubtitleBurnInAssDisabled;
          hint = l10n.transcodeSubtitleBurnInAssHint;
        } else {
          description =
              l10n.transcodeSubtitleNotSupportedWithCodec(codec ?? 'ASS');
        }
      } else if (subCodec.contains('pgs')) {
        if (!prefs.get(UserPreferences.pgsDirectPlay)) {
          description = l10n.transcodeSubtitleBurnInPgsDisabled;
          hint = l10n.transcodeSubtitleBurnInPgsHint;
        } else {
          description =
              l10n.transcodeSubtitleNotSupportedWithCodec('PGS');
        }
      } else if (codec != null && codec.isNotEmpty) {
        description = l10n.transcodeSubtitleNotSupportedWithCodec(codec);
      } else {
        description = l10n.transcodeSubtitleCodecNotSupported;
      }
      break;

    case 'ContainerBitrateExceedsLimit':
    case 'VideoBitrateExceedsLimit':
      if (detail.sourceBitrate != null && detail.maxStreamingBitrate != null) {
        final fileMb = (detail.sourceBitrate! / 1000000).toStringAsFixed(1);
        final maxMb = (detail.maxStreamingBitrate! / 1000000).toStringAsFixed(1);
        description = l10n.transcodeBitrateExceededWithValues(
            '$fileMb Mbps', '$maxMb Mbps');
      } else {
        description = reason == 'ContainerBitrateExceedsLimit'
            ? l10n.transcodeContainerBitrateExceedsLimit
            : l10n.transcodeVideoBitrateExceedsLimit;
      }
      hint = l10n.transcodeBitrateHint;
      break;

    case 'AudioBitrateExceedsLimit':
      description = l10n.transcodeAudioBitrateExceedsLimit;
      hint = l10n.transcodeBitrateHint;
      break;

    case 'VideoResolutionNotSupported':
      description = l10n.transcodeVideoResolutionNotSupported;
      hint = l10n.transcodeResolutionHint;
      break;

    case 'VideoRangeNotSupported':
      description = l10n.transcodeVideoRangeNotSupported;
      break;

    case 'dolbyVisionProfileNotDirectPlayable':
      description = l10n.transcodeDolbyVisionProfile7ElDisabled;
      hint = l10n.transcodeDolbyVisionProfile7ElHint;
      break;

    case 'displayReportsNoHdr':
      description = l10n.transcodeDisplayReportsNoHdr;
      break;

    case 'dolbyVisionFallbackPreferenceTranscode':
      description = l10n.transcodeDolbyVisionFallbackPreferenceTranscode;
      hint = l10n.transcodeDolbyVisionFallbackHint;
      break;

    case 'displayLacksHdr10ForFallback':
      description = l10n.transcodeDisplayLacksHdr10ForFallback;
      break;

    case 'ContainerNotSupported':
      description = l10n.transcodeContainerNotSupported;
      break;
    case 'VideoCodecNotSupported':
      description = l10n.transcodeVideoCodecNotSupported;
      break;
    case 'AudioProfileNotSupported':
      description = l10n.transcodeAudioProfileNotSupported;
      break;
    case 'VideoProfileNotSupported':
      description = l10n.transcodeVideoProfileNotSupported;
      break;
    case 'VideoLevelNotSupported':
      description = l10n.transcodeVideoLevelNotSupported;
      break;
    case 'VideoBitDepthNotSupported':
      description = l10n.transcodeVideoBitDepthNotSupported;
      break;
    case 'VideoFramerateNotSupported':
      description = l10n.transcodeVideoFramerateNotSupported;
      break;
    case 'AudioSampleRateNotSupported':
      description = l10n.transcodeAudioSampleRateNotSupported;
      break;
    case 'AudioBitDepthNotSupported':
      description = l10n.transcodeAudioBitDepthNotSupported;
      break;
    case 'RefFramesNotSupported':
      description = l10n.transcodeRefFramesNotSupported;
      break;
    case 'AnamorphicVideoNotSupported':
      description = l10n.transcodeAnamorphicVideoNotSupported;
      break;
    case 'InterlacedVideoNotSupported':
      description = l10n.transcodeInterlacedVideoNotSupported;
      break;
    case 'SecondaryAudioNotSupported':
      description = l10n.transcodeSecondaryAudioNotSupported;
      break;
    case 'DirectPlayError':
      description = l10n.transcodeDirectPlayError;
      break;
    default:
      description = reason;
      break;
  }

  return DirectPlayReasonItem(description: description, hint: hint);
}

/// Resolves and formats the complete list of reasons why direct play is not possible.
List<DirectPlayReasonItem> buildDirectPlayReasonItems({
  required List<String> serverReasons,
  required Map<String, dynamic>? mediaSource,
  required Map<String, dynamic>? deviceProfile,
  required UserPreferences prefs,
  required AppLocalizations l10n,
  int? selectedAudioIndex,
  int? selectedSubtitleIndex,
  int? maxStreamingBitrate,
  bool? isAndroidTv,
}) {
  final mediaStreams = (mediaSource?['MediaStreams'] as List?)
          ?.map((e) => Map<String, dynamic>.from(e as Map))
          .toList() ??
      const [];

  final clientDvReason = checkClientDolbyVisionTranscodeReason(
    mediaStreams,
    prefs,
    isAndroidTv: isAndroidTv,
  );

  final details = resolveDirectPlayFailureDetails(
    serverReasons: serverReasons,
    mediaStreams: mediaStreams,
    container: mediaSource?['Container'] as String?,
    sourceBitrate: mediaSource?['Bitrate'] as int?,
    deviceProfile: deviceProfile,
    audioStreamIndex: selectedAudioIndex,
    subtitleStreamIndex: selectedSubtitleIndex,
    maxStreamingBitrate: maxStreamingBitrate,
  );

  final combinedDetails = <DirectPlayFailureDetail>[...details];
  if (clientDvReason != null &&
      !combinedDetails.any((d) => d.reason == clientDvReason)) {
    combinedDetails.insert(0, DirectPlayFailureDetail(reason: clientDvReason));
  }

  return combinedDetails
      .map((d) => formatDirectPlayReason(d, l10n, prefs))
      .toList();
}
