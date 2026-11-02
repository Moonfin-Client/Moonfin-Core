import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/book/book_card.dart';
import '../../widgets/book/book_cover_strip_card.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_widgets.dart';
import 'book_category_screen.dart';

enum _Kind { books, audiobooks, comics, series, authors }

/// The library's favorites as a board of panels by kind, each opening its
/// whole list as a grid in place.
class BookFavoritesScreen extends StatefulWidget {
  final String libraryId;

  const BookFavoritesScreen({super.key, required this.libraryId});

  @override
  State<BookFavoritesScreen> createState() => _BookFavoritesScreenState();
}

class _BookFavoritesScreenState extends BookCategoryState<BookFavoritesScreen> {
  BookFavorites? _favorites;
  bool _asked = false;

  /// The kind whose See All is open.
  _Kind? _open;
  double _boardOffset = 0;

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => _favorites == null;

  @override
  bool get holdsBack => _open != null;

  @override
  void releaseBack() {
    final kind = _open!;
    setState(() => _open = null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      scrollController.jumpTo(_boardOffset);
      node('fav:${kind.name}:all').requestFocus();
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void contentChanged() {
    _load();
    super.contentChanged();
  }

  // The favorites ask for the library's types and series, so they wait for
  // the library to load.
  void _load() {
    if (_asked || vm.isLoading) return;
    _asked = true;
    unawaited(
      vm.loadFavorites().then((favorites) {
        _favorites = favorites;
        contentChanged();
      }),
    );
  }

  void _seeAll(_Kind kind) {
    _boardOffset = scrollController.offset;
    setState(() => _open = kind);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      scrollController.jumpTo(0);
      focusBody();
    });
  }

  List<AggregatedItem> _items(_Kind kind) {
    final favorites = _favorites!;
    return switch (kind) {
      _Kind.books => favorites.titles.where(vm.isBookItem).toList(),
      _Kind.audiobooks => favorites.titles.where(vm.isAudiobookItem).toList(),
      _Kind.comics => favorites.titles.where(vm.isComicItem).toList(),
      _Kind.series => favorites.series,
      _Kind.authors => favorites.authors,
    };
  }

  String _label(AppLocalizations l10n, _Kind kind) => switch (kind) {
    _Kind.books => l10n.books,
    _Kind.audiobooks => l10n.audiobooks,
    _Kind.comics => l10n.comics,
    _Kind.series => l10n.series,
    _Kind.authors => l10n.authors,
  };

