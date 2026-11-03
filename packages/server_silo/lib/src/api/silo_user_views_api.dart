import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../mappers/silo_library_mapper.dart';
import '../silo_image_registry.dart';
import '../silo_kept_reads.dart';

/// Moonfin's `UserViewsApi` over Silo's `GET /user/libraries`: the libraries
/// the acting profile can see, as Jellyfin `CollectionFolder` views.
///
/// Silo returns libraries in the server's own order (`sort_order`) and, for
/// a profile without library restrictions, **includes** the ones the profile
/// hid itself. Its contract says "navigation should filter by the setting".
/// Jellyfin and Emby apply the user's order and hidden list on the server, so
/// Moonfin expects that. This class does it with the profile's settings,
/// read through `UsersApi.getUserConfiguration`:
///
/// - `ui.library_order` (`OrderedViews`) orders the list. Libraries it
///   doesn't name follow in Silo's order.
/// - `ui.disabled_library_ids` (`MyMediaExcludes`) is left out unless
///   [getUserViews]'s `includeHidden` is set. Silo is also asked with
///   `include_hidden=true` then, so a restricted profile gets its hidden
///   libraries back too.
///
/// If the settings can't be read, the list is returned in Silo's order,
/// unfiltered. Answers are cached for five minutes. [invalidateCache] drops
/// them (the users API calls it after saving the settings).
class SiloUserViewsApi implements UserViewsApi {
  SiloUserViewsApi(
    this._dio, {
    required this.usersApi,
    this.images,
    DateTime Function()? clock,
  }) : _views = SiloKeptReads(lifetime: cacheDuration, clock: clock);

  final Dio _dio;
  final UsersApi Function() usersApi;
  final SiloImageRegistry? images;

  static const cacheDuration = Duration(minutes: 5);
  final SiloKeptReads<bool, Map<String, dynamic>> _views;

  @override
  Future<Map<String, dynamic>> getUserViews({bool includeHidden = false}) =>
      _views.get(includeHidden, () => _load(includeHidden));

  /// Forgets the cached lists, after the library order or hidden list
  /// changed.
  void invalidateCache() => _views.forget();

  Future<Map<String, dynamic>> _load(bool includeHidden) async {
    final configFuture = _configuration();
    final response = await _dio.get<dynamic>(
      '/api/v2/user/libraries',
      queryParameters: {if (includeHidden) 'include_hidden': true},
    );
    final raw = asJsonMap(response.data)?['items'];
    var views = siloLibrariesToUserViews(
      raw is List ? raw : const [],
      images: images,
    );
    final config = await configFuture;
    if (config != null) {
      if (!includeHidden && config.myMediaExcludes.isNotEmpty) {
        final hidden = config.myMediaExcludes.toSet();
        views = [
          for (final v in views)
            if (!hidden.contains(v['Id'])) v,
        ];
      }
      views = _inOrder(views, config.orderedViews);
    }
    return {'Items': views, 'TotalRecordCount': views.length, 'StartIndex': 0};
  }

  Future<UserConfiguration?> _configuration() async {
    try {
      return await usersApi().getUserConfiguration();
    } catch (_) {
      return null;
    }
  }

  /// [views] in [order] (library ids). The rest keep their place after them.
  static List<Map<String, dynamic>> _inOrder(
    List<Map<String, dynamic>> views,
    List<String> order,
  ) {
    if (order.isEmpty) return views;
    final rank = {for (final (i, id) in order.indexed) id: i};
    final indexed = [for (final (i, v) in views.indexed) (i, v)];
    indexed.sort((a, b) {
      final ra = rank[a.$2['Id']];
      final rb = rank[b.$2['Id']];
      if (ra != null && rb != null) return ra.compareTo(rb);
      if (ra != null) return -1;
      if (rb != null) return 1;
      return a.$1.compareTo(b.$1);
    });
    return [for (final (_, v) in indexed) v];
  }
}
