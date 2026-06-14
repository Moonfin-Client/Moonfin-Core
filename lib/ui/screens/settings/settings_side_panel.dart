import 'dart:async';

import 'package:file_picker/file_picker.dart';
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
import 'kefin_tweaks_integration_screen.dart';
import 'appearance_theme_screen.dart';
import 'diagnostics_settings_screen.dart';
import 'saved_themes_screen.dart';
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.adminCouldNotOpenUrl('$uri'))));
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

class _PanelEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  const _PanelEntry({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.focusNode,
  });
}

class _PanelEntryTile extends StatelessWidget {
  final _PanelEntry entry;

  const _PanelEntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return _TvSettingsListTile(
      focusNode: entry.focusNode,
      autofocus: entry.focusNode != null,
      leading: Icon(entry.icon),
      title: Text(entry.title),
      subtitle: Text(entry.subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: entry.onTap,
    );
  }
}

class _TvSettingsListTile extends StatefulWidget {
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _TvSettingsListTile({
    this.focusNode,
    this.autofocus = false,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  State<_TvSettingsListTile> createState() => _TvSettingsListTileState();
}

class _TvSettingsListTileState extends State<_TvSettingsListTile> {
  late final FocusNode _focusNode;
  late final bool _ownsFocusNode;

  void _invokeTap() {
    final onTap = widget.onTap;
    if (onTap != null) onTap();
  }

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
      _ownsFocusNode = false;
    } else {
      _focusNode = FocusNode();
      _ownsFocusNode = true;
    }
  }

  @override
  void dispose() {
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resolvedTrailing =
        widget.trailing ??
        (widget.onTap != null ? const Icon(Icons.chevron_right) : null);
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          _invokeTap();
        }
        return KeyEventResult.handled;
      },
      child: TvFocusHighlight(
        builder: (context, focused) => ListTile(
          focusNode: _focusNode,
          autofocus: widget.autofocus,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          leading: widget.leading != null
              ? buildSettingsLeadingIconShell(
                  context,
                  icon: widget.leading!,
                  focused: focused,
                  iconColor: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : AppColorScheme.onSurface.withValues(alpha: 0.78),
                )
              : null,
          title: DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: focused
                  ? AppColors.black.withValues(alpha: 0.87)
                  : AppColorScheme.onSurface,
            ),
            child: widget.title,
          ),
          subtitle: widget.subtitle != null
              ? DefaultTextStyle.merge(
                  style: TextStyle(
                    fontSize: 12,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  child: widget.subtitle!,
                )
              : null,
          trailing: resolvedTrailing != null
              ? IconTheme(
                  data: IconThemeData(
                    size: 20,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  child: resolvedTrailing,
                )
              : null,
          onTap: _invokeTap,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

String _formatCamelCaseLabel(String camelCase) {
  final buf = StringBuffer();
  for (var i = 0; i < camelCase.length; i++) {
    final c = camelCase[i];
    if (i == 0) {
      buf.write(c.toUpperCase());
    } else if (c == c.toUpperCase() && c != c.toLowerCase()) {
      buf.write(' ');
      buf.write(c);
    } else {
      buf.write(c);
    }
  }
  return buf.toString();
}

void _ensureSettingsTileVisible(
  BuildContext context, {
  double alignment = 0.9,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    Scrollable.ensureVisible(
      context,
      alignment: alignment,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
  });
}

class _AuthenticationCategoryScreen extends StatelessWidget {
  const _AuthenticationCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hideWebOnlyAuthControls = PlatformDetection.isWeb;

    final Map<String, String> langOptions = {
      'system': l10n.systemLanguageDefault,
    };
    final sortedLocales = List<Locale>.from(AppLocalizations.supportedLocales);
    sortedLocales.sort((a, b) {
      final nameA = kLocaleDisplayNames[a.toLanguageTag()] ?? a.toLanguageTag();
      final nameB = kLocaleDisplayNames[b.toLanguageTag()] ?? b.toLanguageTag();
      return nameA.toLowerCase().compareTo(nameB.toLowerCase());
    });
    for (final locale in sortedLocales) {
      final tag = locale.toLanguageTag();
      langOptions[tag] = kLocaleDisplayNames[tag] ?? locale.toString();
    }

    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsAccountSecurity)),
      body: ListView(
        children: [
          _SectionHeader(l10n.settingsAuthenticationSection),
          EnumPreferenceTile<UserSelectBehavior>(
            preference: UserPreferences.autoLoginUserBehavior,
            title: l10n.autoLogin,
            icon: Icons.person,
            labelOf: (v) {
              if (v == UserSelectBehavior.currentUser) {
                final session = GetIt.instance<SessionRepository>();
                // If I'm the auto-login user, just say "Current User"
                // If someone else is, show their name so it's clear
                if (session.activeUserIsAutoLoginTarget) return l10n.currentUser;
                return session.autoLoginTargetDisplayName() ?? l10n.currentUser;
              }
              return switch (v) {
                UserSelectBehavior.disabled => l10n.disabled,
                UserSelectBehavior.lastUser => l10n.lastUser,
                _ => l10n.currentUser,
              };
            },
            dialogLabelOf: (v) => switch (v) {
              UserSelectBehavior.disabled => l10n.disabled,
              UserSelectBehavior.lastUser => l10n.lastUser,
              UserSelectBehavior.currentUser => l10n.currentUser,
            },
            onChanged: () {
              final behavior = GetIt.instance<PreferenceStore>()
                  .get(UserPreferences.autoLoginUserBehavior);
              GetIt.instance<SessionRepository>()
                  .applyAutoLoginForBehavior(behavior);
            },
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.alwaysAuthenticate,
            title: l10n.alwaysAuthenticate,
            subtitle: l10n.requirePasswordWithToken,
            icon: Icons.lock,
          ),
          _TvSettingsListTile(
            autofocus: true,
            leading: const Icon(Icons.pin),
            title: Text(l10n.pinCode),
            subtitle: Text(l10n.requirePinToAccess),
            onTap: () =>
                context.pushSettingsScreen(const PinCodeSettingsScreen()),
          ),
          _SectionHeader(l10n.accountPreferences),
          StringPickerPreferenceTile(
            preference: UserPreferences.languageOverride,
            title: l10n.interfaceLanguage,
            icon: Icons.language,
            options: langOptions,
          ),
          if (!hideWebOnlyAuthControls)
            EnumPreferenceTile<UserSortBy>(
              preference: AuthenticationPreferences.sortBy,
              title: l10n.settingsSortServersBy,
              icon: Icons.swap_horiz,
              labelOf: (v) => switch (v) {
                UserSortBy.lastUsed => l10n.settingsLastUsed,
                UserSortBy.alphabetical => l10n.settingsAlphabetical,
              },
            ),
          _SectionHeader(l10n.settingsPrivacyAndSafetySection),
          _TvSettingsListTile(
            leading: const Icon(Icons.family_restroom),
            title: Text(l10n.settingsBlockedRatings),
            subtitle: Text(l10n.contentRatingRestrictions),
            onTap: () =>
                context.pushSettingsScreen(const ParentalSettingsScreen()),
          ),
          if (!hideWebOnlyAuthControls)
            SwitchPreferenceTile(
              preference: UserPreferences.confirmExit,
              title: l10n.confirmExit,
              subtitle: l10n.showConfirmationBeforeExiting,
              icon: Icons.exit_to_app,
            ),
        ],
      ),
    );
  }
}

