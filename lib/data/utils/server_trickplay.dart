import 'package:server_core/server_core.dart';

/// Merges the server's seek previews for file [mediaSourceId] into the
/// item's `Trickplay` field, for a server that reads them per file
/// ([TrickplayManifestApi], Silo). The player then reads them
/// with `TrickplayInfo.fromItemData` as it reads Jellyfin's.
///
/// Does nothing when the server has no such API, the item already carries
/// that file's entry, or the file has none. A failed read leaves the item
/// as it was: previews are an extra and never hold up playback.
Future<void> mergeServerTrickplay(
  MediaServerClient client,
  String itemId,
  Map<String, dynamic> rawData,
  String? mediaSourceId,
) async {
  if (mediaSourceId == null || mediaSourceId.isEmpty || itemId.isEmpty) {
    return;
  }
  final existing = rawData['Trickplay'];
  if (existing is Map && existing.containsKey(mediaSourceId)) return;
  try {
    final Object items = client.itemsApi;
    if (items is! TrickplayManifestApi) return;
    final api = items;
    final manifest = await api.getTrickplayManifest(
      itemId,
      mediaSourceId: mediaSourceId,
    );
    if (manifest == null || manifest.isEmpty) return;
    rawData['Trickplay'] = <String, dynamic>{
      if (existing is Map) ...existing.cast<String, dynamic>(),
      ...manifest,
    };
  } catch (_) {}
}
