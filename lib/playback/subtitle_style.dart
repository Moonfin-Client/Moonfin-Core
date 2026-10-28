import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import 'aether_backend.dart';
import 'native_apple_player_backend.dart';

const double primarySubtitleMaxOffset = 0.36;
const double secondarySubtitleMinOffset =
    PlaybackManager.secondarySubtitleMinOffset;
const double secondarySubtitleMaxOffset =
    PlaybackManager.secondarySubtitleMaxOffset;


/// Returns the stored primary offset for the active SDR/HDR profile without
/// clamping or snapping it. Legacy values remain untouched until the user edits them.
double storedPrimarySubtitleOffset(
  UserPreferences prefs,
  StreamResolutionResult? resolution,
) {
  final useHdr =
      prefs.get(UserPreferences.subtitlesHdrSeparate) &&
      isHdrSubtitleOutput(
        videoRangeType: resolution?.videoRangeType,
        isTranscoding: resolution?.playMethod == StreamPlayMethod.transcode,
      );
  return prefs.get(
    useHdr
        ? UserPreferences.subtitlesHdrOffsetPosition
        : UserPreferences.subtitlesOffsetPosition,
  );
}

/// Normalizes a user edit onto the current step grid. A legacy value outside
/// the range first snaps to the nearest boundary. An in-range off-grid value
/// snaps in the direction of the attempted edit.
double normalizeSteppedSubtitleOffsetChange({
  required double storedValue,
  required double proposedValue,
  required double min,
  required double max,
  required double step,
}) {
  double clean(double value) => ((value * 1000000).round() / 1000000)
      .clamp(min, max)
      .toDouble();

  final clampedStored = storedValue.clamp(min, max).toDouble();
  if (storedValue < min || storedValue > max || step <= 0) {
    return clean(clampedStored);
  }

  final stepIndex = (storedValue - min) / step;
  final nearest = stepIndex.roundToDouble();
  if ((stepIndex - nearest).abs() > 0.000001) {
    final direction = proposedValue.compareTo(storedValue);
    if (direction > 0) {
      return clean(min + stepIndex.ceil() * step);
    }
    if (direction < 0) {
      return clean(min + stepIndex.floor() * step);
    }
    return clean(clampedStored);
  }
  return clean(proposedValue);
}

/// Saves the primary subtitle size for the active SDR or HDR settings and reapplies
/// both subtitle styles.
Future<void> setPrimarySubtitleSize(
  PlaybackManager manager,
  UserPreferences prefs,
  double size,
) => setPrimarySubtitleAppearance(manager, prefs, fontSize: size);

Future<void> setPrimarySubtitleAppearance(
  PlaybackManager manager,
  UserPreferences prefs, {
  double? fontSize,
  double? verticalOffset,
}) async {
  if (fontSize?.isFinite == false || verticalOffset?.isFinite == false) return;
  final resolution = manager.currentResolution;
  final useHdr =
      prefs.get(UserPreferences.subtitlesHdrSeparate) &&
      isHdrSubtitleOutput(
        videoRangeType: resolution?.videoRangeType,
        isTranscoding: resolution?.playMethod == StreamPlayMethod.transcode,
      );
  if (fontSize != null) {
    await prefs.set(
      useHdr
          ? UserPreferences.subtitlesHdrTextSize
          : UserPreferences.subtitlesTextSize,
      fontSize.clamp(12.0, 48.0),
    );
  }
  if (verticalOffset != null) {
    await prefs.set(
      useHdr
          ? UserPreferences.subtitlesHdrOffsetPosition
          : UserPreferences.subtitlesOffsetPosition,
      verticalOffset.clamp(0.0, primarySubtitleMaxOffset),
    );
  }
  // Some backends default omitted colors, so send the full saved appearance.
  final style = SubtitleStyle.forResolution(prefs, manager.currentResolution);
  await manager.backend?.configureSubtitleStyle(
    textColor: style.textColor,
    backgroundColor: style.backgroundColor,
    strokeColor: style.strokeColor,
    fontSize: style.fontSize,
    fontWeight: style.fontWeight,
    verticalOffset: style.verticalOffset,
  );
  await syncSecondarySubtitleStyle(manager, prefs);
}

/// Applies the saved secondary style. A zero size adjustment and the default color
/// leave those overrides unset so they follow the primary style, including HDR changes.
Future<void> syncSecondarySubtitleStyle(
  PlaybackManager manager,
  UserPreferences prefs,
) {
  final primarySize = SubtitleStyle.forResolution(
    prefs,
    manager.currentResolution,
  ).fontSize;
  final adjustment = prefs
      .get(UserPreferences.secondarySubtitleSizeAdjustment)
      .clamp(-50.0, 50.0);
  final adjustedSize = primarySize * (1 + adjustment / 100);
  final isApple =
      manager.backend is AetherBackend || manager.backend is NativeApplePlayerBackend;
  return manager.configureSecondarySubtitleStyle(
    fontSize: adjustment == 0
        ? null
        : (isApple ? adjustedSize.clamp(12.0, 48.0).toDouble() : adjustedSize),
    verticalOffset: PlaybackManager.clampSecondarySubtitleOffset(
      prefs.get(UserPreferences.secondarySubtitleOffsetPosition),
    ),
    textColor: switch (prefs.get(UserPreferences.secondarySubtitleTextColor)) {
      -1 => null,
      final color => color,
    },
  );
}

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
      ).clamp(0.0, primarySubtitleMaxOffset).toDouble(),
    );
  }

  @override
  bool operator ==(Object other) =>
      other is SubtitleStyle &&
      other.textColor == textColor &&
      other.backgroundColor == backgroundColor &&
      other.strokeColor == strokeColor &&
      other.fontSize == fontSize &&
      other.fontWeight == fontWeight &&
      other.verticalOffset == verticalOffset;

  @override
  int get hashCode => Object.hash(
    textColor,
    backgroundColor,
    strokeColor,
    fontSize,
    fontWeight,
    verticalOffset,
  );
}
