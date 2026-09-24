import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/database/offline_database.dart';
import '../../../data/providers/offline_providers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/download_grouping.dart';
import '../../../util/download_utils.dart';
import '../../../util/focus/indexed_focus_nodes.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'widgets/saved_media_actions.dart';
import 'widgets/saved_media_menu.dart';
import 'widgets/saved_media_row.dart';

class _SavedSeason {
  const _SavedSeason(this.label, this.seasonId, this.episodes);

  final String label;
  final String? seasonId;
  final List<DownloadedItem> episodes;

  int get totalBytes =>
      episodes.fold(0, (sum, item) => sum + item.fileSizeBytes);
}

/// The seasons and episodes of one saved show.
///
/// Everything here comes off the season and episode numbers already stored on
/// each downloaded row, so the screen works with no server in reach.
class SavedShowScreen extends ConsumerStatefulWidget {
  const SavedShowScreen({
    super.key,
    required this.seriesId,
    required this.title,
  });

  final String seriesId;
  final String title;

  @override
  ConsumerState<SavedShowScreen> createState() => _SavedShowScreenState();
}

class _SavedShowScreenState extends ConsumerState<SavedShowScreen> {
  int _season = 0;
  final _backFocusNode = FocusNode(debugLabel: 'SavedShowBack');
  final _initialFocusNode = FocusNode(debugLabel: 'SavedShowInitialFocus');
  final _rowNodes = IndexedFocusNodes('SavedShowRow');
  final _seasonTabsFocusNode = FocusNode(debugLabel: 'SavedShowSeasonTabs');

  @override
  void dispose() {
    _backFocusNode.dispose();
    _initialFocusNode.dispose();
    _rowNodes.dispose();
    _seasonTabsFocusNode.dispose();
    super.dispose();
  }

  /// Episodes arrive in playing order, so walking them in order and starting a
  /// new season whenever the season number changes keeps that order intact.
  List<_SavedSeason> _seasons(
    AppLocalizations l10n,
    List<DownloadedItem> episodes,
  ) {
    final bySeason = <int?, List<DownloadedItem>>{};
    for (final episode in episodes) {
      bySeason.putIfAbsent(episode.parentIndexNumber, () => []).add(episode);
    }
    final keys = bySeason.keys.toList()
      ..sort((a, b) => (a ?? 1 << 30).compareTo(b ?? 1 << 30));
    return [
      for (final key in keys)
        _SavedSeason(
          _seasonLabel(l10n, key, bySeason[key]!.first.seasonName),
          bySeason[key]!.first.seasonId,
          bySeason[key]!,
        ),
    ];
  }

  String _seasonLabel(AppLocalizations l10n, int? number, String? name) {
    if (number == 0) return l10n.specials;
    if (number != null) return l10n.seasonNumber(number);
    return name?.isNotEmpty ?? false ? name! : l10n.seasons;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final episodes = ref
        .watch(downloadedEpisodesProvider(widget.seriesId))
        .maybeWhen(
          data: (value) => value,
          orElse: () => const <DownloadedItem>[],
        );
    final seasons = _seasons(l10n, episodes);

    // Deleting the last episode from here empties the screen, so go back
    // rather than leave an empty shell behind.
    if (seasons.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
      return const Scaffold(backgroundColor: Colors.transparent);
    }

    final seasonIndex = _season.clamp(0, seasons.length - 1);
    final current = seasons[seasonIndex];
    final totalBytes = episodes.fold<int>(
      0,
      (sum, item) => sum + item.fileSizeBytes,
    );

    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _initialFocusNode : null,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              _header(l10n, episodes.length, totalBytes, current),
              if (seasons.length > 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SlidingPillTabs(
                    labels: [for (final season in seasons) season.label],
                    alignment: Alignment.center,
                    selectedIndex: seasonIndex,
                    onChanged: (index) => setState(() => _season = index),
                    focusNode: _seasonTabsFocusNode,
                    onVerticalNavigation: (isUp) {
                      isUp
                          ? _backFocusNode.requestFocus()
                          : _rowNodes[0].requestFocus();
                      return true;
                    },
                  ),
                ),
              Expanded(child: _episodeList(l10n, current, seasons.length > 1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(
    AppLocalizations l10n,
    int episodeCount,
    int totalBytes,
    _SavedSeason current,
  ) => Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
    child: Row(
      children: [
        FocusableToolbarButton(
          icon: Icons.arrow_back,
          tooltip: l10n.back,
          focusNode: _backFocusNode,
          onTap: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onSurface,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            '${l10n.episodeCount(episodeCount)} • ${formatBytes(totalBytes)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.55),
              fontSize: 12.5,
            ),
          ),
        ),
        const Spacer(),
        FocusableToolbarButton(
          icon: Icons.more_vert,
          tooltip: l10n.more,
          onTap: () => _openSeasonMenu(l10n, current),
        ),
      ],
    ),
  );

