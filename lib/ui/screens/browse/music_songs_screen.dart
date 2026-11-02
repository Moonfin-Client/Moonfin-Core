import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/music_browse_view_model.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import 'music_category_screen.dart';

/// A music library's songs as four mixes that play at once, over the songs
/// played most and the newest ones.
class MusicSongsScreen extends StatefulWidget {
  final String libraryId;

  const MusicSongsScreen({super.key, required this.libraryId});

  @override
  State<MusicSongsScreen> createState() => _MusicSongsScreenState();
}

class _MusicSongsScreenState extends MusicCategoryState<MusicSongsScreen> {
  bool _loading = true;
  int _count = 0;
  List<AggregatedItem> _mostPlayed = const [];
  List<AggregatedItem> _fresh = const [];
  bool _starting = false;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => _loading;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    try {
      final (count, mostPlayed, fresh) = await (
        queries.songCount(),
        queries.mix(MusicMix.mostPlayed, limit: 5),
        queries.mix(MusicMix.freshArrivals, limit: 5),
      ).wait;
      _count = count;
      _mostPlayed = mostPlayed;
      _fresh = fresh;
    } catch (e) {
      debugPrint('Failed to load the music songs: $e');
    }
    _loading = false;
    contentChanged();
  }

  Future<void> _play(MusicMix mix) async {
    if (_starting) return;
    _starting = true;
    try {
      final tracks = await queries.mix(mix);
      if (mounted) await playMusicTracks(context, tracks);
    } catch (e) {
      debugPrint('Failed to play the $mix mix: $e');
    } finally {
      _starting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => buildSections(
        () => _addSections(l10n),
        onRefresh: _load,
        header: () => buildHeader(
          title: l10n.songs,
          count: _count > 0 ? l10n.musicSongCount(_count) : null,
          firstNode: node('all'),
          actions: [
            MusicPillButton(
              focusNode: node('all'),
              icon: Icons.sort_by_alpha_rounded,
              label: l10n.allSongsAToZ,
              onTap: () => context.push(
                Destinations.library(
                  libraryId,
                  includeItemTypes: const ['Audio'],
                ),
              ),
              onNavigateUp: () => move(headerIndex, true),
              onNavigateDown: () => move(headerIndex, false),
              onNavigateRight: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n) {
    if (_loading) {
      addLoadingSection();
      return;
    }
    final mixes = [
      (MusicMix.everything, l10n.shuffle, l10n.musicMixEverything,
          l10n.musicMixEverythingSubtitle, null),
      (MusicMix.mostPlayed, l10n.musicMix, l10n.mostPlayed,
          l10n.musicMixMostPlayedSubtitle, kMusicTileColors[4]),
      (MusicMix.freshArrivals, l10n.musicMix, l10n.musicMixFreshArrivals,
          l10n.musicMixFreshArrivalsSubtitle, kMusicTileColors[7]),
      (MusicMix.rediscover, l10n.musicMix, l10n.musicMixRediscover,
          l10n.musicMixRediscoverSubtitle, kMusicTileColors[3]),
    ];
    final mixStop = addStop(
      RowFocusEntry.node(node('mix:0'), containerKey: sectionKey('mixes')),
    );
    final columns = wide ? 4 : 2;
    addSection(
      Padding(
        key: sectionKey('mixes'),
        padding: EdgeInsets.fromLTRB(inset, wide ? 22 : 16, endInset, 0),
        child: MusicGrid(
          columns: columns,
          spacing: wide ? 20 : 12,
          children: [
            for (var i = 0; i < mixes.length; i++)
              _MixCard(
                focusNode: node('mix:$i'),
                eyebrow: mixes[i].$2,
                title: mixes[i].$3,
                subtitle: mixes[i].$4,
                color: mixes[i].$5,
                compact: !wide,
                height: wide ? 150 : 132,
                onTap: () => unawaited(_play(mixes[i].$1)),
                edges: MusicGridEdges.of(
                  i,
                  count: mixes.length,
                  columns: columns,
                  onLeaveUp: () => move(mixStop, true),
                  onLeaveDown: () => move(mixStop, false),
                  onLeaveLeft: leaveLeft,
                  onLeaveRight: () {},
                ),
              ),
          ],
        ),
      ),
    );

    final lists = [
      if (_mostPlayed.isNotEmpty)
        ('top', l10n.mostPlayed, _mostPlayed, true),
      if (_fresh.isNotEmpty) ('fresh', l10n.recentlyAdded, _fresh, false),
    ];
    if (lists.isEmpty) return;
    if (wide) {
      final stop = addStop(
        RowFocusEntry.node(
          node('${lists.first.$1}:0'),
          containerKey: sectionKey('lists'),
        ),
      );
      addSection(
        Padding(
          key: sectionKey('lists'),
          padding: EdgeInsets.fromLTRB(inset, 0, endInset, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < lists.length; i++) ...[
                if (i > 0) const SizedBox(width: 40),
                Expanded(
                  child: _buildList(
                    l10n,
                    lists[i],
                    stop,
                    first: i == 0,
                    last: i == lists.length - 1,
                  ),
                ),
              ],
              if (lists.length == 1) const Spacer(),
            ],
          ),
        ),
      );
      return;
    }
    for (final list in lists) {
      final stop = addStop(
        RowFocusEntry.node(
          node('${list.$1}:0'),
          containerKey: sectionKey(list.$1),
        ),
      );
      addSection(
        KeyedSubtree(
          key: sectionKey(list.$1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: inset),
            child: _buildList(l10n, list, stop, first: true, last: true),
          ),
        ),
      );
    }
  }

  Widget _buildList(
    AppLocalizations l10n,
    (String, String, List<AggregatedItem>, bool) list,
    int stop, {
    required bool first,
    required bool last,
  }) {
    final (id, title, items, ranked) = list;
    return MusicSection(
      title: title,
      large: wide,
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            MusicTrackTile(
              title: items[i].name,
              subtitle: musicArtistNames(items[i]),
              imageUrl: musicImageUrl(items[i], maxHeight: 120),
              rank: ranked ? '${i + 1}' : null,
              trailing: ranked
                  ? l10n.musicPlayCount(_playCount(items[i]))
                  : musicRunTime(items[i]),
              focusNode: node('$id:$i'),
              onTap: () => openMusicItem(context, items[i]),
              edges: MusicGridEdges.of(
                i,
                count: items.length,
                columns: 1,
                onLeaveUp: () => move(stop, true),
                onLeaveDown: () => move(stop, false),
                onLeaveLeft: first ? leaveLeft : null,
              ),
              onNavigateRight: last ? () {} : null,
            ),
        ],
      ),
    );
  }

  int _playCount(AggregatedItem item) =>
      ((item.rawData['UserData'] as Map?)?['PlayCount'] as num?)?.toInt() ?? 0;
}