  /// How many of [kind] its panel shows.
  int _per(_Kind kind) => kind == _Kind.series ? 2 : (wide ? 4 : 3);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) => buildSections(
          () => _addSections(l10n, constraints.maxWidth),
          onRefresh: () {
            _asked = false;
            return vm.load();
          },
          header: () => _buildHeader(l10n),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final favorites = _favorites;
    final open = _open;
    final count = favorites == null
        ? 0
        : open != null
        ? _items(open).length
        : favorites.titles.length +
              favorites.series.length +
              favorites.authors.length;
    return buildHeader(
      title: open == null
          ? BookCategoryKind.favorites.label(l10n)
          : _label(l10n, open),
      count: count > 0 ? l10n.bookFavoriteCount(count) : null,
      firstNode: open == null ? null : node('back'),
      leading: open == null
          ? null
          : MusicPillButton(
              focusNode: node('back'),
              icon: Icons.arrow_back_rounded,
              semanticLabel: l10n.back,
              onTap: releaseBack,
              onNavigateUp: () => move(headerIndex, true),
              onNavigateDown: () => move(headerIndex, false),
              onNavigateLeft: leaveLeft,
              onNavigateRight: () {},
            ),
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    if (_favorites == null) return addLoadingSection();
    final open = _open;
    if (open != null) return _addGrid(l10n, open, width);
    final panels = [
      for (final kind in _Kind.values)
        if (_items(kind).isNotEmpty) kind,
    ];
    if (panels.isEmpty) return addEmptySection();
    final columns = wide ? 2 : 1;
    final panelWidth = cellWidth(width, columns);
    for (var start = 0; start < panels.length; start += columns) {
      final stop = addStop(
        RowFocusEntry.node(
          node('fav:${panels[start].name}:0'),
          containerKey: sectionKey('fav:$start'),
        ),
      );
      addSection(
        Padding(
          key: sectionKey('fav:$start'),
          padding: EdgeInsets.fromLTRB(inset, 8, endInset, gridSpacing - 8),
          child: _cardRow(panelWidth, [
            for (
              var p = start;
              p < math.min(start + columns, panels.length);
              p++
            )
              _buildPanel(l10n, panels, p, columns, stop, panelWidth),
          ]),
        ),
      );
    }
  }

  /// One kind's panel. Its cards step Up onto its See All, and Up again goes
  /// to the panel above.
  Widget _buildPanel(
    AppLocalizations l10n,
    List<_Kind> panels,
    int p,
    int columns,
    int stop,
    double width,
  ) {
    final kind = panels[p];
    final all = _items(kind);
    final shown = all.take(_per(kind)).toList();
    int lastOf(int p) =>
        math.min(_items(panels[p]).length, _per(panels[p])) - 1;
    final column = p % columns;
    final beside = column < columns - 1 && p + 1 < panels.length;
    FocusNode seeAll(int p) => node('fav:${panels[p].name}:all');
    FocusNode card(int p, int i) => node('fav:${panels[p].name}:$i');
    const pad = 20.0;
    final cell =
        (width - pad * 2 - gridSpacing * (_per(kind) - 1)) / _per(kind);
    final onSurface = AppColorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(pad),
      decoration: BoxDecoration(
        color: onSurface.withValues(alpha: 0.05),
        borderRadius: AppRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  _label(l10n, kind),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: musicSectionTitleStyle(large: false),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${all.length}',
                style: TextStyle(
                  fontSize: 15,
                  color: onSurface.withValues(alpha: 0.65),
                ),
              ),
              const Spacer(),
              MusicPillButton(
                focusNode: seeAll(p),
                icon: Icons.chevron_right_rounded,
                label: l10n.seeAll,
                height: 36,
                onTap: () => _seeAll(kind),
                onNavigateUp: p < columns
                    ? () => move(stop, true)
                    : card(p - columns, 0).requestFocus,
                onNavigateDown: card(p, 0).requestFocus,
                onNavigateLeft: column == 0
                    ? leaveLeft
                    : seeAll(p - 1).requestFocus,
                onNavigateRight: beside ? seeAll(p + 1).requestFocus : () {},
              ),
            ],
          ),
          SizedBox(height: 12 + _headroom(kind, cell)),
          _cardRow(cell, [
            for (var i = 0; i < shown.length; i++)
              _card(
                l10n,
                kind,
                shown[i],
                card(p, i),
                _arrows(
                  MusicGridEdges(
                    up: seeAll(p).requestFocus,
                    down: p + columns < panels.length
                        ? card(p + columns, 0).requestFocus
                        : () => move(stop, false),
                    left: i > 0
                        ? card(p, i - 1).requestFocus
                        : column == 0
                        ? leaveLeft
                        : card(p - 1, lastOf(p - 1)).requestFocus,
                    right: i < shown.length - 1
                        ? card(p, i + 1).requestFocus
                        : beside
                        ? card(p + 1, 0).requestFocus
                        : () {},
                  ),
                ),
              ),
          ]),
        ],
      ),
    );
  }

  /// All of [kind] as a grid, a row to a section.
  void _addGrid(AppLocalizations l10n, _Kind kind, double width) {
    final items = _items(kind);
    final columns = kind == _Kind.series
        ? columnsFor(width, cardWidth: 360, phone: 1)
        : columnsFor(width);
    final cell = cellWidth(width, columns);
    final stop = addStop(
      RowFocusEntry.node(node('all:0'), containerKey: sectionKey('all:0')),
    );
    for (var start = 0; start < items.length; start += columns) {
      addSection(
        Padding(
          key: sectionKey('all:$start'),
          padding: EdgeInsets.fromLTRB(
            inset,
            _headroom(kind, cell),
            endInset,
            gridSpacing,
          ),
          child: _cardRow(cell, [
            for (
              var i = start;
              i < math.min(start + columns, items.length);
              i++
            )
              _card(
                l10n,
                kind,
                items[i],
                node('all:$i'),
                (_, event) => gridKey(
                  event,
                  id: 'all',
                  index: i,
                  count: items.length,
                  columns: columns,
                  stop: stop,
                ),
              ),
          ]),
        ),
      );
    }
  }

  double _headroom(_Kind kind, double cell) => kind == _Kind.series
      ? 0
      : MediaCard.focusHeadroom(
          kind == _Kind.authors ? cell : cell * 1.5,
          expansion: cardFocusExpansion,
        );

  Widget _cardRow(double cell, List<Widget> cards) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < cards.length; i++) ...[
        if (i > 0) SizedBox(width: gridSpacing),
        SizedBox(width: cell, child: cards[i]),
      ],
    ],
  );

  /// What the arrows do on a panel's card.
  FocusOnKeyEventCallback _arrows(MusicGridEdges edges) => (_, event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    final edge = key.isUpKey
        ? edges.up
        : key.isDownKey
        ? edges.down
        : key.isLeftKey
        ? edges.left
        : key.isRightKey
        ? edges.right
        : null;
    if (edge == null) return KeyEventResult.ignored;
    edge();
    return KeyEventResult.handled;
  };

  /// A title as its book card, a series as a strip of its covers and an
  /// author as a round portrait.
  Widget _card(
    AppLocalizations l10n,
    _Kind kind,
    AggregatedItem item,
    FocusNode focus,
    FocusOnKeyEventCallback onKey,
  ) {
    void open() => openItem(item);
    final onFocus = wide ? () => reveal(focus) : null;
    final expansion = cardFocusExpansion;
    switch (kind) {
      case _Kind.series:
        final covers = vm.seriesCoverUrls(item);
        final cover = vm.bookImageUrl(item);
        return BookCoverStripCard(
          covers: covers.isEmpty && cover != null ? [cover] : covers,
          slots: 3,
          title: item.name,
          lines: [vm.bookSubtitle(item)],
          focusNode: focus,
          onTap: open,
          onKeyEvent: onKey,
        );
      case _Kind.authors:
        final count = vm.authorTitleCount(item);
        return MediaCard(
          width: double.infinity,
          aspectRatio: 1,
          title: item.name,
          subtitle: count > 0 ? l10n.bookSeriesItemCount(count) : null,
          imageUrl: vm.bookImageUrl(item),
          // MediaCard only draws Person cards round.
          itemType: 'Person',
          cardFocusExpansion: expansion,
          focusNode: focus,
          onFocus: onFocus,
          onKeyEvent: onKey,
          onTap: open,
        );
      default:
        final isAudio = vm.isAudiobookItem(item);
        return BookCard(
          item: item,
          isAudiobook: isAudio,
          subtitle: vm.bookSubtitle(item),
          imageUrl: vm.bookImageUrl(item),
          remaining: isAudio ? vm.remainingFor(item) : null,
          cardFocusExpansion: expansion,
          focusNode: focus,
          onFocus: onFocus,
          onKeyEvent: onKey,
          onTap: open,
          onLongPress: () => showItemMenu(item),
        );
    }
  }
}
