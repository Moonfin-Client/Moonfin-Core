import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/overview_text.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/anime_marker_badge.dart';
import '../../widgets/offline_aware_image.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'episode_browser.dart';

const _rowGap = 10.0;
const _rowExtent = 120.0 + _rowGap;
const _thumbWidth = 160.0;
const _thumbHeight = 90.0;

/// The player's episode browser: season tabs over the open season's
/// episodes, opening on the one that's playing.
class EpisodeBrowserPanel extends StatefulWidget {
  const EpisodeBrowserPanel({
    super.key,
    required this.controller,
    required this.imageApi,
    required this.onSelect,
  });

  final EpisodeBrowserController controller;
  final ImageApi imageApi;
  final ValueChanged<AggregatedItem> onSelect;

  @override
  State<EpisodeBrowserPanel> createState() => _EpisodeBrowserPanelState();
}

class _EpisodeBrowserPanelState extends State<EpisodeBrowserPanel> {
  final _tabsFocus = FocusNode(debugLabel: 'EpisodeBrowserTabs');
  final _placeholderFocus = FocusNode(debugLabel: 'EpisodeBrowserPlaceholder');
  final _rowFocus = <String, FocusNode>{};
  ScrollController? _scroll;
  String? _scrollSeasonId;
  bool _focusedRow = false;

  EpisodeBrowserController get _browser => widget.controller;

  @override
  void initState() {
    super.initState();
    _browser.addListener(_onChanged);
    _focusPlayingOnce();
  }

  @override
  void dispose() {
    _browser.removeListener(_onChanged);
    _tabsFocus.dispose();
    _placeholderFocus.dispose();
    for (final node in _rowFocus.values) {
      node.dispose();
    }
    _scroll?.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    setState(() {});
    _focusPlayingOnce();
  }

  FocusNode _nodeFor(String episodeId) => _rowFocus.putIfAbsent(
    episodeId,
    () => FocusNode(debugLabel: 'Episode $episodeId'),
  );

  /// The remote goes to the playing episode once the first list is drawn,
  /// unless the viewer has already moved up to the tabs.
  void _focusPlayingOnce() {
    final episodes = _browser.episodes;
    if (_focusedRow || episodes == null || episodes.isEmpty) return;
    _focusedRow = true;
    if (_tabsFocus.hasFocus) return;
    final playingId = _browser.playing.id;
    final target = episodes.any((episode) => episode.id == playingId)
        ? playingId
        : episodes.first.id;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _nodeFor(target).requestFocus();
    });
  }

  /// One per season, opened scrolled to the playing episode with the one
  /// before it still in view.
  ScrollController _scrollFor(String? seasonId, List<AggregatedItem> episodes) {
    final current = _scroll;
    if (current != null && _scrollSeasonId == seasonId) return current;
    // The list it belonged to is still attached until this frame swaps it out.
    WidgetsBinding.instance.addPostFrameCallback((_) => current?.dispose());
    final playingIndex = episodes.indexWhere(
      (episode) => episode.id == _browser.playing.id,
    );
    _scrollSeasonId = seasonId;
    return _scroll = ScrollController(
      initialScrollOffset: math.max(0, playingIndex - 1) * _rowExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final seasons = _browser.seasons;
    final episodes = _browser.episodes;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (seasons != null && seasons.length > 1)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: SlidingPillTabs(
                labels: [
                  for (final season in seasons)
                    episodeBrowserSeasonLabel(l10n, season),
                ],
                selectedIndex: math.max(
                  0,
                  seasons.indexWhere(
                    (season) => season.id == _browser.selectedSeasonId,
                  ),
                ),
                onChanged: (index) => _browser.selectSeason(seasons[index].id),
                focusNode: _tabsFocus,
              ),
            ),
          Expanded(
            child: episodes == null || episodes.isEmpty
                ? _placeholder(l10n, episodes)
                : _list(episodes),
          ),
        ],
      ),
    );
  }

  /// Holds the remote while there's nothing to pick, so Back still closes.
  Widget _placeholder(AppLocalizations l10n, List<AggregatedItem>? episodes) {
    const style = TextStyle(color: Colors.white70, fontSize: 15);
    final Widget content;
    if (_browser.failed) {
      content = Text(l10n.errorLoadingEpisodes, style: style);
    } else if (episodes == null) {
      content = const CircularProgressIndicator();
    } else {
      content = Text(l10n.noEpisodesLoaded, style: style);
    }
    return Focus(
      focusNode: _placeholderFocus,
      autofocus: true,
      child: Center(child: content),
    );
  }

  Widget _list(List<AggregatedItem> episodes) {
    final seasonId = _browser.selectedSeasonId;
    final hideOverview =
        GetIt.instance<UserPreferences>().effectiveHideDetailsMediaDescription;
    return ListView.builder(
      key: ValueKey(seasonId),
      controller: _scrollFor(seasonId, episodes),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemExtent: _rowExtent,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        return _EpisodeRow(
          episode: episode,
          imageUrl: episodeStillUrl(widget.imageApi, episode, maxWidth: 360),
          isPlaying: episode.id == _browser.playing.id,
          showOverview: !hidesMediaDescription(
            itemType: episode.type,
            hideMediaDescription: hideOverview,
          ),
          focusNode: _nodeFor(episode.id),
          onSelect: () => widget.onSelect(episode),
        );
      },
    );
  }
}

