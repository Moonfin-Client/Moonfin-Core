import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:playback_core/playback_core.dart';

import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';
import '../util/subtitle_track_logic.dart';
import 'subtitle_fonts.dart';
import 'subtitle_style.dart';

/// How media_kit draws the subtitles it renders itself, for both the on
/// demand and live TV players. ASS and PGS subtitles paint themselves, so
/// the text view stays hidden for them.
SubtitleViewConfiguration buildSubtitleViewConfiguration({
  required BuildContext context,
  required UserPreferences prefs,
  required StreamResolutionResult? resolution,
  required int? subtitleStreamIndex,
}) {
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

  return subtitleViewConfigurationFor(
    SubtitleStyle.forResolution(prefs, resolution),
    screenHeight: MediaQuery.sizeOf(context).height,
    visible: PlatformDetection.isDesktop ? false : !isAssOrPgs,
  );
}

/// The text view's look for [style] on a screen [screenHeight] tall.
SubtitleViewConfiguration subtitleViewConfigurationFor(
  SubtitleStyle style, {
  required double screenHeight,
  bool visible = true,
}) {
  final textColor = Color(style.textColor);
  final bgColor = Color(style.backgroundColor);
  final prefSize = style.fontSize;
  final fontWeight = style.fontWeight;
  final offset = style.verticalOffset;

  final baseSize = PlatformDetection.useMobileUi ? 40.0 : 32.0;
  final fontSize = (prefSize / 24.0) * baseSize;

  final basePadding = PlatformDetection.useMobileUi ? 16.0 : 24.0;
  final bottomPadding = basePadding + (offset * screenHeight * 0.5);

  return SubtitleViewConfiguration(
    visible: visible,
    style: TextStyle(
      inherit: false,
      height: 1.4,
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight >= 700 ? FontWeight.bold : FontWeight.normal,
      backgroundColor: bgColor,
      fontFamily: SubtitleFonts.instance.flutterFamily(style.fontFamily),
      fontFamilyFallback: const ['Roboto', 'Noto Sans', 'Arial'],
      shadows: subtitleShadows(style, fontSize),
    ),
    textAlign: TextAlign.center,
    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, bottomPadding),
  );
}

/// The drop shadow, then the outline over it.
List<Shadow>? subtitleShadows(SubtitleStyle style, double fontSize) {
  final stroke = subtitleStrokeShadows(
    Color(style.strokeColor),
    fontSize,
    scale: style.strokeScale,
  );
  if (style.shadowColor == 0) return stroke;
  final offset = style.shadowOffset * fontSize;
  return [
    Shadow(
      offset: Offset(offset, offset),
      blurRadius: style.shadowBlur * fontSize,
      color: Color(style.shadowColor),
    ),
    ...?stroke,
  ];
}

/// Rings of shadow copies approximating a text stroke. Width scales with
/// [fontSize] so the outline stays visible at large sizes and extends past any
/// [TextStyle.backgroundColor] rectangle behind the glyph.
List<Shadow>? subtitleStrokeShadows(
  Color strokeColor,
  double fontSize, {
  double scale = 1,
}) {
  if (strokeColor.a <= 0) return null;
  final w = (fontSize / 16.0).clamp(1.0, 3.0) * scale;
  // The copies only read as one outline while the gaps between them stay
  // under a glyph's stem, so a wider stroke gets more of them and inner rings.
  final step = math.max(1.0, fontSize / 16.0);
  final shadows = <Shadow>[];
  for (var r = w; r > step / 2; r -= step) {
    final perSide = math.max(2, (2 * r / step).ceil());
    for (var i = 0; i < perSide; i++) {
      final t = -r + 2 * r * i / perSide;
      shadows
        ..add(Shadow(offset: Offset(t, -r), color: strokeColor))
        ..add(Shadow(offset: Offset(r, t), color: strokeColor))
        ..add(Shadow(offset: Offset(-t, r), color: strokeColor))
        ..add(Shadow(offset: Offset(-r, -t), color: strokeColor));
    }
  }
  return shadows;
}
