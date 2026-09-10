import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';

class ScreensaverItem {
  const ScreensaverItem({
    required this.name,
    required this.backdropUrl,
    this.logoUrl,
  });

  final String name;
  final String backdropUrl;
  final String? logoUrl;
}

class ScreensaverContentService {
  ScreensaverContentService(this._prefs);

  final UserPreferences _prefs;

  static const _batchSize = 60;

  List<String> _splitCsv(String value) {
    return value.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }

  bool _hasExcludedGenre(Map<String, dynamic> item, Set<String> excluded) {
    if (excluded.isEmpty) return false;
    final genres = (item['Genres'] as List?)?.cast<String>() ?? [];
    return genres.any((g) => excluded.contains(g));
  }

  Future<List<ScreensaverItem>> loadBatch() async {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) {
      return const [];
    }
    final client = GetIt.instance<MediaServerClient>();
    final maxAge = _prefs.get(UserPreferences.screensaverMaxAgeRating);
    final requireRating = _prefs.get(UserPreferences.screensaverRequireRating);
    final contentType = _prefs.get(UserPreferences.screensaverContentType);
    final libraryIds =
        _splitCsv(_prefs.get(UserPreferences.screensaverLibraryIds));
    final collectionIds =
        _splitCsv(_prefs.get(UserPreferences.screensaverCollectionIds));
    final excludedGenres =
        _splitCsv(_prefs.get(UserPreferences.screensaverExcludedGenres)).toSet();

    final includeItemTypes = switch (contentType) {
      'movies' => const ['Movie'],
      'tvshows' => const ['Series'],
      _ => const ['Movie', 'Series'],
    };

    try {
      final targetParentIds = <String>[];
      if (libraryIds.isNotEmpty || collectionIds.isNotEmpty) {
        targetParentIds.addAll(libraryIds);
        targetParentIds.addAll(collectionIds);
      } else {
        final viewsResponse = await client.userViewsApi.getUserViews();
        final views = (viewsResponse['Items'] as List? ?? [])
            .cast<Map<String, dynamic>>();
        for (final view in views) {
          final type = view['CollectionType'] as String? ?? '';
          final shouldInclude = switch (contentType) {
            'movies' => type == 'movies' || type.isEmpty,
            'tvshows' => type == 'tvshows' || type.isEmpty,
            _ => type == 'movies' || type == 'tvshows' || type.isEmpty,
          };
          final id = view['Id'] as String?;
          if (shouldInclude && id != null) {
            targetParentIds.add(id);
          }
        }
      }

      final random = Random();
      final sortByOptions = ['DateCreated', 'CommunityRating'];
      final sortOrderOptions = ['Descending', 'Ascending'];
      final sortBy = sortByOptions[random.nextInt(sortByOptions.length)];
      final sortOrder =
          sortOrderOptions[random.nextInt(sortOrderOptions.length)];
      final startIndex = [0, 30, 60, 90][random.nextInt(4)];

      final rawItems = <Map<String, dynamic>>[];
      if (targetParentIds.isNotEmpty) {
        final results = await Future.wait(
          targetParentIds.map((parentId) async {
            try {
              return await _fetchItems(
                client,
                parentId: parentId,
                includeItemTypes: includeItemTypes,
                sortBy: sortBy,
                sortOrder: sortOrder,
                startIndex: startIndex,
                maxAge: maxAge,
                requireRating: requireRating,
              );
            } catch (_) {
              return <Map<String, dynamic>>[];
            }
          }),
        );
        for (final result in results) {
          rawItems.addAll(result);
        }
      } else {
        rawItems.addAll(
          await _fetchItems(
            client,
            includeItemTypes: includeItemTypes,
            sortBy: sortBy,
            sortOrder: sortOrder,
            startIndex: startIndex,
            maxAge: maxAge,
            requireRating: requireRating,
          ),
        );
      }

      rawItems.shuffle();

      final items = <ScreensaverItem>[];
      for (final raw in rawItems) {
        if (_hasExcludedGenre(raw, excludedGenres)) continue;
        final item = _toItem(client, raw, requireRating: requireRating);
        if (item != null) {
          items.add(item);
        }
      }

      return items.take(_batchSize).toList();
    } catch (_) {
      return const [];
    }
  }

  Future<List<Map<String, dynamic>>> _fetchItems(
    MediaServerClient client, {
    String? parentId,
    required List<String> includeItemTypes,
    required String sortBy,
    required String sortOrder,
    required int startIndex,
    required String maxAge,
    required bool requireRating,
  }) async {
    Future<List<Map<String, dynamic>>> query(int start) async {
      final response = await client.itemsApi.getItems(
        parentId: parentId,
        includeItemTypes: includeItemTypes,
        sortBy: sortBy,
        sortOrder: sortOrder,
        recursive: true,
        startIndex: start,
        limit: _batchSize,
        fields: 'ImageTags,BackdropImageTags,OfficialRating,Genres',
        enableTotalRecordCount: false,
        enableImageTypes: 'Backdrop,Logo',
        maxOfficialRating: maxAge == 'any' ? null : maxAge,
        hasParentalRating: requireRating ? true : null,
      );
      return (response['Items'] as List? ?? []).cast<Map<String, dynamic>>();
    }

    final items = await query(startIndex);
    // A random offset can overshoot a small library and return nothing, so
    // retry from the start to avoid an empty batch.
    if (items.isEmpty && startIndex > 0) {
      return query(0);
    }
    return items;
  }

  ScreensaverItem? _toItem(
    MediaServerClient client,
    Map<String, dynamic> raw, {
    required bool requireRating,
  }) {
    final id = raw['Id']?.toString() ?? '';
    if (id.isEmpty) return null;
    if (requireRating &&
        ((raw['OfficialRating'] as String?)?.isEmpty ?? true)) {
      return null;
    }

    String? backdropUrl;
    final backdropTags = raw['BackdropImageTags'] as List?;
    if (backdropTags != null && backdropTags.isNotEmpty) {
      backdropUrl = client.imageApi.getBackdropImageUrl(
        id,
        maxWidth: 1920,
        tag: backdropTags.first as String?,
      );
    } else {
      final parentId = raw['ParentBackdropItemId']?.toString();
      final parentTags = raw['ParentBackdropImageTags'] as List?;
      if (parentId != null && parentTags != null && parentTags.isNotEmpty) {
        backdropUrl = client.imageApi.getBackdropImageUrl(
          parentId,
          maxWidth: 1920,
          tag: parentTags.first as String?,
        );
      }
    }
    if (backdropUrl == null) return null;

    String? logoUrl;
    final logoTag = (raw['ImageTags'] as Map?)?['Logo'] as String?;
    if (logoTag != null && logoTag.isNotEmpty) {
      logoUrl = client.imageApi.getLogoImageUrl(
        id,
        maxWidth: 800,
        tag: logoTag,
      );
    }

    return ScreensaverItem(
      name: raw['Name'] as String? ?? '',
      backdropUrl: backdropUrl,
      logoUrl: logoUrl,
    );
  }
}
