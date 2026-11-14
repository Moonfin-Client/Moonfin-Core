import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../preference/home_section_config.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../models/calendar_entry.dart';
import '../models/media_bar_slide_item.dart';
import '../models/media_bar_state.dart';
import '../services/custom_external_lists_service.dart';
import '../services/library_scope_service.dart';
import '../services/plugin_sync_service.dart';
import '../utils/blocked_ratings.dart';
import '../utils/bounded_concurrency.dart';
import '../utils/latest_media_row_normalizer.dart';
import 'calendar_repository.dart';
import 'mdblist_repository.dart';
import 'tmdb_repository.dart';

class MediaBarRepository {

  final MediaServerClient _client;
  final UserPreferences _prefs;
  final _random = math.Random();

  static const _fields =
      'Type,Genres,OfficialRating,CommunityRating,CriticRating,'
      'RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,'
      'Overview,ProviderIds,PremiereDate,DateCreated,Taglines';

  MediaBarRepository(this._client, this._prefs);

  Future<MediaBarState> loadItems() async {
    if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
        GetIt.instance<MediaBarRepository>() != this) {
      return const MediaBarDisabled();
    }

    final mediaBarMode = _prefs.get(UserPreferences.mediaBarMode);
    if (!UserPreferences.isMediaBarModeEnabled(mediaBarMode)) {
      return const MediaBarDisabled();
    }

    final contentType = _prefs.get(UserPreferences.mediaBarContentType);

    final maxItems =
        int.tryParse(_prefs.get(UserPreferences.mediaBarItemCount)) ?? 10;
    // The pickers in settings are open to everyone and the filtering below is
    // plain item queries, so a plugin is not needed to honour the choice.
    final libraryIds = _splitCsv(UserPreferences.mediaBarLibraryIds);
    final collectionIds = _splitCsv(UserPreferences.mediaBarCollectionIds);
    final excludedGenres = _splitCsv(
      UserPreferences.mediaBarExcludedGenres,
    ).toSet();

    final fetchLimit = maxItems + 2;

    final includeTypes = switch (contentType) {
      'movies' => const ['Movie'],
      'tvshows' => const ['Series'],
      _ => const ['Movie', 'Series'],
    };

    final preferredCollectionTypes = switch (contentType) {
      'movies' => const ['movies'],
      'tvshows' => const ['tvshows'],
      _ => const ['tvshows', 'movies'],
    };

    final externalPool = await _fetchExternalPool(
      _splitCsv(UserPreferences.mediaBarExternalLists),
      includeTypes,
    );
    // Lists picked on their own fill the bar alone. When they come back empty
    // the bar falls back to the libraries the same way it does with no picks.
    if (externalPool.isNotEmpty &&
        libraryIds.isEmpty &&
        collectionIds.isEmpty) {
      final slides = await _mixInExternal(
        const [],
        externalPool,
        maxItems,
        excludedGenres,
      );
      if (slides.isNotEmpty) return MediaBarReady(slides);
    }

    // Started now so they run alongside the library reads. Only the new
    // releases source brings in what's coming. The labels on series come
    // later, with the others.
    final returningSeries =
        _isNewReleaseSource &&
            _prefs.get(UserPreferences.mediaBarUpcomingEpisodes) &&
            includeTypes.contains('Series')
        ? _returningSeries(libraryIds, collectionIds)
        : null;
    final upcomingMovies =
        _isNewReleaseSource &&
            _prefs.get(UserPreferences.mediaBarUpcomingMovies) &&
            includeTypes.contains('Movie')
        ? _upcomingMovieSlides(libraryIds, collectionIds, excludedGenres)
        : null;

    final allParentIds = <String>{};
    final allParentItemTypes = <String, List<String>>{};

    try {
      final viewsResponse = await _client.userViewsApi.getUserViews().timeout(
        const Duration(seconds: 4),
      );
      final views = (viewsResponse['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();

      final validLibraryIds = <String>{};
      for (final view in views) {
        final viewId = view['Id']?.toString();
        if (viewId == null ||
            !supportsMediaBarLibrary(view, preferredCollectionTypes)) {
          continue;
        }

        validLibraryIds.add(viewId);

        // A mixed library is left off this map so it keeps the full type list
        final type = _normalizeCollectionType(view['CollectionType']);
        if (type == 'movies') {
          allParentItemTypes[viewId] = const ['Movie'];
        } else if (type == 'tvshows') {
          allParentItemTypes[viewId] = const ['Series'];
        }
      }

      // Filter libraryIds to only include valid movies/tvshows library IDs
      final filteredLibraryIds = libraryIds
          .where((id) => validLibraryIds.contains(id))
          .toList();

      allParentIds.addAll(filteredLibraryIds);
      allParentIds.addAll(collectionIds);

      if (allParentIds.isEmpty) {
        allParentIds.addAll(validLibraryIds);
      }
    } catch (_) {
      // The views lookup failed, so fall back to what the user picked. Those
      // saved ids can name a library access has since been revoked for, so
      // drop what the policy no longer allows before trusting them.
      allParentIds.addAll(
        await GetIt.instance<LibraryScopeService>().retainPermitted(libraryIds),
      );
      allParentIds.addAll(collectionIds);
    }

    try {
      if (allParentIds.isEmpty) {
        return const MediaBarDisabled();
      }

      final allItems = <Map<String, dynamic>>[];
      final seenIds = <String>{};
      final usable = _usableFor(excludedGenres);
      var usableCount = 0;
      // A source still waiting for a slot is skipped once the pool holds twice
      // the item count to choose from. The order is shuffled so the skipped
      // ones change from one load to the next.
      final enough = maxItems * 2;
      await mapBounded(
        allParentIds.toList()..shuffle(_random),
        _sourceConcurrency,
        (parentId) async {
          // Mixing needs both kinds in the pool, so every library is read.
          if (!_mixesTypes && usableCount >= enough) return null;
          try {
            final batch = await _fetchItems(
              allParentItemTypes[parentId] ?? includeTypes,
              fetchLimit,
              parentId: parentId,
            );
            for (final item in batch) {
              final id = item['Id']?.toString();
              if (id != null && !seenIds.add(id)) continue;
              allItems.add(item);
              if (usable(item)) usableCount++;
            }
          } catch (_) {
            // Keep fetching remaining libraries if one fails
          }
          return null;
        },
      );
      if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
          GetIt.instance<MediaBarRepository>() != this) {
        return const MediaBarDisabled();
      }

      // Worked out once on the whole pool: the new releases source keeps only
      // the movies that pass, and the chosen slides take their labels from it.
      final movieLabels =
          _prefs.get(UserPreferences.mediaBarNewReleaseBanner) &&
          _newReleaseKinds.contains(UserPreferences.mediaBarNewMovie);
      final newMovies = movieLabels || _isNewReleaseSource
          ? await _newMovies(allItems.where(usable))
          : const <String, MediaBarNewReleaseInfo>{};
      if (_isNewReleaseSource) {
        // Off with the second line, since every tagline is dropped then.
        final taglineOnly =
            _prefs.get(UserPreferences.mediaBarNewMovieDetail) &&
            _prefs.get(UserPreferences.mediaBarNewMovieTaglineOnly);
        allItems.removeWhere((item) {
          if (item['Type'] != 'Movie') return false;
          final release = newMovies[item['Id']?.toString()];
          return release == null || (taglineOnly && release.tagline == null);
        });
      }

      var selected = _selectItemsWithBackdrops(
        allItems,
        maxItems,
        excludedGenres,
      );

      if (selected.isEmpty && allParentIds.isNotEmpty) {
        // Asking again for new releases would find nothing again, so a quiet
        // window shows random titles from the first library that has some.
        final newReleases = _isNewReleaseSource;
        final retryParents = newReleases ? allParentIds : [allParentIds.first];
        for (final parentId in retryParents) {
          selected = _selectItemsWithBackdrops(
            await _fetchItems(
              allParentItemTypes[parentId] ?? includeTypes,
              fetchLimit,
              parentId: parentId,
              random: newReleases,
            ),
            maxItems,
            excludedGenres,
          );
          if (selected.isNotEmpty) break;
        }
      }

      if (selected.isEmpty) {
        final firstLibraryItems =
            await _fetchItemsFromFirstSeriesOrMoviesLibrary(
              includeTypes,
              fetchLimit,
              contentType: contentType,
            );
        selected = _selectItemsWithBackdrops(
          firstLibraryItems,
          maxItems,
          excludedGenres,
        );
      }

      // A fallback can pick titles the pool never held, so those are checked
      // on their own.
      final pooled = {for (final item in allItems) item['Id']?.toString()};
      final labels = !movieLabels
          ? const <String, MediaBarNewReleaseInfo>{}
          : selected.every((item) => pooled.contains(item['Id']?.toString()))
          ? newMovies
          : await _newMovies(selected);

      final items = await _mixInExternal(
        [
          for (final item in selected)
            _toSlideItem(item).withNewRelease(labels[item['Id']?.toString()]),
        ],
        externalPool,
        maxItems,
        excludedGenres,
      );
      final reserved = [
        if (returningSeries != null)
          for (final item in (await returningSeries)
              .where(usable)
              .take(math.max(1, maxItems ~/ 3)))
            _toSlideItem(item),
        ...?await upcomingMovies,
      ];
      final placed = reserved.isEmpty
          ? items
          : mediaBarPlaceReserved(items, reserved, maxItems);
      if (placed.isEmpty) {
        return const MediaBarError('No items with backdrop images found');
      }
      return MediaBarReady(placed);
    } catch (e) {
      final firstLibraryItems = await _fetchItemsFromFirstSeriesOrMoviesLibrary(
        includeTypes,
        fetchLimit,
        contentType: contentType,
      );
      final selected = _selectItemsWithBackdrops(
        firstLibraryItems,
        maxItems,
        excludedGenres,
      );
      if (selected.isNotEmpty) {
        return MediaBarReady(selected.map(_toSlideItem).toList());
      }
      return MediaBarError(e);
    }
  }

