part of '../settings_side_panel.dart';

class _LibrariesCategoryScreen extends StatelessWidget {
  const _LibrariesCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.libraries)),
      body: ListView(
        children: [
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                leading: const Icon(Icons.visibility),
                title: Text(l10n.libraryVisibility),
                subtitle: Text(l10n.settingsLibraryVisibilitySubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const LibraryVisibilityScreen()),
              ),
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
                preference: UserPreferences.groupItemsIntoCollections,
                title: l10n.groupItemsIntoCollections,
                subtitle: l10n.hideCollectionAssociatedItems,
                icon: Icons.collections_bookmark,
                onChanged: () async {
                  _pushPersonalizationSync();
                  final prefs = GetIt.instance<PreferenceStore>();
                  final isEnabled = prefs.get(UserPreferences.groupItemsIntoCollections);
                  if (isEnabled) {
                    final client = GetIt.instance<MediaServerClient>();
                    try {
                      final config =
                          await client.adminSystemApi.getServerConfiguration();
                      final groupMovies =
                          (config['EnableGroupingMoviesIntoCollections'] as bool?) ??
                          (config['EnableGroupingIntoCollections'] as bool?) ??
                          false;
                      final groupShows =
                          (config['EnableGroupingShowsIntoCollections'] as bool?) ??
                          (config['EnableGroupingIntoCollections'] as bool?) ??
                          false;
                      if (groupMovies && groupShows) {
                        return;
                      }
                    } catch (_) {}

                    if (!context.mounted) return;
                    showFocusRestoringDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: Text(l10n.groupItemsIntoCollectionsDialogTitle),
                        content: Text(l10n.groupItemsIntoCollectionsDialogMessage),
                        actions: [
                          TextButton(
                            autofocus: true,
                            onPressed: () => Navigator.pop(dialogContext),
                            child: Text(l10n.ok),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.showMediaDetailsOnLibraryPage,
                title: l10n.showMediaDetailsOnLibraryPage,
                subtitle: l10n.showMediaDetailsOnLibraryPageDescription,
                icon: Icons.info_outline,
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
        ],
      ),
    );
  }
}
