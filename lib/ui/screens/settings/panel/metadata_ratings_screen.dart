part of '../settings_side_panel.dart';

class _MetadataRatingsScreen extends StatefulWidget {
  const _MetadataRatingsScreen();

  @override
  State<_MetadataRatingsScreen> createState() => _MetadataRatingsScreenState();
}

class _MetadataRatingsScreenState extends State<_MetadataRatingsScreen> {
  final _metadataScope = FocusScopeNode(
    debugLabel: 'MetadataRatingsSettingsScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.stop,
  );
  final _additionalRatingsFocusNode = FocusNode(
    debugLabel: 'additional_ratings',
  );

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
            targetNode: PlatformDetection.isTV
                ? _additionalRatingsFocusNode
                : null,
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
                    adaptiveListSection(
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
                          onTap: () => context.pushSettingsScreen(
                            const RatingsConfigScreen(),
                          ),
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
