import 'package:server_core/server_core.dart';

import '../auth/models/user.dart';

/// [user]'s avatar URL with their image tag on Jellyfin and Emby, whose URL
/// is otherwise the same for every picture: a changed picture gets a new
/// tag, so it loads instead of the cached old one. Silo's URL already changes
/// with the picture (and may be signed, so nothing is added to it).
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
      .replace(queryParameters: {...uri.queryParameters, 'tag': tag})
      .toString();
}
