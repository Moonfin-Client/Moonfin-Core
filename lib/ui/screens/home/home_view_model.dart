import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/repositories/multi_server_repository.dart';
import '../../../data/services/home_row_cache_store.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/media_bar_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../l10n/current_app_localizations.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/utils/bounded_concurrency.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../data/viewmodels/seerr_discover_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  final RowDataSource _dataSource;
  final UserPreferences _prefs;
  final MediaServerClient _client;
  final MediaBarViewModel _mediaBarViewModel;
  final MultiServerRepository _multiServerRepo;
  final String _ownerUserId;
  final HomeRowCacheStore _cacheStore = HomeRowCacheStore();
  final Set<String> _inFlightPagingRowIds = {};
  final Map<String, int> _rowOffsets = {};

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _bgMergeInFlight = false;
  bool _reloadRequestedWhileLoading = false;
  bool _pendingReloadPreserveExisting = true;

  String get _serverId => _client.baseUrl;
  MediaBarViewModel get mediaBarViewModel => _mediaBarViewModel;

  bool get _multiServerEnabled =>
      _prefs.get(UserPreferences.enableMultiServerLibraries);

  String _homeCacheKey() {
    final userId = _ownerUserId;
    final sections = _prefs.get(UserPreferences.homeSectionsJson);
    final multiServer = _prefs.get(UserPreferences.enableMultiServerLibraries);
    final merge = _prefs.get(UserPreferences.mergeContinueWatchingNextUp);
    final blocked = _prefs.get(UserPreferences.blockedParentalRatings);
    return '$_serverId|$userId|$sections|$multiServer|$merge|$blocked';
  }

  static bool _isFavoriteSectionType(HomeSectionType type) {
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

  static bool _isCollectionsSectionType(HomeSectionType type) {
    return type == HomeSectionType.collections;
  }

  static bool _isGenresSectionType(HomeSectionType type) {
    return type == HomeSectionType.genres;
  }

  static bool _isPlaylistsSectionType(HomeSectionType type) {
    return type == HomeSectionType.playlists;
  }

  static bool _isSeerrSectionType(HomeSectionType type) {
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

  ImageApi imageApiForServer(String serverId) {
    if (!_multiServerEnabled) return _dataSource.imageApi;
    return _multiServerRepo.getImageApiForServer(serverId);
  }

  HomeViewModel({
    required RowDataSource dataSource,
    required UserPreferences prefs,
    required MediaServerClient client,
    required MediaBarViewModel mediaBarViewModel,
    required MultiServerRepository multiServerRepo,
  })  : _dataSource = dataSource,
        _prefs = prefs,
        _client = client,
        _mediaBarViewModel = mediaBarViewModel,
        _multiServerRepo = multiServerRepo,
        _ownerUserId = client.userId ?? '';

  Future<void> load({bool preserveExisting = false}) async {
    if (_isLoading) {
      _reloadRequestedWhileLoading = true;
      _pendingReloadPreserveExisting =
          _pendingReloadPreserveExisting && preserveExisting;
      return;
    }
    _isLoading = true;
    notifyListeners();
    _rowOffsets.clear();
    _multiServerRepo.clearOffsets();
    try {
      var hydratedFromCache = false;
      if (_rows.isEmpty) {
        final cached = await _cacheStore.read(_homeCacheKey());
        if (cached != null && _rows.isEmpty) {
          _rows = cached;
          hydratedFromCache = true;
          notifyListeners();
        }
      }

      final activeConfigs = _prefs.activeHomeSectionConfigs;
      final fallbackUsed = activeConfigs.isEmpty;
      final configs = fallbackUsed
          ? const [
              HomeSectionConfig(type: HomeSectionType.resume, enabled: true, order: 0),
              HomeSectionConfig(type: HomeSectionType.nextUp, enabled: true, order: 1),
              HomeSectionConfig(type: HomeSectionType.latestMedia, enabled: true, order: 2),
            ]
          : activeConfigs;
      final showFavoritesRows =
          _prefs.get(UserPreferences.displayFavoritesRows);
      final showCollectionsRows =
          _prefs.get(UserPreferences.displayCollectionsRows);
        final showGenresRows =
          _prefs.get(UserPreferences.displayGenresRows);
      final showPlaylistsRows =
          _prefs.get(UserPreferences.displayPlaylistsRows);
      final showSeerrRows =
          _prefs.get(UserPreferences.displaySeerrRows) &&
          GetIt.instance<PluginSyncService>().seerrAvailable;

      // Plugin-dynamic sections only make sense on the active server.
      final visibleConfigsRaw = configs
          .where(
          (c) =>
            (c.isBuiltin || (c.serverId != null && c.serverId == _serverId)) &&
            (showFavoritesRows || !_isFavoriteSectionType(c.type)) &&
            (showCollectionsRows ||
              !((c.isBuiltin && _isCollectionsSectionType(c.type)) ||
                (c.isPluginDynamic &&
                  c.pluginSource ==
                    HomeSectionPluginSource.collections))) &&
            (showGenresRows ||
              !((c.isBuiltin && _isGenresSectionType(c.type)) ||
                (c.isPluginDynamic &&
                  c.pluginSource == HomeSectionPluginSource.genres))) &&
            (showPlaylistsRows ||
              !((c.isBuiltin && _isPlaylistsSectionType(c.type)) ||
                (c.isPluginDynamic &&
                  c.pluginSource == HomeSectionPluginSource.playlists))) &&
            (showSeerrRows || !_isSeerrSectionType(c.type)),
          )
          .toList(growable: false);

      // Filter out plugin-dynamic rows that duplicate already-enabled built-ins
      // and collapse equivalent rows across HSS/KefinTweaks so only the first
      // configured plugin row in a duplicate group remains visible.
      final enabledBuiltinKeys = visibleConfigsRaw
          .where((c) => c.isBuiltin)
          .expand(_duplicateKeysForConfig)
          .toSet();
      final seenPluginKeys = <String>{};
      final visibleConfigs = visibleConfigsRaw.where((c) {
        if (!c.isPluginDynamic) return true;
        final duplicateKeys = _duplicateKeysForConfig(c);
        if (duplicateKeys.any(enabledBuiltinKeys.contains)) {
          return false;
        }
        final duplicatesExistingPlugin =
            duplicateKeys.any(seenPluginKeys.contains);
        if (!duplicatesExistingPlugin) {
          seenPluginKeys.addAll(duplicateKeys);
        }
        return !duplicatesExistingPlugin;
      }).toList(growable: false);

      final sections = visibleConfigs
          .where((c) => c.isBuiltin)
          .map((c) => c.type)
          .toList();

      if (!sections.contains(HomeSectionType.mediaBar)) {
        _mediaBarViewModel.load();
      }

      final merge = _prefs.get(UserPreferences.mergeContinueWatchingNextUp);
      final effectiveConfigs = visibleConfigs
          .where((c) => !(c.isBuiltin && merge && c.type == HomeSectionType.nextUp))
          .toList();

      final nonResumeEffectiveConfigs = merge
          ? effectiveConfigs
              .where((c) => !(c.isBuiltin && c.type == HomeSectionType.resume))
              .toList()
          : effectiveConfigs;

      final showMergedResume =
          merge &&
          effectiveConfigs.any(
            (c) => c.isBuiltin && c.type == HomeSectionType.resume,
          );

      if ((!preserveExisting && !hydratedFromCache) || _rows.isEmpty) {
        final placeholders = <HomeRow>[];
        for (final cfg in effectiveConfigs) {
          final placeholder = _placeholderForConfig(cfg);
          if (placeholder != null) {
            placeholders.add(placeholder);
          }
        }
        _rows = placeholders;
        notifyListeners();
      } else {
        final reconciledRows = _reconcilePreservedRows(effectiveConfigs);
        if (!listEquals(_rows, reconciledRows)) {
          _rows = reconciledRows;
          notifyListeners();
        }
      }

      final completers = <Future<void>>[];
      for (final cfg in nonResumeEffectiveConfigs) {
        completers.add(() async {
          List<HomeRow> sectionRows;
          try {
            sectionRows = await _loadConfig(cfg);
          } catch (_) {
            sectionRows = const <HomeRow>[];
          }
          final loadedRows = sectionRows
              .map((r) => r.copyWith(items: _filterEmptyElements(r.items)))
              .where((r) => r.items.isNotEmpty || r.rowType == HomeRowType.liveTv)
              .toList();
          final placeholder = _placeholderForConfig(cfg);
          final loadedIds = loadedRows.map((r) => r.id).toSet();
          // Find the row that immediately follows this section's placeholder /
          // existing rows, so we can re-anchor after removals.

          String? anchorId;
          {
            // Walk forward past the section's current rows to find the next
            // sibling row that won't be removed.
            bool pastSection = false;
            for (final r in _rows) {
              final willRemove = (placeholder != null && r.id == placeholder.id) ||
                  loadedIds.contains(r.id) ||
                  _rowBelongsToConfig(r, cfg);
              if (willRemove) {
                pastSection = true;
              } else if (pastSection) {
                anchorId = r.id;
                break;
              }
            }
          }
          _rows.removeWhere((r) =>
              (placeholder != null && r.id == placeholder.id) ||
              loadedIds.contains(r.id) ||
              // Also clear any stale rows that belonged to this section from a
              // prior load but were not included in the fresh result. This
              // prevents phantom rows when the section's row-set changes
              // (e.g. library added/removed, latestItemsExcludes updated).
              _rowBelongsToConfig(r, cfg));

          if (loadedRows.isNotEmpty) {
            final insertIndex = anchorId != null
                ? _rows.indexWhere((r) => r.id == anchorId)
                : -1;
            if (insertIndex < 0) {
              _rows.addAll(loadedRows);
            } else {
              _rows.insertAll(insertIndex, loadedRows);
            }
          }
          notifyListeners();
        }());
      }

      await Future.wait(completers);

      unawaited(_cacheStore.write(_homeCacheKey(), _rows));

      if (showMergedResume) {
        _loadResumeAndNextUpInBackground();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
      if (_reloadRequestedWhileLoading) {
        final nextPreserveExisting = _pendingReloadPreserveExisting;
        _reloadRequestedWhileLoading = false;
        _pendingReloadPreserveExisting = true;
        await load(preserveExisting: nextPreserveExisting);
      }
    }
  }

  List<HomeRow> _reconcilePreservedRows(List<HomeSectionConfig> effectiveConfigs) {
    final currentRows = _rows;
    final reconciledRows = <HomeRow>[];

    for (final cfg in effectiveConfigs) {
      final existingRows = _rowsForConfig(currentRows, cfg);
      if (existingRows.isNotEmpty) {
        reconciledRows.addAll(existingRows);
        continue;
      }

      final placeholder = _placeholderForConfig(cfg);
      if (placeholder != null) {
        reconciledRows.add(placeholder);
      }
    }

    return reconciledRows;
  }

  List<HomeRow> _rowsForConfig(List<HomeRow> rows, HomeSectionConfig cfg) {
    return rows.where((row) => _rowBelongsToConfig(row, cfg)).toList(growable: false);
  }

  List<AggregatedItem> _filterEmptyElements(List<AggregatedItem> items) {
    return items.where((item) {
      if (item.type == 'BoxSet' || item.type == 'Playlist') {
        if (item.childCount == 0 || item.recursiveItemCount == 0) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  bool _rowBelongsToConfig(HomeRow row, HomeSectionConfig cfg) {
    if (cfg.isPluginDynamic) {
      return row.id == cfg.stableId;
    }

    switch (cfg.type) {
      case HomeSectionType.resume:
        return row.rowType == HomeRowType.resume;
      case HomeSectionType.resumeAudio:
        return row.rowType == HomeRowType.resumeAudio;
      case HomeSectionType.nextUp:
        return row.rowType == HomeRowType.nextUp;
      case HomeSectionType.latestMedia:
        // Only claim rows that belong to the built-in latest-media section.
        // Plugin-dynamic rows (per-collection, per-playlist, etc.) have IDs
        // starting with 'pluginDynamic:' and must NOT be claimed here.
        return row.rowType == HomeRowType.latestMedia &&
            !row.id.startsWith('pluginDynamic:');
      case HomeSectionType.favoriteMovies:
      case HomeSectionType.favoriteSeries:
      case HomeSectionType.favoriteEpisodes:
      case HomeSectionType.favoritePeople:
      case HomeSectionType.favoriteArtists:
      case HomeSectionType.favoriteMusicVideos:
      case HomeSectionType.favoriteAlbums:
      case HomeSectionType.favoriteSongs:
        return row.rowType == HomeRowType.favorites &&
            row.id == _favoriteRowIdForSection(cfg.type);
      case HomeSectionType.collections:
        // Only claim the single aggregated collections row (id == 'collections').
        // Individual per-collection plugin rows have stableId-based IDs and
        // must NOT be claimed by the built-in section.
        return row.rowType == HomeRowType.collections &&
            !row.id.startsWith('pluginDynamic:');
      case HomeSectionType.genres:
        return row.rowType == HomeRowType.genres &&
            !row.id.startsWith('pluginDynamic:');
      case HomeSectionType.libraryTilesSmall:
        return row.rowType == HomeRowType.libraryTiles;
      case HomeSectionType.libraryButtons:
        return row.rowType == HomeRowType.libraryTilesSmall;
      case HomeSectionType.playlists:
        return row.rowType == HomeRowType.playlists &&
            !row.id.startsWith('pluginDynamic:');
      case HomeSectionType.liveTv:
        return row.rowType == HomeRowType.liveTv ||
            row.rowType == HomeRowType.liveTvOnNow;
      case HomeSectionType.activeRecordings:
        return row.rowType == HomeRowType.activeRecordings;
      case HomeSectionType.seerrRecentRequests:
        return row.id == 'seerr_recent_requests';
      case HomeSectionType.seerrRecentlyAdded:
        return row.id == 'seerr_recently_added';
      case HomeSectionType.seerrPopularMovies:
        return row.id == 'seerr_popular_movies';
      case HomeSectionType.seerrUpcomingMovies:
        return row.id == 'seerr_upcoming_movies';
      case HomeSectionType.seerrPopularSeries:
        return row.id == 'seerr_popular_series';
      case HomeSectionType.seerrUpcomingSeries:
        return row.id == 'seerr_upcoming_series';
      case HomeSectionType.seerrTrending:
        return row.id == 'seerr_trending';
      case HomeSectionType.seerrMovieGenres:
        return row.id == 'seerr_movie_genres';
      case HomeSectionType.seerrStudios:
        return row.id == 'seerr_studios';
      case HomeSectionType.seerrSeriesGenres:
        return row.id == 'seerr_series_genres';
      case HomeSectionType.seerrNetworks:
        return row.id == 'seerr_networks';
      case HomeSectionType.mediaBar:
      case HomeSectionType.recentlyReleased:
      case HomeSectionType.resumeBook:
      case HomeSectionType.none:
        return false;
    }
  }

  Future<void> refresh({bool preserveExisting = true}) async {
    await load(preserveExisting: preserveExisting);
  }

  Future<void> loadMoreForRow(int rowIndex) async {
    if (rowIndex < 0 || rowIndex >= _rows.length) return;
    final row = _rows[rowIndex];
    if (!row.hasMore || _inFlightPagingRowIds.contains(row.id)) return;

    _inFlightPagingRowIds.add(row.id);
    try {
      final int currentOffset = _rowOffsets[row.id] ?? row.items.length;
      final (List<AggregatedItem> items, int totalCount) result;
      if (_multiServerEnabled && !row.id.startsWith('pluginDynamic:')) {
        result = await _multiServerRepo.loadMore(row: row);
      } else {
        result = await _dataSource.loadMore(row: row, serverId: _serverId, offset: currentOffset);
      }
      _rowOffsets[row.id] = currentOffset + 15;

      final filteredItems = _filterEmptyElements(result.$1);
      _rows = List.of(_rows);
      _rows[rowIndex] = row.copyWith(
        items: filteredItems,
        totalCount: result.$2 - (result.$1.length - filteredItems.length),
      );
      notifyListeners();
    } catch (_) {
    } finally {
      _inFlightPagingRowIds.remove(row.id);
    }
  }

  Future<List<HomeRow>> _loadConfig(HomeSectionConfig cfg) async {
    if (cfg.isPluginDynamic) {
      final section = cfg.pluginSection;
      if (section == null || section.isEmpty) return const [];
      final row = await _dataSource.loadDynamicSection(
        rowId: cfg.stableId,
        section: section,
        title: cfg.pluginDisplayText ?? section,
        serverId: cfg.serverId ?? _serverId,
        additionalData: cfg.pluginAdditionalData,
        pluginSource: cfg.pluginSource,
      );
      return [row];
    }
    return _loadSection(cfg.type);
  }

  HomeRow? _placeholderForConfig(HomeSectionConfig cfg) {
    if (cfg.isPluginDynamic) {
      final section = cfg.pluginSection;
      if (section == null || section.isEmpty) return null;
      return HomeRow(
        id: cfg.stableId,
        title: cfg.pluginDisplayText ?? section,
        rowType: HomeRowType.pluginDynamic,
        isLoading: true,
      );
    }
    return _placeholderForSection(cfg.type);
  }

  /// Maps a Home Screen Sections plugin section name to the equivalent
  /// built-in [HomeSectionType] when one exists. Used to suppress duplicate
  /// rows when both the native section and its plugin counterpart are enabled.
  static HomeSectionType? _builtinForPluginSection(String? section) {
    if (section == null) return null;
    switch (section) {
      case 'ContinueWatching':
        return HomeSectionType.resume;
      case 'ContinueListening':
      case 'ResumeAudio':
        return HomeSectionType.resumeAudio;
      case 'ContinueReading':
      case 'ResumeBook':
        return HomeSectionType.resumeBook;
      case 'NextUp':
        return HomeSectionType.nextUp;
      case 'LiveTv':
      case 'LiveTV':
        return HomeSectionType.liveTv;
      case 'MyMedia':
        return HomeSectionType.libraryTilesSmall;
      case 'MyMediaSmall':
        return HomeSectionType.libraryButtons;
      case 'LatestMovies':
      case 'LatestShows':
      case 'LatestMedia':
        return HomeSectionType.latestMedia;
      case 'RecentlyReleased':
      case 'RecentlyReleasedMovies':
      case 'RecentlyReleasedEpisodes':
        return HomeSectionType.recentlyReleased;
      case 'Playlists':
        return HomeSectionType.playlists;
      case 'FavoriteMovies':
        return HomeSectionType.favoriteMovies;
      case 'FavoriteSeries':
        return HomeSectionType.favoriteSeries;
      case 'FavoriteEpisodes':
        return HomeSectionType.favoriteEpisodes;
      case 'FavoritePeople':
        return HomeSectionType.favoritePeople;
      case 'FavoriteArtists':
        return HomeSectionType.favoriteArtists;
      case 'FavoriteMusicVideos':
        return HomeSectionType.favoriteMusicVideos;
      case 'FavoriteAlbums':
        return HomeSectionType.favoriteAlbums;
      case 'FavoriteSongs':
        return HomeSectionType.favoriteSongs;
      case 'Collections':
        return HomeSectionType.collections;
      case 'Genres':
        return HomeSectionType.genres;
      case 'ActiveRecordings':
        return HomeSectionType.activeRecordings;
      default:
        return null;
    }
  }

  static Set<String> _duplicateKeysForConfig(HomeSectionConfig cfg) {
    if (cfg.isBuiltin) {
      return _duplicateKeysForBuiltin(cfg.type);
    }

    switch (cfg.pluginSource) {
      case HomeSectionPluginSource.collections:
      case HomeSectionPluginSource.genres:
      case HomeSectionPluginSource.playlists:
        return const <String>{};
      case HomeSectionPluginSource.hss:
        final builtin = _builtinForPluginSection(cfg.pluginSection);
        return builtin == null ? const <String>{} : _duplicateKeysForBuiltin(builtin);
      case HomeSectionPluginSource.kefinTweaks:
        return _duplicateKeysForKefinSection(
          cfg.pluginSection,
          cfg.pluginAdditionalData,
        );
    }
  }

  static Set<String> _duplicateKeysForBuiltin(HomeSectionType type) {
    switch (type) {
      case HomeSectionType.latestMedia:
        return const {'latestMedia'};
      case HomeSectionType.recentlyReleased:
        return const {'recentlyReleased'};
      case HomeSectionType.resume:
        return const {'resume'};
      case HomeSectionType.resumeAudio:
        return const {'resumeAudio'};
      case HomeSectionType.resumeBook:
        return const {'resumeBook'};
      case HomeSectionType.nextUp:
        return const {'nextUp'};
      case HomeSectionType.liveTv:
        return const {'liveTv'};
      case HomeSectionType.libraryTilesSmall:
        return const {'libraryTiles'};
      case HomeSectionType.libraryButtons:
        return const {'libraryButtons'};
      case HomeSectionType.playlists:
        return const {'playlists'};
      case HomeSectionType.favoriteMovies:
        return const {'favoriteMovies'};
      case HomeSectionType.favoriteSeries:
        return const {'favoriteSeries'};
      case HomeSectionType.favoriteEpisodes:
        return const {'favoriteEpisodes'};
      case HomeSectionType.favoritePeople:
        return const {'favoritePeople'};
      case HomeSectionType.favoriteArtists:
        return const {'favoriteArtists'};
      case HomeSectionType.favoriteMusicVideos:
        return const {'favoriteMusicVideos'};
      case HomeSectionType.favoriteAlbums:
        return const {'favoriteAlbums'};
      case HomeSectionType.favoriteSongs:
        return const {'favoriteSongs'};
      case HomeSectionType.collections:
        return const {'collections'};
      case HomeSectionType.genres:
        return const {'genres'};
      case HomeSectionType.activeRecordings:
        return const {'activeRecordings'};
      case HomeSectionType.seerrRecentRequests:
        return const {'seerrRecentRequests'};
      case HomeSectionType.seerrRecentlyAdded:
        return const {'seerrRecentlyAdded'};
      case HomeSectionType.seerrPopularMovies:
        return const {'seerrPopularMovies'};
      case HomeSectionType.seerrUpcomingMovies:
        return const {'seerrUpcomingMovies'};
      case HomeSectionType.seerrPopularSeries:
        return const {'seerrPopularSeries'};
      case HomeSectionType.seerrUpcomingSeries:
        return const {'seerrUpcomingSeries'};
      case HomeSectionType.seerrTrending:
        return const {'seerrTrending'};
      case HomeSectionType.seerrMovieGenres:
        return const {'seerrMovieGenres'};
      case HomeSectionType.seerrStudios:
        return const {'seerrStudios'};
      case HomeSectionType.seerrSeriesGenres:
        return const {'seerrSeriesGenres'};
      case HomeSectionType.seerrNetworks:
        return const {'seerrNetworks'};
      case HomeSectionType.mediaBar:
      case HomeSectionType.none:
        return const <String>{};
    }
  }

  static Set<String> _duplicateKeysForKefinSection(
    String? section,
    String? additionalData,
  ) {
    final kind = _kefinKind(section, additionalData);
    switch (kind) {
      case 'recentlyReleasedMovies':
      case 'recentlyReleasedEpisodes':
        return _duplicateKeysForBuiltin(HomeSectionType.recentlyReleased);
      case 'recentlyAddedInLibrary':
        return _duplicateKeysForBuiltin(HomeSectionType.latestMedia);
      default:
        return const <String>{};
    }
  }

  static String? _kefinKind(String? section, String? additionalData) {
    if (additionalData != null && additionalData.isNotEmpty) {
      try {
        final decoded = jsonDecode(additionalData);
        if (decoded is Map<String, dynamic>) {
          final kind = decoded['kind']?.toString();
          if (kind != null && kind.isNotEmpty) {
            return kind;
          }
        }
      } catch (_) {}
    }

    if (section == null || section.isEmpty) return null;
    final prefixIndex = section.indexOf(':');
    if (prefixIndex >= 0 && prefixIndex + 1 < section.length) {
      return section.substring(prefixIndex + 1);
    }
    return section;
  }

  Future<List<HomeRow>> _loadSection(HomeSectionType section) async {
    final l10n = currentAppLocalizations();
    final favoritesSortBy =
        _prefs.get(UserPreferences.favoritesRowSortBy).apiValue;
    final collectionsSortBy =
        _prefs.get(UserPreferences.collectionsRowSortBy).apiValue;
    final genresSortBy = _prefs.get(UserPreferences.genresRowSortBy).apiValue;
    final genresItemFilter = _prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
    const sortOrder = 'Ascending';
    switch (section) {
      case HomeSectionType.resume:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedResume()
            : await _dataSource.loadResume(_serverId)];
      case HomeSectionType.resumeAudio:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedResumeAudio()
            : await _dataSource.loadResumeAudio(_serverId)];
      case HomeSectionType.nextUp:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedNextUp()
            : await _dataSource.loadNextUp(_serverId)];
      case HomeSectionType.latestMedia:
        return _multiServerEnabled
            ? await _multiServerRepo.getAggregatedLatestMediaRows()
            : _loadLatestMediaRows();
      case HomeSectionType.playlists:
        final playlistsSortBy =
            _prefs.get(UserPreferences.playlistsRowSortBy).apiValue;
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedPlaylists(
                sortBy: playlistsSortBy,
                sortOrder: sortOrder,
              )
            : await _dataSource.loadPlaylists(
                _serverId,
                sortBy: playlistsSortBy,
                sortOrder: sortOrder,
              )];
      case HomeSectionType.favoriteMovies:
      case HomeSectionType.favoriteSeries:
      case HomeSectionType.favoriteEpisodes:
      case HomeSectionType.favoritePeople:
      case HomeSectionType.favoriteArtists:
      case HomeSectionType.favoriteMusicVideos:
      case HomeSectionType.favoriteAlbums:
      case HomeSectionType.favoriteSongs:
        final favoriteFilter = _favoriteFilterForSection(section);
        final rowId = _favoriteRowIdForSection(section);
        final title = _favoriteTitleForSection(section, l10n);
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedFavorites(
                  rowId: rowId,
                  title: title,
                  includeItemTypes: favoriteFilter.itemTypes,
                  sortBy: favoritesSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadFavorites(
                  _serverId,
                  rowId: rowId,
                  title: title,
                  includeItemTypes: favoriteFilter.itemTypes,
                  sortBy: favoritesSortBy,
                  sortOrder: sortOrder,
                ),
        ];
      case HomeSectionType.collections:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedCollections(
                sortBy: collectionsSortBy,
                sortOrder: sortOrder,
              )
            : await _dataSource.loadCollections(
                _serverId,
                sortBy: collectionsSortBy,
                sortOrder: sortOrder,
              )];
      case HomeSectionType.genres:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedGenres(
                sortBy: genresSortBy,
                sortOrder: sortOrder,
                includeItemTypes: genresItemFilter,
              )
            : await _dataSource.loadGenres(
                _serverId,
                sortBy: genresSortBy,
                sortOrder: sortOrder,
                includeItemTypes: genresItemFilter,
              )];
      case HomeSectionType.libraryTilesSmall:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedLibraryTiles(rowType: HomeRowType.libraryTiles)
            : await _dataSource.loadLibraryTiles(_serverId, HomeRowType.libraryTiles)];
      case HomeSectionType.libraryButtons:
        return [_multiServerEnabled
            ? await _multiServerRepo.getAggregatedLibraryTiles(rowType: HomeRowType.libraryTilesSmall)
            : await _dataSource.loadLibraryTiles(_serverId, HomeRowType.libraryTilesSmall)];
      case HomeSectionType.liveTv:
        try {
          if (!await _dataSource.hasLiveTvChannels()) return [];
        } catch (_) {
          return [];
        }
        final rows = <HomeRow>[
          HomeRow(
            id: 'liveTv',
            title: l10n.liveTv,
            rowType: HomeRowType.liveTv,
            items: const [],
          ),
        ];
        try {
          final onNow = await _dataSource.loadOnNow(_serverId);
          if (onNow.items.isNotEmpty) rows.add(onNow);
        } catch (_) {}
        return rows;
      case HomeSectionType.activeRecordings:
        return [
          HomeRow(
            id: 'activeRecordings',
            title: l10n.activeRecordings,
            rowType: HomeRowType.activeRecordings,
          ),
        ];
      case HomeSectionType.mediaBar:
        _mediaBarViewModel.load();
        return [];
      case HomeSectionType.seerrRecentRequests:
        return _loadSeerrRow(SeerrRowType.recentRequests, l10n.recentRequests, 'seerr_recent_requests');
      case HomeSectionType.seerrRecentlyAdded:
        return _loadSeerrRow(SeerrRowType.recentlyAdded, l10n.recentlyAdded, 'seerr_recently_added');
      case HomeSectionType.seerrPopularMovies:
        return _loadSeerrRow(SeerrRowType.popularMovies, l10n.popularMovies, 'seerr_popular_movies');
      case HomeSectionType.seerrUpcomingMovies:
        return _loadSeerrRow(SeerrRowType.upcomingMovies, l10n.upcomingMovies, 'seerr_upcoming_movies');
      case HomeSectionType.seerrPopularSeries:
        return _loadSeerrRow(SeerrRowType.popularSeries, l10n.popularSeries, 'seerr_popular_series');
      case HomeSectionType.seerrUpcomingSeries:
        return _loadSeerrRow(SeerrRowType.upcomingSeries, l10n.upcomingSeries, 'seerr_upcoming_series');
      case HomeSectionType.seerrTrending:
        return _loadSeerrRow(SeerrRowType.trending, l10n.trending, 'seerr_trending');
      case HomeSectionType.seerrMovieGenres:
        return _loadSeerrRow(SeerrRowType.movieGenres, l10n.movieGenres, 'seerr_movie_genres');
      case HomeSectionType.seerrStudios:
        return _loadSeerrRow(SeerrRowType.studios, l10n.studios, 'seerr_studios');
      case HomeSectionType.seerrSeriesGenres:
        return _loadSeerrRow(SeerrRowType.seriesGenres, l10n.seriesGenres, 'seerr_series_genres');
      case HomeSectionType.seerrNetworks:
        return _loadSeerrRow(SeerrRowType.networks, l10n.networks, 'seerr_networks');
      case HomeSectionType.recentlyReleased:
      case HomeSectionType.resumeBook:
      case HomeSectionType.none:
        return [];
    }
  }

  Future<List<HomeRow>> _loadLatestMediaRows() async {
    final viewsFuture = _client.userViewsApi.getUserViews();
    final configFuture = _client.usersApi
        .getUserConfiguration()
        .then<Set<String>>((config) => config.latestItemsExcludes.toSet())
        .catchError((_) => const <String>{});

    final viewsResponse = await viewsFuture;
    final views = viewsResponse['Items'] as List? ?? [];
    final Set<String> latestExcludes = await configFuture;

    final filteredViews = views
        .cast<Map<String, dynamic>>()
        .where((data) {
          final id = data['Id'] as String;
          final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
          if (collectionType == 'music' ||
              collectionType == 'playlists' ||
              collectionType == 'boxsets' ||
              collectionType == 'livetv') {
            return false;
          }
          return !latestExcludes.contains(id);
        })
        .toList();

    final tasks = filteredViews.map((data) async {
      final id = data['Id'] as String;
      final name = data['Name'] as String? ?? '';
      final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
      try {
        final row = await _dataSource.loadLatestMedia(
          id,
          name,
          _serverId,
          collectionType,
        );
        return row.items.isNotEmpty ? row : null;
      } catch (_) {
        return null;
      }
    }).toList();

    final resolved = await Future.wait(tasks);
    final rows = resolved.whereType<HomeRow>().toList();
    return rows;
  }

  HomeRow? _placeholderForSection(HomeSectionType section) {
    final l10n = currentAppLocalizations();
    switch (section) {
      case HomeSectionType.resume:
        return HomeRow(
          id: 'resume', title: l10n.continueWatching,
          rowType: HomeRowType.resume, isLoading: true,
        );
      case HomeSectionType.resumeAudio:
        return HomeRow(
          id: 'resumeAudio', title: l10n.continueListening,
          rowType: HomeRowType.resumeAudio, isLoading: true,
        );
      case HomeSectionType.nextUp:
        return HomeRow(
          id: 'nextUp', title: l10n.nextUp,
          rowType: HomeRowType.nextUp, isLoading: true,
        );
      case HomeSectionType.latestMedia:
        return HomeRow(
          id: 'latestMedia', title: l10n.latestMedia,
          rowType: HomeRowType.latestMedia, isLoading: true,
        );
      case HomeSectionType.playlists:
        return HomeRow(
          id: 'playlists', title: l10n.playlists,
          rowType: HomeRowType.playlists, isLoading: true,
        );
      case HomeSectionType.favoriteMovies:
      case HomeSectionType.favoriteSeries:
      case HomeSectionType.favoriteEpisodes:
      case HomeSectionType.favoritePeople:
      case HomeSectionType.favoriteArtists:
      case HomeSectionType.favoriteMusicVideos:
      case HomeSectionType.favoriteAlbums:
      case HomeSectionType.favoriteSongs:
        return HomeRow(
          id: _favoriteRowIdForSection(section),
          title: _favoriteTitleForSection(section, l10n),
          rowType: HomeRowType.favorites,
          isLoading: true,
        );
      case HomeSectionType.collections:
        return HomeRow(
          id: 'collections',
          title: l10n.collections,
          rowType: HomeRowType.collections,
          isLoading: true,
        );
      case HomeSectionType.genres:
        return HomeRow(
          id: 'genres',
          title: l10n.genres,
          rowType: HomeRowType.genres,
          isLoading: true,
        );
      case HomeSectionType.libraryTilesSmall:
        return HomeRow(
          id: 'libraryTiles', title: l10n.myMedia,
          rowType: HomeRowType.libraryTiles, isLoading: true,
        );
      case HomeSectionType.libraryButtons:
        return HomeRow(
          id: 'libraryTilesSmall', title: l10n.myMedia,
          rowType: HomeRowType.libraryTilesSmall, isLoading: true,
        );
      case HomeSectionType.seerrRecentRequests:
        return HomeRow(
          id: 'seerr_recent_requests', title: l10n.recentRequests,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrRecentlyAdded:
        return HomeRow(
          id: 'seerr_recently_added', title: l10n.recentlyAdded,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrPopularMovies:
        return HomeRow(
          id: 'seerr_popular_movies', title: l10n.popularMovies,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrUpcomingMovies:
        return HomeRow(
          id: 'seerr_upcoming_movies', title: l10n.upcomingMovies,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrPopularSeries:
        return HomeRow(
          id: 'seerr_popular_series', title: l10n.popularSeries,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrUpcomingSeries:
        return HomeRow(
          id: 'seerr_upcoming_series', title: l10n.upcomingSeries,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrTrending:
        return HomeRow(
          id: 'seerr_trending', title: l10n.trending,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrMovieGenres:
        return HomeRow(
          id: 'seerr_movie_genres', title: l10n.movieGenres,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrStudios:
        return HomeRow(
          id: 'seerr_studios', title: l10n.studios,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrSeriesGenres:
        return HomeRow(
          id: 'seerr_series_genres', title: l10n.seriesGenres,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.seerrNetworks:
        return HomeRow(
          id: 'seerr_networks', title: l10n.networks,
          rowType: HomeRowType.pluginDynamic, isLoading: true,
        );
      case HomeSectionType.liveTv:
      case HomeSectionType.activeRecordings:
      case HomeSectionType.mediaBar:
      case HomeSectionType.recentlyReleased:
      case HomeSectionType.resumeBook:
      case HomeSectionType.none:
        return null;
    }
  }

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

  static String _favoriteRowIdForSection(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.favoriteMovies => 'favorites_movies',
      HomeSectionType.favoriteSeries => 'favorites_series',
      HomeSectionType.favoriteEpisodes => 'favorites_episodes',
      HomeSectionType.favoritePeople => 'favorites_people',
      HomeSectionType.favoriteArtists => 'favorites_artists',
      HomeSectionType.favoriteMusicVideos => 'favorites_musicvideos',
      HomeSectionType.favoriteAlbums => 'favorites_albums',
      HomeSectionType.favoriteSongs => 'favorites_songs',
      _ => 'favorites',
    };
  }

  static String _favoriteTitleForSection(
    HomeSectionType type,
    AppLocalizations l10n,
  ) {
    final filter = _favoriteFilterForSection(type);
    return 'Favorite ${filter.displayName}';
  }

  void _loadResumeAndNextUpInBackground() {
    if (_bgMergeInFlight) return;
    _bgMergeInFlight = true;
    unawaited(() async {
      try {
        if (_multiServerEnabled) {
          final resumeFuture = _multiServerRepo.getAggregatedResume();
          final nextUpFuture = () async {
            try {
              return await _multiServerRepo.getAggregatedNextUp();
            } catch (_) {
              return null;
            }
          }();
          final resumeRow = await resumeFuture;
          final nextUpRow = await nextUpFuture;
          final mergedItemsMap = <String, AggregatedItem>{};
          for (final item in resumeRow.items) {
            mergedItemsMap[item.id] = item;
          }
          for (final item in nextUpRow?.items ?? []) {
            mergedItemsMap.putIfAbsent(item.id, () => item);
          }
          int byLastPlayedDate(AggregatedItem a, AggregatedItem b) {
            final aDate = a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            final bDate = b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            return bDate.compareTo(aDate);
          }
          final sorted = mergedItemsMap.values.toList()..sort(byLastPlayedDate);
          _applyMergedResumeResult(sorted);
        } else {
          final results = await Future.wait([
            _dataSource.loadResume(_serverId),
            _dataSource.loadNextUp(_serverId),
          ]);
          final mergedItemsMap = <String, AggregatedItem>{};
          for (final item in results[0].items) {
            mergedItemsMap[item.id] = item;
          }
          for (final item in results[1].items) {
            mergedItemsMap.putIfAbsent(item.id, () => item);
          }
          int byLastPlayedDate(AggregatedItem a, AggregatedItem b) {
            final aDate = a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            final bDate = b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            return bDate.compareTo(aDate);
          }
          final sorted = mergedItemsMap.values.toList()..sort(byLastPlayedDate);
          _applyMergedResumeResult(sorted);
        }
      } catch (_) {
      } finally {
        _bgMergeInFlight = false;
      }
    }());
  }

  void _applyMergedResumeResult(List<AggregatedItem> mergedItems) {
    final resumeIndex = _rows.indexWhere((r) => r.id == 'resume');
    if (resumeIndex < 0) return;
    _rows = List.of(_rows);
    if (mergedItems.isEmpty) {
      _rows.removeAt(resumeIndex);
    } else {
      _rows[resumeIndex] = _rows[resumeIndex].copyWith(
        items: mergedItems,
        isLoading: false,
      );
    }
    notifyListeners();
  }

  static const _seerrEnrichConcurrency = 5;

  Future<List<HomeRow>> _loadSeerrRow(SeerrRowType type, String title, String rowId) async {
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      final seerrPrefs = GetIt.instance<SeerrPreferences>();
      await repo.ensureInitialized();
      if (!repo.isAvailable) {
        return [];
      }

      final blockNsfw = seerrPrefs.blockNsfw;
      final limit = seerrPrefs.fetchLimit.limit;

      List<SeerrDiscoverItem> rawItems = [];

      if (type == SeerrRowType.movieGenres) {
        final genres = await repo.getGenreSliderMovies();
        return [
          _seerrRow(rowId, title, [
            for (final g in genres)
              _seerrFilterItem(
                id: g.id.toString(),
                name: g.name,
                imagePath: g.backdrops.isNotEmpty ? g.backdrops.first : '',
                type: 'Genre',
                mediaType: 'movie',
                filterType: 'genre',
              ),
          ]),
        ];
      } else if (type == SeerrRowType.seriesGenres) {
        final genres = await repo.getGenreSliderTv();
        return [
          _seerrRow(rowId, title, [
            for (final g in genres)
              _seerrFilterItem(
                id: g.id.toString(),
                name: g.name,
                imagePath: g.backdrops.isNotEmpty ? g.backdrops.first : '',
                type: 'Genre',
                mediaType: 'tv',
                filterType: 'genre',
              ),
          ]),
        ];
      } else if (type == SeerrRowType.networks) {
        return [
          _seerrRow(rowId, title, [
            for (final n in SeerrDiscoverViewModel.popularNetworks)
              _seerrFilterItem(
                id: n.id.toString(),
                name: n.name,
                imagePath: n.logoPath ?? '',
                type: 'Network',
                mediaType: 'tv',
                filterType: 'network',
              ),
          ]),
        ];
      } else if (type == SeerrRowType.studios) {
        return [
          _seerrRow(rowId, title, [
            for (final s in SeerrDiscoverViewModel.popularStudios)
              _seerrFilterItem(
                id: s.id.toString(),
                name: s.name,
                imagePath: s.logoPath ?? '',
                type: 'Studio',
                mediaType: 'movie',
                filterType: 'studio',
              ),
          ]),
        ];
      } else if (type == SeerrRowType.recentRequests) {
        final user = await repo.getCurrentUser();
        final response = await repo.getRequests(
          requestedBy: user.canViewAllRequests ? null : user.id,
          limit: limit,
        );
        final mapped = response.results
            .where((r) => r.media != null)
            .map((r) {
              final media = r.media!;
              return SeerrDiscoverItem(
                id: media.tmdbId ?? media.id,
                title: media.title ?? media.name,
                name: media.name ?? media.title,
                overview: media.overview,
                releaseDate: media.releaseDate,
                firstAirDate: media.firstAirDate,
                mediaType: r.type,
                posterPath: media.posterPath,
                backdropPath: media.backdropPath,
                mediaInfo: SeerrMediaInfo(
                  id: media.id,
                  tmdbId: media.tmdbId,
                  status: media.status,
                ),
              );
            })
            .toList();
        rawItems = (await mapBounded(
          mapped,
          _seerrEnrichConcurrency,
          (item) => _enrichSeerrItem(repo, item),
        )).whereType<SeerrDiscoverItem>().toList();
      } else if (type == SeerrRowType.recentlyAdded) {
        final media = await repo.getRecentlyAdded(limit: limit);
        final mapped = media.map((m) => SeerrDiscoverItem(
          id: m.tmdbId ?? m.id,
          title: m.title,
          name: m.name,
          overview: m.overview,
          releaseDate: m.releaseDate,
          firstAirDate: m.firstAirDate,
          mediaType: m.mediaType,
          posterPath: m.posterPath,
          backdropPath: m.backdropPath,
          mediaInfo: SeerrMediaInfo(
            id: m.id,
            tmdbId: m.tmdbId,
            status: m.status,
          ),
        )).toList();
        rawItems = (await mapBounded(
          mapped,
          _seerrEnrichConcurrency,
          (item) => _enrichSeerrItem(repo, item),
        )).whereType<SeerrDiscoverItem>().toList();
      } else {
        final page = await _loadSeerrPage(repo, type, limit);
        if (page != null) {
          rawItems = page.results;
        }
      }

      final filtered = rawItems.where((item) {
        if (type != SeerrRowType.recentlyAdded && type != SeerrRowType.recentRequests) {
          if (item.isAvailable || item.isBlacklisted) return false;
        }
        if (blockNsfw) {
          if (item.adult) return false;
          final text = '${item.displayTitle} ${item.overview ?? ''}';
          if (SeerrDiscoverViewModel.nsfwPatterns.any((p) => p.hasMatch(text))) {
            return false;
          }
        }
        return true;
      }).toList();

      final aggregatedItems = filtered.map((item) {
        return AggregatedItem(
          id: item.id.toString(),
          serverId: 'seerr',
          rawData: {
            'Name': item.displayTitle,
            'Type': item.mediaType == 'tv' ? 'Series' : 'Movie',
            'Overview': item.overview ?? '',
            'PosterPath': item.posterPath ?? '',
            'BackdropPath': item.backdropPath ?? '',
            'ProductionYear': _extractYear(item.releaseDate ?? item.firstAirDate),
            'SeerrMediaType': item.mediaType,
            'SeerrStatus': item.mediaInfo?.status,
          },
        );
      }).toList();

      return [_seerrRow(rowId, title, aggregatedItems)];
    } catch (e) {
      debugPrint('[SeerrHomeRow] Failed to load Seerr row $type: $e');
      return [];
    }
  }

  HomeRow _seerrRow(String rowId, String title, List<AggregatedItem> items) {
    return HomeRow(
      id: rowId,
      title: title,
      rowType: HomeRowType.pluginDynamic,
      items: items,
    );
  }

  AggregatedItem _seerrFilterItem({
    required String id,
    required String name,
    required String imagePath,
    required String type,
    required String mediaType,
    required String filterType,
  }) {
    return AggregatedItem(
      id: id,
      serverId: 'seerr',
      rawData: {
        'Name': name,
        'Type': type,
        'Overview': '',
        'PosterPath': imagePath,
        'BackdropPath': imagePath,
        'MediaType': mediaType,
        'FilterType': filterType,
        'FilterName': name,
      },
    );
  }

  Future<SeerrDiscoverPage?> _loadSeerrPage(SeerrRepository repo, SeerrRowType type, int limit) async {
    switch (type) {
      case SeerrRowType.trending:
        return repo.getTrending(limit: limit, offset: 0);
      case SeerrRowType.popularMovies:
        return repo.getTrendingMovies(limit: limit, offset: 0);
      case SeerrRowType.popularSeries:
        return repo.getTrendingTv(limit: limit, offset: 0);
      case SeerrRowType.upcomingMovies:
        return repo.getUpcomingMovies();
      case SeerrRowType.upcomingSeries:
        return repo.getUpcomingTv();
      default:
        return null;
    }
  }

  Future<SeerrDiscoverItem> _enrichSeerrItem(SeerrRepository repo, SeerrDiscoverItem item) async {
    if (item.backdropPath != null && item.voteAverage != null && (item.releaseDate != null || item.firstAirDate != null)) {
      return item;
    }
    final tmdbId = item.mediaInfo?.tmdbId ?? item.id;
    if (tmdbId <= 0) return item;
    try {
      if (item.mediaType == 'tv') {
        final details = await repo.getTvDetails(tmdbId);
        return SeerrDiscoverItem(
          id: item.id,
          mediaType: item.mediaType,
          title: item.title ?? details.title,
          name: item.name ?? details.name,
          originalTitle: item.originalTitle,
          originalName: item.originalName,
          posterPath: details.posterPath ?? item.posterPath,
          backdropPath: details.backdropPath ?? item.backdropPath,
          overview: details.overview ?? item.overview,
          releaseDate: item.releaseDate ?? details.firstAirDate,
          firstAirDate: item.firstAirDate ?? details.firstAirDate,
          originalLanguage: item.originalLanguage,
          genreIds: item.genreIds,
          voteAverage: details.voteAverage ?? item.voteAverage,
          voteCount: item.voteCount,
          popularity: item.popularity,
          adult: item.adult,
          mediaInfo: item.mediaInfo,
          character: item.character,
          job: item.job,
          department: item.department,
        );
      }
      final details = await repo.getMovieDetails(tmdbId);
      return SeerrDiscoverItem(
        id: item.id,
        mediaType: item.mediaType,
        title: item.title ?? details.title,
        name: item.name,
        originalTitle: item.originalTitle,
        originalName: item.originalName,
        posterPath: details.posterPath ?? item.posterPath,
        backdropPath: details.backdropPath ?? item.backdropPath,
        overview: details.overview ?? item.overview,
        releaseDate: item.releaseDate ?? details.releaseDate,
        firstAirDate: item.firstAirDate ?? details.releaseDate,
        originalLanguage: item.originalLanguage,
        genreIds: item.genreIds,
        voteAverage: details.voteAverage ?? item.voteAverage,
        voteCount: item.voteCount,
        popularity: item.popularity,
        adult: item.adult,
        mediaInfo: item.mediaInfo,
        character: item.character,
        job: item.job,
        department: item.department,
      );
    } catch (_) {
      return item;
    }
  }

  int? _extractYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      final parts = dateString.split('-');
      if (parts.isNotEmpty) {
        return int.tryParse(parts[0]);
      }
    } catch (_) {}
    return null;
  }
}

