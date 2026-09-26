import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';

/// The playing track's artwork: the album cover for music, its own picture otherwise.
///
/// Returns null when there's no artwork or its server can't be reached.
String? audioArtUrl(
  AggregatedItem item, {
  required MediaServerClientFactory clientFactory,
  required int maxHeight,
}) {
  try {
    final client = clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
    final albumTag = item.albumPrimaryImageTag;
    final albumId = item.albumId;
    if (item.type == 'Audio' && albumTag != null && albumId != null) {
      return client.imageApi
          .getPrimaryImageUrl(albumId, maxHeight: maxHeight, tag: albumTag);
    }
    if (item.primaryImageTag != null) {
      return client.imageApi
          .getPrimaryImageUrl(item.id, maxHeight: maxHeight, tag: item.primaryImageTag);
    }
  } catch (_) {}
  return null;
}
