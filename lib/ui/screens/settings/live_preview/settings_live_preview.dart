import 'dart:async';
import 'dart:math' as math;

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HardwareKeyboard, KeyUpEvent;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:media_kit_video/media_kit_video.dart' show SubtitleViewState;
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/models/aggregated_library.dart';
import '../../../../data/models/media_bar_slide_item.dart';
import '../../../../data/models/media_segment.dart';
import '../../../../data/models/trickplay_preview_layout.dart';
import '../../../../data/models/upcoming_episode_info.dart';
import '../../../../data/repositories/poster_badge_repository.dart';
import '../../../../data/services/plugin_sync_service.dart';
import '../../../../data/services/voice_search_controller.dart';
import '../../../../data/utils/media_segment_actions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../playback/letterbox_croppers.dart';
import '../../../../playback/secondary_subtitle_position.dart';
import '../../../../playback/subtitle_style.dart';
import '../../../../playback/subtitle_view_config.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/device_performance.dart';
import '../../../../util/game_library.dart' show isGameLibrary;
import '../../../../util/platform_detection.dart';
import '../../../../util/playback_time_label.dart';
import '../../../screensaver/bouncing_box.dart';
import '../../../screensaver/screensaver_gradient_backdrops.dart';
import '../../../screensaver/screensaver_view.dart';
import '../../../widgets/adaptive/sf_symbol.dart';
import '../../../widgets/book/book_navigation.dart' show BookCategoryKind;
import '../../../widgets/bounded_network_image.dart';
import '../../../widgets/image_source.dart';
import '../../../widgets/playback/chapter_marker_track.dart';
import '../../../widgets/playback/loading_animation_widget.dart';
import '../../../widgets/playback/next_up_overlay.dart';
import '../../../widgets/playback/playback_time_row.dart';
import '../../../widgets/playback/player_loading_overlay.dart';
import '../../../widgets/playback/player_logo.dart';
import '../../../widgets/playback/seek_icons.dart';
import '../../../widgets/playback/skip_segment_overlay.dart';
import '../../../widgets/playback/trickplay.dart';
import '../../../widgets/player_volume_control.dart';
import '../../../widgets/seasonal/seasonal_effects.dart';
import '../../../widgets/settings/settings_preview_scope.dart';
import '../../../widgets/sliding_pill_tabs.dart';
import '../../../widgets/video_mini_player.dart';
import '../../browse/book_category_screen.dart';
import '../../browse/classic_book_browse_screen.dart';
import '../../browse/immersive_music_screen.dart';
import '../../browse/library_browse_screen.dart';
import '../../browse/music_browse_screen.dart';
import '../../browse/quick_access_music_screen.dart';
import '../../browse/reading_room_book_screen.dart';
import '../../calendar/calendar_agenda_view.dart';
import '../../calendar/calendar_controller.dart';
import '../../calendar/calendar_countdown_view.dart';
import '../../playback/osd_buttons.dart';
import '../../setup/setup_wizard_previews.dart';
import 'preview_row_options_home.dart';

String settingsPreviewSceneName(
  AppLocalizations l10n,
  SettingsPreviewScene scene,
) => switch (scene) {
  SettingsPreviewScene.home => l10n.home,
  SettingsPreviewScene.details => l10n.detailsPage,
  SettingsPreviewScene.player => l10n.player,
  SettingsPreviewScene.search => l10n.search,
  SettingsPreviewScene.calendar => l10n.calendar,
  SettingsPreviewScene.library => l10n.library,
};

/// The scenes this device has settings for. Keyboard Style is a TV setting,
/// so only a TV gets the search keyboard, the calendar only shows for someone
/// the server offers it to, and the library waits on a video, music or book
/// one.
List<SettingsPreviewScene> get settingsPreviewScenes => [
  SettingsPreviewScene.home,
  SettingsPreviewScene.details,
  SettingsPreviewScene.player,
  if (PlatformDetection.useLeanbackUi) SettingsPreviewScene.search,
  if (GetIt.instance.isRegistered<PluginSyncService>() &&
      GetIt.instance<PluginSyncService>().calendarAvailable)
    SettingsPreviewScene.calendar,
  if (_videoLibrary != null || _musicLibrary != null || _bookLibrary != null)
    SettingsPreviewScene.library,
];

