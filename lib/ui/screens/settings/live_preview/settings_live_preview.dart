import 'dart:async';
import 'dart:math' as math;

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:media_kit_video/media_kit_video.dart' show SubtitleViewState;
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/media_bar_slide_item.dart';
import '../../../../data/models/media_segment.dart';
import '../../../../data/models/trickplay_preview_layout.dart';
import '../../../../data/services/voice_search_controller.dart';
import '../../../../data/utils/media_segment_actions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../playback/letterbox_croppers.dart';
import '../../../../playback/secondary_subtitle_position.dart';
import '../../../../playback/subtitle_style.dart';
import '../../../../playback/subtitle_view_config.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/focus/input_mode_tracker.dart';
import '../../../../util/platform_detection.dart';
import '../../../../util/playback_time_label.dart';
import '../../../screensaver/bouncing_box.dart';
import '../../../screensaver/screensaver_gradient_backdrops.dart';
import '../../../screensaver/screensaver_view.dart';
import '../../../widgets/adaptive/sf_symbol.dart';
import '../../../widgets/bounded_network_image.dart';
import '../../../widgets/image_source.dart';
import '../../../widgets/playback/chapter_marker_track.dart';
import '../../../widgets/playback/loading_animation_widget.dart';
import '../../../widgets/playback/playback_time_row.dart';
import '../../../widgets/playback/player_loading_overlay.dart';
import '../../../widgets/playback/player_logo.dart';
import '../../../widgets/playback/seek_icons.dart';
import '../../../widgets/playback/trickplay.dart';
import '../../../widgets/player_volume_control.dart';
import '../../../widgets/settings/settings_preview_scope.dart';
import '../../../widgets/video_mini_player.dart';
import '../../playback/osd_buttons.dart';
import '../../setup/setup_wizard_previews.dart';

String settingsPreviewSceneName(
  AppLocalizations l10n,
  SettingsPreviewScene scene,
) => switch (scene) {
  SettingsPreviewScene.home => l10n.home,
  SettingsPreviewScene.details => l10n.detailsPage,
  SettingsPreviewScene.player => l10n.player,
  SettingsPreviewScene.search => l10n.search,
};

/// The scenes this device has settings for. Keyboard Style is a TV setting,
/// so only a TV gets the search keyboard.
List<SettingsPreviewScene> get settingsPreviewScenes => [
  SettingsPreviewScene.home,
  SettingsPreviewScene.details,
  SettingsPreviewScene.player,
  if (PlatformDetection.useLeanbackUi) SettingsPreviewScene.search,
];

/// The player lays out landscape even on a phone, where playback rotates. A TV
/// is landscape already, so it shares the other scenes' canvas.
Size get _playerDesignSize {
  if (PlatformDetection.useLeanbackUi) return setupPreviewSize();
  if (PlatformDetection.useMobileUi) return const Size(844, 390);
  return const Size(1280, 800);
}

double settingsPreviewAspect(SettingsPreviewScene scene) =>
    scene == SettingsPreviewScene.player
    ? _playerDesignSize.aspectRatio
    : setupPreviewAspect();

Listenable _previewListenable(SettingsPreviewController controller) =>
    Listenable.merge([controller, ?SetupPreviewData.listenable]);

/// The live preview: scene chips over a mock of the screen the focused setting
/// changes, drawn with the saved values or the option a picker is trying.
class SettingsLivePreview extends StatefulWidget {
  /// Hides the header so a phone can lay the chips out itself.
  final bool showHeader;

  /// Lets the D-pad reach the chips, see [SettingsPreviewSceneChips].
  final Map<SettingsPreviewScene, FocusNode>? chipFocus;

  const SettingsLivePreview({
    super.key,
    this.showHeader = true,
    this.chipFocus,
  });

  @override
  State<SettingsLivePreview> createState() => _SettingsLivePreviewState();
}

class _SettingsLivePreviewState extends State<SettingsLivePreview> {
  @override
  void initState() {
    super.initState();
    unawaited(SetupPreviewData.ensureLoaded());
  }

