import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/multi_server_repository.dart';
import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_discover_sliders.dart';
import '../../../data/utils/playlist_utils.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/seerr_row_config.dart';
import '../../../util/extensions.dart';
import '../../../util/focus/scroll_utils.dart';
import '../../../util/platform_detection.dart';
import '../../../util/server_url.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../widgets/skeleton/skeleton_shimmer.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_app_bar.dart';

const double _kHomeSectionTileRadius = 16;
const EdgeInsets _kHomeSectionTileContentPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);
const EdgeInsets _kHomeSectionTileOuterPadding = EdgeInsets.fromLTRB(
  12,
  4,
  12,
  4,
);

BoxDecoration _homeSectionTileDecoration(
  BuildContext context, {
  required bool focused,
  HomeSectionType? type,
  bool mergeEnabled = false,
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
    borderRadius: AppRadius.circular(_kHomeSectionTileRadius),
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
  const HomeSectionsScreen({super.key});

  @override
  State<HomeSectionsScreen> createState() => _HomeSectionsScreenState();
}

class _HomeSectionsScreenState extends State<HomeSectionsScreen>
    with RouteAware {
  final _prefs = GetIt.instance<UserPreferences>();
  ModalRoute<dynamic>? _observedRoute;
  late List<HomeSectionConfig> _sections;
  HomeSectionConfig? _mediaBarConfig;
  final _focusNodes = <FocusNode>[];
  final Map<String, FocusNode> _focusNodesByStableId = {};
  bool _isLoading = true;
  bool _showOverlay = true;

  final Set<String> _emptySectionIds = {};

  /// Turns false once the server answers with no Live TV channels, which hides
  /// the rows that need Live TV.
  bool _serverHasLiveTv = true;

  /// The disabled groups that are open, by [_getSectionCategory]. General
  /// starts open since it's short.
  final Set<int> _openGroups = {1};
  final Map<int, FocusNode> _groupHeaderFocusNodes = {};

  /// Seerr slider rows whose slider Seerr still has but this client can't
  /// show, so they stay in the layout without being offered.
  Set<String> _unshownSeerrSliderIds = const {};

  /// The names of the other servers signed in on this device, by address, so
  /// a collection picked from one of them says where it's from.
  Map<String, String> _otherServerNames = const {};

  String? _otherServerName(HomeSectionConfig section) =>
      _otherServerNames[normalizeServerBaseUrl(section.serverId ?? '')];

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
    var hasLiveTv = true;
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
                  mediaTypes: 'Audio',
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
                final includeItemTypes = _prefs
                    .get(UserPreferences.genresRowItemFilter)
                    .includeItemTypes;
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
          case HomeSectionType.studios:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getStudios(
                  userId: userId,
                  recursive: true,
                  limit: 1,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                setEmpty(stableId, total == 0);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.audioArtists:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  includeItemTypes: const ['MusicArtist'],
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, total == 0 && items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.audioAlbums:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  includeItemTypes: const ['MusicAlbum'],
                  limit: 1,
                  recursive: true,
                );
                final total = response['TotalRecordCount'] as int? ?? 0;
                final items = response['Items'] as List? ?? [];
                setEmpty(stableId, total == 0 && items.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.audioPlaylists:
            tasks.add(() async {
              try {
                final response = await client.itemsApi.getItems(
                  includeItemTypes: const ['Playlist'],
                  recursive: true,
                  fields: 'ChildCount,RecursiveItemCount',
                );
                final rawItems = response['Items'] as List? ?? [];
                final parsedItems = rawItems.map((item) {
                  final data = item as Map<String, dynamic>;
                  return AggregatedItem(
                    id: data['Id']?.toString() ?? '',
                    serverId: '',
                    rawData: data,
                  );
                }).toList();
                final filtered = await filterBrowsablePlaylists(
                  client,
                  parsedItems,
                  mediaType: 'Audio',
                );
                setEmpty(stableId, filtered.isEmpty);
              } catch (_) {}
            }());
            break;
          case HomeSectionType.activeRecordings:
            tasks.add(() async {
              try {
                final response = await client.liveTvApi.getRecordings(limit: 1);
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
                hasLiveTv = items.isNotEmpty;
              } catch (_) {}
            }());
            break;
          case HomeSectionType.onNow:
            tasks.add(() async {
              try {
                final response = await client.liveTvApi.getRecommendedPrograms(
                  limit: 1,
                  isAiring: true,
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
                final includeItemTypes = _prefs
                    .get(UserPreferences.genresRowItemFilter)
                    .includeItemTypes;
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
        _serverHasLiveTv = hasLiveTv;
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

  bool _isAudioSectionType(HomeSectionType type) {
    return type == HomeSectionType.audioArtists ||
        type == HomeSectionType.audioAlbums ||
        type == HomeSectionType.audioPlaylists;
  }

  bool _isSinceYouWatchedSectionType(HomeSectionType type) {
    return type == HomeSectionType.sinceYouWatched1 ||
        type == HomeSectionType.sinceYouWatched2 ||
        type == HomeSectionType.sinceYouWatched3 ||
        type == HomeSectionType.sinceYouWatched4 ||
        type == HomeSectionType.sinceYouWatched5;
  }

  int _getSinceYouWatchedIndex(HomeSectionType type) {
    switch (type) {
      case HomeSectionType.sinceYouWatched1:
        return 1;
      case HomeSectionType.sinceYouWatched2:
        return 2;
      case HomeSectionType.sinceYouWatched3:
        return 3;
      case HomeSectionType.sinceYouWatched4:
        return 4;
      case HomeSectionType.sinceYouWatched5:
        return 5;
      default:
        return 0;
    }
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
    return type == HomeSectionType.seerrShortcuts ||
        type == HomeSectionType.seerrRecentRequests ||
        type == HomeSectionType.seerrWatchlist ||
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
    if (section.type == HomeSectionType.studios) {
      return 4;
    }
    if (section.type == HomeSectionType.playlists) {
      return 5;
    }
    if (_isSeerrSectionType(section.type) ||
        section.type == HomeSectionType.radarrCalendar ||
        section.type == HomeSectionType.sonarrCalendar) {
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

  bool _isAnyTmdbSectionEnabled() =>
      UserPreferences.tmdbSectionEnabled.values.any(_prefs.get);

  bool _isTmdbRowEnabled(HomeSectionType type) {
    final prefKey = UserPreferences.tmdbSectionEnabled[type];
    if (prefKey == null) return false;
    return _prefs.get(prefKey);
  }

  void _disableSeerrHomeRow(HomeSectionType type) {
    final seerrType = type.seerrRowType;
    if (seerrType == null) return;
    final seerrPrefs = GetIt.instance<SeerrPreferences>();
    final configs = List<SeerrRowConfig>.from(seerrPrefs.homeRowsConfig);
    final idx = configs.indexWhere((c) => c.type == seerrType);
    if (idx >= 0) {
      configs[idx] = configs[idx].copyWith(enabled: false);
      seerrPrefs.setHomeRowsConfig(configs);
    } else {
      configs.add(
        SeerrRowConfig(type: seerrType, enabled: false, order: configs.length),
      );
      seerrPrefs.setHomeRowsConfig(configs);
    }
  }

  bool _isAnyImdbSectionEnabled() {
    return _prefs.get(UserPreferences.imdbTop250MoviesEnabled) ||
        _prefs.get(UserPreferences.imdbTop250TvShowsEnabled) ||
        _prefs.get(UserPreferences.imdbMostPopularMoviesEnabled) ||
        _prefs.get(UserPreferences.imdbMostPopularTvShowsEnabled) ||
        _prefs.get(UserPreferences.imdbLowestRatedMoviesEnabled) ||
        _prefs.get(UserPreferences.imdbTopEnglishMoviesEnabled);
  }

  bool _isImdbRowEnabled(HomeSectionType type) {
    final prefKey = switch (type) {
      HomeSectionType.imdbTop250Movies =>
        UserPreferences.imdbTop250MoviesEnabled,
      HomeSectionType.imdbTop250TvShows =>
        UserPreferences.imdbTop250TvShowsEnabled,
      HomeSectionType.imdbMostPopularMovies =>
        UserPreferences.imdbMostPopularMoviesEnabled,
      HomeSectionType.imdbMostPopularTvShows =>
        UserPreferences.imdbMostPopularTvShowsEnabled,
      HomeSectionType.imdbLowestRatedMovies =>
        UserPreferences.imdbLowestRatedMoviesEnabled,
      HomeSectionType.imdbTopEnglishMovies =>
        UserPreferences.imdbTopEnglishMoviesEnabled,
      _ => null,
    };
    return prefKey != null ? _prefs.get(prefKey) : false;
  }

  bool _isImdbSectionType(HomeSectionType type) {
    return type == HomeSectionType.imdbTop250Movies ||
        type == HomeSectionType.imdbTop250TvShows ||
        type == HomeSectionType.imdbMostPopularMovies ||
        type == HomeSectionType.imdbMostPopularTvShows ||
        type == HomeSectionType.imdbLowestRatedMovies ||
        type == HomeSectionType.imdbTopEnglishMovies;
  }

  bool _isTmdbSectionType(HomeSectionType type) =>
      UserPreferences.isTmdbSectionType(type);

  bool _isHiddenByRowVisibilityGates(HomeSectionConfig section) {
    final showFavoritesRows = _prefs.get(UserPreferences.displayFavoritesRows);
    final showCollectionsRows = _prefs.get(
      UserPreferences.displayCollectionsRows,
    );
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    final showPlaylistsRows = _prefs.get(UserPreferences.displayPlaylistsRows);
    final showSeerrRows = GetIt.instance<PluginSyncService>().seerrAvailable;
    final showImdbRows = _isAnyImdbSectionEnabled();
    final showTmdbRows = _isAnyTmdbSectionEnabled();

    final hiddenByFavorites =
        !showFavoritesRows && _isFavoriteSectionType(section.type);
    final hiddenByCollections =
        !showCollectionsRows &&
        ((section.isBuiltin && _isCollectionsSectionType(section.type)) ||
            (section.isPluginDynamic &&
                section.pluginSource == HomeSectionPluginSource.collections));
    final hiddenByServer =
        section.pluginSource == HomeSectionPluginSource.collections &&
        _otherServerName(section) != null &&
        !_prefs.get(UserPreferences.enableMultiServerLibraries);
    final hiddenByGenres =
        !showGenresRows &&
        ((section.isBuiltin && _isGenresSectionType(section.type)) ||
            (section.isPluginDynamic &&
                section.pluginSource == HomeSectionPluginSource.genres));
    final hiddenByPlaylists =
        !showPlaylistsRows &&
        ((section.isBuiltin && _isPlaylistsSectionType(section.type)) ||
            (section.isPluginDynamic &&
                section.pluginSource == HomeSectionPluginSource.playlists));
    final hiddenByStudios =
        section.type == HomeSectionType.studios &&
        !_prefs.get(UserPreferences.displayStudiosRows);
    final hiddenByLiveTv =
        !_serverHasLiveTv &&
        (section.type == HomeSectionType.liveTv ||
            section.type == HomeSectionType.onNow ||
            section.type == HomeSectionType.activeRecordings);
    final hiddenByCalendars =
        (section.type == HomeSectionType.radarrCalendar &&
            !_prefs.get(UserPreferences.enableRadarrCalendar)) ||
        (section.type == HomeSectionType.sonarrCalendar &&
            !_prefs.get(UserPreferences.enableSonarrCalendar));
    final hiddenBySeerr =
        (_isSeerrSectionType(section.type) &&
            (!showSeerrRows ||
                !GetIt.instance<SeerrPreferences>().isSeerrHomeRowEnabled(
                  section.type,
                ))) ||
        // Like Seerr's own rows, a slider row switched off goes back to Seerr
        // Lists, where it's switched on again.
        (isSeerrSliderSection(section) &&
            (!showSeerrRows ||
                !section.enabled ||
                _unshownSeerrSliderIds.contains(section.stableId)));
    final hiddenByImdb =
        _isImdbSectionType(section.type) &&
        (!showImdbRows || !_isImdbRowEnabled(section.type));
    final hiddenByTmdb =
        _isTmdbSectionType(section.type) &&
        (!showTmdbRows || !_isTmdbRowEnabled(section.type));
    final hiddenBySeasonal =
        section.type == HomeSectionType.seasonal &&
        (!GetIt.instance<PluginSyncService>().pluginAvailable ||
            !_prefs.get(UserPreferences.seasonalRowEnabled));

    final showAudioRows = _prefs.get(UserPreferences.displayAudioRows);
    final hiddenByAudio = !showAudioRows && _isAudioSectionType(section.type);

    final showSinceYouWatched = _prefs.get(
      UserPreferences.displaySinceYouWatchedRows,
    );
    final sinceYouWatchedNum = _prefs
        .get(UserPreferences.sinceYouWatchedNumRows)
        .value;
    final showRewatch = _prefs.get(UserPreferences.displayRewatchRow);

    final hiddenBySinceYouWatched =
        _isSinceYouWatchedSectionType(section.type) &&
        (!showSinceYouWatched ||
            _getSinceYouWatchedIndex(section.type) > sinceYouWatchedNum);

    final hiddenByRewatch =
        section.type == HomeSectionType.rewatch && !showRewatch;

    return hiddenByFavorites ||
        hiddenByCollections ||
        hiddenByServer ||
        hiddenByGenres ||
        hiddenByPlaylists ||
        hiddenByStudios ||
        hiddenByLiveTv ||
        hiddenByCalendars ||
        hiddenBySeerr ||
        hiddenByImdb ||
        hiddenByTmdb ||
        hiddenBySeasonal ||
        hiddenByAudio ||
        hiddenBySinceYouWatched ||
        hiddenByRewatch;
  }

  List<int> _visibleSectionIndices() {
    final visible = <int>[];
    final mergeEnabled = _prefs.get(
      UserPreferences.mergeContinueWatchingNextUp,
    );
    final mergeCalendarsEnabled = _prefs.get(
      UserPreferences.mergeRadarrSonarrCalendars,
    );
    for (var i = 0; i < _sections.length; i++) {
      if (_isHiddenByRowVisibilityGates(_sections[i])) continue;
      if (mergeEnabled && _sections[i].type == HomeSectionType.nextUp) {
        continue;
      }
      if (mergeCalendarsEnabled &&
          _sections[i].type == HomeSectionType.sonarrCalendar) {
        continue;
      }
      visible.add(i);
    }
    return visible;
  }

  String _groupLabel(int category, AppLocalizations l10n) => switch (category) {
    2 => l10n.collections,
    3 => l10n.favorites,
    4 => l10n.homeRowsGenresAndStudios,
    5 => l10n.playlists,
    6 => l10n.seerr,
    7 => l10n.homeRowsExternalLists,
    _ => l10n.general,
  };

  FocusNode _groupHeaderNode(int category) => _groupHeaderFocusNodes
      .putIfAbsent(category, () => FocusNode(debugLabel: 'group_$category'));

  /// The Disabled heading, then a header per kind of row with its rows below
  /// while the group is open.
  List<Widget> _buildDisabledGroups(
    List<int> visibleIndices,
    AppLocalizations l10n, {
    required bool hasEnabledRows,
    required Widget Function(BuildContext context, int sectionIndex)
    rowBuilder,
  }) {
    final groups = SplayTreeMap<int, List<int>>();
    for (final i in visibleIndices) {
      if (_sections[i].enabled) continue;
      groups.putIfAbsent(_getSectionCategory(_sections[i]), () => []).add(i);
    }
    if (groups.isEmpty) return const [];
    return [
      SliverToBoxAdapter(child: SettingsSectionHeader(l10n.disabled)),
      for (final MapEntry(key: category, value: rows) in groups.entries) ...[
        SliverToBoxAdapter(
          child: _SectionGroupHeader(
            key: ValueKey('group_$category'),
            focusNode: _groupHeaderNode(category),
            label: _groupLabel(category, l10n),
            count: rows.length,
            open: _openGroups.contains(category),
            autofocus: !hasEnabledRows && category == groups.firstKey(),
            onToggle: () => setState(() {
              if (!_openGroups.remove(category)) _openGroups.add(category);
            }),
          ),
        ),
        if (_openGroups.contains(category))
          SliverPadding(
            padding: const EdgeInsets.only(left: 16),
            sliver: SliverList.builder(
              itemCount: rows.length,
              itemBuilder: (context, i) => rowBuilder(context, rows[i]),
            ),
          ),
      ],
    ];
  }

  @override
  void initState() {
    super.initState();
    final all = _prefs.homeSectionsConfig;
    _mediaBarConfig = all
        .where((s) => s.type == HomeSectionType.mediaBar)
        .firstOrNull;
    _sections = all.where((s) => s.type != HomeSectionType.mediaBar).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    for (var i = 0; i < _sections.length; i++) {
      final toggle = _toggleAuthoritativeEnabled(_sections[i].type);
      if (toggle != null) {
        _sections[i] = _sections[i].copyWith(enabled: toggle);
      }
    }
    final addedBuiltins = _ensureBuiltinSectionsPresent();
    _mergeDiscoveredPluginSections();

    final beforeIds = _sections.map((s) => s.stableId).toList();
    _sortSectionsEnabledAboveDisabled();
    var orderChanged = false;
    for (var i = 0; i < beforeIds.length; i++) {
      if (beforeIds[i] != _sections[i].stableId) {
        orderChanged = true;
        break;
      }
    }

    // _enforceMergeAdjacency reorders _focusNodes in lockstep with _sections,
    // so the nodes must exist before it runs.
    _rebuildFocusNodes();
    _enforceMergeAdjacency();
    if (addedBuiltins || orderChanged) {
      _persistSections(pushSync: false);
    }
    _refreshPluginSections();
    // Empty-state check is driven entirely by _refreshPluginSections;
    // no separate call here avoids a double-spinner flash on open.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
    }
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // The External Lists sub-screen can toggle IMDb rows while this screen is
    // still on the stack. Those toggles are authoritative in the preference, so
    // pull them back into our snapshot before the user can save a stale value
    // over them.
    if (!mounted) return;
    var changed = false;
    for (var i = 0; i < _sections.length; i++) {
      final enabled = _toggleAuthoritativeEnabled(_sections[i].type);
      if (enabled == null) continue;
      if (_sections[i].enabled != enabled) {
        _sections[i] = _sections[i].copyWith(enabled: enabled);
        changed = true;
      }
    }
    if (changed) setState(() {});
  }

  /// The rows whose own toggle outranks the saved layout: the IMDb rows and the
  /// seasonal row, both switched on from the External Lists screen. Null for
  /// every other type.
  bool? _toggleAuthoritativeEnabled(HomeSectionType type) {
    if (_isImdbSectionType(type)) return _isImdbRowEnabled(type);
    if (type == HomeSectionType.seasonal) {
      return _prefs.get(UserPreferences.seasonalRowEnabled);
    }
    return null;
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
          enabled: _toggleAuthoritativeEnabled(type) ?? false,
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
      final collectionsFuture = _fetchCollectionsPerServer();
      final genresFuture = _fetchGenresForHomeSections();
      final playlistsFuture = _fetchPlaylistsForHomeSections();
      final seerrSlidersFuture = _fetchSeerrSlidersForHomeSections();
      final discoveredCollections = await collectionsFuture;
      final discoveredGenres = await genresFuture;
      final discoveredPlaylists = await playlistsFuture;
      final discoveredSeerrSliders = await seerrSlidersFuture;
      if (!mounted) return;
      var changed = false;
      setState(() {
        final mergedPluginSections = _mergeDiscoveredPluginSections();
        final mergedCollectionSections = [
          for (final MapEntry(key: serverId, value: collections)
              in discoveredCollections.entries)
            _mergeCollectionSections(serverId, collections),
        ].contains(true);
        final mergedGenreSections = _mergeGenreSections(discoveredGenres);
        final mergedPlaylistSections = _mergePlaylistSections(
          discoveredPlaylists,
        );
        final mergedSeerrSliderSections = discoveredSeerrSliders != null &&
            _mergeSeerrSliderSections(discoveredSeerrSliders);

        final beforeIds = _sections.map((s) => s.stableId).toList();
        _sortSectionsEnabledAboveDisabled();
        var sortChanged = false;
        for (var i = 0; i < beforeIds.length; i++) {
          if (beforeIds[i] != _sections[i].stableId) {
            sortChanged = true;
            break;
          }
        }

        changed =
            mergedPluginSections ||
            mergedCollectionSections ||
            mergedGenreSections ||
            mergedPlaylistSections ||
            mergedSeerrSliderSections ||
            sortChanged;
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

  bool _mergeDiscoveredPluginSections() {
    return false;
  }

  /// This server's collections and, with multi-server libraries on, every
  /// other signed-in server's, by the address their rows are stamped with. A
  /// server that couldn't be reached is left out, so its rows are kept.
  Future<Map<String, List<_DiscoveredCollectionRow>>>
  _fetchCollectionsPerServer() async {
    final active = GetIt.instance<MediaServerClient>();
    var others = const <ServerUserSession>[];
    try {
      others = [
        for (final session in await GetIt.instance<MultiServerRepository>()
            .getLoggedInServers())
          if (normalizeServerBaseUrl(session.client.baseUrl) !=
              normalizeServerBaseUrl(active.baseUrl))
            session,
      ];
    } catch (_) {}
    _otherServerNames = {
      for (final session in others)
        normalizeServerBaseUrl(session.client.baseUrl): session.server.name,
    };

    final clients = [
      active,
      if (_prefs.get(UserPreferences.enableMultiServerLibraries))
        for (final session in others) session.client,
    ];
    final found = await Future.wait(
      clients.map(_fetchCollectionsForHomeSections),
    );
    return {
      for (var i = 0; i < clients.length; i++) clients[i].baseUrl: ?found[i],
    };
  }

  Future<List<_DiscoveredCollectionRow>?> _fetchCollectionsForHomeSections(
    MediaServerClient client,
  ) async {
    final showCollectionsRows = _prefs.get(
      UserPreferences.displayCollectionsRows,
    );
    if (!showCollectionsRows) return const <_DiscoveredCollectionRow>[];

    try {
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
              .where(
                (item) =>
                    (item['Id']?.toString() ?? '').isNotEmpty &&
                    (item['Name']?.toString() ?? '').isNotEmpty,
              )
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
      return null;
    }
  }

  bool _mergeCollectionSections(
    String serverId,
    List<_DiscoveredCollectionRow> discovered,
  ) {
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where(
        (c) =>
            c.isPluginDynamic &&
            c.pluginSource == HomeSectionPluginSource.collections &&
            c.serverId == serverId,
      ))
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
        enabled:
            existing['pluginDynamic:collections:$serverId:collection:${collection.id}']
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
    _sections.removeWhere(
      (s) =>
          s.isPluginDynamic &&
          s.pluginSource == HomeSectionPluginSource.collections &&
          s.serverId == serverId &&
          !freshIds.contains(s.stableId),
    );
    if (_sections.length != before) changed = true;

    return changed;
  }

  Future<List<_DiscoveredGenreRow>> _fetchGenresForHomeSections() async {
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    if (!showGenresRows) return const <_DiscoveredGenreRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      final includeItemTypes = _prefs
          .get(UserPreferences.genresRowItemFilter)
          .includeItemTypes;
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
              .where(
                (item) =>
                    (item['Id']?.toString() ?? '').isNotEmpty &&
                    (item['Name']?.toString() ?? '').isNotEmpty,
              )
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
              .where(
                (item) =>
                    (item['Id']?.toString() ?? '').isNotEmpty &&
                    (item['Name']?.toString() ?? '').isNotEmpty,
              )
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
      for (final cfg in _sections.where(
        (c) =>
            c.isPluginDynamic &&
            c.pluginSource == HomeSectionPluginSource.playlists &&
            c.serverId == serverId,
      ))
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
        enabled:
            existing['pluginDynamic:playlists:$serverId:playlist:${playlist.id}']
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
    _sections.removeWhere(
      (s) =>
          s.isPluginDynamic &&
          s.pluginSource == HomeSectionPluginSource.playlists &&
          s.serverId == serverId &&
          !freshIds.contains(s.stableId),
    );
    if (_sections.length != before) changed = true;

    return changed;
  }

  bool _mergeGenreSections(List<_DiscoveredGenreRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where(
        (c) =>
            c.isPluginDynamic &&
            c.pluginSource == HomeSectionPluginSource.genres &&
            c.serverId == serverId,
      ))
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
    _sections.removeWhere(
      (s) =>
          s.isPluginDynamic &&
          s.pluginSource == HomeSectionPluginSource.genres &&
          s.serverId == serverId &&
          !freshIds.contains(s.stableId),
    );
    if (_sections.length != before) changed = true;

    return changed;
  }

  /// Every slider on Seerr's discover page. Null when Seerr can't be reached,
  /// so a failed read leaves the rows in place instead of reading as every
  /// slider having been deleted.
  Future<List<SeerrDiscoverSlider>?> _fetchSeerrSlidersForHomeSections() async {
    if (!GetIt.instance<PluginSyncService>().seerrAvailable) return null;
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      if (!repo.isAvailable) return null;
      return await repo.getDiscoverSliders(force: true);
    } catch (_) {
      return null;
    }
  }

  /// Keeps the slider rows put on Home from Seerr Lists in step with Seerr.
  /// Sliders are picked there, so none are added here.
  bool _mergeSeerrSliderSections(List<SeerrDiscoverSlider> sliders) {
    final serverId = GetIt.instance<MediaServerClient>().baseUrl;
    var changed = false;

    // Another server's Seerr may number its sliders the same way, so only
    // this server's rows are matched against the list.
    bool isOwnSlider(HomeSectionConfig s) =>
        isSeerrSliderSection(s) && s.serverId == serverId;

    for (var i = 0; i < _sections.length; i++) {
      if (!isOwnSlider(_sections[i])) continue;
      final slider = findSeerrSliderFor(_sections[i], sliders);
      if (slider == null) continue;
      if (_sections[i].pluginDisplayText != slider.title) {
        _sections[i] = _sections[i].copyWith(pluginDisplayText: slider.title);
        changed = true;
      }
    }

    // Only a slider Seerr no longer has is dropped. One it still has but this
    // client can't show, switched off for now or of a type a newer client
    // knows, keeps its entry and state and is just left out of the list.
    final before = _sections.length;
    _sections.removeWhere(
      (s) => isOwnSlider(s) && findSeerrSliderFor(s, sliders) == null,
    );
    if (_sections.length != before) changed = true;
    _unshownSeerrSliderIds = {
      for (final s in _sections.where(isOwnSlider))
        if (findSeerrSliderFor(s, sliders)?.isSupported == false) s.stableId,
    };

    return changed;
  }

  void _rebuildFocusNodes() {
    final activeIds = _sections.map((s) => s.stableId).toSet();

    final inactiveIds = _focusNodesByStableId.keys
        .where((id) => !activeIds.contains(id))
        .toList();
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
    routeLifecycleObserver.unsubscribe(this);
    for (final n in _focusNodesByStableId.values) {
      n.dispose();
    }
    _focusNodesByStableId.clear();
    _focusNodes.clear();
    for (final n in _groupHeaderFocusNodes.values) {
      n.dispose();
    }
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

  void _syncIndividualPreferences() {
    Preference<bool>? mapToPref(HomeSectionType type) {
      final tmdb = UserPreferences.tmdbSectionEnabled[type];
      if (tmdb != null) return tmdb;
      return switch (type) {
        HomeSectionType.imdbTop250Movies =>
          UserPreferences.imdbTop250MoviesEnabled,
        HomeSectionType.imdbTop250TvShows =>
          UserPreferences.imdbTop250TvShowsEnabled,
        HomeSectionType.imdbMostPopularMovies =>
          UserPreferences.imdbMostPopularMoviesEnabled,
        HomeSectionType.imdbMostPopularTvShows =>
          UserPreferences.imdbMostPopularTvShowsEnabled,
        HomeSectionType.imdbLowestRatedMovies =>
          UserPreferences.imdbLowestRatedMoviesEnabled,
        HomeSectionType.imdbTopEnglishMovies =>
          UserPreferences.imdbTopEnglishMoviesEnabled,
        HomeSectionType.rewatch => UserPreferences.displayRewatchRow,
        HomeSectionType.seasonal => UserPreferences.seasonalRowEnabled,
        HomeSectionType.sinceYouWatched1 =>
          UserPreferences.sinceYouWatched1Enabled,
        HomeSectionType.sinceYouWatched2 =>
          UserPreferences.sinceYouWatched2Enabled,
        HomeSectionType.sinceYouWatched3 =>
          UserPreferences.sinceYouWatched3Enabled,
        HomeSectionType.sinceYouWatched4 =>
          UserPreferences.sinceYouWatched4Enabled,
        HomeSectionType.sinceYouWatched5 =>
          UserPreferences.sinceYouWatched5Enabled,
        _ => null,
      };
    }

    for (final section in _sections) {
      final prefKey = mapToPref(section.type);
      if (prefKey != null && _prefs.get(prefKey) != section.enabled) {
        _prefs.set(prefKey, section.enabled);
      }
    }
  }

  void _save() {
    _syncIndividualPreferences();
    _persistSections(pushSync: true);
  }

  void _focusSectionAndEnsureVisible(int index) {
    focusItemAndEnsureVisible(
      isMounted: () => mounted,
      focusNodes: _focusNodes,
      index: index,
    );
  }

  void _sortSectionsEnabledAboveDisabled() {
    _sections = _sections.sortedEnabledAboveDisabled((s) => s.enabled);
  }

  void _toggleSection(int index, bool enabled) {
    final toggled = _sections[index];
    final toggledStableId = toggled.stableId;
    final category = _getSectionCategory(toggled);
    // The rows the toggled one leaves: the Enabled list, or its disabled group.
    final leaving = [
      for (final i in _visibleSectionIndices())
        if (_sections[i].enabled == toggled.enabled &&
            (toggled.enabled || _getSectionCategory(_sections[i]) == category))
          _sections[i].stableId,
    ];
    final at = leaving.indexOf(toggledStableId);
    if (!enabled && _isSeerrSectionType(toggled.type)) {
      _disableSeerrHomeRow(toggled.type);
    }

    final nodeMap = <String, FocusNode>{};
    for (var i = 0; i < _sections.length; i++) {
      nodeMap[_sections[i].stableId] = _focusNodes[i];
    }

    setState(() {
      _sections[index] = _sections[index].copyWith(enabled: enabled);
      _sortSectionsEnabledAboveDisabled();
      _enforceMergeAdjacency();

      final newNodes = <FocusNode>[];
      for (final section in _sections) {
        final node = nodeMap[section.stableId];
        if (node != null) {
          newNodes.add(node);
        } else {
          newNodes.add(FocusNode(debugLabel: 'home_section_new'));
        }
      }
      _focusNodes.clear();
      _focusNodes.addAll(newNodes);
    });

    _save();

    // Focus the row that slides into the toggled one's place, so ticking down
    // a group or unticking down the Enabled list keeps going. Inner rows of a
    // merged tile aren't listed and keep their focus.
    if (at < 0) return;
    final neighborId = at + 1 < leaving.length
        ? leaving[at + 1]
        : (at > 0 ? leaving[at - 1] : null);
    if (neighborId != null) {
      _focusSectionAndEnsureVisible(
        _sections.indexWhere((s) => s.stableId == neighborId),
      );
    } else if (enabled) {
      _focusSectionAndEnsureVisible(
        _sections.indexWhere((s) => s.stableId == toggledStableId),
      );
    } else {
      focusItemAndEnsureVisible(
        isMounted: () => mounted,
        focusNodes: [_groupHeaderNode(category)],
        index: 0,
      );
    }
  }

  /// Mutates [_sections] and [_focusNodes] in place. Callers own the surrounding
  /// setState and persistence so this can run inside another setState without
  /// re-entrancy or double saving.
  void _enforceMergeAdjacency() {
    final merge = _prefs.get(UserPreferences.mergeContinueWatchingNextUp);
    if (merge) {
      final resumeIdx = _sections.indexWhere(
        (s) => s.type == HomeSectionType.resume,
      );
      final nextUpIdx = _sections.indexWhere(
        (s) => s.type == HomeSectionType.nextUp,
      );
      if (resumeIdx >= 0 &&
          nextUpIdx >= 0 &&
          (resumeIdx - nextUpIdx).abs() != 1) {
        final nextUpItem = _sections.removeAt(nextUpIdx);
        final nextUpNode = _focusNodes.removeAt(nextUpIdx);

        final newResumeIdx = _sections.indexWhere(
          (s) => s.type == HomeSectionType.resume,
        );
        _sections.insert(newResumeIdx + 1, nextUpItem);
        _focusNodes.insert(newResumeIdx + 1, nextUpNode);
      }
    }

    final mergeCalendars = _prefs.get(
      UserPreferences.mergeRadarrSonarrCalendars,
    );
    if (mergeCalendars) {
      final radarrIdx = _sections.indexWhere(
        (s) => s.type == HomeSectionType.radarrCalendar,
      );
      final sonarrIdx = _sections.indexWhere(
        (s) => s.type == HomeSectionType.sonarrCalendar,
      );
      if (radarrIdx >= 0 &&
          sonarrIdx >= 0 &&
          (radarrIdx - sonarrIdx).abs() != 1) {
        final sonarrItem = _sections.removeAt(sonarrIdx);
        final sonarrNode = _focusNodes.removeAt(sonarrIdx);

        final newRadarrIdx = _sections.indexWhere(
          (s) => s.type == HomeSectionType.radarrCalendar,
        );
        _sections.insert(newRadarrIdx + 1, sonarrItem);
        _focusNodes.insert(newRadarrIdx + 1, sonarrNode);
      }
    }
  }

  void _moveSection(int fromIndex, int toIndex) {
    if (fromIndex < 0 || fromIndex >= _sections.length) return;
    if (toIndex < 0 || toIndex > _sections.length) return;
    if (fromIndex == toIndex) return;

    final merge = _prefs.get(UserPreferences.mergeContinueWatchingNextUp);
    final resumeIdx = _sections.indexWhere(
      (s) => s.type == HomeSectionType.resume,
    );
    final nextUpIdx = _sections.indexWhere(
      (s) => s.type == HomeSectionType.nextUp,
    );
    final isMergeActive =
        merge &&
        resumeIdx >= 0 &&
        nextUpIdx >= 0 &&
        (resumeIdx - nextUpIdx).abs() == 1;

    final mergeCalendars = _prefs.get(
      UserPreferences.mergeRadarrSonarrCalendars,
    );
    final radarrIdx = _sections.indexWhere(
      (s) => s.type == HomeSectionType.radarrCalendar,
    );
    final sonarrIdx = _sections.indexWhere(
      (s) => s.type == HomeSectionType.sonarrCalendar,
    );
    final isMergeCalendarsActive =
        mergeCalendars &&
        radarrIdx >= 0 &&
        sonarrIdx >= 0 &&
        (radarrIdx - sonarrIdx).abs() == 1;

    setState(() {
      if (isMergeActive && (fromIndex == resumeIdx || fromIndex == nextUpIdx)) {
        final first = resumeIdx < nextUpIdx ? resumeIdx : nextUpIdx;
        final item1 = _sections.removeAt(first);
        final node1 = _focusNodes.removeAt(first);
        final item2 = _sections.removeAt(first);
        final node2 = _focusNodes.removeAt(first);

        var targetIndex = toIndex;
        if (targetIndex > first) {
          targetIndex -= 1;
        }

        _sections.insert(targetIndex, item1);
        _focusNodes.insert(targetIndex, node1);
        _sections.insert(targetIndex + 1, item2);
        _focusNodes.insert(targetIndex + 1, node2);
      } else if (isMergeCalendarsActive &&
          (fromIndex == radarrIdx || fromIndex == sonarrIdx)) {
        final first = radarrIdx < sonarrIdx ? radarrIdx : sonarrIdx;
        final item1 = _sections.removeAt(first);
        final node1 = _focusNodes.removeAt(first);
        final item2 = _sections.removeAt(first);
        final node2 = _focusNodes.removeAt(first);

        var targetIndex = toIndex;
        if (targetIndex > first) {
          targetIndex -= 1;
        }

        _sections.insert(targetIndex, item1);
        _focusNodes.insert(targetIndex, node1);
        _sections.insert(targetIndex + 1, item2);
        _focusNodes.insert(targetIndex + 1, node2);
      } else {
        var targetIndex = toIndex;
        if (isMergeActive) {
          final first = resumeIdx < nextUpIdx ? resumeIdx : nextUpIdx;
          if (targetIndex == first + 1) {
            targetIndex = first + 2;
          }
        }
        if (isMergeCalendarsActive) {
          final first = radarrIdx < sonarrIdx ? radarrIdx : sonarrIdx;
          if (targetIndex == first + 1) {
            targetIndex = first + 2;
          }
        }

        final item = _sections.removeAt(fromIndex);
        final node = _focusNodes.removeAt(fromIndex);
        _sections.insert(targetIndex, item);
        _focusNodes.insert(targetIndex, node);
      }
    });
    _save();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var focusIndex = toIndex;
      if (isMergeActive && (fromIndex == resumeIdx || fromIndex == nextUpIdx)) {
        final first = resumeIdx < nextUpIdx ? resumeIdx : nextUpIdx;
        var targetIndex = toIndex;
        if (targetIndex > first) {
          targetIndex -= 1;
        }
        focusIndex = targetIndex;
      } else if (isMergeCalendarsActive &&
          (fromIndex == radarrIdx || fromIndex == sonarrIdx)) {
        final first = radarrIdx < sonarrIdx ? radarrIdx : sonarrIdx;
        var targetIndex = toIndex;
        if (targetIndex > first) {
          targetIndex -= 1;
        }
        focusIndex = targetIndex;
      }
      if (focusIndex < _focusNodes.length) {
        _focusSectionAndEnsureVisible(focusIndex);
      }
    });
  }

  String _labelFor(HomeSectionConfig cfg, AppLocalizations l10n) {
    if (cfg.isPluginDynamic) {
      return cfg.pluginDisplayText?.isNotEmpty == true
          ? cfg.pluginDisplayText!
          : (cfg.pluginSection ?? l10n.none);
    }
    return homeSectionTypeLabel(cfg.type, l10n);
  }

  Widget _buildLoadingOverlay(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: _isLoading ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        onEnd: () {
          if (!_isLoading && mounted) {
            setState(() {
              _showOverlay = false;
            });
          }
        },
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: SkeletonShimmer(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 8, bottom: 32),
              children: [
                for (int i = 0; i < 9; i++)
                  Padding(
                    padding: _kHomeSectionTileOuterPadding,
                    child: Container(
                      height: 64,
                      padding: _kHomeSectionTileContentPadding,
                      decoration: _homeSectionTileDecoration(
                        context,
                        focused: false,
                      ),
                      child: Row(
                        children: [
                          const SkeletonBox(
                            width: 32,
                            height: 32,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SkeletonBox(
                                  width: 120.0 + ((i * 17) % 80),
                                  height: 15,
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                ),
                                if (i % 3 != 0) ...[
                                  const SizedBox(height: 6),
                                  SkeletonBox(
                                    width: 80.0 + ((i * 13) % 50),
                                    height: 11,
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SkeletonBox(
                            width: 28,
                            height: 28,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          const SizedBox(width: 8),
                          const SkeletonBox(
                            width: 28,
                            height: 28,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          const SizedBox(width: 12),
                          const SkeletonBox(
                            width: 44,
                            height: 24,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
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
          Text(l10n.homeRows),
          actions: [
            IconButton(
              icon: const Icon(Icons.restore),
              tooltip: l10n.resetToDefaults,
              onPressed: () {
                setState(() {
                  _sections = HomeSectionConfig.defaults();
                  _sortSectionsEnabledAboveDisabled();
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
                if (_showOverlay) _buildLoadingOverlay(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReorderableList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    final enabledIndices = [
      for (final i in visibleIndices)
        if (_sections[i].enabled) i,
    ];
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SettingsSectionHeader(l10n.enabled)),
        SliverReorderableList(
          itemCount: enabledIndices.length,
          onReorderItem: (oldIndex, newIndex) =>
              _reorderEnabled(enabledIndices, oldIndex, newIndex),
          itemBuilder: (context, index) {
            final row = _buildTouchRow(
              context,
              l10n,
              enabledIndices[index],
              dragIndex: index,
            );
            return PlatformDetection.useMobileUi
                ? ReorderableDelayedDragStartListener(
                    key: row.key,
                    index: index,
                    child: row,
                  )
                : row;
          },
        ),
        ..._buildDisabledGroups(
          visibleIndices,
          l10n,
          hasEnabledRows: enabledIndices.isNotEmpty,
          rowBuilder: (context, sectionIndex) =>
              _buildTouchRow(context, l10n, sectionIndex),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16 + MediaQuery.paddingOf(context).bottom),
        ),
      ],
    );
  }

  /// Puts the enabled row at [oldIndex] of [enabledIndices] beside the one at
  /// [newIndex]. A merged tile's hidden partner follows its anchor through
  /// [_enforceMergeAdjacency].
  void _reorderEnabled(List<int> enabledIndices, int oldIndex, int newIndex) {
    if (oldIndex == newIndex) return;
    final targetId = _sections[enabledIndices[newIndex]].stableId;
    setState(() {
      final moved = _sections.removeAt(enabledIndices[oldIndex]);
      final target = _sections.indexWhere((s) => s.stableId == targetId);
      _sections.insert(newIndex > oldIndex ? target + 1 : target, moved);
      _rebuildFocusNodes();
      _enforceMergeAdjacency();
    });
    _save();
  }

  /// A mouse drags a row by its handle straight away. On a phone the whole row
  /// takes a long press instead, so a swipe over the handle still scrolls.
  Widget _dragHandle(int index, Widget icon) => PlatformDetection.useMobileUi
      ? icon
      : ReorderableDragStartListener(index: index, child: icon);

  Widget _buildTouchRow(
    BuildContext context,
    AppLocalizations l10n,
    int sectionIndex, {
    int? dragIndex,
  }) {
    final section = _sections[sectionIndex];
    final isEmpty = _emptySectionIds.contains(section.stableId);

    final mergeEnabled = _prefs.get(
      UserPreferences.mergeContinueWatchingNextUp,
    );
    final isMergedResume =
        mergeEnabled && section.type == HomeSectionType.resume;

    if (isMergedResume) {
      final nextUpIndex = _sections.indexWhere(
        (s) => s.type == HomeSectionType.nextUp,
      );
      if (nextUpIndex >= 0) {
        final nextUpSection = _sections[nextUpIndex];
        final isNextUpEmpty = _emptySectionIds.contains(
          nextUpSection.stableId,
        );

        return Padding(
          key: const ValueKey('merged_resume_nextup'),
          padding: _kHomeSectionTileOuterPadding,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
              borderRadius: AppRadius.circular(_kHomeSectionTileRadius),
              border: Border.all(
                color: const Color(0xFF00F0FF), // Neon cyan border
                width: 1.5,
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1. Continue Watching Tile
                        Opacity(
                          opacity: isEmpty ? 0.45 : 1.0,
                          child: ListTile(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                              right: 8,
                              top: 4,
                              bottom: 4,
                            ),
                            minLeadingWidth: 44,
                            horizontalTitleGap: 14,
                            leading: buildSettingsLeadingIconShell(
                              context,
                              icon: Icon(
                                (section.enabled && !isEmpty)
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              focused: false,
                              iconColor: AppColorScheme.onSurface
                                  .withValues(alpha: 0.78),
                            ),
                            title: Text(
                              _labelFor(section, l10n),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: kCleanSettingsFontFamily,
                              ),
                            ),
                            onTap: isEmpty
                                ? null
                                : () => _toggleSection(
                                    sectionIndex,
                                    !section.enabled,
                                  ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Color(0xFF00F0FF),
                          indent: 16,
                          endIndent: 16,
                        ),
                        // 2. Next Up Tile
                        Opacity(
                          opacity: isNextUpEmpty ? 0.45 : 1.0,
                          child: ListTile(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                              right: 8,
                              top: 4,
                              bottom: 4,
                            ),
                            minLeadingWidth: 44,
                            horizontalTitleGap: 14,
                            leading: buildSettingsLeadingIconShell(
                              context,
                              icon: Icon(
                                (nextUpSection.enabled && !isNextUpEmpty)
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              focused: false,
                              iconColor: AppColorScheme.onSurface
                                  .withValues(alpha: 0.78),
                            ),
                            title: Text(
                              _labelFor(nextUpSection, l10n),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: kCleanSettingsFontFamily,
                              ),
                            ),
                            onTap: isNextUpEmpty
                                ? null
                                : () => _toggleSection(
                                    nextUpIndex,
                                    !nextUpSection.enabled,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Centered unified drag handle
                  if (dragIndex != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _dragHandle(
                        dragIndex,
                        const Icon(
                          Icons.drag_handle,
                          color: Color(0xFF00F0FF), // Neon cyan handle
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    }

    final mergeCalendarsEnabled = _prefs.get(
      UserPreferences.mergeRadarrSonarrCalendars,
    );
    final isMergedCalendars =
        mergeCalendarsEnabled &&
        section.type == HomeSectionType.radarrCalendar;

    if (isMergedCalendars) {
      final sonarrIndex = _sections.indexWhere(
        (s) => s.type == HomeSectionType.sonarrCalendar,
      );
      if (sonarrIndex >= 0) {
        final sonarrSection = _sections[sonarrIndex];
        final isSonarrEmpty = _emptySectionIds.contains(
          sonarrSection.stableId,
        );

        return Padding(
          key: const ValueKey('merged_radarr_sonarr_calendars'),
          padding: _kHomeSectionTileOuterPadding,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
              borderRadius: AppRadius.circular(_kHomeSectionTileRadius),
              border: Border.all(
                color: const Color(0xFF00F0FF), // Neon cyan border
                width: 1.5,
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1. Radarr Calendar Tile
                        Opacity(
                          opacity: isEmpty ? 0.45 : 1.0,
                          child: ListTile(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                              right: 8,
                              top: 4,
                              bottom: 4,
                            ),
                            minLeadingWidth: 44,
                            horizontalTitleGap: 14,
                            leading: buildSettingsLeadingIconShell(
                              context,
                              icon: Icon(
                                (section.enabled && !isEmpty)
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              focused: false,
                              iconColor: AppColorScheme.onSurface
                                  .withValues(alpha: 0.78),
                            ),
                            title: Text(
                              _labelFor(section, l10n),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: kCleanSettingsFontFamily,
                              ),
                            ),
                            onTap: isEmpty
                                ? null
                                : () => _toggleSection(
                                    sectionIndex,
                                    !section.enabled,
                                  ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Color(0xFF00F0FF),
                          indent: 16,
                          endIndent: 16,
                        ),
                        // 2. Sonarr Calendar Tile
                        Opacity(
                          opacity: isSonarrEmpty ? 0.45 : 1.0,
                          child: ListTile(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 16,
                              right: 8,
                              top: 4,
                              bottom: 4,
                            ),
                            minLeadingWidth: 44,
                            horizontalTitleGap: 14,
                            leading: buildSettingsLeadingIconShell(
                              context,
                              icon: Icon(
                                (sonarrSection.enabled && !isSonarrEmpty)
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              focused: false,
                              iconColor: AppColorScheme.onSurface
                                  .withValues(alpha: 0.78),
                            ),
                            title: Text(
                              _labelFor(sonarrSection, l10n),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: kCleanSettingsFontFamily,
                              ),
                            ),
                            onTap: isSonarrEmpty
                                ? null
                                : () => _toggleSection(
                                    sonarrIndex,
                                    !sonarrSection.enabled,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Centered unified drag handle
                  if (dragIndex != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _dragHandle(
                        dragIndex,
                        const Icon(
                          Icons.drag_handle,
                          color: Color(0xFF00F0FF), // Neon cyan handle
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return Padding(
      key: ValueKey('${section.stableId}:${section.enabled}'),
      padding: _kHomeSectionTileOuterPadding,
      child: Opacity(
        opacity: isEmpty ? 0.45 : 1.0,
        child: Container(
          decoration: _homeSectionTileDecoration(
            context,
            focused: false,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: ListTile(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              contentPadding: _kHomeSectionTileContentPadding,
              minLeadingWidth: 44,
              horizontalTitleGap: 14,
              leading: buildSettingsLeadingIconShell(
                context,
                icon: Icon(
                  (section.enabled && !isEmpty)
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
                focused: false,
                iconColor: AppColorScheme.onSurface.withValues(
                  alpha: 0.78,
                ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        borderRadius: AppRadius.circular(4),
                        border: Border.all(
                          color: Colors.red.withValues(alpha: 0.5),
                          width: 0.8,
                        ),
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
                        color: AppColorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    )
                  : (_isAudioSectionType(section.type)
                        ? Text(
                            'Audio row',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: kCleanSettingsFontFamily,
                              color: AppColorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          )
                        : (_isSeerrSectionType(section.type)
                              ? Text(
                                  'Seerr Discovery Rows',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: kCleanSettingsFontFamily,
                                    color: AppColorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                )
                              : (_isImdbSectionType(section.type)
                                    ? Text(
                                        'IMDb List',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily:
                                              kCleanSettingsFontFamily,
                                          color: AppColorScheme.onSurface
                                              .withValues(alpha: 0.7),
                                        ),
                                      )
                                    : (_isTmdbSectionType(section.type)
                                          ? Text(
                                              'TMDB Lists',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    kCleanSettingsFontFamily,
                                                color: AppColorScheme
                                                    .onSurface
                                                    .withValues(
                                                      alpha: 0.7,
                                                    ),
                                              ),
                                            )
                                          : null)))),
              onTap: isEmpty
                  ? null
                  : () => _toggleSection(sectionIndex, !section.enabled),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (dragIndex != null)
                    _dragHandle(
                      dragIndex,
                      Icon(
                        Icons.drag_handle,
                        color: AppColorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTvList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    final enabledIndices = [
      for (final i in visibleIndices)
        if (_sections[i].enabled) i,
    ];
    final items = [for (final i in enabledIndices) _sections[i]];

    // [position] is the row's place in the Enabled list. Disabled rows have
    // none, so they don't move and don't take the first focus.
    Widget buildRow(BuildContext context, int sectionIndex, {int? position}) {
      final section = _sections[sectionIndex];
      final isEmpty = _emptySectionIds.contains(section.stableId);
      final isFirst = position == null || position == 0;
      final isLast = position == null || position == enabledIndices.length - 1;
      final autofocus = position == 0;
      final mergeEnabled = _prefs.get(
        UserPreferences.mergeContinueWatchingNextUp,
      );
      final mergeCalendarsEnabled = _prefs.get(
        UserPreferences.mergeRadarrSonarrCalendars,
      );

      if (mergeEnabled && section.type == HomeSectionType.resume) {
        final nextUpIndex = _sections.indexWhere(
          (s) => s.type == HomeSectionType.nextUp,
        );
        if (nextUpIndex >= 0) {
          return _buildMergedTvTile(
            context,
            sectionIndex,
            nextUpIndex,
            l10n,
            isFirst,
            isLast,
            autofocus: autofocus,
          );
        }
      }

      if (mergeCalendarsEnabled &&
          section.type == HomeSectionType.radarrCalendar) {
        final sonarrIndex = _sections.indexWhere(
          (s) => s.type == HomeSectionType.sonarrCalendar,
        );
        if (sonarrIndex >= 0) {
          return _buildMergedTvTile(
            context,
            sectionIndex,
            sonarrIndex,
            l10n,
            isFirst,
            isLast,
            autofocus: autofocus,
          );
        }
      }

      return _HomeSectionTile(
        key: ValueKey('${section.stableId}:${section.enabled}'),
        focusNode: _focusNodes[sectionIndex],
        type: section.type,
        autofocus: autofocus,
        label: _labelFor(section, l10n),
        subtitle: section.isPluginDynamic
            ? _pluginSubtitle(section)
            : (_isAudioSectionType(section.type)
                  ? 'Audio row'
                  : (_isSeerrSectionType(section.type)
                        ? 'Seerr Discovery Rows'
                        : (_isImdbSectionType(section.type)
                              ? 'IMDb List'
                              : (_isTmdbSectionType(section.type)
                                    ? 'TMDB Lists'
                                    : null)))),
        enabled: section.enabled,
        isFirst: isFirst,
        isLast: isLast,
        isEmpty: isEmpty,
        onToggle: (enabled) => _toggleSection(sectionIndex, enabled),
        onMoveUp: () {
          if (isFirst) return;
          _moveSection(sectionIndex, enabledIndices[position - 1]);
        },
        onMoveDown: () {
          if (isLast) return;
          _moveSection(sectionIndex, enabledIndices[position + 1]);
        },
      );
    }

    return CustomScrollView(
      cacheExtent: 3000.0,
      slivers: [
        SliverToBoxAdapter(child: SettingsSectionHeader(l10n.enabled)),
        ReorderableAnimatedListImpl<HomeSectionConfig>(
          items: items,
          scrollDirection: Axis.vertical,
          isSameItem: (a, b) => a.stableId == b.stableId,
          enableSwap: true,
          enterTransition: [FadeIn(), SizeAnimation()],
          exitTransition: [FadeIn(), SizeAnimation()],
          itemBuilder: (context, index) =>
              buildRow(context, enabledIndices[index], position: index),
        ),
        ..._buildDisabledGroups(
          visibleIndices,
          l10n,
          hasEnabledRows: enabledIndices.isNotEmpty,
          rowBuilder: buildRow,
        ),
      ],
    );
  }

  Widget _buildMergedTvTile(
    BuildContext context,
    int resumeSectionIndex,
    int nextUpSectionIndex,
    AppLocalizations l10n,
    bool isFirst,
    bool isLast, {
    required bool autofocus,
  }) {
    final resumeSection = _sections[resumeSectionIndex];
    final nextUpSection = _sections[nextUpSectionIndex];
    final isResumeEmpty = _emptySectionIds.contains(resumeSection.stableId);
    final isNextUpEmpty = _emptySectionIds.contains(nextUpSection.stableId);

    final resumeNode = _focusNodes[resumeSectionIndex];
    final nextUpNode = _focusNodes[nextUpSectionIndex];

    return AnimatedBuilder(
      key: ValueKey('${resumeSection.stableId}:${resumeSection.enabled}'),
      animation: Listenable.merge([resumeNode, nextUpNode]),
      builder: (context, _) {
        final resumeFocused = resumeNode.hasFocus;
        final nextUpFocused = nextUpNode.hasFocus;
        final anyFocused = resumeFocused || nextUpFocused;

        final colorScheme = Theme.of(context).colorScheme;
        final borderTokens = ThemeRegistry.active.borders;
        final baseBorder = borderTokens.cardBorder.color;
        final unfocusedBorderColor = baseBorder.a == 0
            ? AppColorScheme.onSurface.withValues(alpha: 0.16)
            : baseBorder.withValues(alpha: 0.55);

        final borderColor = anyFocused
            ? AppColorScheme.accent.withValues(alpha: 0.72)
            : unfocusedBorderColor;
        final borderWidth = 1.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
              borderRadius: AppRadius.circular(_kHomeSectionTileRadius),
              border: Border.all(color: borderColor, width: borderWidth),
              boxShadow: anyFocused
                  ? [
                      BoxShadow(
                        color: AppColorScheme.accent.withValues(alpha: 0.22),
                        blurRadius: 14,
                        spreadRadius: 0.5,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTvTileInner(
                  context,
                  focusNode: resumeNode,
                  section: resumeSection,
                  label: _labelFor(resumeSection, l10n),
                  focused: resumeFocused,
                  isEmpty: isResumeEmpty,
                  isFirst: isFirst,
                  isLast: isLast,
                  autofocus: autofocus,
                  showArrows:
                      resumeFocused || (!resumeFocused && !nextUpFocused),
                  onToggle: (enabled) =>
                      _toggleSection(resumeSectionIndex, enabled),
                  onMoveUp: () {
                    if (isFirst) return;
                    final visibleIndices = _visibleSectionIndices();
                    final currentIdx = visibleIndices.indexOf(
                      resumeSectionIndex,
                    );
                    _moveSection(
                      resumeSectionIndex,
                      visibleIndices[currentIdx - 1],
                    );
                  },
                  onMoveDown: () {
                    if (isLast) return;
                    final visibleIndices = _visibleSectionIndices();
                    final currentIdx = visibleIndices.indexOf(
                      resumeSectionIndex,
                    );
                    if (currentIdx >= visibleIndices.length - 1) return;
                    _moveSection(
                      resumeSectionIndex,
                      visibleIndices[currentIdx + 1],
                    );
                  },
                ),
                Divider(
                  height: 1,
                  color: const Color(0xFF00F0FF).withValues(alpha: 0.4),
                  indent: 16,
                  endIndent: 16,
                ),
                _buildTvTileInner(
                  context,
                  focusNode: nextUpNode,
                  section: nextUpSection,
                  label: _labelFor(nextUpSection, l10n),
                  focused: nextUpFocused,
                  isEmpty: isNextUpEmpty,
                  isFirst: isFirst,
                  isLast: isLast,
                  showArrows: nextUpFocused,
                  onToggle: (enabled) =>
                      _toggleSection(nextUpSectionIndex, enabled),
                  onMoveUp: () {
                    if (isFirst) return;
                    final visibleIndices = _visibleSectionIndices();
                    final currentIdx = visibleIndices.indexOf(
                      resumeSectionIndex,
                    );
                    _moveSection(
                      resumeSectionIndex,
                      visibleIndices[currentIdx - 1],
                    );
                  },
                  onMoveDown: () {
                    if (isLast) return;
                    final visibleIndices = _visibleSectionIndices();
                    final currentIdx = visibleIndices.indexOf(
                      resumeSectionIndex,
                    );
                    if (currentIdx >= visibleIndices.length - 1) return;
                    _moveSection(
                      resumeSectionIndex,
                      visibleIndices[currentIdx + 1],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTvTileInner(
    BuildContext context, {
    required FocusNode focusNode,
    required HomeSectionConfig section,
    required String label,
    required bool focused,
    required bool isEmpty,
    required bool isFirst,
    required bool isLast,
    required VoidCallback onMoveUp,
    required VoidCallback onMoveDown,
    required ValueChanged<bool> onToggle,
    bool autofocus = false,
    bool showArrows = true,
  }) {
    final l10n = AppLocalizations.of(context);
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: true,
      onFocusChange: (f) {
        if (f) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!focusNode.hasFocus) return;
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
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          onMoveDown();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          if (!isEmpty) {
            onToggle(!section.enabled);
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Opacity(
        opacity: isEmpty ? 0.45 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: focused ? AppColorScheme.onSurface : Colors.transparent,
            borderRadius: AppRadius.circular(12),
          ),
          child: ListTile(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            contentPadding: _kHomeSectionTileContentPadding,
            minLeadingWidth: 44,
            horizontalTitleGap: 14,
            leading: buildSettingsLeadingIconShell(
              context,
              icon: Icon(
                (section.enabled && !isEmpty)
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              focused: focused,
              iconColor: focused
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(alpha: 0.78),
            ),
            title: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: kCleanSettingsFontFamily,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.87)
                        : AppColorScheme.onSurface,
                  ),
                ),
                if (isEmpty) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.15),
                      borderRadius: AppRadius.circular(4),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.5),
                        width: 0.8,
                      ),
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
                ? Text(_pluginSubtitle(section))
                : (_isAudioSectionType(section.type)
                      ? const Text('Audio row')
                      : (_isSeerrSectionType(section.type)
                            ? const Text('Seerr Discovery Rows')
                            : (_isImdbSectionType(section.type)
                                  ? const Text('IMDb List')
                                  : (_isTmdbSectionType(section.type)
                                        ? const Text('TMDB Lists')
                                        : null)))),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showArrows) ...[
                  if (!isFirst)
                    Icon(
                      Icons.arrow_left,
                      size: 18,
                      color: focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  if (!isLast)
                    Icon(
                      Icons.arrow_right,
                      size: 18,
                      color: focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _pluginSubtitle(HomeSectionConfig section) {
    return switch (section.pluginSource) {
      HomeSectionPluginSource.collections => switch (_otherServerName(
        section,
      )) {
        final server? => 'Collections row from $server',
        null => 'Collections row',
      },
      HomeSectionPluginSource.genres => 'Genres row',
      HomeSectionPluginSource.playlists => 'Playlists row',
      HomeSectionPluginSource.seerr =>
        AppLocalizations.of(context).seerrDiscoveryRows,
      HomeSectionPluginSource.custom => (() {
        Map<String, dynamic> rowConfig = {};
        try {
          rowConfig =
              jsonDecode(section.pluginAdditionalData ?? '{}')
                  as Map<String, dynamic>;
        } catch (_) {}
        final source = rowConfig['source'] as String? ?? 'imdb';
        final type = rowConfig['type'] as String? ?? 'user_list';
        final sourceLabel = switch (source) {
          'imdb' => 'IMDb',
          'tmdb' => 'TMDB',
          'letterboxd' => 'Letterboxd',
          'mdblist' => 'MDBList',
          _ => source.toUpperCase(),
        };
        final typeLabel = switch (type) {
          'user_list' => 'Custom List',
          'watchlist' => 'Watchlist',
          'films' => 'Films',
          'awards_events' => 'Awards/Events',
          'movie_collection' => 'Movie Collection',
          _ => type,
        };
        return '$sourceLabel $typeLabel';
      })(),
    };
  }
}

class _DiscoveredCollectionRow {
  final String id;
  final String name;

  const _DiscoveredCollectionRow({required this.id, required this.name});
}

class _DiscoveredGenreRow {
  final String id;
  final String name;

  const _DiscoveredGenreRow({required this.id, required this.name});
}

class _DiscoveredPlaylistRow {
  final String id;
  final String name;

  const _DiscoveredPlaylistRow({required this.id, required this.name});
}

class _HomeSectionTile extends StatefulWidget {
  final FocusNode focusNode;
  final HomeSectionType type;
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
    required this.type,
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
      canRequestFocus: true,
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
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
            !widget.isFirst) {
          widget.onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
            !widget.isLast) {
          widget.onMoveDown();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          if (!widget.isEmpty) {
            widget.onToggle(!widget.enabled);
          }
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
            decoration: _homeSectionTileDecoration(
              context,
              focused: _focused,
              type: widget.type,
              mergeEnabled: GetIt.instance<UserPreferences>().get(
                UserPreferences.mergeContinueWatchingNextUp,
              ),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: ListTile(
                // The select key handled this alone, so a pointer could reach
                // a row but never turn it on.
                onTap: widget.isEmpty
                    ? null
                    : () => widget.onToggle(!widget.enabled),
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                contentPadding: _kHomeSectionTileContentPadding,
                minLeadingWidth: 44,
                horizontalTitleGap: 14,
                leading: buildSettingsLeadingIconShell(
                  context,
                  icon: Icon(
                    (widget.enabled && !widget.isEmpty)
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.15),
                          borderRadius: AppRadius.circular(4),
                          border: Border.all(
                            color: Colors.red.withValues(alpha: 0.5),
                            width: 0.8,
                          ),
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
      ),
    );
  }
}

class _SectionGroupHeader extends StatefulWidget {
  final FocusNode focusNode;
  final String label;
  final int count;
  final bool open;
  final bool autofocus;
  final VoidCallback onToggle;

  const _SectionGroupHeader({
    super.key,
    required this.focusNode,
    required this.label,
    required this.count,
    required this.open,
    this.autofocus = false,
    required this.onToggle,
  });

  @override
  State<_SectionGroupHeader> createState() => _SectionGroupHeaderState();
}

class _SectionGroupHeaderState extends State<_SectionGroupHeader> {
  late bool _focused = widget.focusNode.hasFocus;

  @override
  Widget build(BuildContext context) {
    final foreground = _focused
        ? AppColors.black.withValues(alpha: 0.87)
        : AppColorScheme.onSurface;
    final muted = _focused
        ? AppColors.black.withValues(alpha: 0.54)
        : AppColorScheme.onSurface.withValues(alpha: 0.7);

    return Focus(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onFocusChange: (f) {
        if (_focused != f && mounted) setState(() => _focused = f);
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
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          widget.onToggle();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Padding(
        padding: _kHomeSectionTileOuterPadding,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: _homeSectionTileDecoration(context, focused: _focused),
          child: Material(
            type: MaterialType.transparency,
            child: ListTile(
              onTap: widget.onToggle,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              contentPadding: _kHomeSectionTileContentPadding,
              leading: AnimatedRotation(
                turns: widget.open ? 0.25 : 0,
                duration: const Duration(milliseconds: 150),
                child: Icon(Icons.chevron_right, color: muted),
              ),
              title: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: kCleanSettingsFontFamily,
                  color: foreground,
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: muted.withValues(alpha: 0.12),
                  borderRadius: AppRadius.circular(999),
                ),
                child: Text(
                  '${widget.count}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: kCleanSettingsFontFamily,
                    color: muted,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The name a built-in home row goes by in settings.
String homeSectionTypeLabel(HomeSectionType type, AppLocalizations l10n) =>
    switch (type) {
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
      HomeSectionType.audioArtists => l10n.artists,
      HomeSectionType.audioAlbums => l10n.albums,
      HomeSectionType.audioPlaylists => l10n.audioPlaylists,
      HomeSectionType.favoriteMovies =>
        'Favorite ${FavoriteTypeFilter.movie.displayName}',
      HomeSectionType.favoriteSeries =>
        'Favorite ${FavoriteTypeFilter.series.displayName}',
      HomeSectionType.favoriteEpisodes =>
        'Favorite ${FavoriteTypeFilter.episode.displayName}',
      HomeSectionType.favoritePeople =>
        'Favorite ${FavoriteTypeFilter.person.displayName}',
      HomeSectionType.favoriteArtists =>
        'Favorite ${FavoriteTypeFilter.musicArtist.displayName}',
      HomeSectionType.favoriteMusicVideos =>
        'Favorite ${FavoriteTypeFilter.musicVideo.displayName}',
      HomeSectionType.favoriteAlbums =>
        'Favorite ${FavoriteTypeFilter.musicAlbum.displayName}',
      HomeSectionType.favoriteSongs =>
        'Favorite ${FavoriteTypeFilter.audio.displayName}',
      HomeSectionType.collections => l10n.collections,
      HomeSectionType.genres => l10n.genres,
      HomeSectionType.studios => l10n.studios,
      HomeSectionType.liveTv => l10n.liveTV,
      HomeSectionType.onNow => l10n.onNow,
      HomeSectionType.seerrShortcuts => l10n.seerrShortcutsRow,
      HomeSectionType.seerrRecentRequests => l10n.recentRequests,
      HomeSectionType.seerrWatchlist => l10n.yourWatchlist,
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
      HomeSectionType.radarrCalendar => 'Upcoming Movies (Radarr)',
      HomeSectionType.sonarrCalendar => 'Upcoming TV Shows (Sonarr)',
      HomeSectionType.imdbTop250Movies => l10n.imdbTop250Movies,
      HomeSectionType.imdbTop250TvShows => l10n.imdbTop250TvShows,
      HomeSectionType.imdbMostPopularMovies => l10n.imdbMostPopularMovies,
      HomeSectionType.imdbMostPopularTvShows => l10n.imdbMostPopularTvShows,
      HomeSectionType.imdbLowestRatedMovies => l10n.imdbLowestRatedMovies,
      HomeSectionType.imdbTopEnglishMovies => l10n.imdbTopEnglishMovies,
      HomeSectionType.tmdbPopularMovies => 'Popular Movies',
      HomeSectionType.tmdbTopRatedMovies => 'Top Rated Movies',
      HomeSectionType.tmdbNowPlayingMovies => 'Now Playing Movies',
      HomeSectionType.tmdbUpcomingMovies => 'Upcoming Movies',
      HomeSectionType.tmdbPopularTv => 'Popular TV',
      HomeSectionType.tmdbTopRatedTv => 'Top Rated TV',
      HomeSectionType.tmdbAiringTodayTv => 'Airing Today TV',
      HomeSectionType.tmdbOnTheAirTv => 'On The Air TV',
      HomeSectionType.tmdbTrendingMovieDaily => 'Trending Movies (Daily)',
      HomeSectionType.tmdbTrendingMovieWeekly => 'Trending Movies (Weekly)',
      HomeSectionType.tmdbTrendingTvDaily => 'Trending TV (Daily)',
      HomeSectionType.tmdbTrendingTvWeekly => 'Trending TV (Weekly)',
      HomeSectionType.tmdbTrendingAllWeekly => 'Trending All (Weekly)',
      HomeSectionType.sinceYouWatched1 => 'Since You Watched Row 1',
      HomeSectionType.sinceYouWatched2 => 'Since You Watched Row 2',
      HomeSectionType.sinceYouWatched3 => 'Since You Watched Row 3',
      HomeSectionType.sinceYouWatched4 => 'Since You Watched Row 4',
      HomeSectionType.sinceYouWatched5 => 'Since You Watched Row 5',
      HomeSectionType.rewatch => 'Rewatch',
      HomeSectionType.seasonal => l10n.seasonalRow,
      HomeSectionType.none => l10n.none,
    };
