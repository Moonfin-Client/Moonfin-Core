import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../ui/screens/home/home_view_model.dart';
import 'tv_image_cache_stub.dart'
    if (dart.library.io) 'tv_image_cache_io.dart';

/// Evicts in-memory and disk image caches and triggers a forced reload of the
/// Home Screen so that metadata changes, identifications, and new artwork
/// immediately update on the Home Screen without requiring an app restart.
Future<void> triggerHomeAndImageCacheRefresh({bool scheduleFollowUp = false}) async {
  try {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    await clearImageDiskCache();
  } catch (_) {}

  if (GetIt.instance.isRegistered<HomeViewModel>()) {
    GetIt.instance<HomeViewModel>().load(forceRefresh: true);
  }

  if (scheduleFollowUp) {
    // When Jellyfin server executes Identify or Metadata Refresh tasks, it downloads
    // remote artwork asynchronously over the next 2-3 seconds. A follow-up refresh
    // picks up the new image tags once the server has finished saving them.
    unawaited(
      Future.delayed(const Duration(milliseconds: 2500), () async {
        try {
          PaintingBinding.instance.imageCache.clear();
          PaintingBinding.instance.imageCache.clearLiveImages();
          await clearImageDiskCache();
        } catch (_) {}
        if (GetIt.instance.isRegistered<HomeViewModel>()) {
          GetIt.instance<HomeViewModel>().load(forceRefresh: true);
        }
      }),
    );
  }
}
