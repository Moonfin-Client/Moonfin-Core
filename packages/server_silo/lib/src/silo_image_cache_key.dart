/// The image-cache key for a Silo artwork URL: the URL without its query.
///
/// Silo's artwork URLs carry a signature that rotates (`?exp=…&sig=…`) on a
/// path that names the picture itself (it includes a content hash:
/// `…/poster/w500.f6c3….webp`). Keyed by the whole URL, every image would be
/// downloaded again each time the signature changes. Keyed by scheme, host
/// and path, the same picture is found in the memory and disk caches with
/// any signature, and a changed picture has a new path.
///
/// Null for anything that isn't signed Silo artwork (an absolute TMDB URL,
/// another server's image), which then keeps its usual key, the URL.
String? siloImageCacheKey(String url) {
  final queryAt = url.indexOf('?');
  if (queryAt < 0) return null;
  final path = url.substring(0, queryAt);
  if (!path.contains('/api/v2/artwork/')) return null;
  final query = url.substring(queryAt + 1);
  final signed = query
      .split('&')
      .any((p) => p.startsWith('sig=') || p.startsWith('exp='));
  return signed ? 'silo-artwork:$path' : null;
}
