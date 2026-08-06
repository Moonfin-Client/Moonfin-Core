import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../preference/button_layout.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';

/// The buttons around the playback controls, the ones a user can switch off.
/// Play, pause, seek and track skip are absent on purpose, the player always
/// keeps those.
///
/// Ids are what gets stored, so renaming one drops whatever the user had
/// switched off for it.
enum OsdButton {
  syncPlay('syncPlay'),
  favorite('favorite'),
  speed('speed'),
  chapters('chapters'),
  subtitles('subtitles'),
  audio('audio'),
  castAndCrew('castAndCrew'),
  cast('cast'),
  // Follows the cast switch and sits beside it in the row, so it gets no
  // switch of its own.
  castControls('castControls'),
  volume('volume'),
  quality('quality'),
  zoom('zoom'),
  orientation('orientation'),
  info('info'),
  fullscreen('fullscreen'),
  floatOnTop('floatOnTop');

  const OsdButton(this.id);

  final String id;

  /// Whether this device can put the button on screen at all. A button that
  /// never gets drawn here isn't worth offering a switch for.
  bool get isOffered => switch (this) {
    OsdButton.castControls => false,
    OsdButton.cast => !PlatformDetection.isTV,
    OsdButton.volume => PlatformDetection.useDesktopUi,
    OsdButton.orientation => PlatformDetection.isMobile,
    OsdButton.fullscreen => PlatformDetection.useDesktopUi,
    OsdButton.floatOnTop =>
      PlatformDetection.useDesktopUi && !PlatformDetection.isWeb,
    _ => true,
  };

  IconData get icon => switch (this) {
    OsdButton.syncPlay => Icons.groups_rounded,
    OsdButton.favorite => Icons.favorite_border,
    OsdButton.speed => Icons.speed_rounded,
    OsdButton.chapters => Icons.bookmark_outline_rounded,
    OsdButton.subtitles => Icons.subtitles_outlined,
    OsdButton.audio => Icons.audiotrack_outlined,
    OsdButton.castAndCrew => Icons.people_outline_rounded,
    OsdButton.cast => Icons.cast,
    OsdButton.castControls => Icons.cast_connected,
    OsdButton.volume => Icons.volume_up_rounded,
    OsdButton.quality => Icons.video_settings_outlined,
    OsdButton.zoom => Icons.zoom_out_map,
    OsdButton.orientation => Icons.screen_rotation_outlined,
    OsdButton.info => Icons.info_outline_rounded,
    OsdButton.fullscreen => Icons.fullscreen_rounded,
    OsdButton.floatOnTop => Icons.push_pin_outlined,
  };

  String label(AppLocalizations l10n) => switch (this) {
    OsdButton.syncPlay => l10n.syncPlay,
    OsdButton.favorite => l10n.favorite,
    OsdButton.speed => l10n.playerTooltipPlaybackSpeed,
    OsdButton.chapters => l10n.chapters,
    OsdButton.subtitles => l10n.subtitles,
    OsdButton.audio => l10n.audio,
    OsdButton.castAndCrew => l10n.castAndCrew,
    OsdButton.cast => l10n.cast,
    OsdButton.castControls => l10n.playerTooltipCastControls,
    OsdButton.volume => l10n.playerTooltipVolume,
    OsdButton.quality => l10n.playerTooltipPlaybackQuality,
    OsdButton.zoom => l10n.playerZoomMode,
    OsdButton.orientation => l10n.orientationLock,
    OsdButton.info => l10n.playbackInformation,
    OsdButton.fullscreen => l10n.fullscreen,
    OsdButton.floatOnTop => l10n.playerTooltipFloatOnTop,
  };
}

/// The buttons the row should draw, in the order the user put them in.
///
/// The tvOS OSD is native and builds its own row, so it gets handed the
/// arrangement as ids rather than reading the preferences itself.
List<String> visibleOsdButtonIds(UserPreferences prefs) {
  final hidden = osdButtonLayout.hidden(prefs);
  return [
    for (final button in osdButtonLayout.ordered(
      OsdButton.values,
      (button) => button.id,
      prefs,
    ))
      if (button.isOffered && !hidden.contains(button.id)) button.id,
  ];
}

final osdButtonLayout = ButtonLayout(
  hiddenTv: UserPreferences.hiddenOsdButtonsTv,
  hiddenMobile: UserPreferences.hiddenOsdButtonsMobile,
  hiddenDesktop: UserPreferences.hiddenOsdButtonsDesktop,
  orderTv: UserPreferences.osdButtonOrderTv,
  orderMobile: UserPreferences.osdButtonOrderMobile,
  orderDesktop: UserPreferences.osdButtonOrderDesktop,
);
