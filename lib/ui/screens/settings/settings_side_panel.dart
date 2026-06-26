import 'dart:async';

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
import '../../../di/providers.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../platform/web_runtime_config.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/language_codes.dart';
import '../../../util/locale_names.dart';
import '../../../util/overlay_color_palette.dart';
import '../../../util/platform_detection.dart';
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
import '../../../preference/seerr_preferences.dart';
import '../../navigation/destinations.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/support_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../home/home_view_model.dart';
import 'home_screen_sections_integration_screen.dart';
import 'appearance_theme_screen.dart';
import 'diagnostics_settings_screen.dart';
import 'saved_themes_screen.dart';
import 'theme_store_screen.dart';
import 'home_sections_screen.dart';
import 'home_row_toggles_screen.dart';
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
import 'subtitle_settings_screen.dart';
import '../syncplay/syncplay_screen.dart';

part 'panel/settings_panel_infra.dart';
part 'panel/authentication_category_screen.dart';
part 'panel/customization_category_screen.dart';
part 'panel/general_style_screen.dart';
part 'panel/navigation_category_screen.dart';
part 'panel/home_screen_category_screen.dart';
part 'panel/libraries_category_screen.dart';
part 'panel/plugin_category_screen.dart';
part 'panel/seasonal_effects_screen.dart';
part 'panel/integrations_screen.dart';
part 'panel/plugin_screen.dart';
part 'panel/metadata_ratings_screen.dart';
part 'panel/offline_downloads_screen.dart';
part 'panel/about_category_screen.dart';
part 'panel/licenses_screen.dart';
part 'panel/playback_category_screen.dart';
part 'panel/video_playback_screen.dart';
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
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    super.dispose();
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
        icon: Icons.featured_play_list,
        title: l10n.settingsDynamicContent,
        subtitle: l10n.settingsDynamicContentSubtitle,
        onTap: () => context.pushSettingsScreen(const _PluginCategoryScreen()),
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
      body: ListView(
        children: [for (final entry in entries) _PanelEntryTile(entry: entry)],
      ),
    );
  }
}