/// The first library of one of [types] in the user's order. A games library
/// can carry any of them, and opens the games screen instead.
AggregatedLibrary? _firstLibrary(Set<String> types) => SetupPreviewData
    .libraries
    .value
    .where(
      (l) =>
          types.contains(l.collectionType) &&
          !isGameLibrary(l.id, l.collectionType, l.name),
    )
    .firstOrNull;

AggregatedLibrary? get _videoLibrary => _firstLibrary(const {'movies', 'tvshows'});

AggregatedLibrary? get _musicLibrary => _firstLibrary(const {'music'});

AggregatedLibrary? get _bookLibrary =>
    _firstLibrary(const {'books', 'audiobooks'});

/// [screen] laid out by the canvas's size, with no system bars or keyboard.
Widget _onCanvas(BuildContext context, Widget screen) => MediaQuery(
  data: MediaQuery.of(context).copyWith(
    size: setupPreviewSize(),
    padding: EdgeInsets.zero,
    viewPadding: EdgeInsets.zero,
    viewInsets: EdgeInsets.zero,
  ),
  child: screen,
);

/// The video library in the style being looked at, or the music or book
/// library while its style has focus. Without a video library it falls back to
/// music, then books.
Widget _libraryScene(String? focusedKey) => Builder(
  builder: (context) {
    final video = _videoLibrary;
    final music = _musicLibrary;
    final books = _bookLibrary;
    if (books != null &&
        (focusedKey == UserPreferences.bookLibraryStyle.key ||
            (video == null && music == null))) {
      final type = books.collectionType;
      return settingsNavbarPreviewOver(
        _onCanvas(
          context,
          switch (previewValue(context, UserPreferences.bookLibraryStyle)) {
            BookLibraryStyle.classic => ClassicBookBrowseScreen(
              libraryId: books.id,
              collectionType: type,
            ),
            BookLibraryStyle.readingRoom => ReadingRoomBookScreen(
              libraryId: books.id,
              collectionType: type,
            ),
            BookLibraryStyle.bookstore => BookCategoryScreen(
              libraryId: books.id,
              kind: BookCategoryKind.titles,
              collectionType: type,
              root: true,
            ),
          },
        ),
      );
    }
    if (music != null &&
        (focusedKey == UserPreferences.musicLibraryStyle.key || video == null)) {
      final style = previewValue(context, UserPreferences.musicLibraryStyle);
      final screen = _onCanvas(context, switch (style) {
        MusicLibraryStyle.classic => MusicBrowseScreen(libraryId: music.id),
        MusicLibraryStyle.quickAccess => QuickAccessMusicScreen(
          libraryId: music.id,
        ),
        MusicLibraryStyle.immersive => ImmersiveMusicScreen(
          libraryId: music.id,
        ),
      });
      // Classic has no navbar of its own, the others sit in the app's.
      return style == MusicLibraryStyle.classic
          ? _designCanvas(setupPreviewSize(), screen)
          : settingsNavbarPreviewOver(screen);
    }
    if (video == null) return const SizedBox.shrink();
    return _designCanvas(
      setupPreviewSize(),
      _onCanvas(
        context,
        LibraryBrowseScreen(
          key: ValueKey(video.id),
          libraryId: video.id,
          serverId: video.serverId,
          previewStyle: previewValue(context, UserPreferences.libraryStyle),
        ),
      ),
    );
  },
);

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
    Listenable.merge([
      controller,
      ?SetupPreviewData.listenable,
      // The sample labels wait on the server saying this person gets labels.
      if (GetIt.instance.isRegistered<PosterBadgeRepository>())
        GetIt.instance<PosterBadgeRepository>().available,
    ]);

/// The live preview: the scenes over a mock of the screen the focused setting
/// changes, drawn with the saved values or the option a picker is trying.
class SettingsLivePreview extends StatefulWidget {
  /// Hides the header so a phone can lay the scenes out itself.
  final bool showHeader;

  /// Lets the D-pad reach the scenes, see [SettingsPreviewScenes].
  final FocusNode? sceneFocus;

