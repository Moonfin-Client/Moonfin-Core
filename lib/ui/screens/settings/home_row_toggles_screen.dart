import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../home/home_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
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
    GetIt.instance<HomeViewModel>().load(preserveExisting: true);
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

  void _onSeerrRowsToggleChanged() {
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final seerrEnabledOnAccount = GetIt.instance<SeerrPreferences>().enabled;

    final showFavoritesRows = _prefs.get(UserPreferences.displayFavoritesRows);
    final showCollectionsRows = _prefs.get(
      UserPreferences.displayCollectionsRows,
    );
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    final showPlaylistsRows = _prefs.get(UserPreferences.displayPlaylistsRows);
    final showAudioRows = _prefs.get(UserPreferences.displayAudioRows);

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
                    borderRadius: BorderRadius.circular(16),
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

              if (_syncService.seerrAvailable) ...[
                _SectionHeader(l10n.seerr),
                adaptiveListSection(
                  children: [
                    SwitchPreferenceTile(
                      preference: UserPreferences.displaySeerrRows,
                      title: l10n.displaySeerrRows,
                      subtitle: seerrEnabledOnAccount
                          ? l10n.displaySeerrRowsSubtitle
                          : '${l10n.displaySeerrRowsSubtitle} (Requires Seerr login in Plugins)',
                      enabled: seerrEnabledOnAccount,
                      iconBuilder: (size, color) => Image.asset(
                        'assets/icons/seerr.png',
                        width: size,
                        height: size,
                      ),
                      onChanged: _onSeerrRowsToggleChanged,
                    ),
                  ],
                ),
              ],
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
