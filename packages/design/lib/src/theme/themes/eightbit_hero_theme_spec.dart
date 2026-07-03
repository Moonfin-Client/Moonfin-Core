import 'package:flutter/material.dart';

import '../theme_spec.dart';

/// Retro 8-bit theme using the "Sweetie 16" pixel-art palette.
/// Chrome is deliberately blocky: zero-radius corners, thick opaque borders, a
/// gold focus ring, and a hard offset drop-shadow. The [isPixel] flag opts
/// surfaces into pixel chrome (see `GlassSurface` / `PixelBorderPainter`); the
/// rest is driven by these tokens.
const eightbitHeroThemeSpec = ThemeSpec(
  id: '8bit_hero',
  displayName: '8-bit Hero',
  fontFamily: 'EightBitHero',
  isPixel: true,
  navColorCycle: [
    Color(0xFFEF7D57),
    Color(0xFFFFCD75),
    Color(0xFFA7F070),
    Color(0xFF41A6F6),
  ],
  semantic: ThemeSemanticTokens(
    statusAvailable: Color(0xFF38B764),
    statusRequested: Color(0xFF5D275D),
    statusPending: Color(0xFFFFCD75),
    statusDownloading: Color(0xFF41A6F6),
    mediaTypeBadgeMovie: Color(0xFF3B5DC9),
    mediaTypeBadgeShow: Color(0xFFB13E53),
  ),
  colors: ThemeColorTokens(
    background: Color(0xFF1A1C2C),
    onBackground: Color(0xFFF4F4F4),
    surface: Color(0xFF333C57),
    onSurface: Color(0xFFF4F4F4),
    surfaceVariant: Color(0xFF566C86),
    scrim: Color(0xCC1A1C2C),
    accent: Color(0xFFEF7D57),
    onAccent: Color(0xFF1A1C2C),
    buttonNormal: Color(0xFF29366F),
    buttonFocused: Color(0xFFFFCD75),
    buttonDisabled: Color(0xFF333C57),
    buttonActive: Color(0xFF41A6F6),
    onButtonNormal: Color(0xFFF4F4F4),
    onButtonFocused: Color(0xFF1A1C2C),
    onButtonDisabled: Color(0xFF566C86),
    inputBackground: Color(0xFF333C57),
    inputFocused: Color(0xFF3B5DC9),
    inputBorder: Color(0xFF566C86),
    inputBorderFocused: Color(0xFFFFCD75),
    rangeTrack: Color(0xFF333C57),
    rangeProgress: Color(0xFFA7F070),
    rangeThumb: Color(0xFFFFCD75),
    seekbarBuffered: Color(0xFF566C86),
    badgeBackground: Color(0xFFB13E53),
    onBadge: Color(0xFFF4F4F4),
    badgeUnplayed: Color(0xFF41A6F6),
    badgeWatched: Color(0xFF38B764),
    recordingActive: Color(0xFFB13E53),
    recordingScheduled: Color(0xFFFFCD75),
  ),
  borders: ThemeBorderTokens(
    cardBorder: BorderSide(color: Color(0xFF566C86), width: 2),
    chipBorder: BorderSide(color: Color(0xFFF4F4F4), width: 2),
    focusBorder: BorderSide(color: Color(0xFFFFCD75), width: 3),
    cardRadius: BorderRadius.zero,
    chipRadius: BorderRadius.zero,
    chipBackground: Color(0xFF29366F),
    navBorder: BorderSide(color: Color(0xFF566C86), width: 2),
    focusGlow: [
      BoxShadow(color: Color(0x99FFCD75), offset: Offset(4, 4)),
    ],
  ),
);
