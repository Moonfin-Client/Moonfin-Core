part of '../settings_side_panel.dart';

class _AppearanceScreen extends StatefulWidget {
  const _AppearanceScreen();

  @override
  State<_AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<_AppearanceScreen> {
  final _appearanceScope = FocusScopeNode(
    debugLabel: 'AppearanceSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _appearanceScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad =
        (PlatformDetection.isTV ? 96.0 : 24.0) +
        MediaQuery.paddingOf(context).bottom;
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.appearance)),
      body: FocusScope(
        node: _appearanceScope,
        // Rebuild on preference changes so the Glass Quality tile appears or
        // disappears the moment the glass theme is selected or replaced.
        child: ListenableBuilder(
          listenable: GetIt.instance<UserPreferences>(),
          builder: (context, _) => ListView(
            padding: EdgeInsets.only(bottom: bottomPad),
            children: [
              _SectionHeader(l10n.navigation),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    autofocus: true,
                    leading: const Icon(Icons.view_sidebar),
                    title: Text(l10n.navigationBar),
                    subtitle: Text(l10n.navbarStyleToolbarAppearance),
                    onTap: () => context.pushSettingsScreen(
                      const _NavigationCategoryScreen(),
                    ),
                  ),
                  if (GamepadNavigationScope.isConfigurable)
                    SwitchPreferenceTile(
                      preference: UserPreferences.gamepadNavigationEnabled,
                      title: l10n.gamepadNavigation,
                      subtitle: l10n.gamepadNavigationDescription,
                      icon: Icons.sports_esports_outlined,
                    ),
                ],
              ),
              _SectionHeader(l10n.layout),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.home),
                    title: Text(l10n.homeScreen),
                    subtitle: Text(l10n.settingsHomeScreenSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _HomeScreenCategoryScreen(),
                    ),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.video_library),
                    title: Text(l10n.libraries),
                    subtitle: Text(l10n.settingsLibrariesEntrySubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _LibrariesCategoryScreen(),
                    ),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.article_outlined),
                    title: Text(l10n.detailsPage),
                    subtitle: Text(l10n.settingsDetailsPageSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const _DetailsScreenSettingsScreen(),
                    ),
                  ),
                ],
              ),
              _SectionHeader(l10n.theme),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<InterfaceStyle>(
                    preference: UserPreferences.interfaceStyle,
                    title: l10n.interfaceStyle,
                    description: l10n.interfaceStyleSubtitle,
                    icon: Icons.devices_outlined,
                    labelOf: (v) => switch (v) {
                      InterfaceStyle.automatic => l10n.interfaceStyleAutomatic,
                      InterfaceStyle.apple => l10n.interfaceStyleApple,
                      InterfaceStyle.material => l10n.interfaceStyleMaterial,
                    },
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.palette_outlined),
                    title: Text(l10n.settingsAppearanceTheme),
                    subtitle: Text(l10n.settingsAppearanceThemeSubtitle),
                    onTap: () => context.pushSettingsScreen(
                      const AppearanceThemeScreen(),
                    ),
                  ),
                  if (AppColorScheme.isGlass)
                    EnumPreferenceTile<GlassQualityMode>(
                      preference: UserPreferences.glassQuality,
                      title: l10n.glassQuality,
                      description: l10n.glassQualitySubtitle,
                      icon: Icons.blur_on,
                      labelOf: (v) => switch (v) {
                        GlassQualityMode.auto => l10n.glassQualityAuto,
                        GlassQualityMode.full => l10n.glassQualityFull,
                        GlassQualityMode.reduced => l10n.glassQualityReduced,
                      },
                    ),
                  EnumPreferenceTile<AppTheme>(
                    preference: UserPreferences.focusColor,
                    title: l10n.focusBorderColor,
                    icon: Icons.border_color,
                    labelOf: (v) => _formatCamelCaseLabel(v.name),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.storefront_outlined),
                    title: Text(l10n.themeStore),
                    subtitle: Text(l10n.themeStoreSubtitle),
                    onTap: () =>
                        context.pushSettingsScreen(const ThemeStoreScreen()),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.download_outlined),
                    title: Text(l10n.savedThemesTitle),
                    subtitle: Text(l10n.savedThemesManageSubtitle),
                    onTap: () =>
                        context.pushSettingsScreen(const SavedThemesScreen()),
                  ),
                  if (_showThemeEditorEntry)
                    _TvSettingsListTile(
                      leading: const Icon(Icons.brush),
                      title: Text(l10n.themeEditor),
                      subtitle: Text(l10n.themeEditorSubtitle),
                      onTap: () => unawaited(_openThemeEditor(context)),
                    ),
                ],
              ),
              _SectionHeader(l10n.display),
              if (!PlatformDetection.useMobileUi)
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference: UserPreferences.cardFocusExpansion,
                      title: l10n.focusExpansionAnimation,
                      subtitle: l10n.scaleFocusedCards,
                      icon: Icons.zoom_in,
                    ),
                  ],
                ),
              adaptiveListSection(
                children: [
                  if (PlatformDetection.canOverrideInterfaceLayout)
                    EnumPreferenceTile<InterfaceLayout>(
                      preference: UserPreferences.interfaceLayout,
                      title: l10n.interfaceLayout,
                      description: l10n.interfaceLayoutSubtitle,
                      icon: Icons.tv_outlined,
                      // Only the layouts this platform reaches on its own,
                      // since the other pairings have never run.
                      values: [
                        InterfaceLayout.automatic,
                        InterfaceLayout.tv,
                        if (PlatformDetection.isDesktop)
                          InterfaceLayout.desktop,
                        if (PlatformDetection.isAndroid) InterfaceLayout.phone,
                      ],
                      labelOf: (v) => switch (v) {
                        InterfaceLayout.automatic =>
                          l10n.interfaceLayoutAutomatic,
                        InterfaceLayout.tv => l10n.interfaceLayoutTv,
                        InterfaceLayout.desktop => l10n.interfaceLayoutDesktop,
                        InterfaceLayout.phone => l10n.interfaceLayoutPhone,
                      },
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
                      DesktopUiScale.grandparents => l10n.uiScaleGrandparents,
                      DesktopUiScale.greatGrandparents =>
                        l10n.uiScaleGreatGrandparents,
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
                  EnumPreferenceTile<OledMode>(
                    preference: UserPreferences.oledMode,
                    title: l10n.oledMode,
                    description: l10n.oledModeSubtitle,
                    icon: Icons.contrast,
                    labelOf: (v) => switch (v) {
                      OledMode.off => l10n.off,
                      OledMode.subtle => l10n.oledModeSubtle,
                      OledMode.vivid => l10n.oledModeVivid,
                    },
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
                  EnumPreferenceTile<WatchedIndicatorBehavior>(
                    preference: UserPreferences.watchedIndicatorBehavior,
                    title: l10n.watchedIndicators,
                    icon: Icons.check_circle,
                    labelOf: (v) => switch (v) {
                      WatchedIndicatorBehavior.always => l10n.always,
                      WatchedIndicatorBehavior.hideUnwatched =>
                        l10n.hideUnwatched,
                      WatchedIndicatorBehavior.episodesOnly =>
                        l10n.episodesOnly,
                      WatchedIndicatorBehavior.never => l10n.never,
                    },
                  ),
                ],
              ),
              if (!PlatformDetection.useMobileUi) ...[
                _SectionHeader(l10n.settingsMotionSection),
                adaptiveListSection(
                  children: [
                    EnumPreferenceTile<PageTransitionSpeed>(
                      preference: UserPreferences.pageTransitionSpeed,
                      title: l10n.pageTransitions,
                      description: l10n.pageTransitionsSubtitle,
                      icon: Icons.animation_outlined,
                      labelOf: (v) => switch (v) {
                        PageTransitionSpeed.slow => l10n.pageTransitionFadeLong,
                        PageTransitionSpeed.medium => l10n.pageTransitionFadeMedium,
                        PageTransitionSpeed.fast => l10n.pageTransitionFadeShort,
                        PageTransitionSpeed.off => l10n.pageTransitionFadeNone,
                      },
                    ),
                    EnumPreferenceTile<NavigationAnimationSpeed>(
                      preference: UserPreferences.navigationAnimationSpeed,
                      title: l10n.navigationSpeed,
                      description: l10n.navigationSpeedSubtitle,
                      icon: Icons.speed_outlined,
                      labelOf: (v) => switch (v) {
                        NavigationAnimationSpeed.extraSlow =>
                          l10n.animationSpeedExtraSlow,
                        NavigationAnimationSpeed.slow =>
                          l10n.animationSpeedSlow,
                        NavigationAnimationSpeed.medium =>
                          l10n.animationSpeedMedium,
                        NavigationAnimationSpeed.fast =>
                          l10n.animationSpeedFast,
                      },
                    ),
                  ],
                ),
              ],
              _SectionHeader(l10n.extras),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.auto_awesome),
                    title: Text(l10n.seasonalEffects),
                    subtitle: Text(l10n.seasonalEffectsDescription),
                    onTap: () => context.pushSettingsScreen(
                      const _SeasonalEffectsScreen(),
                    ),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.motion_photos_on_outlined),
                    title: Text(l10n.loadingAnimation),
                    subtitle: Text(l10n.loadingAnimationDescription),
                    onTap: () => context.pushSettingsScreen(
                      const _LoadingAnimationScreen(),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
