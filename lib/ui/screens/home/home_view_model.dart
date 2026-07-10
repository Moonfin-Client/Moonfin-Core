import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/repositories/multi_server_repository.dart';
import '../../../data/services/home_row_cache_store.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/services/topshelf_service.dart';
import '../../../data/services/watch_next_service.dart';
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
import 'package:dio/dio.dart';
import '../../../data/services/custom_external_lists_service.dart';

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

  final TopShelfService _topShelf = TopShelfService();
  final WatchNextService _watchNext = WatchNextService();

  List<HomeRow> _rows = [];
  List<HomeRow> get rows => _rows;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _bgMergeInFlight = false;
  bool _reloadRequestedWhileLoading = false;
  bool _pendingReloadPreserveExisting = true;
  bool _pendingReloadForceRefresh = false;

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

  static bool _isAudioSectionType(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.audioArtists ||
      HomeSectionType.audioAlbums ||
      HomeSectionType.audioPlaylists => true,
      _ => false,
    };
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

  static bool _isTmdbSectionType(HomeSectionType type) {
    return type == HomeSectionType.tmdbPopularMovies ||
        type == HomeSectionType.tmdbTopRatedMovies ||
        type == HomeSectionType.tmdbNowPlayingMovies ||
        type == HomeSectionType.tmdbUpcomingMovies ||
        type == HomeSectionType.tmdbPopularTv ||
        type == HomeSectionType.tmdbTopRatedTv ||
        type == HomeSectionType.tmdbAiringTodayTv ||
        type == HomeSectionType.tmdbOnTheAirTv ||
        type == HomeSectionType.tmdbTrendingMovieDaily ||
        type == HomeSectionType.tmdbTrendingMovieWeekly ||
        type == HomeSectionType.tmdbTrendingTvDaily ||
        type == HomeSectionType.tmdbTrendingTvWeekly ||
        type == HomeSectionType.tmdbTrendingAllWeekly;
  }

  bool _isTmdbSectionEnabled(HomeSectionType type) {
    switch (type) {
      case HomeSectionType.tmdbPopularMovies:
        return _prefs.get(UserPreferences.tmdbPopularMoviesEnabled);
      case HomeSectionType.tmdbTopRatedMovies:
        return _prefs.get(UserPreferences.tmdbTopRatedMoviesEnabled);
      case HomeSectionType.tmdbNowPlayingMovies:
        return _prefs.get(UserPreferences.tmdbNowPlayingMoviesEnabled);
      case HomeSectionType.tmdbUpcomingMovies:
        return _prefs.get(UserPreferences.tmdbUpcomingMoviesEnabled);
      case HomeSectionType.tmdbPopularTv:
        return _prefs.get(UserPreferences.tmdbPopularTvEnabled);
      case HomeSectionType.tmdbTopRatedTv:
        return _prefs.get(UserPreferences.tmdbTopRatedTvEnabled);
      case HomeSectionType.tmdbAiringTodayTv:
        return _prefs.get(UserPreferences.tmdbAiringTodayTvEnabled);
      case HomeSectionType.tmdbOnTheAirTv:
        return _prefs.get(UserPreferences.tmdbOnTheAirTvEnabled);
      case HomeSectionType.tmdbTrendingMovieDaily:
        return _prefs.get(UserPreferences.tmdbTrendingMovieDailyEnabled);
      case HomeSectionType.tmdbTrendingMovieWeekly:
        return _prefs.get(UserPreferences.tmdbTrendingMovieWeeklyEnabled);
      case HomeSectionType.tmdbTrendingTvDaily:
        return _prefs.get(UserPreferences.tmdbTrendingTvDailyEnabled);
      case HomeSectionType.tmdbTrendingTvWeekly:
        return _prefs.get(UserPreferences.tmdbTrendingTvWeeklyEnabled);
      case HomeSectionType.tmdbTrendingAllWeekly:
        return _prefs.get(UserPreferences.tmdbTrendingAllWeeklyEnabled);
      default:
        return false;
    }
  }

  bool _isAnyTmdbSectionEnabled() {
    return _prefs.get(UserPreferences.tmdbPopularMoviesEnabled) ||
        _prefs.get(UserPreferences.tmdbTopRatedMoviesEnabled) ||
        _prefs.get(UserPreferences.tmdbNowPlayingMoviesEnabled) ||
        _prefs.get(UserPreferences.tmdbUpcomingMoviesEnabled) ||
        _prefs.get(UserPreferences.tmdbPopularTvEnabled) ||
        _prefs.get(UserPreferences.tmdbTopRatedTvEnabled) ||
        _prefs.get(UserPreferences.tmdbAiringTodayTvEnabled) ||
        _prefs.get(UserPreferences.tmdbOnTheAirTvEnabled) ||
        _prefs.get(UserPreferences.tmdbTrendingMovieDailyEnabled) ||
        _prefs.get(UserPreferences.tmdbTrendingMovieWeeklyEnabled) ||
        _prefs.get(UserPreferences.tmdbTrendingTvDailyEnabled) ||
        _prefs.get(UserPreferences.tmdbTrendingTvWeeklyEnabled) ||
        _prefs.get(UserPreferences.tmdbTrendingAllWeeklyEnabled);
  }

  static bool _isSinceYouWatchedSectionType(HomeSectionType type) {
    return type == HomeSectionType.sinceYouWatched1 ||
        type == HomeSectionType.sinceYouWatched2 ||
        type == HomeSectionType.sinceYouWatched3 ||
        type == HomeSectionType.sinceYouWatched4 ||
        type == HomeSectionType.sinceYouWatched5;
  }

  static int _getSinceYouWatchedIndex(HomeSectionType type) {
    switch (type) {
      case HomeSectionType.sinceYouWatched1: return 1;
      case HomeSectionType.sinceYouWatched2: return 2;
      case HomeSectionType.sinceYouWatched3: return 3;
      case HomeSectionType.sinceYouWatched4: return 4;
      case HomeSectionType.sinceYouWatched5: return 5;
      default: return 0;
    }
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
  }) : _dataSource = dataSource,
       _prefs = prefs,
       _client = client,
       _mediaBarViewModel = mediaBarViewModel,
       _multiServerRepo = multiServerRepo,
       _ownerUserId = client.userId ?? '';

  Future<void> load({bool preserveExisting = false, bool forceRefresh = false}) async {
    _checkAndTriggerDailyExternalRowsRefresh();
    if (_isLoading) {
      _reloadRequestedWhileLoading = true;
      _pendingReloadPreserveExisting =
          _pendingReloadPreserveExisting && preserveExisting;
      _pendingReloadForceRefresh =
          _pendingReloadForceRefresh || forceRefresh;
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
              HomeSectionConfig(
                type: HomeSectionType.resume,
                enabled: true,
                order: 0,
              ),
              HomeSectionConfig(
                type: HomeSectionType.nextUp,
                enabled: true,
                order: 1,
              ),
              HomeSectionConfig(
                type: HomeSectionType.latestMedia,
                enabled: true,
                order: 2,
              ),
            ]
          : activeConfigs;
      final showFavoritesRows = _prefs.get(
        UserPreferences.displayFavoritesRows,
      );
      final showCollectionsRows = _prefs.get(
        UserPreferences.displayCollectionsRows,
      );
      final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
      final showPlaylistsRows = _prefs.get(
        UserPreferences.displayPlaylistsRows,
      );
      final showAudioRows = _prefs.get(UserPreferences.displayAudioRows);
      final showSeerrRows = GetIt.instance<PluginSyncService>().seerrAvailable;
      final seerrPrefs = GetIt.instance<SeerrPreferences>();
      final showTmdbRows = _isAnyTmdbSectionEnabled();
      final showSinceYouWatched = _prefs.get(UserPreferences.displaySinceYouWatchedRows);
      final sinceYouWatchedNum = _prefs.get(UserPreferences.sinceYouWatchedNumRows).value;
      final showRewatch = _prefs.get(UserPreferences.displayRewatchRow);

      // Plugin-dynamic sections only make sense on the active server.
      final visibleConfigsRaw = configs
          .where(
            (c) =>
                (c.isBuiltin ||
                    c.pluginSource == HomeSectionPluginSource.custom ||
                    (c.serverId != null && c.serverId == _serverId)) &&
                (showFavoritesRows || !_isFavoriteSectionType(c.type)) &&
                (showCollectionsRows ||
                    !((c.isBuiltin && _isCollectionsSectionType(c.type)) ||
                        (c.isPluginDynamic &&
                            c.pluginSource ==
                                HomeSectionPluginSource.collections))) &&
                (showGenresRows ||
                    !((c.isBuiltin && _isGenresSectionType(c.type)) ||
                        (c.isPluginDynamic &&
                            c.pluginSource ==
                                HomeSectionPluginSource.genres))) &&
                (showPlaylistsRows ||
                    !((c.isBuiltin && _isPlaylistsSectionType(c.type)) ||
                        (c.isPluginDynamic &&
                            c.pluginSource ==
                                HomeSectionPluginSource.playlists))) &&
                (showAudioRows || !_isAudioSectionType(c.type)) &&
                (!_isSeerrSectionType(c.type) || (showSeerrRows && seerrPrefs.isSeerrHomeRowEnabled(c.type))) &&
                (!_isTmdbSectionType(c.type) || (showTmdbRows && _isTmdbSectionEnabled(c.type))) &&
                (c.type != HomeSectionType.radarrCalendar || _prefs.get(UserPreferences.enableRadarrCalendar)) &&
                (c.type != HomeSectionType.sonarrCalendar || _prefs.get(UserPreferences.enableSonarrCalendar)) &&
                (!_isSinceYouWatchedSectionType(c.type) || (showSinceYouWatched && _getSinceYouWatchedIndex(c.type) <= sinceYouWatchedNum)) &&
                (c.type != HomeSectionType.rewatch || showRewatch),
          )
          .toList(growable: false);

      // Filter out plugin-dynamic rows that duplicate already-enabled built-ins
      // and collapse equivalent plugin-dynamic rows so only the first
      // configured plugin row in a duplicate group remains visible.
      final enabledBuiltinKeys = visibleConfigsRaw
          .where((c) => c.isBuiltin)
          .expand(_duplicateKeysForConfig)
          .toSet();
      final seenPluginKeys = <String>{};
      final visibleConfigs = visibleConfigsRaw
          .where((c) {
            if (!c.isPluginDynamic) return true;
            final duplicateKeys = _duplicateKeysForConfig(c);
            if (duplicateKeys.any(enabledBuiltinKeys.contains)) {
              return false;
            }
            final duplicatesExistingPlugin = duplicateKeys.any(
              seenPluginKeys.contains,
            );
            if (!duplicatesExistingPlugin) {
              seenPluginKeys.addAll(duplicateKeys);
            }
            return !duplicatesExistingPlugin;
          })
          .toList(growable: false);

      final sections = visibleConfigs
          .where((c) => c.isBuiltin)
          .map((c) => c.type)
          .toList();

      if (!sections.contains(HomeSectionType.mediaBar)) {
        _mediaBarViewModel.load();
      }

      final merge = _prefs.get(UserPreferences.mergeContinueWatchingNextUp);
      final effectiveConfigs = visibleConfigs
          .where(
            (c) => !(c.isBuiltin && merge && c.type == HomeSectionType.nextUp),
          )
          .toList();

      final nonResumeEffectiveConfigs = merge
          ? effectiveConfigs
                .where(
                  (c) => !(c.isBuiltin && c.type == HomeSectionType.resume),
                )
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
            sectionRows = await _loadConfig(cfg, forceRefresh: forceRefresh);
          } catch (e) {
            debugPrint('[Home] Failed to load section $cfg: $e');
            sectionRows = const <HomeRow>[];
          }
          final currentConfigs = _prefs.activeHomeSectionConfigs;
          final isStillActive = currentConfigs.any((c) => c.stableId == cfg.stableId);
          if (!isStillActive) return;
          // Cleanup runs even when the load failed, so the section's loading
          // placeholder is cleared instead of spinning forever.
          final loadedRows = sectionRows
              .map((r) => r.copyWith(items: _filterEmptyElements(r.items)))
              .where(
                (r) => r.items.isNotEmpty || r.rowType == HomeRowType.liveTv,
              )
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
              final willRemove =
                  (placeholder != null && r.id == placeholder.id) ||
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
          final newRows = List<HomeRow>.from(_rows);
          newRows.removeWhere(
            (r) =>
                (placeholder != null && r.id == placeholder.id) ||
                loadedIds.contains(r.id) ||
                // Also clear any stale rows that belonged to this section from a
                // prior load but were not included in the fresh result. This
                // prevents phantom rows when the section's row-set changes
                // (e.g. library added/removed, latestItemsExcludes updated).
                _rowBelongsToConfig(r, cfg),
          );

          if (loadedRows.isNotEmpty) {
            final insertIndex = anchorId != null
                ? newRows.indexWhere((r) => r.id == anchorId)
                : -1;
            if (insertIndex < 0) {
              newRows.addAll(loadedRows);
            } else {
              newRows.insertAll(insertIndex, loadedRows);
            }
          }
          _rows = newRows;
          notifyListeners();
        }());
      }

      await Future.wait(completers);

      unawaited(_cacheStore.write(_homeCacheKey(), _rows));
      _topShelf.update(_rows);
      _watchNext.update(_rows);

      if (showMergedResume) {
        _loadResumeAndNextUpInBackground();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
      if (_reloadRequestedWhileLoading) {
        final nextPreserveExisting = _pendingReloadPreserveExisting;
        final nextForceRefresh = _pendingReloadForceRefresh;
        _reloadRequestedWhileLoading = false;
        _pendingReloadPreserveExisting = true;
        _pendingReloadForceRefresh = false;
        await load(preserveExisting: nextPreserveExisting, forceRefresh: nextForceRefresh);
      }
    }
  }

  List<HomeRow> _reconcilePreservedRows(
    List<HomeSectionConfig> effectiveConfigs,
  ) {
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
    return rows
        .where((row) => _rowBelongsToConfig(row, cfg))
        .toList(growable: false);
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
            !row.id.startsWith('pluginDynamic:') &&
            !row.id.startsWith('sinceYouWatched') &&
            row.id != 'rewatch';
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
      case HomeSectionType.audioArtists:
        return row.rowType == HomeRowType.audioArtists;
      case HomeSectionType.audioAlbums:
        return row.rowType == HomeRowType.audioAlbums;
      case HomeSectionType.audioPlaylists:
        return row.rowType == HomeRowType.audioPlaylists;
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
      case HomeSectionType.tmdbPopularMovies:
        return row.id == 'tmdb_popular_movies';
      case HomeSectionType.tmdbTopRatedMovies:
        return row.id == 'tmdb_top_rated_movies';
      case HomeSectionType.tmdbNowPlayingMovies:
        return row.id == 'tmdb_now_playing_movies';
      case HomeSectionType.tmdbUpcomingMovies:
        return row.id == 'tmdb_upcoming_movies';
      case HomeSectionType.tmdbPopularTv:
        return row.id == 'tmdb_popular_tv';
      case HomeSectionType.tmdbTopRatedTv:
        return row.id == 'tmdb_top_rated_tv';
      case HomeSectionType.tmdbAiringTodayTv:
        return row.id == 'tmdb_airing_today_tv';
      case HomeSectionType.tmdbOnTheAirTv:
        return row.id == 'tmdb_on_the_air_tv';
      case HomeSectionType.tmdbTrendingMovieDaily:
        return row.id == 'tmdb_trending_movie_daily';
      case HomeSectionType.tmdbTrendingMovieWeekly:
        return row.id == 'tmdb_trending_movie_weekly';
      case HomeSectionType.tmdbTrendingTvDaily:
        return row.id == 'tmdb_trending_tv_daily';
      case HomeSectionType.tmdbTrendingTvWeekly:
        return row.id == 'tmdb_trending_tv_weekly';
      case HomeSectionType.tmdbTrendingAllWeekly:
        return row.id == 'tmdb_trending_all_weekly';
      case HomeSectionType.radarrCalendar:
        return row.id == 'radarr_calendar';
      case HomeSectionType.sonarrCalendar:
        return row.id == 'sonarr_calendar';
      case HomeSectionType.mediaBar:
      case HomeSectionType.recentlyReleased:
        return row.rowType == HomeRowType.recentlyReleased;
      case HomeSectionType.sinceYouWatched1:
      case HomeSectionType.sinceYouWatched2:
      case HomeSectionType.sinceYouWatched3:
      case HomeSectionType.sinceYouWatched4:
      case HomeSectionType.sinceYouWatched5:
        final idx = _getSinceYouWatchedIndex(cfg.type);
        return row.rowType == HomeRowType.latestMedia && row.id == 'sinceYouWatched$idx';
      case HomeSectionType.rewatch:
        return row.rowType == HomeRowType.latestMedia && row.id == 'rewatch';
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
        result = await _dataSource.loadMore(
          row: row,
          serverId: _serverId,
          offset: currentOffset,
        );
      }
      _rowOffsets[row.id] = currentOffset + 15;

      final filteredItems = _filterEmptyElements(result.$1);
      final newTotalCount = filteredItems.length <= row.items.length
          ? filteredItems.length
          : (result.$2 - (result.$1.length - filteredItems.length));
      _rows = List.of(_rows);
      _rows[rowIndex] = row.copyWith(
        items: filteredItems,
        totalCount: newTotalCount,
      );
      notifyListeners();
    } catch (_) {
    } finally {
      _inFlightPagingRowIds.remove(row.id);
    }
  }

  Future<List<HomeRow>> _loadConfig(HomeSectionConfig cfg, {bool forceRefresh = false}) async {
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
        forceRefresh: forceRefresh,
      );
      return [row];
    }
    return _loadSection(cfg.type, forceRefresh: forceRefresh);
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

  static Set<String> _duplicateKeysForConfig(HomeSectionConfig cfg) {
    if (cfg.isBuiltin) {
      return _duplicateKeysForBuiltin(cfg.type);
    }
    return const <String>{};
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
      case HomeSectionType.audioArtists:
        return const {'audioArtists'};
      case HomeSectionType.audioAlbums:
        return const {'audioAlbums'};
      case HomeSectionType.audioPlaylists:
        return const {'audioPlaylists'};
      case HomeSectionType.tmdbPopularMovies:
        return const {'tmdbPopularMovies'};
      case HomeSectionType.tmdbTopRatedMovies:
        return const {'tmdbTopRatedMovies'};
      case HomeSectionType.tmdbNowPlayingMovies:
        return const {'tmdbNowPlayingMovies'};
      case HomeSectionType.tmdbUpcomingMovies:
        return const {'tmdbUpcomingMovies'};
      case HomeSectionType.tmdbPopularTv:
        return const {'tmdbPopularTv'};
      case HomeSectionType.tmdbTopRatedTv:
        return const {'tmdbTopRatedTv'};
      case HomeSectionType.tmdbAiringTodayTv:
        return const {'tmdbAiringTodayTv'};
      case HomeSectionType.tmdbOnTheAirTv:
        return const {'tmdbOnTheAirTv'};
      case HomeSectionType.tmdbTrendingMovieDaily:
        return const {'tmdbTrendingMovieDaily'};
      case HomeSectionType.tmdbTrendingMovieWeekly:
        return const {'tmdbTrendingMovieWeekly'};
      case HomeSectionType.tmdbTrendingTvDaily:
        return const {'tmdbTrendingTvDaily'};
      case HomeSectionType.tmdbTrendingTvWeekly:
        return const {'tmdbTrendingTvWeekly'};
      case HomeSectionType.tmdbTrendingAllWeekly:
        return const {'tmdbTrendingAllWeekly'};
      case HomeSectionType.radarrCalendar:
        return const {'radarrCalendar'};
      case HomeSectionType.sonarrCalendar:
        return const {'sonarrCalendar'};
      case HomeSectionType.sinceYouWatched1:
        return const {'sinceYouWatched1'};
      case HomeSectionType.sinceYouWatched2:
        return const {'sinceYouWatched2'};
      case HomeSectionType.sinceYouWatched3:
        return const {'sinceYouWatched3'};
      case HomeSectionType.sinceYouWatched4:
        return const {'sinceYouWatched4'};
      case HomeSectionType.sinceYouWatched5:
        return const {'sinceYouWatched5'};
      case HomeSectionType.rewatch:
        return const {'rewatch'};
      case HomeSectionType.mediaBar:
      case HomeSectionType.none:
        return const <String>{};
    }
  }

  Future<List<HomeRow>> _loadSection(HomeSectionType section, {bool forceRefresh = false}) async {
    final l10n = currentAppLocalizations();
    final favoritesSortBy = _prefs
        .get(UserPreferences.favoritesRowSortBy)
        .apiValue;
    final collectionsSortBy = _prefs
        .get(UserPreferences.collectionsRowSortBy)
        .apiValue;
    final genresSortBy = _prefs.get(UserPreferences.genresRowSortBy).apiValue;
    final genresItemFilter = _prefs
        .get(UserPreferences.genresRowItemFilter)
        .includeItemTypes;
    const sortOrder = 'Ascending';
    switch (section) {
      case HomeSectionType.resume:
        final row = _multiServerEnabled
            ? await _multiServerRepo.getAggregatedResume()
            : await _dataSource.loadResume(_serverId);
        return [row.copyWith(items: _prefs.filterContinueWatching(row.items))];
      case HomeSectionType.resumeAudio:
        final row = _multiServerEnabled
            ? await _multiServerRepo.getAggregatedResumeAudio()
            : await _dataSource.loadResumeAudio(_serverId);
        return [row.copyWith(items: _prefs.filterContinueWatching(row.items))];
      case HomeSectionType.nextUp:
        final row = _multiServerEnabled
            ? await _multiServerRepo.getAggregatedNextUp()
            : await _dataSource.loadNextUp(_serverId);
        return [row.copyWith(items: _prefs.filterNextUp(row.items))];
      case HomeSectionType.latestMedia:
        return _multiServerEnabled
            ? await _multiServerRepo.getAggregatedLatestMediaRows()
            : _loadLatestMediaRows();
      case HomeSectionType.playlists:
        final playlistsSortBy = _prefs
            .get(UserPreferences.playlistsRowSortBy)
            .apiValue;
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedPlaylists(
                  sortBy: playlistsSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadPlaylists(
                  _serverId,
                  sortBy: playlistsSortBy,
                  sortOrder: sortOrder,
                ),
        ];
      case HomeSectionType.audioArtists:
        final audioSortBy = _prefs
            .get(UserPreferences.audioRowsSortBy)
            .apiValue;
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedAudioArtists(
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadAudioArtists(
                  _serverId,
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                ),
        ];
      case HomeSectionType.audioAlbums:
        final audioSortBy = _prefs
            .get(UserPreferences.audioRowsSortBy)
            .apiValue;
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedAudioAlbums(
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadAudioAlbums(
                  _serverId,
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                ),
        ];
      case HomeSectionType.audioPlaylists:
        final audioSortBy = _prefs
            .get(UserPreferences.audioRowsSortBy)
            .apiValue;
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedAudioPlaylists(
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadAudioPlaylists(
                  _serverId,
                  sortBy: audioSortBy,
                  sortOrder: sortOrder,
                ),
        ];
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
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedCollections(
                  sortBy: collectionsSortBy,
                  sortOrder: sortOrder,
                )
              : await _dataSource.loadCollections(
                  _serverId,
                  sortBy: collectionsSortBy,
                  sortOrder: sortOrder,
                ),
        ];
      case HomeSectionType.genres:
        return [
          _multiServerEnabled
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
                ),
        ];
      case HomeSectionType.libraryTilesSmall:
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedLibraryTiles(
                  rowType: HomeRowType.libraryTiles,
                )
              : await _dataSource.loadLibraryTiles(
                  _serverId,
                  HomeRowType.libraryTiles,
                ),
        ];
      case HomeSectionType.libraryButtons:
        return [
          _multiServerEnabled
              ? await _multiServerRepo.getAggregatedLibraryTiles(
                  rowType: HomeRowType.libraryTilesSmall,
                )
              : await _dataSource.loadLibraryTiles(
                  _serverId,
                  HomeRowType.libraryTilesSmall,
                ),
        ];
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
        return _loadSeerrRow(
          SeerrRowType.recentRequests,
          l10n.recentRequests,
          'seerr_recent_requests',
        );
      case HomeSectionType.seerrRecentlyAdded:
        return _loadSeerrRow(
          SeerrRowType.recentlyAdded,
          l10n.recentlyAdded,
          'seerr_recently_added',
        );
      case HomeSectionType.seerrPopularMovies:
        return _loadSeerrRow(
          SeerrRowType.popularMovies,
          l10n.popularMovies,
          'seerr_popular_movies',
        );
      case HomeSectionType.seerrUpcomingMovies:
        return _loadSeerrRow(
          SeerrRowType.upcomingMovies,
          l10n.upcomingMovies,
          'seerr_upcoming_movies',
        );
      case HomeSectionType.seerrPopularSeries:
        return _loadSeerrRow(
          SeerrRowType.popularSeries,
          l10n.popularSeries,
          'seerr_popular_series',
        );
      case HomeSectionType.seerrUpcomingSeries:
        return _loadSeerrRow(
          SeerrRowType.upcomingSeries,
          l10n.upcomingSeries,
          'seerr_upcoming_series',
        );
      case HomeSectionType.seerrTrending:
        return _loadSeerrRow(
          SeerrRowType.trending,
          l10n.trending,
          'seerr_trending',
        );
      case HomeSectionType.seerrMovieGenres:
        return _loadSeerrRow(
          SeerrRowType.movieGenres,
          l10n.movieGenres,
          'seerr_movie_genres',
        );
      case HomeSectionType.seerrStudios:
        return _loadSeerrRow(
          SeerrRowType.studios,
          l10n.studios,
          'seerr_studios',
        );
      case HomeSectionType.seerrSeriesGenres:
        return _loadSeerrRow(
          SeerrRowType.seriesGenres,
          l10n.seriesGenres,
          'seerr_series_genres',
        );
      case HomeSectionType.seerrNetworks:
        return _loadSeerrRow(
          SeerrRowType.networks,
          l10n.networks,
          'seerr_networks',
        );
      case HomeSectionType.radarrCalendar:
        return _loadRadarrCalendarRow(forceRefresh: forceRefresh);
      case HomeSectionType.sonarrCalendar:
        return _loadSonarrCalendarRow(forceRefresh: forceRefresh);
      case HomeSectionType.tmdbPopularMovies:
        return _loadTmdbChartRow(HomeSectionType.tmdbPopularMovies, 'Popular Movies', 'tmdb_popular_movies');
      case HomeSectionType.tmdbTopRatedMovies:
        return _loadTmdbChartRow(HomeSectionType.tmdbTopRatedMovies, 'Top Rated Movies', 'tmdb_top_rated_movies');
      case HomeSectionType.tmdbNowPlayingMovies:
        return _loadTmdbChartRow(HomeSectionType.tmdbNowPlayingMovies, 'Now Playing Movies', 'tmdb_now_playing_movies');
      case HomeSectionType.tmdbUpcomingMovies:
        return _loadTmdbChartRow(HomeSectionType.tmdbUpcomingMovies, 'Upcoming Movies', 'tmdb_upcoming_movies');
      case HomeSectionType.tmdbPopularTv:
        return _loadTmdbChartRow(HomeSectionType.tmdbPopularTv, 'Popular TV', 'tmdb_popular_tv');
      case HomeSectionType.tmdbTopRatedTv:
        return _loadTmdbChartRow(HomeSectionType.tmdbTopRatedTv, 'Top Rated TV', 'tmdb_top_rated_tv');
      case HomeSectionType.tmdbAiringTodayTv:
        return _loadTmdbChartRow(HomeSectionType.tmdbAiringTodayTv, 'Airing Today TV', 'tmdb_airing_today_tv');
      case HomeSectionType.tmdbOnTheAirTv:
        return _loadTmdbChartRow(HomeSectionType.tmdbOnTheAirTv, 'On The Air TV', 'tmdb_on_the_air_tv');
      case HomeSectionType.tmdbTrendingMovieDaily:
        return _loadTmdbChartRow(HomeSectionType.tmdbTrendingMovieDaily, 'Trending Movies (Daily)', 'tmdb_trending_movie_daily');
      case HomeSectionType.tmdbTrendingMovieWeekly:
        return _loadTmdbChartRow(HomeSectionType.tmdbTrendingMovieWeekly, 'Trending Movies (Weekly)', 'tmdb_trending_movie_weekly');
      case HomeSectionType.tmdbTrendingTvDaily:
        return _loadTmdbChartRow(HomeSectionType.tmdbTrendingTvDaily, 'Trending TV (Daily)', 'tmdb_trending_tv_daily');
      case HomeSectionType.tmdbTrendingTvWeekly:
        return _loadTmdbChartRow(HomeSectionType.tmdbTrendingTvWeekly, 'Trending TV (Weekly)', 'tmdb_trending_tv_weekly');
      case HomeSectionType.tmdbTrendingAllWeekly:
        return _loadTmdbChartRow(HomeSectionType.tmdbTrendingAllWeekly, 'Trending All (Weekly)', 'tmdb_trending_all_weekly');
      case HomeSectionType.recentlyReleased:
        return _loadRecentlyReleasedRow();
      case HomeSectionType.sinceYouWatched1:
      case HomeSectionType.sinceYouWatched2:
      case HomeSectionType.sinceYouWatched3:
      case HomeSectionType.sinceYouWatched4:
      case HomeSectionType.sinceYouWatched5:
        final rowIndex = _getSinceYouWatchedIndex(section);
        final row = await _dataSource.loadSinceYouWatchedRow(_serverId, rowIndex);
        return [row];
      case HomeSectionType.rewatch:
        final row = await _dataSource.loadRewatchRow(_serverId);
        return [row];
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

    final filteredViews = views.cast<Map<String, dynamic>>().where((data) {
      final id = data['Id']?.toString() ?? '';
      final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
      if (collectionType == 'playlists' ||
          collectionType == 'boxsets' ||
          collectionType == 'livetv') {
        return false;
      }
      return !latestExcludes.contains(id);
    }).toList();

    final tasks = filteredViews.map((data) async {
      final id = data['Id']?.toString() ?? '';
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

  Future<List<HomeRow>> _loadRecentlyReleasedRow() async {
    final viewsFuture = _client.userViewsApi.getUserViews();
    final configFuture = _client.usersApi
        .getUserConfiguration()
        .then<Set<String>>((config) => config.latestItemsExcludes.toSet())
        .catchError((_) => const <String>{});

    final viewsResponse = await viewsFuture;
    final views = viewsResponse['Items'] as List? ?? [];
    final Set<String> latestExcludes = await configFuture;

    final filteredViews = views.cast<Map<String, dynamic>>().where((data) {
      final id = data['Id']?.toString() ?? '';
      final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
      if (collectionType == 'playlists' ||
          collectionType == 'boxsets' ||
          collectionType == 'livetv') {
        return false;
      }
      return !latestExcludes.contains(id);
    }).toList();

    final tasks = filteredViews.map((data) async {
      final id = data['Id']?.toString() ?? '';
      final name = data['Name'] as String? ?? '';
      final collectionType = (data['CollectionType'] as String?)?.toLowerCase();
      try {
        final row = await _dataSource.loadRecentlyReleased(
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
          id: 'resume',
          title: l10n.continueWatching,
          rowType: HomeRowType.resume,
          isLoading: true,
        );
      case HomeSectionType.resumeAudio:
        return HomeRow(
          id: 'resumeAudio',
          title: l10n.continueListening,
          rowType: HomeRowType.resumeAudio,
          isLoading: true,
        );
      case HomeSectionType.nextUp:
        return HomeRow(
          id: 'nextUp',
          title: l10n.nextUp,
          rowType: HomeRowType.nextUp,
          isLoading: true,
        );
      case HomeSectionType.latestMedia:
        return HomeRow(
          id: 'latestMedia',
          title: l10n.latestMedia,
          rowType: HomeRowType.latestMedia,
          isLoading: true,
        );
      case HomeSectionType.playlists:
        return HomeRow(
          id: 'playlists',
          title: l10n.playlists,
          rowType: HomeRowType.playlists,
          isLoading: true,
        );
      case HomeSectionType.audioArtists:
        return HomeRow(
          id: 'audioArtists',
          title: l10n.artists,
          rowType: HomeRowType.audioArtists,
          isLoading: true,
          isAudio: true,
        );
      case HomeSectionType.audioAlbums:
        return HomeRow(
          id: 'audioAlbums',
          title: l10n.albums,
          rowType: HomeRowType.audioAlbums,
          isLoading: true,
          isAudio: true,
        );
      case HomeSectionType.audioPlaylists:
        return HomeRow(
          id: 'audioPlaylists',
          title: l10n.audioPlaylists,
          rowType: HomeRowType.audioPlaylists,
          isLoading: true,
          isAudio: true,
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
          id: 'libraryTiles',
          title: l10n.myMedia,
          rowType: HomeRowType.libraryTiles,
          isLoading: true,
        );
      case HomeSectionType.libraryButtons:
        return HomeRow(
          id: 'libraryTilesSmall',
          title: l10n.myMedia,
          rowType: HomeRowType.libraryTilesSmall,
          isLoading: true,
        );
      case HomeSectionType.seerrRecentRequests:
        return HomeRow(
          id: 'seerr_recent_requests',
          title: l10n.recentRequests,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrRecentlyAdded:
        return HomeRow(
          id: 'seerr_recently_added',
          title: l10n.recentlyAdded,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrPopularMovies:
        return HomeRow(
          id: 'seerr_popular_movies',
          title: l10n.popularMovies,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrUpcomingMovies:
        return HomeRow(
          id: 'seerr_upcoming_movies',
          title: l10n.upcomingMovies,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrPopularSeries:
        return HomeRow(
          id: 'seerr_popular_series',
          title: l10n.popularSeries,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrUpcomingSeries:
        return HomeRow(
          id: 'seerr_upcoming_series',
          title: l10n.upcomingSeries,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrTrending:
        return HomeRow(
          id: 'seerr_trending',
          title: l10n.trending,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrMovieGenres:
        return HomeRow(
          id: 'seerr_movie_genres',
          title: l10n.movieGenres,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrStudios:
        return HomeRow(
          id: 'seerr_studios',
          title: l10n.studios,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrSeriesGenres:
        return HomeRow(
          id: 'seerr_series_genres',
          title: l10n.seriesGenres,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.seerrNetworks:
        return HomeRow(
          id: 'seerr_networks',
          title: l10n.networks,
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.radarrCalendar:
        return HomeRow(
          id: 'radarr_calendar',
          title: 'Upcoming Movies (Radarr)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.sonarrCalendar:
        return HomeRow(
          id: 'sonarr_calendar',
          title: 'Upcoming TV Shows (Sonarr)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbPopularMovies:
        return HomeRow(
          id: 'tmdb_popular_movies',
          title: 'Popular Movies',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTopRatedMovies:
        return HomeRow(
          id: 'tmdb_top_rated_movies',
          title: 'Top Rated Movies',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbNowPlayingMovies:
        return HomeRow(
          id: 'tmdb_now_playing_movies',
          title: 'Now Playing Movies',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbUpcomingMovies:
        return HomeRow(
          id: 'tmdb_upcoming_movies',
          title: 'Upcoming Movies',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbPopularTv:
        return HomeRow(
          id: 'tmdb_popular_tv',
          title: 'Popular TV',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTopRatedTv:
        return HomeRow(
          id: 'tmdb_top_rated_tv',
          title: 'Top Rated TV',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbAiringTodayTv:
        return HomeRow(
          id: 'tmdb_airing_today_tv',
          title: 'Airing Today TV',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbOnTheAirTv:
        return HomeRow(
          id: 'tmdb_on_the_air_tv',
          title: 'On The Air TV',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTrendingMovieDaily:
        return HomeRow(
          id: 'tmdb_trending_movie_daily',
          title: 'Trending Movies (Daily)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTrendingMovieWeekly:
        return HomeRow(
          id: 'tmdb_trending_movie_weekly',
          title: 'Trending Movies (Weekly)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTrendingTvDaily:
        return HomeRow(
          id: 'tmdb_trending_tv_daily',
          title: 'Trending TV (Daily)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTrendingTvWeekly:
        return HomeRow(
          id: 'tmdb_trending_tv_weekly',
          title: 'Trending TV (Weekly)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.tmdbTrendingAllWeekly:
        return HomeRow(
          id: 'tmdb_trending_all_weekly',
          title: 'Trending All (Weekly)',
          rowType: HomeRowType.pluginDynamic,
          isLoading: true,
        );
      case HomeSectionType.liveTv:
      case HomeSectionType.activeRecordings:
      case HomeSectionType.mediaBar:
      case HomeSectionType.recentlyReleased:
        return HomeRow(
          id: 'recentlyReleased',
          title: l10n.recentlyReleased,
          rowType: HomeRowType.recentlyReleased,
          isLoading: true,
        );
      case HomeSectionType.sinceYouWatched1:
      case HomeSectionType.sinceYouWatched2:
      case HomeSectionType.sinceYouWatched3:
      case HomeSectionType.sinceYouWatched4:
      case HomeSectionType.sinceYouWatched5:
        final index = _getSinceYouWatchedIndex(section);
        return HomeRow(
          id: 'sinceYouWatched$index',
          title: 'Since you watched',
          rowType: HomeRowType.latestMedia,
          isLoading: true,
        );
      case HomeSectionType.rewatch:
        return HomeRow(
          id: 'rewatch',
          title: 'Rewatch',
          rowType: HomeRowType.latestMedia,
          isLoading: true,
        );
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
          final filteredResume = _prefs.filterContinueWatching(resumeRow.items);
          final filteredNextUp = _prefs.filterNextUp(nextUpRow?.items ?? []);
          final mergedItemsMap = <String, AggregatedItem>{};
          for (final item in filteredResume) {
            mergedItemsMap[item.id] = item;
          }
          for (final item in filteredNextUp) {
            mergedItemsMap.putIfAbsent(item.id, () => item);
          }
          int byLastPlayedDate(AggregatedItem a, AggregatedItem b) {
            final aDate =
                a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            final bDate =
                b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            return bDate.compareTo(aDate);
          }

          final sorted = mergedItemsMap.values.toList()..sort(byLastPlayedDate);
          _applyMergedResumeResult(sorted);
        } else {
          final results = await Future.wait([
            _dataSource.loadResume(_serverId),
            _dataSource.loadNextUp(_serverId),
          ]);
          final filteredResume = _prefs.filterContinueWatching(results[0].items);
          final filteredNextUp = _prefs.filterNextUp(results[1].items);
          final mergedItemsMap = <String, AggregatedItem>{};
          for (final item in filteredResume) {
            mergedItemsMap[item.id] = item;
          }
          for (final item in filteredNextUp) {
            mergedItemsMap.putIfAbsent(item.id, () => item);
          }
          int byLastPlayedDate(AggregatedItem a, AggregatedItem b) {
            final aDate =
                a.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
            final bDate =
                b.rawData['UserData']?['LastPlayedDate'] as String? ?? '';
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
    _watchNext.update(_rows);
  }

  static const _seerrEnrichConcurrency = 5;

  Future<List<HomeRow>> _loadSeerrRow(
    SeerrRowType type,
    String title,
    String rowId,
  ) async {
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
        final mapped = response.results.where((r) => r.media != null).map((r) {
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
        }).toList();
        rawItems = (await mapBounded(
          mapped,
          _seerrEnrichConcurrency,
          (item) => _enrichSeerrItem(repo, item),
        )).whereType<SeerrDiscoverItem>().toList();
      } else if (type == SeerrRowType.recentlyAdded) {
        final media = await repo.getRecentlyAdded(limit: limit);
        final mapped = media
            .map(
              (m) => SeerrDiscoverItem(
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
              ),
            )
            .toList();
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
        if (type != SeerrRowType.recentlyAdded &&
            type != SeerrRowType.recentRequests) {
          if (item.isAvailable || item.isBlacklisted) return false;
        }
        if (blockNsfw) {
          if (item.adult) return false;
          final text = '${item.displayTitle} ${item.overview ?? ''}';
          if (SeerrDiscoverViewModel.nsfwPatterns.any(
            (p) => p.hasMatch(text),
          )) {
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
            'ProductionYear': _extractYear(
              item.releaseDate ?? item.firstAirDate,
            ),
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

  Future<SeerrDiscoverPage?> _loadSeerrPage(
    SeerrRepository repo,
    SeerrRowType type,
    int limit,
  ) async {
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

  Future<SeerrDiscoverItem> _enrichSeerrItem(
    SeerrRepository repo,
    SeerrDiscoverItem item,
  ) async {
    if (item.backdropPath != null &&
        item.voteAverage != null &&
        (item.releaseDate != null || item.firstAirDate != null)) {
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


  Future<List<HomeRow>> _loadTmdbChartRow(
    HomeSectionType sectionType,
    String title,
    String rowId,
  ) async {
    try {
      final customService = GetIt.instance<CustomExternalListsService>();
      final config = HomeSectionConfig.pluginDynamic(
        serverId: 'seerr', // placeholder
        pluginSection: rowId,
        pluginDisplayText: title,
        pluginSource: HomeSectionPluginSource.custom,
        pluginAdditionalData: jsonEncode({
          'source': 'tmdb_chart',
          'type': _tmdbChartTypeForSection(sectionType),
        }),
      );

      var items = await customService.loadCustomRowFromCache(config);
      if (items.isEmpty) {
        items = await customService.fetchCustomRow(config);
      }

      if (items.isEmpty) {
        return const [];
      }

      final aggregatedItems = items.map((item) {
        final itemId = item.imdbId.isNotEmpty ? item.imdbId : item.tmdbId;
        return AggregatedItem(
          id: itemId,
          serverId: 'seerr',
          rawData: {
            'Name': item.title,
            'Type': item.type,
            'Overview': '',
            'PosterPath': item.posterUrl ?? '',
            'BackdropPath': item.backdropUrl ?? item.posterUrl ?? '',
            'ProductionYear': item.year,
            'SeerrMediaType': item.type == 'Series' ? 'tv' : 'movie',
            'ProviderIds': {
              if (item.imdbId.isNotEmpty) 'Imdb': item.imdbId,
              if (item.tmdbId.isNotEmpty) 'Tmdb': item.tmdbId,
            },
          },
        );
      }).toList();

      return [
        HomeRow(
          id: rowId,
          title: title,
          rowType: HomeRowType.pluginDynamic,
          items: aggregatedItems,
        )
      ];
    } catch (e) {
      debugPrint('[TmdbChartRow] Failed to load TMDB chart row $sectionType: $e');
      return const [];
    }
  }

  String _tmdbChartTypeForSection(HomeSectionType sectionType) {
    return switch (sectionType) {
      HomeSectionType.tmdbPopularMovies => 'movie/popular',
      HomeSectionType.tmdbTopRatedMovies => 'movie/top_rated',
      HomeSectionType.tmdbNowPlayingMovies => 'movie/now_playing',
      HomeSectionType.tmdbUpcomingMovies => 'movie/upcoming',
      HomeSectionType.tmdbPopularTv => 'tv/popular',
      HomeSectionType.tmdbTopRatedTv => 'tv/top_rated',
      HomeSectionType.tmdbAiringTodayTv => 'tv/airing_today',
      HomeSectionType.tmdbOnTheAirTv => 'tv/on_the_air',
      HomeSectionType.tmdbTrendingMovieDaily => 'trending/movie/day',
      HomeSectionType.tmdbTrendingMovieWeekly => 'trending/movie/week',
      HomeSectionType.tmdbTrendingTvDaily => 'trending/tv/day',
      HomeSectionType.tmdbTrendingTvWeekly => 'trending/tv/week',
      HomeSectionType.tmdbTrendingAllWeekly => 'trending/all/week',
      _ => 'movie/popular',
    };
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

  List<AggregatedItem> _filterAndFormatRadarrItems(List<AggregatedItem> rawItems) {
    final now = DateTime.now();
    final showCinema = _prefs.get(UserPreferences.radarrCalendarShowCinema);
    final showDigital = _prefs.get(UserPreferences.radarrCalendarShowDigital);
    final showPhysical = _prefs.get(UserPreferences.radarrCalendarShowPhysical);
    final showDate = _prefs.get(UserPreferences.radarrCalendarShowDate);

    final List<AggregatedItem> filtered = [];

    for (final item in rawItems) {
      final inCinemasStr = item.rawData['InCinemas'] as String?;
      final digitalReleaseStr = item.rawData['DigitalRelease'] as String?;
      final physicalReleaseStr = item.rawData['PhysicalRelease'] as String?;

      final inCinemas = inCinemasStr != null ? DateTime.tryParse(inCinemasStr) : null;
      final digitalRelease = digitalReleaseStr != null ? DateTime.tryParse(digitalReleaseStr) : null;
      final physicalRelease = physicalReleaseStr != null ? DateTime.tryParse(physicalReleaseStr) : null;

      final enabledReleases = <DateTime, String>{};
      if (showCinema && inCinemas != null && inCinemas.isAfter(now.subtract(const Duration(days: 1)))) {
        enabledReleases[inCinemas] = 'Cinema: ';
      }
      if (showDigital && digitalRelease != null && digitalRelease.isAfter(now.subtract(const Duration(days: 1)))) {
        enabledReleases[digitalRelease] = 'Digital: ';
      }
      if (showPhysical && physicalRelease != null && physicalRelease.isAfter(now.subtract(const Duration(days: 1)))) {
        enabledReleases[physicalRelease] = 'Physical: ';
      }

      if (enabledReleases.isEmpty) continue;

      final sortedDates = enabledReleases.keys.toList()..sort();
      final targetReleaseDate = sortedDates.first;
      final releaseType = enabledReleases[targetReleaseDate]!;

      String? subtitleText;
      if (showDate) {
        final dateStr = _formatDateHuman(targetReleaseDate);
        subtitleText = '$releaseType$dateStr';
      }

      final newRawData = Map<String, dynamic>.from(item.rawData);
      newRawData['Subtitle'] = subtitleText;
      newRawData['CalendarDate'] = targetReleaseDate.toIso8601String();

      filtered.add(AggregatedItem(
        id: item.id,
        serverId: item.serverId,
        rawData: newRawData,
      ));
    }

    filtered.sort((a, b) {
      final dateA = a.rawData['CalendarDate'] as String? ?? '';
      final dateB = b.rawData['CalendarDate'] as String? ?? '';
      return dateA.compareTo(dateB);
    });

    return filtered;
  }

  List<AggregatedItem> _formatSonarrItems(List<AggregatedItem> rawItems) {
    final showDate = _prefs.get(UserPreferences.sonarrCalendarShowDate);
    final showEpisodeInfo = _prefs.get(UserPreferences.sonarrCalendarShowEpisodeInfo);

    return rawItems.map((item) {
      final airDateUtcStr = item.rawData['CalendarDate'] as String?;
      final airDateUtc = airDateUtcStr != null ? DateTime.tryParse(airDateUtcStr) : null;
      if (airDateUtc == null) return item;

      final sNum = item.rawData['SeasonNumber'] as String? ?? '0';
      final eNum = item.rawData['EpisodeNumber'] as String? ?? '0';

      String? subtitleText;
      if (showDate && showEpisodeInfo) {
        final dateStr = _formatDateHuman(airDateUtc);
        subtitleText = 'Next Episode: $dateStr (S$sNum:E$eNum)';
      } else if (showDate) {
        final dateStr = _formatDateHuman(airDateUtc);
        subtitleText = 'Next Episode: $dateStr';
      } else if (showEpisodeInfo) {
        subtitleText = 'Next Episode: (S$sNum:E$eNum)';
      }

      final newRawData = Map<String, dynamic>.from(item.rawData);
      newRawData['Subtitle'] = subtitleText;

      return AggregatedItem(
        id: item.id,
        serverId: item.serverId,
        rawData: newRawData,
      );
    }).toList();
  }

  Future<List<HomeRow>> _loadRadarrCalendarRow({bool forceRefresh = false}) async {
    final merge = _prefs.get(UserPreferences.mergeRadarrSonarrCalendars);
    if (merge) {
      return _loadMergedCalendarRow(forceRefresh: forceRefresh);
    }
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final lastFetch = _prefs.get(UserPreferences.lastRadarrCalendarFetchTime);
      final cacheAge = nowMs - lastFetch;
      final shouldFetch = forceRefresh || cacheAge > const Duration(days: 1).inMilliseconds;

      List<AggregatedItem> items;
      if (shouldFetch) {
        final fetchedItems = await _fetchRadarrCalendarFromApi();
        if (fetchedItems != null) {
          await _saveRadarrCalendarToCache(fetchedItems);
          await _prefs.set(UserPreferences.lastRadarrCalendarFetchTime, nowMs);
          items = _filterAndFormatRadarrItems(fetchedItems);
        } else {
          final cached = await _loadRadarrCalendarFromCache();
          items = _filterAndFormatRadarrItems(cached);
        }
      } else {
        final cached = await _loadRadarrCalendarFromCache();
        items = _filterAndFormatRadarrItems(cached);
        if (items.isEmpty) {
          final fetchedItems = await _fetchRadarrCalendarFromApi();
          if (fetchedItems != null) {
            await _saveRadarrCalendarToCache(fetchedItems);
            await _prefs.set(UserPreferences.lastRadarrCalendarFetchTime, nowMs);
            items = _filterAndFormatRadarrItems(fetchedItems);
          }
        }
      }

      return [
        HomeRow(
          id: 'radarr_calendar',
          title: 'Upcoming Movies (Radarr)',
          rowType: HomeRowType.pluginDynamic,
          items: items,
        )
      ];
    } catch (e) {
      debugPrint('[RadarrCalendar] Failed to load: $e');
      return const [];
    }
  }

  Future<List<HomeRow>> _loadSonarrCalendarRow({bool forceRefresh = false}) async {
    final merge = _prefs.get(UserPreferences.mergeRadarrSonarrCalendars);
    if (merge) {
      final hasRadarrConfig = _prefs.homeSectionsConfig.any((c) => c.enabled && c.type == HomeSectionType.radarrCalendar);
      if (hasRadarrConfig) {
        return const [];
      } else {
        return _loadMergedCalendarRow(forceRefresh: forceRefresh);
      }
    }
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final lastFetch = _prefs.get(UserPreferences.lastSonarrCalendarFetchTime);
      final cacheAge = nowMs - lastFetch;
      final shouldFetch = forceRefresh || cacheAge > const Duration(days: 1).inMilliseconds;

      List<AggregatedItem> items;
      if (shouldFetch) {
        final fetchedItems = await _fetchSonarrCalendarFromApi();
        if (fetchedItems != null) {
          await _saveSonarrCalendarToCache(fetchedItems);
          await _prefs.set(UserPreferences.lastSonarrCalendarFetchTime, nowMs);
          items = _formatSonarrItems(fetchedItems);
        } else {
          final cached = await _loadSonarrCalendarFromCache();
          items = _formatSonarrItems(cached);
        }
      } else {
        final cached = await _loadSonarrCalendarFromCache();
        items = _formatSonarrItems(cached);
        if (items.isEmpty) {
          final fetchedItems = await _fetchSonarrCalendarFromApi();
          if (fetchedItems != null) {
            await _saveSonarrCalendarToCache(fetchedItems);
            await _prefs.set(UserPreferences.lastSonarrCalendarFetchTime, nowMs);
            items = _formatSonarrItems(fetchedItems);
          }
        }
      }

      return [
        HomeRow(
          id: 'sonarr_calendar',
          title: 'Upcoming TV Shows (Sonarr)',
          rowType: HomeRowType.pluginDynamic,
          items: items,
        )
      ];
    } catch (e) {
      debugPrint('[SonarrCalendar] Failed to load: $e');
      return const [];
    }
  }

  Future<List<AggregatedItem>> _loadRadarrCalendarFromCache() async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/radarr_calendar_cache.json');
      if (await file.exists()) {
        final content = await file.readAsString();
        final list = jsonDecode(content) as List;
        final items = list.map((x) => _aggregatedItemFromJson(x as Map<String, dynamic>)).toList();
        final hasOldCache = items.any((x) => !x.rawData.containsKey('CalendarDate') || x.rawData['PosterPath'] == '' || !x.rawData.containsKey('CacheVerV2'));
        if (hasOldCache) {
          debugPrint('[RadarrCalendarCache] Old cache detected, invalidating to force fresh fetch');
          return const [];
        }
        return items;
      }
    } catch (e) {
      debugPrint('[RadarrCalendarCache] Failed to load: $e');
    }
    return const [];
  }

  Future<void> _saveRadarrCalendarToCache(List<AggregatedItem> items) async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/radarr_calendar_cache.json');
      final content = jsonEncode(items.map((x) => _aggregatedItemToJson(x)).toList());
      await file.writeAsString(content, flush: true);
    } catch (e) {
      debugPrint('[RadarrCalendarCache] Failed to save: $e');
    }
  }

  Future<List<AggregatedItem>> _loadSonarrCalendarFromCache() async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/sonarr_calendar_cache.json');
      if (await file.exists()) {
        final content = await file.readAsString();
        final list = jsonDecode(content) as List;
        final items = list.map((x) => _aggregatedItemFromJson(x as Map<String, dynamic>)).toList();
        final hasOldCache = items.any((x) => !x.rawData.containsKey('CalendarDate') || x.rawData['PosterPath'] == '' || !x.rawData.containsKey('CacheVerV2'));
        if (hasOldCache) {
          debugPrint('[SonarrCalendarCache] Old cache detected, invalidating to force fresh fetch');
          return const [];
        }
        return items;
      }
    } catch (e) {
      debugPrint('[SonarrCalendarCache] Failed to load: $e');
    }
    return const [];
  }

  Future<void> _saveSonarrCalendarToCache(List<AggregatedItem> items) async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/sonarr_calendar_cache.json');
      final content = jsonEncode(items.map((x) => _aggregatedItemToJson(x)).toList());
      await file.writeAsString(content, flush: true);
    } catch (e) {
      debugPrint('[SonarrCalendarCache] Failed to save: $e');
    }
  }

  Map<String, dynamic> _aggregatedItemToJson(AggregatedItem item) {
    return {
      'id': item.id,
      'serverId': item.serverId,
      'rawData': item.rawData,
    };
  }

  AggregatedItem _aggregatedItemFromJson(Map<String, dynamic> json) {
    return AggregatedItem(
      id: json['id'] as String,
      serverId: json['serverId'] as String,
      rawData: Map<String, dynamic>.from(json['rawData'] as Map),
    );
  }

  Future<List<AggregatedItem>?> _fetchRadarrCalendarFromApi() async {
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      final radarrServers = await repo.getRadarrSettings();
      if (radarrServers.isEmpty) return null;
      final server = radarrServers.first;

      final protocol = server.useSsl ? 'https' : 'http';
      final host = server.hostname;
      final port = server.port;
      final basePath = server.baseUrl ?? '';
      final cleanBasePath = basePath.endsWith('/') ? basePath.substring(0, basePath.length - 1) : basePath;
      final apiKey = server.apiKey;

      final now = DateTime.now();
      final start = now.toIso8601String().substring(0, 10);
      final end = now.add(const Duration(days: 90)).toIso8601String().substring(0, 10);

      final dio = Dio();
      final url = '$protocol://$host:$port$cleanBasePath/api/v3/calendar';
      final response = await dio.get(
        url,
        queryParameters: {
          'apikey': apiKey,
          'start': start,
          'end': end,
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode != 200 || response.data == null) {
        return null;
      }

      final results = response.data as List;

      final enrichCompleters = await mapBounded(
        results,
        5,
        (res) async {
          if (res is! Map) return null;
          final tmdbIdVal = res['tmdbId'];
          if (tmdbIdVal == null || tmdbIdVal == 0) return null;
          final tmdbId = tmdbIdVal.toString();

          final title = res['title'] as String? ?? 'Unknown';
          final overview = res['overview'] as String? ?? '';
          final year = res['year'] as int?;

          final inCinemasStr = res['inCinemas'] as String?;
          final digitalReleaseStr = res['digitalRelease'] as String?;
          final physicalReleaseStr = res['physicalRelease'] as String?;

          final inCinemas = inCinemasStr != null ? DateTime.tryParse(inCinemasStr) : null;
          final digitalRelease = digitalReleaseStr != null ? DateTime.tryParse(digitalReleaseStr) : null;
          final physicalRelease = physicalReleaseStr != null ? DateTime.tryParse(physicalReleaseStr) : null;

          final allReleases = <DateTime>[];
          if (inCinemas != null && inCinemas.isAfter(now.subtract(const Duration(days: 1)))) {
            allReleases.add(inCinemas);
          }
          if (digitalRelease != null && digitalRelease.isAfter(now.subtract(const Duration(days: 1)))) {
            allReleases.add(digitalRelease);
          }
          if (physicalRelease != null && physicalRelease.isAfter(now.subtract(const Duration(days: 1)))) {
            allReleases.add(physicalRelease);
          }

          if (allReleases.isEmpty) return null;

          final sortedDates = allReleases..sort();
          final defaultReleaseDate = sortedDates.first;

          String? posterPath;
          String? backdropPath;
          final images = res['images'] as List?;
          if (images != null) {
            for (final img in images) {
              if (img is! Map) continue;
              final type = img['coverType'] as String?;
              final remoteUrl = img['remoteUrl'] as String? ?? img['url'] as String?;
              if (remoteUrl != null && remoteUrl.isNotEmpty) {
                final fullUrl = remoteUrl.startsWith('http')
                    ? remoteUrl
                    : '$protocol://$host:$port$cleanBasePath$remoteUrl${remoteUrl.contains('?') ? '&' : '?'}apikey=$apiKey';
                if (type == 'poster') {
                  posterPath = fullUrl;
                } else if (type == 'fanart') {
                  backdropPath = fullUrl;
                }
              }
            }
          }

          if (posterPath == null || posterPath.isEmpty) {
            try {
              final details = await repo.getMovieDetails(int.parse(tmdbId));
              posterPath = _tmdbImageUrl(details.posterPath, 300) ?? '';
              backdropPath = _tmdbImageUrl(details.backdropPath, 1280) ?? '';
            } catch (_) {}
          }

          return _CalendarItemWithDate(
            item: AggregatedItem(
              id: tmdbId,
              serverId: 'seerr',
              rawData: {
                'Name': title,
                'Type': 'Movie',
                'Overview': overview,
                'PosterPath': posterPath,
                'BackdropPath': backdropPath,
                'ProductionYear': year,
                'SeerrMediaType': 'movie',
                'InCinemas': inCinemasStr,
                'DigitalRelease': digitalReleaseStr,
                'PhysicalRelease': physicalReleaseStr,
                'CalendarDate': defaultReleaseDate.toIso8601String(),
                'CacheVerV2': true,
              },
            ),
            date: defaultReleaseDate,
          );
        },
      );

      final calendarItems = enrichCompleters.whereType<_CalendarItemWithDate>().toList()
        ..sort((a, b) => a.date.compareTo(b.date));

      return calendarItems.map((c) => c.item).toList();
    } catch (e) {
      debugPrint('[RadarrCalendarApi] Failed to fetch: $e');
      return null;
    }
  }

  Future<List<AggregatedItem>?> _fetchSonarrCalendarFromApi() async {
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      final sonarrServers = await repo.getSonarrSettings();
      if (sonarrServers.isEmpty) return null;
      final server = sonarrServers.first;

      final protocol = server.useSsl ? 'https' : 'http';
      final host = server.hostname;
      final port = server.port;
      final basePath = server.baseUrl ?? '';
      final cleanBasePath = basePath.endsWith('/') ? basePath.substring(0, basePath.length - 1) : basePath;
      final apiKey = server.apiKey;

      final now = DateTime.now();
      final start = now.toIso8601String().substring(0, 10);
      final end = now.add(const Duration(days: 90)).toIso8601String().substring(0, 10);

      final dio = Dio();
      final url = '$protocol://$host:$port$cleanBasePath/api/v3/calendar';
      final response = await dio.get(
        url,
        queryParameters: {
          'apikey': apiKey,
          'start': start,
          'end': end,
          'includeSeries': 'true',
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode != 200 || response.data == null) {
        return null;
      }

      final results = response.data as List;

      final groupedEpisodes = <int, Map<String, dynamic>>{};
      for (final res in results) {
        if (res is! Map) continue;
        final seriesMap = res['series'];
        if (seriesMap is! Map) continue;

        final tvdbIdVal = seriesMap['tvdbId'];
        if (tvdbIdVal == null || tvdbIdVal == 0) continue;
        final tvdbId = tvdbIdVal as int;

        final airDateUtcStr = res['airDateUtc'] as String?;
        final airDateUtc = airDateUtcStr != null ? DateTime.tryParse(airDateUtcStr) : null;
        if (airDateUtc == null) continue;

        final existing = groupedEpisodes[tvdbId];
        if (existing == null) {
          groupedEpisodes[tvdbId] = {
            'series': seriesMap,
            'airDate': airDateUtc,
            'seasonNumber': res['seasonNumber'],
            'episodeNumber': res['episodeNumber'],
          };
        } else {
          final existingAirDate = existing['airDate'] as DateTime;
          if (airDateUtc.isBefore(existingAirDate)) {
            existing['airDate'] = airDateUtc;
            existing['seasonNumber'] = res['seasonNumber'];
            existing['episodeNumber'] = res['episodeNumber'];
          }
        }
      }

      final enrichCompleters = await mapBounded(
        groupedEpisodes.values.toList(),
        5,
        (episodeInfo) async {
          final seriesMap = episodeInfo['series'] as Map;
          final tvdbId = seriesMap['tvdbId'] as int;
          final seriesTitle = seriesMap['title'] as String? ?? 'Unknown';
          final overview = seriesMap['overview'] as String? ?? '';
          final airDateUtc = episodeInfo['airDate'] as DateTime;

          int? tmdbId;
          final tmdbIdVal = seriesMap['tmdbId'];
          if (tmdbIdVal != null && tmdbIdVal != 0) {
            tmdbId = tmdbIdVal as int;
          } else {
            try {
              final tvDetails = await repo.getTvDetailsByTvdb(tvdbId);
              tmdbId = tvDetails.id;
            } catch (_) {}
          }

          if (tmdbId == null || tmdbId == 0) return null;

          String? posterPath;
          String? backdropPath;
          final images = seriesMap['images'] as List?;
          if (images != null) {
            for (final img in images) {
              if (img is! Map) continue;
              final type = img['coverType'] as String?;
              final remoteUrl = img['remoteUrl'] as String? ?? img['url'] as String?;
              if (remoteUrl != null && remoteUrl.isNotEmpty) {
                final fullUrl = remoteUrl.startsWith('http')
                    ? remoteUrl
                    : '$protocol://$host:$port$cleanBasePath$remoteUrl${remoteUrl.contains('?') ? '&' : '?'}apikey=$apiKey';
                if (type == 'poster') {
                  posterPath = fullUrl;
                } else if (type == 'fanart') {
                  backdropPath = fullUrl;
                }
              }
            }
          }

          if (posterPath == null || posterPath.isEmpty) {
            try {
              final details = await repo.getTvDetails(tmdbId);
              posterPath = _tmdbImageUrl(details.posterPath, 300) ?? '';
              backdropPath = _tmdbImageUrl(details.backdropPath, 1280) ?? '';
            } catch (_) {}
          }

          final sNum = (episodeInfo['seasonNumber'] ?? 0).toString();
          final eNum = (episodeInfo['episodeNumber'] ?? 0).toString();

          return _CalendarItemWithDate(
            item: AggregatedItem(
              id: tmdbId.toString(),
              serverId: 'seerr',
              rawData: {
                'Name': seriesTitle,
                'Type': 'Series',
                'Overview': overview,
                'PosterPath': posterPath,
                'BackdropPath': backdropPath,
                'SeerrMediaType': 'tv',
                'SeasonNumber': sNum,
                'EpisodeNumber': eNum,
                'CalendarDate': airDateUtc.toIso8601String(),
                'CacheVerV2': true,
              },
            ),
            date: airDateUtc,
          );
        },
      );

      final calendarItems = enrichCompleters.whereType<_CalendarItemWithDate>().toList()
        ..sort((a, b) => a.date.compareTo(b.date));

      return calendarItems.map((c) => c.item).toList();
    } catch (e) {
      debugPrint('[SonarrCalendarApi] Failed to fetch: $e');
      return null;
    }
  }

  String? _tmdbImageUrl(String? path, int width) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    return 'https://image.tmdb.org/t/p/w$width$path';
  }

  String _formatDateHuman(DateTime date) {
    final months = [
      'Jan.',
      'Feb.',
      'Mar.',
      'Apr.',
      'May',
      'Jun.',
      'Jul.',
      'Aug.',
      'Sep.',
      'Oct.',
      'Nov.',
      'Dec.'
    ];
    final month = months[date.month - 1];
    final day = date.day;
    final suffix = switch (day) {
      1 || 21 || 31 => 'st',
      2 || 22 => 'nd',
      3 || 23 => 'rd',
      _ => 'th',
    };
    return '$month $day$suffix';
  }

  Future<List<HomeRow>> _loadMergedCalendarRow({bool forceRefresh = false}) async {
    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;

      // 1. Load Radarr items
      final lastRadarrFetch = _prefs.get(UserPreferences.lastRadarrCalendarFetchTime);
      final radarrCacheAge = nowMs - lastRadarrFetch;
      final shouldFetchRadarr = forceRefresh || radarrCacheAge > const Duration(days: 1).inMilliseconds;

      List<AggregatedItem> radarrItems;
      if (shouldFetchRadarr) {
        final fetched = await _fetchRadarrCalendarFromApi();
        if (fetched != null) {
          radarrItems = fetched;
          await _saveRadarrCalendarToCache(radarrItems);
          await _prefs.set(UserPreferences.lastRadarrCalendarFetchTime, nowMs);
        } else {
          radarrItems = await _loadRadarrCalendarFromCache();
        }
      } else {
        radarrItems = await _loadRadarrCalendarFromCache();
        if (radarrItems.isEmpty) {
          final fetched = await _fetchRadarrCalendarFromApi();
          if (fetched != null) {
            radarrItems = fetched;
            await _saveRadarrCalendarToCache(radarrItems);
            await _prefs.set(UserPreferences.lastRadarrCalendarFetchTime, nowMs);
          }
        }
      }

      // 2. Load Sonarr items
      final lastSonarrFetch = _prefs.get(UserPreferences.lastSonarrCalendarFetchTime);
      final sonarrCacheAge = nowMs - lastSonarrFetch;
      final shouldFetchSonarr = forceRefresh || sonarrCacheAge > const Duration(days: 1).inMilliseconds;

      List<AggregatedItem> sonarrItems;
      if (shouldFetchSonarr) {
        final fetched = await _fetchSonarrCalendarFromApi();
        if (fetched != null) {
          sonarrItems = fetched;
          await _saveSonarrCalendarToCache(sonarrItems);
          await _prefs.set(UserPreferences.lastSonarrCalendarFetchTime, nowMs);
        } else {
          sonarrItems = await _loadSonarrCalendarFromCache();
        }
      } else {
        sonarrItems = await _loadSonarrCalendarFromCache();
        if (sonarrItems.isEmpty) {
          final fetched = await _fetchSonarrCalendarFromApi();
          if (fetched != null) {
            sonarrItems = fetched;
            await _saveSonarrCalendarToCache(sonarrItems);
            await _prefs.set(UserPreferences.lastSonarrCalendarFetchTime, nowMs);
          }
        }
      }

      // 3. Merge and sort
      final filteredRadarr = _filterAndFormatRadarrItems(radarrItems);
      final filteredSonarr = _formatSonarrItems(sonarrItems);
      final mergedItems = [...filteredRadarr, ...filteredSonarr];
      mergedItems.sort((a, b) {
        final dateA = a.rawData['CalendarDate'] as String? ?? '';
        final dateB = b.rawData['CalendarDate'] as String? ?? '';
        return dateA.compareTo(dateB);
      });

      return [
        HomeRow(
          id: 'merged_calendar',
          title: 'Upcoming Releases',
          rowType: HomeRowType.pluginDynamic,
          items: mergedItems,
        )
      ];
    } catch (e) {
      debugPrint('[MergedCalendar] Failed to load merged calendar: $e');
      return const [];
    }
  }

  Future<void> _checkAndTriggerDailyExternalRowsRefresh() async {
    final lastRefreshMs = _prefs.get(UserPreferences.lastExternalRowsRefreshTime);
    final now = DateTime.now();
    final lastRefreshDate = DateTime.fromMillisecondsSinceEpoch(lastRefreshMs);
    final isDifferentDay = lastRefreshMs == 0 ||
        now.year != lastRefreshDate.year ||
        now.month != lastRefreshDate.month ||
        now.day != lastRefreshDate.day ||
        now.difference(lastRefreshDate).inHours >= 24;

    if (!isDifferentDay) return;

    final syncService = GetIt.instance<PluginSyncService>();
    if (!syncService.seerrAvailable) return;

    debugPrint('[DailyRefresh] Day changed or first run. Triggering background cache refresh of enabled lists...');

    await _prefs.set(UserPreferences.lastExternalRowsRefreshTime, now.millisecondsSinceEpoch);

    unawaited(() async {
      try {
        // Let the initial home load settle before this network sweep and its
        // follow-up load() run.
        await Future.delayed(const Duration(seconds: 15));
        if (_client.userId != _ownerUserId) return;

        final futures = <Future<void>>[];

        final customService = GetIt.instance<CustomExternalListsService>();
        final configs = _prefs.homeSectionsConfig;
        for (final config in configs) {
          if (config.pluginSource == HomeSectionPluginSource.custom && config.enabled) {
            futures.add(() async {
              try {
                final items = await customService.fetchCustomRow(config);
                if (items.isNotEmpty) {
                  await customService.saveCustomRowToCache(config, items);
                }
              } catch (e) {
                debugPrint('[DailyRefresh] Failed to refresh custom row ${config.pluginSection}: $e');
              }
            }());
          }
        }

        if (futures.isNotEmpty) {
          await Future.wait(futures);
          debugPrint('[DailyRefresh] Background cache refresh complete. Reloading HomeViewModel rows...');
          await load(preserveExisting: true);
        }
      } catch (e) {
        debugPrint('[DailyRefresh] Error during background refresh: $e');
      }
    }());
  }
}

class _CalendarItemWithDate {
  final AggregatedItem item;
  final DateTime date;
  _CalendarItemWithDate({required this.item, required this.date});
}
