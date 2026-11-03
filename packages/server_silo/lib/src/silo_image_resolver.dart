import 'dart:async';

import 'silo_image_registry.dart';

/// The path of a placeholder image URL. Never requested from Silo: the image
/// cache resolves it first (see [SiloImageResolution]). Should it be
/// requested anyway, Silo answers 404 and Moonfin shows its placeholder art.
const siloImagePlaceholderPath = '/api/v2/__moonfin/image';

/// A placeholder URL for image [index] of [type] of [itemId] on the server
/// at [baseUrl], for an item whose artwork hasn't been seen yet.
String siloImagePlaceholderUrl(
  String baseUrl,
  String itemId,
  SiloImageType type, {
  int index = 0,
}) {
  final query = Uri(
    queryParameters: {
      'item': itemId,
      'type': type.name,
      if (index != 0) 'index': '$index',
    },
  ).query;
  return '${resolveSiloUrl(siloImagePlaceholderPath, baseUrl)}?$query';
}

/// What a placeholder URL asks for.
typedef SiloImageRequest = ({String itemId, SiloImageType type, int index});

/// The request in a placeholder [url], or null when [url] isn't one.
SiloImageRequest? parseSiloImagePlaceholder(String url) {
  if (!url.contains(siloImagePlaceholderPath)) return null;
  final uri = Uri.tryParse(url);
  if (uri == null || !uri.path.endsWith(siloImagePlaceholderPath)) return null;
  final itemId = uri.queryParameters['item'];
  final type = SiloImageType.values.asNameMap()[uri.queryParameters['type']];
  if (itemId == null || itemId.isEmpty || type == null) return null;
  final index = int.tryParse(uri.queryParameters['index'] ?? '') ?? 0;
  return (itemId: itemId, type: type, index: index);
}

/// Loads whatever Silo has on [itemId] (the item, a library, a person) and
/// records its artwork in the registry, so a placeholder can be resolved.
typedef SiloArtworkLoader = Future<void> Function(String itemId);

/// Turns placeholder URLs into real artwork URLs for one Silo client.
///
/// Silo has no image URL that can be built from an item id: artwork comes
/// signed, inside the item. When Moonfin asks for an image of an item this
/// session hasn't read (rows restored from a cache at startup, a deep link,
/// a parent id), `SiloImageApi` hands out a placeholder URL. When the image
/// widget loads it, [resolve] reads the item once ([load]), which records its
/// artwork, and answers the URL the widget should download.
///
/// - Concurrent requests for one item share one load.
/// - An item that failed to load, or has no such image, isn't tried again
///   for [retryAfter], so a grid of missing art doesn't hammer the server.
class SiloImageResolver {
  SiloImageResolver({
    required this.registry,
    required this.baseUrl,
    required this.load,
    this.retryAfter = const Duration(minutes: 10),
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  final SiloImageRegistry registry;

  /// The client's base URL, read at every call.
  final String Function() baseUrl;

  final SiloArtworkLoader load;
  final Duration retryAfter;
  final DateTime Function() _clock;

  final Map<String, Future<void>> _loading = {};
  final Map<String, DateTime> _failedAt = {};

  /// Whether [url] is one of this client's placeholders.
  bool owns(String url) =>
      url.startsWith('${resolveSiloUrl(siloImagePlaceholderPath, baseUrl())}?');

  /// The artwork URL for placeholder [url], or null when Silo has none.
  Future<String?> resolve(String url) async {
    final request = parseSiloImagePlaceholder(url);
    if (request == null) return null;
    final known = _lookup(request);
    if (known != null) return known;

    final failed = _failedAt[request.itemId];
    if (failed != null && _clock().difference(failed) < retryAfter) {
      return null;
    }
    try {
      await (_loading[request.itemId] ??= load(request.itemId).whenComplete(
        // A block body: returning the removed future would make this wait
        // on itself.
        () {
          _loading.remove(request.itemId);
        },
      ));
    } catch (_) {
      _failedAt[request.itemId] = _clock();
      return null;
    }
    final found = _lookup(request);
    if (found == null) _failedAt[request.itemId] = _clock();
    return found;
  }

  String? _lookup(SiloImageRequest r) {
    final url = registry.urlFor(r.itemId, r.type, index: r.index);
    if (url != null) return url;
    // Same fallbacks as SiloImageApi: a backdrop stands in for a missing
    // thumb or banner.
    if (r.type == SiloImageType.thumb || r.type == SiloImageType.banner) {
      return registry.urlFor(r.itemId, SiloImageType.backdrop);
    }
    return null;
  }
}

/// The app-wide entry point for the image cache: finds the Silo client a
/// placeholder URL belongs to and resolves it there.
///
/// Each Silo client registers its resolver while it exists. The app installs
/// [resolve] as the image cache's URL resolver (`installSiloImageHooks`).
abstract final class SiloImageResolution {
  static final List<SiloImageResolver> _resolvers = [];

  static void register(SiloImageResolver resolver) => _resolvers.add(resolver);

  static void unregister(SiloImageResolver resolver) =>
      _resolvers.remove(resolver);

  /// Null, synchronously, for any URL that isn't a Silo placeholder, so
  /// ordinary images load without a detour. Otherwise the URL to download,
  /// or null when it can't be resolved.
  static Future<String?>? resolve(String url) {
    if (!url.contains(siloImagePlaceholderPath)) return null;
    for (final resolver in _resolvers) {
      if (resolver.owns(url)) return resolver.resolve(url);
    }
    return Future.value();
  }
}