  /// Left off the first scene.
  final VoidCallback? onLeaveScenes;

  /// Up or Down off the scenes, true when it was used.
  final bool Function(bool isUp)? onScenesVertical;

  const SettingsLivePreview({
    super.key,
    this.showHeader = true,
    this.sceneFocus,
    this.onLeaveScenes,
    this.onScenesVertical,
  });

  @override
  State<SettingsLivePreview> createState() => _SettingsLivePreviewState();
}

class _SettingsLivePreviewState extends State<SettingsLivePreview> {
  @override
  void initState() {
    super.initState();
    unawaited(SetupPreviewData.ensureLoaded());
    if (GetIt.instance.isRegistered<PosterBadgeRepository>()) {
      unawaited(GetIt.instance<PosterBadgeRepository>().checkAvailable());
    }
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
            SettingsPreviewScenes(
              controller: controller,
              focusNode: widget.sceneFocus,
              onExitLeft: widget.onLeaveScenes,
              onVerticalNavigation: widget.onScenesVertical,
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
        'mediaBarShowRatingBadges' ||
        'mediaBarNewReleaseBanner' ||
        'mediaBarNewReleaseDays' ||
        'mediaBarRowPeek' => Builder(
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
        'seasonal_surprise' || 'seasonal_density' =>
          const SettingsSeasonalPreview(),
        // Drawn on its own rather than over the media bar's items, so the
        // rows still show when the bar has nothing to give.
        final key? when RowOptionsGroup.forKey(key) != null =>
          PreviewRowOptionsHome(
            group: RowOptionsGroup.forKey(key)!,
            focusedKey: key,
          ),
        final key? when drawsHomeRows(key) =>
          PreviewRowOptionsHome(focusedKey: key),
        final key? when key.startsWith('pref_screensaver_') => Builder(
          builder: (context) =>
              previewValue(context, UserPreferences.screensaverEnabled)
              ? _designCanvas(
                  setupPreviewSize(),
                  const SettingsScreensaverPreview(),
                )
              : settingsHomePreview(),
        ),
        'focus_color' => settingsHomePreview(focusCard: true),
        _ => settingsHomePreview(),
      },
      SettingsPreviewScene.details => Builder(
        builder: (context) => detailStylePreview(
          previewValue(context, UserPreferences.detailScreenStyle),
        ),
      ),
      SettingsPreviewScene.player => SettingsPlayerPreview(focusedKey: key),
      SettingsPreviewScene.search => const SettingsSearchPreview(),
      SettingsPreviewScene.calendar => const SettingsCalendarPreview(),
      SettingsPreviewScene.library => _libraryScene(key),
    };
  }
}

/// The "Live preview" label and the scenes, in the same pill strip as the
/// categories, to switch scenes by hand.
class SettingsPreviewScenes extends StatelessWidget {
  final SettingsPreviewController controller;

  /// Where the D-pad reaches the scenes. Without it a TV keeps them out of
  /// focus and the preview just follows the focused setting.
  final FocusNode? focusNode;

  /// Left off the first scene.
  final VoidCallback? onExitLeft;

  /// Up or Down off the scenes, true when it was used.
  final bool Function(bool isUp)? onVerticalNavigation;

  /// Sits before the scenes in place of the label, like the phone's show/hide
  /// toggle, so it's in reach however many scenes there are.
  final Widget? leading;

  /// Runs after a scene is picked, so a hidden phone preview can open.
  final VoidCallback? onSceneTap;

