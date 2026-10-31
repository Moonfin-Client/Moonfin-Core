import 'dart:async';
import 'dart:convert';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart' show CupertinoSlider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart' hide ImageType;
import 'package:url_launcher/url_launcher.dart';

import '../../../data/services/achievements_service.dart';
import '../../../data/services/auto_download_service.dart';
import '../../../data/services/moonbase_endpoint.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../data/services/custom_external_lists_service.dart';
import '../../../data/services/topshelf_service.dart';
import '../../../data/models/media_segment.dart';
import '../../../data/utils/media_segment_actions.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/repositories/user_views_repository.dart';
import '../../../data/services/seerr/seerr_discover_sliders.dart';
import '../../../di/providers.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../platform/web_runtime_config.dart';
import '../../../playback/apple_player_ui.dart';
import '../../../playback/display_hdr_probe.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/gamepad/gamepad_navigation_scope.dart';
import '../../../util/language_codes.dart';
import '../../../util/live_tv_library.dart';
import '../../../util/locale_names.dart';
import '../../util/home_row_title_localizer.dart';
import '../../../util/overlay_color_palette.dart';
import '../../../util/game_cores.dart';
import '../../../util/platform_detection.dart';
import '../../../util/app_beta.dart';
import '../../../util/app_distribution.dart';
import '../../../util/pin_code_util.dart';
import '../../../util/signed_in_server_features.dart';
import '../../widgets/pin_entry_dialog.dart';
import '../../widgets/app_update_dialog.dart';

import '../../../auth/store/authentication_preferences.dart';
import '../../../auth/store/client_certificate_store.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../data/services/client_certificate_service.dart';
import '../../../util/server_url.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';
import '../../../playback/audio_capability_profile.dart';
import '../../../playback/audio_capability_probe.dart';
import '../../../playback/device_profile_builder.dart';
import '../../../playback/external_player_service.dart';
import '../../../playback/known_defects.dart';
import '../../../playback/letterbox_croppers.dart';
import '../../../preference/bottom_nav_tabs.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/seerr_row_config.dart';
import '../../navigation/destinations.dart';
import '../admin/admin_nav.dart';
import '../setup/setup_wizard_gate.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/keyboard_shortcuts/keyboard_shortcut_reference.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/client_certificate_dialog.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/button_layout_list.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'live_preview/settings_live_preview.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../widgets/bottom_nav/bottom_nav_destinations.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/support_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../home/home_view_model.dart';
import 'appearance_theme_screen.dart';
import 'diagnostics_settings_screen.dart';
import 'download_settings_screen.dart';
import 'saved_themes_screen.dart';
import 'theme_store_screen.dart';
import 'home_sections_screen.dart';
import 'home_row_toggles_screen.dart';
import 'home_rows_image_type_screen.dart';
import 'emulator_cores_screen.dart';
import 'achievements_screen.dart';
import 'downloaded_games_screen.dart';
import 'library_order_screen.dart';
import 'library_settings_screen.dart';
import 'media_bar_settings_screen.dart';
import 'screensaver_settings_screen.dart';
import 'parental_settings_screen.dart';
import 'pin_code_settings_screen.dart';
import 'plugin_settings_screen.dart';
import 'ratings_config_screen.dart';
import 'seerr_config_screen.dart';
import 'settings_app_bar.dart';
import 'subtitle_customization_screen.dart';
import 'subtitle_settings_screen.dart';
import '../../../preference/detail_metadata_layout.dart';
import '../../../preference/detail_section_layout.dart';
import '../detail/detail_buttons.dart';
import '../detail/playlist_sort_filter_bar.dart';
import '../playback/osd_buttons.dart';
import '../watch_party/watch_together_route.dart';

