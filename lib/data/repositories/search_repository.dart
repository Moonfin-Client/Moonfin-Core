import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
import '../utils/blocked_ratings.dart';

class SearchRepository {
  final MediaServerClient _client;

  static const _searchFields =
      'Type,UserData,ProductionYear,SeriesName,ParentIndexNumber,IndexNumber,'
      'AlbumArtist,Album,ImageTags,BackdropImageTags,ParentBackdropItemId,'
      'ParentBackdropImageTags,SeriesId,SeriesPrimaryImageTag,OfficialRating';

  // Search uses ProviderIds to fold a title that two servers hold into one.
  static const _searchFieldsWithProviderIds = '$_searchFields,ProviderIds';

  SearchRepository(this._client);

  Future<List<String>> suggest(
    String query, {
    String? parentId,
    int limit = 5,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return const [];
    if (trimmed.toLowerCase().startsWith('studio:')) return const [];
    final normalizedQuery = trimmed.toLowerCase();

    final filter = activeParentalFilter;
    final response = await _client.itemsApi.getItems(
      searchTerm: trimmed,
      parentId: parentId,
      includeItemTypes: const ['Movie', 'Series', 'Person'],
      // Dropping blocked titles costs suggestion slots, so ask for more of
      // them when anything is blocked.
      limit: filter.isActive ? limit * 4 : limit,
      recursive: true,
      fields: 'Type,OfficialRating',
    );

    final items = response['Items'] as List? ?? const [];
    final seen = <String>{};
    final suggestions = <String>[];
    for (final item in items) {
      final data = item as Map<String, dynamic>;
      if (filter.isBlockedRaw(data)) continue;
      final name = (data['Name'] as String?)?.trim();
      if (name == null || name.isEmpty) continue;
      final key = name.toLowerCase();
      if (key == normalizedQuery) continue;
      if (seen.add(key)) {
        suggestions.add(name);
      }
      if (suggestions.length >= limit) break;
    }

    return suggestions;
  }

  /// People are not returned by the global `/Items` recursive query, so they
  /// need the dedicated `/Persons` endpoint. Results are tagged `Person` so the
  /// UI renders them as circular avatars and groups them correctly.
  Future<List<AggregatedItem>> searchPeople(
    String query, {
    int limit = 24,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty || trimmed.toLowerCase().startsWith('studio:')) {
      return const [];
    }

    final response = await _client.itemsApi.getPersons(
      searchTerm: trimmed,
      limit: limit,
      fields: 'PrimaryImageAspectRatio',
      enableImageTypes: 'Primary',
    );

    final items = response['Items'] as List? ?? const [];
    return items.map((item) {
      final data = Map<String, dynamic>.from(item as Map);
      data['Type'] ??= 'Person';
      return AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: data['ServerId']?.toString() ?? '',
        rawData: data,
      );
    }).toList();
  }

  /// Live TV channels never come back from the recursive items search, so
  /// channel search fetches the lineup and filters by name client-side.
  Future<List<AggregatedItem>> fetchLiveTvChannels() async {
    final response = await _client.liveTvApi.getChannels(
      fields: 'ImageTags',
      enableTotalRecordCount: false,
      userId: _client.userId,
    );
    final items = response['Items'] as List? ?? const [];
    return items.map((item) {
      final data = Map<String, dynamic>.from(item as Map);
      data['Type'] ??= 'TvChannel';
      return AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: data['ServerId']?.toString() ?? '',
        rawData: data,
      );
    }).toList();
  }

  Future<List<AggregatedItem>> search(
    String query, {
    List<String>? includeItemTypes,
    String? parentId,
    int? limit,
  }) async => withoutBlockedItems(
    await _search(
      query,
      includeItemTypes: includeItemTypes,
      parentId: parentId,
      limit: limit,
    ),
  );

  // Types a search across every library turns up that have no group, since
  // people and channels come from their own requests.
  static const _ungroupedTypes = [
    'Person',
    'Studio',
    'Genre',
    'MusicGenre',
    'TvChannel',
  ];

  /// One search across every library for the types in [groups].
  ///
  /// Jellyfin fills the page with whatever matched first, so lots of episodes
  /// or audiobook chapters can push every movie and series out of it. Types
  /// with no group are left out of the page, and when it still comes back
  /// full, each group that didn't get [perGroup] items is searched again on
  /// its own. The page names no types to include, since Jellyfin only finds
  /// Live TV programs when it's asked for every type.
  ///
  /// [withProviderIds] also reads the external ids shared titles fold on.
  Future<List<AggregatedItem>> searchGroups(
    String query,
    List<List<String>> groups, {
    required int perGroup,
    required int limit,
    bool withProviderIds = false,
  }) async {
    if (_client.serverType != ServerType.jellyfin) {
      return withoutBlockedItems(
        await _search(query, limit: limit, withProviderIds: withProviderIds),
      );
    }
    final page = await _search(
      query,
      excludeItemTypes: _ungroupedTypes,
      limit: limit,
      withProviderIds: withProviderIds,
    );
    if (page.length < limit) return withoutBlockedItems(page);
    final refills = await Future.wait([
      for (final group in groups)
        if (page.where((item) => group.contains(item.type)).length < perGroup)
          _search(
            query,
            includeItemTypes: group,
            limit: perGroup,
            withProviderIds: withProviderIds,
          ).catchError((Object _) => <AggregatedItem>[]),
    ]);
    final seen = {for (final item in page) item.id};
    return withoutBlockedItems([
      ...page,
      for (final item in refills.expand((items) => items))
        if (seen.add(item.id)) item,
    ]);
  }

  Future<List<AggregatedItem>> _search(
    String query, {
    List<String>? includeItemTypes,
    List<String>? excludeItemTypes,
    String? parentId,
    int? limit,
    bool withProviderIds = false,
  }) async {
    final isStudioQuery = query.toLowerCase().startsWith('studio:');
    final searchTerm = isStudioQuery ? null : query;
    final studios = isStudioQuery ? [query.substring('studio:'.length)] : null;

    final response = await _client.itemsApi.getItems(
      searchTerm: searchTerm,
      parentId: parentId,
      includeItemTypes: includeItemTypes,
      excludeItemTypes: excludeItemTypes,
      limit: limit ?? 24,
      recursive: true,
      fields: withProviderIds ? _searchFieldsWithProviderIds : _searchFields,
      studios: studios,
    );

    final items = response['Items'] as List? ?? [];
    return items.map((item) {
      final data = item as Map<String, dynamic>;
      return AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: data['ServerId']?.toString() ?? '',
        rawData: data,
      );
    }).toList();
  }
}
