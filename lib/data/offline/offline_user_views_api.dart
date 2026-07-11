import 'package:server_core/server_core.dart';

import 'offline_catalog.dart';
import 'offline_views.dart';

/// Synthesizes library views from the downloaded item types so the regular
/// libraries UI renders offline.
class OfflineUserViewsApi implements UserViewsApi {
  final OfflineCatalog _catalog;

  OfflineUserViewsApi(this._catalog);

  @override
  Future<Map<String, dynamic>> getUserViews() async {
    final serverId = _catalog.entries.isNotEmpty
        ? _catalog.entries.first.row.serverId
        : '';
    final populated = <String>{};
    for (final entry in _catalog.entries) {
      populated.add(OfflineViews.viewForType(entry.type));
    }
    final views = OfflineViews.all
        .where(populated.contains)
        .map((viewId) => OfflineViews.viewStub(viewId, serverId))
        .toList();
    return {'Items': views, 'TotalRecordCount': views.length};
  }
}
