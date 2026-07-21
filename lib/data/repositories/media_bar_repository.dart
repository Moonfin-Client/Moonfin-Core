import 'dart:async';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../models/media_bar_slide_item.dart';
import '../models/media_bar_state.dart';
import '../services/custom_external_lists_service.dart';
import '../services/external_list_registry.dart';
import '../services/seerr/seerr_api_models.dart';
import '../utils/tmdb_image.dart';
import 'seerr_repository.dart';
import 'tmdb_repository.dart';

class MediaBarRepository {
  static const _precacheBackdropCount = 1;
  static const _precacheLogoCount = 1;

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
    final pluginSyncEnabled = _prefs.get(UserPreferences.pluginSyncEnabled);

    final maxItems = pluginSyncEnabled
        ? (int.tryParse(_prefs.get(UserPreferences.mediaBarItemCount)) ?? 10)
        : 5;
    final libraryIds = pluginSyncEnabled
        ? _prefs
              .get(UserPreferences.mediaBarLibraryIds)
              .split(',')
              .where((s) => s.isNotEmpty)
              .toList()
        : <String>[];
    final collectionIds = pluginSyncEnabled
        ? _prefs
              .get(UserPreferences.mediaBarCollectionIds)
              .split(',')
              .where((s) => s.isNotEmpty)
              .toList()
        : <String>[];
    final excludedGenres = _prefs
        .get(UserPreferences.mediaBarExcludedGenres)
        .split(',')
        .where((s) => s.isNotEmpty)
        .toSet();

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
        final type = _normalizeCollectionType(view['CollectionType']);
        if (viewId != null && preferredCollectionTypes.contains(type)) {
          validLibraryIds.add(viewId);
          if (type == 'movies') {
            allParentItemTypes[viewId] = const ['Movie'];
          } else if (type == 'tvshows') {
            allParentItemTypes[viewId] = const ['Series'];
          }
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
      // Fallback: If UserViews lookup fails, trust user's selection directly
      allParentIds.addAll(libraryIds);
      allParentIds.addAll(collectionIds);
    }

