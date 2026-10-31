import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../../preference/user_preferences.dart';
import 'settings_section_header.dart';

/// The mock screen the settings live preview draws.
enum SettingsPreviewScene { home, details, player, search }

/// What the focused settings tile tells the preview about itself.
class SettingsPreviewEntry {
  final String? prefKey;
  final String title;
  final String? description;

  /// Labels for a setting picked from a list, in the order the picker shows
  /// them, so the inspector can lay every choice out side by side.
  final List<String> options;
  final int Function()? currentIndex;

  const SettingsPreviewEntry({
    required this.title,
    this.prefKey,
    this.description,
    this.options = const [],
    this.currentIndex,
  });
}

/// Shared by the settings list, its pickers and the live preview. Tiles report
/// focus here, pickers report the option being looked at, and the preview reads
/// both to decide what to draw.
class SettingsPreviewController extends ChangeNotifier {
  SettingsPreviewController() {
    _prefs?.addListener(notifyListeners);
  }

  // A saved value has to redraw the preview too, not only one a picker tries,
  // or a switch or slider wouldn't show its change until focus moved.
  final UserPreferences? _prefs = GetIt.instance.isRegistered<UserPreferences>()
      ? GetIt.instance<UserPreferences>()
      : null;

  @override
  void dispose() {
    _prefs?.removeListener(notifyListeners);
    super.dispose();
  }