part 'panel/settings_panel_infra.dart';
part 'panel/settings_search_field.dart';
part 'panel/settings_search_index.dart';
part 'panel/account_screen.dart';
part 'panel/general_screen.dart';
part 'panel/appearance_screen.dart';
part 'panel/details_screen_settings_screen.dart';
part 'panel/navigation_category_screen.dart';
part 'panel/bottom_nav_tabs_screen.dart';
part 'panel/home_screen_category_screen.dart';
part 'panel/libraries_category_screen.dart';
part 'panel/seasonal_effects_screen.dart';
part 'panel/loading_animation_screen.dart';
part 'panel/services_screen.dart';
part 'panel/external_lists_screen.dart';
part 'panel/plugin_screen.dart';
part 'panel/about_category_screen.dart';
part 'panel/keyboard_shortcuts_screen.dart';
part 'panel/playback_category_screen.dart';
part 'panel/video_playback_screen.dart';
part 'panel/quality_decoding_screen.dart';
part 'panel/playback_time_layout_screen.dart';
part 'panel/osd_buttons_screen.dart';
part 'panel/detail_buttons_screen.dart';
part 'panel/detail_metadata_screen.dart';
part 'panel/detail_sections_screen.dart';
part 'panel/audio_preferences_screen.dart';
part 'panel/automation_queue_screen.dart';
part 'panel/advanced_options_screen.dart';
part 'panel/syncplay_settings_screen.dart';
part 'panel/settings_panel_tiles.dart';

bool get _showThemeEditorEntry =>
    PlatformDetection.isWeb && webRuntimeConfig.pluginMode;

/// Whether Integrations has anything to show: Seerr, which a signed-in server
/// with the Moonfin plugin could offer, or achievements, which the active
/// server's plugin answered for.
bool get _integrationsOffered =>
    seerrOnAnySignedInServer() ||
    (GetIt.instance.isRegistered<AchievementsService>() &&
        GetIt.instance<AchievementsService>().available);

Uri _resolveThemeEditorUri() {
  final base = Uri.base;
  final path = base.path;
  final markerIndex = path.toLowerCase().indexOf('/moonfin/web');

  final prefix = markerIndex >= 0 ? path.substring(0, markerIndex) : '';

  return Uri(
    scheme: base.scheme,
    userInfo: base.userInfo,
    host: base.host,
    port: base.hasPort ? base.port : null,
    path: '$prefix/Moonfin/Web/theme/index.html',
  );
}

Future<void> _openThemeEditor(BuildContext context) async {
  final uri = _resolveThemeEditorUri();
  final ok = await launchUrl(
    uri,
    mode: PlatformDetection.isWeb
        ? LaunchMode.platformDefault
        : LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );

  if (!ok && context.mounted) {
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.adminCouldNotOpenUrl('$uri'))),
    );
  }
}

/// The largest text scale the category labels fit the strip's fixed height
/// at. Past Large their descenders get cut off.
final _pillMaxTextScale = DesktopUiScale.large.scaleFactor;

/// The inspector's height at the default scale, split into the share its text
/// takes, which grows with the user's scale, and its padding and gaps.
const _inspectorTextHeight = 90.0;
const _inspectorFixedHeight = 90.0;

/// One pill segment of Settings and the page it opens in the list column.
class _SettingsCategory {
  final String title;
  final String subtitle;
  final Widget Function() screen;

  const _SettingsCategory(this.title, this.subtitle, this.screen);
}

/// A category page that is a short list of entries rather than settings:
/// Administration, and the way out of Kids Mode.
class _SettingsEntryListScreen extends StatelessWidget {
  final String title;
  final List<_PanelEntry> entries;

  const _SettingsEntryListScreen({required this.title, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(title)),
      body: ListView(
        children: [
          adaptiveListSection(
            children: [for (final entry in entries) _PanelEntryTile(entry: entry)],
          ),
        ],
      ),
    );
  }
}

