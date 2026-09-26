import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import '../ui/widgets/subtitle_preview.dart';
import '../util/platform_detection.dart';
import '../util/subtitle_track_logic.dart';
import 'subtitle_style.dart';

/// How media_kit draws the subtitles it renders itself, for both the on-demand and live-TV players.
///
/// ASS and PGS subtitles paint themselves, so the text view stays hidden for them.
SubtitleViewConfiguration buildSubtitleViewConfiguration({
  required BuildContext context,
  required UserPreferences prefs,
  required StreamResolutionResult? resolution,
  required int? subtitleStreamIndex,
}) {
  final style = SubtitleStyle.forResolution(prefs, resolution);
  final textColor = Color(style.textColor);
  final bgColor = Color(style.backgroundColor);
  final strokeColor = Color(style.strokeColor);
  final prefSize = style.fontSize;
  final fontWeight = style.fontWeight;
  final offset = style.verticalOffset;

  final baseSize = PlatformDetection.useMobileUi ? 40.0 : 32.0;
  final fontSize = (prefSize / 24.0) * baseSize;

  final basePadding = PlatformDetection.useMobileUi ? 16.0 : 24.0;
  final bottomPadding =
      basePadding + (offset * MediaQuery.sizeOf(context).height * 0.5);

  final strokeShadows = subtitleStrokeShadows(strokeColor, fontSize);

  bool isAssOrPgs = false;
  if (subtitleStreamIndex != null && subtitleStreamIndex >= 0) {
    final mediaStreams = resolution?.mediaStreams;
    if (mediaStreams != null) {
      final activeStream = mediaStreams.firstWhere(
        (s) => s['Index'] == subtitleStreamIndex,
        orElse: () => const <String, dynamic>{},
      );
      final codec = activeStream['Codec'] as String?;
      isAssOrPgs = shouldRenderSubtitleNatively(codec);
    }
  }

  return SubtitleViewConfiguration(
    visible: PlatformDetection.isDesktop ? false : !isAssOrPgs,
    style: TextStyle(
      inherit: false,
      height: 1.4,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight >= 700 ? FontWeight.bold : FontWeight.normal,
      backgroundColor: bgColor,
      fontFamilyFallback: const ['Roboto', 'Noto Sans', 'Arial'],
      shadows: strokeShadows,
    ),
    textAlign: TextAlign.center,
    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, bottomPadding),
  );
}
