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
          _SectionHeader(l10n.general),
          adaptiveListSection(
            children: [
              _TvSettingsListTile(
                leading: const Icon(Icons.visibility),
                title: Text(l10n.libraryVisibility),
                subtitle: Text(l10n.settingsLibraryVisibilitySubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const LibraryVisibilityScreen()),
              ),
              _TvSettingsListTile(
                leading: const Icon(Icons.swap_vert),
                title: Text(l10n.libraryOrder),
                subtitle: Text(l10n.libraryOrderSubtitle),
                onTap: () =>
                    context.pushSettingsScreen(const LibraryOrderScreen()),
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.enableMultiServerLibraries,
                title: l10n.multiServerLibraries,
                subtitle: l10n.showLibrariesFromAllServers,
                icon: Icons.dns,
                onChanged: _pushPersonalizationSync,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.showBookDiscoverTab,
                title: l10n.showBookDiscoverTab,
                subtitle: l10n.showBookDiscoverTabDescription,
                icon: Icons.explore,
                onChanged: _pushPersonalizationSync,
              ),
            ],
          ),
          _SectionHeader(l10n.libraryView),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<LibraryStyle>(
                key: const ValueKey('pref_library_style'),
                preference: UserPreferences.libraryStyle,
                title: l10n.libraryStyle,
                description: PlatformDetection.useMobileUi
                    ? l10n.libraryStyleDescriptionPhone
                    : l10n.libraryStyleDescription,
                icon: Icons.view_sidebar_outlined,
                labelOf: (v) => switch (v) {
                  LibraryStyle.classic => l10n.libraryStyleClassic,
                  LibraryStyle.modern => l10n.libraryStyleModern,
                  LibraryStyle.docked => l10n.libraryStyleDocked,
                },
                onChanged: _pushPersonalizationSync,
              ),
              EnumPreferenceTile<BookLibraryStyle>(
                key: const ValueKey('pref_book_library_style'),
                preference: UserPreferences.bookLibraryStyle,
                title: l10n.bookLibraryStyle,
                description: l10n.bookLibraryStyleDescription,
                icon: Icons.auto_stories_outlined,
                labelOf: (v) => switch (v) {
                  BookLibraryStyle.classic => l10n.bookLibraryStyleClassic,
                  BookLibraryStyle.readingRoom =>
                    l10n.bookLibraryStyleReadingRoom,
                  BookLibraryStyle.bookstore => l10n.bookLibraryStyleBookstore,
                },
                onChanged: _pushPersonalizationSync,
              ),
              EnumPreferenceTile<MusicLibraryStyle>(
                key: const ValueKey('pref_music_library_style'),
                preference: UserPreferences.musicLibraryStyle,
                title: l10n.musicLibraryStyle,
                description: l10n.musicLibraryStyleDescription,
                icon: Icons.library_music_outlined,
                labelOf: (v) => switch (v) {
                  MusicLibraryStyle.classic => l10n.musicLibraryStyleClassic,
                  MusicLibraryStyle.quickAccess =>
                    l10n.musicLibraryStyleQuickAccess,
                  MusicLibraryStyle.immersive => l10n.musicLibraryStyleImmersive,
                },
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
                preference: UserPreferences.libraryCardTitles,
                title: l10n.libraryCardTitles,
                subtitle: l10n.libraryCardTitlesDescription,
                icon: Icons.title,
                onChanged: _pushPersonalizationSync,
              ),
              SwitchPreferenceTile(
                preference: UserPreferences.hideBackdropsInLibraries,
                title: l10n.libraryBackdrops,
                icon: Icons.photo,
                inverted: true,
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
