import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/home_screen_sections_service.dart';
import '../../../data/services/kefin_tweaks_service.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/poster_size_settings_dialog.dart';
import '../../widgets/playback/player_loading_overlay.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_app_bar.dart';

const double _kHomeSectionTileRadius = 16;
const EdgeInsets _kHomeSectionTileContentPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);
const EdgeInsets _kHomeSectionTileOuterPadding = EdgeInsets.fromLTRB(12, 4, 12, 4);

BoxDecoration _homeSectionTileDecoration(
  BuildContext context, {
  required bool focused,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final borderTokens = ThemeRegistry.active.borders;
  final baseBorder = borderTokens.cardBorder.color;
  final unfocusedBorderColor = baseBorder.a == 0
      ? AppColorScheme.onSurface.withValues(alpha: 0.16)
      : baseBorder.withValues(alpha: 0.55);

  return BoxDecoration(
    color: focused
        ? AppColorScheme.onSurface
        : colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
    borderRadius: BorderRadius.circular(_kHomeSectionTileRadius),
    border: Border.fromBorderSide(
      (focused ? borderTokens.focusBorder : borderTokens.cardBorder).copyWith(
        color: focused
            ? AppColorScheme.accent.withValues(alpha: 0.72)
            : unfocusedBorderColor,
        width: 1.0,
      ),
    ),
    boxShadow: focused
        ? (borderTokens.focusGlow.isNotEmpty
              ? borderTokens.focusGlow
              : [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.22),
                    blurRadius: 14,
                    spreadRadius: 0.5,
                  ),
                ])
        : null,
  );
}

class HomeSectionsScreen extends StatefulWidget {
  final bool showGeneralOptions;

  const HomeSectionsScreen({
    super.key,
    this.showGeneralOptions = true,
  });

  @override
  State<HomeSectionsScreen> createState() => _HomeSectionsScreenState();
}

