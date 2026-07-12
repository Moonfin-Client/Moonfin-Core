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

  Future<List<ScreensaverItem>> loadBatch() async {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) {
      return const [];
    }
    final client = GetIt.instance<MediaServerClient>();
    final maxAge = _prefs.get(UserPreferences.screensaverMaxAgeRating);
    final requireRating = _prefs.get(UserPreferences.screensaverRequireRating);
    try {
      final viewsResponse = await client.userViewsApi.getUserViews();
      final views = (viewsResponse['Items'] as List? ?? [])
          .cast<Map<String, dynamic>>();
      final targetLibraries = views.where((view) {
        final type = view['CollectionType'] as String? ?? '';
        return type == 'movies' || type == 'tvshows';
      }).toList();

      final List<Map<String, dynamic>> rawItems = [];

      final random = DateTime.now().millisecondsSinceEpoch;
      final sortByOptions = ['DateCreated', 'CommunityRating'];
      final sortOrderOptions = ['Descending', 'Ascending'];

      final sortBy = sortByOptions[random % sortByOptions.length];
      final sortOrder = sortOrderOptions[(random ~/ 2) % sortOrderOptions.length];
      final startIndex = [0, 30, 60, 90][(random ~/ 4) % 4];

      if (targetLibraries.isNotEmpty) {
        for (final lib in targetLibraries) {
          final libId = lib['Id'] as String;
          try {
            final response = await client.itemsApi.getItems(
              parentId: libId,
              includeItemTypes: ['Movie', 'Series'],
              sortBy: sortBy,
              sortOrder: sortOrder,
              recursive: true,
              startIndex: startIndex,
              limit: _batchSize,
              fields: 'ImageTags,BackdropImageTags,OfficialRating',
              enableTotalRecordCount: false,
              enableImageTypes: 'Backdrop,Logo',
              maxOfficialRating: maxAge == 'any' ? null : maxAge,
              hasParentalRating: requireRating ? true : null,
            );
            final items = (response['Items'] as List? ?? [])
                .cast<Map<String, dynamic>>();
            rawItems.addAll(items);
          } catch (_) {}
        }
      } else {
        final response = await client.itemsApi.getItems(
          includeItemTypes: ['Movie', 'Series'],
          sortBy: sortBy,
          sortOrder: sortOrder,
          recursive: true,
          limit: _batchSize,
          fields: 'ImageTags,BackdropImageTags,OfficialRating',
          enableTotalRecordCount: false,
          enableImageTypes: 'Backdrop,Logo',
          maxOfficialRating: maxAge == 'any' ? null : maxAge,
          hasParentalRating: requireRating ? true : null,
        );
        final items = (response['Items'] as List? ?? [])
            .cast<Map<String, dynamic>>();
        rawItems.addAll(items);
      }

      rawItems.shuffle();

      final items = <ScreensaverItem>[];
      for (final raw in rawItems) {
        final item = _toItem(client, raw, requireRating: requireRating);
        if (item != null) {
          items.add(item);
        }
      }

      return items.take(_batchSize).toList();
    } catch (_) {
      return const [];
    }
  }  ScreensaverItem? _toItem(
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