  static const _sceneByKey = <String, SettingsPreviewScene>{
    'pref_clock_behavior': SettingsPreviewScene.home,
    'pref_use_24_hour_clock': SettingsPreviewScene.home,
    'pref_navbar_position': SettingsPreviewScene.home,
    'pref_bottom_navbar_style': SettingsPreviewScene.home,
    'pref_navbar_always_expanded': SettingsPreviewScene.home,
    'pref_show_shuffle_button': SettingsPreviewScene.home,
    'pref_show_genres_button': SettingsPreviewScene.home,
    'pref_show_favorites_button': SettingsPreviewScene.home,
    'pref_show_live_tv_button': SettingsPreviewScene.home,
    'pref_show_syncplay_button': SettingsPreviewScene.home,
    'pref_show_seerr_button': SettingsPreviewScene.home,
    'pref_show_libraries_in_toolbar': SettingsPreviewScene.home,
    'pref_show_libraries_individually': SettingsPreviewScene.home,
    'pref_show_downloads_button': SettingsPreviewScene.home,
    'pref_show_friends_button': SettingsPreviewScene.home,
    'pref_show_server_messages_button': SettingsPreviewScene.home,
    'navbarColor': SettingsPreviewScene.home,
    'navbarOpacity': SettingsPreviewScene.home,
    'pref_home_rows_style': SettingsPreviewScene.home,
    'pref_home_rows_fullscreen': SettingsPreviewScene.home,
    'poster_size': SettingsPreviewScene.home,
    'mediaBarMode': SettingsPreviewScene.home,
    'mediaBarOverlayColor': SettingsPreviewScene.home,
    'mediaBarOverlayOpacity': SettingsPreviewScene.home,
    'mediaBarEnableAdditionalRatings': SettingsPreviewScene.home,
    'mediaBarEnabledRatings': SettingsPreviewScene.home,
    'mediaBarShowRatingLabels': SettingsPreviewScene.home,
    'mediaBarShowRatingBadges': SettingsPreviewScene.home,
    'homeRowsEnableAdditionalRatings': SettingsPreviewScene.home,
    'homeRowsEnabledRatings': SettingsPreviewScene.home,
    'homeRowsShowRatingLabels': SettingsPreviewScene.home,
    'homeRowsShowRatingBadges': SettingsPreviewScene.home,
    'pref_detail_screen_style': SettingsPreviewScene.details,
    'pref_hide_details_media_description': SettingsPreviewScene.details,
    'pref_show_details_backdrop': SettingsPreviewScene.details,
    'pref_details_backdrop_size': SettingsPreviewScene.details,
    'detailsBackgroundBlurAmount': SettingsPreviewScene.details,
    'pref_detail_show_technical_details': SettingsPreviewScene.details,
    'pref_detail_expanded_tabs': SettingsPreviewScene.details,
    'detailMetadataOrderTv': SettingsPreviewScene.details,
    'detailMetadataOrderMobile': SettingsPreviewScene.details,
    'detailMetadataOrderDesktop': SettingsPreviewScene.details,
    'detailButtonOrderTv': SettingsPreviewScene.details,
    'detailButtonOrderMobile': SettingsPreviewScene.details,
    'detailButtonOrderDesktop': SettingsPreviewScene.details,
    'detailButtonsMaxVisible': SettingsPreviewScene.details,
    'enableAdditionalRatings': SettingsPreviewScene.details,
    'enabledRatings': SettingsPreviewScene.details,
    'showRatingLabels': SettingsPreviewScene.details,
    'showRatingBadges': SettingsPreviewScene.details,
    'player_zoom_mode': SettingsPreviewScene.player,
    'crop_black_bars': SettingsPreviewScene.player,
    'showDescriptionOnPause': SettingsPreviewScene.player,
    'skipBackLength': SettingsPreviewScene.player,
    'skipForwardLength': SettingsPreviewScene.player,
    'showChapterMarkers': SettingsPreviewScene.player,
    'osdLockEnabled': SettingsPreviewScene.player,
    'pref_player_transport_position': SettingsPreviewScene.player,
    'osdButtonOrderTv': SettingsPreviewScene.player,
    'osdButtonOrderMobile': SettingsPreviewScene.player,
    'osdButtonOrderDesktop': SettingsPreviewScene.player,
    'hiddenOsdButtonsTv': SettingsPreviewScene.player,
    'hiddenOsdButtonsMobile': SettingsPreviewScene.player,
    'hiddenOsdButtonsDesktop': SettingsPreviewScene.player,
    'playback_time_above_left': SettingsPreviewScene.player,
    'playback_time_above_center': SettingsPreviewScene.player,
    'playback_time_above_right': SettingsPreviewScene.player,
    'playback_time_below_left': SettingsPreviewScene.player,
    'playback_time_below_center': SettingsPreviewScene.player,
    'playback_time_below_right': SettingsPreviewScene.player,
    'pref_subtitle_mode': SettingsPreviewScene.player,
    'pref_subtitle_language': SettingsPreviewScene.player,
    'pref_secondary_subtitles_enabled': SettingsPreviewScene.player,
    'pref_secondary_subtitle_language': SettingsPreviewScene.player,
    'subtitles_text_color': SettingsPreviewScene.player,
    'subtitles_text_stroke_color': SettingsPreviewScene.player,
    'subtitles_background_color': SettingsPreviewScene.player,
    'subtitles_text_size': SettingsPreviewScene.player,
    'subtitles_text_weight': SettingsPreviewScene.player,
    'subtitles_offset_position': SettingsPreviewScene.player,
    'secondary_subtitle_size_adjustment': SettingsPreviewScene.player,
    'secondary_subtitle_offset_adjustment': SettingsPreviewScene.player,
    'secondary_subtitle_text_color': SettingsPreviewScene.player,
    'subtitles_hdr_separate': SettingsPreviewScene.player,
    'subtitles_hdr_text_color': SettingsPreviewScene.player,
    'subtitles_hdr_text_stroke_color': SettingsPreviewScene.player,
    'subtitles_hdr_background_color': SettingsPreviewScene.player,
    'subtitles_hdr_text_size': SettingsPreviewScene.player,
    'subtitles_hdr_text_weight': SettingsPreviewScene.player,
    'subtitles_hdr_offset_position': SettingsPreviewScene.player,
    'subtitles_use_embedded_styles': SettingsPreviewScene.player,
    'subtitles_use_embedded_font_sizes': SettingsPreviewScene.player,
    'media_segment_actions': SettingsPreviewScene.player,
    'next_up_behavior': SettingsPreviewScene.player,
    'loading_animation_image': SettingsPreviewScene.player,
    'loading_animation_size': SettingsPreviewScene.player,
    'loading_animation_position': SettingsPreviewScene.player,
    'loading_animation_speed': SettingsPreviewScene.player,
    'show_loading_animation_text': SettingsPreviewScene.player,
    'trickplay_mode': SettingsPreviewScene.player,
    'trickplay_preview_scale_percent': SettingsPreviewScene.player,
    'trickplay_vertical_position_percent': SettingsPreviewScene.player,
    'trickplay_follow_scrub_position': SettingsPreviewScene.player,
    'trickplay_pause_while_scrubbing': SettingsPreviewScene.player,
    'pref_keyboard_style': SettingsPreviewScene.search,
  };

  /// The screensaver comes on over Home, so every one of its settings shows
  /// there.
  static SettingsPreviewScene? sceneForKey(String? key) => key == null
      ? null
      : key.startsWith('pref_screensaver_')
      ? SettingsPreviewScene.home
      : _sceneByKey[key];

  SettingsPreviewEntry? _focused;
  List<String>? _focusedPath;
  final Map<String, Object?> _trying = {};
  final Map<String, int> _tryingIndex = {};
  SettingsPreviewScene _scene = SettingsPreviewScene.home;
  SettingsPreviewScene? _manualScene;