class _HomeSectionsScreenState extends State<HomeSectionsScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  static const _rowsTypeDescription =
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';
  late List<HomeSectionConfig> _sections;
  HomeSectionConfig? _mediaBarConfig;
  final _focusNodes = <FocusNode>[];
  final Map<String, FocusNode> _focusNodesByStableId = {};
  bool _isLoading = true;
  bool _showOverlay = true;

  final Set<String> _emptySectionIds = {};

  static FavoriteTypeFilter _favoriteFilterForSection(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.favoriteMovies => FavoriteTypeFilter.movie,
      HomeSectionType.favoriteSeries => FavoriteTypeFilter.series,
      HomeSectionType.favoriteEpisodes => FavoriteTypeFilter.episode,
      HomeSectionType.favoritePeople => FavoriteTypeFilter.person,
      HomeSectionType.favoriteArtists => FavoriteTypeFilter.musicArtist,
      HomeSectionType.favoriteMusicVideos => FavoriteTypeFilter.musicVideo,
      HomeSectionType.favoriteAlbums => FavoriteTypeFilter.musicAlbum,
      HomeSectionType.favoriteSongs => FavoriteTypeFilter.audio,
      _ => FavoriteTypeFilter.all,
    };
  }

  Future<void> _checkEmptyStates() async {
    if (!mounted) return;

    final client = GetIt.instance<MediaServerClient>();
    final userId = client.userId;

    final tasks = <Future<void>>[];

    final newEmptyIds = <String>{};
    void setEmpty(String stableId, bool isEmpty) {
      if (isEmpty) {
        newEmptyIds.add(stableId);
      } else {
        newEmptyIds.remove(stableId);
      }
    }

    for (final section in _sections) {
      final stableId = section.stableId;
      if (section.isBuiltin) {
        switch (section.type) {
          case HomeSectionType.resume:
            // Skip Continue Watching as it populates/removes as needed
            break;
          case HomeSectionType.resumeAudio:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getResumeItems(
                  includeItemTypes: const ['Audio'],
                  limit: 1,
                );
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.resumeBook:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getResumeItems(
                  includeItemTypes: const ['Book'],
                  limit: 1,
                );
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.nextUp:
            // Skip Next Up as it's a core empty state fallback/always selectable
            break;
          case HomeSectionType.playlists:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  includeItemTypes: const ['Playlist'],
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.favoriteMovies:
          case HomeSectionType.favoriteSeries:
          case HomeSectionType.favoriteEpisodes:
          case HomeSectionType.favoritePeople:
          case HomeSectionType.favoriteArtists:
          case HomeSectionType.favoriteMusicVideos:
          case HomeSectionType.favoriteAlbums:
          case HomeSectionType.favoriteSongs:
            final filter = _favoriteFilterForSection(section.type);
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  isFavorite: true,
                  includeItemTypes: filter.itemTypes,
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.collections:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  includeItemTypes: const ['BoxSet'],
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.genres:
            tasks.add(() async {
              try {
                final includeItemTypes = _prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
                final response = await client.itemsApi.getGenres(
                  userId: userId,
                  recursive: true,
                  limit: 1,
                  includeItemTypes: includeItemTypes,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.activeRecordings:
            tasks.add(() async {
              try {
                final response = await client.liveTvApi.getRecordings(
                  limit: 1,
                );
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.liveTv:
            tasks.add(() async {
              try {
                final response = await client.liveTvApi.getChannels(
                  userId: userId,
                  limit: 1,
                );
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.libraryTilesSmall:
          case HomeSectionType.libraryButtons:
            tasks.add(() async {
              try {
                final response = await client.userViewsApi.getUserViews();
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.latestMedia:
            // Skip Latest Media as it's a core empty state fallback/always selectable
            break;
          case HomeSectionType.recentlyReleased:
            // Skip Recently Released as it's a core empty state fallback/always selectable
            break;
          default:
            break;
        }
      } else if (section.isPluginDynamic) {
        if (section.pluginSource == HomeSectionPluginSource.collections) {
          final collectionId = section.pluginAdditionalData;
          if (collectionId != null && collectionId.isNotEmpty) {
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  parentId: collectionId,
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
          }
        } else if (section.pluginSource == HomeSectionPluginSource.genres) {
          final genreId = section.pluginAdditionalData;
          if (genreId != null && genreId.isNotEmpty) {
            tasks.add(() async {
              try {
                final includeItemTypes = _prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
                final response = await client.itemsApi.getItems(
                  genreIds: [genreId],
                  limit: 1,
                  recursive: true,
                  includeItemTypes: includeItemTypes,
                  excludeItemTypes: const ['Episode'],
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
          }
        }
      }
    }

    await Future.wait(tasks);

    if (mounted) {
      setState(() {
        _emptySectionIds
          ..clear()
          ..addAll(newEmptyIds);
      });
    }
  }

  bool _isFavoriteSectionType(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.favoriteMovies ||
      HomeSectionType.favoriteSeries ||
      HomeSectionType.favoriteEpisodes ||
      HomeSectionType.favoritePeople ||
      HomeSectionType.favoriteArtists ||
      HomeSectionType.favoriteMusicVideos ||
      HomeSectionType.favoriteAlbums ||
      HomeSectionType.favoriteSongs => true,
      _ => false,
    };
  }

  bool _isCollectionsSectionType(HomeSectionType type) {
    return type == HomeSectionType.collections;
  }

  bool _isGenresSectionType(HomeSectionType type) {
    return type == HomeSectionType.genres;
  }

  bool _isPlaylistsSectionType(HomeSectionType type) {
    return type == HomeSectionType.playlists;
  }

  bool _isSeerrSectionType(HomeSectionType type) {
    return type == HomeSectionType.seerrRecentRequests ||
        type == HomeSectionType.seerrRecentlyAdded ||
        type == HomeSectionType.seerrPopularMovies ||
        type == HomeSectionType.seerrUpcomingMovies ||
        type == HomeSectionType.seerrPopularSeries ||
        type == HomeSectionType.seerrUpcomingSeries ||
        type == HomeSectionType.seerrTrending ||
        type == HomeSectionType.seerrMovieGenres ||
        type == HomeSectionType.seerrStudios ||
        type == HomeSectionType.seerrSeriesGenres ||
        type == HomeSectionType.seerrNetworks;
  }

  int _getSectionCategory(HomeSectionConfig section) {
    if (section.isPluginDynamic) {
      if (section.pluginSource == HomeSectionPluginSource.kefinTweaks ||
          section.pluginSource == HomeSectionPluginSource.hss) {
        return 7;
      }
      if (section.pluginSource == HomeSectionPluginSource.collections) {
        return 2;
      }
      if (section.pluginSource == HomeSectionPluginSource.genres) {
        return 4;
      }
      if (section.pluginSource == HomeSectionPluginSource.playlists) {
        return 5;
      }
      return 7;
    }
    // is builtin
    if (section.type == HomeSectionType.collections) {
      return 2;
    }
    if (_isFavoriteSectionType(section.type)) {
      return 3;
    }
    if (section.type == HomeSectionType.genres) {
      return 4;
    }
    if (section.type == HomeSectionType.playlists) {
      return 5;
    }
    if (_isSeerrSectionType(section.type)) {
      return 6;
    }
    // general builtins (resume, nextUp, etc.)
    return 1;
  }

  void _addSection(HomeSectionConfig cfg) {
    final newCategory = _getSectionCategory(cfg);
    var insertIdx = -1;
    for (var i = 0; i < _sections.length; i++) {
      if (_getSectionCategory(_sections[i]) <= newCategory) {
        insertIdx = i;
      }
    }
    if (insertIdx >= 0) {
      _sections.insert(insertIdx + 1, cfg);
    } else {
      _sections.insert(0, cfg);
    }
  }

  bool _isHiddenByRowVisibilityGates(HomeSectionConfig section) {
    final showFavoritesRows = _prefs.get(UserPreferences.displayFavoritesRows);
    final showCollectionsRows =
        _prefs.get(UserPreferences.displayCollectionsRows);
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    final showPlaylistsRows = _prefs.get(UserPreferences.displayPlaylistsRows);
    final showSeerrRows = _prefs.get(UserPreferences.displaySeerrRows) &&
        GetIt.instance<PluginSyncService>().seerrAvailable;

    final hiddenByFavorites =
      !showFavoritesRows && _isFavoriteSectionType(section.type);
    final hiddenByCollections = !showCollectionsRows &&
      ((section.isBuiltin && _isCollectionsSectionType(section.type)) ||
        (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.collections));
    final hiddenByGenres = !showGenresRows &&
      ((section.isBuiltin && _isGenresSectionType(section.type)) ||
        (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.genres));
    final hiddenByPlaylists = !showPlaylistsRows &&
      ((section.isBuiltin && _isPlaylistsSectionType(section.type)) ||
        (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.playlists));
    final hiddenBySeerr = !showSeerrRows && _isSeerrSectionType(section.type);
    return hiddenByFavorites ||
        hiddenByCollections ||
        hiddenByGenres ||
        hiddenByPlaylists ||
        hiddenBySeerr;
  }

  List<int> _visibleSectionIndices() {
    final visible = <int>[];
    for (var i = 0; i < _sections.length; i++) {
      if (_isHiddenByRowVisibilityGates(_sections[i])) continue;
      visible.add(i);
    }
    return visible;
  }

  @override
  void initState() {
    super.initState();
    final all = _prefs.homeSectionsConfig;
    _mediaBarConfig = all.where((s) => s.type == HomeSectionType.mediaBar).firstOrNull;
    _sections = all.where((s) => s.type != HomeSectionType.mediaBar).toList();
    final addedBuiltins = _ensureBuiltinSectionsPresent();
    _mergeDiscoveredPluginSections();
    _rebuildFocusNodes();
    if (addedBuiltins) {
      _persistSections(pushSync: false);
    }
    _refreshPluginSections();
    // Empty-state check is driven entirely by _refreshPluginSections;
    // no separate call here avoids a double-spinner flash on open.
  }

  bool _ensureBuiltinSectionsPresent() {
    final existingTypes = _sections
        .where((s) => s.isBuiltin)
        .map((s) => s.type)
        .toSet();
    var nextOrder = _sections.length;
    var changed = false;

    for (final type in HomeSectionType.values) {
      if (type == HomeSectionType.none || type == HomeSectionType.mediaBar) {
        continue;
      }
      if (existingTypes.contains(type)) continue;

      _addSection(
        HomeSectionConfig(
          type: type,
          enabled: false,
          order: nextOrder++,
        ),
      );
      changed = true;
    }

    return changed;
  }

  /// Probes for newly discovered plugin sections in the background and
  /// re-merges the result into the visible list.
  Future<void> _refreshPluginSections() async {
    setState(() {
      _isLoading = true;
      _showOverlay = true;
    });
    try {
      final futures = <Future<void>>[];
      if (GetIt.instance.isRegistered<HomeScreenSectionsService>()) {
        futures.add(GetIt.instance<HomeScreenSectionsService>().refreshAll());
      }
      if (GetIt.instance.isRegistered<KefinTweaksService>()) {
        futures.add(GetIt.instance<KefinTweaksService>().refreshAll());
      }
      if (futures.isNotEmpty) {
        try {
          await Future.wait(futures);
        } catch (_) {}
      }
      final collectionsFuture = _fetchCollectionsForHomeSections();
      final genresFuture = _fetchGenresForHomeSections();
      final playlistsFuture = _fetchPlaylistsForHomeSections();
      final discoveredCollections = await collectionsFuture;
      final discoveredGenres = await genresFuture;
      final discoveredPlaylists = await playlistsFuture;
      if (!mounted) return;
      var changed = false;
      setState(() {
        final mergedPluginSections = _mergeDiscoveredPluginSections();
        final mergedCollectionSections = _mergeCollectionSections(discoveredCollections);
        final mergedGenreSections = _mergeGenreSections(discoveredGenres);
        final mergedPlaylistSections = _mergePlaylistSections(discoveredPlaylists);
        changed =
            mergedPluginSections ||
            mergedCollectionSections ||
            mergedGenreSections ||
            mergedPlaylistSections;
        _rebuildFocusNodes();
      });
      if (changed) {
        _persistSections(pushSync: false);
      }
      await _checkEmptyStates();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        if (PlatformDetection.isTV) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            if (FocusManager.instance.primaryFocus?.hasPrimaryFocus ?? false) {
              return;
            }
            final first = _visibleSectionIndices().firstOrNull;
            if (first != null) _focusSectionAndEnsureVisible(first);
          });
        }
      }
    }
  }

  /// Adds plugin-dynamic sections discovered by the Home Screen Sections
  /// plugin and KefinTweaks into the in-memory list (disabled by default)
  /// and prunes stale entries whose section is no longer reported.
  bool _mergeDiscoveredPluginSections() {
    final hssChanged = _mergeHssSections();
    final kefinChanged = _mergeKefinSections();
    return hssChanged || kefinChanged;
  }

  Future<List<_DiscoveredCollectionRow>> _fetchCollectionsForHomeSections() async {
    final showCollectionsRows = _prefs.get(UserPreferences.displayCollectionsRows);
    if (!showCollectionsRows) return const <_DiscoveredCollectionRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      const pageSize = 250;
      var startIndex = 0;
      int? total;
      final all = <_DiscoveredCollectionRow>[];

      while (true) {
        final response = await client.itemsApi.getItems(
          includeItemTypes: const ['BoxSet'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: pageSize,
        );

        total ??= response['TotalRecordCount'] as int?;
        final items = (response['Items'] as List?) ?? const [];
        if (items.isEmpty) break;

        all.addAll(
          items
              .whereType<Map<String, dynamic>>()
              .where((item) =>
                  (item['Id']?.toString() ?? '').isNotEmpty &&
                  (item['Name']?.toString() ?? '').isNotEmpty)
              .map(
                (item) => _DiscoveredCollectionRow(
                  id: item['Id'].toString(),
                  name: item['Name'].toString(),
                ),
              ),
        );

        startIndex += items.length;
        if (items.length < pageSize) break;
        if (total != null && startIndex >= total) break;
      }

      return all;
    } catch (_) {
      return const <_DiscoveredCollectionRow>[];
    }
  }

  bool _mergeCollectionSections(List<_DiscoveredCollectionRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.collections &&
          c.serverId == serverId))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final collection in discovered) {
      final cfg = HomeSectionConfig.pluginDynamic(
        serverId: serverId,
        pluginSection: 'collection',
        pluginAdditionalData: collection.id,
        pluginDisplayText: collection.name,
        pluginSource: HomeSectionPluginSource.collections,
        enabled: existing[
                'pluginDynamic:collections:$serverId:collection:${collection.id}']
                ?.enabled ??
            false,
        order: nextOrder++,
      );
      freshIds.add(cfg.stableId);
      final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
      if (idx >= 0) {
        final updated = _sections[idx].copyWith(
          pluginDisplayText: cfg.pluginDisplayText,
        );
        if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
          _sections[idx] = updated;
          changed = true;
        }
      } else {
        _addSection(cfg);
        changed = true;
      }
    }

    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.collections &&
        s.serverId == serverId &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;

    return changed;
  }

  Future<List<_DiscoveredGenreRow>> _fetchGenresForHomeSections() async {
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    if (!showGenresRows) return const <_DiscoveredGenreRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      final includeItemTypes =
          _prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
      const pageSize = 250;
      var startIndex = 0;
      int? total;
      final all = <_DiscoveredGenreRow>[];

      while (true) {
        final response = await client.itemsApi.getGenres(
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: pageSize,
          fields: 'ItemCounts',
          includeItemTypes: includeItemTypes,
        );
        total ??= response['TotalRecordCount'] as int?;
        final items = (response['Items'] as List?) ?? const [];
        if (items.isEmpty) break;

        all.addAll(
          items
              .whereType<Map<String, dynamic>>()
              .where((item) =>
                  (item['Id']?.toString() ?? '').isNotEmpty &&
                  (item['Name']?.toString() ?? '').isNotEmpty)
              .map(
                (item) => _DiscoveredGenreRow(
                  id: item['Id'].toString(),
                  name: item['Name'].toString(),
                ),
              ),
        );

        startIndex += items.length;
        if (items.length < pageSize) break;
        if (total != null && startIndex >= total) break;
      }

      return all;
    } catch (_) {
      return const <_DiscoveredGenreRow>[];
    }
  }

  Future<List<_DiscoveredPlaylistRow>> _fetchPlaylistsForHomeSections() async {
    final showPlaylistsRows = _prefs.get(UserPreferences.displayPlaylistsRows);
    if (!showPlaylistsRows) return const <_DiscoveredPlaylistRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      const pageSize = 250;
      var startIndex = 0;
      int? total;
      final all = <_DiscoveredPlaylistRow>[];

      while (true) {
        final response = await client.itemsApi.getItems(
          includeItemTypes: const ['Playlist'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: pageSize,
        );

        total ??= response['TotalRecordCount'] as int?;
        final items = (response['Items'] as List?) ?? const [];
        if (items.isEmpty) break;

        all.addAll(
          items
              .whereType<Map<String, dynamic>>()
              .where((item) =>
                  (item['Id']?.toString() ?? '').isNotEmpty &&
                  (item['Name']?.toString() ?? '').isNotEmpty)
              .map(
                (item) => _DiscoveredPlaylistRow(
                  id: item['Id'].toString(),
                  name: item['Name'].toString(),
                ),
              ),
        );

        startIndex += items.length;
        if (items.length < pageSize) break;
        if (total != null && startIndex >= total) break;
      }

      return all;
    } catch (_) {
      return const <_DiscoveredPlaylistRow>[];
    }
  }

  bool _mergePlaylistSections(List<_DiscoveredPlaylistRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.playlists &&
          c.serverId == serverId))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final playlist in discovered) {
      final cfg = HomeSectionConfig.pluginDynamic(
        serverId: serverId,
        pluginSection: 'playlist',
        pluginAdditionalData: playlist.id,
        pluginDisplayText: playlist.name,
        pluginSource: HomeSectionPluginSource.playlists,
        enabled: existing[
                'pluginDynamic:playlists:$serverId:playlist:${playlist.id}']
                ?.enabled ??
            false,
        order: nextOrder++,
      );
      freshIds.add(cfg.stableId);
      final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
      if (idx >= 0) {
        final updated = _sections[idx].copyWith(
          pluginDisplayText: cfg.pluginDisplayText,
        );
        if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
          _sections[idx] = updated;
          changed = true;
        }
      } else {
        _addSection(cfg);
        changed = true;
      }
    }

    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.playlists &&
        s.serverId == serverId &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;

    return changed;
  }

  bool _mergeGenreSections(List<_DiscoveredGenreRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.genres &&
          c.serverId == serverId))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final genre in discovered) {
      final cfg = HomeSectionConfig.pluginDynamic(
        serverId: serverId,
        pluginSection: 'genre',
        pluginAdditionalData: genre.id,
        pluginDisplayText: genre.name,
        pluginSource: HomeSectionPluginSource.genres,
        enabled:
            existing['pluginDynamic:genres:$serverId:genre:${genre.id}']
                ?.enabled ??
            false,
        order: nextOrder++,
      );
      freshIds.add(cfg.stableId);
      final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
      if (idx >= 0) {
        final updated = _sections[idx].copyWith(
          pluginDisplayText: cfg.pluginDisplayText,
        );
        if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
          _sections[idx] = updated;
          changed = true;
        }
      } else {
        _addSection(cfg);
        changed = true;
      }
    }

    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.genres &&
        s.serverId == serverId &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;

    return changed;
  }

  bool _mergeHssSections() {
    if (!GetIt.instance.isRegistered<HomeScreenSectionsService>()) return false;
    final service = GetIt.instance<HomeScreenSectionsService>();
    final discovered = service.availableServers.toList();
    final allProbed = service.allCapabilities.toList();
    if (allProbed.isEmpty) return false;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.hss))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final cap in discovered) {
      for (final section in cap.sections) {
        final cfg = HomeSectionConfig.pluginDynamic(
          serverId: cap.serverId,
          pluginSection: section.section,
          pluginAdditionalData: section.additionalData,
          pluginDisplayText: section.displayText,
          pluginSource: HomeSectionPluginSource.hss,
          enabled: existing[
                  'pluginDynamic:hss:${cap.serverId}:${section.section}:${section.additionalData ?? ''}']
                  ?.enabled ??
              false,
          order: nextOrder++,
        );
        freshIds.add(cfg.stableId);
        final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
        if (idx >= 0) {
          final updated = _sections[idx].copyWith(
            pluginDisplayText: cfg.pluginDisplayText,
          );
          if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
            _sections[idx] = updated;
            changed = true;
          }
        } else {
          _addSection(cfg);
          changed = true;
        }
      }
    }

    final probedServers = allProbed.map((c) => c.serverId).toSet();
    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.hss &&
        s.serverId != null &&
        probedServers.contains(s.serverId) &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;
    return changed;
  }

  bool _mergeKefinSections() {
    if (!GetIt.instance.isRegistered<KefinTweaksService>()) return false;
    final service = GetIt.instance<KefinTweaksService>();
    final discovered = service.availableServers.toList();
    final allProbed = service.allCapabilities.toList();
    if (allProbed.isEmpty) return false;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.kefinTweaks))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final cap in discovered) {
      for (final section in cap.sections) {
        final base = kefinSectionToConfig(
          section,
          cap.serverId,
          enabled: false,
          order: nextOrder++,
        );
        final cfg = base.copyWith(
          enabled: existing[base.stableId]?.enabled ?? false,
        );
        freshIds.add(cfg.stableId);
        final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
        if (idx >= 0) {
          final updated = _sections[idx].copyWith(
            pluginDisplayText: cfg.pluginDisplayText,
            pluginAdditionalData: cfg.pluginAdditionalData,
          );
          if (_sections[idx].pluginDisplayText != updated.pluginDisplayText ||
              _sections[idx].pluginAdditionalData != updated.pluginAdditionalData) {
            _sections[idx] = updated;
            changed = true;
          }
        } else {
          _addSection(cfg);
          changed = true;
        }
      }
    }

    final probedServers = allProbed.map((c) => c.serverId).toSet();
    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.kefinTweaks &&
        s.serverId != null &&
        probedServers.contains(s.serverId) &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;
    return changed;
  }

  void _rebuildFocusNodes() {
    final activeIds = _sections.map((s) => s.stableId).toSet();

    final inactiveIds = _focusNodesByStableId.keys.where((id) => !activeIds.contains(id)).toList();
    for (final id in inactiveIds) {
      _focusNodesByStableId[id]?.dispose();
      _focusNodesByStableId.remove(id);
    }

    for (final section in _sections) {
      if (!_focusNodesByStableId.containsKey(section.stableId)) {
        _focusNodesByStableId[section.stableId] = FocusNode(
          debugLabel: 'section_${section.stableId}',
        );
      }
    }

    _focusNodes.clear();
    for (final section in _sections) {
      _focusNodes.add(_focusNodesByStableId[section.stableId]!);
    }
  }

  @override
  void dispose() {
    for (final n in _focusNodesByStableId.values) {
      n.dispose();
    }
    _focusNodesByStableId.clear();
    _focusNodes.clear();
    super.dispose();
  }

  void _pushSyncSettings() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  void _setMergeContinueWatchingNextUp(bool value, {bool pushSync = true}) {
    _prefs.set(UserPreferences.mergeContinueWatchingNextUp, value);
    if (pushSync) {
      _pushSyncSettings();
    }
  }

  void _persistSections({required bool pushSync}) {
    for (var i = 0; i < _sections.length; i++) {
      _sections[i] = _sections[i].copyWith(order: i);
    }
    final toSave = [..._sections];
    if (_mediaBarConfig != null) toSave.add(_mediaBarConfig!);
    _prefs.setHomeSectionsConfig(toSave);
    if (pushSync) {
      _pushSyncSettings();
    }
  }

  void _save() {
    _persistSections(pushSync: true);
  }

  void _focusSectionAndEnsureVisible(int index, {int attempt = 0}) {
    if (!mounted || index < 0 || index >= _focusNodes.length) return;
    final node = _focusNodes[index];
    if (!node.hasFocus) {
      node.requestFocus();
    }

    final targetContext = _focusNodes[index].context;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        alignment: 0.2,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
      return;
    }

    if (attempt >= 3) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusSectionAndEnsureVisible(index, attempt: attempt + 1);
    });
  }

  void _moveSectionByActualIndex(int fromIndex, int toIndex) {
    if (fromIndex < 0 || fromIndex >= _sections.length) return;
    if (toIndex < 0 || toIndex >= _sections.length) return;
    if (fromIndex == toIndex) return;
    setState(() {
      final item = _sections.removeAt(fromIndex);
      _sections.insert(toIndex, item);
      final node = _focusNodes.removeAt(fromIndex);
      _focusNodes.insert(toIndex, node);
    });
    _save();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (toIndex < _focusNodes.length) {
        _focusSectionAndEnsureVisible(toIndex);
      }
    });
  }

  String _labelFor(HomeSectionConfig cfg, AppLocalizations l10n) {
    if (cfg.isPluginDynamic) {
      return cfg.pluginDisplayText?.isNotEmpty == true
          ? cfg.pluginDisplayText!
          : (cfg.pluginSection ?? l10n.none);
    }
    return _labelForType(cfg.type, l10n);
  }

  String _labelForType(HomeSectionType type, AppLocalizations l10n) => switch (type) {
    HomeSectionType.mediaBar => l10n.mediaBar,
    HomeSectionType.latestMedia => l10n.latestMedia,
    HomeSectionType.recentlyReleased => l10n.recentlyReleased,
    HomeSectionType.libraryTilesSmall => l10n.myMedia,
    HomeSectionType.libraryButtons => l10n.myMediaSmall,
    HomeSectionType.resume => l10n.continueWatching,
    HomeSectionType.resumeAudio => l10n.resumeAudio,
    HomeSectionType.resumeBook => l10n.resumeBooks,
    HomeSectionType.activeRecordings => l10n.activeRecordings,
    HomeSectionType.nextUp => l10n.nextUp,
    HomeSectionType.playlists => l10n.playlists,
    HomeSectionType.favoriteMovies => 'Favorite ${FavoriteTypeFilter.movie.displayName}',
    HomeSectionType.favoriteSeries => 'Favorite ${FavoriteTypeFilter.series.displayName}',
    HomeSectionType.favoriteEpisodes => 'Favorite ${FavoriteTypeFilter.episode.displayName}',
    HomeSectionType.favoritePeople => 'Favorite ${FavoriteTypeFilter.person.displayName}',
    HomeSectionType.favoriteArtists => 'Favorite ${FavoriteTypeFilter.musicArtist.displayName}',
    HomeSectionType.favoriteMusicVideos => 'Favorite ${FavoriteTypeFilter.musicVideo.displayName}',
    HomeSectionType.favoriteAlbums => 'Favorite ${FavoriteTypeFilter.musicAlbum.displayName}',
    HomeSectionType.favoriteSongs => 'Favorite ${FavoriteTypeFilter.audio.displayName}',
    HomeSectionType.collections => l10n.collections,
    HomeSectionType.genres => l10n.genres,
    HomeSectionType.liveTv => l10n.liveTV,
    HomeSectionType.seerrRecentRequests => l10n.recentRequests,
    HomeSectionType.seerrRecentlyAdded => l10n.recentlyAdded,
    HomeSectionType.seerrPopularMovies => l10n.popularMovies,
    HomeSectionType.seerrUpcomingMovies => l10n.upcomingMovies,
    HomeSectionType.seerrPopularSeries => l10n.popularSeries,
    HomeSectionType.seerrUpcomingSeries => l10n.upcomingSeries,
    HomeSectionType.seerrTrending => l10n.trending,
    HomeSectionType.seerrMovieGenres => l10n.movieGenres,
    HomeSectionType.seerrStudios => l10n.studios,
    HomeSectionType.seerrSeriesGenres => l10n.seriesGenres,
    HomeSectionType.seerrNetworks => l10n.networks,
    HomeSectionType.none => l10n.none,
  };

  String _posterSizeLabel(PosterSize size, AppLocalizations l10n) => switch (size) {
    PosterSize.small => l10n.small,
    PosterSize.medium => l10n.medium,
    PosterSize.large => l10n.large,
    PosterSize.extraLarge => l10n.extraLarge,
  };

  String _rowsStyleLabel(HomeRowsStyle style) => switch (style) {
    HomeRowsStyle.v1 => 'Classic',
    HomeRowsStyle.v2 => 'Modern',
  };

  Future<void> _showPosterSizeDialog() async {
    await showFocusRestoringDialog<void>(
      context: context,
      builder: (ctx) => withCleanSettingsTypography(
        ctx,
        PosterSizeSettingsDialog(
          prefs: _prefs,
          onChanged: () => setState(() {}),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _isLoading ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        onEnd: () {
          if (!_isLoading && mounted) {
            setState(() {
              _showOverlay = false;
            });
          }
        },
        child: Container(
          color: theme.colorScheme.surface,
          alignment: Alignment.center,
          child: const PlayerLoadingOverlay(
            logoSize: 80,
            labelSpacing: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.homeSections),
          actions: [
            IconButton(
              icon: const Icon(Icons.restore),
              tooltip: l10n.resetToDefaults,
              onPressed: () {
                setState(() {
                  _sections = HomeSectionConfig.defaults();
                  _rebuildFocusNodes();
                  _setMergeContinueWatchingNextUp(
                    UserPreferences.mergeContinueWatchingNextUp.defaultValue,
                    pushSync: false,
                  );
                });
                _save();
              },
            ),
          ],
        ),
        body: ExcludeFocus(
          excluding: _isLoading,
          child: IgnorePointer(
            ignoring: _isLoading,
            child: Stack(
              children: [
                PlatformDetection.isTV
                    ? _buildTvList(l10n)
                    : _buildReorderableList(l10n),
                if (_showOverlay)
                  _buildLoadingOverlay(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_size_select_large),
          title: Text(l10n.cardSize),
          subtitle: Text(_posterSizeLabel(_prefs.get(UserPreferences.posterSize), l10n)),
          trailing: const Icon(Icons.chevron_right),
          onTap: _showPosterSizeDialog,
        ),
        const Divider(),
        EnumPreferenceTile<HomeRowsStyle>(
          preference: UserPreferences.homeRowsStyle,
          title: l10n.rowsType,
          icon: Icons.view_carousel,
          description: _rowsTypeDescription,
          labelOf: _rowsStyleLabel,
          onChanged: () {
            setState(() {});
            _pushSyncSettings();
          },
        ),
        const Divider(),
        SwitchListTile(
          secondary: const Icon(Icons.merge_type),
          title: Text(l10n.mergeContinueWatchingAndNextUp),
          subtitle: Text(l10n.combineBothRows),
          value: _prefs.get(UserPreferences.mergeContinueWatchingNextUp),
          onChanged: (value) {
            _setMergeContinueWatchingNextUp(value);
            setState(() {});
          },
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildReorderableList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      header: widget.showGeneralOptions ? _buildHeader(l10n) : null,
      itemCount: visibleIndices.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex--;
        if (oldIndex < 0 || oldIndex >= visibleIndices.length) return;
        if (newIndex < 0 || newIndex > visibleIndices.length) return;

        final fromActual = visibleIndices[oldIndex];
        var toActual =
            newIndex >= visibleIndices.length ? _sections.length : visibleIndices[newIndex];

        if (toActual > fromActual) {
          toActual--;
        }

        if (toActual == fromActual) return;

        setState(() {
          final item = _sections.removeAt(fromActual);
          _sections.insert(toActual, item);
          final node = _focusNodes.removeAt(fromActual);
          _focusNodes.insert(toActual, node);
        });
        _save();
      },
      itemBuilder: (context, index) {
        final sectionIndex = visibleIndices[index];
        final section = _sections[sectionIndex];
        final isEmpty = _emptySectionIds.contains(section.stableId);
        return Padding(
          key: ValueKey(section.stableId),
          padding: _kHomeSectionTileOuterPadding,
          child: Opacity(
            opacity: isEmpty ? 0.45 : 1.0,
            child: Container(
              decoration: _homeSectionTileDecoration(context, focused: false),
              child: ListTile(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                contentPadding: _kHomeSectionTileContentPadding,
                minLeadingWidth: 44,
                horizontalTitleGap: 14,
                leading: buildSettingsLeadingIconShell(
                  context,
                  icon: Icon(
                    (section.enabled && !isEmpty) ? Icons.check_box : Icons.check_box_outline_blank,
                  ),
                  focused: false,
                  iconColor: AppColorScheme.onSurface.withValues(alpha: 0.78),
                ),
                title: Row(
                  children: [
                    Text(
                      _labelFor(section, l10n),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: kCleanSettingsFontFamily,
                      ),
                    ),
                    if (isEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.red.withValues(alpha: 0.5), width: 0.8),
                        ),
                        child: Text(
                          l10n.empty,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: kCleanSettingsFontFamily,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                subtitle: section.isPluginDynamic
                    ? Text(
                        _pluginSubtitle(section),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: kCleanSettingsFontFamily,
                          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      )
                    : (_isSeerrSectionType(section.type)
                        ? Text(
                            'Seerr Discovery Rows',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: kCleanSettingsFontFamily,
                              color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          )
                        : null),
                onTap: isEmpty
                    ? null
                    : () {
                        setState(() {
                          _sections[sectionIndex] =
                              section.copyWith(enabled: !section.enabled);
                        });
                        _save();
                      },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ReorderableDragStartListener(
                      index: index,
                      child: Icon(
                        Icons.drag_handle,
                        color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTvList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    return ListView.builder(
      cacheExtent: 3000.0,
      itemCount: visibleIndices.length + (widget.showGeneralOptions ? 1 : 0),
      itemBuilder: (context, index) {
        if (widget.showGeneralOptions && index == 0) {
          return _buildHeader(l10n);
        }
        final visibleIndex = index - (widget.showGeneralOptions ? 1 : 0);
        final sectionIndex = visibleIndices[visibleIndex];
        final section = _sections[sectionIndex];
        final isEmpty = _emptySectionIds.contains(section.stableId);
        return _HomeSectionTile(
          key: ValueKey(section.stableId),
          focusNode: _focusNodes[sectionIndex],
          autofocus: visibleIndex == 0 && !isEmpty,
          label: _labelFor(section, l10n),
          subtitle: section.isPluginDynamic
              ? _pluginSubtitle(section)
              : (_isSeerrSectionType(section.type)
                  ? 'Seerr Discovery Rows'
                  : null),
          enabled: section.enabled,
          isFirst: visibleIndex == 0,
          isLast: visibleIndex == visibleIndices.length - 1,
          isEmpty: isEmpty,
          onToggle: (enabled) {
            setState(() {
              _sections[sectionIndex] = section.copyWith(enabled: enabled);
            });
            _save();
          },
          onMoveUp: () {
            if (visibleIndex == 0) return;
            _moveSectionByActualIndex(sectionIndex, visibleIndices[visibleIndex - 1]);
          },
          onMoveDown: () {
            if (visibleIndex >= visibleIndices.length - 1) return;
            _moveSectionByActualIndex(sectionIndex, visibleIndices[visibleIndex + 1]);
          },
        );
      },
    );
  }

  String _pluginSubtitle(HomeSectionConfig section) {
    return switch (section.pluginSource) {
      HomeSectionPluginSource.collections => 'Collections row',
      HomeSectionPluginSource.genres => 'Genres row',
      HomeSectionPluginSource.playlists => 'Playlists row',
      HomeSectionPluginSource.kefinTweaks => 'KefinTweaks plugin',
      HomeSectionPluginSource.hss => 'Home Screen Sections plugin',
    };
  }
}

class _DiscoveredCollectionRow {
  final String id;
  final String name;

  const _DiscoveredCollectionRow({
    required this.id,
    required this.name,
  });
}

class _DiscoveredGenreRow {
  final String id;
  final String name;

  const _DiscoveredGenreRow({
    required this.id,
    required this.name,
  });
}

class _DiscoveredPlaylistRow {
  final String id;
  final String name;

  const _DiscoveredPlaylistRow({
    required this.id,
    required this.name,
  });
}

class _HomeSectionTile extends StatefulWidget {
  final FocusNode focusNode;
  final String label;
  final String? subtitle;
  final bool enabled;
  final bool isFirst;
  final bool isLast;
  final bool autofocus;
  final bool isEmpty;
  final ValueChanged<bool> onToggle;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _HomeSectionTile({
    super.key,
    required this.focusNode,
    required this.label,
    this.subtitle,
    required this.enabled,
    required this.isFirst,
    required this.isLast,
    this.autofocus = false,
    this.isEmpty = false,
    required this.onToggle,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  State<_HomeSectionTile> createState() => _HomeSectionTileState();
}

class _HomeSectionTileState extends State<_HomeSectionTile> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _HomeSectionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasFocus = widget.focusNode.hasFocus;
    if (_focused != hasFocus) {
      _focused = hasFocus;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Focus(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      canRequestFocus: !widget.isEmpty,
      onFocusChange: (f) {
        if (_focused != f && mounted) {
          setState(() => _focused = f);
        }
        if (f) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || !_focused) return;
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              alignment: 0.2,
              alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
            );
          });
        }
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft && !widget.isFirst) {
          widget.onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight && !widget.isLast) {
          widget.onMoveDown();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          widget.onToggle(!widget.enabled);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Padding(
        padding: _kHomeSectionTileOuterPadding,
        child: Opacity(
          opacity: widget.isEmpty ? 0.45 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            decoration: _homeSectionTileDecoration(context, focused: _focused),
            child: ListTile(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              contentPadding: _kHomeSectionTileContentPadding,
              minLeadingWidth: 44,
              horizontalTitleGap: 14,
              leading: buildSettingsLeadingIconShell(
                context,
                icon: Icon(
                  (widget.enabled && !widget.isEmpty) ? Icons.check_box : Icons.check_box_outline_blank,
                ),
                focused: _focused,
                iconColor: _focused
                    ? AppColors.black.withValues(alpha: 0.54)
                    : AppColorScheme.onSurface.withValues(alpha: 0.78),
              ),
              title: Row(
                children: [
                  Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: kCleanSettingsFontFamily,
                      color: _focused
                          ? AppColors.black.withValues(alpha: 0.87)
                          : AppColorScheme.onSurface,
                    ),
                  ),
                  if (widget.isEmpty) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.red.withValues(alpha: 0.5), width: 0.8),
                      ),
                      child: Text(
                        l10n.empty,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: kCleanSettingsFontFamily,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              subtitle: widget.subtitle != null
                  ? Text(
                      widget.subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: kCleanSettingsFontFamily,
                        color: _focused
                            ? AppColors.black.withValues(alpha: 0.54)
                            : AppColorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    )
                  : null,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.isFirst)
                    Icon(
                      Icons.arrow_left,
                      size: 18,
                      color: _focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  if (!widget.isLast)
                    Icon(
                      Icons.arrow_right,
                      size: 18,
                      color: _focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
