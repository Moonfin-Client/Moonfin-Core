import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../data/repositories/media_bar_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/device_performance.dart';
import '../../../util/platform_detection.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_binding.dart';
import '../../widgets/settings/multi_select_dialog.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_panel.dart';
import '../../widgets/settings/settings_preview_scope.dart';
import 'home_sections_screen.dart';
import 'ratings_config_screen.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

class MediaBarSettingsScreen extends StatefulWidget {
  const MediaBarSettingsScreen({super.key});

  @override
  State<MediaBarSettingsScreen> createState() => _MediaBarSettingsScreenState();
}

class _MediaBarSettingsScreenState extends State<MediaBarSettingsScreen> {
  // Media bar settings are stored per server and user, and only
  // UserPreferences reaches that scoped key. Writing straight to the store
  // lands on a bare key nothing else reads and startup drops.
  final _prefs = GetIt.instance<UserPreferences>();
  static const _validAutoAdvanceIntervals = <int>{5000, 10000, 15000, 30000};
  static const _collectionFetchLimit = 200;
  bool _selectorOpen = false;
  late final PreferenceBinding<String> _mediaBarModeBinding;

  @override
  void initState() {
    super.initState();
    _mediaBarModeBinding = PreferenceBinding(
      GetIt.instance<PreferenceStore>(),
      UserPreferences.mediaBarMode,
    );
    final current = _prefs.get(UserPreferences.mediaBarMode);
    final normalized = UserPreferences.normalizeMediaBarMode(current);
    if (current != normalized) {
      _prefs.set(UserPreferences.mediaBarMode, normalized);
    }
    final currentInterval = _prefs.get(UserPreferences.mediaBarIntervalMs);
    if (!_validAutoAdvanceIntervals.contains(currentInterval)) {
      _prefs.set(UserPreferences.mediaBarIntervalMs, 10000);
    }
  }

  @override
  void dispose() {
    _mediaBarModeBinding.dispose();
    super.dispose();
  }

  List<String> _splitCsv(Preference<String> pref) {
    return _prefs.get(pref).split(',').where((s) => s.isNotEmpty).toList();
  }

  void _saveCsv(Preference<String> pref, List<String> values) {
    _prefs.set(pref, values.join(','));
    _pushSync();
    if (mounted) setState(() {});
  }

  void _pushSync() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  /// Offers [options] for [pref], starting from what is stored and writing the
  /// choice back. [truncated] says the fetch was capped, so the dialog is not
  /// showing everything the server has.
  Future<void> _pickSources({
    required Preference<String> pref,
    required String title,
    required Map<String, String> options,
    bool truncated = false,
  }) async {
    final split = reconcileSources(
      stored: _splitCsv(pref).toSet(),
      available: options.keys.toSet(),
      truncated: truncated,
    );
    if (split.stale.isNotEmpty) {
      _saveCsv(pref, split.listed.toList());
    }

    if (!mounted) return;
    final result = await showMultiSelectDialog(
      context: context,
      title: title,
      items: options,
      selected: split.listed,
    );
    if (result != null) {
      // The dialog only knows what it was shown, so anything held back goes
      // in again rather than being lost on confirm.
      _saveCsv(pref, [...result, ...split.unlisted]);
    }
  }

  Future<void> _showLibrarySelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.userViewsApi.getUserViews();
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .where(
            (item) =>
                supportsMediaBarLibrary(item, const ['movies', 'tvshows']),
          )
          .toList();

