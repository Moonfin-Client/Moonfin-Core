/// The image-cache key for a Silo artwork URL: the URL without its query.
///
/// Silo's artwork URLs carry a signature that rotates (`?exp=…&sig=…`) on a
/// path that names the picture itself (it includes a content hash:
/// `…/poster/w500.f6c3….webp`). Keyed by the whole URL, every image would be
/// downloaded again each time the signature changes. Keyed by scheme, host
/// and path, the same picture is found in the memory and disk caches with
/// any signature, and a changed picture has a new path.
///
/// A profile avatar is the exception: Silo replaces it at the same path, so
/// its URL carries a `#v=` fragment for the version (see
/// `SiloImageRegistry.register`), and the fragment stays in the key.
///
/// Null for anything that isn't signed Silo artwork (an absolute TMDB URL,
/// another server's image), which then keeps its usual key, the URL.
String? siloImageCacheKey(String url) {
  final hashAt = url.indexOf('#');
  final fragment = hashAt < 0 ? '' : url.substring(hashAt);
  final withoutFragment = hashAt < 0 ? url : url.substring(0, hashAt);
  final queryAt = withoutFragment.indexOf('?');
  if (queryAt < 0) return null;
  final path = withoutFragment.substring(0, queryAt);
  if (!path.contains('/api/v2/artwork/')) return null;
  final query = withoutFragment.substring(queryAt + 1);
  final signed = query
      .split('&')
      .any((p) => p.startsWith('sig=') || p.startsWith('exp='));
  return signed ? 'silo-artwork:$path$fragment' : null;
}
