/// A container and codec a theme player decodes (`codec` null: any codec in
/// the container).
typedef ThemeAudioFormat = ({String container, String? codec});

/// Optional extra for an `ItemsApi` whose server hands out theme music as a
/// short-lived link per play (Silo's theme grants).
///
/// Jellyfin and Emby stream a theme song from `/Audio/{id}/stream` with the
/// account's token, which Moonfin builds itself. With this interface
/// (`itemsApi is ThemeSongStreamApi`) the server makes the link instead.
abstract interface class ThemeSongStreamApi {
  /// A playable URL for theme song [songId] of [ownerId] (as listed by
  /// `getThemeMedia`), in one of [accepts] when the server can convert, or
  /// null when it can't be played. The link is short-lived: ask again for
  /// each play.
  Future<String?> themeSongStreamUrl(
    String ownerId,
    String songId, {
    List<ThemeAudioFormat> accepts = const [],
  });
}