class _EpisodeRow extends StatefulWidget {
  const _EpisodeRow({
    required this.episode,
    required this.imageUrl,
    required this.isPlaying,
    required this.showOverview,
    required this.focusNode,
    required this.onSelect,
  });

  final AggregatedItem episode;
  final String? imageUrl;
  final bool isPlaying;
  final bool showOverview;
  final FocusNode focusNode;
  final VoidCallback onSelect;

  @override
  State<_EpisodeRow> createState() => _EpisodeRowState();
}

class _EpisodeRowState extends State<_EpisodeRow> {
  bool _focused = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    final focusColor = Color(prefs.get(UserPreferences.focusColor).colorValue);
    final accent = AppColorScheme.accent;
    final highlighted = _focused || _hovered;
    final episode = widget.episode;
    final overview = episode.overview;

    return Padding(
      padding: const EdgeInsets.only(bottom: _rowGap),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Focus(
          focusNode: widget.focusNode,
          onFocusChange: (focused) => setState(() => _focused = focused),
          onKeyEvent: (_, event) {
            if (!isActivateKey(event)) return KeyEventResult.ignored;
            widget.onSelect();
            return KeyEventResult.handled;
          },
          child: GestureDetector(
            onTap: widget.onSelect,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: highlighted
                    ? Colors.white.withValues(alpha: 0.14)
                    : widget.isPlaying
                    ? accent.withValues(alpha: 0.18)
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: AppRadius.circular(12),
                // Only the row with the remote gets a border, so it can't be
                // mistaken for the playing one when the two colors match.
                border: Border.all(
                  color: highlighted ? focusColor : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _thumb(accent),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          episodeBrowserLine(l10n, episode),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          episode.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        AnimeMarkerBadge(
                          seriesId: episode.seriesId,
                          episodeId: episode.id,
                          scale: 0.8,
                          padding: const EdgeInsets.only(top: 4),
                        ),
                        if (widget.showOverview &&
                            overview != null &&
                            overview.isNotEmpty)
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                overview,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.5,
                                  height: 1.3,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _thumb(Color accent) {
    final imageUrl = widget.imageUrl;
    final progress = episodeProgress(widget.episode);
    return ClipRRect(
      borderRadius: AppRadius.circular(8),
      child: SizedBox(
        width: _thumbWidth,
        height: _thumbHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: Colors.white.withValues(alpha: 0.06)),
            if (imageUrl != null)
              OfflineAwareImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => const SizedBox.shrink(),
              )
            else
              const Center(
                child: AdaptiveIcon(
                  Icons.movie,
                  color: Colors.white24,
                  size: 32,
                ),
              ),
            if (progress > 0)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 3,
                  backgroundColor: Colors.black38,
                  valueColor: AlwaysStoppedAnimation<Color>(accent),
                ),
              ),
            if (widget.episode.isPlayed)
              Positioned(
                top: 6,
                right: 6,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3),
                    child: AdaptiveIcon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
