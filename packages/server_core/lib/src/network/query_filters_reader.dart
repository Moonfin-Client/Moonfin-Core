import 'package:dio/dio.dart';

import '../models/query_filter_models.dart';

/// Reads the facet values a library holds. Both server types answer two
/// endpoints: the older one carries the years and parental ratings, the newer
/// one the languages, so both are read and merged. Either failing leaves its
/// half empty rather than losing the other.
Future<QueryFilterValues> readQueryFilters(
  Dio dio, {
  required String userId,
  String? parentId,
  List<String>? includeItemTypes,
}) async {
  final query = {
    'UserId': userId,
    'ParentId': ?parentId,
    if (includeItemTypes != null && includeItemTypes.isNotEmpty)
      'IncludeItemTypes': includeItemTypes.join(','),
  };

  Future<QueryFilterValues> read(
    String path,
    QueryFilterValues Function(Map<String, dynamic>) parse,
  ) async {
    try {
      final response = await dio.get(path, queryParameters: query);
      final data = response.data;
      if (data is! Map) return QueryFilterValues.empty;
      return parse(data.cast<String, dynamic>());
    } catch (_) {
      return QueryFilterValues.empty;
    }
  }

  final results = await Future.wait([
    read('/Items/Filters', QueryFilterValues.fromLegacyJson),
    read('/Items/Filters2', QueryFilterValues.fromJson),
  ]);
  return results.first.mergedWith(results.last);
}
