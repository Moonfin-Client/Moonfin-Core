part of '../settings_side_panel.dart';

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
        // Rebuild on preference changes so the Glass Quality tile appears or
        // disappears the moment the glass theme is selected or replaced.
        child: ListenableBuilder(
          listenable: GetIt.instance<UserPreferences>(),
          builder: (context, _) => ListView(
            padding: EdgeInsets.only(bottom: bottomPad),
            children: [
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<InterfaceStyle>(
                    autofocus: true,
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
                  EnumPreferenceTile<DetailScreenStyle>(
                    preference: UserPreferences.detailScreenStyle,
                    title: l10n.detailScreenStyle,
                    description: l10n.detailScreenStyleSubtitle,
                    icon: Icons.movie_outlined,
                    labelOf: (v) => switch (v) {
                      DetailScreenStyle.moonfin =>
                        l10n.detailScreenStyleMoonfin,
                      DetailScreenStyle.modern => l10n.detailScreenStyleModern,
                    },
                  ),
                  EnumPreferenceTile<AppTheme>(
                    preference: UserPreferences.focusColor,
                    title: l10n.focusBorderColor,
                    icon: Icons.border_color,
                    labelOf: (v) => _formatCamelCaseLabel(v.name),
                  ),
                ],
              ),
              if (PlatformDetection.isTV)
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference: UserPreferences.preferSystemImeKeyboard,
                      title: l10n.keyboardPreferSystemIme,
                      subtitle: l10n.keyboardPreferSystemImeDescription,
                      icon: Icons.keyboard_alt_outlined,
                    ),
                  ],
                ),
              adaptiveListSection(
                children: [
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
                ],
              ),
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
                      WatchedIndicatorBehavior.hideUnwatched =>
                        l10n.hideUnwatched,
                      WatchedIndicatorBehavior.episodesOnly =>
                        l10n.episodesOnly,
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
            ],
          ),
        ),
      ),
    );
  }
}