  const SettingsPreviewScenes({
    super.key,
    required this.controller,
    this.focusNode,
    this.onExitLeft,
    this.onVerticalNavigation,
    this.leading,
    this.onSceneTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scenes = settingsPreviewScenes;
    // The strip keeps a fixed height and measures its labels once, so the
    // scale is capped the way the category strip's is and a new one gets a
    // fresh strip.
    Widget pills = MediaQuery.withClampedTextScaling(
      maxScaleFactor: DesktopUiScale.large.scaleFactor,
      child: SlidingPillTabs(
        key: ValueKey(MediaQuery.textScalerOf(context)),
        labels: [
          for (final scene in scenes) settingsPreviewSceneName(l10n, scene),
        ],
        selectedIndex: scenes.indexOf(controller.scene),
        onChanged: (index) {
          controller.showScene(scenes[index]);
          onSceneTap?.call();
        },
        focusNode: focusNode,
        onExitLeft: onExitLeft,
        onVerticalNavigation: onVerticalNavigation,
        alignment: leading == null
            ? Alignment.centerRight
            : Alignment.centerLeft,
      ),
    );
    if (PlatformDetection.useLeanbackUi && focusNode == null) {
      pills = ExcludeFocus(child: pills);
    }
    return Row(
      children: [
        if (leading case final leading?) ...[
          leading,
          const SizedBox(width: 6),
        ] else ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorScheme.accent,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            l10n.settingsLivePreview.toUpperCase(),
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(child: pills),
      ],
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
    // A Row Options setting whose rows are all off can't change Home, so the
    // line says what it needs rather than that it shows.
    final blocked = rowOptionsBlockedReason(context, key);

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
                  color: blocked != null
                      ? Colors.amber
                      : scene != null
                      ? AppColorScheme.accent
                      : muted,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  blocked ??
                      (scene != null
                          ? l10n.settingsPreviewShowsOn(
                              settingsPreviewSceneName(l10n, scene),
                            )
                          : l10n.settingsPreviewNotShown),
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

enum _PlayerMoment {
  loading,
  intro,
  middle,
  seeking,
  paused,
  outro,
  end,
  watching,
}

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

const _sampleIntro = MediaSegment(
  id: 'intro',
  itemId: 'preview',
  type: MediaSegmentType.intro,
  start: Duration(seconds: 12),
  end: Duration(seconds: 90),
);

const _sampleOutro = MediaSegment(
  id: 'outro',
  itemId: 'preview',
  type: MediaSegmentType.outro,
  start: Duration(minutes: 9, seconds: 24),
  end: Duration(minutes: 9, seconds: 58),
);

/// The player over a sample episode: its controls up mid-episode for the zoom
/// mode, the buttons and the time labels, playing with the controls hidden for
/// the subtitle look, the paused description for its own setting, the intro
/// prompt at the start, the outro's over the credits and Next Up at the end.
/// The loading animation settings get the player before the stream starts
/// and the trickplay ones get it mid-seek.
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
      'media_segment_actions' ||
      'pref_media_segment_countdown' => _PlayerMoment.intro,
      'replace_skip_outro_with_next_up' => _PlayerMoment.outro,
      'next_up_behavior' ||
      'next_up_timeout' ||
      'pref_show_next_air_date' => _PlayerMoment.end,
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
    // The player only pauses a scrub that has trickplay to show.
    final scrubPaused =
        trickplay != TrickplayMode.disabled &&
        previewValue(context, UserPreferences.trickPlayPauseWhileScrubbing);
    final actions = parseMediaSegmentActions(
      previewValue(context, UserPreferences.mediaSegmentActions),
    );
    final introAction =
        actions[MediaSegmentType.intro] ?? MediaSegmentAction.askToSkip;
    final outroAction =
        actions[MediaSegmentType.outro] ?? MediaSegmentAction.askToSkip;
    final nextUp = previewValue(context, UserPreferences.nextUpBehavior);
    final countdown = previewValue(
      context,
      UserPreferences.mediaSegmentCountdown,
    );
    final outroNextUp =
        moment == _PlayerMoment.outro &&
        nextUp != NextUpBehavior.disabled &&
        previewValue(context, UserPreferences.replaceSkipOutroWithNextUp);
    // The countdown shows on the intro's button whatever the intro does.
    final skipSegment = switch (moment) {
      _PlayerMoment.intro
          when introAction == MediaSegmentAction.askToSkip ||
              focusedKey == UserPreferences.mediaSegmentCountdown.key =>
        _sampleIntro,
      _PlayerMoment.outro
          when !outroNextUp && outroAction == MediaSegmentAction.askToSkip =>
        _sampleOutro,
      _ => null,
    };
    final upNext =
        outroNextUp ||
        (moment == _PlayerMoment.end && nextUp != NextUpBehavior.disabled);
    // The sample episode stands in for the newest one the library has, so
    // the card says when the next one airs.
    final airDate = focusedKey == UserPreferences.showNextAirDate.key;
    final upNextCard = upNext && !airDate;
    final minimal = nextUp == NextUpBehavior.minimal;
    final timeout = previewValue(context, UserPreferences.nextUpTimeout);
    final airDateCard =
        upNext &&
        airDate &&
        previewValue(context, UserPreferences.showNextAirDate);
    // The player hides its controls when the card comes up.
    final controls =
        moment != _PlayerMoment.watching && !upNextCard && !airDateCard;
    final paused =
        moment == _PlayerMoment.paused &&
        previewValue(context, UserPreferences.showDescriptionOnPause);
    final subtitles =
        !paused &&
        previewValue(context, UserPreferences.subtitleMode) != SubtitleMode.none;
    final position = switch (moment) {
      _PlayerMoment.intro =>
        skipSegment == null && introAction == MediaSegmentAction.skip
            ? const Duration(minutes: 1, seconds: 30)
            : const Duration(seconds: 42),
      _PlayerMoment.seeking => _trickplaySeek,
      _PlayerMoment.outro => const Duration(minutes: 9, seconds: 31),
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
                  // The subtitle settings fill the frame, since the wide
                  // film's bars would put the line where a black outline or
                  // shadow can't be seen.
                  fit: moment == _PlayerMoment.watching
                      ? BoxFit.cover
                      : zoomModeToBoxFit(zoom),
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
                  controls: controls,
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
              if (controls)
                _PlayerControls(
                  item: item,
                  position: position,
                  playing: moment != _PlayerMoment.paused && !scrubPaused,
                  // The middle stays up while Pause While Scrubbing has
                  // focus, so its play button shows what a scrub does.
                  seeking:
                      moment == _PlayerMoment.seeking &&
                      focusedKey !=
                          UserPreferences.trickPlayPauseWhileScrubbing.key,
                  trickplay: trickplay,
                ),
              if (skipSegment != null)
                SkipSegmentOverlay(
                  segment: skipSegment,
                  onSkip: () {},
                  onDismiss: () {},
                  initialPosition: position,
                  // Where the player puts it before it has measured its
                  // controls.
                  bottomInset:
                      TrickplayPreviewLayout.verticalTravelBottomMargin +
                      AppSpacing.spaceXs,
                  countdown: countdown,
                ),
              if (upNextCard)
                NextUpOverlay(
                  nextItem: AggregatedItem(
                    id: 'preview-next',
                    serverId: '',
                    rawData: {
                      'Name': next?.title ?? '',
                      'Type': 'Episode',
                      'ParentIndexNumber': 1,
                      'IndexNumber': 6,
                    },
                  ),
                  isMinimal: minimal,
                  imageUrl: minimal ? null : next?.backdropUrl,
                  timeoutMs: timeout,
                  onPlayNext: () {},
                  onDismiss: () {},
                  countdown: countdown,
                  countsDown: false,
                )
              else if (airDateCard)
                NextUpOverlay.airDate(
                  airDate: UpcomingEpisodeInfo(
                    seasonNumber: 1,
                    episodeNumber: 6,
                    airDate: DateTime.now().add(const Duration(days: 3)),
                  ),
                  airDateTitle: next?.title ?? '',
                  isMinimal: minimal,
                  timeoutMs: timeout,
                  onDismiss: () {},
                  countdown: countdown,
                  countsDown: false,
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
/// secondary subtitles are on. While the [controls] show, it moves up clear of
/// the seek bar so they don't cover it.
class _PlayerSubtitles extends StatelessWidget {
  final bool hdr;
  final bool controls;

  const _PlayerSubtitles({required this.hdr, required this.controls});

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
          shadows: subtitleShadows(style, size),
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
      bottom: controls
          ? math.max(
              bottom,
              _PlayerControls.seekBarTop(context) + AppSpacing.spaceSm,
            )
          : bottom,
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

  static bool _docked(BuildContext context) =>
      !PlatformDetection.isTV &&
      previewValue(context, UserPreferences.playerTransportPosition) ==
          PlayerTransportPosition.docked;

  static double _scale(BuildContext context) => PlatformDetection.useMobileUi
      ? 1.0
      : previewValue(context, UserPreferences.desktopUiScale).scaleFactor;

  /// How far up from the bottom of the screen [build] lays out the seek bar,
  /// the time row above it included when that row shows.
  static double seekBarTop(BuildContext context) {
    double timeRow({bool bold = false}) {
      final painter = TextPainter(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context).style.merge(
            TextStyle(
              fontSize: AppTypography.fontSizeXs,
              fontWeight: bold ? FontWeight.w600 : null,
            ),
          ),
        ),
        textDirection: TextDirection.ltr,
        textScaler: MediaQuery.textScalerOf(context),
      )..layout();
      final height = painter.height;
      painter.dispose();
      return height;
    }

    final landscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final above = [
      UserPreferences.playbackTimeAboveLeft,
      UserPreferences.playbackTimeAboveCenter,
      UserPreferences.playbackTimeAboveRight,
    ].any((slot) => previewValue(context, slot) != PlaybackTimeSlot.none);
    return AppSpacing.spaceSm +
        osdRowButtonSize(landscape: landscape).extent * _scale(context) +
        // osdDockedTransport pads itself 8 above and below.
        (PlatformDetection.isTV || _docked(context) ? 16 : 0) +
        AppSpacing.spaceXs +
        timeRow() +
        // The slider is as tall as its thumb's overlay.
        osdSeekBarTheme(
          thumbFocused: true,
        ).overlayShape!.getPreferredSize(true, false).height +
        (above ? AppSpacing.spaceXs + timeRow(bold: true) : 0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    final tv = PlatformDetection.isTV;
    final docked = _docked(context);
    final scale = _scale(context);
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

/// Home with the seasonal effect and density being looked at over it. Home's
/// own effect pauses meanwhile, and this one holds still while keys are
/// pressed, since each frame it animates redraws all of Settings.
class SettingsSeasonalPreview extends StatefulWidget {
  const SettingsSeasonalPreview({super.key});

  @override
  State<SettingsSeasonalPreview> createState() =>
      _SettingsSeasonalPreviewState();
}

class _SettingsSeasonalPreviewState extends State<SettingsSeasonalPreview> {
  static const _holdAfterKey = Duration(milliseconds: 700);

  Timer? _hold;

  // Home rebuilds on the count, which mustn't happen mid build.
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() => seasonalPreviewsRunning.value++);
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onKey);
    _hold?.cancel();
    scheduleMicrotask(() => seasonalPreviewsRunning.value--);
    super.dispose();
  }

  bool _onKey(KeyEvent event) {
    if (event is KeyUpEvent) return false;
    final wasHeld = _hold != null;
    _hold?.cancel();
    _hold = Timer(_holdAfterKey, () {
      if (mounted) setState(() => _hold = null);
    });
    if (!wasHeld) setState(() {});
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    return Stack(
      children: [
        settingsHomePreview(),
        Positioned.fill(
          child: _designCanvas(
            setupPreviewSize(),
            TickerMode(
              enabled: _hold == null,
              child: SeasonalEffectsHost(
                effect: previewValue(context, UserPreferences.seasonalSurprise),
                density: previewValue(context, UserPreferences.seasonalDensity),
                reducedFrameRate:
                    prefs.resolveDevicePerformanceTier() ==
                    DevicePerformanceTier.reduced,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// The Calendar screen in the style being looked at, showing the user's own
/// calendar.
class SettingsCalendarPreview extends StatefulWidget {
  const SettingsCalendarPreview({super.key});

  @override
  State<SettingsCalendarPreview> createState() =>
      _SettingsCalendarPreviewState();
}

class _SettingsCalendarPreviewState extends State<SettingsCalendarPreview> {
  final _controller = CalendarController();

  @override
  void initState() {
    super.initState();
    unawaited(_controller.load());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = previewValue(context, UserPreferences.calendarStyle);
    return settingsNavbarPreviewOver(
      // The preview draws its own bars, so the device's insets stay out.
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) => switch (style) {
            CalendarStyle.agenda => CalendarAgendaView(controller: _controller),
            CalendarStyle.countdown => CalendarCountdownView(
              controller: _controller,
            ),
          },
        ),
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