      await _pickSources(
        pref: UserPreferences.mediaBarLibraryIds,
        title: l10n.sourceLibraries,
        options: {
          for (final item in items)
            item['Id']?.toString() ?? '':
                item['Name'] as String? ?? l10n.unknown,
        },
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  Future<void> _showCollectionSelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.itemsApi.getItems(
        includeItemTypes: ['BoxSet'],
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        limit: _collectionFetchLimit,
      );
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      await _pickSources(
        pref: UserPreferences.mediaBarCollectionIds,
        title: l10n.sourceCollections,
        options: {
          for (final item in items)
            item['Id']?.toString() ?? '':
                item['Name'] as String? ?? l10n.unknown,
        },
        // A full page back means there are probably more collections than the
        // dialog is showing.
        truncated: items.length >= _collectionFetchLimit,
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  Future<void> _showGenreSelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);
    final client = GetIt.instance<MediaServerClient>();

    try {
      final response = await client.itemsApi.getGenres(
        sortBy: 'SortName',
        sortOrder: 'Ascending',
      );
      final names = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .map((item) => (item['Name'] as String? ?? '').trim())
          .where((name) => name.isNotEmpty)
          .toSet();

      await _pickSources(
        pref: UserPreferences.mediaBarExcludedGenres,
        title: l10n.excludedGenres,
        options: {for (final name in names) name: name},
      );
    } catch (_) {
    } finally {
      _selectorOpen = false;
    }
  }

  Future<void> _showExternalListSelector() async {
    if (_selectorOpen) return;
    _selectorOpen = true;
    final l10n = AppLocalizations.of(context);

    try {
      final lists = mediaBarExternalLists(
        _prefs.homeSectionsConfig,
        tmdbAvailable: GetIt.instance<PluginSyncService>().tmdbAvailable,
      );
      await _pickSources(
        pref: UserPreferences.mediaBarExternalLists,
        title: l10n.homeRowsExternalLists,
        options: {
          for (final MapEntry(:key, value: config) in lists.entries)
            key: switch (HomeSectionType.fromSerialized(key)) {
              HomeSectionType.none => config.pluginDisplayText ?? key,
              final chart => homeSectionTypeLabel(chart, l10n),
            },
        },
      );
    } finally {
      _selectorOpen = false;
    }
  }

