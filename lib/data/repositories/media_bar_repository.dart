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

      if (selected.isEmpty) {
        return const MediaBarError('No items with backdrop images found');
      }

      final items = selected.map(_toSlideItem).toList();
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
