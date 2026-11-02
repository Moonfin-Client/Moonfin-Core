import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/utils/alphabet_bucket.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../widgets/alphabet_scrub_rail.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_widgets.dart';
import 'book_category_screen.dart';

/// A book library's authors. Phones show their portraits under a heading for
/// each letter, with a rail that jumps to any letter. Wide screens list them
/// beside the focused author and their books.
class BookAuthorsScreen extends StatefulWidget {
  final String libraryId;

  const BookAuthorsScreen({super.key, required this.libraryId});

  @override
  State<BookAuthorsScreen> createState() => _BookAuthorsScreenState();
}

class _BookAuthorsScreenState extends BookCategoryState<BookAuthorsScreen> {
  static const _headingExtent = 44.0;

  bool _askedAuthors = false;
  bool _descending = false;

  /// Where each letter's heading starts in the phone wall.
  final _letterOffsets = <String, double>{};

  /// The author shown beside the list on wide screens.
  int _shown = 0;
  Timer? _showTimer;
  int _stop = -1;
  final _bios = <String, String>{};
  final _spotlight = RowFocusCoordinator();

  @override
  String get libraryId => widget.libraryId;

  @override
  bool get isLoading => vm.isLoading || !vm.authorsLoaded;

  @override
  void initState() {
    super.initState();
    _loadAuthors();
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    super.dispose();
  }

  @override
  void contentChanged() {
    _loadAuthors();
    super.contentChanged();
  }

  // The people credited on the titles arrive with the library, so the
  // authors wait for it.
  void _loadAuthors() {
    if (_askedAuthors || vm.isLoading) return;
    _askedAuthors = true;
    unawaited(vm.loadAuthors());
  }

  /// Shows the author at [index] once focus rests on them, so stepping
  /// through the list doesn't redraw the spotlight for every name.
  void _showSoon(int index) {
    _showTimer?.cancel();
    if (index == _shown) return;
    _showTimer = Timer(const Duration(milliseconds: 250), () => _show(index));
  }

  void _show(int index) {
    _showTimer?.cancel();
    setState(() => _shown = index);
  }