  String _sourceSubtitle(
    Preference<String> pref,
    String noneLabel,
    AppLocalizations l10n,
  ) {
    final items = _splitCsv(pref);
    if (items.isEmpty) return noneLabel;
    return l10n.itemsSelected(items.length);
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final trailersHeldBack =
        GetIt.instance<UserPreferences>().resolveDevicePerformanceTier() ==
        DevicePerformanceTier.reduced;
    final mode = UserPreferences.normalizeMediaBarMode(
      _prefs.get(UserPreferences.mediaBarMode),
    );
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.mediaBar)),
        body: ListView(
          children: [
            SettingsSectionHeader(l10n.general),
            adaptiveListSection(
              children: [
                StringPickerPreferenceTile(
                  preference: UserPreferences.mediaBarMode,
                  title: l10n.mediaBarMode,
                  description: l10n.mediaBarModeDescription,
                  icon: Icons.featured_play_list,
                  options: {
                    UserPreferences.mediaBarModeMoonfin:
                        l10n.mediaBarModeMoonfin,
                    UserPreferences.mediaBarModeMakd: l10n.mediaBarModeMakd,
                    UserPreferences.mediaBarModeBookshelf:
                        l10n.mediaBarModeBookshelf,
                    UserPreferences.mediaBarModeGallery: l10n.mediaBarModeGallery,
                    UserPreferences.mediaBarModeBanner: l10n.mediaBarModeBanner,
                    UserPreferences.mediaBarModeAya: l10n.mediaBarModeAya,
                    UserPreferences.mediaBarModeOff: l10n.mediaBarModeOff,
                  },
                  onChanged: () {
                    _pushSync();
                    setState(() {});
                  },
                ),
                if (!PlatformDetection.useMobileUi &&
                    UserPreferences.mediaBarModeAllowsRowPeek(
                      _prefs.get(UserPreferences.mediaBarMode),
                    ))
                  SwitchPreferenceTile(
                    preference: UserPreferences.mediaBarRowPeek,
                    title: l10n.peekHomeRows,
                    subtitle: l10n.peekHomeRowsDescription,
                    icon: Icons.view_day_outlined,
                    onChanged: _pushSync,
                  ),
                StringPickerPreferenceTile(
                  preference: UserPreferences.mediaBarContentType,
                  title: l10n.contentType,
                  icon: Icons.category,
                  options: {
                    'both': l10n.moviesAndTvShows,
                    'movies': l10n.moviesOnly,
                    'tvshows': l10n.tvShowsOnly,
                  },
                  onChanged: _pushSync,
                ),
                StringPickerPreferenceTile(
                  preference: UserPreferences.mediaBarSourceType,
                  title: l10n.mediaBarSourceType,
                  icon: Icons.auto_awesome_motion,
                  options: {
                    UserPreferences.mediaBarSourceRandom:
                        l10n.mediaBarSourceRandom,
                    UserPreferences.mediaBarSourceRecentlyAdded:
                        l10n.recentlyAdded,
                    UserPreferences.mediaBarSourceRecentlyReleased:
                        l10n.recentlyReleased,
                  },
                  onChanged: _pushSync,
                ),
                StringPickerPreferenceTile(
                  preference: UserPreferences.mediaBarItemCount,
                  title: l10n.itemCount,
                  icon: Icons.format_list_numbered,
                  options: const {
                    '5': '5',
                    '10': '10',
                    '15': '15',
                    '20': '20',
                    '25': '25',
                    '30': '30',
                  },
                  onChanged: _pushSync,
                ),
              ],
            ),

            if (UserPreferences.mediaBarModeDrawsRatings(mode)) ...[
              SettingsSectionHeader(l10n.ratings),
              adaptiveListSection(
                children: [
                  SwitchPreferenceTile(
                    preference: UserPreferences.mediaBarEnableAdditionalRatings,
                    title: l10n.additionalRatings,
                    subtitle: l10n.showMdbListAndTmdbRatings,
                    icon: Icons.star,
                    onChanged: _pushSync,
                  ),
                  SettingsPreviewReporter(
                    describe: () => SettingsPreviewEntry(
                      prefKey: UserPreferences.mediaBarRatings.sources.key,
                      title: l10n.ratingSources,
                      description: l10n.ratingSourcesDescription,
                    ),
                    child: _MediaBarActionTile(
                      icon: const Icon(Icons.reorder),
                      title: Text(l10n.ratingSources),
                      subtitle: Text(l10n.ratingSourcesDescription),
                      onTap: () => context.pushSettingsScreen(
                        RatingsConfigScreen(
                          settings: UserPreferences.mediaBarRatings,
                        ),
                      ),
                    ),
                  ),
                  // Banner draws its ratings bare and Gallery without badges,
                  // so those switches would do nothing there.
                  if (mode != UserPreferences.mediaBarModeBanner)
                    SwitchPreferenceTile(
                      preference: UserPreferences.mediaBarShowRatingLabels,
                      title: l10n.ratingLabels,
                      subtitle: l10n.showLabelsNextToIcons,
                      icon: Icons.label,
                      onChanged: _pushSync,
                    ),
                  if (mode != UserPreferences.mediaBarModeBanner &&
                      mode != UserPreferences.mediaBarModeGallery)
                    SwitchPreferenceTile(
                      preference: UserPreferences.mediaBarShowRatingBadges,
                      title: l10n.ratingBadges,
                      subtitle: l10n.showDecorativeBadges,
                      icon: Icons.style,
                      onChanged: _pushSync,
                    ),
                ],
              ),
            ],

            SettingsSectionHeader(l10n.mediaSources),
            adaptiveListSection(
              children: [
                _MediaBarActionTile(
                  icon: const ImageIcon(
                    AssetImage('assets/icons/clapperboard.png'),
                  ),
                  title: Text(l10n.sourceLibraries),
                  subtitle: Text(
                    _sourceSubtitle(
                      UserPreferences.mediaBarLibraryIds,
                      l10n.noneSelected,
                      l10n,
                    ),
                  ),
                  onTap: _showLibrarySelector,
                ),
                _MediaBarActionTile(
                  icon: const Icon(Icons.collections_bookmark),
                  title: Text(l10n.sourceCollections),
                  subtitle: Text(
                    _sourceSubtitle(
                      UserPreferences.mediaBarCollectionIds,
                      l10n.noneSelected,
                      l10n,
                    ),
                  ),
                  onTap: _showCollectionSelector,
                ),
                // Outside lists come through Moonbase, the same as their
                // Home rows.
                if (GetIt.instance<PluginSyncService>().pluginAvailable)
                  _MediaBarActionTile(
                    icon: const Icon(Icons.public),
                    title: Text(l10n.homeRowsExternalLists),
                    subtitle: Text(
                      _sourceSubtitle(
                        UserPreferences.mediaBarExternalLists,
                        l10n.noneSelected,
                        l10n,
                      ),
                    ),
                    onTap: _showExternalListSelector,
                  ),
                _MediaBarActionTile(
                  icon: const Icon(Icons.label_off),
                  title: Text(l10n.excludedGenres),
                  subtitle: Text(
                    _sourceSubtitle(
                      UserPreferences.mediaBarExcludedGenres,
                      l10n.noneExcluded,
                      l10n,
                    ),
                  ),
                  onTap: _showGenreSelector,
                ),
              ],
            ),

            SettingsSectionHeader(l10n.behavior),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.mediaBarAutoAdvance,
                  title: l10n.autoAdvance,
                  subtitle: l10n.autoAdvanceSlides,
                  icon: Icons.skip_next,
                ),
                IntPickerPreferenceTile(
                  preference: UserPreferences.mediaBarIntervalMs,
                  title: l10n.autoAdvanceInterval,
                  icon: Icons.timer,
                  options: {
                    5000: l10n.fiveSeconds,
                    10000: l10n.tenSeconds,
                    15000: l10n.fifteenSeconds,
                    30000: l10n.thirtySeconds,
                  },
                  onChanged: _pushSync,
                ),
              ],
            ),

            SettingsSectionHeader(l10n.trailers),
            adaptiveListSection(
              children: [
                SwitchPreferenceTile(
                  preference: UserPreferences.mediaBarTrailerPreview,
                  title: l10n.trailerPreview,
                  // The switch would otherwise read as on while nothing
                  // plays, so say why.
                  subtitle: trailersHeldBack
                      ? l10n.trailerPreviewHeldBack
                      : l10n.autoPlayTrailers,
                  icon: Icons.movie_outlined,
                  onChanged: _pushSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.mediaBarTrailerAudio,
                  title: l10n.trailerAudio,
                  subtitle: l10n.enableTrailerAudio,
                  icon: Icons.volume_up,
                  onChanged: _pushSync,
                ),
                SliderPreferenceTile(
                  preference: UserPreferences.trailerVolume,
                  title: l10n.trailerVolume,
                  description: l10n.trailerVolumeDescription,
                  icon: Icons.volume_down,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  labelOf: (v) => '$v%',
                  onChangeEnd: _pushSync,
                ),
                SwitchPreferenceTile(
                  preference: UserPreferences.mediaBarTrailerCaptions,
                  title: l10n.trailerCaptions,
                  subtitle: l10n.trailerCaptionsDescription,
                  icon: Icons.closed_caption_outlined,
                  onChanged: _pushSync,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaBarActionTile extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final Widget subtitle;
  final VoidCallback? onTap;

  const _MediaBarActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TvFocusHighlight(
      builder: (ctx, focused) => ListTile(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        leading: buildSettingsLeadingIconShell(
          context,
          icon: icon,
          focused: focused,
          iconColor: focused && settingsTileInvertsOnFocus
              ? AppColors.black.withValues(alpha: 0.54)
              : AppColorScheme.onSurface.withValues(alpha: 0.78),
        ),
        title: title,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}

/// Splits stored source ids against the ones the server just listed.
///
/// An id the server did not list is gone, so the picker forgets it. A capped
/// fetch proves nothing about what it left out, so those ids are held back and
/// stored again instead.
@visibleForTesting
({Set<String> listed, Set<String> unlisted, Set<String> stale})
reconcileSources({
  required Set<String> stored,
  required Set<String> available,
  required bool truncated,
}) {
  final missing = stored.difference(available);
  return (
    listed: stored.intersection(available),
    unlisted: truncated ? missing : const <String>{},
    stale: truncated ? const <String>{} : missing,
  );
}
