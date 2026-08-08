Future<void> configureImageDiskCache() async {}

Future<void> enforceImageCacheBudget(
  int budgetBytes, {
  bool throttle = false,
}) async {}

Future<void> enforceGameArtworkCacheBudget({bool throttle = false}) async {}

Future<void> retainGameArtworkCacheScope(String scope) async {}

void releaseGameArtworkCacheScope(String scope) {}

Future<void> clearImageDiskCache() async {}