/// A mix as a colored card that plays it when picked. Without a [color] it
/// takes the theme's accent.
class _MixCard extends StatelessWidget {
  final FocusNode focusNode;
  final String eyebrow;
  final String title;
  final String subtitle;
  final Color? color;
  final double height;
  final VoidCallback onTap;
  final MusicGridEdges edges;

  /// A phone's narrower card, with a smaller title.
  final bool compact;

  const _MixCard({
    required this.focusNode,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.compact,
    required this.height,
    required this.onTap,
    required this.edges,
  });

  @override
  Widget build(BuildContext context) {
    final background = color ?? AppColorScheme.accent;
    final foreground = color == null ? AppColorScheme.onAccent : Colors.white;
    return FocusableWrapper(
      highlightOnHover: true,
      focusNode: focusNode,
      borderRadius: 16,
      autoScroll: true,
      onSelect: onTap,
      onNavigateUp: edges.up,
      onNavigateDown: edges.down,
      onNavigateLeft: edges.left,
      onNavigateRight: edges.right,
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(18, 16, 14, 14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: foreground.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: compact ? 18 : 22,
                    fontWeight: FontWeight.w800,
                    color: foreground,
                  ),
                ),
                const SizedBox(height: 2),
                // Clear of the play button in the corner.
                Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: foreground.withValues(alpha: 0.85),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: foreground.withValues(alpha: 0.2),
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 26,
                  color: foreground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