class _CustomizationCategoryScreen extends StatelessWidget {
  const _CustomizationCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.settingsPersonalization),
        ),
        body: ListView(
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.style),
              title: Text(l10n.settingsGeneralStyle),
              subtitle: Text(l10n.settingsGeneralStyleSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _GeneralStyleScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.view_sidebar),
              title: Text(l10n.navigation),
              subtitle: Text(l10n.navbarStyleToolbarAppearance),
              onTap: () =>
                  context.pushSettingsScreen(const _NavigationCategoryScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.homeScreen),
              subtitle: Text(l10n.settingsHomePageSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _HomeScreenCategoryScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.video_library),
              title: Text(l10n.libraries),
              subtitle: Text(l10n.settingsLibrariesSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _LibrariesCategoryScreen()),
            ),
            if (PlatformDetection.isTV)
              _TvSettingsListTile(
                leading: const Icon(Icons.wallpaper),
                title: Text(l10n.screensaver),
                subtitle: Text(l10n.enableBuiltInScreensaver),
                onTap: () => context.pushSettingsScreen(
                  const ScreensaverSettingsScreen(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void _pushPersonalizationSync() {
  final syncService = GetIt.instance<PluginSyncService>();
  if (syncService.pluginAvailable) {
    syncService.pushSettings(GetIt.instance<MediaServerClient>());
  }
}

class _GeneralStyleScreen extends StatefulWidget {
  const _GeneralStyleScreen();

  @override
  State<_GeneralStyleScreen> createState() => _GeneralStyleScreenState();
}

class _GeneralStyleScreenState extends State<_GeneralStyleScreen> {
  final _generalStyleScope = FocusScopeNode(
    debugLabel: 'GeneralStyleSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _generalStyleScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = PlatformDetection.isTV ? 96.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsGeneralStyle)),
      body: FocusScope(
        node: _generalStyleScope,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.palette_outlined),
              title: Text(l10n.settingsAppearanceTheme),
              subtitle: Text(l10n.settingsAppearanceThemeSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const AppearanceThemeScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.download_outlined),
              title: Text(l10n.savedThemesTitle),
              subtitle: Text(l10n.savedThemesManageSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const SavedThemesScreen()),
            ),
            EnumPreferenceTile<AppTheme>(
              preference: UserPreferences.focusColor,
              title: l10n.focusBorderColor,
              icon: Icons.border_color,
              labelOf: (v) => _formatCamelCaseLabel(v.name),
            ),
            if (PlatformDetection.isTV)
              SwitchPreferenceTile(
                preference: UserPreferences.preferSystemImeKeyboard,
                title: l10n.keyboardPreferSystemIme,
                subtitle: l10n.keyboardPreferSystemImeDescription,
                icon: Icons.keyboard_alt_outlined,
              ),
            EnumPreferenceTile<ClockBehavior>(
              preference: UserPreferences.clockBehavior,
              title: l10n.clockDisplay,
              icon: Icons.access_time,
              labelOf: (v) => switch (v) {
                ClockBehavior.always => l10n.always,
                ClockBehavior.inMenus => l10n.inMenus,
                ClockBehavior.never => l10n.never,
              },
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.use24HourClock,
              title: l10n.settingsTwentyFourHourClock,
              subtitle: l10n.settingsTwentyFourHourClockSubtitle,
              icon: Icons.schedule,
            ),
            if (!PlatformDetection.useMobileUi)
              SwitchPreferenceTile(
                preference: UserPreferences.cardFocusExpansion,
                title: l10n.focusExpansionAnimation,
                subtitle: l10n.scaleFocusedCards,
                icon: Icons.zoom_in,
              ),
            EnumPreferenceTile<DesktopUiScale>(
              preference: UserPreferences.desktopUiScale,
              title: l10n.desktopUiScale,
              icon: Icons.zoom_out_map,
              labelOf: (v) => switch (v) {
                DesktopUiScale.small => l10n.small,
                DesktopUiScale.medium => l10n.medium,
                DesktopUiScale.large => l10n.large,
                DesktopUiScale.extraLarge => l10n.extraLarge,
              },
              onChanged: _pushPersonalizationSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.backdropEnabled,
              title: l10n.backgroundBackdrops,
              subtitle: l10n.showBackdropImages,
              icon: Icons.photo,
              onChanged: _pushPersonalizationSync,
            ),
            SliderPreferenceTile(
              preference: UserPreferences.browsingBackgroundBlurAmount,
              title: l10n.browsingBackgroundBlur,
              icon: Icons.blur_circular,
              min: 0,
              max: 25,
              divisions: 25,
              labelOf: (v) => '$v',
              onChangeEnd: _pushPersonalizationSync,
            ),
            SliderPreferenceTile(
              preference: UserPreferences.detailsBackgroundBlurAmount,
              title: l10n.detailsBackgroundBlur,
              icon: Icons.blur_on,
              min: 0,
              max: 25,
              divisions: 25,
              labelOf: (v) => '$v',
              onChangeEnd: _pushPersonalizationSync,
            ),
            EnumPreferenceTile<WatchedIndicatorBehavior>(
              preference: UserPreferences.watchedIndicatorBehavior,
              title: l10n.watchedIndicators,
              icon: Icons.check_circle,
              labelOf: (v) => switch (v) {
                WatchedIndicatorBehavior.always => l10n.always,
                WatchedIndicatorBehavior.hideUnwatched => l10n.hideUnwatched,
                WatchedIndicatorBehavior.episodesOnly => l10n.episodesOnly,
                WatchedIndicatorBehavior.never => l10n.never,
              },
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.themeMusicEnabled,
              title: l10n.themeMusic,
              subtitle: l10n.playThemeMusicOnDetailPages,
              icon: Icons.music_note,
              onChanged: _pushPersonalizationSync,
            ),
            SliderPreferenceTile(
              preference: UserPreferences.themeMusicVolume,
              title: l10n.themeMusicVolume,
              icon: Icons.volume_down,
              min: 0,
              max: 100,
              divisions: 20,
              labelOf: (v) => '$v%',
              onChangeEnd: _pushPersonalizationSync,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationCategoryScreen extends StatefulWidget {
  const _NavigationCategoryScreen();

  @override
  State<_NavigationCategoryScreen> createState() =>
      _NavigationCategoryScreenState();
}

class _NavigationCategoryScreenState extends State<_NavigationCategoryScreen> {
  late final PreferenceBinding<bool> _showShuffleButtonBinding;
  late final PluginSyncService _syncService;
  bool _navbarNormalizeQueued = false;

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _syncService.addListener(_onSyncChanged);
    _showShuffleButtonBinding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.showShuffleButton,
    );
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncChanged);
    _showShuffleButtonBinding.dispose();
    super.dispose();
  }

  void _onSyncChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final seerrEnabledOnAccount = GetIt.instance<SeerrPreferences>().enabled;
    final availableNavbarPositions = NavigationLayout.availableNavbarPositions;
    final prefs = GetIt.instance<UserPreferences>();
    final currentNavbarPosition = prefs.get(UserPreferences.navbarPosition);
    if (!NavigationLayout.allowBottomNavbar &&
        currentNavbarPosition == NavbarPosition.bottom &&
        !_navbarNormalizeQueued) {
      _navbarNormalizeQueued = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navbarNormalizeQueued = false;
        if (!mounted) return;
        prefs.set(UserPreferences.navbarPosition, NavbarPosition.top);
        NavigationLayout.positionNotifier.value = NavbarPosition.top;
        _pushPersonalizationSync();
      });
    }
    return ValueListenableBuilder<bool>(
      valueListenable: _showShuffleButtonBinding,
      builder: (context, showShuffleButton, _) => Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.navigation)),
        body: ListView(
          children: [
            EnumPreferenceTile<NavbarPosition>(
              preference: UserPreferences.navbarPosition,
              title: l10n.navigationStyle,
              icon: Icons.view_sidebar,
              values: availableNavbarPositions,
              labelOf: (v) => switch (v) {
                NavbarPosition.top => l10n.topBar,
                NavbarPosition.left => l10n.leftSidebar,
                NavbarPosition.bottom => l10n.bottomBar,
              },
              onChanged: () {
                final pos = GetIt.instance<UserPreferences>().get(
                  UserPreferences.navbarPosition,
                );
                NavigationLayout.positionNotifier.value = pos;
                _pushPersonalizationSync();
              },
            ),
            _NavbarColorPickerTile(onChanged: _pushPersonalizationSync),
            SliderPreferenceTile(
              preference: UserPreferences.navbarOpacity,
              title: l10n.navbarOpacity,
              icon: Icons.opacity,
              min: 0,
              max: 100,
              divisions: 20,
              labelOf: (v) => '$v%',
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showShuffleButton,
              title: l10n.showShuffleButton,
              subtitle: l10n.settingsShowShuffleButtonInNavigation,
              icon: Icons.shuffle,
              onChanged: _pushPersonalizationSync,
            ),
            if (showShuffleButton)
              _ShuffleContentTypePickerTile(
                onChanged: _pushPersonalizationSync,
              ),
            SwitchPreferenceTile(
              preference: UserPreferences.showGenresButton,
              title: l10n.showGenresButton,
              subtitle: l10n.settingsShowGenresButtonInNavigation,
              icon: Icons.theater_comedy,
              onChanged: _pushPersonalizationSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showFavoritesButton,
              title: l10n.showFavoritesButton,
              subtitle: l10n.settingsShowFavoritesButtonInNavigation,
              icon: Icons.favorite,
              onChanged: _pushPersonalizationSync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showLibrariesInToolbar,
              title: l10n.showLibrariesInToolbar,
              subtitle: l10n.settingsShowLibrariesButtonInNavigation,
              icon: Icons.video_library,
              onChanged: _pushPersonalizationSync,
            ),
            if (seerrEnabledOnAccount && _syncService.seerrAvailable)
              SwitchPreferenceTile(
                preference: UserPreferences.showSeerrButton,
                title: l10n.showSeerrButton,
                subtitle: l10n.settingsShowSeerrButtonInNavigation,
                iconBuilder: (size, color) => Image.asset(
                  'assets/icons/seerr.png',
                  width: size,
                  height: size,
                ),
                onChanged: _pushPersonalizationSync,
              ),

          ],
        ),
      ),
    );
  }
}

class _HomeScreenCategoryScreen extends StatefulWidget {
  const _HomeScreenCategoryScreen();

  @override
  State<_HomeScreenCategoryScreen> createState() =>
      _HomeScreenCategoryScreenState();
}

class _HomeScreenCategoryScreenState extends State<_HomeScreenCategoryScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  String _rowsStyleLabel(AppLocalizations l10n, HomeRowsStyle style) =>
      switch (style) {
        HomeRowsStyle.v1 => l10n.homeRowsStyleClassic,
        HomeRowsStyle.v2 => l10n.homeRowsStyleModern,
      };

  void _reloadHomeRows() {
    if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
    GetIt.instance<HomeViewModel>().load(preserveExisting: true);
  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rowsStyle = _prefs.get(UserPreferences.homeRowsStyle);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.homeScreen)),
      body: ListView(
        children: [
          _SectionHeader(l10n.homeRowDisplay),
          EnumPreferenceTile<HomeRowsStyle>(
            preference: UserPreferences.homeRowsStyle,
            title: l10n.rowsType,
            description: l10n.rowsTypeDescription,
            icon: Icons.view_carousel,
            labelOf: (style) => _rowsStyleLabel(l10n, style),
            onChanged: () {
              _pushPersonalizationSync();
              _reloadHomeRows();
              if (!mounted) return;
              setState(() {});
            },
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.mergeContinueWatchingNextUp,
            title: l10n.mergeContinueWatchingAndNextUp,
            subtitle: l10n.combineBothRows,
            icon: Icons.merge_type,
            onChanged: _pushPersonalizationSync,
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.seriesThumbnailsEnabled,
            title: l10n.seriesThumbnails,
            subtitle: l10n.seriesThumbnailsDescription,
            icon: Icons.image_aspect_ratio,
            onChanged: _pushPersonalizationSync,
          ),
          if (!PlatformDetection.useMobileUi)
            SwitchPreferenceTile(
              preference: UserPreferences.fullScreenRows,
              title: l10n.fullScreenRows,
              subtitle: l10n.fullScreenRowsDescription,
              icon: Icons.image_aspect_ratio,
              onChanged: _pushPersonalizationSync,
            ),
          EnumPreferenceTile<PosterSize>(
            preference: UserPreferences.posterSize,
            title: l10n.cardSize,
            icon: Icons.photo_size_select_large,
            labelOf: (v) => switch (v) {
              PosterSize.small => l10n.small,
              PosterSize.medium => l10n.medium,
              PosterSize.large => l10n.large,
              PosterSize.extraLarge => l10n.extraLarge,
            },
            onChanged: _pushPersonalizationSync,
          ),
          if (rowsStyle == HomeRowsStyle.v1)
            SwitchPreferenceTile(
              preference: UserPreferences.homeRowInfoOverlay,
              title: l10n.homeRowInfoOverlay,
              subtitle: l10n.showTitleMetadataOnHomeRows,
              icon: Icons.info_outline,
            ),

          _SectionHeader(l10n.homeRowSections),
          _TvSettingsListTile(
            autofocus: true,
            leading: const Icon(Icons.list),
            title: Text(l10n.homeSections),
            subtitle: Text(l10n.reorderToggleHomeRows),
            onTap: () => context.pushSettingsScreen(
              const HomeSectionsScreen(showGeneralOptions: false),
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.tune),
            title: Text(l10n.homeRowToggles),
            subtitle: Text(l10n.homeRowTogglesSubtitle),
            onTap: () => context.pushSettingsScreen(
              const HomeRowTogglesScreen(),
            ),
          ),

          _SectionHeader(l10n.audio),
          SwitchPreferenceTile(
            preference: UserPreferences.themeMusicOnHomeRows,
            title: l10n.themeMusicOnHomeRows,
            subtitle: l10n.playWhenBrowsingHomeScreen,
            icon: Icons.queue_music,
            onChanged: _pushPersonalizationSync,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _LibrariesCategoryScreen extends StatelessWidget {
  const _LibrariesCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.libraries)),
      body: ListView(
        children: [
          _TvSettingsListTile(
            leading: const Icon(Icons.visibility),
            title: Text(l10n.libraryVisibility),
            subtitle: Text(l10n.settingsLibraryVisibilitySubtitle),
            onTap: () =>
                context.pushSettingsScreen(const LibraryVisibilityScreen()),
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.enableFolderView,
            title: l10n.enableFolderView,
            subtitle: l10n.showFolderBrowsingOption,
            icon: Icons.folder,
            onChanged: _pushPersonalizationSync,
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.enableMultiServerLibraries,
            title: l10n.multiServerLibraries,
            subtitle: l10n.showLibrariesFromAllServers,
            icon: Icons.dns,
            onChanged: _pushPersonalizationSync,
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.useDetailedSubHeadings,
            title: l10n.useDetailedSubHeadings,
            subtitle: l10n.useDetailedSubHeadingsDescription,
            icon: Icons.subtitles,
            onChanged: _pushPersonalizationSync,
          ),
        ],
      ),
    );
  }
}

class _PluginCategoryScreen extends StatelessWidget {
  const _PluginCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.settingsDynamicContent)),
        body: ListView(
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.featured_play_list),
              title: Text(l10n.mediaBar),
              subtitle: Text(l10n.featuredContentAppearance),
              onTap: () =>
                  context.pushSettingsScreen(const MediaBarSettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.preview),
              title: Text(l10n.localPreviews),
              subtitle: Text(l10n.localPreviewsDescription),
              onTap: () => context.pushSettingsScreen(
                const LocalPreviewsSettingsScreen(),
              ),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.auto_awesome),
              title: Text(l10n.seasonalEffects),
              subtitle: Text(l10n.seasonalEffectsDescription),
              onTap: () =>
                  context.pushSettingsScreen(const _SeasonalEffectsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeasonalEffectsScreen extends StatelessWidget {
  const _SeasonalEffectsScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.seasonalEffects)),
      body: ListView(
        children: [
          StringPickerPreferenceTile(
            preference: UserPreferences.seasonalSurprise,
            title: l10n.settingsSeasonalSurprise,
            icon: Icons.auto_awesome,
            options: {
              'none': l10n.none,
              'snow': l10n.snow,
              'fireworks': l10n.fireworks,
              'confetti': l10n.confetti,
              'leaves': l10n.fallingLeaves,
            },
          ),
        ],
      ),
    );
  }
}

