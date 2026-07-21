/// Builds a TMDB CDN image URL from a path returned by the plugin or Seerr. Values
/// that are already absolute URLs pass through unchanged, and null or empty paths
/// return null.
String? tmdbImageUrl(String? path, int width) {
  if (path == null || path.isEmpty) return null;
  if (path.startsWith('http')) return path;
  return 'https://image.tmdb.org/t/p/w$width$path';
}
