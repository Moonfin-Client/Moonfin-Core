import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/utils/alphabet_bucket.dart';
import '../../../data/viewmodels/music_category_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/alphabet_scrub_rail.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/sliding_pill_tabs.dart';
import 'music_category_screen.dart';

/// A music library's artists as round portraits under a heading for each
/// letter, with a rail down the side that jumps to any letter.
class MusicArtistsScreen extends StatefulWidget {
  final String libraryId;

  /// Opens on every artist rather than only album artists.
  final bool allArtists;

  const MusicArtistsScreen({
    super.key,
    required this.libraryId,
    this.allArtists = false,
  });

  @override
  State<MusicArtistsScreen> createState() => _MusicArtistsScreenState();
}

class _MusicArtistsScreenState
    extends MusicCategoryState<MusicArtistsScreen> {
  static const _railWidth = 44.0;

  late bool _albumArtists = !widget.allArtists;
  bool _descending = false;
  late final _artists = MusicPagedItems(
    (start, limit) => queries.artists(
      albumArtists: _albumArtists,
      descending: _descending,
      start: start,
      limit: limit,
    ),
  );
  bool _loaded = false;

  /// The letter of the section that has focus, picked out on the rail.
  String _letter = kAlphabetLetters.first;

  /// Where each letter's heading starts in the list, by the index of its
  /// first artist.
  final _headingOffsets = <int, double>{};
  int _stop = -1;
  int _jump = 0;

  List<AggregatedItem> _letteredItems = const [];
  List<String> _itemLetters = const [];

  /// Each loaded artist's letter, worked out once per page rather than on
  /// every rebuild.
  List<String> get _letters {
    final items = _artists.items;
    if (!identical(items, _letteredItems)) {
      _letteredItems = items;
      _itemLetters = [for (final item in items) alphabetBucketOf(item)];
    }
    return _itemLetters;
  }

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => !_loaded;

  double get _headingExtent => wide ? 56 : 44;

  @override
  void initState() {
    super.initState();
    _artists.addListener(_onArtists);
    unawaited(_artists.load());
  }

  @override
  void dispose() {
    _artists.removeListener(_onArtists);
    _artists.dispose();
    super.dispose();
  }

  void _onArtists() {
    if (!_artists.isLoading) _loaded = true;
    contentChanged();
  }

  void _reload() => unawaited(_artists.load());

  void _setLetter(String letter) {
    if (letter != _letter) setState(() => _letter = letter);
  }

  int _rank(AggregatedItem item) =>
      kAlphabetLetters.indexOf(alphabetBucketOf(item));

  /// Pages until [letter] or the next letter after it has loaded, then
  /// scrolls its heading to the top and focuses its first artist.
  Future<void> _jumpTo(String letter) async {
    final jump = ++_jump;
    final target = kAlphabetLetters.indexOf(letter);
    var index = await _artists.loadUntil(
      (item) => _descending ? _rank(item) <= target : _rank(item) >= target,
    );
    if (!mounted || jump != _jump) return;
    if (index < 0) index = _artists.items.length - 1;
    if (index < 0) return;
    // The new pages lay out first, which is where the offsets come from.
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || jump != _jump) return;
    final start = _headingOffsets.keys
        .where((start) => start <= index)
        .fold(0, max);
    if (scrollController.hasClients) {
      final position = scrollController.position;
      scrollController.jumpTo(
        min(_headingOffsets[start] ?? 0, position.maxScrollExtent),
      );
    }
    if (!wide) return;
    await WidgetsBinding.instance.endOfFrame;
    if (mounted && jump == _jump) node('artist:$start').requestFocus();
  }

  void _focusRail() => node('letter:$_letter').requestFocus();

  /// Back from the rail to the first artist under its letter.
  void _leaveRail() {
    final index = _letters.indexOf(_letter);
    final target = node('artist:${max(index, 0)}');
    if (target.context?.mounted == true) {
      target.requestFocus();
    } else {
      move(headerIndex, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) {
          final width =
              constraints.maxWidth -
              (wide ? _railWidth : kAlphabetScrubRailWidth);
          return buildSections(
            () => _addSections(l10n, width),
            onRefresh: _artists.load,
            header: () => _buildHeader(l10n),
            body: (list, bottom) => Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: list),
                if (_artists.items.isNotEmpty)
                  wide
                      ? _buildRail(l10n)
                      : Padding(
                          padding: EdgeInsets.only(bottom: bottom),
                          child: SizedBox(
                            width: kAlphabetScrubRailWidth,
                            child: AlphabetScrubRail(onLetter: _jumpTo),
                          ),
                        ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final total = _artists.total;
    return buildHeader(
      title: l10n.artists,
      count: total > 0 ? l10n.musicArtistCount(total) : null,
      firstNode: node('tabs'),
      tabs: SlidingPillTabs(
        labels: [l10n.albumArtists, l10n.allArtists],
        selectedIndex: _albumArtists ? 0 : 1,
        alignment: wide ? Alignment.centerRight : Alignment.centerLeft,
        focusNode: node('tabs'),
        onChanged: (index) {
          if (_albumArtists == (index == 0)) return;
          setState(() => _albumArtists = index == 0);
          reloadSoon(_reload);
        },
        onVerticalNavigation: (isUp) => moveOrHold(headerIndex, isUp),
        onExitLeft: leaveLeft,
        onExitRight: node('sort').requestFocus,
      ),
      actions: [
        MusicPillButton(
          focusNode: node('sort'),
          icon: Icons.sort_by_alpha_rounded,
          label: _descending ? l10n.libraryZToA : l10n.libraryAToZ,
          onTap: () {
            setState(() => _descending = !_descending);
            _reload();
          },
          onNavigateUp: () => move(headerIndex, true),
          onNavigateDown: () => move(headerIndex, false),
        ),
        MusicPillButton(
          focusNode: node('shuffle'),
          icon: Icons.shuffle_rounded,
          label: l10n.shuffleAll,
          onTap: () => unawaited(
            shuffleMusic(
              context,
              parentId: libraryId,
              serverId: queries.serverId,
            ),
          ),
          onNavigateUp: () => move(headerIndex, true),
          onNavigateDown: () => move(headerIndex, false),
          onNavigateRight: () {},
        ),
      ],
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    final items = _artists.items;
    final letters = _letters;
    _headingOffsets.clear();
    if (_artists.isLoading) {
      addLoadingSection();
      return;
    }
    if (items.isEmpty) {
      addSection(emptyMessage(l10n));
      return;
    }
    final columns = wide
        ? columnsFor(width, cardWidth: 140, min: 3, max: 9)
        : columnsFor(width, cardWidth: 96, min: 3, max: 5);
    final cell = cellWidth(width, columns);
    final rowExtent = gridRowExtent(cell, hasSubtitle: false);
    int? stop;
    var offset = 0.0;
    var start = 0;
    while (start < items.length) {
      final letter = letters[start];
      var end = start + 1;
      while (end < items.length && letters[end] == letter) {
        end++;
      }
      _headingOffsets[start] = offset;
      addSection(_buildHeading(letter));
      stop = addCardGrid(
        id: 'artist',
        items: items,
        columns: columns,
        cell: cell,
        rowExtent: rowExtent,
        first: start,
        end: end,
        stopIndex: stop,
        round: true,
        onSelect: (item, _) => openMusicItem(context, item),
        onFocus: (index) => _setLetter(letters[index]),
        onLeaveRight: wide ? _focusRail : null,
        onNearEnd: end == items.length ? _artists.loadMore : null,
      );
      offset +=
          _headingExtent + ((end - start + columns - 1) ~/ columns) * rowExtent;
      start = end;
    }
    _stop = stop ?? -1;
  }

  Widget _buildHeading(String letter) => SizedBox(
    height: _headingExtent,
    child: Padding(
      padding: EdgeInsets.only(left: inset, right: endInset, bottom: 4),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          letter,
          style: TextStyle(
            fontSize: wide ? 28 : 22,
            fontWeight: FontWeight.w800,
            color: AppColorScheme.accent,
          ),
        ),
      ),
    ),
  );

  Widget _buildRail(AppLocalizations l10n) {
    final onSurface = AppColorScheme.onSurface;
    return Semantics(
      label: l10n.libraryJumpToLetter,
      child: SizedBox(
        width: _railWidth,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 24),
          children: [
            for (var i = 0; i < kAlphabetLetters.length; i++)
              FocusableWrapper(
                highlightOnHover: true,
                focusNode: node('letter:${kAlphabetLetters[i]}'),
                borderRadius: 8,
                disableScale: true,
                autoScroll: true,
                onSelect: () => _jumpTo(kAlphabetLetters[i]),
                onNavigateLeft: _leaveRail,
                onNavigateRight: () {},
                onNavigateUp: i == 0 ? () => move(_stop, true) : null,
                onNavigateDown: i == kAlphabetLetters.length - 1 ? () {} : null,
                child: SizedBox(
                  height: 26,
                  child: Center(
                    child: Text(
                      kAlphabetLetters[i],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: kAlphabetLetters[i] == _letter
                            ? AppColorScheme.accent
                            : onSurface.withValues(alpha: 0.7),
                      ),
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
