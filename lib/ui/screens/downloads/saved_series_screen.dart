import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/database/offline_database.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../data/repositories/offline_repository.dart';
import '../../../data/services/storage_path_service.dart';
import '../../../util/platform_detection.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';
import '../../widgets/offline_image.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/focus/request_initial_focus.dart';

class SavedSeriesScreen extends ConsumerWidget {
  final String seriesId;

  const SavedSeriesScreen({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      RequestInitialFocus(child: _buildScreen(context, ref));

  Widget _buildScreen(BuildContext context, WidgetRef ref) {
    final seriesAsync = ref.watch(downloadedItemProvider(seriesId));
    final episodesAsync = ref.watch(downloadedEpisodesProvider(seriesId));

    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: SafeArea(
        child: seriesAsync.when(
          data: (series) {
            if (series == null) {
              return Center(
                child: Text(
                  AppLocalizations.of(context).seriesNotFound,
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                  ),
                ),
              );
            }
            return _buildContent(context, ref, series, episodesAsync);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => Center(
            child: Text(
              AppLocalizations.of(context).errorLoadingSeries,
              style: TextStyle(color: AppColorScheme.statusRequested),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    DownloadedItem series,
    AsyncValue<List<DownloadedItem>> episodesAsync,
  ) {
    final metadata = _parseMetadata(series.metadataJson);
    final overview = metadata['Overview'] as String? ?? '';
    final year = metadata['ProductionYear']?.toString() ?? '';
    final rating = metadata['OfficialRating'] as String? ?? '';

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(context, series, overview, year, rating)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Text(
              AppLocalizations.of(context).downloadedEpisodes,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        episodesAsync.when(
          data: (episodes) => _buildSeasonList(context, ref, episodes),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppLocalizations.of(context).errorLoadingSeries,
                style: TextStyle(color: AppColorScheme.statusRequested),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    DownloadedItem series,
    String overview,
    String year,
    String rating,
  ) {
    return Stack(
      children: [
        if (series.backdropPath != null)
          SizedBox(
            height: 220,
            width: double.infinity,
            child: ShaderMask(
              shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorScheme.scrim.withValues(alpha: 0.3),
                  AppColorScheme.scrim,
                ],
              ).createShader(rect),
              blendMode: BlendMode.darken,
              child: OfflineImage(
                localPath: series.backdropPath,
                width: double.infinity,
                height: 220,
              ),
            ),
          ),
        if (!PlatformDetection.isTV)
            Positioned(
            top: series.backdropPath != null ? 140 : 16,
            left: 20,
            child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColorScheme.onSurface),
              onPressed: () => context.pop(),
              style: IconButton.styleFrom(
                backgroundColor: AppColorScheme.scrim.withValues(alpha: 0.45),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: series.backdropPath != null ? 180 : 60, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (series.logoPath != null)
                OfflineImage(localPath: series.logoPath, height: 60)
              else
                Text(
                  series.name,
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (year.isNotEmpty) _chip(year),
                  if (rating.isNotEmpty) _chip(rating),
                ],
              ),
              if (overview.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _chip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: AppRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          fontSize: 12,
        ),
      ),
    );
  }

  SliverList _buildSeasonList(BuildContext context, WidgetRef ref, List<DownloadedItem> episodes) {
    final seasons = <int?, List<DownloadedItem>>{};
    for (final ep in episodes) {
      (seasons[ep.parentIndexNumber] ??= []).add(ep);
    }
    final sortedKeys = seasons.keys.toList()..sort((a, b) => (a ?? 0).compareTo(b ?? 0));

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final seasonNum = sortedKeys[index];
          final seasonEpisodes = seasons[seasonNum]!;
          final seasonId = seasonEpisodes.first.seasonId;
          final seasonLabel = seasonNum != null ? AppLocalizations.of(context).seasonNumber(seasonNum) : AppLocalizations.of(context).specials;

          return _SeasonSection(
            label: seasonLabel,
            episodeCount: seasonEpisodes.length,
            onTap: seasonId != null
                ? () => context.push(Destinations.downloadedSeason(seriesId, seasonId))
                : null,
            onLongPress: seasonId != null
                ? () => _confirmDeleteSeason(context, ref, seasonLabel, seasonId, seasonEpisodes)
                : null,
          );
        },
        childCount: sortedKeys.length,
      ),
    );
  }

  Map<String, dynamic> _parseMetadata(String json) {
    try {
      return jsonDecode(json) as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }

  Future<void> _confirmDeleteSeason(
    BuildContext context,
    WidgetRef ref,
    String seasonLabel,
    String seasonId,
    List<DownloadedItem> episodes,
  ) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.deleteSeason),
        content: Text(l10n.deleteAllEpisodesInSeason(seasonLabel)),
        actions: [
          adaptiveDialogAction(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColorScheme.statusRequested,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final repo = GetIt.instance<OfflineRepository>();
    final storagePath = GetIt.instance<StoragePathService>();
    final imageDir = await storagePath.getImageCacheDir();

    for (final ep in episodes) {
      if (ep.localFilePath != null) {
        final f = File(ep.localFilePath!);
        if (await f.exists()) await f.delete();
      }
      final imgDir = Directory('${imageDir.path}/${ep.itemId}');
      if (await imgDir.exists()) await imgDir.delete(recursive: true);
    }
    await repo.deleteSeasonItems(seasonId);
    ref.invalidate(downloadedEpisodesProvider(seriesId));
  }
}

class _SeasonSection extends StatelessWidget {
  final String label;
  final int episodeCount;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const _SeasonSection({
    required this.label,
    required this.episodeCount,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        label,
        style: TextStyle(
          color: AppColorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        AppLocalizations.of(context).episodeCount(episodeCount),
        style: TextStyle(
          color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          fontSize: 13,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: AppColorScheme.onSurface.withValues(alpha: 0.38),
      ),
    );
  }
}
