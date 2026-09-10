/// Web has no filesystem to measure, so callers get null and don't block.
Future<int?> availableDiskSpaceBytes(String path) async => null;