  /// Shows the author at [index] and moves onto their button.
  void _enter(int index) {
    _show(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final main = node('spot:main');
      if (mounted && main.context != null) main.requestFocus();
    });
  }

  /// The author's bio, fetched the first time they show.
  String _bioOf(AggregatedItem author) {
    final id = author.id;
    // An author known only by name has nothing on the server to ask for.
    if (id == author.name || _bios.containsKey(id)) return _bios[id] ?? '';
    _bios[id] = '';
    unawaited(() async {
      try {
        final item = await GetIt.instance<MediaServerClient>().itemsApi.getItem(
          id,
        );
        final bio = (item['Overview'] as String? ?? '')
            .replaceAll(RegExp(r'<[^>]*>'), '')
            .trim();
        if (mounted) setState(() => _bios[id] = bio);
      } catch (e) {
        debugPrint('Failed to load the author bio: $e');
      }
    }());
    return '';
  }

  void _jumpTo(String letter) {
    if (!scrollController.hasClients || _letterOffsets.isEmpty) return;
    final target = kAlphabetLetters.indexOf(letter);
    final offset = _letterOffsets.entries.firstWhere((entry) {
      final at = kAlphabetLetters.indexOf(entry.key);
      return _descending ? at <= target : at >= target;
    }, orElse: () => _letterOffsets.entries.last).value;
    scrollController.jumpTo(
      min(offset, scrollController.position.maxScrollExtent),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authors = vm.authors;
    final shown = authors.isEmpty ? 0 : _shown.clamp(0, authors.length - 1);
    final ready = !isLoading && authors.isNotEmpty;
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) => buildSections(
          () => _addSections(
            l10n,
            constraints.maxWidth - kAlphabetScrubRailWidth,
          ),
          onRefresh: () => vm.load().then((_) => vm.loadAuthors()),
          header: () => buildHeader(
            title: l10n.authors,
            count: ready ? l10n.authorsCount(authors.length) : null,
            firstNode: wide ? null : node('sort'),
            controls: [
              if (!wide)
                MusicPillButton(
                  focusNode: node('sort'),
                  icon: Icons.sort_by_alpha_rounded,
                  label: _descending ? l10n.bookSortZToA : l10n.libraryAToZ,
                  onTap: () => setState(() => _descending = !_descending),
                  onNavigateUp: () => move(headerIndex, true),
                  onNavigateDown: () => move(headerIndex, false),
                ),
            ],
          ),
          body: !ready
              ? null
              : wide
              ? (list, _) => Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(width: inset + 340, child: list),
                    const SizedBox(width: 36),
                    Expanded(
                      child: _buildSpotlight(l10n, authors[shown], shown),
                    ),
                  ],
                )
              : (list, bottom) => Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: list),
                    Padding(
                      padding: EdgeInsets.only(bottom: bottom),
                      child: SizedBox(
                        width: kAlphabetScrubRailWidth,
                        child: AlphabetScrubRail(
                          onLetter: _jumpTo,
                          available: {
                            for (final author in authors)
                              alphabetBucketOf(author),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    if (isLoading) return addLoadingSection();
    if (vm.authors.isEmpty) return addEmptySection();
    wide ? _addList(l10n) : _addWall(l10n, width);
  }

  /// Phones: round portraits under a heading for each letter.
  void _addWall(AppLocalizations l10n, double width) {
    final rank = {
      for (final (i, letter) in kAlphabetLetters.indexed) letter: i,
    };
    final wall = [
      for (final author in vm.authors)
        (letter: alphabetBucketOf(author), author: author),
    ];
    mergeSort(
      wall,
      compare: (a, b) => rank[a.letter]!.compareTo(rank[b.letter]!),
    );
    final authors = _descending ? wall.reversed.toList() : wall;
    final columns = columnsFor(width);
    final cell = cellWidth(width, columns);
    final rowExtent =
        MediaCard.layoutHeight(
          context,
          width: cell,
          aspectRatio: 1,
          hasSubtitle: true,
        ) +
        gridSpacing;
    addStop(
      RowFocusEntry.node(node('author:0'), containerKey: sectionKey('wall:0')),
    );
    _letterOffsets.clear();
    var offset = 0.0;
    var start = 0;
    while (start < authors.length) {
      final letter = authors[start].letter;
      var end = start + 1;
      while (end < authors.length && authors[end].letter == letter) {
        end++;
      }
      _letterOffsets[letter] = offset;
      addSection(
        SizedBox(
          height: _headingExtent,
          child: Padding(
            padding: EdgeInsets.only(left: inset, right: endInset, bottom: 4),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColorScheme.accent,
                ),
              ),
            ),
          ),
        ),
      );
      for (var row = start; row < end; row += columns) {
        addSection(
          SizedBox(
            key: sectionKey('wall:$row'),
            height: rowExtent,
            child: Padding(
              padding: EdgeInsets.fromLTRB(inset, 0, endInset, gridSpacing),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = row; i < row + columns; i++) ...[
                    if (i > row) SizedBox(width: gridSpacing),
                    SizedBox(
                      width: cell,
                      child: i >= end
                          ? null
                          : _buildFace(l10n, authors[i].author, i, cell),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      }
      final rows = (end - start + columns - 1) ~/ columns;
      offset += _headingExtent + rows * rowExtent;
      start = end;
    }
  }

  Widget _buildFace(
    AppLocalizations l10n,
    AggregatedItem author,
    int index,
    double cell,
  ) {
    final url = vm.bookImageUrl(author);
    return MediaCard(
      width: cell,
      aspectRatio: 1,
      title: author.name,
      subtitle: l10n.bookSeriesItemCount(vm.authorTitleCount(author)),
      imageUrl: url,
      // MediaCard only draws Person cards round.
      itemType: 'Person',
      focusNode: node('author:$index'),
      onTap: () => openItem(author),
      imageOverlays: [
        if (url == null) Positioned.fill(child: _initials(author, cell * 0.3)),
      ],
    );
  }

  /// Wide screens: the authors as a list, the shown one tinted.
  void _addList(AppLocalizations l10n) {
    final authors = vm.authors;
    final stop = _stop = addStop(
      RowFocusEntry.node(node('author:0'), containerKey: sectionKey('list')),
    );
    final onSurface = AppColorScheme.onSurface;
    for (var i = 0; i < authors.length; i++) {
      final author = authors[i];
      addSection(
        Padding(
          key: i == 0 ? sectionKey('list') : null,
          padding: EdgeInsets.fromLTRB(inset, i == 0 ? 12 : 0, 0, 2),
          child: FocusableWrapper(
            highlightOnHover: true,
            focusNode: node('author:$i'),
            borderRadius: 10,
            disableScale: true,
            autoScroll: true,
            onFocusChange: (focused) {
              if (focused) _showSoon(i);
            },
            onSelect: () => _enter(i),
            onNavigateUp: i == 0 ? () => move(stop, true) : null,
            onNavigateDown: i == authors.length - 1 ? () {} : null,
            onNavigateLeft: leaveLeft,
            onNavigateRight: () => _enter(i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: i == _shown
                    ? AppColorScheme.accent.withValues(alpha: 0.16)
                    : null,
                borderRadius: AppRadius.circular(10),
              ),
              child: Row(
                children: [
                  _portrait(author, 44),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          author.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: onSurface,
                          ),
                        ),
                        Text(
                          l10n.bookSeriesItemCount(vm.authorTitleCount(author)),
                          style: TextStyle(
                            fontSize: 13,
                            color: onSurface.withValues(alpha: 0.65),
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
      );
    }
  }

  /// The shown author: portrait, bio, counts, one button, then their books
  /// a shelf per series.
  Widget _buildSpotlight(
    AppLocalizations l10n,
    AggregatedItem author,
    int shown,
  ) {
    final onSurface = AppColorScheme.onSurface;
    final titles = vm.titlesBy(author);
    final audiobooks = titles.where(vm.isAudiobookItem).toList();
    final series = <String, List<AggregatedItem>>{};
    final other = <AggregatedItem>[];
    for (final title in titles) {
      final name = title.seriesName?.trim() ?? '';
      if (name.isEmpty) {
        other.add(title);
      } else {
        series.putIfAbsent(name, () => []).add(title);
      }
    }
    int byIndex(AggregatedItem a, AggregatedItem b) =>
        (a.indexNumber ?? 1 << 20).compareTo(b.indexNumber ?? 1 << 20);
    final shelves = [
      for (final MapEntry(:key, :value) in series.entries)
        (key, value..sort(byIndex)),
      if (other.isNotEmpty)
        (series.isEmpty ? l10n.books : l10n.bookOtherBooks, other),
    ];
    final reading = [
      for (final (_, books) in shelves) ...books.whereNot(vm.isAudiobookItem),
    ];
    final keys = [
      for (var s = 0; s < shelves.length; s++) 'spot:${author.id}:$s',
    ];
    _spotlight.entries = [
      RowFocusEntry.node(node('spot:main')),
      for (final key in keys)
        RowFocusEntry.row(rowKey(key), containerKey: sectionKey(key)),
    ];
    final expansion = cardFocusExpansion;
    const cardWidth = 130.0;
    final bio = _bioOf(author);
    void back() => node('author:$shown').requestFocus();

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 12, endInset, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _portrait(author, 180),
              const SizedBox(width: 28),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.author.toUpperCase(), style: musicEyebrowStyle()),
                    const SizedBox(height: 6),
                    Text(
                      author.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        color: onSurface,
                      ),
                    ),
                    if (bio.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        bio,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.4,
                          color: onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        for (final (count, label) in [
                          (titles.length - audiobooks.length, l10n.books),
                          (audiobooks.length, l10n.audiobooks),
                          (series.length, l10n.series),
                        ])
                          Padding(
                            padding: const EdgeInsets.only(right: 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$count',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: onSurface,
                                  ),
                                ),
                                Text(
                                  label,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: onSurface.withValues(alpha: 0.65),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (titles.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      MusicPillButton(
                        focusNode: node('spot:main'),
                        icon: audiobooks.isEmpty
                            ? Icons.menu_book_rounded
                            : Icons.shuffle_rounded,
                        label: audiobooks.isEmpty
                            ? l10n.bookStartReading
                            : l10n.bookShuffleAudiobooks,
                        primary: true,
                        onTap: () => audiobooks.isEmpty
                            ? readOrListenBook(
                                context,
                                reading.firstWhereOrNull((t) => !t.isPlayed) ??
                                    reading.first,
                                isAudiobook: false,
                              )
                            : readOrListenBook(
                                context,
                                audiobooks[Random().nextInt(audiobooks.length)],
                                isAudiobook: true,
                              ),
                        onNavigateUp: () => move(_stop, true),
                        onNavigateDown: () =>
                            _spotlight.moveVertical(fromIndex: 0, isUp: false),
                        onNavigateLeft: back,
                        onNavigateRight: () {},
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          for (var s = 0; s < shelves.length; s++)
            MusicShelf(
              title: shelves[s].$1,
              items: shelves[s].$2,
              hubKey: 'books_${libraryId}_${keys[s]}',
              rowKey: rowKey(keys[s]),
              containerKey: sectionKey(keys[s]),
              itemExtent: cardWidth,
              height:
                  MediaCard.layoutHeight(
                    context,
                    width: cardWidth,
                    aspectRatio: 2 / 3,
                    hasSubtitle: true,
                  ) +
                  10,
              headroom: MediaCard.focusHeadroom(
                cardWidth * 1.5,
                expansion: expansion,
              ),
              leadingInset: 0,
              onSelect: openItem,
              onVerticalNavigation: (isUp) {
                _spotlight.moveVertical(fromIndex: s + 1, isUp: isUp);
                return true;
              },
              onLeftEdge: back,
              itemBuilder: (context, item, _, focused) =>
                  shelfCard(item, width: cardWidth, focused: focused),
            ),
        ],
      ),
    );
  }

  Widget _portrait(AggregatedItem author, double size) {
    final url = vm.bookImageUrl(author);
    return ClipOval(
      child: SizedBox.square(
        dimension: size,
        child: url == null
            ? _initials(author, size * 0.36)
            : musicArt(url, icon: Icons.person_rounded),
      ),
    );
  }

  Widget _initials(AggregatedItem author, double size) => ColoredBox(
    color: AppColorScheme.surfaceVariant,
    child: Center(
      child: Text(
        author.name
            .split(' ')
            .where((part) => part.isNotEmpty)
            .take(2)
            .map((part) => part.characters.first.toUpperCase())
            .join(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w800,
          color: AppColorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    ),
  );
}