    try {
      final allItems = <Map<String, dynamic>>[];

      if (allParentIds.isEmpty) {
        return const MediaBarDisabled();
      } else {
        for (final parentId in allParentIds) {
          if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
              GetIt.instance<MediaBarRepository>() != this) {
            return const MediaBarDisabled();
          }
          try {
            final targetTypes = allParentItemTypes[parentId] ?? includeTypes;
            final batch = await _fetchItems(
              targetTypes,
              fetchLimit,
              parentId: parentId,
            );
            allItems.addAll(batch);
          } catch (_) {
            // Keep fetching remaining libraries if one fails
          }
        }
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

      final externalSlides = await _buildExternalSlides(contentType);

      if (externalSlides.isEmpty) {
        if (selected.isEmpty) {
          return const MediaBarError('No items with backdrop images found');
        }
        return MediaBarReady(selected.map(_toSlideItem).toList());
      }

      // Additive mix: external items share the pool with library items, then the
      // whole thing is shuffled and trimmed so both sources get a fair showing.
      final libraryItems = selected.map(_toSlideItem).toList();
      final combined = <MediaBarSlideItem>[...libraryItems, ...externalSlides]
        ..shuffle();
      final trimmed = combined.take(maxItems).toList();
      final enriched = await _enrichExternalSlides(trimmed);
      return MediaBarReady(enriched);
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
      return MediaBarError('Failed to load: $e');
    }
  }

  List<Map<String, dynamic>> _selectItemsWithBackdrops(
    List<Map<String, dynamic>> source,
    int maxItems,
    Set<String> excludedGenres,
  ) {
    final withBackdrops =
        source
            .where(
              (item) =>
                  _hasBackdrop(item) &&
                  !_isBoxSet(item) &&
                  !_hasExcludedGenre(item, excludedGenres),
            )
            .toList()
          ..shuffle();
    return withBackdrops.take(maxItems).toList();
  }

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
          final collectionType = _normalizeCollectionType(
            view['CollectionType'],
          );
          if (collectionType != 'tvshows' && collectionType != 'movies') {
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

      return _fetchItems(itemTypes, limit, parentId: libraryId);
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  String _normalizeCollectionType(Object? value) {
    return value?.toString().trim().toLowerCase() ?? '';
  }

  void precacheImages(BuildContext context, List<MediaBarSlideItem> items) {
    for (final item in items.take(_precacheBackdropCount)) {
      if (item.backdropUrl != null) {
        precacheImage(CachedNetworkImageProvider(item.backdropUrl!), context);
      }
    }
    for (final item in items.take(_precacheLogoCount)) {
      if (item.logoUrl != null) {
        precacheImage(CachedNetworkImageProvider(item.logoUrl!), context);
      }
    }
  }

  Future<List<Map<String, dynamic>>> _fetchItems(
    List<String>? itemTypes,
    int limit, {
    String? parentId,
  }) async {
    if (!GetIt.instance.isRegistered<MediaBarRepository>() ||
        GetIt.instance<MediaBarRepository>() != this) {
      return const <Map<String, dynamic>>[];
    }
    try {
      // Get the total count for this parent so we can pick a random window.
      // Asking for a single item keeps it cheap.
      final countResponse = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: parentId == null,
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
      const requestLimit = 40;
      final windowSize = math.min(total, requestLimit);
      final maxStartIndex = total - windowSize;
      final startIndex = maxStartIndex > 0
          ? _random.nextInt(maxStartIndex + 1)
          : 0;

      final windowResponse = await _client.itemsApi
          .getItems(
            includeItemTypes: itemTypes,
            sortBy: 'SortName',
            sortOrder: 'Ascending',
            recursive: parentId == null,
            parentId: parentId,
            startIndex: startIndex,
            limit: windowSize,
            fields: _fields,
            enableTotalRecordCount: false,
            enableImageTypes: 'Backdrop,Logo',
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
            enableImageTypes: 'Backdrop,Logo',
          )
          .timeout(const Duration(seconds: 15));
      final rawItems = fallbackResponse['Items'] as List? ?? [];
      return rawItems.cast<Map<String, dynamic>>();
    } catch (_) {
      return const <Map<String, dynamic>>[];
    }
  }

  bool _hasBackdrop(Map<String, dynamic> item) {
    final tags = item['BackdropImageTags'] as List?;
    return tags != null && tags.isNotEmpty;
  }

  List<String> _selectedExternalListIds() {
    return _prefs
        .get(UserPreferences.mediaBarExternalListIds)
        .split(',')
        .where((s) => s.isNotEmpty)
        .toList();
  }

  // Fetches the selected external lists and turns their entries into slides. These
  // are TMDB/Seerr items, so they carry a tmdb backdrop rather than a Jellyfin one
  // and are tagged with a seerr server id so tapping routes to the right screen.
  Future<List<MediaBarSlideItem>> _buildExternalSlides(String contentType) async {
    final ids = _selectedExternalListIds();
    if (ids.isEmpty) return const [];
    if (!GetIt.instance.isRegistered<CustomExternalListsService>()) {
      return const [];
    }

    final service = GetIt.instance<CustomExternalListsService>();
    final configs = resolveExternalListConfigs(_prefs, ids);
    if (configs.isEmpty) return const [];

    final lists = await Future.wait(
      configs.map(
        (c) => service
            .fetchCustomRow(c)
            .catchError((_) => <ImdbExternalListItem>[]),
      ),
    );

    final wantMovie = contentType != 'tvshows';
    final wantSeries = contentType != 'movies';
    final seen = <String>{};
    final slides = <MediaBarSlideItem>[];
    for (final list in lists) {
      for (final item in list) {
        final slide = _toExternalSlideItem(item);
        if (slide == null) continue;
        final isSeries = slide.itemType == 'Series';
        if (isSeries ? !wantSeries : !wantMovie) continue;
        if (!seen.add(slide.itemId)) continue;
        slides.add(slide);
      }
    }
    return slides;
  }

  MediaBarSlideItem? _toExternalSlideItem(ImdbExternalListItem item) {
    final id = item.imdbId.isNotEmpty ? item.imdbId : item.tmdbId;
    if (id.isEmpty) return null;

    // The media bar needs a backdrop, so fall back to the poster like the home rows
    // do rather than dropping a poster-only entry.
    final backdrop = tmdbImageUrl(item.backdropUrl ?? item.posterUrl, 1280);
    if (backdrop == null) return null;

    return MediaBarSlideItem(
      itemId: id,
      serverId: 'seerr',
      title: item.title,
      backdropUrl: backdrop,
      posterUrl: tmdbImageUrl(item.posterUrl, 600),
      year: item.year,
      tmdbId: item.tmdbId.isNotEmpty ? item.tmdbId : null,
      imdbId: item.imdbId.isNotEmpty ? item.imdbId : null,
      itemType: item.type,
    );
  }

  // The list fetch only gives images and a title, so pull the rest of what the media
  // bar shows for the external slides that survived the trim: a TMDB title logo, plus
  // the overview, genres, runtime, community rating, and trailers from Seerr. Only the
  // shown slides are fetched, and anything that fails just stays unset.
  Future<List<MediaBarSlideItem>> _enrichExternalSlides(
    List<MediaBarSlideItem> slides,
  ) async {
    final hasTmdb = GetIt.instance.isRegistered<TmdbRepository>();
    final hasSeerr = GetIt.instance.isRegistered<SeerrRepository>();
    if (!hasTmdb && !hasSeerr) return slides;

    final result = List<MediaBarSlideItem>.from(slides);
    await Future.wait([
      for (var i = 0; i < slides.length; i++)
        if (slides[i].serverId == 'seerr' &&
            (slides[i].tmdbId?.isNotEmpty ?? false))
          _enrichExternalSlide(result, i, hasTmdb: hasTmdb, hasSeerr: hasSeerr),
    ]);
    return result;
  }

  Future<void> _enrichExternalSlide(
    List<MediaBarSlideItem> slides,
    int index, {
    required bool hasTmdb,
    required bool hasSeerr,
  }) async {
    final slide = slides[index];
    final tmdbId = slide.tmdbId!;
    final isTv = slide.itemType == 'Series';

    String? logo;
    _ExternalMeta? meta;
    await Future.wait([
      if (hasTmdb && slide.logoUrl == null)
        GetIt.instance<TmdbRepository>()
            .getTitleLogo(tmdbId: tmdbId, type: isTv ? 'tv' : 'movie')
            .then((value) => logo = value),
      if (hasSeerr) _fetchExternalMeta(tmdbId, isTv).then((value) => meta = value),
    ]);

    slides[index] = slide.copyWith(
      logoUrl: logo,
      overview: meta?.overview,
      genres: meta?.genres,
      runtime: meta?.runtime,
      communityRating: meta?.communityRating,
      remoteTrailers: meta?.remoteTrailers,
    );
  }

  Future<_ExternalMeta?> _fetchExternalMeta(String tmdbId, bool isTv) async {
    final id = int.tryParse(tmdbId);
    if (id == null) return null;
    final repo = GetIt.instance<SeerrRepository>();
    try {
      if (isTv) {
        final details = await repo.getTvDetails(id);
        return _ExternalMeta(
          overview: details.overview,
          genres: details.genres.map((g) => g.name).take(3).toList(),
          runtime: null,
          communityRating: details.voteAverage,
          remoteTrailers: _trailersFrom(details.relatedVideos),
        );
      }
      final details = await repo.getMovieDetails(id);
      final minutes = details.runtime;
      return _ExternalMeta(
        overview: details.overview,
        genres: details.genres.map((g) => g.name).take(3).toList(),
        runtime: minutes != null && minutes > 0 ? Duration(minutes: minutes) : null,
        communityRating: details.voteAverage,
        remoteTrailers: _trailersFrom(details.relatedVideos),
      );
    } catch (_) {
      return null;
    }
  }

  List<Map<String, dynamic>> _trailersFrom(List<SeerrVideo> videos) {
    final trailers = <Map<String, dynamic>>[];
    for (final video in videos) {
      var url = video.url;
      if ((url == null || url.isEmpty) &&
          video.site?.toLowerCase() == 'youtube' &&
          (video.key?.isNotEmpty ?? false)) {
        url = 'https://www.youtube.com/watch?v=${video.key}';
      }
      if (url == null || url.isEmpty) continue;
      trailers.add({'Url': url, 'Name': video.name ?? ''});
    }
    return trailers;
  }

  bool _isBoxSet(Map<String, dynamic> item) {
    return item['Type'] == 'BoxSet';
  }

  bool _hasExcludedGenre(Map<String, dynamic> item, Set<String> excluded) {
    if (excluded.isEmpty) return false;
    final genres = (item['Genres'] as List?)?.cast<String>() ?? [];
    return genres.any((g) => excluded.contains(g));
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

/// The extra fields pulled from Seerr to flesh out an external slide.
class _ExternalMeta {
  final String? overview;
  final List<String> genres;
  final Duration? runtime;
  final double? communityRating;
  final List<Map<String, dynamic>> remoteTrailers;

  const _ExternalMeta({
    required this.overview,
    required this.genres,
    required this.runtime,
    required this.communityRating,
    required this.remoteTrailers,
  });
}