  @override
  Widget build(BuildContext context) {
    final controller = SettingsPreviewScope.maybeOf(context);
    if (controller == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: _previewListenable(controller),
      builder: (context, _) {
        final scene = controller.scene;
        final frame = AspectRatio(
          aspectRatio: settingsPreviewAspect(scene),
          child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              borderRadius: AppRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.circular(14),
              child: ColoredBox(
                color: AppColorScheme.background,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: KeyedSubtree(
                    key: ValueKey(scene),
                    child: ExcludeFocus(
                      child: IgnorePointer(
                        child: _sceneWidget(controller, scene),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        if (!widget.showHeader) return frame;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingsPreviewSceneChips(
              controller: controller,
              focusNodes: widget.chipFocus,
            ),
            const SizedBox(height: 10),
            Flexible(child: Center(child: frame)),
          ],
        );
      },
    );
  }

  Widget _sceneWidget(
    SettingsPreviewController controller,
    SettingsPreviewScene scene,
  ) {
    final key = controller.focused?.prefKey;
    return switch (scene) {
      SettingsPreviewScene.home => switch (key) {
        'mediaBarMode' ||
        'mediaBarOverlayColor' ||
        'mediaBarOverlayOpacity' ||
        'mediaBarEnableAdditionalRatings' ||
        'mediaBarEnabledRatings' ||
        'mediaBarShowRatingLabels' ||
        'mediaBarShowRatingBadges' => Builder(
          builder: (context) => mediaBarPreview(
            previewValue(context, UserPreferences.mediaBarMode),
          ),
        ),
        // Home rows only rate the card in focus, so this draws the rows on
        // their own with the first card standing in for it.
        'homeRowsEnableAdditionalRatings' ||
        'homeRowsEnabledRatings' ||
        'homeRowsShowRatingLabels' ||
        'homeRowsShowRatingBadges' => Builder(
          builder: (context) => homeRowsPreview(
            modern:
                previewValue(context, UserPreferences.homeRowsStyle) ==
                HomeRowsStyle.v2,
          ),
        ),
        'pref_bottom_navbar_style' => Builder(
          builder: (context) => bottomNavbarStylePreview(
            previewValue(context, UserPreferences.bottomNavbarStyle),
          ),
        ),
        final key? when key.startsWith('pref_screensaver_') => Builder(
          builder: (context) =>
              previewValue(context, UserPreferences.screensaverEnabled)
              ? _designCanvas(
                  setupPreviewSize(),
                  const SettingsScreensaverPreview(),
                )
              : settingsHomePreview(),
        ),
        _ => settingsHomePreview(),
      },
      SettingsPreviewScene.details => Builder(
        builder: (context) => detailStylePreview(
          previewValue(context, UserPreferences.detailScreenStyle),
        ),
      ),
      SettingsPreviewScene.player => SettingsPlayerPreview(focusedKey: key),
      SettingsPreviewScene.search => const SettingsSearchPreview(),
    };
  }
}

/// The "Live preview" label and the chips that switch scenes by hand.
class SettingsPreviewSceneChips extends StatelessWidget {
  final SettingsPreviewController controller;

  /// A node per chip where the D-pad can reach them. Without them a TV keeps
  /// the chips out of focus and the preview just follows the focused setting.
  final Map<SettingsPreviewScene, FocusNode>? focusNodes;

  const SettingsPreviewSceneChips({
    super.key,
    required this.controller,
    this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scenes = settingsPreviewScenes;
    Widget chips = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < scenes.length; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          _SceneChip(
            label: settingsPreviewSceneName(l10n, scenes[i]),
            selected: controller.scene == scenes[i],
            focusNode: focusNodes?[scenes[i]],
            onTap: () => controller.showScene(scenes[i]),
          ),
        ],
      ],
    );
    if (PlatformDetection.useLeanbackUi && focusNodes == null) {
      chips = ExcludeFocus(child: chips);
    }
    // A phone has room for the chips or the label, and the chips matter more.
    final phone = PlatformDetection.useMobileUi;
    return LayoutBuilder(
      builder: (context, constraints) {
        // The chips take the width they need and the label gets what's left,
        // so only chips that outgrow the whole row scroll.
        final chipsRoom = constraints.maxWidth - 16 - (phone ? 0 : 12);
        return Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.accent,
              ),
            ),
            const SizedBox(width: 8),
            if (!phone) ...[
              // Clipped so a label squeezed to nothing leaves no stray
              // ellipsis behind.
              Expanded(
                child: ClipRect(
                  child: Text(
                    l10n.settingsLivePreview.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: math.max(0, chipsRoom)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Room for the focus ring and glow, which the scroll view
                // would otherwise clip.
                padding: focusNodes == null
                    ? null
                    : const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: chips,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SceneChip extends StatefulWidget {
  final String label;
  final bool selected;
  final FocusNode? focusNode;
  final VoidCallback onTap;

  const _SceneChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.focusNode,
  });

  @override
  State<_SceneChip> createState() => _SceneChipState();
}

class _SceneChipState extends State<_SceneChip> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    final focused = InputModeTracker.showFocusVisuals(context, _focused);
    final borders = ThemeRegistry.active.borders;
    return AnimatedScale(
      scale: focused ? 1.08 : 1.0,
      duration: const Duration(milliseconds: 120),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(999),
          boxShadow: focused ? borders.focusGlow : null,
        ),
        child: Material(
          color: selected ? Colors.white : Colors.transparent,
          shape: StadiumBorder(
            side: focused
                ? borders.focusBorder.copyWith(width: 2)
                : BorderSide(
                    color: selected
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.22),
                  ),
          ),
          child: InkWell(
            customBorder: const StadiumBorder(),
            focusNode: widget.focusNode,
            focusColor: Colors.transparent,
            onFocusChange: (value) {
              setState(() => _focused = value);
              if (!value) return;
              // Focusing a chip shows its scene, the way clicking it does.
              widget.onTap();
              Scrollable.ensureVisible(
                context,
                duration: const Duration(milliseconds: 120),
              );
            },
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: selected
                      ? AppColors.black
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The focused setting spelled out under the preview: its name, where it
/// lives in Settings, whether the preview shows it, and every choice a picker
/// offers with the saved one and the one being tried. A category has no place
/// of its own, so it gets its description instead.
class SettingsPreviewInspector extends StatelessWidget {
  const SettingsPreviewInspector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsPreviewScope.maybeOf(context);
    if (controller == null) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: _previewListenable(controller),
      builder: (context, _) => _build(context, controller),
    );
  }

  Widget _build(BuildContext context, SettingsPreviewController controller) {
    final entry = controller.focused;
    if (entry == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final scene = SettingsPreviewController.sceneForKey(entry.prefKey);
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.6);
    final key = entry.prefKey;
    final saved = entry.currentIndex?.call() ?? -1;
    final live = (key == null ? null : controller.tryingIndex(key)) ?? saved;
    final trying = key != null && controller.isTrying(key) && live != saved;
    final path = controller.focusedPath;
    final detail = path == null ? entry.description : path.join(' › ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // A link opens a screen of its own settings, so it has no status to
        // report.
        if (key != null) ...[
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: scene != null ? AppColorScheme.accent : muted,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  scene != null
                      ? l10n.settingsPreviewShowsOn(
                          settingsPreviewSceneName(l10n, scene),
                        )
                      : l10n.settingsPreviewNotShown,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: scene != null ? AppColorScheme.onSurface : muted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        Text(
          entry.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: AppColorScheme.onSurface,
          ),
        ),
        if (detail != null && detail.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            detail,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13.5, height: 1.4, color: muted),
          ),
        ],
        if (entry.options.isNotEmpty && entry.options.length <= 8) ...[
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < entry.options.length; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  _OptionChip(
                    label: entry.options[i],
                    live: i == live,
                    savedTag: trying && i == saved
                        ? l10n.settingsPreviewSaved
                        : null,
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _OptionChip extends StatelessWidget {
  final String label;
  final bool live;
  final String? savedTag;

  const _OptionChip({required this.label, required this.live, this.savedTag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: live ? Colors.white : Colors.white.withValues(alpha: 0.06),
        borderRadius: AppRadius.circular(999),
        border: Border.all(
          color: live
              ? Colors.white
              : savedTag != null
              ? AppColorScheme.accent
              : Colors.white.withValues(alpha: 0.14),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: live ? AppColors.black : AppColorScheme.onSurface,
            ),
          ),
          if (savedTag != null) ...[
            const SizedBox(width: 6),
            Text(
              savedTag!.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

Widget _art(String? url) {
  if (url == null || url.isEmpty) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColorScheme.accent.withValues(alpha: 0.55),
            AppColorScheme.surfaceVariant,
          ],
        ),
      ),
    );
  }
  return BoundedNetworkImage(imageUrl: url, fit: BoxFit.cover);
}

/// Lays [child] out at [size] and scales it into whatever the preview frame
/// gives it, so every measurement is the real screen's.
Widget _designCanvas(Size size, Widget child) => FittedBox(
  fit: BoxFit.contain,
  child: SizedBox.fromSize(size: size, child: child),
);

enum _PlayerMoment { loading, intro, middle, seeking, paused, end, watching }

/// The label the player shows while a stream comes up.
const _streamLoadingLabel = 'Loading Stream...';

/// Subtitle settings get the episode playing with its controls hidden, so
/// nothing covers the line.
bool _isSubtitleKey(String key) =>
    key == 'pref_subtitle_mode' ||
    key == 'pref_subtitle_language' ||
    key.startsWith('pref_secondary_subtitle') ||
    key.startsWith('subtitles_') ||
    key.startsWith('secondary_subtitle_');

/// Where the sample episode's chapters start, for the seek bar's marks.
const _sampleChapterStartsMs = [90000, 236000, 418000, 571000];

/// The player over a sample episode: its controls up mid-episode for the zoom
/// mode, the buttons and the time labels, playing with the controls hidden for
/// the subtitle look, the paused description for its own setting, the intro
/// prompt at the start and Next Up at the end. The loading animation settings
/// get the player before the stream starts and the trickplay ones get it
/// mid-seek.
class SettingsPlayerPreview extends StatelessWidget {
  final String? focusedKey;

  const SettingsPlayerPreview({super.key, this.focusedKey});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = _playerDesignSize;
    final u = size.width / 960;
    final items = SetupPreviewData.items;
    final item = items.isEmpty ? null : items.first;
    final next = items.length > 1 ? items[1] : item;

    final moment = switch (focusedKey) {
      'media_segment_actions' => _PlayerMoment.intro,
      'next_up_behavior' => _PlayerMoment.end,
      'showDescriptionOnPause' => _PlayerMoment.paused,
      'show_loading_animation_text' => _PlayerMoment.loading,
      final key? when key.startsWith('loading_animation_') =>
        _PlayerMoment.loading,
      final key? when key.startsWith('trickplay_') => _PlayerMoment.seeking,
      final key? when _isSubtitleKey(key) => _PlayerMoment.watching,
      _ => _PlayerMoment.middle,
    };
    if (moment == _PlayerMoment.loading) {
      return _designCanvas(size, const _PlayerLoadingPreview());
    }
    final zoom = previewValue(context, UserPreferences.playerZoomMode);
    final trickplay = moment == _PlayerMoment.seeking
        ? previewValue(context, UserPreferences.trickPlayMode)
        : TrickplayMode.disabled;
    final scrubPaused =
        moment == _PlayerMoment.seeking &&
        previewValue(context, UserPreferences.trickPlayPauseWhileScrubbing);
    final introAction =
        parseMediaSegmentActions(
          previewValue(context, UserPreferences.mediaSegmentActions),
        )[MediaSegmentType.intro] ??
        MediaSegmentAction.askToSkip;
    final nextUp = previewValue(context, UserPreferences.nextUpBehavior);
    final paused =
        moment == _PlayerMoment.paused &&
        previewValue(context, UserPreferences.showDescriptionOnPause);
    final subtitles =
        !paused &&
        previewValue(context, UserPreferences.subtitleMode) != SubtitleMode.none;
    final position = switch (moment) {
      _PlayerMoment.intro =>
        introAction == MediaSegmentAction.skip
            ? const Duration(minutes: 1, seconds: 30)
            : const Duration(seconds: 42),
      _PlayerMoment.seeking => _trickplaySeek,
      _PlayerMoment.end => const Duration(minutes: 9, seconds: 58),
      _ => const Duration(minutes: 4, seconds: 12),
    };

    TextStyle text(double size, {FontWeight weight = FontWeight.w500}) =>
        TextStyle(
          fontSize: size * u,
          fontWeight: weight,
          color: Colors.white,
          shadows: const [Shadow(blurRadius: 6, color: Colors.black)],
        );

    return _designCanvas(
      size,
      MediaQuery(
        data: MediaQuery.of(context).copyWith(
          size: size,
          padding: EdgeInsets.zero,
          viewPadding: EdgeInsets.zero,
          viewInsets: EdgeInsets.zero,
        ),
        child: ColoredBox(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRect(
                child: FittedBox(
                  fit: zoomModeToBoxFit(zoom),
                  child: SizedBox(
                    width: 2390,
                    height: 1000,
                    child: _art(item?.backdropUrl),
                  ),
                ),
              ),
              // The renderer draws them into the picture, under everything
              // the player puts over it.
              if (subtitles)
                _PlayerSubtitles(
                  hdr: focusedKey?.startsWith('subtitles_hdr_') ?? false,
                ),
              if (trickplay == TrickplayMode.full)
                Positioned.fill(
                  child: Trickplay(
                    fillFrame: true,
                    content: (_) => FittedBox(
                      fit: zoomModeToBoxFit(zoom),
                      child: SizedBox(
                        width: 160,
                        height: 90,
                        child: _sampleTrickplayFrame(
                          _trickplayFrameAt(context, _trickplaySeek),
                          large: true,
                        ),
                      ),
                    ),
                  ),
                ),
              if (paused) ...[
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.85),
                        Colors.black.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 48 * u,
                  top: 110 * u,
                  width: 460 * u,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.paused.toUpperCase(),
                        style: text(13, weight: FontWeight.w700),
                      ),
                      SizedBox(height: 8 * u),
                      Text(
                        item?.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: text(32, weight: FontWeight.w700),
                      ),
                      SizedBox(height: 8 * u),
                      Text(
                        item?.overview ?? '',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: text(15).copyWith(height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
              if (moment != _PlayerMoment.watching)
                _PlayerControls(
                  item: item,
                  position: position,
                  playing: moment != _PlayerMoment.paused && !scrubPaused,
                  seeking: moment == _PlayerMoment.seeking,
                  trickplay: trickplay,
                ),
              if (moment == _PlayerMoment.intro &&
                  introAction == MediaSegmentAction.askToSkip)
                // Where the player puts it before it has measured its
                // controls.
                Positioned(
                  right: 24,
                  bottom:
                      TrickplayPreviewLayout.verticalTravelBottomMargin +
                      AppSpacing.spaceXs,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * u,
                      vertical: 10 * u,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppRadius.circular(999),
                    ),
                    child: Text(
                      l10n.skipSegment(MediaSegmentType.intro.displayName),
                      style: TextStyle(
                        fontSize: 15 * u,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              if (moment == _PlayerMoment.end &&
                  nextUp == NextUpBehavior.extended)
                Positioned(
                  right: 32 * u,
                  top: 28 * u,
                  width: 270 * u,
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(12),
                    child: ColoredBox(
                      color: Colors.black.withValues(alpha: 0.85),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 140 * u,
                            width: double.infinity,
                            child: _art(next?.backdropUrl),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12 * u),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.upNext.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 11 * u,
                                    fontWeight: FontWeight.w700,
                                    color: AppColorScheme.accent,
                                  ),
                                ),
                                SizedBox(height: 4 * u),
                                Text(
                                  next?.title ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: text(16, weight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (moment == _PlayerMoment.end &&
                  nextUp == NextUpBehavior.minimal)
                Positioned(
                  right: 32 * u,
                  top: 28 * u,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16 * u,
                      vertical: 9 * u,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.8),
                      borderRadius: AppRadius.circular(999),
                    ),
                    child: Text(
                      '${l10n.upNext}: ${next?.title ?? ''}',
                      style: text(14, weight: FontWeight.w600),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The sample line in each language the preview speaks, split around the word
/// its author set in italics.
(String, String, String) _subtitleLine(String language) => switch (language) {
  'jpn' => ('待って、今の', '聞こえた', '？'),
  'spa' => ('Espera, ¿', 'oíste', ' eso?'),
  'fre' || 'fra' => ('Attends, tu as ', 'entendu', ' ça ?'),
  'ger' || 'deu' => ('Warte, hast du das ', 'gehört', '?'),
  _ => ('Wait, did you ', 'hear', ' that?'),
};

/// The subtitle line the way the player puts it on screen: the saved look, or
/// the HDR one while an HDR setting has focus, at the size and height this
/// device's renderer draws it, with the secondary line stacked above it while
/// secondary subtitles are on.
class _PlayerSubtitles extends StatelessWidget {
  final bool hdr;

  const _PlayerSubtitles({required this.hdr});

  @override
  Widget build(BuildContext context) {
    T read<T>(Preference<T> preference) => previewValue(context, preference);
    final style = SubtitleStyle.read(read, isHdr: hdr);
    final screen = MediaQuery.sizeOf(context);
    final height = screen.height;
    final view = subtitleViewConfigurationFor(style, screenHeight: height);
    final media3 =
        PlatformDetection.isAndroid &&
        read(UserPreferences.playbackEnginePreference) ==
            PlaybackEnginePreference.media3;
    final mpv =
        !media3 &&
        (PlatformDetection.useNativeVideoSurface ||
            PlatformDetection.isLinux ||
            PlatformDetection.isWindows);
    // Media3 sizes text at 0.06 of the picture's height for a size of 24 and
    // mpv lays it out on a 720 line canvas. Both take the offset as a share of
    // the height to leave under the line.
    final (fontSize, bottom) = media3
        ? (style.fontSize / 24 * 0.06 * height, style.verticalOffset * height)
        : mpv
        ? (
            mpvSubtitleFontSize(style.fontSize) / 720 * height,
            style.verticalOffset * height,
          )
        : (view.style.fontSize!, view.padding.bottom);
    // media_kit's own view shrinks its text on a screen smaller than 1080p.
    final scaler = media3 || mpv
        ? TextScaler.noScaling
        : TextScaler.linear(
            math.sqrt(
              (screen.width *
                      screen.height /
                      (SubtitleViewState.kTextScaleFactorReferenceWidth *
                          SubtitleViewState.kTextScaleFactorReferenceHeight))
                  .clamp(0.0, 1.0),
            ),
          );
    // Media3 drops the sample's italics along with the rest of a subtitle's
    // own styling when embedded styles are off.
    final italic =
        !media3 || read(UserPreferences.subtitlesUseEmbeddedStyles);

    Widget line(String language, double size, int color) {
      final (before, word, after) = _subtitleLine(language);
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: before),
            TextSpan(
              text: word,
              style: italic
                  ? const TextStyle(fontStyle: FontStyle.italic)
                  : null,
            ),
            TextSpan(text: after),
          ],
        ),
        textAlign: view.textAlign,
        textScaler: scaler,
        style: view.style.copyWith(
          fontSize: size,
          color: Color(color),
          shadows: subtitleStrokeShadows(Color(style.strokeColor), size),
        ),
      );
    }

    final secondaryColor = read(UserPreferences.secondarySubtitleTextColor);
    final secondaryGap =
        (mpv ? mpvSecondarySubtitleGap * height : 8) +
        read(UserPreferences.secondarySubtitleOffsetPosition).clamp(
              secondarySubtitleMinOffset,
              secondarySubtitleMaxOffset,
            ) *
            height;
    return Positioned(
      left: view.padding.left,
      right: view.padding.right,
      bottom: bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (read(UserPreferences.secondarySubtitlesEnabled)) ...[
            line(
              read(UserPreferences.preferredSecondarySubtitleLanguage),
              fontSize *
                  (1 +
                      read(
                            UserPreferences.secondarySubtitleSizeAdjustment,
                          ).clamp(-50.0, 50.0) /
                          100),
              secondaryColor == -1 ? style.textColor : secondaryColor,
            ),
            SizedBox(height: secondaryGap),
          ],
          line(
            read(UserPreferences.defaultSubtitleLanguage),
            fontSize,
            style.textColor,
          ),
        ],
      ),
    );
  }
}

/// The player's controls over the sample episode: the title bar, the
/// transport, the seek bar with the time labels Progress Bar Time places, and
/// the extra buttons in the order and with the switches Player Buttons gives
/// this kind of device. The episode can be favorited, has chapters, cast,
/// subtitles and trickplay, and isn't playing in a SyncPlay group or to a
/// cast device.
class _PlayerControls extends StatelessWidget {
  final MediaBarSlideItem? item;
  final Duration position;
  final bool playing;
  final bool seeking;
  final TrickplayMode trickplay;

  const _PlayerControls({
    required this.item,
    required this.position,
    required this.playing,
    required this.seeking,
    required this.trickplay,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    final tv = PlatformDetection.isTV;
    final docked =
        !tv &&
        previewValue(context, UserPreferences.playerTransportPosition) ==
            PlayerTransportPosition.docked;
    final scale = PlatformDetection.useMobileUi
        ? 1.0
        : previewValue(context, UserPreferences.desktopUiScale).scaleFactor;
    final landscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    Widget button(IconData icon, double size, double extent) =>
        SizedBox.square(
          dimension: extent,
          child: Center(
            child: AdaptiveIcon(icon, color: Colors.white, size: size),
          ),
        );

    Widget transport(OsdTransportButton which, double size, double extent) =>
        button(switch (which) {
          OsdTransportButton.previous => Icons.skip_previous_rounded,
          OsdTransportButton.seekBack => seekBackIcon(
            previewValue(context, UserPreferences.skipBackLength),
          ),
          OsdTransportButton.playPause =>
            playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
          OsdTransportButton.seekForward => seekForwardIcon(
            previewValue(context, UserPreferences.skipForwardLength),
          ),
          OsdTransportButton.next => Icons.skip_next_rounded,
        }, size, extent);

    final rowSize = osdRowButtonSize(landscape: landscape);
    final iconSize = rowSize.icon * scale;
    final extent = rowSize.extent * scale;
    final hidden = osdButtonLayout.hidden(prefs);
    final zoomIcon =
        previewValue(context, UserPreferences.cropBlackBars) &&
            letterboxCropSettingVisible()
        ? Icons.crop_16_9_outlined
        : osdZoomIcon(previewValue(context, UserPreferences.playerZoomMode));
    final extras = osdButtonRow(
      landscape: landscape,
      extent: extent,
      buttons: [
        for (final osd in osdButtonLayout.ordered(
          OsdButton.values,
          (osd) => osd.id,
          prefs,
        ))
          // SyncPlay only joins the row in a group.
          if (osd.isOffered &&
              osd != OsdButton.syncPlay &&
              !hidden.contains(osd.id))
            switch (osd) {
              OsdButton.speed => SizedBox.square(
                dimension: extent,
                child: Center(
                  child: Text(
                    '1.0x',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: landscape
                          ? AppTypography.fontSizeMd
                          : AppTypography.fontSizeSm,
                    ),
                  ),
                ),
              ),
              OsdButton.volume => button(
                volumeIconFor(prefs.get(UserPreferences.playerVolume) / 100),
                iconSize,
                extent,
              ),
              OsdButton.zoom => button(zoomIcon, iconSize, extent),
              _ => button(osd.icon, iconSize, extent),
            },
      ],
    );

    final duration = _trickplayRuntime;
    final use24Hour = previewValue(context, UserPreferences.use24HourClock);
    String slot(EnumPreference<PlaybackTimeSlot> preference) =>
        formatPlaybackTimeSlot(
          context,
          slot: previewValue(context, preference),
          position: position,
          duration: duration,
          use24Hour: use24Hour,
        );
    final above = [
      slot(UserPreferences.playbackTimeAboveLeft),
      slot(UserPreferences.playbackTimeAboveCenter),
      slot(UserPreferences.playbackTimeAboveRight),
    ];
    Widget slots(List<String> labels, {bool bold = false}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: PlaybackTimeRow(
        left: labels[0],
        center: labels[1],
        right: labels[2],
        bold: bold,
      ),
    );

    final seekBar = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (above.any((label) => label.isNotEmpty))
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.spaceXs),
            child: slots(above, bold: true),
          ),
        Stack(
          alignment: Alignment.center,
          children: [
            SliderTheme(
              // A TV brings the controls up with focus on the seek bar.
              data: osdSeekBarTheme(thumbFocused: true),
              child: Slider(
                value: position.inMilliseconds.toDouble(),
                secondaryTrackValue: math
                    .min(
                      position.inMilliseconds + 90000,
                      duration.inMilliseconds,
                    )
                    .toDouble(),
                max: duration.inMilliseconds.toDouble(),
                onChanged: (_) {},
              ),
            ),
            ChapterMarkerTrack(
              positionsMs:
                  previewValue(context, UserPreferences.showChapterMarkers)
                  ? _sampleChapterStartsMs
                  : const [],
              durationMs: duration.inMilliseconds,
            ),
          ],
        ),
        slots([
          slot(UserPreferences.playbackTimeBelowLeft),
          slot(UserPreferences.playbackTimeBelowCenter),
          slot(UserPreferences.playbackTimeBelowRight),
        ]),
      ],
    );

    const titleStyle = TextStyle(
      color: Colors.white,
      fontSize: AppTypography.fontSizeLg,
      fontWeight: FontWeight.w600,
    );
    final series = item?.title;
    final episode = 'S1:E3 - ${l10n.episodeNumber(3)}';
    Widget titleLine(String text, TextStyle style) =>
        Text(text, style: style, maxLines: 1, overflow: TextOverflow.ellipsis);
    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item?.logoUrl case final logo?) ...[
          PlayerLogo(
            image: offlineAwareImageProvider(logo),
            errorBuilder: (_, _, _) => titleLine(series ?? episode, titleStyle),
          ),
          titleLine(episode, titleStyle),
        ] else ...[
          if (series != null)
            titleLine(
              series,
              const TextStyle(
                color: Colors.white70,
                fontSize: AppTypography.fontSizeSm,
              ),
            ),
          titleLine(episode, titleStyle),
        ],
      ],
    );

    Widget iconButton(IconData icon, double size) => IconButton(
      onPressed: () {},
      icon: AdaptiveIcon(icon, color: Colors.white, size: size),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: Color(0x4D000000)),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(
              top: AppSpacing.spaceSm,
              left: AppSpacing.spaceLg,
              right: AppSpacing.spaceLg,
              bottom: AppSpacing.spaceMd,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
            child: Row(
              children: [
                if (!PlatformDetection.useLeanbackUi && !tv)
                  iconButton(Icons.arrow_back, 24 * scale),
                const SizedBox(width: AppSpacing.spaceSm),
                Expanded(child: title),
                if (VideoMiniPlayerController.isSupported)
                  iconButton(Icons.picture_in_picture_alt_rounded, 30 * scale),
                if (PlatformDetection.useMobileUi &&
                    previewValue(context, UserPreferences.osdLockEnabled))
                  iconButton(Icons.lock_outline, 22),
              ],
            ),
          ),
        ),
        // A scrub over trickplay clears the middle for the thumbnails.
        if (!PlatformDetection.useLeanbackUi && !docked && !seeking)
          Positioned.fill(
            child: Center(child: osdCenterTransport(scale, transport)),
          ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (trickplay == TrickplayMode.single ||
                  trickplay == TrickplayMode.strip)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.spaceLg,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSpacing.spaceSm,
                      ),
                      child: _TrickplaySeekThumbs(
                        mode: trickplay,
                        trackWidth: constraints.maxWidth,
                        heightBudget:
                            MediaQuery.sizeOf(context).height -
                            TrickplayPreviewLayout.verticalTravelBottomMargin -
                            TrickplayPreviewLayout.verticalTravelTopMargin,
                      ),
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: AppSpacing.spaceSm,
                  left: AppSpacing.spaceLg,
                  right: AppSpacing.spaceLg,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    seekBar,
                    const SizedBox(height: AppSpacing.spaceXs),
                    if (tv || docked)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          osdDockedTransport(
                            landscape: landscape,
                            scale: scale,
                            build: transport,
                          ),
                          const SizedBox(width: AppSpacing.spaceXs),
                          Expanded(child: extras),
                        ],
                      )
                    else
                      extras,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const _trickplayRuntime = Duration(minutes: 10, seconds: 4);

