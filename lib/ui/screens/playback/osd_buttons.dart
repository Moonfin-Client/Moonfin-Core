import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/trickplay_preview_layout.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/button_layout.dart';
import '../../../preference/preference_constants.dart';
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
  episodes('episodes'),
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
    OsdButton.episodes => Icons.video_library_outlined,
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
    OsdButton.episodes => l10n.episodes,
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

IconData osdZoomIcon(ZoomMode mode) => switch (mode) {
  ZoomMode.fit => Icons.fit_screen_rounded,
  ZoomMode.autoCrop => Icons.crop_rounded,
  ZoomMode.stretch => Icons.open_in_full_rounded,
};

/// The size of the buttons along the bottom of the controls, a docked
/// transport's included, before the UI scale.
({double icon, double extent}) osdRowButtonSize({required bool landscape}) =>
    landscape ? (icon: 28.0, extent: 56.0) : (icon: 24.0, extent: 48.0);

enum OsdTransportButton { previous, seekBack, playPause, seekForward, next }

typedef OsdTransportBuilder =
    Widget Function(OsdTransportButton button, double iconSize, double extent);

/// The transport in the middle of the picture, with play centered and the
/// seeks and skips spreading out from it.
Widget osdCenterTransport(double scale, OsdTransportBuilder build) {
  Widget side(Alignment alignment, List<Widget> buttons) => Expanded(
    child: Align(
      alignment: alignment,
      child: Row(mainAxisSize: MainAxisSize.min, children: buttons),
    ),
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      side(Alignment.centerRight, [
        build(OsdTransportButton.previous, 40 * scale, 72 * scale),
        build(OsdTransportButton.seekBack, 46 * scale, 78 * scale),
      ]),
      build(OsdTransportButton.playPause, 64 * scale, 92 * scale),
      side(Alignment.centerLeft, [
        build(OsdTransportButton.seekForward, 46 * scale, 78 * scale),
        build(OsdTransportButton.next, 40 * scale, 72 * scale),
      ]),
    ],
  );
}

/// The transport docked at the start of the bottom row, sized like the
/// buttons beside it.
Widget osdDockedTransport({
  required bool landscape,
  required double scale,
  required OsdTransportBuilder build,
}) {
  final size = osdRowButtonSize(landscape: landscape);
  Widget button(OsdTransportButton button) =>
      build(button, size.icon * scale, size.extent * scale);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        button(OsdTransportButton.previous),
        const SizedBox(width: 4),
        button(OsdTransportButton.seekBack),
        const SizedBox(width: 8),
        button(OsdTransportButton.playPause),
        const SizedBox(width: 8),
        button(OsdTransportButton.seekForward),
        const SizedBox(width: 4),
        button(OsdTransportButton.next),
      ],
    ),
  );
}

/// The extra buttons spread along the row when they all fit in landscape,
/// packed to the start on a TV, and scrolling sideways when they don't.
Widget osdButtonRow({
  required List<Widget> buttons,
  required double extent,
  required bool landscape,
}) {
  final estimatedWidth = buttons.length * (extent + 8);
  return LayoutBuilder(
    builder: (context, constraints) {
      if (landscape && estimatedWidth <= constraints.maxWidth) {
        return SizedBox(
          height: extent,
          child: Row(
            mainAxisAlignment: PlatformDetection.isTV
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceEvenly,
            children: buttons,
          ),
        );
      }
      return SizedBox(
        height: extent,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (final button in buttons)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: button,
                ),
            ],
          ),
        ),
      );
    },
  );
}

/// The seek bar's look. A TV whitens the thumb while the bar has focus.
SliderThemeData osdSeekBarTheme({required bool thumbFocused}) =>
    SliderThemeData(
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(
        enabledThumbRadius: TrickplayPreviewLayout.seekThumbRadius,
      ),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
      activeTrackColor: AppColorScheme.rangeProgress,
      secondaryActiveTrackColor: AppColorScheme.rangeTrack.withValues(
        alpha: 0.8,
      ),
      inactiveTrackColor: AppColorScheme.rangeTrack,
      thumbColor: PlatformDetection.isTV && thumbFocused
          ? Colors.white
          : AppColorScheme.rangeThumb,
      overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
    );
