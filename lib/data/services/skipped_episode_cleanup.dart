import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import '../models/aggregated_item.dart';
import '../repositories/item_mutation_repository.dart';
import '../utils/bounded_concurrency.dart';
import 'skipped_episode_endings.dart';

const _seriesHydrationConcurrency = 4;
const _episodeFields =
    'Type,UserData,RunTimeTicks,ParentIndexNumber,IndexNumber,SeriesId';

/// Marks stale leftover episode resume points as played and returns the
/// resume list with those items removed.
///
/// Soft-fails per series/item: network errors leave candidates on the row.
Future<List<AggregatedItem>> cleanupSkippedEpisodeEndings({
  required List<AggregatedItem> resume,
  required MediaServerClient client,
  Object? progressThreshold = defaultSkippedEpisodeProgressThreshold,
}) async {
  final minProgress = skippedEpisodeProgressThreshold(progressThreshold);
  final preliminary = resume.where((item) {
    if (item.type != 'Episode') return false;
    return (episodeProgress(item.rawData) ?? -1) >= minProgress;
  }).toList();
  if (preliminary.isEmpty) return resume;

  final seriesIds = <String>{
    for (final item in preliminary)
      if (item.seriesId != null && item.seriesId!.isNotEmpty) item.seriesId!,
  }.toList();

  final episodesBySeries = <String, List<Map<String, dynamic>>>{};
  await mapBounded(seriesIds, _seriesHydrationConcurrency, (seriesId) async {
    try {
      final response = await client.itemsApi.getEpisodes(
        seriesId,
        fields: _episodeFields,
      );
      final rawItems = response['Items'] as List? ?? const [];
      episodesBySeries[seriesId] = [
        for (final raw in rawItems)
          if (raw is Map<String, dynamic>)
            raw
          else if (raw is Map)
            raw.cast<String, dynamic>(),
      ];
    } catch (error, stack) {
      debugPrint(
        'Skipped episode series hydration failed for $seriesId: $error\n$stack',
      );
    }
    return null;
  });

  final classified = <AggregatedItem>[];
  for (final item in preliminary) {
    final seriesId = item.seriesId;
    if (seriesId == null) continue;
    final seriesEpisodes = episodesBySeries[seriesId];
    if (seriesEpisodes == null) continue;
    final frontierId = frontierEpisodeId(seriesEpisodes);
    if (frontierId != null && item.id == frontierId) continue;
    if (isStaleSkippedEpisode(item.rawData, seriesEpisodes, minProgress)) {
      classified.add(item);
    }
  }
  if (classified.isEmpty) return resume;

  final mutations = ItemMutationRepository(client);
  final completedIds = <String>{};
  for (final item in classified) {
    try {
      await mutations.setPlayed(item.id, isPlayed: true);
      completedIds.add(item.id);
    } catch (error, stack) {
      debugPrint(
        'Skipped episode mark played failed for ${item.id}: $error\n$stack',
      );
    }
  }
  if (completedIds.isEmpty) return resume;
  return resume.where((item) => !completedIds.contains(item.id)).toList();
}

/// Multi-server variant: groups resume items by [AggregatedItem.serverId] and
/// runs cleanup with the matching client from [clientsByServerId].
Future<List<AggregatedItem>> cleanupSkippedEpisodeEndingsMultiServer({
  required List<AggregatedItem> resume,
  required Map<String, MediaServerClient> clientsByServerId,
  Object? progressThreshold = defaultSkippedEpisodeProgressThreshold,
}) async {
  if (resume.isEmpty || clientsByServerId.isEmpty) return resume;

  final byServer = <String, List<AggregatedItem>>{};
  for (final item in resume) {
    byServer.putIfAbsent(item.serverId, () => []).add(item);
  }

  final completedKeys = <String>{};
  for (final entry in byServer.entries) {
    final client = clientsByServerId[entry.key];
    if (client == null) continue;
    final filtered = await cleanupSkippedEpisodeEndings(
      resume: entry.value,
      client: client,
      progressThreshold: progressThreshold,
    );
    final keptIds = {for (final item in filtered) item.id};
    for (final item in entry.value) {
      if (!keptIds.contains(item.id)) {
        completedKeys.add('${item.serverId}:${item.id}');
      }
    }
  }
  if (completedKeys.isEmpty) return resume;
  return [
    for (final item in resume)
      if (!completedKeys.contains('${item.serverId}:${item.id}')) item,
  ];
}
