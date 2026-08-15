import 'dart:async';
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

  void _onStudiosRowsToggleChanged() {
    final enabled = _prefs.get(UserPreferences.displayStudiosRows);
    final configs = List<HomeSectionConfig>.from(_prefs.homeSectionsConfig);
    var changed = false;
    var found = false;
    for (var i = 0; i < configs.length; i++) {
      if (configs[i].type == HomeSectionType.studios) {
        found = true;
        if (configs[i].enabled != enabled) {
          configs[i] = configs[i].copyWith(enabled: enabled);
          changed = true;
        }
      }
    }
    if (!found) {
      configs.add(HomeSectionConfig(
        type: HomeSectionType.studios,
        enabled: enabled,
        order: configs.length,
      ));
      changed = true;
    }
    if (changed) {
      _prefs.setHomeSectionsConfig(configs);
    }
    _pushPersonalizationSync();
    _reloadHomeRows();
    if (!mounted) return;
    setState(() {});
  }

  void _onStudiosSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  Future<void> _openStudioSelectionDialog(BuildContext context) async {
    final currentIds = _prefs.get(UserPreferences.studiosRowSelectedIds);
    final previousFocus = FocusManager.instance.primaryFocus;
    final result = await showDialog<String>(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => StudioSelectionDialog(selectedIdsCsv: currentIds),
    );
    previousFocus?.requestFocus();
    if (result != null && mounted) {
      await _prefs.set(UserPreferences.studiosRowSelectedIds, result);
      final hasSelected = result.split(',').any((s) => s.trim().isNotEmpty);
      if (hasSelected) {
        await _prefs.set(UserPreferences.displayStudiosRows, true);
      }
      _onStudiosRowsToggleChanged();
    }
  }

  void _onFavoritesSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onCollectionsSortChanged() {
    _pushPersonalizationSync();
    _reloadHomeRows();
  }

  void _onCollectionsEpisodesChanged() {
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

  void _onPlaylistsEpisodesChanged() {
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
    final showStudiosRows = _prefs.get(UserPreferences.displayStudiosRows);

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
                  if (showAudioRows) ...[
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
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.audioRowsSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.audioRowsSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
                      onChanged: _onAudioSortChanged,
                    ),
                  ],
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
                  if (showCollectionsRows) ...[
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.collectionsRowSortBy,
                      title: l10n.collectionsRowSorting,
                      description: l10n.collectionsRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onCollectionsSortChanged,
                    ),
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.collectionsRowSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.collectionsRowSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
                      onChanged: _onCollectionsSortChanged,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.collectionsRowShowEpisodes,
                      title: l10n.collectionsRowShowEpisodes,
                      subtitle: l10n.collectionsRowShowEpisodesSubtitle,
                      icon: Icons.video_library_outlined,
                      onChanged: _onCollectionsEpisodesChanged,
                    ),
                  ],
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
                  if (showFavoritesRows) ...[
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.favoritesRowSortBy,
                      title: l10n.favoritesRowSorting,
                      description: l10n.favoritesRowSortingDescription,
                      icon: Icons.sort,
                      values: LibrarySortBy.itemsApiValues,
                      labelOf: (v) => v.displayName,
                      onChanged: _onFavoritesSortChanged,
                    ),
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.favoritesRowSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.favoritesRowSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
                      onChanged: _onFavoritesSortChanged,
                    ),
                  ],
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
                      values: LibrarySortBy.itemsApiValues,
                      labelOf: (v) => v.displayName,
                      onChanged: _onGenresSortChanged,
                    ),
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.genresRowSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.genresRowSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
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
                  if (showPlaylistsRows) ...[
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.playlistsRowSortBy,
                      title: l10n.playlistsRowSorting,
                      description: l10n.playlistsRowSortingDescription,
                      icon: Icons.sort,
                      labelOf: (v) => v.displayName,
                      onChanged: _onPlaylistsSortChanged,
                    ),
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.playlistsRowSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.playlistsRowSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
                      onChanged: _onPlaylistsSortChanged,
                    ),
                    SwitchPreferenceTile(
                      preference: UserPreferences.playlistsRowShowEpisodes,
                      title: l10n.playlistsRowShowEpisodes,
                      subtitle: l10n.playlistsRowShowEpisodesSubtitle,
                      icon: Icons.video_library_outlined,
                      onChanged: _onPlaylistsEpisodesChanged,
                    ),
                  ],
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
              _SectionHeader('STUDIOS'),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.displayStudiosRows,
                    title: l10n.displayStudiosRows,
                    subtitle: l10n.displayStudiosRowsSubtitle,
                    icon: Icons.business,
                    onChanged: _onStudiosRowsToggleChanged,
                  ),
                  if (showStudiosRows) ...[
                    TvFocusHighlight(
                      builder: (_, focused) => ListTile(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        leading: buildSettingsLeadingIconShell(
                          context,
                          icon: const Icon(Icons.checklist),
                          focused: focused,
                          iconColor: focused
                              ? AppColors.black.withValues(alpha: 0.87)
                              : AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        title: Text(l10n.selectStudiosToInclude),
                        subtitle: Text(l10n.selectStudiosToIncludeDescription),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => _openStudioSelectionDialog(context),
                      ),
                    ),
                    EnumPreferenceTile<LibrarySortBy>(
                      preference: UserPreferences.studiosRowSortBy,
                      title: l10n.studiosRowSorting,
                      description: l10n.studiosRowSortingDescription,
                      icon: Icons.sort_by_alpha,
                      values: LibrarySortBy.itemsApiValues,
                      labelOf: (v) => v.displayName,
                      onChanged: _onStudiosSortChanged,
                    ),
                    EnumPreferenceTile<SortDirection>(
                      preference: UserPreferences.studiosRowSortOrder,
                      title: l10n.sortOrder,
                      description: l10n.studiosRowSortOrderDescription,
                      icon: Icons.swap_vert,
                      labelOf: (v) => v == SortDirection.ascending
                          ? l10n.ascending
                          : l10n.descending,
                      onChanged: _onStudiosSortChanged,
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

class _FocusableTile extends StatefulWidget {
  final Widget child;

  const _FocusableTile({required this.child});

  @override
  State<_FocusableTile> createState() => _FocusableTileState();
}

class _FocusableTileState extends State<_FocusableTile> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Focus(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: _isFocused
              ? primary.withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _isFocused ? Colors.cyanAccent : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

class _FocusableActionButton extends StatefulWidget {
  final bool autofocus;
  final VoidCallback? onPressed;
  final Widget child;
  final bool isFilled;

  const _FocusableActionButton({
    this.autofocus = false,
    this.onPressed,
    required this.child,
    this.isFilled = false,
  });

  @override
  State<_FocusableActionButton> createState() => _FocusableActionButtonState();
}

class _FocusableActionButtonState extends State<_FocusableActionButton> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final onPrimary = theme.colorScheme.onPrimary;

    return Focus(
      autofocus: widget.autofocus,
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      child: Material(
        color: _isFocused
            ? (widget.isFilled ? primary : primary.withValues(alpha: 0.35))
            : (widget.isFilled ? primary.withValues(alpha: 0.8) : Colors.transparent),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _isFocused ? Colors.cyanAccent : (widget.isFilled ? primary : theme.colorScheme.outline),
                width: _isFocused ? 2.5 : 1.0,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: Colors.cyanAccent.withValues(alpha: 0.5),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: DefaultTextStyle(
              style: (theme.textTheme.labelLarge ?? const TextStyle()).copyWith(
                color: _isFocused
                    ? (widget.isFilled ? onPrimary : Colors.cyanAccent)
                    : (widget.isFilled ? onPrimary : theme.colorScheme.onSurface),
                fontWeight: FontWeight.bold,
              ),
              child: IconTheme(
                data: IconThemeData(
                  color: _isFocused
                      ? (widget.isFilled ? onPrimary : Colors.cyanAccent)
                      : (widget.isFilled ? onPrimary : theme.colorScheme.onSurface),
                  size: 18,
                ),
                child: Center(child: widget.child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StudioSelectionDialog extends StatefulWidget {
  final String selectedIdsCsv;

  const StudioSelectionDialog({super.key, required this.selectedIdsCsv});

  @override
  State<StudioSelectionDialog> createState() => _StudioSelectionDialogState();
}

class _StudioSelectionDialogState extends State<StudioSelectionDialog> {
  bool _loading = true;
  String? _error;
  List<Map<String, dynamic>> _allStudios = [];
  final Set<String> _selectedIds = {};

  bool _includeTv = true;
  bool _includeMovies = true;

  bool _showSelected = true;
  bool _showUnselected = true;

  @override
  void initState() {
    super.initState();
    _selectedIds.addAll(
      widget.selectedIdsCsv
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty),
    );
    _fetchStudios();
  }

  Future<void> _fetchStudios() async {
    try {
      final client = GetIt.instance<MediaServerClient>();
      final userId = client.userId;

      final results = await Future.wait([
        client.itemsApi.getStudios(
          userId: userId,
          recursive: true,
          includeItemTypes: const ['Movie'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          fields: 'ChildCount,ItemCounts,PrimaryImageTag',
        ),
        client.itemsApi.getStudios(
          userId: userId,
          recursive: true,
          includeItemTypes: const ['Series'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          fields: 'ChildCount,ItemCounts,PrimaryImageTag',
        ),
      ]);

      final movieItems = (results[0]['Items'] as List? ?? []).cast<Map<String, dynamic>>();
      final tvItems = (results[1]['Items'] as List? ?? []).cast<Map<String, dynamic>>();

      final Map<String, Map<String, dynamic>> studioMap = {};

      for (final m in movieItems) {
        final id = m['Id'] as String?;
        final name = m['Name'] as String?;
        if (id != null && name != null) {
          studioMap[id] = {
            'id': id,
            'name': name,
            'hasMovie': true,
            'hasTv': false,
          };
        }
      }

      for (final t in tvItems) {
        final id = t['Id'] as String?;
        final name = t['Name'] as String?;
        if (id != null && name != null) {
          if (studioMap.containsKey(id)) {
            studioMap[id]!['hasTv'] = true;
          } else {
            studioMap[id] = {
              'id': id,
              'name': name,
              'hasMovie': false,
              'hasTv': true,
            };
          }
        }
      }

      final sortedStudios = studioMap.values.toList()
        ..sort((a, b) {
          final nameA = (a['name'] as String).toLowerCase();
          final nameB = (b['name'] as String).toLowerCase();
          return nameA.compareTo(nameB);
        });

      if (mounted) {
        setState(() {
          _allStudios = sortedStudios;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> get _filteredStudios {
    return _allStudios.where((s) {
      final id = s['id'] as String;
      final isSelected = _selectedIds.contains(id);
      final hasMovie = s['hasMovie'] as bool;
      final hasTv = s['hasTv'] as bool;

      if (!_showSelected && !_showUnselected) return false;
      if (!_showSelected && isSelected) return false;
      if (!_showUnselected && !isSelected) return false;

      if (!_includeTv && !_includeMovies) return false;
      if (_includeTv && !_includeMovies && !hasTv) return false;
      if (_includeMovies && !_includeTv && !hasMovie) return false;

      return true;
    }).toList();
  }

  void _toggleAll() {
    final filtered = _filteredStudios;
    final allSelected = filtered.isNotEmpty &&
        filtered.every((s) => _selectedIds.contains(s['id'] as String));
    setState(() {
      if (allSelected) {
        for (final s in filtered) {
          _selectedIds.remove(s['id'] as String);
        }
      } else {
        for (final s in filtered) {
          _selectedIds.add(s['id'] as String);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final filtered = _filteredStudios;
    final allSelected = filtered.isNotEmpty &&
        filtered.every((s) => _selectedIds.contains(s['id'] as String));

    return withBackClose(
      context,
      AlertDialog(
        title: Text(l10n.selectStudiosToInclude),
        content: SizedBox(
          width: 740,
          height: 480,
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(child: Text('Error loading studios: $_error'))
                  : _allStudios.isEmpty
                      ? const Center(child: Text('No studios found in library.'))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      '${_selectedIds.length} of ${_allStudios.length} selected (${filtered.length} visible)',
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Divider(height: 1),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: filtered.length,
                                      itemBuilder: (context, index) {
                                        final studio = filtered[index];
                                        final id = studio['id'] as String;
                                        final name = studio['name'] as String;
                                        final isSelected = _selectedIds.contains(id);
                                        return _FocusableTile(
                                          child: CheckboxListTile(
                                            dense: true,
                                            visualDensity: VisualDensity.compact,
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 0,
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.trailing,
                                            title: Text(name),
                                            activeColor: theme.colorScheme.primary,
                                            checkColor: theme.colorScheme.onPrimary,
                                            side: BorderSide(
                                              color: theme.colorScheme.primary,
                                              width: 1.5,
                                            ),
                                            value: isSelected,
                                            onChanged: (checked) {
                                              setState(() {
                                                if (checked == true) {
                                                  _selectedIds.add(id);
                                                } else {
                                                  _selectedIds.remove(id);
                                                }
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(width: 24, indent: 4, endIndent: 4),
                            SizedBox(
                              width: 260,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _FocusableActionButton(
                                    autofocus: true,
                                    onPressed: _toggleAll,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          allSelected
                                              ? Icons.deselect
                                              : Icons.select_all,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          allSelected
                                              ? l10n.deselectAllStudios
                                              : l10n.selectAllStudios,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Divider(height: 1),
                                  const SizedBox(height: 8),
                                  Text(
                                    l10n.filtersHeader.toUpperCase(),
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  _FocusableTile(
                                    child: CheckboxListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                      title: Text(l10n.tvStudiosFilter, style: const TextStyle(fontSize: 13)),
                                      activeColor: theme.colorScheme.primary,
                                      checkColor: theme.colorScheme.onPrimary,
                                      side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                                      value: _includeTv,
                                      onChanged: (val) => setState(() => _includeTv = val ?? true),
                                    ),
                                  ),
                                  _FocusableTile(
                                    child: CheckboxListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                      title: Text(l10n.movieStudiosFilter, style: const TextStyle(fontSize: 13)),
                                      activeColor: theme.colorScheme.primary,
                                      checkColor: theme.colorScheme.onPrimary,
                                      side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                                      value: _includeMovies,
                                      onChanged: (val) => setState(() => _includeMovies = val ?? true),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    l10n.showHeader.toUpperCase(),
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  _FocusableTile(
                                    child: CheckboxListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                      title: Text(l10n.selectedStudiosFilter, style: const TextStyle(fontSize: 13)),
                                      activeColor: theme.colorScheme.primary,
                                      checkColor: theme.colorScheme.onPrimary,
                                      side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                                      value: _showSelected,
                                      onChanged: (val) => setState(() => _showSelected = val ?? true),
                                    ),
                                  ),
                                  _FocusableTile(
                                    child: CheckboxListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                      title: Text(l10n.unselectedStudiosFilter, style: const TextStyle(fontSize: 13)),
                                      activeColor: theme.colorScheme.primary,
                                      checkColor: theme.colorScheme.onPrimary,
                                      side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
                                      value: _showUnselected,
                                      onChanged: (val) => setState(() => _showUnselected = val ?? true),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _FocusableActionButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: Text(l10n.cancel),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: _FocusableActionButton(
                                          isFilled: true,
                                          onPressed: _loading
                                              ? null
                                              : () => Navigator.of(context).pop(_selectedIds.join(',')),
                                          child: Text(l10n.save),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
