import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

class EmbyUserViewsApi implements UserViewsApi {
  final Dio _dio;
  final String Function() _getUserId;
  final UsersApi Function() _usersApi;
  final Map<bool, ({Map<String, dynamic> views, DateTime at})> _cache = {};
  static const _cacheDuration = Duration(minutes: 5);

  EmbyUserViewsApi(this._dio, this._getUserId, this._usersApi);

  /// Emby takes no includeHidden parameter and applies the My Media excludes
  /// itself, so a hidden library is simply absent from what comes back. Asking
  /// for the full list fetches those back by id, which is what lets a hidden
  /// library be switched on again instead of vanishing from the screen that
  /// manages it.
  @override
  Future<Map<String, dynamic>> getUserViews({
    bool includeHidden = false,
  }) async {
    final cached = _cache[includeHidden];
    if (cached != null &&
        DateTime.now().difference(cached.at) < _cacheDuration) {
      return cached.views;
    }

    final userId = _getUserId();
    final response = await _dio.get('/Users/$userId/Views');
    var views = response.data as Map<String, dynamic>;
    if (includeHidden) {
      views = await _withExcludedViews(userId, views);
    }

    _cache[includeHidden] = (views: views, at: DateTime.now());
    return views;
  }

  Future<Map<String, dynamic>> _withExcludedViews(
    String userId,
    Map<String, dynamic> views,
  ) async {
    final items = (views['Items'] as List?) ?? const [];
    final present = items
        .whereType<Map>()
        .map((item) => item['Id']?.toString())
        .whereType<String>()
        .toSet();

    final config = await _userConfiguration();
    if (config == null) return views;

    final missing = config.myMediaExcludes
        .where((id) => id.isNotEmpty && !present.contains(id))
        .toList(growable: false);
    if (missing.isEmpty) return views;

    final excluded = await _viewsByIds(userId, missing);
    if (excluded.isEmpty) return views;

    return <String, dynamic>{
      ...views,
      'Items': _inSavedOrder([...items, ...excluded], config.orderedViews),
      'TotalRecordCount': items.length + excluded.length,
    };
  }

  Future<UserConfiguration?> _userConfiguration() async {
    try {
      return await _usersApi().getUserConfiguration();
    } catch (_) {
      return null;
    }
  }

  /// Emby already returns its views in the user's saved order, so this only
  /// puts the ones fetched back by id in their slot instead of at the end.
  /// Anything the saved order leaves out keeps its place after the rest.
  static List<dynamic> _inSavedOrder(
    List<dynamic> items,
    List<String> orderedViews,
  ) {
    if (orderedViews.isEmpty) return items;
    final rank = {
      for (final (index, id) in orderedViews.indexed) id: index,
    };
    int rankOf(dynamic item) =>
        rank[item is Map ? item['Id']?.toString() : null] ??
        orderedViews.length;

    final arrived = items.indexed.toList()
      ..sort((a, b) {
        final byRank = rankOf(a.$2).compareTo(rankOf(b.$2));
        return byRank != 0 ? byRank : a.$1.compareTo(b.$1);
      });
    return [for (final (_, item) in arrived) item];
  }

  /// A library the user still has access to, just not on My Media, so a plain
  /// lookup by id reaches it. Anything nameless is dropped rather than handed
  /// on as a blank row.
  Future<List<Map<String, dynamic>>> _viewsByIds(
    String userId,
    List<String> ids,
  ) async {
    try {
      final response = await _dio.get(
        '/Users/$userId/Items',
        queryParameters: {'Ids': ids.join(',')},
      );
      final data = response.data as Map<String, dynamic>;
      return ((data['Items'] as List?) ?? const [])
          .whereType<Map>()
          .map((item) => item.cast<String, dynamic>())
          .where((item) => (item['Name']?.toString() ?? '').isNotEmpty)
          .toList(growable: false);
    } catch (_) {
      return const [];
    }
  }

  void invalidateCache() => _cache.clear();
}