class _IntegrationsScreen extends StatefulWidget {
  const _IntegrationsScreen();

  @override
  State<_IntegrationsScreen> createState() => _IntegrationsScreenState();
}

class _IntegrationsScreenState extends State<_IntegrationsScreen> {
  final _integrationsScope = FocusScopeNode(
    debugLabel: 'IntegrationsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );

  @override
  void dispose() {
    _integrationsScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.integrations)),
        body: FocusScope(
          node: _integrationsScope,
          autofocus: true,
          child: ListView(
            children: [
              _TvSettingsListTile(
                autofocus: true,
                leading: const Icon(Icons.extension),
                title: Text(l10n.pluginLabel),
                subtitle: Text(l10n.serverSyncAndPluginStatus),
                onTap: () => context.pushSettingsScreen(const _PluginScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.star),
                title: Text(l10n.settingsMetadataAndRatings),
                subtitle: Text(l10n.mdbListTmdbRatingSources),
                onTap: () =>
                    context.pushSettingsScreen(const _MetadataRatingsScreen()),
              ),
              _TvSettingsListTile(
                leading: Image.asset(
                  'assets/icons/seerr.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(l10n.seerr),
                subtitle: Text(l10n.mediaRequestIntegration),
                onTap: () =>
                    context.pushSettingsScreen(const SeerrConfigScreen()),
              ),
              _TvSettingsListTile(
                leading: Image.asset(
                  'assets/icons/hss.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(l10n.homeScreenSectionsTitle),
                subtitle: Text(l10n.homeScreenSectionsIntegrationDescription),
                onTap: () => context.pushSettingsScreen(
                  const HomeScreenSectionsIntegrationScreen(),
                ),
              ),
              _TvSettingsListTile(
                leading: Image.asset(
                  'assets/icons/kf.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(l10n.kefinTweaksTitle),
                subtitle: Text(l10n.kefinTweaksIntegrationDescription),
                onTap: () => context.pushSettingsScreen(
                  const KefinTweaksIntegrationScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PluginScreen extends StatefulWidget {
  const _PluginScreen();

  @override
  State<_PluginScreen> createState() => _PluginScreenState();
}

class _PluginScreenState extends State<_PluginScreen> {
  final _pluginScope = FocusScopeNode(
    debugLabel: 'PluginSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );
  final _scrollController = ScrollController();
  final _refreshFocusNode = FocusNode(debugLabel: 'PluginRefreshButton');

  @override
  void initState() {
    super.initState();
    _refreshFocusNode.addListener(_onRefreshFocusChange);
  }

  @override
  void dispose() {
    _refreshFocusNode.removeListener(_onRefreshFocusChange);
    _refreshFocusNode.dispose();
    _scrollController.dispose();
    _pluginScope.dispose();
    super.dispose();
  }

  void _onRefreshFocusChange() {
    if (_refreshFocusNode.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          final l10n = AppLocalizations.of(context);
          return FocusScope(
            node: _pluginScope,
            autofocus: true,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.pluginLabel),
                actions: [
                  IconButton(
                    focusNode: _refreshFocusNode,
                    autofocus: true,
                    icon: const Icon(Icons.refresh),
                    onPressed: () async {
                      if (GetIt.instance.isRegistered<MediaServerClient>()) {
                        final client = GetIt.instance<MediaServerClient>();
                        final syncService = GetIt.instance<PluginSyncService>();
                        await syncService.refreshAvailability(client);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                syncService.pluginAvailable
                                    ? l10n.pluginDetected
                                    : l10n.pluginNotDetected,
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
              body: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.only(bottom: 48),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.extension,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              l10n.settingsPluginScreenDescription,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const PluginSettingsSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MetadataRatingsScreen extends StatefulWidget {
  const _MetadataRatingsScreen();

  @override
  State<_MetadataRatingsScreen> createState() => _MetadataRatingsScreenState();
}

class _MetadataRatingsScreenState extends State<_MetadataRatingsScreen> {
  final _metadataScope = FocusScopeNode(
    debugLabel: 'MetadataRatingsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );
  final _additionalRatingsFocusNode = FocusNode(debugLabel: 'additional_ratings');

  @override
  void dispose() {
    _metadataScope.dispose();
    _additionalRatingsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          return RequestInitialFocus(
            targetNode: PlatformDetection.isTV ? _additionalRatingsFocusNode : null,
            child: Scaffold(
              appBar: buildSettingsAppBar(
                context,
                Text(l10n.settingsMetadataAndRatings),
              ),
              body: FocusScope(
                node: _metadataScope,
                autofocus: true,
                child: ListView(
                  children: [
                    SwitchPreferenceTile(
                      focusNode: _additionalRatingsFocusNode,
                      preference: UserPreferences.enableAdditionalRatings,
                    title: l10n.additionalRatings,
                    subtitle: l10n.showMdbListAndTmdbRatings,
                    icon: Icons.star,
                    onChanged: _pushPersonalizationSync,
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.reorder),
                    title: Text(l10n.ratingSources),
                    subtitle: Text(l10n.ratingSourcesDescription),
                    onTap: () =>
                        context.pushSettingsScreen(const RatingsConfigScreen()),
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.enableEpisodeRatings,
                    title: l10n.episodeRatings,
                    subtitle: l10n.showRatingsOnEpisodes,
                    icon: Icons.stars,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.showRatingLabels,
                    title: l10n.ratingLabels,
                    subtitle: l10n.showLabelsNextToIcons,
                    icon: Icons.label,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.showRatingBadges,
                    title: l10n.ratingBadges,
                    subtitle: l10n.showDecorativeBadges,
                    icon: Icons.style,
                    onChanged: _pushPersonalizationSync,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
}

class _OfflineDownloadsScreen extends StatefulWidget {
  const _OfflineDownloadsScreen();

  @override
  State<_OfflineDownloadsScreen> createState() =>
      _OfflineDownloadsScreenState();
}

class _OfflineDownloadsScreenState extends State<_OfflineDownloadsScreen> {
  final _offlineScope = FocusScopeNode(
    debugLabel: 'OfflineDownloadsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );

  @override
  void dispose() {
    _offlineScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsOfflineDownloads)),
      body: FocusScope(
        node: _offlineScope,
        autofocus: true,
        child: ListView(
          children: [
            StringPickerPreferenceTile(
              preference: UserPreferences.defaultDownloadQuality,
              title: l10n.defaultDownloadQuality,
              icon: Icons.high_quality,
              options: {
                'original': l10n.original,
                'high': l10n.settingsHigh,
                'medium': l10n.medium,
                'low': l10n.settingsLow,
              },
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.downloadWifiOnly,
              title: l10n.wifiOnlyDownloads,
              subtitle: l10n.onlyDownloadOnWifi,
              icon: Icons.wifi,
            ),
            SliderPreferenceTile(
              preference: UserPreferences.downloadStorageLimitMb,
              title: l10n.storageLimit,
              icon: Icons.storage,
              min: 0,
              max: 102400,
              divisions: 100,
              labelOf: (v) => v == 0
                  ? l10n.noLimit
                  : l10n.gbValue((v / 1024).toStringAsFixed(1)),
            ),
            _EditableStringPreferenceTile(
              preference: UserPreferences.customDownloadPath,
              title: l10n.settingsCustomPath,
              icon: Icons.folder_open,
              hintText: l10n.settingsEnterDownloadFolderPath,
              pickPath: () async {
                String? initialDir;
                try {
                  initialDir = (await getDownloadsDirectory())?.path;
                } catch (_) {}
                return FilePicker.getDirectoryPath(
                  initialDirectory: initialDir,
                );
              },
            ),
            IntPickerPreferenceTile(
              preference: UserPreferences.downloadConcurrentCount,
              title: l10n.settingsConcurrentDownloads,
              description: l10n.settingsConcurrentDownloadsDescription,
              icon: Icons.queue,
              options: const {
                1: '1',
                2: '2',
                3: '3',
                4: '4',
                5: '5',
                6: '6',
                7: '7',
                8: '8',
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutCategoryScreen extends StatelessWidget {
  const _AboutCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final appVersion = GetIt.instance<DeviceInfo>().appVersion;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.aboutTitle)),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Image.asset('assets/images/logo_and_text.png', height: 72),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              l10n.versionValue(appVersion),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          _SectionHeader(l10n.settingsAppInfo),
          _TvSettingsListTile(
            autofocus: true,
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.version),
            subtitle: Text(appVersion),
            trailing: const SizedBox.shrink(),
            onTap: () {},
          ),
          if (AppDistribution.supportsInAppUpdates)
            const _CheckForUpdatesTile(),
          _TvSettingsListTile(
            leading: const Icon(Icons.code),
            title: Text(l10n.sourceCode),
            subtitle: Text(l10n.sourceCodeUrl),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://github.com/Moonfin-Client/Mobile-Desktop',
              title: l10n.sourceCode,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.bug_report),
            title: Text(l10n.settingsReportAnIssue),
            subtitle: Text(l10n.settingsReportAnIssueSubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://github.com/Moonfin-Client/Mobile-Desktop/issues',
              title: l10n.settingsReportAnIssue,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.troubleshoot),
            title: const Text('Diagnostics & Logging'),
            subtitle: const Text(
              'Capture media, login and network logs and send them to the '
              'server as a report',
            ),
            onTap: () =>
                context.pushSettingsScreen(const DiagnosticsSettingsScreen()),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.forum),
            title: Text(l10n.settingsJoinDiscord),
            subtitle: Text(l10n.settingsJoinDiscordSubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url: 'https://discord.gg/moonfin',
              title: l10n.settingsJoinTheDiscord,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.favorite),
            title: Text(l10n.settingsSupportMoonfin),
            subtitle: Text(l10n.settingsSupportMoonfinSubtitle),
            onTap: () => showSupportDialog(context),
          ),
          _SectionHeader(l10n.settingsLegal),
          _TvSettingsListTile(
            leading: const Icon(Icons.description),
            title: Text(l10n.settingsLicenses),
            subtitle: Text(l10n.settingsOpenSourceLicenseNotices),
            onTap: () => showQrOrLaunch(
              context,
              url:
                  'https://github.com/Moonfin-Client/Mobile-Desktop/blob/main/LICENSE',
              title: l10n.settingsLicenses,
            ),
          ),
          _TvSettingsListTile(
            leading: const Icon(Icons.privacy_tip),
            title: Text(l10n.settingsPrivacyPolicy),
            subtitle: Text(l10n.settingsPrivacyPolicySubtitle),
            onTap: () => showQrOrLaunch(
              context,
              url:
                  'https://github.com/Moonfin-Client/Mobile-Desktop/blob/main/PRIVACY_POLICY.md',
              title: l10n.settingsPrivacyPolicy,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckForUpdatesTile extends StatefulWidget {
  const _CheckForUpdatesTile();

  @override
  State<_CheckForUpdatesTile> createState() => _CheckForUpdatesTileState();
}

class _CheckForUpdatesTileState extends State<_CheckForUpdatesTile> {
  bool _checking = false;

  Future<void> _check() async {
    setState(() => _checking = true);
    await checkAndShowUpdateResult(context);
    if (!mounted) return;
    setState(() => _checking = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _TvSettingsListTile(
      leading: _checking
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.system_update_alt),
      title: Text(l10n.settingsCheckForUpdates),
      subtitle: Text(l10n.settingsCheckForUpdatesSubtitle),
      onTap: _checking ? null : _check,
    );
  }
}

class _LicensesScreen extends StatefulWidget {
  const _LicensesScreen();

  @override
  State<_LicensesScreen> createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<_LicensesScreen> {
  final _firstLicenseFocusNode = FocusNode(debugLabel: 'LicensesFirstItem');
  late final Future<List<_LicensePackageData>> _licensesFuture;

  @override
  void initState() {
    super.initState();
    _licensesFuture = _loadLicenses();
  }

  @override
  void dispose() {
    _firstLicenseFocusNode.dispose();
    super.dispose();
  }

  Future<List<_LicensePackageData>> _loadLicenses() async {
    final licenseBlocksByPackage = <String, List<String>>{};

    await for (final entry in LicenseRegistry.licenses) {
      final text = _licenseText(entry.paragraphs);
      if (text.isEmpty) continue;

      for (final package in entry.packages) {
        final normalized = package.trim();
        if (normalized.isEmpty) continue;
        if (normalized.toLowerCase() == 'moonfin') continue;
        licenseBlocksByPackage.putIfAbsent(normalized, () => []).add(text);
      }
    }

    final packages =
        licenseBlocksByPackage.entries
            .map(
              (entry) => _LicensePackageData(
                packageName: entry.key,
                blocks: List<String>.unmodifiable(entry.value),
              ),
            )
            .toList()
          ..sort(
            (a, b) => a.packageName.toLowerCase().compareTo(
              b.packageName.toLowerCase(),
            ),
          );

    return packages;
  }

  String _licenseText(Iterable<LicenseParagraph> paragraphs) {
    final buffer = StringBuffer();
    for (final paragraph in paragraphs) {
      final text = paragraph.text.trimRight();
      if (text.isEmpty) {
        buffer.writeln();
        continue;
      }
      final indent = '  ' * paragraph.indent;
      for (final line in text.split('\n')) {
        buffer.writeln('$indent${line.trimRight()}');
      }
      buffer.writeln();
    }
    return buffer.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _firstLicenseFocusNode : null,
      child: Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.settingsLicenses)),
        body: FutureBuilder<List<_LicensePackageData>>(
          future: _licensesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            final packages = snapshot.data ?? const <_LicensePackageData>[];
            return ListView(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n.settingsPoweredByFlutter,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                for (final entry in packages)
                  _TvSettingsListTile(
                    focusNode: identical(entry, packages.firstOrNull)
                        ? _firstLicenseFocusNode
                        : null,
                    autofocus: identical(entry, packages.firstOrNull),
                    leading: const Icon(Icons.description_outlined),
                    title: Text(entry.packageName),
                    subtitle: Text(
                      l10n.settingsLicenseNoticesCount(entry.blocks.length),
                    ),
                    onTap: () => context.pushSettingsScreen(
                      _LicenseDetailScreen(entry: entry),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LicenseDetailScreen extends StatefulWidget {
  final _LicensePackageData entry;

  const _LicenseDetailScreen({required this.entry});

  @override
  State<_LicenseDetailScreen> createState() => _LicenseDetailScreenState();
}

class _LicenseDetailScreenState extends State<_LicenseDetailScreen> {
  final _scrollController = ScrollController();
  final _scrollFocusNode = FocusNode(debugLabel: 'LicenseDetailScroll');

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollFocusNode.dispose();
    super.dispose();
  }

  KeyEventResult _onScrollKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (!_scrollController.hasClients) return KeyEventResult.ignored;

    const delta = 120.0;
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _scrollBy(delta);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _scrollBy(-delta);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _scrollBy(double delta) {
    final position = _scrollController.position;
    final target = (position.pixels + delta).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _scrollFocusNode : null,
      child: Scaffold(
        appBar: buildSettingsAppBar(context, Text(widget.entry.packageName)),
        body: Focus(
          focusNode: _scrollFocusNode,
          onKeyEvent: _onScrollKey,
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              itemCount: widget.entry.blocks.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  widget.entry.blocks[index],
                  style: const TextStyle(height: 1.45),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LicensePackageData {
  final String packageName;
  final List<String> blocks;

  const _LicensePackageData({required this.packageName, required this.blocks});
}

class _PlaybackCategoryScreen extends StatelessWidget {
  const _PlaybackCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.settingsPlaybackSyncplay),
        ),
        body: ListView(
          children: [
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.play_circle),
              title: Text(l10n.settingsVideoPlaybackPreferences),
              subtitle: Text(l10n.settingsVideoPlaybackPreferencesSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _VideoPlaybackScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.volume_up),
              title: Text(l10n.settingsAudioPreferences),
              subtitle: Text(l10n.settingsAudioPreferencesSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AudioPreferencesScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.subtitles),
              title: Text(l10n.subtitles),
              subtitle: Text(l10n.languageSizeAppearance),
              onTap: () =>
                  context.pushSettingsScreen(const SubtitleSettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.queue_play_next),
              title: Text(l10n.settingsAutomationAndQueue),
              subtitle: Text(l10n.settingsAutomationAndQueueSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AutomationQueueScreen()),
            ),
            if (!PlatformDetection.isTV && !PlatformDetection.isWeb)
              _TvSettingsListTile(
                leading: const Icon(Icons.download),
                title: Text(l10n.settingsOfflineDownloads),
                subtitle: Text(l10n.settingsOfflineDownloadsSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const _OfflineDownloadsScreen()),
              ),
            _TvSettingsListTile(
              leading: const Icon(Icons.groups),
              title: Text(l10n.syncPlay),
              subtitle: Text(l10n.settingsSyncplaySubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _SyncPlaySettingsScreen()),
            ),
            _TvSettingsListTile(
              leading: const Icon(Icons.settings),
              title: Text(l10n.advancedOptions),
              subtitle: Text(l10n.settingsAdvancedOptionsSubtitle),
              onTap: () =>
                  context.pushSettingsScreen(const _AdvancedOptionsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoPlaybackScreen extends StatelessWidget {
  const _VideoPlaybackScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsVideoPlaybackPreferences),
      ),
      body: ListView(
        children: [
          const _SectionHeader('Media Player Behavior'),
          SwitchPreferenceTile(
            preference: UserPreferences.showDescriptionOnPause,
            title: l10n.showDescriptionOnPause,
            subtitle: l10n.dimVideoShowOverview,
            icon: Icons.pause_circle_outline,
          ),
          EnumPreferenceTile<ZoomMode>(
            preference: UserPreferences.playerZoomMode,
            title: l10n.playerZoomMode,
            description: l10n.settingsPlayerZoomDescription,
            icon: Icons.zoom_out_map,
            labelOf: (v) => switch (v) {
              ZoomMode.fit => l10n.fit,
              ZoomMode.autoCrop => l10n.autoCrop,
              ZoomMode.stretch => l10n.stretch,
            },
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.trickPlayEnabled,
            title: l10n.trickPlay,
            subtitle: l10n.showPreviewThumbnailsWhenSeeking,
            icon: Icons.image_search,
          ),
          if (PlatformDetection.useDesktopUi)
            EnumPreferenceTile<DesktopScrollWheelAction>(
              preference: UserPreferences.desktopScrollWheelAction,
              title: l10n.settingsScrollWheelAction,
              description: l10n.settingsScrollWheelActionDescription,
              icon: Icons.mouse_outlined,
              labelOf: (v) => switch (v) {
                DesktopScrollWheelAction.off => l10n.scrollWheelActionOff,
                DesktopScrollWheelAction.seek => l10n.scrollWheelActionSeek,
                DesktopScrollWheelAction.volume => l10n.scrollWheelActionVolume,
              },
            ),
          StringPickerPreferenceTile(
            preference: UserPreferences.resumeSubtractDuration,
            title: l10n.resumeRewind,
            description: l10n.settingsResumeRewindDescription,
            icon: Icons.replay,
            options: {
              '0': l10n.disabled,
              '5': l10n.fiveSeconds,
              '10': l10n.tenSeconds,
              '15': l10n.fifteenSeconds,
              '30': l10n.thirtySeconds,
            },
          ),
          IntPickerPreferenceTile(
            preference: UserPreferences.unpauseRewindDuration,
            title: l10n.unpauseRewind,
            description: l10n.settingsUnpauseRewindDescription,
            icon: Icons.replay_circle_filled,
            options: {
              0: l10n.disabled,
              5000: l10n.fiveSeconds,
              10000: l10n.tenSeconds,
              15000: l10n.fifteenSeconds,
              30000: l10n.thirtySeconds,
            },
          ),
          IntPickerPreferenceTile(
            preference: UserPreferences.skipBackLength,
            title: l10n.skipBackLength,
            description: l10n.settingsSkipBackLengthDescription,
            icon: Icons.fast_rewind,
            options: {
              1000: l10n.settingsOneSecond,
              3000: l10n.settingsThreeSeconds,
              5000: l10n.fiveSeconds,
              10000: l10n.tenSeconds,
              15000: l10n.fifteenSeconds,
              30000: l10n.thirtySeconds,
              45000: l10n.settingsFortyFiveSeconds,
              60000: l10n.settingsSixtySeconds,
            },
          ),
          IntPickerPreferenceTile(
            preference: UserPreferences.skipForwardLength,
            title: l10n.skipForwardLength,
            description: l10n.settingsSkipForwardLengthDescription,
            icon: Icons.fast_forward,
            options: {
              1000: l10n.settingsOneSecond,
              3000: l10n.settingsThreeSeconds,
              5000: l10n.fiveSeconds,
              10000: l10n.tenSeconds,
              15000: l10n.fifteenSeconds,
              30000: l10n.thirtySeconds,
              45000: l10n.settingsFortyFiveSeconds,
              60000: l10n.settingsSixtySeconds,
            },
          ),
          if (PlatformDetection.useMobileUi)
            SwitchPreferenceTile(
              preference: UserPreferences.osdLockEnabled,
              title: l10n.osdLockButton,
              subtitle: l10n.osdLockButtonDescription,
              icon: Icons.lock,
            ),

          const _SectionHeader('Decoding & Rendering'),
          if (PlatformDetection.isAndroid)
            EnumPreferenceTile<PlaybackEnginePreference>(
              preference: UserPreferences.playbackEnginePreference,
              title: PlatformDetection.isTV
                  ? l10n.settingsPlaybackEngineAndroidTv
                  : l10n.settingsPlaybackEngineAndroidTv.replaceAll(
                      'Android TV',
                      'Android',
                    ),
              description: PlatformDetection.isTV
                  ? l10n.settingsPlaybackEngineAndroidTvDescription
                  : l10n.settingsPlaybackEngineAndroidTvDescription.replaceAll(
                      'Android TV',
                      'Android',
                    ),
              icon: Icons.video_settings,
              labelOf: (v) => switch (v) {
                PlaybackEnginePreference.media3 => PlatformDetection.isTV
                  ? l10n.settingsPlaybackEngineMedia3Recommended
                  : l10n.settingsPlaybackEngineMedia3Legacy,
                PlaybackEnginePreference.mpv => PlatformDetection.isTV
                  ? l10n.settingsPlaybackEngineMpvLegacy
                  : l10n.settingsPlaybackEngineMpvRecommended,
              },
            ),
          if (PlatformDetection.isAndroid && PlatformDetection.isTV)
            EnumPreferenceTile<DolbyVisionFallbackBehavior>(
              preference: UserPreferences.dolbyVisionFallbackBehavior,
              title: l10n.settingsDolbyVisionFallback,
              description: l10n.settingsDolbyVisionFallbackDescription,
              icon: Icons.hdr_strong,
              labelOf: (v) => switch (v) {
                DolbyVisionFallbackBehavior.ask => l10n.settingsAskEachTime,
                DolbyVisionFallbackBehavior.hdr10Fallback =>
                  l10n.settingsPreferHdr10Fallback,
                DolbyVisionFallbackBehavior.transcode =>
                  l10n.settingsPreferServerTranscode,
              },
            ),
          if (PlatformDetection.isAndroid && PlatformDetection.isTV)
            EnumPreferenceTile<DolbyVisionProfile7DirectPlayBehavior>(
              preference: UserPreferences.dolbyVisionProfile7DirectPlayBehavior,
              title: l10n.settingsDolbyVisionProfile7DirectPlay,
              description:
                  l10n.settingsDolbyVisionProfile7DirectPlayDescription,
              icon: Icons.movie_filter,
              labelOf: (v) => switch (v) {
                DolbyVisionProfile7DirectPlayBehavior.auto =>
                  l10n.settingsAutoAftkrtEnabled,
                DolbyVisionProfile7DirectPlayBehavior.enabled =>
                  l10n.supportedOnThisDevice,
                DolbyVisionProfile7DirectPlayBehavior.disabled =>
                  l10n.settingsDisabledPreferTranscode,
              },
            ),
          if (!PlatformDetection.isWeb)
            SwitchPreferenceTile(
              preference: UserPreferences.hardwareDecoding,
              title: l10n.hardwareDecoding,
              subtitle: l10n.hardwareDecodingSubtitle,
              icon: Icons.memory,
            ),
          if (PlatformDetection.isAndroid && PlatformDetection.isTV)
            EnumPreferenceTile<RefreshRateSwitchingBehavior>(
              preference: UserPreferences.refreshRateSwitchingBehavior,
              title: l10n.refreshRateSwitching,
              icon: Icons.speed,
              labelOf: (v) => switch (v) {
                RefreshRateSwitchingBehavior.disabled => l10n.disabled,
                RefreshRateSwitchingBehavior.scaleOnTv => l10n.scaleOnTv,
                RefreshRateSwitchingBehavior.scaleOnDevice =>
                  l10n.scaleOnDevice,
              },
            ),
          if (PlatformDetection.isWindows)
            EnumPreferenceTile<AutoHdrSwitchingBehavior>(
              preference: UserPreferences.autoHdrSwitchingBehavior,
              title: l10n.autoHdrSwitching,
              description: l10n.autoHdrSwitchingDescription,
              icon: Icons.hdr_strong,
              labelOf: (v) => switch (v) {
                AutoHdrSwitchingBehavior.disabled => l10n.disabled,
                AutoHdrSwitchingBehavior.whenFullscreen =>
                  l10n.whenFullscreen,
                AutoHdrSwitchingBehavior.always => l10n.always,
              },
            ),
          SwitchPreferenceTile(
            preference: UserPreferences.liveTvDirectPlayEnabled,
            title: l10n.settingsLiveTvDirect,
            subtitle: l10n.settingsLiveTvDirectSubtitle,
            icon: Icons.live_tv,
          ),

          _SectionHeader(l10n.transcodingLimits),
          StringPickerPreferenceTile(
            preference: UserPreferences.maxBitrate,
            title: l10n.maxStreamingBitrate,
            description: l10n.settingsMaxBitrateDescription,
            icon: Icons.network_check,
            options: {
              'auto': l10n.auto,
              '200': '200 Mbps',
              '120': '120 Mbps',
              '80': '80 Mbps',
              '40': '40 Mbps',
              '20': '20 Mbps',
              '10': '10 Mbps',
              '5': '5 Mbps',
              '2': '2 Mbps',
              '1': '1 Mbps',
            },
          ),
          EnumPreferenceTile<MaxVideoResolution>(
            preference: UserPreferences.maxVideoResolution,
            title: l10n.maxResolution,
            description: l10n.settingsMaxResolutionDescription,
            icon: Icons.high_quality,
            labelOf: (v) => switch (v) {
              MaxVideoResolution.auto => l10n.auto,
              MaxVideoResolution.res480p => '480p',
              MaxVideoResolution.res720p => '720p',
              MaxVideoResolution.res1080p => '1080p',
              MaxVideoResolution.res2160p => '2160p (4K)',
            },
          ),
        ],
      ),
    );
  }
}

class _ExternalPlayerAppPickerTile extends StatefulWidget {
  const _ExternalPlayerAppPickerTile();

  @override
  State<_ExternalPlayerAppPickerTile> createState() =>
      _ExternalPlayerAppPickerTileState();
}

class _ExternalPlayerAppPickerTileState
    extends State<_ExternalPlayerAppPickerTile> {
  final _service = GetIt.instance<ExternalPlayerService>();
  late final PreferenceBinding<String> _componentBinding;
  List<ExternalPlayerApp> _players = const [];
  bool _loading = false;
  bool _pickerOpen = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    final store = GetIt.instance<PreferenceStore>();
    _componentBinding = PreferenceBinding(
      store,
      UserPreferences.externalPlayerComponentName,
    );
    unawaited(_loadPlayers());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _componentBinding.dispose();
    super.dispose();
  }

  Future<void> _loadPlayers() async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      final players = await _service.listPlayers();
      if (!mounted) return;
      setState(() {
        _players = players;
      });
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  String _selectedLabel(String component) {
    final normalized = component.trim();
    if (normalized.isEmpty) {
      return AppLocalizations.of(context).settingsAskEachTime;
    }

    for (final player in _players) {
      if (player.component == normalized) {
        return player.label;
      }
    }

    return normalized;
  }

  Future<void> _showPicker(String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    await _loadPlayers();
    try {
      if (!mounted) return;

      final normalizedCurrent = current.trim();
      final selectedIndex = _players.indexWhere(
        (player) => player.component == normalizedCurrent,
      );
      final autofocusIndex = selectedIndex >= 0 ? selectedIndex : -1;
      var picked = false;

      final result = await showFocusRestoringDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (dialogContext) => SimpleDialog(
          title: Text(AppLocalizations.of(dialogContext).externalPlayerApp),
          children: [
            TvFocusHighlight(
              builder: (_, _) => ListTile(
                autofocus: normalizedCurrent.isEmpty,
                leading: const Icon(Icons.help_outline),
                title: Text(
                  AppLocalizations.of(dialogContext).settingsAskEachTime,
                ),
                subtitle: Text(
                  AppLocalizations.of(dialogContext)
                      .externalPlayerAskEachTimeSubtitle,
                ),
                trailing: normalizedCurrent.isEmpty
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  if (picked) return;
                  picked = true;
                  Navigator.pop(dialogContext, '');
                },
              ),
            ),
            ..._players.asMap().entries.map((entry) {
              final index = entry.key;
              final player = entry.value;
              final selected = player.component == normalizedCurrent;
              return TvFocusHighlight(
                builder: (_, _) => ListTile(
                  autofocus: index == autofocusIndex,
                  leading: _ExternalPlayerAppIcon(player: player),
                  title: Text(player.label),
                  subtitle: Text(player.packageName),
                  trailing: selected ? const Icon(Icons.check) : null,
                  onTap: () {
                    if (picked) return;
                    picked = true;
                    Navigator.pop(dialogContext, player.component);
                  },
                ),
              );
            }),
          ],
        ),
      );

      if (!mounted || result == null || result == _componentBinding.value) {
        return;
      }

      _componentBinding.value = result;
    } finally {
      _pickerOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _componentBinding,
      builder: (context, component, _) {
        final label = _loading
            ? AppLocalizations.of(context).loadingInstalledPlayers
            : _selectedLabel(component);
        return Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: (_, event) {
            if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
            if (event is KeyDownEvent) {
              _showPicker(component);
            }
            return KeyEventResult.handled;
          },
          child: TvFocusHighlight(
            builder: (context, focused) => ListTile(
              focusNode: _focusNode,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              leading: buildSettingsLeadingIconShell(
                context,
                icon: const Icon(Icons.apps),
                focused: focused,
                iconColor: focused
                    ? AppColors.black.withValues(alpha: 0.54)
                    : AppColorScheme.onSurface.withValues(alpha: 0.78),
              ),
              title: DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.87)
                      : AppColorScheme.onSurface,
                ),
                child: Text(AppLocalizations.of(context).externalPlayerApp),
              ),
              subtitle: DefaultTextStyle.merge(
                style: TextStyle(
                  fontSize: 12,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
                child: Text(AppLocalizations.of(context).externalPlayerAppDescription),
              ),
              isThreeLine: true,
              trailing: buildSettingsSelectionBubble(context, label, focused),
              onTap: () => _showPicker(component),
            ),
          ),
        );
      },
    );
  }
}

class _ExternalPlayerAppIcon extends StatelessWidget {
  final ExternalPlayerApp player;

  const _ExternalPlayerAppIcon({required this.player});

  @override
  Widget build(BuildContext context) {
    final bytes = player.iconPngBytes;
    if (bytes == null || bytes.isEmpty) {
      return const Icon(Icons.ondemand_video);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.memory(
        bytes,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const Icon(Icons.ondemand_video),
      ),
    );
  }
}

class _AudioPreferencesScreen extends StatefulWidget {
  const _AudioPreferencesScreen();

  @override
  State<_AudioPreferencesScreen> createState() =>
      _AudioPreferencesScreenState();
}

class _AudioPreferencesScreenState extends State<_AudioPreferencesScreen> {
  late final UserPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = GetIt.instance<UserPreferences>();
    _prefs.addListener(_onPreferencesChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPreferencesChanged);
    super.dispose();
  }

  void _onPreferencesChanged() {
    if (!mounted) return;
    setState(() {});
  }

  bool get _showPassthroughToggles {
    if (PlatformDetection.isWeb || PlatformDetection.useMobileUi) {
      return false;
    }
    return (PlatformDetection.isAndroid && PlatformDetection.isTV) ||
        PlatformDetection.isDesktop;
  }

  AudioCapabilityProfile get _audioCapabilityProfile =>
      AudioCapabilityProfile.fromMap(
        PlatformDetection.hasAudioCapabilities
            ? PlatformDetection.audioCapabilitiesSnapshot
            : null,
      );

  String _audioRouteLabel(AppLocalizations l10n, AudioRouteType routeType) {
    return switch (routeType) {
      AudioRouteType.hdmi => l10n.settingsAudioRouteHdmi,
      AudioRouteType.arc => l10n.settingsAudioRouteArc,
      AudioRouteType.earc => l10n.settingsAudioRouteEarc,
      AudioRouteType.bluetooth => l10n.settingsAudioRouteBluetooth,
      AudioRouteType.speaker => l10n.settingsAudioRouteSpeaker,
      AudioRouteType.other => l10n.unknown,
    };
  }

  String _joinedOrUnknown(AppLocalizations l10n, List<String> values) {
    if (values.isEmpty) {
      return l10n.unknown;
    }
    return values.join(', ');
  }

  List<Widget> _buildDetectedCapabilities(AppLocalizations l10n) {
    final hasSnapshot = PlatformDetection.hasAudioCapabilities;
    if (!hasSnapshot) {
      return <Widget>[
        _TvSettingsListTile(
          leading: const Icon(Icons.hearing_disabled),
          title: Text(l10n.settingsDetectedAudioCapabilitiesUnavailable),
        ),
      ];
    }

    final profile = _audioCapabilityProfile;
    final decodeCodecs = <String>[
      'AAC',
      if (profile.canDecodeAc3) 'AC3',
      if (profile.canDecodeEac3) 'EAC3',
      if (profile.canDecodeDts) 'DTS',
      if (profile.canDecodeDtsHd) 'DTS-HD',
      if (profile.canDecodeTrueHd) 'TrueHD',
      if (profile.canDecodeFlac) 'FLAC',
    ];

    final passthroughCodecs = <String>[
      if (profile.canPassthroughAc3) 'AC3',
      if (profile.canPassthroughEac3) 'EAC3',
      if (profile.canPassthroughEac3Joc) 'EAC3 JOC',
      if (profile.canPassthroughDts) 'DTS',
      if (profile.canPassthroughDtsHd) 'DTS-HD',
      if (profile.canPassthroughDtsX) 'DTS:X',
      if (profile.canPassthroughTrueHd) 'TrueHD',
      if (profile.canPassthroughTrueHdJoc) 'TrueHD JOC',
    ];

    final routeSubtitleParts = <String>[
      _audioRouteLabel(l10n, profile.activeRouteType),
      l10n.settingsAudioPcmChannels(profile.maxPcmChannels),
      if (profile.routeSupportsHdAudio) l10n.settingsAudioHdRoute,
    ];

    return <Widget>[
      _TvSettingsListTile(
        leading: const Icon(Icons.router),
        title: Text(l10n.connection),
        subtitle: Text(routeSubtitleParts.join(' • ')),
      ),
      _TvSettingsListTile(
        leading: const Icon(Icons.memory),
        title: Text(l10n.audioTranscodeTarget),
        subtitle: Text(_joinedOrUnknown(l10n, decodeCodecs)),
      ),
      _TvSettingsListTile(
        leading: const Icon(Icons.settings_input_hdmi),
        title: Text(l10n.passthrough),
        subtitle: Text(_joinedOrUnknown(l10n, passthroughCodecs)),
      ),
    ];
  }

  String _capabilitySubtitle(
    AppLocalizations l10n, {
    required String baseSubtitle,
    required bool isSupported,
  }) {
    if (!(PlatformDetection.isAndroid && PlatformDetection.isTV)) {
      return baseSubtitle;
    }

    if (!PlatformDetection.hasAudioCapabilities) {
      return baseSubtitle;
    }

    final status = isSupported
      ? l10n.supportedOnThisDevice
      : l10n.notSupportedOnThisDevice;
    return '$baseSubtitle\n${l10n.status}: $status';
  }

  List<AudioPassthroughPreset> get _availablePresets =>
      PlatformDetection.isAppleTV
      ? const [AudioPassthroughPreset.auto, AudioPassthroughPreset.stereo]
      : const [
          AudioPassthroughPreset.auto,
          AudioPassthroughPreset.surroundReceiver,
          AudioPassthroughPreset.stereo,
          AudioPassthroughPreset.advanced,
        ];

  String _audioPresetLabel(AudioPassthroughPreset preset) => switch (preset) {
    AudioPassthroughPreset.auto =>
      PlatformDetection.isAppleTV ? 'Auto (multichannel)' : 'Auto',
    AudioPassthroughPreset.surroundReceiver => 'AV receiver (Atmos / DTS:X)',
    AudioPassthroughPreset.stereo => 'Stereo',
    AudioPassthroughPreset.advanced => 'Advanced',
  };

  Widget _buildRedetectTile() {
    return _TvSettingsListTile(
      leading: const Icon(Icons.refresh),
      title: const Text('Re-detect & apply recommended'),
      subtitle: const Text(
        'Re-run audio detection and reset to the recommended settings.',
      ),
      onTap: _redetectAndApplyRecommended,
    );
  }

  Future<void> _redetectAndApplyRecommended() async {
    final profile = await AudioCapabilityProbe.query();
    AudioCapabilityProbe.apply(profile);

    final AudioPassthroughPreset preset;
    if (profile != null &&
        profile.isAvReceiverRoute &&
        profile.hasCompressedPassthroughRoute) {
      preset = AudioPassthroughPreset.surroundReceiver;
    } else if (profile != null && profile.maxPcmChannels <= 2) {
      preset = AudioPassthroughPreset.stereo;
    } else {
      preset = AudioPassthroughPreset.auto;
    }
    await _prefs.applyAudioPassthroughPreset(preset);

    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    final route = profile == null
        ? l10n.unknown
        : _audioRouteLabel(l10n, profile.activeRouteType);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Audio re-detected: $route')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAdvanced =
        _prefs.get(UserPreferences.audioPassthroughPreset) ==
        AudioPassthroughPreset.advanced;
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsAudioPreferences)),
      body: ListView(
        children: [
          _SectionHeader(l10n.mediaPlayerBehavior),
          SwitchPreferenceTile(
            preference: UserPreferences.audioNightMode,
            title: l10n.nightMode,
            subtitle: l10n.compressDynamicRange,
            icon: Icons.nights_stay,
          ),
          StringPickerPreferenceTile(
            preference: UserPreferences.defaultAudioLanguage,
            title: l10n.defaultAudioLanguage,
            icon: Icons.language,
            options: {
              'auto': l10n.autoServerDefault,
              ...kIso6392Languages,
            },
          ),

          if (!PlatformDetection.isWeb) ...[
            const _SectionHeader('Audio Output'),
            EnumPreferenceTile<AudioPassthroughPreset>(
              preference: UserPreferences.audioPassthroughPreset,
              values: _availablePresets,
              title: 'Audio Output',
              description: PlatformDetection.isAppleTV
                  ? 'How audio is sent to your TV or receiver.'
                  : 'How audio is sent to your TV or receiver. Choose Advanced for per-codec control.',
              icon: Icons.surround_sound,
              labelOf: _audioPresetLabel,
              onChangedValue: (preset) =>
                  _prefs.applyAudioPassthroughPreset(preset),
            ),
            if (isAdvanced) ...[
              const _SectionHeader('Advanced'),
              EnumPreferenceTile<AudioOutputMode>(
                preference: UserPreferences.audioOutputMode,
                title: l10n.settingsAudioOutputMode,
                description: l10n.settingsAudioOutputModeDescription,
                icon: Icons.surround_sound,
                labelOf: (v) => switch (v) {
                  AudioOutputMode.auto => l10n.auto,
                  AudioOutputMode.forceStereo => l10n.downmixToStereo,
                  AudioOutputMode.avrPassthrough =>
                    l10n.settingsAudioOutputModeAvrPassthrough,
                },
              ),
          IntPickerPreferenceTile(
            preference: UserPreferences.maxAudioChannels,
            title: l10n.settingsMaxAudioChannels,
            description: l10n.settingsMaxAudioChannelsDescription,
            icon: Icons.speaker_group,
            options: <int, String>{
              0: l10n.settingsMaxAudioChannelsAuto,
              1: l10n.settingsMaxAudioChannelsMono,
              2: l10n.settingsMaxAudioChannelsStereo,
              3: l10n.settingsMaxAudioChannels3_0,
              4: l10n.settingsMaxAudioChannels4_0,
              5: l10n.settingsMaxAudioChannels5_0,
              6: l10n.settingsMaxAudioChannels5_1,
              7: l10n.settingsMaxAudioChannels6_1,
              8: l10n.settingsMaxAudioChannels7_1,
            },
          ),
          EnumPreferenceTile<AudioFallbackCodec>(
            preference: UserPreferences.audioFallbackCodec,
            title: l10n.settingsAudioFallbackCodec,
            description: l10n.settingsAudioFallbackCodecDescription,
            icon: Icons.hearing,
            labelOf: (v) => switch (v) {
              AudioFallbackCodec.auto => l10n.settingsAudioFallbackCodecAuto,
              AudioFallbackCodec.aac => l10n.settingsAudioFallbackCodecAac,
              AudioFallbackCodec.ac3 => l10n.settingsAudioFallbackCodecAc3,
              AudioFallbackCodec.eac3 => l10n.settingsAudioFallbackCodecEac3,
              AudioFallbackCodec.truehd => l10n.settingsAudioFallbackCodecTrueHd,
              AudioFallbackCodec.mp3 => l10n.settingsAudioFallbackCodecMp3,
              AudioFallbackCodec.opus => l10n.settingsAudioFallbackCodecOpus,
              AudioFallbackCodec.flac => l10n.settingsAudioFallbackCodecFlac,
            },
          ),

          if (_showPassthroughToggles) ...[
            const _SectionHeader('Passthrough Settings'),
            SwitchPreferenceTile(
              preference: UserPreferences.ac3PassthroughEnabled,
              title: l10n.ac3Passthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle: l10n.settingsBitstreamAc3ToExternalDecoder,
                isSupported: PlatformDetection.supportsAc3Audio,
              ),
              icon: Icons.speaker,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.eac3PassthroughEnabled,
              title: l10n.settingsAudioEac3Passthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle: l10n.settingsAudioBitstreamEac3ToExternalDecoder,
                isSupported: PlatformDetection.supportsEac3Audio,
              ),
              icon: Icons.surround_sound,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.eac3JocPassthroughEnabled,
              title: l10n.settingsAudioEac3JocPassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle:
                    l10n.settingsAudioBitstreamEac3JocToExternalDecoder,
                isSupported: PlatformDetection.supportsEac3JocAudio,
              ),
              icon: Icons.surround_sound,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.dtsCorePassthroughEnabled,
              title: l10n.settingsAudioDtsCorePassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle: l10n.enableDtsPassthrough,
                isSupported: PlatformDetection.supportsDtsAudio,
              ),
              icon: Icons.audiotrack,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.dtsHdPassthroughEnabled,
              title: l10n.settingsAudioDtsHdPassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle: l10n.settingsAudioBitstreamDtsHdToExternalDecoder,
                isSupported: PlatformDetection.supportsDtsHdAudio,
              ),
              icon: Icons.high_quality,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.dtsXPassthroughEnabled,
              title: l10n.settingsAudioDtsXPassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle:
                    l10n.settingsAudioBitstreamDtsXToExternalDecoder,
                isSupported: PlatformDetection.supportsDtsXAudio,
              ),
              icon: Icons.high_quality,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.trueHdPassthroughEnabled,
              title: l10n.settingsAudioTrueHdPassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle: l10n.enableTrueHdAudio,
                isSupported: PlatformDetection.supportsTrueHdAudio,
              ),
              icon: Icons.graphic_eq,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.trueHdAtmosPassthroughEnabled,
              title: l10n.settingsAudioTrueHdJocPassthrough,
              subtitle: _capabilitySubtitle(
                l10n,
                baseSubtitle:
                    l10n.settingsAudioBitstreamTrueHdAtmosToExternalDecoder,
                isSupported: PlatformDetection.supportsTrueHdJocAudio,
              ),
              icon: Icons.graphic_eq,
            ),
            ],
            ],
          ],

          if (AudioCapabilityProbe.isSupported) ...[
            _SectionHeader(l10n.settingsDetectedAudioCapabilities),
            ..._buildDetectedCapabilities(l10n),
            _buildRedetectTile(),
          ],
        ],
      ),
    );
  }
}

class _AutomationQueueScreen extends StatefulWidget {
  const _AutomationQueueScreen();

  @override
  State<_AutomationQueueScreen> createState() => _AutomationQueueScreenState();
}

class _AutomationQueueScreenState extends State<_AutomationQueueScreen> {
  static const _promptSkipSegments = 'intro:askToSkip,outro:askToSkip';
  late final UserPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = GetIt.instance<UserPreferences>();
    _prefs.addListener(_onPreferencesChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPreferencesChanged);
    super.dispose();
  }

  void _onPreferencesChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextUpBehavior = _prefs.get(UserPreferences.nextUpBehavior);
    final mediaSegmentActions = _prefs.get(UserPreferences.mediaSegmentActions);
    final showNextUpOptions = nextUpBehavior != NextUpBehavior.disabled;
    final showReplaceSkipOutroWithNextUp =
        showNextUpOptions && mediaSegmentActions == _promptSkipSegments;

    return Scaffold(
      appBar: buildSettingsAppBar(
        context,
        Text(l10n.settingsAutomationAndQueue),
      ),
      body: ListView(
        children: [
          _SectionHeader(l10n.playbackEnhancements),
          SwitchPreferenceTile(
            preference: UserPreferences.cinemaModeEnabled,
            title: l10n.settingsCinemaMode,
            subtitle: l10n.settingsCinemaModeSubtitle,
            icon: Icons.movie_filter,
          ),
          StringPickerPreferenceTile(
            preference: UserPreferences.mediaSegmentActions,
            title: l10n.settingsSkipIntrosAndOutros,
            icon: Icons.content_cut,
            options: {
              _promptSkipSegments: l10n.settingsPromptUser,
              'intro:skip,outro:skip': l10n.settingsSkip,
              'intro:doNothing,outro:doNothing': l10n.settingsDoNothing,
            },
          ),
          if (mediaSegmentActions == _promptSkipSegments || showNextUpOptions)
            EnumPreferenceTile<MediaSegmentCountdown>(
              preference: UserPreferences.mediaSegmentCountdown,
              title: l10n.settingsMediaSegmentCountdown,
              icon: Icons.timer_outlined,
              labelOf: (v) => switch (v) {
                MediaSegmentCountdown.progressBar => l10n.settingsProgressBar,
                MediaSegmentCountdown.timer => l10n.settingsTimer,
                MediaSegmentCountdown.both => l10n.settingsBoth,
                MediaSegmentCountdown.none => l10n.settingsNone,
              },
            ),

          _SectionHeader(l10n.automaticQueuing),
          ListTile(
            leading: const Icon(Icons.queue),
            title: Text(l10n.mediaQueuing),
            subtitle: Text(l10n.alwaysOn),
          ),
          SwitchPreferenceTile(
            preference: UserPreferences.autoplayNextEpisode,
            title: l10n.autoplayNextEpisode,
            subtitle: l10n.autoplayNextEpisodeSubtitle,
            icon: Icons.play_circle,
          ),
          EnumPreferenceTile<NextUpBehavior>(
            preference: UserPreferences.nextUpBehavior,
            title: l10n.nextUpDisplay,
            description: l10n.settingsNextUpDisplayDescription,
            icon: Icons.skip_next,
            labelOf: (v) => switch (v) {
              NextUpBehavior.extended => l10n.extended,
              NextUpBehavior.minimal => l10n.minimal,
              NextUpBehavior.disabled => l10n.disabled,
            },
          ),
          if (showNextUpOptions)
            SliderPreferenceTile(
              preference: UserPreferences.nextUpTimeout,
              title: l10n.nextUpTimeout,
              icon: Icons.timer,
              min: 0,
              max: 30000,
              divisions: 30,
              labelOf: (v) => l10n.secondsValue((v / 1000).round()),
            ),
          if (showReplaceSkipOutroWithNextUp)
            SwitchPreferenceTile(
              preference: UserPreferences.replaceSkipOutroWithNextUp,
              title: l10n.replaceSkipOutroWithNextUpDisplay,
              subtitle: l10n.replaceSkipOutroWithNextUpDisplaySubtitle,
              icon: Icons.skip_next,
            ),
          EnumPreferenceTile<StillWatchingBehavior>(
            preference: UserPreferences.stillWatchingBehavior,
            title: l10n.stillWatchingPrompt,
            description:
                'Prompt to Continue Watching after X consecutive episodes.',
            icon: Icons.visibility,
            labelOf: (v) => switch (v) {
              StillWatchingBehavior.short_ => '2 episodes',
              StillWatchingBehavior.medium => '3 episodes',
              StillWatchingBehavior.long_ => '5 episodes',
              StillWatchingBehavior.veryLong => '8 episodes',
              StillWatchingBehavior.disabled => 'Off',
            },
          ),
        ],
      ),
    );
  }
}

class _AdvancedOptionsScreen extends StatefulWidget {
  const _AdvancedOptionsScreen();

  @override
  State<_AdvancedOptionsScreen> createState() => _AdvancedOptionsScreenState();
}

class _AdvancedOptionsScreenState extends State<_AdvancedOptionsScreen> {
  final _advancedScope = FocusScopeNode(
    debugLabel: 'AdvancedOptionsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );

  @override
  void dispose() {
    _advancedScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.advancedOptions)),
      body: FocusScope(
        node: _advancedScope,
        autofocus: true,
        child: ListView(
          children: [
            SliderPreferenceTile(
              preference: UserPreferences.videoStartDelay,
              title: l10n.settingsVideoStartDelay,
              icon: Icons.schedule,
              min: 0,
              max: 5000,
              divisions: 20,
              labelOf: (v) => l10n.settingsMillisecondsValue(v.round()),
            ),
            if (PlatformDetection.isAndroid && PlatformDetection.isTV) ...[
              _SectionHeader(l10n.playerRouting),
              SwitchPreferenceTile(
                preference: UserPreferences.preferExoPlayerFfmpeg,
                title: l10n.preferSoftwareDecoders,
                subtitle: l10n.preferSoftwareDecodersSubtitle,
                icon: Icons.memory,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.media3SkipSilence,
                title: l10n.skipSilenceTitle,
                subtitle: l10n.skipSilenceSubtitle,
                icon: Icons.graphic_eq,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.media3AllowExternalAudioEffects,
                title: l10n.allowExternalAudioEffectsTitle,
                subtitle: l10n.allowExternalAudioEffectsSubtitle,
                icon: Icons.equalizer,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.media3TunnelingDisabled,
                inverted: true,
                title: l10n.enableTunnelingTitle,
                subtitle: l10n.enableTunnelingSubtitle,
                icon: Icons.tv,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.media3MapDolbyVisionProfile7ToHevc,
                title: l10n.mapDolbyVisionP7Title,
                subtitle: l10n.mapDolbyVisionP7Subtitle,
                icon: Icons.hdr_strong,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.useExternalPlayer,
                title: l10n.useExternalPlayer,
                subtitle: l10n.useExternalPlayerSubtitle,
                icon: Icons.open_in_new,
              ),
              const _ExternalPlayerAppPickerTile(),
            ],
            if (!PlatformDetection.isTV &&
                !PlatformDetection.isIOS &&
                !PlatformDetection.isWeb) ...[
              SwitchPreferenceTile(
                preference: UserPreferences.customMpvConfEnabled,
                title: l10n.enableCustomMpvConf,
                subtitle: l10n.applyMpvConfBeforePlayback,
                icon: Icons.tune,
              ),
              _EditableStringPreferenceTile(
                preference: UserPreferences.customMpvConfPath,
                title: l10n.customMpvConfPath,
                icon: Icons.description,
                hintText: l10n.pathToMpvConf,
                pickPath: () async {
                  String? initialDir;
                  try {
                    initialDir = (await getApplicationSupportDirectory()).path;
                  } catch (_) {}
                  final result = await FilePicker.pickFiles(
                    dialogTitle: l10n.selectMpvConf,
                    initialDirectory: initialDir,
                  );
                  return result?.files.single.path;
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.customMpvConfUnsafeAdvanced,
                title: l10n.unsafeAdvancedMpvOptions,
                subtitle: l10n.unsafeMpvOptionsDescription,
                icon: Icons.warning_amber,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SyncPlaySettingsScreen extends StatefulWidget {
  const _SyncPlaySettingsScreen();

  @override
  State<_SyncPlaySettingsScreen> createState() =>
      _SyncPlaySettingsScreenState();
}

class _SyncPlaySettingsScreenState extends State<_SyncPlaySettingsScreen> {
  final _syncPlayScope = FocusScopeNode(
    debugLabel: 'SyncPlaySettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  late final PreferenceBinding<double> _minDelaySpeed;
  late final PreferenceBinding<double> _maxDelaySpeed;
  late final PreferenceBinding<double> _speedDuration;
  late final PreferenceBinding<double> _minDelaySkip;
  late final PreferenceBinding<double> _extraOffset;

  @override
  void initState() {
    super.initState();
    final store = GetIt.instance<PreferenceStore>();
    _minDelaySpeed = PreferenceBinding(
      store,
      UserPreferences.syncPlayMinDelaySpeedToSync,
    );
    _maxDelaySpeed = PreferenceBinding(
      store,
      UserPreferences.syncPlayMaxDelaySpeedToSync,
    );
    _speedDuration = PreferenceBinding(
      store,
      UserPreferences.syncPlaySpeedToSyncDuration,
    );
    _minDelaySkip = PreferenceBinding(
      store,
      UserPreferences.syncPlayMinDelaySkipToSync,
    );
    _extraOffset = PreferenceBinding(
      store,
      UserPreferences.syncPlayExtraTimeOffset,
    );
  }

  @override
  void dispose() {
    _syncPlayScope.dispose();
    _minDelaySpeed.dispose();
    _maxDelaySpeed.dispose();
    _speedDuration.dispose();
    _minDelaySkip.dispose();
    _extraOffset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = PlatformDetection.isTV ? 96.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.syncPlay)),
      body: FocusScope(
        node: _syncPlayScope,
        autofocus: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPad),
          children: [
            const _SectionHeader('Active Sessions'),
            _TvSettingsListTile(
              autofocus: true,
              leading: const Icon(Icons.group_work),
              title: Text(l10n.settingsOpenGroups),
              subtitle: Text(l10n.settingsOpenGroupsSubtitle),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const SyncPlayScreen()),
              ),
            ),
            const _SectionHeader('SyncPlay Options'),
            SwitchPreferenceTile(
              preference: UserPreferences.syncPlayEnabled,
              title: l10n.settingsSyncplayEnabled,
              subtitle: l10n.settingsSyncplayEnabledSubtitle,
              icon: Icons.groups,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.showSyncPlayButton,
              title: l10n.settingsSyncplayButton,
              subtitle: l10n.settingsSyncplayButtonSubtitle,
              icon: Icons.toggle_on,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.syncPlayAdvancedCorrectionEnabled,
              title: l10n.settingsSyncplayAdvancedCorrection,
              subtitle: l10n.settingsSyncplayAdvancedCorrectionSubtitle,
              icon: Icons.tune,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.syncPlayEnableSyncCorrection,
              title: l10n.settingsSyncplaySyncCorrection,
              subtitle: l10n.settingsSyncplaySyncCorrectionSubtitle,
              icon: Icons.sync,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.syncPlayUseSpeedToSync,
              title: l10n.settingsSyncplaySpeedToSync,
              subtitle: l10n.settingsSyncplaySpeedToSyncSubtitle,
              icon: Icons.speed,
            ),
            SwitchPreferenceTile(
              preference: UserPreferences.syncPlayUseSkipToSync,
              title: l10n.settingsSyncplaySkipToSync,
              subtitle: l10n.settingsSyncplaySkipToSyncSubtitle,
              icon: Icons.skip_next,
            ),
            _DoubleSliderTile(
              title: l10n.settingsSyncplayMinimumSpeedDelay,
              icon: Icons.timer,
              binding: _minDelaySpeed,
              min: 0,
              max: 5000,
            ),
            _DoubleSliderTile(
              title: l10n.settingsSyncplayMaximumSpeedDelay,
              icon: Icons.timer,
              binding: _maxDelaySpeed,
              min: 0,
              max: 15000,
            ),
            _DoubleSliderTile(
              title: l10n.settingsSyncplaySpeedDuration,
              icon: Icons.schedule,
              binding: _speedDuration,
              min: 100,
              max: 5000,
            ),
            _DoubleSliderTile(
              title: l10n.settingsSyncplayMinimumSkipDelay,
              icon: Icons.timer,
              binding: _minDelaySkip,
              min: 0,
              max: 15000,
            ),
            _DoubleSliderTile(
              title: l10n.settingsSyncplayExtraOffset,
              icon: Icons.schedule,
              binding: _extraOffset,
              min: -2000,
              max: 2000,
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableStringPreferenceTile extends StatefulWidget {
  final Preference<String> preference;
  final String title;
  final IconData icon;
  final String hintText;
  final Future<String?> Function()? pickPath;

  const _EditableStringPreferenceTile({
    required this.preference,
    required this.title,
    required this.icon,
    required this.hintText,
    this.pickPath,
  });

  @override
  State<_EditableStringPreferenceTile> createState() =>
      _EditableStringPreferenceTileState();
}

class _EditableStringPreferenceTileState
    extends State<_EditableStringPreferenceTile> {
  late final PreferenceBinding<String> _binding;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      widget.preference,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _binding,
      builder: (_, value, _) => _TvSettingsListTile(
        leading: Icon(widget.icon),
        title: Text(widget.title),
        subtitle: Text(_displaySubtitle(context, value)),
        onTap: () => _showEditor(context, value),
      ),
    );
  }

  String _displaySubtitle(BuildContext context, String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return AppLocalizations.of(context).notSet;
    return trimmed;
  }

  Future<void> _showEditor(BuildContext context, String current) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: current);
    final next = await showFocusRestoringDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(widget.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: widget.hintText),
            ),
            if (widget.pickPath != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () async {
                    final picked = await widget.pickPath!();
                    if (picked != null) controller.text = picked;
                  },
                  icon: const Icon(Icons.folder_open),
                  label: Text(l10n.browse),
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    controller.dispose();
    if (next == null) return;
    _binding.value = next;
  }
}

class _DoubleSliderTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final PreferenceBinding<double> binding;
  final double min;
  final double max;

  const _DoubleSliderTile({
    required this.title,
    required this.icon,
    required this.binding,
    required this.min,
    required this.max,
  });

  @override
  State<_DoubleSliderTile> createState() => _DoubleSliderTileState();
}

class _DoubleSliderTileState extends State<_DoubleSliderTile> {
  late final FocusNode _outerFocusNode;
  late final FocusNode _sliderInternalNode;
  bool _outerFocused = false;

  double get _step {
    final s = (widget.max - widget.min) / 40;
    return s <= 0 ? 1 : s;
  }

  @override
  void initState() {
    super.initState();
    _outerFocusNode = FocusNode(
      debugLabel: 'DoubleSliderOuter_${widget.title}',
    );
    _sliderInternalNode = FocusNode(
      debugLabel: 'DoubleSliderInner_${widget.title}',
      canRequestFocus: false,
      skipTraversal: true,
    );
  }

  @override
  void dispose() {
    _outerFocusNode.dispose();
    _sliderInternalNode.dispose();
    super.dispose();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) {
      node.previousFocus();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowDown) {
      node.nextFocus();
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.arrowRight) {
      final delta = key == LogicalKeyboardKey.arrowLeft ? -_step : _step;
      final current = widget.binding.value;
      final next = (current + delta).clamp(widget.min, widget.max);
      if (next != current) {
        widget.binding.value = next;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: Focus(
        focusNode: _outerFocusNode,
        onKeyEvent: _onKeyEvent,
        onFocusChange: (focused) {
          if (focused) {
            _ensureSettingsTileVisible(context);
          }
          if (_outerFocused != focused && mounted) {
            setState(() => _outerFocused = focused);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: _outerFocused
                ? AppColorScheme.onSurface
                : colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(
              (_outerFocused
                      ? ThemeRegistry.active.borders.focusBorder
                      : ThemeRegistry.active.borders.cardBorder)
                  .copyWith(width: 1),
            ),
            boxShadow: _outerFocused
                ? ThemeRegistry.active.borders.focusGlow
                : null,
          ),
          child: ListTileTheme.merge(
            textColor: _outerFocused
                ? AppColors.black.withValues(alpha: 0.87)
                : AppColorScheme.onSurface,
            iconColor: _outerFocused
                ? AppColors.black.withValues(alpha: 0.54)
                : AppColorScheme.onSurface.withValues(alpha: 0.7),
            titleTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            subtitleTextStyle: const TextStyle(fontSize: 12),
            child: ValueListenableBuilder<double>(
              valueListenable: widget.binding,
              builder: (context, value, _) {
                final iconColor = _outerFocused
                    ? AppColors.black.withValues(alpha: 0.54)
                    : AppColorScheme.onSurface.withValues(alpha: 0.78);
                return ListTile(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  leading: buildSettingsLeadingIconShell(
                    context,
                    icon: Icon(widget.icon),
                    focused: _outerFocused,
                    iconColor: iconColor,
                  ),
                  title: Text(widget.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(
                          context,
                        ).settingsMillisecondsValue(value.round()),
                        style: TextStyle(
                          color: _outerFocused
                              ? AppColors.black.withValues(alpha: 0.54)
                              : AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      Slider(
                        focusNode: _sliderInternalNode,
                        value: value.clamp(widget.min, widget.max),
                        min: widget.min,
                        max: widget.max,
                        divisions: 40,
                        onChanged: (v) => widget.binding.value = v,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavbarColorPickerTile extends StatefulWidget {
  final VoidCallback? onChanged;

  const _NavbarColorPickerTile({this.onChanged});

  @override
  State<_NavbarColorPickerTile> createState() => _NavbarColorPickerTileState();
}

class _NavbarColorPickerTileState extends State<_NavbarColorPickerTile> {
  static const _keys = OverlayColorPalette.keys;

  late final PreferenceBinding<String> _binding;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.navbarColor,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    super.dispose();
  }

  Color _swatchColor(String key) =>
      Color(OverlayColorPalette.pickerSwatches[key] ?? 0xFF6B7280);

  Color _swatchBorder(Color color) => color.computeLuminance() > 0.8
      ? AppColors.black.withValues(alpha: 0.38)
      : AppColorScheme.onSurface.withValues(alpha: 0.24);

  String _labelFor(String key, AppLocalizations l10n) =>
      OverlayColorPalette.labelFor(key, l10n);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<String>(
      valueListenable: _binding,
      builder: (context, value, _) {
        final normalized = OverlayColorPalette.normalizeKey(value);
        if (normalized != value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || _binding.value == normalized) return;
            _binding.value = normalized;
            widget.onChanged?.call();
          });
        }

        return _TvSettingsListTile(
          leading: const Icon(Icons.palette),
          title: Text(l10n.navbarColor),
          subtitle: Text(_labelFor(normalized, l10n)),
          trailing: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: _swatchColor(normalized),
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                ThemeRegistry.active.borders.chipBorder.copyWith(
                  color: _swatchBorder(_swatchColor(normalized)),
                ),
              ),
            ),
          ),
          onTap: () => _showPicker(context, normalized),
        );
      },
    );
  }

  Future<void> _showPicker(BuildContext context, String current) async {
    final l10n = AppLocalizations.of(context);
    final selectedIndex = _keys.indexWhere((e) => e == current);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    final result = await showFocusRestoringDialog<String>(
      context: context,
      useRootNavigator: false,
      builder: (ctx) {
        final closeOnce = createDialogBackCloseHandler(ctx);
        return Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: (_, event) {
            if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
            if (event is KeyDownEvent || event is KeyUpEvent) {
              closeOnce();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: SimpleDialog(
            title: Text(l10n.navbarColor),
            children: _keys.asMap().entries.map((entry) {
              final i = entry.key;
              final key = entry.value;
              final selected = key == current;
              final swatch = _swatchColor(key);
              return TvFocusHighlight(
                builder: (_, _) => ListTile(
                  autofocus: i == autofocusIndex,
                  leading: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: swatch,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        ThemeRegistry.active.borders.chipBorder.copyWith(
                          color: _swatchBorder(swatch),
                        ),
                      ),
                    ),
                  ),
                  title: Text(_labelFor(key, l10n)),
                  trailing: selected ? const Icon(Icons.check) : null,
                  onTap: () => Navigator.pop(ctx, key),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (!mounted || result == null || result == _binding.value) return;
    _binding.value = result;
    widget.onChanged?.call();
  }
}

class _ShuffleContentTypePickerTile extends StatefulWidget {
  final VoidCallback? onChanged;

  const _ShuffleContentTypePickerTile({this.onChanged});

  @override
  State<_ShuffleContentTypePickerTile> createState() =>
      _ShuffleContentTypePickerTileState();
}

class _ShuffleContentTypePickerTileState
    extends State<_ShuffleContentTypePickerTile> {
  static const _labels = <String>{'movies', 'tvshows', 'both'};
  static const _fallbackKey = 'both';

  late final PreferenceBinding<String> _binding;
  late final PreferenceBinding<bool> _showShuffleButtonBinding;
  bool _pickerOpen = false;

  @override
  void initState() {
    super.initState();
    _binding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.shuffleContentType,
    );
    _showShuffleButtonBinding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.showShuffleButton,
    );
  }

  @override
  void dispose() {
    _binding.dispose();
    _showShuffleButtonBinding.dispose();
    super.dispose();
  }

  String _normalize(String key) => _labels.contains(key) ? key : _fallbackKey;

  String _label(String key, AppLocalizations l10n) => switch (_normalize(key)) {
    'movies' => l10n.movies,
    'tvshows' => l10n.tvShows,
    'both' => l10n.settingsBoth,
    _ => l10n.settingsBoth,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: _showShuffleButtonBinding,
      builder: (context, showShuffleButton, _) {
        if (!showShuffleButton) {
          return const SizedBox.shrink();
        }

        return ValueListenableBuilder<String>(
          valueListenable: _binding,
          builder: (context, value, _) {
            final normalized = _normalize(value);
            if (normalized != value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted || _binding.value == normalized) return;
                _binding.value = normalized;
                widget.onChanged?.call();
              });
            }
            return _TvSettingsListTile(
              leading: const Icon(Icons.shuffle),
              title: Text(l10n.settingsShuffleContentTypeFilter),
              subtitle: Text(_label(normalized, l10n)),
              onTap: () => _showPicker(context, normalized),
            );
          },
        );
      },
    );
  }

  Future<void> _showPicker(BuildContext context, String current) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final l10n = AppLocalizations.of(context);
    final entries = _labels.toList();
    final normalizedCurrent = _normalize(current);
    final selectedIndex = entries.indexWhere((e) => e == normalizedCurrent);
    final autofocusIndex = selectedIndex >= 0 ? selectedIndex : 0;
    try {
      final result = await showFocusRestoringDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (ctx) {
          final closeOnce = createDialogBackCloseHandler(ctx);
          return Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onKeyEvent: (_, event) {
              if (!event.logicalKey.isBackKey) return KeyEventResult.ignored;
              if (event is KeyDownEvent || event is KeyUpEvent) {
                closeOnce();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: FocusScope(
              autofocus: true,
              child: SimpleDialog(
                title: Text(l10n.settingsShuffleContentTypeFilter),
                children: entries.asMap().entries.map((entry) {
                  final i = entry.key;
                  final value = entry.value;
                  final selected = value == normalizedCurrent;
                  return TvFocusHighlight(
                    builder: (_, _) => ListTile(
                      autofocus: i == autofocusIndex,
                      title: Text(_label(value, l10n)),
                      trailing: selected ? const Icon(Icons.check) : null,
                      onTap: () => Navigator.pop(ctx, value),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );

      if (!mounted || result == null || result == _binding.value) return;
      _binding.value = result;
      widget.onChanged?.call();
    } finally {
      _pickerOpen = false;
    }
  }
}
