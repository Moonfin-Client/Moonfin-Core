/// What a server takes as a user's profile picture: the image types it keeps
/// and shows, and the largest file it takes.
class UserImageUpload {
  const UserImageUpload({
    required this.contentTypes,
    required this.maxBytes,
    this.removable = true,
  });

  /// Jellyfin and Emby store any file they are sent, but only these come back
  /// as a picture every Moonfin client can draw.
  static const jellyfinAndEmby = UserImageUpload(
    contentTypes: {
      'image/jpeg',
      'image/png',
      'image/gif',
      'image/webp',
      'image/bmp',
    },
    maxBytes: 10 * 1024 * 1024,
  );

  /// Lowercase MIME types, `image/jpeg` rather than `image/jpg`.
  final Set<String> contentTypes;

  /// The largest file the server takes, in bytes.
  final int maxBytes;

  /// Whether the user's current picture can be removed here. Silo removes
  /// only an uploaded one, not a preset.
  final bool removable;

  bool accepts(String contentType, int length) =>
      contentTypes.contains(contentType.toLowerCase()) && length <= maxBytes;
}
