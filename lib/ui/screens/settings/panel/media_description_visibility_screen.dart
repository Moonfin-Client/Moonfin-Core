part of '../settings_side_panel.dart';

/// Screen allowing users to toggle media description visibility across various
/// local and Seerr detail pages.
class _MediaDescriptionVisibilityScreen extends StatelessWidget {
  const _MediaDescriptionVisibilityScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final syncService = GetIt.instance<PluginSyncService>();
    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(
            context,
            Text(l10n.mediaDescriptionVisibilityTitle),
          ),
          body: ListenableBuilder(
            listenable: syncService,
            builder: (context, _) {
              final showSeerr = syncService.seerrAvailable;
              return ListView(
                children: [
                  _SectionHeader(l10n.localContent),
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
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionBook,
                    title: l10n.hideMediaDescriptionBook,
                    subtitle: l10n.hideMediaDescriptionBookSubtitle,
                    icon: Icons.menu_book_outlined,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionPerson,
                    title: l10n.hideMediaDescriptionPerson,
                    subtitle: l10n.hideMediaDescriptionPersonSubtitle,
                    icon: Icons.person_outline,
                    onChanged: _pushPersonalizationSync,
                  ),
                  SwitchPreferenceTile(
                    preference:
                        UserPreferences.hideDetailsMediaDescriptionMusic,
                    title: l10n.hideMediaDescriptionMusic,
                    subtitle: l10n.hideMediaDescriptionMusicSubtitle,
                    icon: Icons.music_note_outlined,
                    onChanged: _pushPersonalizationSync,
                  ),
                ],
              ),
              if (showSeerr) ...[
                _SectionHeader(l10n.seerrContent),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference:
                          UserPreferences.hideDetailsMediaDescriptionSeerrMovie,
                      title: l10n.hideMediaDescriptionSeerrMovie,
                      subtitle: l10n.hideMediaDescriptionSeerrMovieSubtitle,
                      icon: Icons.movie_outlined,
                      onChanged: _pushPersonalizationSync,
                    ),
                    SwitchPreferenceTile(
                      preference:
                          UserPreferences.hideDetailsMediaDescriptionSeerrShow,
                      title: l10n.hideMediaDescriptionSeerrShow,
                      subtitle: l10n.hideMediaDescriptionSeerrShowSubtitle,
                      icon: Icons.tv,
                      onChanged: _pushPersonalizationSync,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences
                          .hideDetailsMediaDescriptionSeerrCollection,
                      title: l10n.hideMediaDescriptionSeerrCollection,
                      subtitle:
                          l10n.hideMediaDescriptionSeerrCollectionSubtitle,
                      icon: Icons.collections_bookmark_outlined,
                      onChanged: _pushPersonalizationSync,
                    ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    ),
  ),
);
  }
}
