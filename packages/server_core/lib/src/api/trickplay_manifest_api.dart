/// Optional extra for an `ItemsApi` whose server reads seek previews per
/// file when a player wants them, rather than sending them on the item
/// (Silo's `/watch/{id}/trickplay`).
///
/// Jellyfin sends an item's previews as its `Trickplay` field, which the
/// player reads (`TrickplayInfo.fromItemData`). With this interface
/// (`itemsApi is TrickplayManifestApi`) the player asks for that field for
/// the file it plays and merges the answer into the item, then reads it the
/// same way.
abstract interface class TrickplayManifestApi {
  /// The `Trickplay` field for file [mediaSourceId] of [itemId], in
  /// Jellyfin's shape (`{<file id>: {"<width>": {Width, Height, TileWidth,
  /// TileHeight, ThumbnailCount, Interval}}}`), or null when the file has no
  /// previews. The sheets are then served by the server's
  /// `ImageApi.getTrickplayTileImageUrl`.
  Future<Map<String, dynamic>?> getTrickplayManifest(
    String itemId, {
    required String mediaSourceId,
  });
}
