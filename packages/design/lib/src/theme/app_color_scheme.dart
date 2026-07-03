import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'theme_registry.dart';

class AppColorScheme {
  const AppColorScheme._();

  /// Whether the active theme uses the Liquid-Glass treatment (frosted
  /// surfaces + animated backdrop). Cheap check for glass-aware widgets.
  static bool get isGlass => ThemeRegistry.active.isGlass;

  static bool get isNeonPulse =>
      ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

  /// Whether the active theme uses the retro pixel-art treatment (blocky
  /// bevels, stair-step corners, hard shadows). Cheap check for pixel-aware
  /// widgets. Mutually exclusive with [isGlass].
  static bool get isPixel => ThemeRegistry.active.isPixel;

  // Background & Surface
  static Color get background => ThemeRegistry.active.colors.background;
  static Color get onBackground => ThemeRegistry.active.colors.onBackground;
  static Color get surface => ThemeRegistry.active.colors.surface;
  static Color get onSurface => ThemeRegistry.active.colors.onSurface;
  static Color get surfaceVariant => ThemeRegistry.active.colors.surfaceVariant;
  static Color get scrim => ThemeRegistry.active.colors.scrim;

  // Accent
  static Color get accent => ThemeRegistry.active.colors.accent;
  static Color get onAccent => ThemeRegistry.active.colors.onAccent;

  /// Ordered palette cycled across navbar icon slots. Empty means no cycling
  /// (icons keep their inherited colour). See [ThemeSpec.navColorCycle].
  static List<Color> get navColorCycle => ThemeRegistry.active.navColorCycle;

  /// Cycled navbar colour for [slot] (wrapping), or null when no cycle is set.
  static Color? navColorForSlot(int slot) {
    final cycle = navColorCycle;
    if (cycle.isEmpty) return null;
    return cycle[slot % cycle.length];
  }

  // Buttons
  static Color get buttonNormal => ThemeRegistry.active.colors.buttonNormal;
  static Color get buttonFocused => ThemeRegistry.active.colors.buttonFocused;
  static Color get buttonDisabled => ThemeRegistry.active.colors.buttonDisabled;
  static Color get buttonActive => ThemeRegistry.active.colors.buttonActive;
  static Color get onButtonNormal => ThemeRegistry.active.colors.onButtonNormal;
  static Color get onButtonFocused =>
      ThemeRegistry.active.colors.onButtonFocused;
  static Color get onButtonDisabled =>
      ThemeRegistry.active.colors.onButtonDisabled;

  // Input
  static Color get inputBackground =>
      ThemeRegistry.active.colors.inputBackground;
  static Color get inputFocused => ThemeRegistry.active.colors.inputFocused;
  static Color get inputBorder => ThemeRegistry.active.colors.inputBorder;
  static Color get inputBorderFocused =>
      ThemeRegistry.active.colors.inputBorderFocused;

  // Range / Seekbar
  static Color get rangeTrack => ThemeRegistry.active.colors.rangeTrack;
  static Color get rangeProgress => ThemeRegistry.active.colors.rangeProgress;
  static Color get rangeThumb => ThemeRegistry.active.colors.rangeThumb;
  static Color get seekbarBuffered =>
      ThemeRegistry.active.colors.seekbarBuffered;

  // Badge
  static Color get badgeBackground =>
      ThemeRegistry.active.colors.badgeBackground;
  static Color get onBadge => ThemeRegistry.active.colors.onBadge;
  static Color get badgeUnplayed => ThemeRegistry.active.colors.badgeUnplayed;
  static Color get badgeWatched => ThemeRegistry.active.colors.badgeWatched;

  // Recording
  static Color get recordingActive =>
      ThemeRegistry.active.colors.recordingActive;
  static Color get recordingScheduled =>
      ThemeRegistry.active.colors.recordingScheduled;

  // Semantic status and badges
  static Color get statusAvailable =>
      ThemeRegistry.active.semantic.statusAvailable;
  static Color get statusRequested =>
      ThemeRegistry.active.semantic.statusRequested;
  static Color get statusPending => ThemeRegistry.active.semantic.statusPending;
  static Color get statusDownloading =>
      ThemeRegistry.active.semantic.statusDownloading;
  static Color get mediaTypeBadgeMovie =>
      ThemeRegistry.active.semantic.mediaTypeBadgeMovie;
  static Color get mediaTypeBadgeShow =>
      ThemeRegistry.active.semantic.mediaTypeBadgeShow;

  // Focus border presets
  static const Map<String, Color> focusBorderPresets = {
    'White': AppColors.white,
    'Black': AppColors.black,
    'Gray': AppColors.grey500,
    'Dark Blue': AppColors.blue900,
    'Purple': AppColors.purple700,
    'Teal': Color(0xFF00897B),
    'Navy': Color(0xFF1A237E),
    'Charcoal': AppColors.bluegrey800,
    'Brown': Color(0xFF5D4037),
    'Dark Red': AppColors.red900,
    'Dark Green': AppColors.green900,
    'Slate': AppColors.bluegrey600,
    'Indigo': Color(0xFF283593),
  };

  static const Color defaultFocusBorder = AppColors.white;
}
