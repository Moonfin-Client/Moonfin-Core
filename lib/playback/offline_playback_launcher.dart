import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';

import '../data/database/offline_database.dart';
import '../data/services/offline_playback_tracker.dart';
import '../data/services/storage_path_service.dart';
import '../l10n/app_localizations.dart';
import '../ui/navigation/destinations.dart';
import 'offline_stream_resolver.dart';

Future<void> launchOfflinePlayback(
  BuildContext context,
  DownloadedItem item, {
  List<DownloadedItem>? episodeQueue,
}) async {
  final resolver = GetIt.instance<OfflineStreamResolver>();
  final result = await resolver.resolve(item.itemId);
  if (result == null) {
    if (context.mounted) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.offlineFileNotAvailable)),
      );
    }
    return;
  }

  final tracker = GetIt.instance<OfflinePlaybackTracker>();
  final manager = GetIt.instance<PlaybackManager>();
  final backend = manager.backend;
  if (backend == null) return;

  final startTicks = item.playbackPositionTicks;
  final startPos = startTicks > 0
      ? Duration(microseconds: startTicks ~/ 10)
      : Duration.zero;
  final metadata = jsonDecode(item.metadataJson) as Map<String, dynamic>;
  final mediaType = metadata['MediaType'] as String?;
  final type = metadata['Type'] as String?;
  final isAudio =
      mediaType == 'Audio' ||
      type == 'Audio' ||
      type == 'AudioBook' ||
      type == 'MusicAlbum';

  if (isAudio) {
    await _injectLocalPaths(item, metadata);
  }

  var queueUrls = const <String>[];
  var startIndex = 0;
  final metadataByUrl = <String, Map<String, dynamic>>{
    result.url: metadata,
  };

  if (episodeQueue != null && episodeQueue.length > 1) {
    queueUrls = episodeQueue
        .where((e) => e.localFilePath != null && e.downloadStatus == 2)
        .map((e) => e.localFilePath!)
        .toList();
    startIndex = queueUrls.indexOf(result.url).clamp(0, queueUrls.length - 1);
    for (final ep in episodeQueue) {
      if (ep.localFilePath != null && ep.downloadStatus == 2) {
        final url = ep.localFilePath!;
        final epMeta = jsonDecode(ep.metadataJson) as Map<String, dynamic>;
        if (isAudio) {
          await _injectLocalPaths(ep, epMeta);
        }
        metadataByUrl[url] = epMeta;
      }
    }
  }

  manager.setOfflineMetadataByUrl(metadataByUrl);

  await manager.playOffline(
    result.url,
    startPosition: startPos,
    itemDuration: result.duration,
    queueUrls: queueUrls,
    startIndex: startIndex,
    onStop: () async => tracker.stopTracking(),
    onAutoNext: (url) async {
      await tracker.stopTracking();
      if (episodeQueue == null) return;
      final nextEp = episodeQueue.firstWhere(
        (e) => e.localFilePath != null && e.localFilePath == url,
        orElse: () => item,
      );
      final nextResult = await resolver.resolve(nextEp.itemId);
      if (nextResult != null) {
        await manager.playOffline(
          nextResult.url,
          itemDuration: nextResult.duration,
          queueUrls: queueUrls,
          startIndex: queueUrls.indexOf(nextResult.url).clamp(0, queueUrls.length - 1),
          onStop: () async => tracker.stopTracking(),
          onAutoNext: null,
        );
        for (final sub in nextResult.externalSubtitles) {
          await backend.addExternalSubtitle(
            sub.path,
            title: sub.title,
            language: sub.language,
            codec: sub.codec,
          );
        }
        tracker.startTracking(
          itemId: nextResult.itemId,
          duration: nextResult.duration,
          positionStream: backend.positionStream,
        );
      }
    },
  );

  for (final sub in result.externalSubtitles) {
    await backend.addExternalSubtitle(
      sub.path,
      title: sub.title,
      language: sub.language,
      codec: sub.codec,
    );
  }
  tracker.startTracking(
    itemId: result.itemId,
    duration: result.duration,
    positionStream: backend.positionStream,
  );

  if (context.mounted) {
    context.push(isAudio ? Destinations.audioPlayer : Destinations.videoPlayer);
  }
}

Future<void> _injectLocalPaths(DownloadedItem item, Map<String, dynamic> meta) async {
  if (item.posterPath != null) {
    meta['_localPosterPath'] = item.posterPath;
  }
  try {
    final storagePath = GetIt.instance<StoragePathService>();
    final imageDir = await storagePath.getImageCacheDir();
    final lyricsFile = File('${imageDir.path}/${item.itemId}/lyrics.json');
    if (await lyricsFile.exists()) {
      meta['_localLyricsPath'] = lyricsFile.path;
    }
  } catch (_) {}
}