  List<Map<String, dynamic>> _selectItemsWithBackdrops(
    List<Map<String, dynamic>> source,
    int maxItems,
    Set<String> excludedGenres,
  ) {
    final withBackdrops = source.where(_usableFor(excludedGenres)).toList()
      ..shuffle();
    var ordered = withBackdrops;
    if (_prefs.get(UserPreferences.mediaBarFollowedFirst)) {
      // Started series go in first and lead the bar. The rest stay shuffled.
      ordered = [
        ...withBackdrops.where(mediaBarIsFollowedSeries),
        ...withBackdrops.where((item) => !mediaBarIsFollowedSeries(item)),
      ];
    }
    if (_mixesTypes) ordered = mediaBarAlternateTypes(ordered);
    return ordered.take(maxItems).toList();
  }

  /// The check an item has to pass to go on the bar.
  bool Function(Map<String, dynamic>) _usableFor(Set<String> excludedGenres) {
    final filter = activeParentalFilter;
    return (item) =>
        _hasBackdrop(item) &&
        !_isBoxSet(item) &&
        !_hasExcludedGenre(item, excludedGenres) &&
        !filter.isBlockedRaw(item);
  }

  List<String> _splitCsv(Preference<String> pref) =>
      _prefs.get(pref).split(',').where((s) => s.isNotEmpty).toList();

