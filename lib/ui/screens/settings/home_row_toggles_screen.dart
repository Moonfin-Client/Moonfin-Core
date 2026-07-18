import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../home/home_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import 'home_sections_screen.dart';
import 'settings_app_bar.dart';

class HomeRowTogglesScreen extends StatefulWidget {
  const HomeRowTogglesScreen({super.key});

  @override
  State<HomeRowTogglesScreen> createState() => _HomeRowTogglesScreenState();
}

class _HomeRowTogglesScreenState extends State<HomeRowTogglesScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  late final PluginSyncService _syncService;
  bool _navigating = false;
  bool _buttonFocused = false;

  void _pushHomeSectionsScreen(BuildContext context) {
    if (_navigating) return;
    _navigating = true;
    context
        .pushSettingsScreen(const HomeSectionsScreen(showGeneralOptions: false))
        .then((_) {
          if (mounted) {
            setState(() => _navigating = false);
          }
        });
  }

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _syncService.addListener(_onSyncChanged);
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncChanged);
    super.dispose();
  }

  void _onSyncChanged() {
    if (mounted) setState(() {});
  }

  void _pushPersonalizationSync() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  void _reloadHomeRows() {
    if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
    GetIt.instance<HomeViewModel>().load(preserveExisting: false);
  }

  void _onFavoritesRowsToggleChanged() {
    _pushPersonalizationSync();
    if (!mounted) return;
    setState(() {});
  }

  void _onCollectionsRowsToggleChanged() {
    _pushPersonalizationSync();
    if (!mounted) return;
    setState(() {});
  }

  void _onGenresRowsToggleChanged() {
    _pushPersonalizationSync();
    if (!mounted) return;
    setState(() {});
  }

  void _onFavoritesSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onCollectionsSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onGenresSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onGenresItemFilterChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onPlaylistsRowsToggleChanged() {
    _pushPersonalizationSync();
    if (!mounted) return;
    setState(() {});
  }

  void _onAudioRowsToggleChanged() {
    _pushPersonalizationSync();
    if (!mounted) return;
    setState(() {});
  }

  void _onPlaylistsSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onAudioSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  bool _getSinceYouWatchedLocalPrefEnabled(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.sinceYouWatched1 => _prefs.get(UserPreferences.sinceYouWatched1Enabled),
      HomeSectionType.sinceYouWatched2 => _prefs.get(UserPreferences.sinceYouWatched2Enabled),
      HomeSectionType.sinceYouWatched3 => _prefs.get(UserPreferences.sinceYouWatched3Enabled),
      HomeSectionType.sinceYouWatched4 => _prefs.get(UserPreferences.sinceYouWatched4Enabled),
      HomeSectionType.sinceYouWatched5 => _prefs.get(UserPreferences.sinceYouWatched5Enabled),
      _ => false,
    };
  }

  void _updateSinceYouWatchedPrefs() {
    final showSinceYouWatched = _prefs.get(UserPreferences.displaySinceYouWatchedRows);
    final sinceYouWatchedNum = _prefs.get(UserPreferences.sinceYouWatchedNumRows).value;

    _prefs.set(UserPreferences.sinceYouWatched1Enabled, showSinceYouWatched && sinceYouWatchedNum >= 1);
    _prefs.set(UserPreferences.sinceYouWatched2Enabled, showSinceYouWatched && sinceYouWatchedNum >= 2);
    _prefs.set(UserPreferences.sinceYouWatched3Enabled, showSinceYouWatched && sinceYouWatchedNum >= 3);
    _prefs.set(UserPreferences.sinceYouWatched4Enabled, showSinceYouWatched && sinceYouWatchedNum >= 4);
    _prefs.set(UserPreferences.sinceYouWatched5Enabled, showSinceYouWatched && sinceYouWatchedNum >= 5);
  }

  void _onSinceYouWatchedRowsToggleChanged() {
    _updateSinceYouWatchedPrefs();
    final configs = List<HomeSectionConfig>.from(_prefs.homeSectionsConfig);
    var changed = false;
    final types = {
      HomeSectionType.sinceYouWatched1,
      HomeSectionType.sinceYouWatched2,
      HomeSectionType.sinceYouWatched3,
      HomeSectionType.sinceYouWatched4,
      HomeSectionType.sinceYouWatched5,
    };
    for (var i = 0; i < configs.length; i++) {
      if (types.contains(configs[i].type)) {
        final isEnabled = _getSinceYouWatchedLocalPrefEnabled(configs[i].type);
        if (configs[i].enabled != isEnabled) {
          configs[i] = configs[i].copyWith(enabled: isEnabled);
          changed = true;
        }
      }
    }
    if (changed) {
      _prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
    _reloadHomeRows();
    if (!mounted) return;
    setState(() {});
  }

  void _onSinceYouWatchedConfigChanged() {
    _updateSinceYouWatchedPrefs();
    final configs = List<HomeSectionConfig>.from(_prefs.homeSectionsConfig);
    var changed = false;
    final types = {
      HomeSectionType.sinceYouWatched1,
      HomeSectionType.sinceYouWatched2,
      HomeSectionType.sinceYouWatched3,
      HomeSectionType.sinceYouWatched4,
      HomeSectionType.sinceYouWatched5,
    };
    for (var i = 0; i < configs.length; i++) {
      if (types.contains(configs[i].type)) {
        final isEnabled = _getSinceYouWatchedLocalPrefEnabled(configs[i].type);
        if (configs[i].enabled != isEnabled) {
          configs[i] = configs[i].copyWith(enabled: isEnabled);
          changed = true;
        }
      }
    }
    if (changed) {
      _prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onRewatchRowToggleChanged() {
    final enabled = _prefs.get(UserPreferences.displayRewatchRow);
    final configs = List<HomeSectionConfig>.from(_prefs.homeSectionsConfig);
    var changed = false;
    for (var i = 0; i < configs.length; i++) {
      if (configs[i].type == HomeSectionType.rewatch) {
        if (configs[i].enabled != enabled) {
          configs[i] = configs[i].copyWith(enabled: enabled);
          changed = true;
        }
      }
    }
    if (changed) {
      _prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
    _reloadHomeRows();
    if (!mounted) return;
    setState(() {});
  }

  void _onRewatchConfigChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final showFavoritesRows = _prefs.get(UserPreferences.displayFavoritesRows);
    final showCollectionsRows = _prefs.get(
      UserPreferences.displayCollectionsRows,
    );
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    final showPlaylistsRows = _prefs.get(UserPreferences.displayPlaylistsRows);
    final showAudioRows = _prefs.get(UserPreferences.displayAudioRows);
    final showSinceYouWatchedRows = _prefs.get(UserPreferences.displaySinceYouWatchedRows);
    final sinceYouWatchedSource = _prefs.get(UserPreferences.sinceYouWatchedSource);
    final showRewatchRow = _prefs.get(UserPreferences.displayRewatchRow);

    final borderTokens = ThemeRegistry.active.borders;
    final baseBorder = borderTokens.cardBorder.color;
    final unfocusedBorderColor = baseBorder.a == 0
        ? AppColorScheme.onSurface.withValues(alpha: 0.16)
        : baseBorder.withValues(alpha: 0.55);

    return RequestInitialFocus(
      child: withCleanSettingsTypography(
        context,
        Scaffold(
          appBar: buildSettingsAppBar(context, Text(l10n.homeRowToggles)),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLow.withValues(
                      alpha: 0.82,
                    ),
                    borderRadius: AppRadius.circular(16),
                    border: Border.fromBorderSide(
                      borderTokens.cardBorder.copyWith(
                        color: unfocusedBorderColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          l10n.homeRowTogglesDescription,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Focus(
                        canRequestFocus: false,
                        skipTraversal: true,
                        onFocusChange: (f) =>
                            setState(() => _buttonFocused = f),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _buttonFocused
                                ? AppColorScheme.onSurface.withValues(
                                    alpha: 0.18,
                                  )
                                : theme.colorScheme.primary.withValues(
                                    alpha: 0.15,
                                  ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _buttonFocused
                                  ? AppColorScheme.onSurface
                                  : theme.colorScheme.primary.withValues(
                                      alpha: 0.35,
                                    ),
                              width: 1.5,
                            ),
                            boxShadow: _buttonFocused
                                ? [
                                    BoxShadow(
                                      color: AppColorScheme.onSurface
                                          .withValues(alpha: 0.22),
                                      blurRadius: 14,
                                      spreadRadius: 0.5,
                                    ),
                                  ]
                                : null,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.list,
                              color: theme.colorScheme.primary,
                            ),
                            tooltip: l10n.homeSections,
                            onPressed: () => _pushHomeSectionsScreen(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _SectionHeader(l10n.audio),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayAudioRows,
                    title: l10n.displayAudioRows,
                    subtitle: l10n.displayAudioRowsSubtitle,
                    icon: Icons.music_note,
                    onChanged: _onAudioRowsToggleChanged,
                  ),
                  if (showAudioRows)
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.audioRowsSortBy,
                      title: l10n.audioRowsSorting,
                      description: l10n.audioRowsSortingDescription,
                      icon: Icons.sort,
                      values: const [
                        LibrarySortBy.name,
                        LibrarySortBy.dateAdded,
                        LibrarySortBy.premiereDate,
                        LibrarySortBy.runtime,
                        LibrarySortBy.random,
                      ],
                      labelOf: (v) => v == LibrarySortBy.premiereDate
                          ? 'Release Date'
                          : v.displayName,
                      dialogLabelOf: (v) => v == LibrarySortBy.premiereDate
                          ? 'Release Date'
                          : v.displayName,
                      onChanged: _onAudioSortChanged,
                    ),
                ],
              ),

              _SectionHeader(l10n.collections),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayCollectionsRows,
                    title: l10n.displayCollectionsRows,
                    subtitle: l10n.displayCollectionsRowsSubtitle,
                    icon: Icons.collections,
                    onChanged: _onCollectionsRowsToggleChanged,
                  ),
                  if (showCollectionsRows)
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.collectionsRowSortBy,
                      title: l10n.collectionsRowSorting,
                      description: l10n.collectionsRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onCollectionsSortChanged,
                    ),
                ],
              ),

              _SectionHeader(l10n.favorites),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayFavoritesRows,
                    title: l10n.displayFavoritesRows,
                    subtitle: l10n.displayFavoritesRowsSubtitle,
                    icon: Icons.favorite,
                    onChanged: _onFavoritesRowsToggleChanged,
                  ),
                  if (showFavoritesRows)
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.favoritesRowSortBy,
                      title: l10n.favoritesRowSorting,
                      description: l10n.favoritesRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onFavoritesSortChanged,
                    ),
                ],
              ),

              _SectionHeader(l10n.genres),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayGenresRows,
                    title: l10n.displayGenresRows,
                    subtitle: l10n.displayGenresRowsSubtitle,
                    icon: Icons.theater_comedy,
                    onChanged: _onGenresRowsToggleChanged,
                  ),
                  if (showGenresRows) ...[
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.genresRowSortBy,
                      title: l10n.genresRowSorting,
                      description: l10n.genresRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onGenresSortChanged,
                    ),
                    EnumPreferenceTile<GenresRowItemFilter>(
                      preference: UserPreferences.genresRowItemFilter,
                      title: l10n.genresRowItems,
                      description: l10n.genresRowItemsDescription,
                      icon: Icons.filter_list,
                      labelOf: (v) => v.displayName,
                      onChanged: _onGenresItemFilterChanged,
                    ),
                  ],
                ],
              ),

              _SectionHeader(l10n.playlists),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayPlaylistsRows,
                    title: l10n.displayPlaylistsRows,
                    subtitle: l10n.displayPlaylistsRowsSubtitle,
                    icon: Icons.playlist_play,
                    onChanged: _onPlaylistsRowsToggleChanged,
                  ),
                  if (showPlaylistsRows)
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.playlistsRowSortBy,
                      title: l10n.playlistsRowSorting,
                      description: l10n.playlistsRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onPlaylistsSortChanged,
                    ),
                ],
              ),

              _SectionHeader('REWATCH'),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayRewatchRow,
                    title: 'Display Rewatch Row',
                    subtitle: 'Show Rewatch row in Home Sections',
                    icon: Icons.replay,
                    onChanged: _onRewatchRowToggleChanged,
                  ),
                  if (showRewatchRow) ...[
                    EnumPreferenceTile<RewatchSortBy>(
                      preference: UserPreferences.rewatchSortBy,
                      title: 'Sort By',
                      description: 'Choose sorting method for completed items',
                      icon: Icons.sort,
                      values: RewatchSortBy.values,
                      labelOf: (v) => v.displayName,
                      onChanged: _onRewatchConfigChanged,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.rewatchIncludeMovies,
                      title: 'Include Movies',
                      subtitle: 'Show watched movies in the rewatch row',
                      icon: Icons.movie,
                      onChanged: _onRewatchConfigChanged,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.rewatchIncludeShows,
                      title: 'Include Shows',
                      subtitle: 'Show watched TV shows in the rewatch row',
                      icon: Icons.tv,
                      onChanged: _onRewatchConfigChanged,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.rewatchIncludeCollections,
                      title: 'Include Collections',
                      subtitle: 'Show watched collections in the rewatch row',
                      icon: Icons.collections,
                      onChanged: _onRewatchConfigChanged,
                    ),
                  ],
                ],
              ),

              _SectionHeader('SINCE YOU WATCHED'),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displaySinceYouWatchedRows,
                    title: 'Display Since You Watched Rows',
                    subtitle: 'Show and customize Since You Watched rows in Home Sections.',
                    icon: Icons.recommend,
                    onChanged: _onSinceYouWatchedRowsToggleChanged,
                  ),
                  if (showSinceYouWatchedRows) ...[
                    EnumPreferenceTile<SinceYouWatchedSource>(
                      preference: UserPreferences.sinceYouWatchedSource,
                      title: 'Source',
                      description: "Choose recommendation source (the local-content-only Moonfin special or TMDB's similarity metric. Note: Online recommendations require Seerr integration).",
                      icon: Icons.source,
                      values: SinceYouWatchedSource.values,
                      labelOf: (v) => v.displayName,
                      onChanged: _onSinceYouWatchedConfigChanged,
                    ),
                    EnumPreferenceTile<SinceYouWatchedSourceType>(
                      preference: UserPreferences.sinceYouWatchedSourceType,
                      title: 'Source Type',
                      description: 'Choose type of items to recommend',
                      icon: Icons.merge_type,
                      values: SinceYouWatchedSourceType.values,
                      labelOf: (v) => v.displayName,
                      onChanged: _onSinceYouWatchedConfigChanged,
                    ),
                    EnumPreferenceTile<SinceYouWatchedSourceItem>(
                      preference: UserPreferences.sinceYouWatchedSourceItem,
                      title: 'Source Item',
                      description: 'Choose which source item to base recommendations on',
                      icon: Icons.play_circle_filled,
                      values: SinceYouWatchedSourceItem.values,
                      labelOf: (v) => v.displayName,
                      onChanged: _onSinceYouWatchedConfigChanged,
                    ),
                    EnumPreferenceTile<SinceYouWatchedNumRows>(
                      preference: UserPreferences.sinceYouWatchedNumRows,
                      title: 'Number of Rows to Add',
                      description: 'Choose how many Since You Watched rows to display (1-5)',
                      icon: Icons.format_list_numbered,
                      values: SinceYouWatchedNumRows.values,
                      labelOf: (v) => v.displayName,
                      onChanged: _onSinceYouWatchedConfigChanged,
                    ),
                    if (sinceYouWatchedSource != SinceYouWatchedSource.online)
                      SwitchPreferenceTile(
                        preference: UserPreferences.sinceYouWatchedIncludeWatched,
                        title: 'Include Previously Watched',
                        subtitle: 'Include watched items in recommendations',
                        icon: Icons.history,
                        onChanged: _onSinceYouWatchedConfigChanged,
                      ),
                  ],
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        text.toUpperCase(),
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