/// Settings with its live preview. The categories sit in the app's pill tabs,
/// the chosen category's screens run in their own navigator in a list column,
/// and the preview beside it (above it on a phone) redraws the screen the
/// focused setting changes.
class SettingsSidePanel extends ConsumerStatefulWidget
    with FullScreenSettingsContent {
  const SettingsSidePanel({super.key});

  @override
  ConsumerState<SettingsSidePanel> createState() => _SettingsSidePanelState();
}

class _SettingsSidePanelState extends ConsumerState<SettingsSidePanel> {
  final _preview = SettingsPreviewController();
  final _listNavKey = GlobalKey<NavigatorState>();
  final _listScope = FocusScopeNode(debugLabel: 'SettingsListColumn');
  final _pillFocus = FocusNode(debugLabel: 'SettingsCategoryPill');
  final _searchController = TextEditingController();
  final _searchFieldFocus = FocusNode(debugLabel: 'SettingsSearchField');
  final _searchTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _chipFocus = {
    for (final scene in SettingsPreviewScene.values)
      scene: FocusNode(debugLabel: 'SettingsPreviewChip_${scene.name}'),
  };

  /// The setting Right crossed to the chips from, for Left and Back to return
  /// to.
  FocusNode? _chipsReturnFocus;
  String _query = '';
  List<_SettingsCategory> _categories = const [];
  int _categoryIndex = 0;
  String? _shownCategory;

  /// On a TV the list can't take focus while the pill or search has it, so a
  /// category screen's own initial focus doesn't pull the D-pad off the pill
  /// while categories are being browsed.
  bool _topBarFocused = PlatformDetection.useLeanbackUi;

  bool get _tv => PlatformDetection.useLeanbackUi;
  bool get _phone => PlatformDetection.useMobileUi;

  /// Turns Kids Mode off once the PIN checks out. The PIN is the whole
  /// boundary, so a missing one leaves the mode on rather than opening it up.
  Future<void> _exitKidsMode(BuildContext context) async {
    final prefs = GetIt.instance<UserPreferences>();
    final userId = GetIt.instance<SessionRepository>().activeUserId ?? '';
    final pin = PinCodeUtil.kidsMode(GetIt.instance<PreferenceStore>(), userId);

    if (pin.isPinEnabled) {
      final verified = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.verify,
        onVerify: pin.verifyPin,
        onFailedAttempt: pin.registerFailedAttempt,
        lockoutRemaining: () => pin.lockoutRemaining,
      );
      if (!verified) return;
    }

