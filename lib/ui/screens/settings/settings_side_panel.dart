import 'dart:async';
import 'dart:convert';

import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart' show CupertinoSlider;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_core/server_core.dart' hide ImageType;
import 'package:url_launcher/url_launcher.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../data/services/custom_external_lists_service.dart';
import '../../../data/models/media_segment.dart';
import '../../../data/utils/media_segment_actions.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../di/providers.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/insecure_certificates.dart';
import '../../../platform/web_runtime_config.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/gamepad/gamepad_navigation_scope.dart';
import '../../../util/language_codes.dart';
import '../../../util/locale_names.dart';
import '../../util/home_row_title_localizer.dart';
import '../../../util/overlay_color_palette.dart';
import '../../../util/game_cores.dart';
import '../../../util/platform_detection.dart';
import '../../../util/playback_time_label.dart';
import '../../../util/tv_image_cache_stub.dart'
    if (dart.library.io) '../../../util/tv_image_cache_io.dart';
import '../../../util/app_distribution.dart';
import '../../widgets/app_update_dialog.dart';

import '../../../auth/store/authentication_preferences.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/audio_capability_profile.dart';
import '../../../playback/audio_capability_probe.dart';
import '../../../playback/external_player_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/seerr_row_config.dart';
import '../../navigation/destinations.dart';
import '../setup/setup_wizard_gate.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/playback/playback_time_row.dart';
import '../../widgets/playback/player_loading_overlay.dart';
import '../../widgets/playback/loading_animation_widget.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/button_layout_list.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/support_dialog.dart';
import '../../widgets/trickplay_settings_preview.dart';
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
import 'downloaded_games_screen.dart';
import 'library_settings_screen.dart';
import 'media_bar_settings_screen.dart';
import 'screensaver_settings_screen.dart';
import 'local_previews_settings_screen.dart';
import 'parental_settings_screen.dart';
import 'pin_code_settings_screen.dart';
import 'plugin_settings_screen.dart';
import 'ratings_config_screen.dart';
import 'seerr_config_screen.dart';
import 'settings_app_bar.dart';
import 'subtitle_customization_screen.dart';
import 'subtitle_settings_screen.dart';
import '../detail/detail_buttons.dart';
import '../playback/osd_buttons.dart';
import '../syncplay/syncplay_screen.dart';

part 'panel/settings_panel_infra.dart';
part 'panel/settings_search_field.dart';
part 'panel/settings_search_index.dart';
part 'panel/authentication_category_screen.dart';
part 'panel/customization_category_screen.dart';
part 'panel/general_style_screen.dart';
part 'panel/details_screen_settings_screen.dart';
part 'panel/navigation_category_screen.dart';
part 'panel/home_screen_category_screen.dart';
part 'panel/libraries_category_screen.dart';
part 'panel/seasonal_effects_screen.dart';
part 'panel/theme_music_screen.dart';
part 'panel/loading_animation_screen.dart';
part 'panel/integrations_screen.dart';
part 'panel/external_lists_screen.dart';
part 'panel/plugin_screen.dart';
part 'panel/metadata_ratings_screen.dart';
part 'panel/about_category_screen.dart';
part 'panel/licenses_screen.dart';
part 'panel/playback_category_screen.dart';
part 'panel/video_playback_screen.dart';
part 'panel/playback_time_layout_screen.dart';
part 'panel/osd_buttons_screen.dart';
part 'panel/detail_buttons_screen.dart';
part 'panel/audio_preferences_screen.dart';
part 'panel/automation_queue_screen.dart';
part 'panel/advanced_options_screen.dart';
part 'panel/syncplay_settings_screen.dart';
part 'panel/settings_panel_tiles.dart';

class SettingsSidePanel extends ConsumerStatefulWidget {
  const SettingsSidePanel({super.key});

  @override
  ConsumerState<SettingsSidePanel> createState() => _SettingsSidePanelState();
}

class _SettingsSidePanelState extends ConsumerState<SettingsSidePanel> {
  final _firstFocusNode = FocusNode(debugLabel: 'TvSettingsPanelFirstItem');
  final _searchController = TextEditingController();
  final _searchFieldFocus = FocusNode(debugLabel: 'SettingsSearchField');
  final _searchTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  String _query = '';

  bool get _showThemeEditorEntry =>
      PlatformDetection.isWeb && webRuntimeConfig.pluginMode;

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

