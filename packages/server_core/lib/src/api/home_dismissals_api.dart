/// Optional extra for an `ItemsApi` whose server can hide a card from its
/// Continue Watching and Next Up rows itself (Silo's dismissals).
///
/// Moonfin otherwise hides those cards in a list kept on this device
/// (`UserPreferences.hideFromContinueWatching`, `hideFromNextUp`). With this
/// interface (`itemsApi is HomeDismissalsApi`) the hide is the server's, so
/// it holds on every device and in the server's own apps, and the server
/// brings the card back when the item is watched again.
abstract interface class HomeDismissalsApi {
  /// Hides [item], a film or episode with a resume point (a Jellyfin-shaped
  /// item as this server returned it), from Continue Watching.
  Future<void> hideFromContinueWatching(Map<String, dynamic> item);

  /// Hides [item], a show's next episode, from Next Up.
  Future<void> hideFromNextUp(Map<String, dynamic> item);
}
