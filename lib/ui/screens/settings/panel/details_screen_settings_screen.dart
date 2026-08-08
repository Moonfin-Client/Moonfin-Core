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
    final bottomPad = PlatformDetection.isTV ? 96.0 : 24.0;
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.settingsDetailsScreen)),
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
                    autofocus: true,
                    preference: UserPreferences.detailScreenStyle,
                    title: l10n.detailScreenStyle,
                    description: l10n.detailScreenStyleSubtitle,
                    icon: Icons.movie_outlined,
                    labelOf: (v) => switch (v) {
                      DetailScreenStyle.classic =>
                        l10n.detailScreenStyleMoonfin,
                      DetailScreenStyle.modern => l10n.detailScreenStyleModern,
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
                  if (prefs.get(UserPreferences.detailScreenStyle) != DetailScreenStyle.modern)
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
                ],
              ),
              _SectionHeader(l10n.mediaDetailsAndSpoilers),
              adaptiveListSection(
                children: [
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
                      RecommendationSystemSource.online =>
                        l10n.recommendationSystemTmdb,
                    },
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference: UserPreferences.recommendationsApplyParentalRatingCap,
                    title: l10n.recommendationsApplyParentalRatingCap,
                    subtitle: l10n.recommendationsApplyParentalRatingCapSubtitle,
                    icon: Icons.family_restroom,
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
