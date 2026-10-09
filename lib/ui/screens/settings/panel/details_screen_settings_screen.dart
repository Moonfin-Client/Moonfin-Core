part of '../settings_side_panel.dart';

class _DetailsScreenSettingsScreen extends StatefulWidget {
  const _DetailsScreenSettingsScreen();

  @override
  State<_DetailsScreenSettingsScreen> createState() =>
      _DetailsScreenSettingsScreenState();
}

class _DetailsScreenSettingsScreenState
    extends State<_DetailsScreenSettingsScreen> {
  final _detailsScreenScope = FocusScopeNode(
    debugLabel: 'DetailsScreenSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );

  @override
  void dispose() {
    _detailsScreenScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad =
        (PlatformDetection.isTV ? 96.0 : 24.0) +
        MediaQuery.paddingOf(context).bottom;
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.detailsPage)),
      body: FocusScope(
        node: _detailsScreenScope,
        child: ListenableBuilder(
          listenable: prefs,
          builder: (context, _) => ListView(
            padding: EdgeInsets.only(bottom: bottomPad),
            children: [
              _SectionHeader(l10n.display),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<DetailScreenStyle>(
                    key: const ValueKey('pref_detail_screen_style'),
                    autofocus: true,
                    preference: UserPreferences.detailScreenStyle,
                    title: l10n.detailScreenStyle,
                    description: l10n.detailScreenStyleSubtitle,
                    icon: Icons.movie_outlined,
                    labelOf: (v) => switch (v) {
                      DetailScreenStyle.classic =>
                        l10n.detailScreenStyleMoonfin,
                      DetailScreenStyle.modern =>
                        l10n.detailScreenStyleModern,
                      DetailScreenStyle.spotlight =>
                        l10n.detailScreenStyleSpotlight,
                      DetailScreenStyle.nouveau =>
                        l10n.detailScreenStyleNouveau,
                      DetailScreenStyle.minimalist =>
                        l10n.detailScreenStyleMinimalist,
                    },
                  ),
                  EnumPreferenceTile<PersonalRatingStyle>(
                    preference: UserPreferences.personalRatingStyle,
                    title: l10n.personalRatingStyle,
                    icon: Icons.rate_review,
                    values: GetIt.instance<MediaServerClient>()
                            .userLibraryApi
                            .supportsNumericUserRatings
                        ? PersonalRatingStyle.values
                        : const [PersonalRatingStyle.thumbs],
                    labelOf: (style) => switch (style) {
                      PersonalRatingStyle.thumbs => l10n.personalRatingThumbs,
                      PersonalRatingStyle.stars => l10n.personalRatingStars,
                      PersonalRatingStyle.numeric => l10n.personalRatingNumeric,
                    },
                  ),
                  if (prefs.get(UserPreferences.detailScreenStyle) == DetailScreenStyle.classic)
                    SliderPreferenceTile(
                      preference: UserPreferences.detailsBackgroundBlurAmount,
                      title: l10n.detailsBackgroundBlur,
                      icon: Icons.blur_on,
                      min: 0,
                      max: 25,
                      divisions: 25,
                      labelOf: (v) => '$v',
                      onChangeEnd: _pushPersonalizationSync,
                    )
                  else
                    SliderPreferenceTile(
                      preference: UserPreferences.detailsBackgroundBlurAmount,
                      title: l10n.detailsBackgroundOpacity,
                      icon: Icons.opacity,
                      min: 0,
                      max: 25,
                      divisions: 25,
                      labelOf: (v) => '$v',
                      onChangeEnd: _pushPersonalizationSync,
                    ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.smart_button_outlined),
                    title: Text(l10n.detailButtons),
                    subtitle: Text(l10n.detailButtonsDescription),
                    onTap: () => context.pushSettingsScreen(
                      const _DetailButtonsScreen(),
                    ),
                  ),
                  IntPickerPreferenceTile(
                    preference: UserPreferences.detailButtonsMaxVisible,
                    title: l10n.actionButtonsOnScreen,
                    description: l10n.actionButtonsOnScreenDescription,
                    icon: Icons.more_horiz,
                    options: {
                      0: l10n.actionButtonsOnScreenAuto,
                      1: l10n.actionButtonsOnScreenPlayOnly,
                      2: '2',
                      3: '3',
                      4: '4',
                      5: '5',
                      6: '6',
                      7: '7',
                      8: '8',
                      9: '9',
                      10: '10',
                      -1: l10n.actionButtonsOnScreenAll,
                    },
                  ),
                ],
              ),
              _SectionHeader(l10n.mediaDetailsAndSpoilers),
              adaptiveListSection(
                children: [
                  _TvSettingsListTile(
                    leading: const Icon(Icons.view_headline_outlined),
                    title: Text(l10n.detailMetadata),
                    subtitle: Text(l10n.detailMetadataDescription),
                    onTap: () => context.pushSettingsScreen(
                      const _DetailMetadataScreen(),
                    ),
                  ),
                  _TvSettingsListTile(
                    leading: const Icon(Icons.dashboard_customize_outlined),
                    title: Text(l10n.detailSections),
                    subtitle: Text(l10n.detailSectionsDescription),
                    onTap: () => context.pushSettingsScreen(
                      const _DetailSectionsScreen(),
                    ),
                  ),
                  if (prefs.get(UserPreferences.detailScreenStyle) == DetailScreenStyle.modern)
                    SwitchPreferenceTile(
                      preference: UserPreferences.detailExpandedTabs,
                      title: l10n.expandedTabs,
                      subtitle: l10n.expandedTabsSubtitle,
                      icon: Icons.tab,
                      onChanged: _pushPersonalizationSync,
                    ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.detailShowTechnicalDetails,
                    title: l10n.showTechnicalDetails,
                    subtitle: l10n.showTechnicalDetailsSubtitle,
                    icon: Icons.info_outline,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.detailTrailersExternal,
                    title: l10n.openTrailersExternally,
                    subtitle: l10n.openTrailersExternallySubtitle,
                    icon: Icons.open_in_new,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.hideDetailsMediaDescription,
                    title: l10n.hideDetailsMediaDescription,
                    subtitle: l10n.hideDetailsMediaDescriptionSubtitle,
                    icon: Icons.description_outlined,
                    onChanged: _pushPersonalizationSync,
                  ),
                  if (prefs.get(UserPreferences.detailScreenStyle) == DetailScreenStyle.classic)
                    SwitchPreferenceTile(
                      preference: UserPreferences.detailUseSeriesThumbnails,
                      title: l10n.detailUseSeriesThumbnails,
                      subtitle: l10n.detailUseSeriesThumbnailsSubtitle,
                      icon: Icons.image_outlined,
                      onChanged: _pushPersonalizationSync,
                    ),
                ],
              ),
              _SectionHeader(l10n.recommendations),
              adaptiveListSection(
                children: [
                  EnumPreferenceTile<RecommendationSystemSource>(
                    preference: UserPreferences.recommendationSystemSource,
                    title: l10n.recommendationSystem,
                    description: l10n.recommendationSystemSubtitle,
                    icon: Icons.auto_awesome,
                    labelOf: (v) => switch (v) {
                      RecommendationSystemSource.local =>
                        l10n.recommendationSystemMoonfin,
                      RecommendationSystemSource.server =>
                        l10n.recommendationSystemJellyfin,
                      RecommendationSystemSource.online =>
                        l10n.recommendationSystemTmdb,
                    },
                    onChanged: _pushPersonalizationSync,
                  ),
                ],
              ),
              _SectionHeader(l10n.ratings),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
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
              _SectionHeader(l10n.themeMusic),
              adaptiveListSection(
                children: [
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
                  if (!PlatformDetection.isMobile)
                    SwitchPreferenceTile(
                      preference: UserPreferences.themeMusicOnHomeRows,
                      title: l10n.themeMusicOnHomeRows,
                      subtitle: l10n.playWhenBrowsingHomeScreen,
                      icon: Icons.queue_music,
                      onChanged: _pushPersonalizationSync,
                    ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.themeMusicLoop,
                    title: l10n.loopThemeMusic,
                    subtitle: l10n.loopThemeMusicSubtitle,
                    icon: Icons.repeat,
                    onChanged: _pushPersonalizationSync,
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
