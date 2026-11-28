import 'package:server_core/server_core.dart';

import '../auth/models/user.dart';

/// [user]'s avatar URL with their image tag on servers with Jellyfin's user
/// image path (Jellyfin and Emby; a Plex user has no tag), whose URL is
/// otherwise the same for every picture: a changed picture gets a new tag, so
/// it loads instead of the cached old one. It asks for quality 90 unless the
/// URL already names one. Silo's URL already carries its
/// version, and may be signed, so nothing is added to it.
String taggedUserImageUrl(MediaServerClient client, User user) {
  final url = client.imageApi.getUserImageUrl(user.id);
  final tag = user.imageTag;
  if (tag == null ||
      tag.isEmpty ||
      !client.serverType.hasJellyfinUserImagePath) {
    return url;
  }
  final uri = Uri.parse(url);
  return uri
      .replace(
        queryParameters: {'quality': '90', ...uri.queryParameters, 'tag': tag},
      )
      .toString();
}