  SettingsPreviewEntry? get focused => _focused;

  /// Where the focused setting lives, from its category down to the section
  /// it sits in. Null for an entry that isn't a setting, such as a category.
  List<String>? get focusedPath => _focusedPath;

  /// The scene picked by hand from the chips, else the last scene a focused
  /// setting asked for. Settings with nothing to show keep the previous scene
  /// rather than blanking the preview.
  SettingsPreviewScene get scene => _manualScene ?? _scene;

  bool isTrying(String key) => _trying.containsKey(key);
  Object? tryingValue(String key) => _trying[key];
  int? tryingIndex(String key) => _tryingIndex[key];

  void focus(SettingsPreviewEntry entry, {List<String>? path}) {
    _focused = entry;
    _focusedPath = path;
    _manualScene = null;
    final scene = sceneForKey(entry.prefKey);
    if (scene != null) _scene = scene;
    notifyListeners();
  }

  /// The option a picker has in focus, drawn in the preview before it's saved.
  void tryValue(String key, Object? value, {int? index}) {
    _trying[key] = value;
    if (index != null) _tryingIndex[key] = index;
    final scene = sceneForKey(key);
    if (scene != null) _scene = scene;
    notifyListeners();
  }

  void clearTry(String key) {
    if (!_trying.containsKey(key) && !_tryingIndex.containsKey(key)) return;
    _trying.remove(key);
    _tryingIndex.remove(key);
    notifyListeners();
  }

  void showScene(SettingsPreviewScene scene) {
    _manualScene = scene;
    notifyListeners();
  }
}

class SettingsPreviewScope
    extends InheritedNotifier<SettingsPreviewController> {
  const SettingsPreviewScope({
    super.key,
    required SettingsPreviewController controller,
    required super.child,
  }) : super(notifier: controller);

  /// The controller without registering a rebuild dependency, for tiles that
  /// only report into it.
  static SettingsPreviewController? maybeOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<SettingsPreviewScope>()
      ?.notifier;
}

/// The way to a settings screen: its category, then the title of each tile
/// opened on the way there.
class SettingsPreviewPath extends InheritedWidget {
  final List<String> path;

  const SettingsPreviewPath({
    super.key,
    required this.path,
    required super.child,
  });

  static List<String> of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<SettingsPreviewPath>()?.path ??
      const [];

  @override
  bool updateShouldNotify(SettingsPreviewPath oldWidget) =>
      oldWidget.path != path;
}

/// Where a setting titled [title] at [context] lives: its screen's path and
/// the section header above it, leaving out a header that only repeats the
/// setting's own name.
List<String> settingsPreviewPathAt(BuildContext context, String title) {
  final header = settingsSectionAbove(context);
  return [
    ...SettingsPreviewPath.of(context),
    if (header != null && header != title) header,
  ];
}

/// A preference as the preview should draw it: the option a picker is trying,
/// else the saved value. Registers a dependency, so a preview rebuilds when a
/// picker tries a value or a saved one changes.
T previewValue<T>(BuildContext context, Preference<T> preference) {
  final controller = context
      .dependOnInheritedWidgetOfExactType<SettingsPreviewScope>()
      ?.notifier;
  if (controller != null && controller.isTrying(preference.key)) {
    final value = controller.tryingValue(preference.key);
    if (value is T) return value;
  }
  if (GetIt.instance.isRegistered<UserPreferences>()) {
    return GetIt.instance<UserPreferences>().get(preference);
  }
  return preference.defaultValue;
}

/// Tells the live preview which setting has focus, hover or the last tap.
/// Outside a settings preview it's just its child.
class SettingsPreviewReporter extends StatelessWidget {
  final SettingsPreviewEntry Function() describe;
  final Widget child;

  const SettingsPreviewReporter({
    super.key,
    required this.describe,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SettingsPreviewScope.maybeOf(context);
    if (controller == null) return child;
    void report() {
      final entry = describe();
      controller.focus(
        entry,
        path: settingsPreviewPathAt(context, entry.title),
      );
    }

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (focused) report();
      },
      child: MouseRegion(
        onEnter: (_) => report(),
        child: Listener(onPointerDown: (_) => report(), child: child),
      ),
    );
  }
}

/// Wraps one picker option so focusing or hovering it previews [onTry].
Widget settingsPreviewOption({
  required VoidCallback? onTry,
  required Widget child,
}) {
  if (onTry == null) return child;
  return Focus(
    canRequestFocus: false,
    skipTraversal: true,
    onFocusChange: (focused) {
      if (focused) onTry();
    },
    child: MouseRegion(onEnter: (_) => onTry(), child: child),
  );
}