/// Where the trickplay preview holds its seek: a quarter of the way into the
/// sample episode the player preview prints the length of. Off center, since
/// at the halfway mark following the scrub and staying centered look the same.
const _trickplaySeek = Duration(minutes: 2, seconds: 31);

/// The sample frame the player would have at [position], one per skip step
/// as the real thumbnails are.
int _trickplayFrameAt(BuildContext context, Duration position) =>
    position.inMilliseconds ~/ _trickplayStepMs(context);

int _trickplayStepMs(BuildContext context) =>
    math.max(previewValue(context, UserPreferences.skipForwardLength), 1);

/// The single thumbnail or the strip above the seek bar, laid out by the
/// player's own planner on a track [trackWidth] wide.
class _TrickplaySeekThumbs extends StatelessWidget {
  final TrickplayMode mode;
  final double trackWidth;
  final double heightBudget;

  const _TrickplaySeekThumbs({
    required this.mode,
    required this.trackWidth,
    required this.heightBudget,
  });

  @override
  Widget build(BuildContext context) {
    final isStrip = mode == TrickplayMode.strip;
    const spacing = AppSpacing.spaceXs;
    final plan = TrickplayPreviewLayout.plan(
      trackWidth: trackWidth,
      scalePercent: previewValue(
        context,
        UserPreferences.trickPlayPreviewScalePercent,
      ),
      aspect: 9 / 16,
      maxHeightBudget: heightBudget,
      positionMs: _trickplaySeek.inMilliseconds.toDouble(),
      durationMs: _trickplayRuntime.inMilliseconds.toDouble(),
      followScrub: previewValue(
        context,
        UserPreferences.trickPlayFollowScrubPosition,
      ),
      verticalPositionPercent: previewValue(
        context,
        UserPreferences.trickPlayVerticalPositionPercent,
      ),
      isStrip: isStrip,
      spacing: spacing,
      overflowMargin: AppSpacing.spaceLg,
      seekPosition: _trickplaySeek,
      totalDuration: _trickplayRuntime,
      stepMs: _trickplayStepMs(context),
    );
    final positioned = Transform.translate(
      offset: Offset(plan.leftOffset, 0),
      child: Trickplay(
        leftCount: plan.leftCount,
        rightCount: plan.rightCount,
        tileWidth: plan.tileWidth,
        tileHeight: plan.tileHeight,
        slotSpacing: spacing,
        content: (slot) {
          final target = plan.slotsByIndex[slot]?.targetPosition;
          return target == null
              ? null
              : _sampleTrickplayFrame(_trickplayFrameAt(context, target));
        },
      ),
    );
    return Transform.translate(
      offset: Offset(0, -plan.verticalTravel),
      child: SizedBox(
        width: trackWidth,
        height: plan.tileHeight,
        child: isStrip
            ? OverflowBox(
                minWidth: 0,
                maxWidth: double.infinity,
                alignment: Alignment.topLeft,
                child: positioned,
              )
            : Align(alignment: Alignment.topLeft, child: positioned),
      ),
    );
  }
}

