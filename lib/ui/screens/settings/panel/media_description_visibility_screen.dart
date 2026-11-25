part of '../settings_side_panel.dart';

/// Screen allowing users to toggle media description visibility across video
/// detail pages.
class _MediaDescriptionVisibilityScreen extends StatelessWidget {
  const _MediaDescriptionVisibilityScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(
            context,
            Text(l10n.mediaDescriptionVisibilityTitle),
          ),
          body: ListView(
            children: [
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionMovie,
                    title: l10n.hideMediaDescriptionMovie,
                    subtitle: l10n.hideMediaDescriptionMovieSubtitle,
                    icon: Icons.movie_outlined,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionShow,
                    title: l10n.hideMediaDescriptionShow,
                    subtitle: l10n.hideMediaDescriptionShowSubtitle,
                    icon: Icons.tv,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionSeason,
                    title: l10n.hideMediaDescriptionSeason,
                    subtitle: l10n.hideMediaDescriptionSeasonSubtitle,
                    icon: Icons.video_library_outlined,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionEpisode,
                    title: l10n.hideMediaDescriptionEpisode,
                    subtitle: l10n.hideMediaDescriptionEpisodeSubtitle,
                    icon: Icons.play_circle_outline,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionBoxSet,
                    title: l10n.hideMediaDescriptionBoxSet,
                    subtitle: l10n.hideMediaDescriptionBoxSetSubtitle,
                    icon: Icons.collections_bookmark_outlined,
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
