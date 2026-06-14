import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';

class SearchRepository {
  final MediaServerClient _client;

  static const _searchFields =
      'Type,UserData,ProductionYear,SeriesName,ParentIndexNumber,IndexNumber,'
      'AlbumArtist,Album,ImageTags,BackdropImageTags,ParentBackdropItemId,'
      'ParentBackdropImageTags,SeriesId,SeriesPrimaryImageTag';

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

    final response = await _client.itemsApi.getItems(
      searchTerm: trimmed,
      parentId: parentId,
      includeItemTypes: const ['Movie', 'Series', 'Person'],
      limit: limit,
      recursive: true,
      fields: 'Type',
    );

    final items = response['Items'] as List? ?? const [];
    final seen = <String>{};
    final suggestions = <String>[];
    for (final item in items) {
      final data = item as Map<String, dynamic>;
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

  Future<List<AggregatedItem>> search(
    String query, {
    List<String>? includeItemTypes,
    String? parentId,
    int? limit,
  }) async {
    final isStudioQuery = query.toLowerCase().startsWith('studio:');
    final searchTerm = isStudioQuery ? null : query;
    final studios = isStudioQuery ? [query.substring('studio:'.length)] : null;

    final response = await _client.itemsApi.getItems(
      searchTerm: searchTerm,
      parentId: parentId,
      includeItemTypes: includeItemTypes,
      limit: limit ?? 24,
      recursive: true,
      fields: _searchFields,
      studios: studios,
    );

    final items = response['Items'] as List? ?? [];
    return items.map((item) {
      final data = item as Map<String, dynamic>;
      return AggregatedItem(
        id: data['Id'] as String,
        serverId: data['ServerId'] as String? ?? '',
        rawData: data,
      );
    }).toList();
  }
}
