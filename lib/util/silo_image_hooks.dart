import 'package:cached_network_image/cached_network_image.dart';
import 'package:server_silo/server_silo.dart';

/// Teaches the image cache about Silo's artwork URLs: they are signed with
/// a query that rotates, so they are cached by path ([siloImageCacheKey])
/// and the same picture isn't downloaded again every time its signature
/// changes. Other URLs keep their usual key.
///
/// It also resolves the placeholder URLs a Silo client hands out for items
/// it hasn't read yet ([SiloImageResolution]): the item is loaded
/// and its real artwork downloaded. Ordinary URLs load without a detour.
void installSiloImageHooks() {
  CachedNetworkImageProvider.cacheKeyFor = siloImageCacheKey;
  CachedNetworkImageProvider.urlResolver = SiloImageResolution.resolve;
}
