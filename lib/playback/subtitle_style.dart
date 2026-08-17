import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';

/// Whether what reaches the screen is HDR. A transcode lands as SDR even when
/// the source was HDR, so the subtitles have to follow the output rather than
/// the file.
bool isHdrSubtitleOutput({
  required String? videoRangeType,
  required bool isTranscoding,
}) {
  if (isTranscoding) return false;
  final range = (videoRangeType ?? '').toUpperCase();
  if (range.isEmpty) return false;
  return range != 'SDR';
}

/// The subtitle appearance to draw with, taken from the normal values or the
/// HDR ones.
class SubtitleStyle {
  final int textColor;
  final int backgroundColor;
  final int strokeColor;
  final double fontSize;
  final int fontWeight;
  final double verticalOffset;

  const SubtitleStyle({
    required this.textColor,
    required this.backgroundColor,
    required this.strokeColor,
    required this.fontSize,
    required this.fontWeight,
    required this.verticalOffset,
  });

  /// Reads the appearance for whatever [resolution] is putting on screen.
  factory SubtitleStyle.forResolution(
    UserPreferences prefs,
    StreamResolutionResult? resolution,
  ) => SubtitleStyle.resolve(
    prefs,
    isHdr: isHdrSubtitleOutput(
      videoRangeType: resolution?.videoRangeType,
      isTranscoding: resolution?.playMethod == StreamPlayMethod.transcode,
    ),
  );

  factory SubtitleStyle.resolve(UserPreferences prefs, {required bool isHdr}) {
    final useHdr = isHdr && prefs.get(UserPreferences.subtitlesHdrSeparate);
    T pick<T>(Preference<T> base, Preference<T> hdr) =>
        prefs.get(useHdr ? hdr : base);

    return SubtitleStyle(
      textColor: pick(
        UserPreferences.subtitlesTextColor,
        UserPreferences.subtitlesHdrTextColor,
      ),
      backgroundColor: pick(
        UserPreferences.subtitlesBackgroundColor,
        UserPreferences.subtitlesHdrBackgroundColor,
      ),
      strokeColor: pick(
        UserPreferences.subtitleTextStrokeColor,
        UserPreferences.subtitlesHdrTextStrokeColor,
      ),
      fontSize: pick(
        UserPreferences.subtitlesTextSize,
        UserPreferences.subtitlesHdrTextSize,
      ),
      fontWeight: pick(
        UserPreferences.subtitlesTextWeight,
        UserPreferences.subtitlesHdrTextWeight,
      ),
      verticalOffset: pick(
        UserPreferences.subtitlesOffsetPosition,
        UserPreferences.subtitlesHdrOffsetPosition,
      ),
    );
  }
}
