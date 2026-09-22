import 'package:flutter/foundation.dart';

/// How urgently an artwork fetch is wanted.
///
/// The cache manager queues fetches first come first served, which on a fast
/// scroll puts every cell already scrolled past ahead of the cells now on
/// screen. The scheduler in the file service reorders by lane and by batch.
/// This is how a widget tells it which lane it belongs in.
enum ImageFetchPriority {
  /// The one image the screen is about: a detail hero, the backdrop behind
  /// a browse, the current media bar slide. Ahead of everything.
  high,

  /// Whatever is being painted now. Newest batch first.
  normal,

  /// A prefetch of something the user may look at next. Only when nothing
  /// else is waiting, and never in the way of a visible image.
  low,
}

/// The header that carries the lane from a widget to the file service.
///
/// It rides on the request headers because that is the one thing the cache
/// manager hands through untouched from the widget to the file service, and
/// the image provider leaves headers out of its cache key, so a lane never
/// changes which cache entry an image lands in. The file service strips it
/// before the request leaves the app.
const imageFetchPriorityHeader = 'x-moonfin-image-priority';

/// Files a queued fetch of [url] into [priority]'s lane, when a scheduler is
/// installed. The cache configuration sets this on the platforms that
/// schedule, and leaves it null elsewhere.
void Function(String url, ImageFetchPriority priority)? artworkRequestPromoter;

/// The headers a network fetch of [url] goes out with, having first told the
/// scheduler the image is wanted now.
///
/// A widget building for a URL a prefetch asked for earlier, or that an older
/// batch still holds, is the one case the scheduler can't see for itself.
///
/// The lane header is never set on web: a custom header turns every image
/// into a CORS preflight the server's allowlist doesn't cover, and every
/// image fails.
Map<String, String>? artworkFetchHeaders(
  String url,
  ImageFetchPriority priority, {
  Map<String, String>? headers,
}) {
  if (priority != ImageFetchPriority.low) {
    artworkRequestPromoter?.call(url, priority);
  }
  if (kIsWeb || priority == ImageFetchPriority.normal) return headers;
  final lane = <String, String>{imageFetchPriorityHeader: priority.name};
  if (headers == null || headers.isEmpty) return lane;
  return <String, String>{...headers, ...lane};
}

/// Removes the lane header from [headers] and returns the lane it named.
/// Normal when absent or unrecognised.
ImageFetchPriority takeImageFetchPriority(Map<String, String>? headers) {
  final name = headers?.remove(imageFetchPriorityHeader);
  if (name == null) return ImageFetchPriority.normal;
  for (final lane in ImageFetchPriority.values) {
    if (lane.name == name) return lane;
  }
  return ImageFetchPriority.normal;
}
