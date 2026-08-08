import 'retro_artwork_cache.dart';

Future<RetroArtworkByteCache> openDefaultRetroArtworkDiskCache({
  int maxBytes = retroArtworkCacheBudgetBytes,
}) async {
  // Browser persistence needs an IndexedDB implementation. Keep the same
  // bounded contract without claiming restart persistence on unsupported
  // platforms.
  return RetroArtworkByteLruCache(maxBytes: maxBytes);
}

Future<RetroArtworkByteCache> openRetroArtworkDiskCacheAt(
  String directoryPath, {
  int maxBytes = retroArtworkCacheBudgetBytes,
}) async {
  return RetroArtworkByteLruCache(maxBytes: maxBytes);
}