  Future<List<Map<String, dynamic>>> _fetchItemsFromFirstSeriesOrMoviesLibrary(
    List<String>? itemTypes,
    int limit, {
    required String contentType,
  }) async {
    try {
      final viewsResponse = await _client.userViewsApi.getUserViews().timeout(
        const Duration(seconds: 4),
      );
      final views = (viewsResponse['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      if (views.isEmpty) {
        return const <Map<String, dynamic>>[];
      }

      final preferredCollectionTypes = switch (contentType) {
        'movies' => const ['movies'],
        'tvshows' => const ['tvshows'],
        _ => const ['tvshows', 'movies'],
      };

      String? libraryId;

      for (final preferredType in preferredCollectionTypes) {
        for (final view in views) {
          final collectionType = _normalizeCollectionType(
            view['CollectionType'],
          );
          if (collectionType != preferredType) {
            continue;
          }
          final id = view['Id']?.toString();
          if (id != null && id.isNotEmpty) {
            libraryId = id;
            break;
          }
        }
        if (libraryId != null) {
          break;
        }
      }

      if (libraryId == null) {
        for (final view in views) {
          if (!supportsMediaBarLibrary(view, const ['movies', 'tvshows'])) {
            continue;
          }
          final id = view['Id']?.toString();
          if (id != null && id.isNotEmpty) {
            libraryId = id;
            break;
          }
        }
      }

      if (libraryId == null) {
        return const <Map<String, dynamic>>[];
      }

      return await _fetchItems(
        itemTypes,
        limit,
        parentId: libraryId,
        random: _isNewReleaseSource,
      );
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  String _normalizeCollectionType(Object? value) {
    return value?.toString().trim().toLowerCase() ?? '';
  }

  /// How many titles each source hands the selector. The random source asks
  /// the server for this many in a random order, and the dated ones read this
  /// many of the newest.
  static const _poolSize = 40;

  /// How many libraries and collections are read at once.
  static const _sourceConcurrency = 6;

  /// [random] skips the chosen source and reads a random window.
  Future<List<Map<String, dynamic>>> _fetchItems(
    List<String>? itemTypes,
    int limit, {
    String? parentId,
    bool random = false,
  }) async {
    if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
        GetIt.instance<MediaBarRepository>() != this) {
      return const <Map<String, dynamic>>[];
    }
    final sourceType = random
        ? UserPreferences.mediaBarSourceRandom
        : _prefs.get(UserPreferences.mediaBarSourceType);
    if (sourceType == UserPreferences.mediaBarSourceNewReleases) {
      return _fetchNewReleases(itemTypes, limit, parentId: parentId);
    }
    if (sourceType == UserPreferences.mediaBarSourceRecentlyAdded ||
        sourceType == UserPreferences.mediaBarSourceRecentlyReleased) {
      return _fetchDatedItems(sourceType, itemTypes, limit, parentId: parentId);
    }
    try {
      final response = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'Random',
            sortOrder: 'Ascending',
            // A library the user has grouped with others holds those libraries
            // rather than the titles, so only a recursive walk reaches anything.
            // The type filter keeps the walk to movies and series either way.
            recursive: true,
            parentId: parentId,
            limit: _poolSize,
            fields: _fields,
            enableTotalRecordCount: false,
            enableImageTypes: 'Backdrop,Logo,Banner',
          )
          .timeout(const Duration(seconds: 15));

      final rawItems = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>()
          .toList();
      // A server that ignores Random hands back its own order, so the pool is
      // shuffled again before the selector takes its slides.
      rawItems.shuffle(_random);
      return rawItems;
    } on TimeoutException {
      return _fetchItemsFromFallbackSource(
        itemTypes,
        limit,
        parentId: parentId,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 0;
      if (statusCode == 401 || statusCode == 403) {
        return const <Map<String, dynamic>>[];
      }
      if (statusCode != 400 && statusCode < 500) {
        rethrow;
      }

      return _fetchItemsFromFallbackSource(
        itemTypes,
        limit,
        parentId: parentId,
      );
    }
  }

  /// The newest titles a dated source offers, ordered and cut off the same way
  /// the matching home row does, so the two surfaces agree on what recent
  /// means.
  Future<List<Map<String, dynamic>>> _fetchDatedItems(
    String sourceType,
    List<String>? itemTypes,
    int limit, {
    String? parentId,
  }) async {
    try {
      final hideWatched = _prefs.containsPreference(
            UserPreferences.hideWatchedInRecentRows,
          )
          ? _prefs.get(UserPreferences.hideWatchedInRecentRows)
          : null;
      final childType = switch (_prefs.get(
        UserPreferences.recentlyReleasedSeriesType,
      )) {
        RecentlyReleasedSeriesType.series => null,
        RecentlyReleasedSeriesType.season => 'Season',
        RecentlyReleasedSeriesType.episode => 'Episode',
      };
      if (sourceType == UserPreferences.mediaBarSourceRecentlyReleased &&
          childType != null &&
          (itemTypes == null || itemTypes.contains('Series'))) {
        return await _fetchRecentlyReleasedByChild(
          childType,
          itemTypes,
          parentId: parentId,
          hideWatched: hideWatched,
        );
      }
      final response =
          sourceType == UserPreferences.mediaBarSourceRecentlyReleased
          ? await _client.itemsApi
                .getRecentlyReleasedItems(
                  includeItemTypes: itemTypes,
                  parentId: parentId,
                  recursive: true,
                  limit: _poolSize,
                  fields: _fields,
                  enableImageTypes: 'Backdrop,Logo,Banner',
                  hideWatched: hideWatched,
                )
                .timeout(const Duration(seconds: 15))
          : await _client.itemsApi
                .getLatestItems(
                  includeItemTypes: itemTypes,
                  parentId: parentId,
                  limit: _poolSize,
                  fields: _fields,
                  enableImageTypes: 'Backdrop,Logo,Banner',
                )
                .timeout(const Duration(seconds: 15));

      final rawItems = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      if (!(hideWatched ?? false)) return rawItems;
      return rawItems
          .where((item) => !isRawItemWatchedForRecentRow(item))
          .toList();
    } catch (error) {
      final statusCode = error is DioException
          ? (error.response?.statusCode ?? 0)
          : 0;
      if (statusCode == 401 || statusCode == 403) {
        return const <Map<String, dynamic>>[];
      }
      return _fetchItemsFromFallbackSource(itemTypes, limit, parentId: parentId);
    }
  }

  /// Recently released the way the home row reads it in Episode or Season
  /// mode: series by their latest episode or season rather than their first
  /// air date. Movies, when the type allows them, come as before.
  Future<List<Map<String, dynamic>>> _fetchRecentlyReleasedByChild(
    String childType,
    List<String>? itemTypes, {
    String? parentId,
    bool? hideWatched,
  }) async {
    Future<List<Map<String, dynamic>>> released(
      List<String> types,
      int limit,
    ) async {
      final response = await _client.itemsApi
          .getRecentlyReleasedItems(
            includeItemTypes: types,
            parentId: parentId,
            recursive: true,
            limit: limit,
            fields: _fields,
            enableImageTypes: 'Backdrop,Logo,Banner',
            hideWatched: hideWatched,
          )
          .timeout(const Duration(seconds: 15));
      return (response['Items'] as List? ?? []).cast<Map<String, dynamic>>();
    }

    final batches = await Future.wait([
      // Several episodes or seasons share a series, so more are read to end up
      // with as many series as the other sources give.
      released([childType], _poolSize * 4).then(_seriesOf),
      if (itemTypes == null || itemTypes.contains('Movie'))
        released(const ['Movie'], _poolSize),
    ]);
    final items = batches.expand((batch) => batch);
    return (hideWatched ?? false)
        ? items.where((item) => !isRawItemWatchedForRecentRow(item)).toList()
        : items.toList();
  }

  bool get _isNewReleaseSource =>
      _prefs.get(UserPreferences.mediaBarSourceType) ==
      UserPreferences.mediaBarSourceNewReleases;

  /// What the Sonarr and Radarr calendars expect within the horizon, through
  /// Moonbase. Empty when that isn't set up or is slow: the bar never waits
  /// more than a few seconds for it. The calendar keeps its answer a couple of
  /// minutes, so the labels asked for later reuse it.
  Future<List<CalendarEntry>> _upcomingEntries() async {
    if (!GetIt.instance.isRegistered<CalendarRepository>()) return const [];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final days = _prefs.get(UserPreferences.mediaBarUpcomingDays);
    try {
      final result = await GetIt.instance<CalendarRepository>()
          .load(start: today, end: today.add(Duration(days: days + 1)))
          .timeout(const Duration(seconds: 3));
      return result.entries;
    } catch (_) {
      return const [];
    }
  }

  /// Library series with an episode due within the horizon, for the new
  /// releases source, so a series coming back shows up before it airs. The
  /// ones the user follows come first, then the soonest. The caller keeps a
  /// third of the slides at most, so they don't crowd out what's already out.
  Future<List<Map<String, dynamic>>> _returningSeries(
    List<String> libraryIds,
    List<String> collectionIds,
  ) async {
    // The calendar places titles in libraries, not in collections.
    if (libraryIds.isEmpty && collectionIds.isNotEmpty) return const [];
    final entries = [
      for (final entry in await _upcomingEntries())
        if (libraryIds.isEmpty || entry.libraryIds.any(libraryIds.contains))
          entry,
    ];
    // More than will be kept, so the followed ones can be found among them.
    final ids = mediaBarUpcomingBySeries(
      entries,
      now: DateTime.now(),
    ).keys.take(_poolSize);
    if (ids.isEmpty) return const [];
    try {
      final series = await _seriesOf([
        for (final id in ids) {'SeriesId': id},
      ]);
      return [
        ...series.where(mediaBarIsFollowedSeries),
        ...series.where((item) => !mediaBarIsFollowedSeries(item)),
      ];
    } catch (_) {
      return const [];
    }
  }

  /// Up to two movies Radarr expects digitally within the horizon and that
  /// aren't on the server yet, as outside slides that open in Seerr. A movie
  /// TMDB has no logo for is left out.
  Future<List<MediaBarSlideItem>> _upcomingMovieSlides(
    List<String> libraryIds,
    List<String> collectionIds,
    Set<String> excludedGenres,
  ) async {
    // Nothing says what age an upcoming movie is rated for, so a viewer who
    // blocks any rating doesn't get them, as with the outside lists.
    if (!GetIt.instance<PluginSyncService>().tmdbDetailsAvailable ||
        activeParentalFilter.isActive ||
        (libraryIds.isEmpty && collectionIds.isNotEmpty)) {
      return const [];
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final byMovie = <int, CalendarEntry>{};
    for (final entry in await _upcomingEntries()) {
      final tmdbId = entry.tmdbId;
      // A movie already on the server isn't coming anymore.
      if (!entry.isMovie ||
          !mediaBarIsHomeRelease(entry) ||
          !entry.monitored ||
          entry.hasFile ||
          entry.itemId != null ||
          tmdbId == null ||
          entry.day.isBefore(today) ||
          (libraryIds.isNotEmpty &&
              !entry.libraryIds.any(libraryIds.contains))) {
        continue;
      }
      byMovie.putIfAbsent(tmdbId, () => entry);
    }
    // No minimum rating here: someone chose to add these to Radarr, and a
    // movie that isn't out yet often has no rating to go by anyway.
    final candidates = byMovie.values.toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    // A few more than needed are looked up at once, since some have no logo.
    final slides = await Future.wait(
      candidates
          .take(4)
          .map((entry) => _upcomingMovieSlide(entry, excludedGenres)),
    );
    return slides.nonNulls.take(2).toList();
  }

  Future<MediaBarSlideItem?> _upcomingMovieSlide(
    CalendarEntry entry,
    Set<String> excludedGenres,
  ) async {
    final tmdbId = '${entry.tmdbId}';
    final Map<String, dynamic>? details;
    try {
      details = await GetIt.instance<TmdbRepository>()
          .titleDetails(type: 'movie', tmdbId: tmdbId, imdbId: entry.imdbId)
          .timeout(const Duration(seconds: 3));
    } catch (_) {
      return null;
    }
    // Without its logo, the slide would look broken next to the others.
    final logoUrl = _tmdbImage(details?['logoPath'] as String?, 500);
    final backdropUrl =
        _tmdbImage(details?['backdropPath'] as String?, 1280) ??
        entry.backdropUrl;
    if (logoUrl == null || backdropUrl == null) return null;
    // Every genre counts here, not only the three the slide shows.
    final genres = (details?['genres'] as List?)?.cast<String>() ?? const [];
    if (genres.any(excludedGenres.contains)) return null;
    final trailerUrl = details?['trailerUrl'] as String?;
    final runtime = entry.runtimeMinutes;
    return MediaBarSlideItem(
      itemId: tmdbId,
      serverId: MediaBarSlideItem.externalServerId,
      title: entry.title,
      overview: details?['overview'] as String? ?? entry.overview,
      backdropUrl: backdropUrl,
      logoUrl: logoUrl,
      posterUrl: entry.posterUrl,
      year: entry.year,
      genres: genres.take(3).toList(),
      runtime: runtime != null && runtime > 0
          ? Duration(minutes: runtime)
          : null,
      communityRating: (details?['rating'] as num?)?.toDouble(),
      tmdbId: tmdbId,
      imdbId: entry.imdbId,
      itemType: 'Movie',
      remoteTrailers: [
        if (trailerUrl != null) {'Url': trailerUrl},
      ],
      newRelease: mediaBarUpcomingOf(entry),
    );
  }

  bool get _mixesTypes =>
      _prefs.get(UserPreferences.mediaBarMixTypes) &&
      _prefs.get(UserPreferences.mediaBarContentType) ==
          UserPreferences.mediaBarContentTypeBoth;

  static const _seriesKinds = {
    UserPreferences.mediaBarNewSeries,
    UserPreferences.mediaBarNewSeason,
    UserPreferences.mediaBarNewEpisodes,
  };

  Set<String> get _newReleaseKinds => mediaBarNewReleaseKindsOf(
    _prefs.get(UserPreferences.mediaBarNewReleaseKinds),
  );

  /// The recent rows' Hide Watched, which the bar's recent sources follow too.
  bool get _hidesWatched => _prefs.get(UserPreferences.hideWatchedInRecentRows);

  /// New series and new movies, as the content type allows. The movies are
  /// only the newest by date here: [_newMovies] applies the window and the
  /// minimum rating once the pool is in.
  Future<List<Map<String, dynamic>>> _fetchNewReleases(
    List<String>? itemTypes,
    int limit, {
    String? parentId,
  }) async {
    final batches = await Future.wait([
      if (itemTypes == null || itemTypes.contains('Series'))
        _fetchNewReleaseSeries(limit, parentId: parentId),
      if (itemTypes == null || itemTypes.contains('Movie'))
        _fetchNewReleaseMovies(parentId: parentId),
    ]);
    final items = batches.expand((batch) => batch);
    return _hidesWatched
        ? items.where((item) => !isRawItemWatchedForRecentRow(item)).toList()
        : items.toList();
  }

  /// Series with episodes that aired within the window, newest first. A series'
  /// own date is its first season's, so the episodes are asked for and brought
  /// back to their series.
  Future<List<Map<String, dynamic>>> _fetchNewReleaseSeries(
    int limit, {
    String? parentId,
  }) async {
    try {
      final episodes = await _recentEpisodes(parentId: parentId, limit: 300);
      return await _seriesOf(episodes);
    } catch (error) {
      // A server that fails falls back to random titles, so the bar doesn't
      // vanish as if nothing aired.
      final statusCode = error is DioException
          ? (error.response?.statusCode ?? 0)
          : 0;
      if (statusCode == 401 || statusCode == 403) {
        return const <Map<String, dynamic>>[];
      }
      return _fetchItems(
        const ['Series'],
        limit,
        parentId: parentId,
        random: true,
      );
    }
  }

  /// The newest movies by the chosen date, cut at the window on the server
  /// where it can be. Jellyfin can't filter on the date added, so then the cut
  /// is on the release date's limit and [_newMovies] checks the rest.
  Future<List<Map<String, dynamic>>> _fetchNewReleaseMovies({
    String? parentId,
  }) async {
    final now = DateTime.now();
    final byDateAdded =
        _prefs.get(UserPreferences.mediaBarNewMovieBasis) ==
        UserPreferences.mediaBarNewMovieByAdded;
    final maxAge = _prefs.get(UserPreferences.mediaBarNewMovieMaxAgeMonths);
    try {
      final response = await _client.itemsApi
          .getItems(
            parentId: parentId,
            includeItemTypes: const ['Movie'],
            recursive: true,
            sortBy: byDateAdded ? 'DateCreated' : 'PremiereDate',
            sortOrder: 'Descending',
            minPremiereDate: byDateAdded
                ? DateTime(now.year, now.month - maxAge, now.day)
                : now.subtract(
                    Duration(
                      days: _prefs.get(UserPreferences.mediaBarNewMovieDays),
                    ),
                  ),
            limit: _poolSize,
            fields: _fields,
            enableTotalRecordCount: false,
            enableImageTypes: 'Backdrop,Logo,Banner',
          )
          .timeout(const Duration(seconds: 15));
      return (response['Items'] as List? ?? []).cast<Map<String, dynamic>>();
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  /// The series [children] (episodes or seasons) belong to, in the order they
  /// first come up, fetched in one request.
  Future<List<Map<String, dynamic>>> _seriesOf(
    Iterable<Map<String, dynamic>> children,
  ) async {
    final seriesIds = <String>[];
    for (final child in children) {
      final id = child['SeriesId']?.toString();
      if (id == null || seriesIds.contains(id)) continue;
      seriesIds.add(id);
      if (seriesIds.length >= _poolSize) break;
    }
    if (seriesIds.isEmpty) return const [];

    final response = await _client.itemsApi
        .getItems(
          ids: seriesIds,
          fields: _fields,
          enableTotalRecordCount: false,
          enableImageTypes: 'Backdrop,Logo,Banner',
        )
        .timeout(const Duration(seconds: 15));
    final byId = {
      for (final item
          in (response['Items'] as List? ?? []).cast<Map<String, dynamic>>())
        item['Id']?.toString(): item,
    };
    // The server answers in its own order, so the newest stay first.
    return [for (final id in seriesIds) ?byId[id]];
  }

  /// The new movies among [items], by id, with the minimum rating applied.
  /// Asks Moonbase only when a minimum is set and something is new, and never
  /// waits more than a second for it.
  Future<Map<String, MediaBarNewReleaseInfo>> _newMovies(
    Iterable<Map<String, dynamic>> items,
  ) async {
    final now = DateTime.now();
    final byDateAdded =
        _prefs.get(UserPreferences.mediaBarNewMovieBasis) ==
        UserPreferences.mediaBarNewMovieByAdded;
    final days = _prefs.get(UserPreferences.mediaBarNewMovieDays);
    final maxAge = _prefs.get(UserPreferences.mediaBarNewMovieMaxAgeMonths);

    final found = <String, MediaBarNewReleaseInfo>{};
    final community = <String, double?>{};
    final tmdbIds = <String, String>{};
    for (final item in items) {
      final id = item['Id']?.toString();
      if (id == null) continue;
      final release = mediaBarNewMovieOf(
        item,
        byDateAdded: byDateAdded,
        days: days,
        maxAgeMonths: maxAge,
        now: now,
      );
      if (release == null) continue;
      // With the second line off, the tagline is dropped here so the label
      // stays on its own.
      found[id] = _prefs.get(UserPreferences.mediaBarNewMovieDetail)
          ? release
          : MediaBarNewReleaseInfo(kind: release.kind, date: release.date);
      community[id] = (item['CommunityRating'] as num?)?.toDouble();
      final providerIds = item['ProviderIds'] as Map<String, dynamic>?;
      final tmdbId = (providerIds?['Tmdb'] ?? providerIds?['tmdb'])?.toString();
      if (tmdbId != null && tmdbId.isNotEmpty) tmdbIds[id] = tmdbId;
    }

    final min = _prefs.get(UserPreferences.mediaBarNewMovieMinRating);
    if (min <= 0 || found.isEmpty) return found;

    final cached = await _cachedRatings(tmdbIds.values.toSet().toList());
    found.removeWhere((id, _) {
      final kept = mediaBarMeetsMinRating(
        cached: cached[tmdbIds[id]],
        community: community[id],
        minTenths: min,
      );
      return !kept;
    });
    return found;
  }

  /// MDBList scores Moonbase already has, by TMDB id. Empty when Moonbase
  /// isn't there or is slow, so the server's own ratings stand in.
  Future<Map<String, double>> _cachedRatings(List<String> tmdbIds) async {
    if (tmdbIds.isEmpty || !GetIt.instance.isRegistered<MdbListRepository>()) {
      return const {};
    }
    try {
      return await GetIt.instance<MdbListRepository>()
          .cachedMovieRatings(tmdbIds)
          .timeout(const Duration(seconds: 1));
    } catch (_) {
      return const {};
    }
  }

  /// Episodes under [parentId] that aired within the window, newest first.
  /// The server may ignore the date floor or list episodes it only knows from
  /// metadata, so [mediaBarNewReleaseOf] checks every one again.
  Future<List<Map<String, dynamic>>> _recentEpisodes({
    String? parentId,
    required int limit,
  }) async {
    final days = _prefs.get(UserPreferences.mediaBarNewReleaseDays);
    final response = await _client.itemsApi
        .getItems(
          parentId: parentId,
          includeItemTypes: const ['Episode'],
          recursive: true,
          sortBy: 'PremiereDate',
          sortOrder: 'Descending',
          minPremiereDate: DateTime.now().subtract(Duration(days: days)),
          limit: limit,
          enableTotalRecordCount: false,
        )
        .timeout(const Duration(seconds: 15));
    final now = DateTime.now();
    return (response['Items'] as List? ?? [])
        .cast<Map<String, dynamic>>()
        .where((episode) => isRecentlyAiredEpisode(episode, now: now, days: days))
        .toList();
  }

  /// Every episode of a season, aired or not, to tell a season released at once
  /// from one whose last few episodes came out together.
  Future<List<Map<String, dynamic>>> _seasonEpisodes(String seasonId) async {
    final response = await _client.itemsApi
        .getItems(
          parentId: seasonId,
          includeItemTypes: const ['Episode'],
          recursive: true,
          limit: 200,
          enableTotalRecordCount: false,
        )
        .timeout(const Duration(seconds: 15));
    return (response['Items'] as List? ?? []).cast<Map<String, dynamic>>();
  }

  /// The labels worked out once the bar shows, by item id: for each series,
  /// what aired lately, or what the Sonarr calendar has next once there's
  /// nothing new left to watch. Asked for after the bar shows, so a slow
  /// server only holds back the labels.
  Future<Map<String, MediaBarNewReleaseInfo>> loadNewReleases(
    List<MediaBarSlideItem> slides,
  ) async {
    final kinds = _newReleaseKinds;
    final aired =
        _prefs.get(UserPreferences.mediaBarNewReleaseBanner) &&
        kinds.any(_seriesKinds.contains);
    final upcomingOn = _prefs.get(UserPreferences.mediaBarUpcomingEpisodes);
    final releases = <String, MediaBarNewReleaseInfo>{};
    // With no series label wanted, the series aren't asked about at all.
    if (!aired && !upcomingOn) return releases;
    final days = _prefs.get(UserPreferences.mediaBarNewReleaseDays);
    final now = DateTime.now();
    final upcoming = upcomingOn
        ? mediaBarUpcomingBySeries(await _upcomingEntries(), now: now)
        : const <String, MediaBarNewReleaseInfo>{};
    await mapBounded(
      slides
          .where((slide) => !slide.isExternal && slide.itemType == 'Series')
          .toList(),
      _sourceConcurrency,
      (series) async {
        final next = upcoming[series.itemId];
        if (!aired && next == null) return null;
        try {
          final recent = await _recentEpisodes(
            parentId: series.itemId,
            limit: 100,
          );
          MediaBarNewReleaseInfo? past;
          if (aired) {
            // Only a season with several recent episodes on one day can have
            // come out at once, so only then is the whole season fetched.
            final seasonId = mediaBarSeasonToCheck(
              recent,
              now: now,
              days: days,
            );
            final release = mediaBarNewReleaseOf(
              recent,
              latestSeason: seasonId == null
                  ? null
                  : await _seasonEpisodes(seasonId),
              now: now,
              days: days,
            );
            if (release != null &&
                kinds.contains(mediaBarNewReleaseKindName(release.kind))) {
              past = release;
            }
          }
          final label = mediaBarSeriesLabel(
            past: past,
            upcoming: next,
            caughtUp: mediaBarCaughtUp(recent, now: now, days: days),
          );
          if (label != null) {
            releases[series.itemId] = label;
          }
        } catch (_) {
          // A series that can't be asked about still gets what's coming.
          if (next != null) releases[series.itemId] = next;
        }
        return null;
      },
    );
    return releases;
  }

  Future<List<Map<String, dynamic>>> _fetchItemsFromFallbackSource(
    List<String>? itemTypes,
    int limit, {
    String? parentId,
  }) async {
    final reducedLimit = limit > 24 ? 24 : limit;

    try {
      final latestResponse = await _client.itemsApi
          .getLatestItems(
            includeItemTypes: itemTypes,
            parentId: parentId,
            limit: reducedLimit,
            fields: _fields,
          )
          .timeout(const Duration(seconds: 15));
      final rawItems = latestResponse['Items'] as List? ?? [];
      return rawItems.cast<Map<String, dynamic>>();
    } catch (_) {}

    try {
      final fallbackResponse = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: true,
            parentId: parentId,
            limit: reducedLimit,
            fields: _fields,
            enableTotalRecordCount: false,
            enableImageTypes: 'Backdrop,Logo,Banner',
          )
          .timeout(const Duration(seconds: 15));
      final rawItems = fallbackResponse['Items'] as List? ?? [];
      return rawItems.cast<Map<String, dynamic>>();
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  /// The titles of the picked outside lists that can go on the bar, shuffled
  /// and without repeats. Empty without Moonbase.
  Future<List<ImdbExternalListItem>> _fetchExternalPool(
    List<String> listIds,
    List<String> itemTypes,
  ) async {
    if (listIds.isEmpty) return const [];
    final sync = GetIt.instance<PluginSyncService>();
    if (!sync.pluginAvailable) return const [];
    final lists = mediaBarExternalLists(
      _prefs.homeSectionsConfig,
      tmdbAvailable: sync.tmdbAvailable,
    );
    final service = GetIt.instance<CustomExternalListsService>();
    final fetched = await Future.wait([
      for (final id in listIds)
        if (lists[id] case final config?)
          () async {
            try {
              final cached = await service.loadCustomRowFromCache(
                config,
                maxAge: CustomExternalListsService.cacheMaxAge,
              );
              return cached.isNotEmpty
                  ? cached
                  : await service.fetchCustomRow(config);
            } catch (_) {
              return const <ImdbExternalListItem>[];
            }
          }(),
    ]);

    final filter = activeParentalFilter;
    final seen = <String>{};
    final pool = <ImdbExternalListItem>[];
    for (final item in fetched.expand((items) => items)) {
      final key = _externalId(item);
      if (key.isEmpty || !seen.add(key)) continue;
      if (!itemTypes.contains(item.type)) continue;
      // A missing rating on an outside title means nobody looked it up, so
      // it stays out once the viewer blocks anything, as on Home.
      final rating = item.officialRating?.trim() ?? '';
      if (filter.isActive &&
          (rating.isEmpty || filter.isBlockedRating(rating))) {
        continue;
      }
      if ((item.backdropUrl ?? '').isEmpty && !sync.tmdbDetailsAvailable) {
        continue;
      }
      pool.add(item);
    }
    return pool..shuffle(_random);
  }

  /// [library] with titles from [external] shuffled in, [maxItems] in all.
  /// Only the outside titles that make the cut are looked up on TMDB.
  Future<List<MediaBarSlideItem>> _mixInExternal(
    List<MediaBarSlideItem> library,
    List<ImdbExternalListItem> external,
    int maxItems,
    Set<String> excludedGenres,
  ) async {
    if (external.isEmpty) return library;
    final shuffled = (<Object>[...library, ...external.take(maxItems)]
          ..shuffle(_random))
        .take(maxItems)
        .toList();
    // The shuffle only picks where outside titles go. Library slides keep
    // their order, so followed series stay first and types keep alternating.
    final inOrder = library.iterator;
    final chosen = [
      for (final pick in shuffled)
        if (pick is MediaBarSlideItem && inOrder.moveNext())
          inOrder.current
        else
          pick,
    ];
    final slides = <String, MediaBarSlideItem>{};
    await mapBounded(
      chosen.whereType<ImdbExternalListItem>().toList(),
      _sourceConcurrency,
      (item) async {
        final slide = await _toExternalSlide(item, excludedGenres);
        if (slide == null) return null;
        slides[slide.itemId] = slide;
        return null;
      },
    );
    return [
      for (final pick in chosen)
        if (pick is MediaBarSlideItem)
          pick
        else
          ?slides[_externalId(pick as ImdbExternalListItem)],
    ];
  }

  static String _externalId(ImdbExternalListItem item) =>
      item.tmdbId.isNotEmpty ? item.tmdbId : item.imdbId;

  /// The slide for an outside title, filled in from TMDB through Moonbase
  /// where it can be. Null when there is still no backdrop to show.
  /// Null too when one of its genres is excluded.
  Future<MediaBarSlideItem?> _toExternalSlide(
    ImdbExternalListItem item,
    Set<String> excludedGenres,
  ) async {
    final mediaType = item.type == 'Series' ? 'tv' : 'movie';
    final tmdbId = item.tmdbId.isNotEmpty ? item.tmdbId : null;
    final imdbId = item.imdbId.isNotEmpty ? item.imdbId : null;
    final details = GetIt.instance<PluginSyncService>().tmdbDetailsAvailable
        ? await GetIt.instance<TmdbRepository>().titleDetails(
            type: mediaType,
            tmdbId: tmdbId,
            imdbId: imdbId,
          )
        : null;

    final backdropUrl =
        _tmdbImage(details?['backdropPath'] as String?, 1280) ??
        _tmdbImage(item.backdropUrl, 1280);
    if (backdropUrl == null) return null;
    // Every genre counts here, not only the three the slide shows. The list's
    // own genres stand in when TMDB has nothing.
    final genres =
        (details?['genres'] as List?)?.cast<String>() ?? item.genres;
    if (genres.any(excludedGenres.contains)) return null;
    final runTimeTicks = (details?['runTimeTicks'] as num?)?.toInt();
    final trailerUrl = details?['trailerUrl'] as String?;

    return MediaBarSlideItem(
      itemId: _externalId(item),
      serverId: MediaBarSlideItem.externalServerId,
      title: item.title,
      overview: details?['overview'] as String?,
      backdropUrl: backdropUrl,
      logoUrl: _tmdbImage(details?['logoPath'] as String?, 500),
      posterUrl: _tmdbImage(item.posterUrl, 500),
      officialRating: item.officialRating,
      year: item.year,
      genres: genres.take(3).toList(),
      runtime: runTimeTicks != null
          ? Duration(microseconds: runTimeTicks ~/ 10)
          : null,
      communityRating:
          (details?['rating'] as num?)?.toDouble() ?? item.rating,
      tmdbId: tmdbId,
      imdbId: imdbId,
      itemType: item.type == 'Series' ? 'Series' : 'Movie',
      remoteTrailers: [
        if (trailerUrl != null) {'Url': trailerUrl},
      ],
    );
  }

  /// Outside lists hold either a TMDB image path or a full URL.
  static String? _tmdbImage(String? path, int width) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    return 'https://image.tmdb.org/t/p/w$width$path';
  }

  bool _hasBackdrop(Map<String, dynamic> item) {
    final tags = item['BackdropImageTags'] as List?;
    return tags != null && tags.isNotEmpty;
  }

  bool _isBoxSet(Map<String, dynamic> item) {
    return item['Type'] == 'BoxSet';
  }

  bool _hasExcludedGenre(Map<String, dynamic> item, Set<String> excluded) {
    if (excluded.isEmpty) return false;
    final genres = (item['Genres'] as List?)?.cast<String>() ?? [];
    return genres.any((g) => excluded.contains(g));
  }

  /// Items for the setup wizard previews, free of the bar's own rules.
  ///
  /// The bar refuses to run without a movies or series library, and again
  /// without backdrop artwork, and both refusals hold for the whole session
  /// no matter how often it is asked. The previews only need something real
  /// to draw, so this takes the newest items across everything the user can
  /// see and keeps whatever comes back, posters and all.
  Future<List<MediaBarSlideItem>> fetchPreviewItems({int limit = 10}) async {
    try {
      final response = await _client.itemsApi
          .getItems(
            includeItemTypes: const ['Movie', 'Series'],
            sortBy: 'DateCreated',
            sortOrder: 'Descending',
            recursive: true,
            limit: limit,
            fields: _fields,
          )
          .timeout(const Duration(seconds: 15));
      final items = (response['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      return items.map(_toSlideItem).toList(growable: false);
    } catch (_) {
      return const [];
    }
  }

  MediaBarSlideItem _toSlideItem(Map<String, dynamic> data) {
    final itemId = data['Id']?.toString() ?? '';
    final serverId = data['ServerId']?.toString() ?? '';
    final providerIds = data['ProviderIds'] as Map<String, dynamic>?;

    final backdropTags = data['BackdropImageTags'] as List?;
    final backdropUrl = (backdropTags != null && backdropTags.isNotEmpty)
        ? _client.imageApi.getBackdropImageUrl(
            itemId,
            tag: backdropTags[0] as String,
            maxWidth: 1280,
          )
        : null;

    final bannerTag = (data['ImageTags'] as Map?)?['Banner'] as String?;
    final bannerUrl = bannerTag != null
        ? _client.imageApi.getBannerImageUrl(
            itemId,
            tag: bannerTag,
            maxWidth: 1280,
          )
        : null;

    final logoTag = (data['ImageTags'] as Map?)?['Logo'] as String?;
    final logoUrl = logoTag != null
        ? _client.imageApi.getLogoImageUrl(itemId, tag: logoTag, maxWidth: 600)
        : null;

    final primaryTag = (data['ImageTags'] as Map?)?['Primary'] as String?;
    final posterUrl = _client.imageApi.getPrimaryImageUrl(
      itemId,
      tag: primaryTag,
      maxWidth: 600,
    );

    final runTimeTicks = data['RunTimeTicks'] as int?;

    return MediaBarSlideItem(
      itemId: itemId,
      serverId: serverId,
      title: data['Name'] as String? ?? '',
      overview: data['Overview'] as String?,
      backdropUrl: backdropUrl,
      bannerUrl: bannerUrl,
      logoUrl: logoUrl,
      posterUrl: posterUrl,
      officialRating: data['OfficialRating'] as String?,
      year: data['ProductionYear'] as int?,
      genres:
          (data['Genres'] as List?)?.cast<String>().take(3).toList() ??
          const [],
      runtime: runTimeTicks != null
          ? Duration(microseconds: runTimeTicks ~/ 10)
          : null,
      communityRating: (data['CommunityRating'] as num?)?.toDouble(),
      criticRating: (data['CriticRating'] as num?)?.toInt(),
      tmdbId: (providerIds?['Tmdb'] ?? providerIds?['tmdb'])?.toString(),
      imdbId: (providerIds?['Imdb'] ?? providerIds?['imdb'])?.toString(),
      itemType: data['Type'] as String? ?? 'Movie',
      remoteTrailers:
          (data['RemoteTrailers'] as List?)?.cast<Map<String, dynamic>>() ??
          const [],
      fullyWatched:
          data['Type'] == 'Series' && isRawItemWatchedForRecentRow(data),
    );
  }
}

/// The fewest episodes a season released at once has. A two episode premiere is
/// still a season aired week by week.
const _seasonDropEpisodes = 3;

/// An episode that is really on the server and aired within the last [days].
@visibleForTesting
bool isRecentlyAiredEpisode(
  Map<String, dynamic> episode, {
  required DateTime now,
  required int days,
}) {
  // A Virtual episode is one the server only knows from metadata.
  if (episode['LocationType'] == 'Virtual') return false;
  final aired = DateTime.tryParse(episode['PremiereDate'] as String? ?? '');
  if (aired == null) return false;
  return !aired.isAfter(now) && !aired.isBefore(now.subtract(Duration(days: days)));
}

int _seasonOf(Map<String, dynamic> episode) =>
    (episode['ParentIndexNumber'] as num?)?.toInt() ?? 0;

/// When an episode aired. Only called on episodes that passed
/// [isRecentlyAiredEpisode], so the date is there.
DateTime _airedAt(Map<String, dynamic> episode) =>
    DateTime.parse(episode['PremiereDate'] as String).toUtc();

/// The air day of an episode in UTC, or null when it has no air date.
String? _airDay(Map<String, dynamic> episode) {
  final aired = DateTime.tryParse(episode['PremiereDate'] as String? ?? '');
  if (aired == null) return null;
  final day = aired.toUtc();
  return '${day.year}-${day.month}-${day.day}';
}

/// The latest season's id when several of its recent episodes share an air
/// day, which is the only case worth fetching the whole season for.
@visibleForTesting
String? mediaBarSeasonToCheck(
  List<Map<String, dynamic>> recentEpisodes, {
  required DateTime now,
  required int days,
}) {
  final aired = [
    for (final episode in recentEpisodes)
      if (isRecentlyAiredEpisode(episode, now: now, days: days)) episode,
  ];
  if (aired.isEmpty) return null;

  final latestSeason = aired.map(_seasonOf).reduce(math.max);
  final perDay = <String, int>{};
  for (final episode in aired.where((e) => _seasonOf(e) == latestSeason)) {
    final day = _airDay(episode)!;
    perDay[day] = (perDay[day] ?? 0) + 1;
  }
  if (!perDay.values.any((count) => count >= _seasonDropEpisodes)) return null;
  return aired
      .firstWhere((e) => _seasonOf(e) == latestSeason)['SeasonId']
      ?.toString();
}

/// What aired lately for one series. [recentEpisodes] are the ones aired within
/// the window. [latestSeason] holds every episode of the latest season, when
/// [mediaBarSeasonToCheck] asked for it. A season whose episodes on the server
/// all came out on one day was released at once, the way a streaming service
/// drops one. Anything else is new episodes, a split season's second part
/// included.
@visibleForTesting
MediaBarNewReleaseInfo? mediaBarNewReleaseOf(
  List<Map<String, dynamic>> recentEpisodes, {
  List<Map<String, dynamic>>? latestSeason,
  required DateTime now,
  required int days,
}) {
  final aired = [
    for (final episode in recentEpisodes)
      if (isRecentlyAiredEpisode(episode, now: now, days: days)) episode,
  ];
  if (aired.isEmpty) return null;

  if (latestSeason != null) {
    final present = [
      for (final episode in latestSeason)
        if (episode['LocationType'] != 'Virtual') episode,
    ];
    final airDays = present.map(_airDay).toSet();
    if (present.length >= _seasonDropEpisodes &&
        airDays.length == 1 &&
        airDays.single != null) {
      final season = _seasonOf(present.first);
      return MediaBarNewReleaseInfo(
        kind: season <= 1
            ? MediaBarNewRelease.newSeries
            : MediaBarNewRelease.newSeason,
        season: season,
      );
    }
  }

  final season = aired.map(_seasonOf).reduce(math.max);
  final inSeason = [
    for (final episode in aired)
      if (_seasonOf(episode) == season) episode,
  ]..sort((a, b) => _airedAt(a).compareTo(_airedAt(b)));
  final latest = inSeason.last;

  return MediaBarNewReleaseInfo(
    kind: MediaBarNewRelease.newEpisodes,
    season: season,
    episode: (latest['IndexNumber'] as num?)?.toInt(),
  );
}

/// The label kinds picked in settings, from their stored comma list.
Set<String> mediaBarNewReleaseKindsOf(String stored) =>
    stored.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toSet();

/// The settings name of [kind], as stored in the kinds list.
String mediaBarNewReleaseKindName(MediaBarNewRelease kind) => switch (kind) {
  MediaBarNewRelease.newSeries => UserPreferences.mediaBarNewSeries,
  MediaBarNewRelease.newSeason => UserPreferences.mediaBarNewSeason,
  MediaBarNewRelease.newEpisodes => UserPreferences.mediaBarNewEpisodes,
  MediaBarNewRelease.newMovie => UserPreferences.mediaBarNewMovie,
  // Upcoming labels have their own switches rather than a place in the list.
  MediaBarNewRelease.upcomingEpisode => 'upcomingEpisode',
  MediaBarNewRelease.upcomingSeason => 'upcomingSeason',
  MediaBarNewRelease.upcomingSeries => 'upcomingSeries',
  MediaBarNewRelease.upcomingMovie => 'upcomingMovie',
};

/// Whether a movie's calendar date is the one it can be watched at home: the
/// digital release, or the physical one for a movie that has no digital date
/// at all. Never the physical date of a movie already out digitally.
@visibleForTesting
bool mediaBarIsHomeRelease(CalendarEntry entry) => switch (entry.release) {
  CalendarRelease.digital => true,
  CalendarRelease.physical => !entry.hasDigitalDate,
  _ => false,
};

/// The upcoming label for a calendar entry that hasn't come out yet. A
/// season's first episode announces the season, and season 1's the series.
/// Specials are left out.
@visibleForTesting
MediaBarNewReleaseInfo? mediaBarUpcomingOf(CalendarEntry entry) {
  if (entry.isMovie) {
    return MediaBarNewReleaseInfo(
      kind: MediaBarNewRelease.upcomingMovie,
      date: entry.date,
    );
  }
  final season = entry.seasonNumber ?? 0;
  if (season <= 0) return null;
  final premiere =
      entry.badge == CalendarBadge.seriesPremiere ||
      entry.badge == CalendarBadge.seasonPremiere ||
      entry.episodeNumber == 1;
  return MediaBarNewReleaseInfo(
    kind: !premiere
        ? MediaBarNewRelease.upcomingEpisode
        : season == 1
        ? MediaBarNewRelease.upcomingSeries
        : MediaBarNewRelease.upcomingSeason,
    season: season,
    episode: entry.episodeNumber,
    date: entry.date,
  );
}

/// The next episode due for each library series in [entries], by its id. Only
/// what hasn't aired and isn't on the server yet counts.
@visibleForTesting
Map<String, MediaBarNewReleaseInfo> mediaBarUpcomingBySeries(
  List<CalendarEntry> entries, {
  required DateTime now,
}) {
  final upcoming = <String, MediaBarNewReleaseInfo>{};
  final sorted = [...entries]..sort((a, b) => a.date.compareTo(b.date));
  for (final entry in sorted) {
    final id = entry.itemId;
    if (!entry.isEpisode || id == null || upcoming.containsKey(id)) continue;
    if (entry.hasFile || entry.statusAt(now) != CalendarStatus.upcoming) {
      continue;
    }
    final info = mediaBarUpcomingOf(entry);
    if (info != null) upcoming[id] = info;
  }
  return upcoming;
}

/// Whether every episode that aired within the window is watched, or nothing
/// aired at all. Either way there's nothing new left to watch. Every one, not
/// the latest: a season out in one day has no single latest episode.
@visibleForTesting
bool mediaBarCaughtUp(
  List<Map<String, dynamic>> recentEpisodes, {
  required DateTime now,
  required int days,
}) {
  final aired = [
    for (final episode in recentEpisodes)
      if (isRecentlyAiredEpisode(episode, now: now, days: days)) episode,
  ];
  return aired.every((episode) {
    final userData = episode['UserData'];
    return userData is Map && userData['Played'] == true;
  });
}

/// The label a series slide gets: what aired lately while there's some of it
/// left to watch, else what comes next, else what aired.
@visibleForTesting
MediaBarNewReleaseInfo? mediaBarSeriesLabel({
  MediaBarNewReleaseInfo? past,
  MediaBarNewReleaseInfo? upcoming,
  required bool caughtUp,
}) {
  if (past != null && !caughtUp) return past;
  return upcoming ?? past;
}

/// [slides] with [reserved] placed from the second slide on, so the first
/// stays something to watch. Each one takes the place of a slide of its own
/// type when there is one further on, so a mix of movies and series keeps
/// alternating and the count stays the same. Otherwise it goes in.
@visibleForTesting
List<MediaBarSlideItem> mediaBarPlaceReserved(
  List<MediaBarSlideItem> slides,
  List<MediaBarSlideItem> reserved,
  int maxItems,
) {
  final result = [
    for (final slide in slides)
      if (!reserved.any((r) => r.itemId == slide.itemId)) slide,
  ];
  final placed = <String>{};
  var at = 1;
  for (final slide in reserved) {
    // A title already among the slides only moves, so no other one goes.
    final moved = slides.any((s) => s.itemId == slide.itemId);
    if (result.isEmpty) {
      // An outside title can't be played, so it never leads the bar.
      if (slide.isExternal) continue;
      result.add(slide);
    } else {
      final start = at.clamp(1, result.length);
      final same = moved
          ? -1
          : result.indexWhere(
              (s) => s.itemType == slide.itemType && !placed.contains(s.itemId),
              start,
            );
      if (same >= 0) {
        result[same] = slide;
      } else {
        result.insert(start, slide);
      }
    }
    placed.add(slide.itemId);
    at += 2;
  }
  return result.take(maxItems).toList();
}

/// Why [item] is a new movie, or null when it isn't one. By release date, it
/// came out within the last [days]. By date added, it reached the server
/// within the last [days] and came out within the last [maxAgeMonths], so an
/// old film added today doesn't count.
@visibleForTesting
MediaBarNewReleaseInfo? mediaBarNewMovieOf(
  Map<String, dynamic> item, {
  required bool byDateAdded,
  required int days,
  required int maxAgeMonths,
  required DateTime now,
}) {
  if (item['Type'] != 'Movie') return null;
  final released = DateTime.tryParse(item['PremiereDate'] as String? ?? '');
  final floor = now.subtract(Duration(days: days));
  bool inWindow(DateTime date) => !date.isAfter(now) && !date.isBefore(floor);

  // Jellyfin only keeps taglines in its metadata language, so there's never
  // an English one standing in for a missing French one.
  final tagline = (item['Taglines'] as List?)
      ?.whereType<String>()
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .firstOrNull;

  if (!byDateAdded) {
    if (released == null || !inWindow(released)) return null;
    return MediaBarNewReleaseInfo(
      kind: MediaBarNewRelease.newMovie,
      date: released,
      tagline: tagline,
    );
  }

  final added = DateTime.tryParse(item['DateCreated'] as String? ?? '');
  if (added == null || !inWindow(added)) return null;
  final oldest = DateTime(now.year, now.month - maxAgeMonths, now.day);
  if (released == null || released.isBefore(oldest)) return null;
  return MediaBarNewReleaseInfo(
    kind: MediaBarNewRelease.newMovie,
    date: added,
    tagline: tagline,
  );
}

/// Whether a new movie is rated at least [minTenths] tenths of a point out of
/// 10, so 65 asks for 6.5. The cached MDBList score wins over the server's own
/// rating, which is the one from the day the movie arrived. A movie with no
/// rating at all doesn't pass a minimum.
@visibleForTesting
bool mediaBarMeetsMinRating({
  double? cached,
  double? community,
  required int minTenths,
}) {
  if (minTenths <= 0) return true;
  final score = cached ?? community;
  // Rounded, so a 6.5 stored as 6.4999 still reaches 65.
  return score != null && (score * 10).round() >= minTenths;
}

/// [items] with series and movies taking turns, starting with whichever comes
/// first. When one kind runs out, the other fills the rest, so the bar never
/// shows fewer slides for it. Anything else keeps its place in the queue of
/// the kind it's not, after both.
@visibleForTesting
List<Map<String, dynamic>> mediaBarAlternateTypes(
  List<Map<String, dynamic>> items,
) {
  final series = [for (final item in items) if (item['Type'] == 'Series') item];
  final movies = [for (final item in items) if (item['Type'] == 'Movie') item];
  final others = [
    for (final item in items)
      if (item['Type'] != 'Series' && item['Type'] != 'Movie') item,
  ];
  final result = <Map<String, dynamic>>[];
  var seriesTurn = items.isNotEmpty && items.first['Type'] == 'Series';
  var s = 0, m = 0;
  while (s < series.length || m < movies.length) {
    if ((seriesTurn && s < series.length) || m >= movies.length) {
      result.add(series[s++]);
    } else {
      result.add(movies[m++]);
    }
    seriesTurn = !seriesTurn;
  }
  return [...result, ...others];
}

/// A series the user has watched part of.
@visibleForTesting
bool mediaBarIsFollowedSeries(Map<String, dynamic> item) {
  if (item['Type'] != 'Series') return false;
  final userData = item['UserData'];
  if (userData is! Map) return false;
  final played = (userData['PlayedPercentage'] as num?)?.toDouble() ?? 0;
  return played > 0 || userData['Played'] == true;
}

// A mixed library names no collection type, so the bar takes it for either
// kind. Folders and recordings name none either, but a query on one of those
// reaches every library, so they go out by name.
bool supportsMediaBarLibrary(
  Map<String, dynamic> view,
  List<String> preferredTypes,
) {
  final name = (view['Name']?.toString() ?? '').trim().toLowerCase();
  if (name == 'folders' || name == 'recordings') return false;

  final type = (view['CollectionType']?.toString() ?? '').trim().toLowerCase();
  if (type.isEmpty || type == 'mixed' || type == 'unknown') return true;

  return preferredTypes.contains(type);
}

/// The outside lists the bar can draw from, by the id each one's home row has,
/// in the order the picker shows them: the IMDb charts, the TMDB charts when
/// the server has a TMDB key, then the user's custom rows.
Map<String, HomeSectionConfig> mediaBarExternalLists(
  List<HomeSectionConfig> sections, {
  required bool tmdbAvailable,
}) {
  // Built the way Home builds these rows, so both read the same cached list.
  HomeSectionConfig chart(HomeSectionType type, String source, String path) =>
      HomeSectionConfig.pluginDynamic(
        serverId: MediaBarSlideItem.externalServerId,
        pluginSection: type.serializedName,
        pluginDisplayText: type.serializedName,
        pluginSource: HomeSectionPluginSource.custom,
        pluginAdditionalData: jsonEncode({'source': source, 'type': path}),
      );
  return {
    for (final type in imdbChartSections)
      type.serializedName: chart(type, 'imdb', type.serializedName),
    if (tmdbAvailable)
      for (final entry in tmdbChartPaths.entries)
        entry.key.serializedName: chart(entry.key, 'tmdb_chart', entry.value),
    for (final section in sections)
      if (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.custom &&
          (section.pluginSection ?? '').isNotEmpty)
        section.pluginSection!: section,
  };
}