const _trickplayShotLength = 3;

double _pseudoRandom(int seed) {
  var x = seed;
  x = ((x >> 16) ^ x) * 0x45d9f3b;
  x = ((x >> 16) ^ x) * 0x45d9f3b;
  x = (x >> 16) ^ x;
  return (x & 0xFFFFFF) / 0xFFFFFF;
}

/// A stand-in trickplay frame: the logo jumping around a black frame every few
/// shots, numbered so a strip reads as consecutive frames.
Widget _sampleTrickplayFrame(int index, {bool large = false}) {
  final shot = index ~/ _trickplayShotLength;
  const wiggle = 0.08;
  final bounceX =
      ((_pseudoRandom(shot * 2 + 1) * 2 - 1) + math.sin(index * 2.7) * wiggle)
          .clamp(-1.0, 1.0);
  final bounceY =
      ((_pseudoRandom(shot * 2 + 2) * 2 - 1) +
              math.sin(index * 3.3 + 1.5) * wiggle)
          .clamp(-1.0, 1.0);
  return Container(
    color: Colors.black,
    child: Stack(
      alignment: Alignment.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final logoSize =
                math.min(constraints.maxWidth, constraints.maxHeight) *
                (large ? 0.6 : 0.7);
            return Align(
              alignment: Alignment(bounceX, bounceY),
              child: SizedBox(
                width: logoSize,
                height: logoSize,
                child: SvgPicture.asset(
                  'assets/icons/moonfin_logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
        Positioned(
          right: 3,
          bottom: 2,
          child: Text(
            '$index',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: large
                  ? AppTypography.fontSizeMd
                  : AppTypography.fontSizeXs,
            ),
          ),
        ),
      ],
    ),
  );
}

/// The player before the stream starts: black, with the loading animation and
/// its label where the player puts them.
class _PlayerLoadingPreview extends StatelessWidget {
  const _PlayerLoadingPreview();

  @override
  Widget build(BuildContext context) {
    final image = previewValue(context, UserPreferences.loadingAnimationImage);
    final size = previewValue(context, UserPreferences.loadingAnimationSize);
    final position = previewValue(
      context,
      UserPreferences.loadingAnimationPosition,
    );
    final speed = previewValue(context, UserPreferences.loadingAnimationSpeed);
    final showText = previewValue(
      context,
      UserPreferences.showLoadingAnimationText,
    );
    Widget overlay({bool? movingLeft}) => PlayerLoadingOverlay(
      label: _streamLoadingLabel,
      customImage: image,
      customSize: size,
      customPosition: position,
      customSpeed: speed,
      customShowText: showText,
      flipHorizontal: movingLeft,
    );
    return ColoredBox(
      color: Colors.black,
      child: position == LoadingAnimationPosition.bouncing
          ? BouncingPositionWrapper(
              speed: speed,
              safePadding: const EdgeInsets.all(40.0),
              builder: (context, movingLeft) =>
                  overlay(movingLeft: movingLeft),
            )
          : Align(
              alignment: position.alignment,
              child: Padding(padding: position.safePadding, child: overlay()),
            ),
    );
  }
}

/// The screensaver as it comes on: its backdrop, the dimming and the extra
/// component, sized and placed as the real one draws them.
class SettingsScreensaverPreview extends StatelessWidget {
  const SettingsScreensaverPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final backdrop = previewValue(context, UserPreferences.screensaverBackdrop);
    final component = previewValue(
      context,
      UserPreferences.screensaverComponent,
    );
    final movement = previewValue(context, UserPreferences.screensaverMovement);
    final dimming = previewValue(
      context,
      UserPreferences.screensaverDimming,
    ).clamp(0, 90);
    final scale = previewValue(
      context,
      UserPreferences.screensaverSize,
    ).scaleFactor;
    final items = SetupPreviewData.items;

    final Widget backdropLayer = switch (backdrop) {
      ScreensaverBackdrop.library => _art(
        items.isEmpty ? null : items.first.backdropUrl,
      ),
      ScreensaverBackdrop.black => const ColoredBox(color: Colors.black),
      _ => AnimatedGradientBackdrop(backdrop: backdrop),
    };

    final (double width, double height) = switch (component) {
      ScreensaverComponent.none => (0.0, 0.0),
      ScreensaverComponent.moonfinLogo => (320.0 * scale, 140.0 * scale),
      ScreensaverComponent.clock => (200.0 * scale, 56.0 * scale),
      ScreensaverComponent.runner => (120.0 * scale, 120.0 * scale),
    };
    Widget content({required bool movingLeft}) => switch (component) {
      ScreensaverComponent.none => const SizedBox.shrink(),
      ScreensaverComponent.moonfinLogo => Image.asset(
        'assets/images/logo_and_text.png',
        fit: BoxFit.contain,
      ),
      ScreensaverComponent.clock => ScreensaverClock(
        opacity: 1 - (dimming / 100) * 0.7,
        use24Hour: previewValue(context, UserPreferences.use24HourClock),
        fontSize: 32 * scale,
      ),
      ScreensaverComponent.runner => Center(
        child: RunnerAnimation(
          size: 96 * scale,
          flipHorizontal: movingLeft,
          speed: movement.loadingSpeed,
        ),
      ),
    };

    return ColoredBox(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          backdropLayer,
          if (dimming > 0)
            ColoredBox(color: Colors.black.withValues(alpha: dimming / 100)),
          if (component != ScreensaverComponent.none)
            movement.isBouncing
                ? BouncingBox(
                    childWidth: width,
                    childHeight: height,
                    speedMultiplier: movement.speedMultiplier,
                    builder: (context, movingLeft) =>
                        content(movingLeft: movingLeft),
                  )
                : Align(
                    alignment: previewValue(
                      context,
                      UserPreferences.screensaverPosition,
                    ).alignment,
                    child: Padding(
                      padding: const EdgeInsets.all(48),
                      child: SizedBox(
                        width: width,
                        height: height,
                        child: content(movingLeft: false),
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}

/// Search with its keyboard open. Classic, Glass and Docked are the app's own
/// keyboard drawn at the TV's size. Native stands in for the TV's system
/// keyboard, which the app hands typing to instead.
class SettingsSearchPreview extends StatefulWidget {
  const SettingsSearchPreview({super.key});

  @override
  State<SettingsSearchPreview> createState() => _SettingsSearchPreviewState();
}

class _SettingsSearchPreviewState extends State<SettingsSearchPreview> {
  // One per style, set before the keyboard first listens, since switching a
  // live controller's style would rebuild the keyboard mid-build.
  final _keyboards = <KeyboardStyle, KeyboardController>{};
  final _keyboardFocus = FocusNode(debugLabel: 'SettingsSearchPreviewKeys');

  @override
  void dispose() {
    for (final keyboard in _keyboards.values) {
      keyboard.dispose();
    }
    _keyboardFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = setupPreviewSize();
    const query = 'Spri';
    final style = previewValue(context, UserPreferences.keyboardStyle);
    final keyboard = _keyboards.putIfAbsent(
      style,
      () => KeyboardController()
        ..style = style
        ..setText(query)
        ..show(),
    );
    final items = SetupPreviewData.items;

    // The search screen's own field on a TV, which the keyboard opens over.
    final fieldIconColor = AppColorScheme.onSurface.withValues(alpha: 0.7);
    final field = Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColorScheme.surfaceVariant,
        borderRadius: AppRadius.circular(32),
        border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 30, color: fieldIconColor),
          const SizedBox(width: 10),
          Text(
            query,
            style: TextStyle(fontSize: 22, color: AppColorScheme.onSurface),
          ),
          Container(width: 2, height: 26, color: AppColorScheme.accent),
          if (VoiceSearchController.isSupported) ...[
            const Spacer(),
            SizedBox.square(
              dimension: 52,
              child: Icon(Icons.mic_none, size: 28, color: fieldIconColor),
            ),
          ],
        ],
      ),
    );
    final topNavbar =
        previewValue(context, UserPreferences.navbarPosition) ==
        NavbarPosition.top;

    final results = Row(
      children: [
        for (final item in items.take(4)) ...[
          SizedBox(
            width: 92,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 92,
                  height: 138,
                  child: ClipRRect(
                    borderRadius: ThemeRegistry.active.borders.cardRadius,
                    child: _art(item.posterUrl),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
        ],
      ],
    );

    return _designCanvas(
      size,
      Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: AppColorScheme.background),
          Padding(
            padding: EdgeInsets.only(top: topNavbar ? 80 : 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 820),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: field,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(48, 22, 48, 0),
                  child: results,
                ),
              ],
            ),
          ),
          if (style == KeyboardStyle.native)
            const Align(
              alignment: Alignment.bottomCenter,
              child: _SystemKeyboard(),
            )
          else
            MediaQuery(
              data: MediaQuery.of(context).copyWith(size: size),
              child: Material(
                type: MaterialType.transparency,
                child: Center(
                  child: CustomKeyboard(
                    key: ValueKey(style),
                    keyboardController: keyboard,
                    focusNode: _keyboardFocus,
                    inputPurpose: InputPurpose.search,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A plain light keyboard standing in for the one the TV itself draws.
class _SystemKeyboard extends StatelessWidget {
  const _SystemKeyboard();

  @override
  Widget build(BuildContext context) {
    const rows = ['qwertyuiop', 'asdfghjkl', 'zxcvbnm'];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(80, 18, 80, 22),
      color: const Color(0xFFE8EAED),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final key in row.split(''))
                    Container(
                      width: 56,
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: key == 'n'
                            ? const Color(0xFF1A73E8)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        key,
                        style: TextStyle(
                          fontSize: 18,
                          color: key == 'n'
                              ? Colors.white
                              : const Color(0xFF202124),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