  Future<void> _openThemeEditor() async {
    final uri = _resolveThemeEditorUri();
    final ok = await launchUrl(
      uri,
      mode: PlatformDetection.isWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );

    if (!ok && mounted) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminCouldNotOpenUrl('$uri'))),
      );
    }
  }

  void _closeSettingsPanel() {
    final rootNavigator = Navigator.of(context, rootNavigator: true);
    if (rootNavigator.canPop()) {
      rootNavigator.pop();
    }
  }

  void _requestInitialFocus({int attempt = 0}) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final focusScope = FocusScope.of(context);
      if (_firstFocusNode.context == null && attempt < 10) {
        Future<void>.delayed(const Duration(milliseconds: 16), () {
          _requestInitialFocus(attempt: attempt + 1);
        });
        return;
      }
      _firstFocusNode.requestFocus();
      focusScope.requestFocus(_firstFocusNode);
    });
  }

  @override
  void initState() {
    super.initState();
    if (!PlatformDetection.useMobileUi) {
      _requestInitialFocus();
    }
    _searchController.addListener(_onSearchChanged);
    if (PlatformDetection.useDesktopUi) {
      // Attached to the node so it runs before the text field consumes the
      // key. Down leaves the field for the list, left and right stay caret
      // moves.
      _searchFieldFocus.onKeyEvent = _onDesktopSearchKey;
    }
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _searchController.dispose();
    _searchFieldFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query == _query) return;
    setState(() => _query = query);
    if (PlatformDetection.useMobileUi) return;
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
      return node.focusInDirection(TraversalDirection.down)
          ? KeyEventResult.handled
          : KeyEventResult.ignored;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final showAdmin = !PlatformDetection.isTV && ref.watch(isAdminProvider);
    final enablePanelAutofocus = !PlatformDetection.useMobileUi;
    final entries = <_PanelEntry>[
      if (showAdmin)
        _PanelEntry(
          icon: Icons.admin_panel_settings,
          title: l10n.administration,
          subtitle: l10n.settingsAdministrationSubtitle,
          focusNode: enablePanelAutofocus ? _firstFocusNode : null,
          onTap: () {
            _closeSettingsPanel();
            context.navigateTopLevel(Destinations.admin);
          },
        ),
      _PanelEntry(
        icon: Icons.lock,
        title: l10n.settingsAccountSecurity,
        subtitle: l10n.settingsAccountSecuritySubtitle,
        focusNode: (!showAdmin && enablePanelAutofocus)
            ? _firstFocusNode
            : null,
        onTap: () =>
            context.pushSettingsScreen(const _AuthenticationCategoryScreen()),
      ),
      _PanelEntry(
        icon: Icons.palette,
        title: l10n.settingsPersonalization,
        subtitle: l10n.settingsPersonalizationSubtitle,
        onTap: () =>
            context.pushSettingsScreen(const _CustomizationCategoryScreen()),
      ),
      _PanelEntry(
        icon: Icons.play_circle,
        title: l10n.settingsPlaybackSyncplay,
        subtitle: l10n.settingsPlaybackSyncplaySubtitle,
        onTap: () =>
            context.pushSettingsScreen(const _PlaybackCategoryScreen()),
      ),
      _PanelEntry(
        icon: Icons.hub,
        title: l10n.integrations,
        subtitle: l10n.settingsIntegrationsSubtitle,
        onTap: () => context.pushSettingsScreen(const _IntegrationsScreen()),
      ),
      if (_showThemeEditorEntry)
        _PanelEntry(
          icon: Icons.brush,
          title: l10n.themeEditor,
          subtitle: l10n.themeEditorSubtitle,
          onTap: () => unawaited(_openThemeEditor()),
        ),
      _PanelEntry(
        icon: Icons.info_outline,
        title: l10n.aboutTitle,
        subtitle: l10n.settingsAboutSubtitle,
        onTap: () => context.pushSettingsScreen(const _AboutCategoryScreen()),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: PlatformDetection.isTV
            ? null
            : IconButton(
                onPressed: _closeSettingsPanel,
                icon: const Icon(Icons.close),
              ),
        automaticallyImplyLeading: false,
        title: Text(l10n.settings),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: _SettingsSearchField(
              controller: _searchController,
              focusNode: _searchFieldFocus,
              tvFieldKey: _searchTvFieldKey,
              hint: l10n.settingsSearchHint,
              onClear: _searchController.clear,
            ),
          ),
          Expanded(
            child: _query.isEmpty
                ? ListView(
                    children: [
                      adaptiveListSection(
                        children: [
                          for (final entry in entries)
                            _PanelEntryTile(entry: entry),
                        ],
                      ),
                    ],
                  )
                : _buildSearchResults(context, l10n, showAdmin),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    AppLocalizations l10n,
    bool showAdmin,
  ) {
    final index = _buildSettingsSearchIndex(
      l10n: l10n,
      showAdmin: showAdmin,
      showThemeEditor: _showThemeEditorEntry,
      push: (screen) => context.pushSettingsScreen(screen),
      openAdmin: () {
        _closeSettingsPanel();
        context.navigateTopLevel(Destinations.admin);
      },
      openThemeEditor: () => unawaited(_openThemeEditor()),
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
                  if (PlatformDetection.useMobileUi) {
                    _searchFieldFocus.unfocus();
                  }
                  result.onOpen();
                },
              ),
          ],
        ),
      ],
    );
  }
}
