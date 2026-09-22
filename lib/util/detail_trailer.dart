import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/models/aggregated_item.dart';
import '../preference/user_preferences.dart';
import 'platform_detection.dart';

/// A standalone trailer carries the item type, one attached to a film carries
/// the extra type, and which of the two arrives depends on how the server
/// found the file.
bool isTrailerFeature(AggregatedItem feature) =>
    feature.rawData['ExtraType'] == 'Trailer' || feature.type == 'Trailer';

/// Whether a trailer exists for [item], from any of the places one can live.
///
/// The count is checked before the trailer links, since reading it avoids
/// building a list. Special features come last and only answer for servers
/// that file a trailer as an ordinary extra, because a server that keeps the
/// two apart leaves trailers out of that list.
bool hasTrailer(AggregatedItem item, List<AggregatedItem> features) {
  if (item.localTrailerCount > 0) return true;
  if (item.remoteTrailers.isNotEmpty) return true;
  return features.any(isTrailerFeature);
}

/// Whether the details screen hands remote trailers to the system instead of
/// the in-app player, the way the official Jellyfin TV app does.
bool opensTrailersExternally() =>
    GetIt.instance<UserPreferences>().effectiveDetailTrailersExternal;

/// Hands [url] to whatever the system offers, the YouTube app on TV, the
/// browser on desktop, a new tab on web. Returns false when nothing accepted
/// it so the caller can fall back to the in-app player.
Future<bool> launchTrailerExternally(String url) async {
  try {
    return await launchUrl(
      Uri.parse(url),
      mode: PlatformDetection.isWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  } catch (_) {
    return false;
  }
}
