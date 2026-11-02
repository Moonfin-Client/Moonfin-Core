import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../preference/home_section_config.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/tmdb_thumb.dart';
import '../models/media_bar_slide_item.dart';
import '../models/media_bar_state.dart';
import '../services/custom_external_lists_service.dart';
import '../services/library_scope_service.dart';
import '../services/plugin_sync_service.dart';
import '../utils/blocked_ratings.dart';
import '../utils/bounded_concurrency.dart';
import 'tmdb_repository.dart';

class MediaBarRepository {

  final MediaServerClient _client;
  final UserPreferences _prefs;
  final _random = math.Random();

  static const _fields =
      'Type,Genres,OfficialRating,CommunityRating,CriticRating,'
      'RunTimeTicks,ProductionYear,ImageTags,BackdropImageTags,'
      'Overview,ProviderIds';

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
          if (usableCount >= enough) return null;
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

      var selected = _selectItemsWithBackdrops(
        allItems,
        maxItems,
        excludedGenres,
      );

      if (selected.isEmpty && allParentIds.isNotEmpty) {
        final fallbackItems = <Map<String, dynamic>>[];
        final targetTypes = allParentItemTypes[allParentIds.first] ?? includeTypes;
        fallbackItems.addAll(
          await _fetchItems(
            targetTypes,
            fetchLimit,
            parentId: allParentIds.first,
          ),
        );

        selected = _selectItemsWithBackdrops(
          fallbackItems,
          maxItems,
          excludedGenres,
        );
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

      final items = await _mixInExternal(
        selected.map(_toSlideItem).toList(),
        externalPool,
        maxItems,
        excludedGenres,
      );
      if (items.isEmpty) {
        return const MediaBarError('No items with backdrop images found');
      }
      return MediaBarReady(items);
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
        final items = selected.map(_toSlideItem).toList();
        return MediaBarReady(items);
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
    return withBackdrops.take(maxItems).toList();
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

      return await _fetchItems(itemTypes, limit, parentId: libraryId);
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  String _normalizeCollectionType(Object? value) {
    return value?.toString().trim().toLowerCase() ?? '';
  }

  /// How many titles each source hands the selector. The random source reads
  /// this many from a random place in the library, and the dated ones read
  /// this many of the newest.
  static const _poolSize = 40;

  /// How many libraries and collections are read at once.
  static const _sourceConcurrency = 6;

  Future<List<Map<String, dynamic>>> _fetchItems(
    List<String>? itemTypes,
    int limit, {
    String? parentId,
  }) async {
    if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
        GetIt.instance<MediaBarRepository>() != this) {
      return const <Map<String, dynamic>>[];
    }
    final sourceType = _prefs.get(UserPreferences.mediaBarSourceType);
    if (sourceType == UserPreferences.mediaBarSourceRecentlyAdded ||
        sourceType == UserPreferences.mediaBarSourceRecentlyReleased) {
      return _fetchDatedItems(sourceType, itemTypes, limit, parentId: parentId);
    }
    try {
      // Get the total count for this parent so we can pick a random window.
      // Asking for a single item keeps it cheap.
      final countResponse = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            // A library the user has grouped with others holds those libraries
            // rather than the titles, so only a recursive walk reaches anything.
            // The type filter keeps the walk to movies and series either way.
            recursive: true,
            parentId: parentId,
            limit: 1,
            enableTotalRecordCount: true,
          )
          .timeout(const Duration(seconds: 15));

      final total = countResponse['TotalRecordCount'] as int? ?? 0;

      if (total <= 0) {
        return const <Map<String, dynamic>>[];
      }

      // Fetch a random window with the fields and backdrop tags the selector
      // needs. A small library takes its whole set starting from the first item.
      final windowSize = math.min(total, _poolSize);
      final maxStartIndex = total - windowSize;
      final startIndex = maxStartIndex > 0
          ? _random.nextInt(maxStartIndex + 1)
          : 0;

      final windowResponse = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: true,
            parentId: parentId,
            startIndex: startIndex,
            limit: windowSize,
            fields: _fields,
            enableTotalRecordCount: false,
            enableImageTypes: 'Backdrop,Logo,Banner',
          )
          .timeout(const Duration(seconds: 15));

      final windowItems = windowResponse['Items'] as List? ?? [];
      final rawItems = windowItems.cast<Map<String, dynamic>>().toList();

      // Shuffle locally to provide a fresh random feel on every launch
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

      final rawItems = response['Items'] as List? ?? [];
      return rawItems.cast<Map<String, dynamic>>();
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
    final chosen = (<Object>[...library, ...external.take(maxItems)]
          ..shuffle(_random))
        .take(maxItems)
        .toList();
    final slides = <String, MediaBarSlideItem>{};
    await mapBounded(
      chosen.whereType<ImdbExternalListItem>().toList(),
      _sourceConcurrency,
      (item) async {
        final slide = await _toExternalSlide(item);
        if (slide == null || slide.genres.any(excludedGenres.contains)) {
          return null;
        }
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
  Future<MediaBarSlideItem?> _toExternalSlide(ImdbExternalListItem item) async {
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
    final runTimeTicks = (details?['runTimeTicks'] as num?)?.toInt();
    final trailerUrl = details?['trailerUrl'] as String?;

    return MediaBarSlideItem(
      itemId: _externalId(item),
      serverId: MediaBarSlideItem.externalServerId,
      title: item.title,
      overview: details?['overview'] as String?,
      backdropUrl: backdropUrl,
      bannerUrl: seerrThumbUrl(type: mediaType, tmdbId: tmdbId, imdbId: imdbId),
      logoUrl: _tmdbImage(details?['logoPath'] as String?, 500),
      posterUrl: _tmdbImage(item.posterUrl, 500),
      officialRating: item.officialRating,
      year: item.year,
      genres:
          (details?['genres'] as List?)?.cast<String>().take(3).toList() ??
          const [],
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
    );
  }
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