    await prefs.set(UserPreferences.kidsModeEnabled, false);
    // The PIN belonged to this stretch of the mode. Clearing it means the next
    // time Kids Mode goes on, someone picks a code for it rather than a
    // forgotten one still quietly being the way out.
    await pin.removePin();
  }

  void _closeSettingsPanel() {
    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    SettingsPanel.backHandlers.add(_handleBack);
    _searchController.addListener(_onSearchChanged);
    _pillFocus.addListener(_onPillFocusChanged);
    if (PlatformDetection.useDesktopUi) {
      // Attached to the node so it runs before the text field consumes the
      // key. Down leaves the field for the list, left and right stay caret
      // moves.
      _searchFieldFocus.onKeyEvent = _onDesktopSearchKey;
    }
    if (!_phone) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _pillFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    SettingsPanel.backHandlers.remove(_handleBack);
    _preview.dispose();
    _listScope.dispose();
    _pillFocus.dispose();
    for (final node in _chipFocus.values) {
      node.dispose();
    }
    _searchController.dispose();
    _searchFieldFocus.dispose();
    super.dispose();
  }

  /// Back leaves the scene chips for the setting they were reached from, then
  /// pops the list column, then (on a TV or desktop) returns to the category
  /// pill, and only then lets the panel close.
  bool _handleBack() {
    if (_chipFocus.values.any((node) => node.hasFocus)) {
      _leaveChips();
      return true;
    }
    final navigator = _listNavKey.currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
      return true;
    }
    if (!_phone && !_pillFocus.hasFocus) {
      _pillFocus.requestFocus();
      return true;
    }
    return false;
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query == _query) return;
    setState(() => _query = query);
    if (_phone) return;
    // If the focused result just filtered away, fall back to the field so the
    // d-pad is never stranded on a dead node. Skipped while the TV keyboard
    // is up so it cannot pull key events away from the keyboard grid.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (CustomTVTextField.isKeyboardVisibleNotifier.value) return;
      final primary = FocusManager.instance.primaryFocus;
      if (primary == null || primary.context == null) {
        _searchFieldFocus.requestFocus();
      }
    });
  }

  KeyEventResult _onDesktopSearchKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isDownKey) {
      _enterList();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onTvSearchKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey.isDownKey) {
      _enterList();
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isLeftKey) {
      _pillFocus.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  /// Up past the top of a settings page climbs to the pill, and Right past a
  /// setting's own controls crosses to the preview's scene chips. Pickers
  /// open over the list keep their own keys.
  KeyEventResult _onListKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final up = event.logicalKey.isUpKey;
    // Only a fresh press crosses, so holding Right along a row stops at its
    // end instead of running on into the chips.
    final right = event.logicalKey.isRightKey && event is KeyDownEvent;
    if (!up && !right) return KeyEventResult.ignored;
    final primary = FocusManager.instance.primaryFocus;
    final primaryContext = primary?.context;
    if (primary == null || primaryContext == null) {
      return KeyEventResult.ignored;
    }
    if (ModalRoute.of(primaryContext) is! PageRoute) {
      return KeyEventResult.ignored;
    }
    if (primary.focusInDirection(
      up ? TraversalDirection.up : TraversalDirection.right,
    )) {
      return KeyEventResult.handled;
    }
    if (up) {
      _pillFocus.requestFocus();
    } else {
      _chipsReturnFocus = primary;
      _chipFocus[_preview.scene]!.requestFocus();
    }
    return KeyEventResult.handled;
  }

  /// Left and Right walk the chips, Left off the first one returns to the
  /// setting they were reached from and Up climbs to the category pill.
  KeyEventResult _onChipKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final scenes = settingsPreviewScenes;
    final at = scenes.indexWhere((scene) => _chipFocus[scene]!.hasFocus);
    if (at < 0) return KeyEventResult.ignored;
    final key = event.logicalKey;
    if (key.isLeftKey) {
      if (at == 0) {
        _leaveChips();
      } else {
        _chipFocus[scenes[at - 1]]!.requestFocus();
      }
    } else if (key.isRightKey) {
      if (at < scenes.length - 1) _chipFocus[scenes[at + 1]]!.requestFocus();
    } else if (key.isUpKey) {
      _pillFocus.requestFocus();
    } else if (!key.isDownKey) {
      return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
  }

  void _leaveChips() {
    final back = _chipsReturnFocus;
    if (back != null && back.context?.mounted == true) {
      back.requestFocus();
    } else {
      _enterList();
    }
  }

  /// The inspector speaks for the category while the pill has focus, since
  /// nothing else on screen says what the category holds.
  void _onPillFocusChanged() {
    if (_pillFocus.hasFocus && _categoryIndex < _categories.length) {
      _describeCategory(_categories[_categoryIndex]);
    }
  }

  void _enterList() {
    if (_tv && _topBarFocused) setState(() => _topBarFocused = false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _listScope.requestFocus();
      // A page that hasn't been focused yet has nothing to restore, so step
      // onto its first tile.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final primary = FocusManager.instance.primaryFocus;
        if (primary is FocusScopeNode && _listScope.hasFocus) {
          primary.nextFocus();
        }
      });
    });
  }

  void _selectCategory(int index) {
    if (index < 0 || index >= _categories.length) return;
    if (index == _categoryIndex && _shownCategory == _categories[index].title) {
      return;
    }
    final keepPill = _pillFocus.hasFocus;
    setState(() => _categoryIndex = index);
    _showCategory(_categories[index]);
    if (keepPill) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _pillFocus.requestFocus();
      });
    }
  }

  void _showCategory(_SettingsCategory category) {
    _describeCategory(category);
    _shownCategory = category.title;
    final screen = category.screen();
    _listNavKey.currentState?.pushAndRemoveUntil(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) =>
            SettingsPreviewPath(path: [category.title], child: screen),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
      (_) => false,
    );
  }

  /// The inspector speaks for the category until a setting takes focus.
  void _describeCategory(_SettingsCategory category) {
    _preview.focus(
      SettingsPreviewEntry(title: category.title, description: category.subtitle),
    );
  }

  List<_SettingsCategory> _buildCategories(
    AppLocalizations l10n, {
    required bool kidsMode,
    required bool showAdmin,
  }) {
    // Kids Mode leaves one entry standing. Hiding settings outright would
    // leave no way back, and a hidden gesture is worse than an obvious tile.
    if (kidsMode) {
      return [
        _SettingsCategory(
          l10n.kidsMode,
          l10n.kidsModeExitSubtitle,
          () => _SettingsEntryListScreen(
            title: l10n.kidsMode,
            entries: [
              _PanelEntry(
                icon: Icons.lock_open,
                title: l10n.kidsModeExit,
                subtitle: l10n.kidsModeExitSubtitle,
                onTap: () => unawaited(_exitKidsMode(context)),
              ),
            ],
          ),
        ),
      ];
    }
    return [
      if (showAdmin)
        _SettingsCategory(
          l10n.administration,
          l10n.settingsAdministrationSubtitle,
          () => _SettingsEntryListScreen(
            title: l10n.administration,
            entries: [
              _PanelEntry(
                icon: Icons.admin_panel_settings,
                title: l10n.administration,
                subtitle: l10n.settingsAdministrationSubtitle,
                onTap: () {
                  _closeSettingsPanel();
                  context.navigateTopLevel(Destinations.admin);
                },
              ),
            ],
          ),
        ),
      _SettingsCategory(
        l10n.account,
        l10n.settingsAccountSubtitle,
        () => const _AccountScreen(),
      ),
      _SettingsCategory(
        l10n.general,
        l10n.settingsGeneralSubtitle,
        () => const _GeneralScreen(),
      ),
      _SettingsCategory(
        l10n.appearance,
        l10n.settingsAppearanceSubtitle,
        () => const _AppearanceScreen(),
      ),
      _SettingsCategory(
        l10n.playback,
        l10n.settingsPlaybackSubtitle,
        () => const _PlaybackCategoryScreen(),
      ),
      // The image cache lives here, so the entry stays on every native
      // platform. The download sections inside gate themselves.
      if (!PlatformDetection.isWeb)
        _SettingsCategory(
          l10n.storage,
          l10n.settingsStorageSubtitle,
          () => const DownloadSettingsScreen(),
        ),
      // Seerr and achievements both come from the Moonfin plugin. With
      // neither on offer (only Silo signed in) the screen would be empty.
      if (_integrationsOffered)
        _SettingsCategory(
          l10n.integrations,
          seerrBrand(l10n.settingsServicesSubtitle),
          () => const _ServicesScreen(),
        ),
      _SettingsCategory(
        l10n.aboutTitle,
        l10n.settingsAboutSubtitle,
        () => const _AboutCategoryScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final kidsMode = ref.watch(kidsModeProvider);
    // Not for a server Moonfin can't administer (Silo has its own web app).
    final showAdmin =
        !kidsMode &&
        !PlatformDetection.isTV &&
        ref.watch(isAdminProvider) &&
        adminServerSupported() &&
        activeServerSupports((f) => f.supportsAdmin);

    final previous = _shownCategory;
    _categories = _buildCategories(
      l10n,
      kidsMode: kidsMode,
      showAdmin: showAdmin,
    );
    // Keep the open category when the set changes around it, and swap the
    // page when the category itself went away (Kids Mode turning on or off).
    final kept = previous == null
        ? -1
        : _categories.indexWhere((c) => c.title == previous);
    if (kept >= 0) {
      _categoryIndex = kept;
    } else {
      _categoryIndex = _categoryIndex.clamp(0, _categories.length - 1);
      if (previous != null) {
        final category = _categories[_categoryIndex];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _showCategory(category);
        });
      }
    }

    final searching = _query.isNotEmpty && !kidsMode;
    final list = _buildListColumn(context, l10n, showAdmin, searching);
    // The strip keeps a fixed height, so its labels stop growing at the scale
    // that still fits it. It measures its labels once, so a new scale gets a
    // fresh strip that measures them again.
    final pill = MediaQuery.withClampedTextScaling(
      maxScaleFactor: _pillMaxTextScale,
      child: SlidingPillTabs(
        key: ValueKey(MediaQuery.textScalerOf(context)),
        labels: [for (final category in _categories) category.title],
        selectedIndex: _categoryIndex,
        onChanged: _selectCategory,
        focusNode: _pillFocus,
        alignment: _phone ? Alignment.centerLeft : Alignment.center,
        onVerticalNavigation: (isUp) {
          if (isUp || _phone) return false;
          _enterList();
          return true;
        },
        onExitRight: () => _searchFieldFocus.requestFocus(),
      ),
    );
    final search = _SettingsSearchField(
      controller: _searchController,
      focusNode: _searchFieldFocus,
      tvFieldKey: _searchTvFieldKey,
      hint: l10n.settingsSearchHint,
      onClear: _searchController.clear,
    );

    return SettingsPreviewScope(
      controller: _preview,
      child: _phone
          ? _buildPhone(context, l10n, pill, search, list, searching)
          : _buildWide(context, l10n, pill, search, list),
    );
  }

  Widget _buildListColumn(
    BuildContext context,
    AppLocalizations l10n,
    bool showAdmin,
    bool searching,
  ) {
    Widget body = Stack(
      children: [
        Offstage(
          offstage: searching,
          child: TickerMode(
            enabled: !searching,
            child: Navigator(
              key: _listNavKey,
              onGenerateRoute: (_) {
                final category = _categories[_categoryIndex];
                _shownCategory = category.title;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && _preview.focused == null) {
                    _describeCategory(category);
                  }
                });
                return MaterialPageRoute<void>(
                  builder: (_) => SettingsPreviewPath(
                    path: [category.title],
                    child: category.screen(),
                  ),
                );
              },
            ),
          ),
        ),
        if (searching)
          Positioned.fill(child: _buildSearchResults(context, l10n, showAdmin)),
      ],
    );
    body = FocusScope(node: _listScope, child: body);
    if (_tv) {
      body = ExcludeFocus(
        excluding: _topBarFocused,
        child: Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: _onListKey,
          child: body,
        ),
      );
    }
    return body;
  }

  Widget _buildWide(
    BuildContext context,
    AppLocalizations l10n,
    Widget pill,
    Widget search,
    Widget list,
  ) {
    final topBar = Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (_tv && focused != _topBarFocused) {
          setState(() => _topBarFocused = focused);
        }
      },
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Text(
              l10n.settings,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(child: Center(child: pill)),
            const SizedBox(width: 16),
            SizedBox(
              width: 230,
              child: _tv
                  ? Focus(
                      canRequestFocus: false,
                      skipTraversal: true,
                      onKeyEvent: _onTvSearchKey,
                      child: search,
                    )
                  : search,
            ),
          ],
        ),
      ),
    );

    return Material(
      color: AppColorScheme.background.withValues(alpha: 0.96),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 20, 32, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              topBar,
              const SizedBox(height: 18),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 440,
                      child: ClipRRect(
                        borderRadius: AppRadius.circular(20),
                        child: ColoredBox(
                          color: AppColorScheme.surface,
                          child: list,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Focus(
                              canRequestFocus: false,
                              skipTraversal: true,
                              onKeyEvent: _onChipKey,
                              child: SettingsLivePreview(
                                chipFocus: _tv ? _chipFocus : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // A fixed height, so the preview above doesn't
                          // resize as descriptions get longer or shorter.
                          Container(
                            height:
                                _inspectorFixedHeight +
                                MediaQuery.textScalerOf(
                                  context,
                                ).scale(_inspectorTextHeight),
                            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                            decoration: BoxDecoration(
                              color: AppColorScheme.surface,
                              borderRadius: AppRadius.circular(18),
                            ),
                            child: const SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: SettingsPreviewInspector(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhone(
    BuildContext context,
    AppLocalizations l10n,
    Widget pill,
    Widget search,
    Widget list,
    bool searching,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _closeSettingsPanel,
          icon: const Icon(Icons.close),
        ),
        automaticallyImplyLeading: false,
        title: Text(l10n.settings),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(16, 4, 16, 8), child: search),
          if (_categories.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: pill,
            ),
          if (!searching)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: _PhoneLivePreview(),
            ),
          Expanded(child: list),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    AppLocalizations l10n,
    bool showAdmin,
  ) {
    // Set by the result being opened, so its screen keeps its real place in
    // Settings rather than the category it was searched from.
    List<String>? openingPath;
    final index = _buildSettingsSearchIndex(
      l10n: l10n,
      showAdmin: showAdmin,
      showThemeEditor: _showThemeEditorEntry,
      push: (screen) {
        final navigatorContext = _listNavKey.currentContext;
        _searchController.clear();
        if (navigatorContext == null) return;
        unawaited(
          navigatorContext.pushSettingsScreen(
            screen,
            returnFocus: _phone ? null : _pillFocus,
            previewPath: openingPath,
          ),
        );
      },
      openAdmin: () {
        _closeSettingsPanel();
        context.navigateTopLevel(Destinations.admin);
      },
      openThemeEditor: () => unawaited(_openThemeEditor(context)),
    );
    final results = _filterSettingsIndex(index, _query);
    if (results.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.noResultsForQuery(_query)),
        ),
      );
    }
    return ListView(
      children: [
        adaptiveListSection(
          children: [
            for (final result in results)
              _TvSettingsListTile(
                key: ValueKey(result.id),
                leading: Icon(result.icon),
                title: Text(result.title),
                subtitle: result.subtitle.isEmpty
                    ? null
                    : Text(result.subtitle),
                onTap: () {
                  if (_phone) {
                    _searchFieldFocus.unfocus();
                  }
                  openingPath = result.path;
                  result.onOpen();
                },
              ),
          ],
        ),
      ],
    );
  }
}

/// The phone's preview strip: the scene chips, the mock screen at the phone's
/// own proportions, and the touched setting spelled out beside it.
class _PhoneLivePreview extends StatelessWidget {
  const _PhoneLivePreview();

  @override
  Widget build(BuildContext context) {
    final controller = context
        .dependOnInheritedWidgetOfExactType<SettingsPreviewScope>()
        ?.notifier;
    if (controller == null) return const SizedBox.shrink();
    final landscape = controller.scene == SettingsPreviewScene.player;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsPreviewSceneChips(controller: controller),
        const SizedBox(height: 10),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: landscape
              ? const SizedBox(
                  height: 168,
                  child: Center(child: SettingsLivePreview(showHeader: false)),
                )
              : SizedBox(
                  height: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SettingsLivePreview(showHeader: false),
                      SizedBox(width: 14),
                      Expanded(
                        child: SingleChildScrollView(
                          child: SettingsPreviewInspector(),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