  Widget _episodeList(
    AppLocalizations l10n,
    _SavedSeason season,
    bool hasSeasonTabs,
  ) => ListView.builder(
    padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
    itemCount: season.episodes.length,
    itemBuilder: (context, index) {
      final episode = season.episodes[index];
      return SavedMediaRow(
        key: ValueKey(episode.itemId),
        rowFocusNode: index == 0 && PlatformDetection.isTV
            ? _initialFocusNode
            : _rowNodes[index],
        title: episode.name,
        subtitle: savedMediaSubtitle(episode, insideShow: true),
        sizeLabel: formatBytes(episode.fileSizeBytes),
        posterPath: episode.thumbPath ?? episode.posterPath,
        fallbackIcon: Icons.live_tv_outlined,
        landscapeThumb: true,
        leadingNumber: episode.indexNumber?.toString(),
        badge: Icon(
          Icons.check_circle,
          size: 14,
          color: AppColorScheme.statusAvailable,
        ),
        onActivate: () => openSavedItem(context, episode),
        onPlay: () => openSavedItem(context, episode),
        onMenu: () => _openEpisodeMenu(l10n, episode),
        onNavigateUp: () => index == 0
            ? (hasSeasonTabs ? _seasonTabsFocusNode : _backFocusNode)
                  .requestFocus()
            : _rowNodes[index - 1].requestFocus(),
        onNavigateDown: () => index + 1 < season.episodes.length
            ? _rowNodes[index + 1].requestFocus()
            : null,
      );
    },
  );

  Future<void> _openEpisodeMenu(
    AppLocalizations l10n,
    DownloadedItem episode,
  ) async {
    await showSavedMediaMenu(
      context,
      title: episode.name,
      actions: [
        SavedMediaAction(
          icon: Icons.play_arrow,
          label: l10n.play,
          onSelect: () async => openSavedItem(context, episode),
        ),
        if (episode.playbackPositionTicks > 0)
          SavedMediaAction(
            icon: Icons.replay,
            label: l10n.savedMediaPlayFromStart,
            onSelect: () async => openSavedItem(context, episode),
          ),
        SavedMediaAction(
          icon: Icons.info_outline,
          label: l10n.savedMediaGoToDetails,
          onSelect: () async =>
              openSavedItem(context, episode, autoPlay: false),
        ),
        SavedMediaAction(
          icon: Icons.delete_outline,
          isDestructive: true,
          label: l10n.savedMediaDeleteDownload,
          onSelect: () async => deleteSavedItems(
            context,
            title: l10n.savedMediaDeleteDownload,
            message: [
              ?episodeNumberLabel(episode),
              episode.name,
            ].join(' • '),
            itemIds: [episode.itemId],
          ),
        ),
      ],
    );
  }

  Future<void> _openSeasonMenu(
    AppLocalizations l10n,
    _SavedSeason season,
  ) async {
    await showSavedMediaMenu(
      context,
      title: season.label,
      actions: [
        SavedMediaAction(
          icon: Icons.delete_outline,
          isDestructive: true,
          label: l10n.savedMediaDeleteSeason(season.label),
          onSelect: () async => deleteSavedItems(
            context,
            title: l10n.savedMediaDeleteSeason(season.label),
            message:
                '${l10n.episodeCount(season.episodes.length)} • ${formatBytes(season.totalBytes)}',
            itemIds: [for (final e in season.episodes) e.itemId],
          ),
        ),
      ],
    );
  }
}
