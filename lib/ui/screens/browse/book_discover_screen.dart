import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../l10n/app_localizations.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/book/discover/book_discover_tab.dart';
import '../../widgets/book/discover/book_discovery_models.dart';
import '../../widgets/local_search_field.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/settings/multi_select_dialog.dart';
import '../book/discover/discover_book_detail_screen.dart';
import '../book/discover/librivox_authors_screen.dart';
import '../book/discover/librivox_book_detail_screen.dart';
import 'book_category_screen.dart';

/// Free public domain titles to find: a search, the picked subjects as
/// chips that filter to one subject, a featured title, then a shelf per
/// subject. Titles open their detail screens.
class BookDiscoverScreen extends StatefulWidget {
  final String libraryId;

  const BookDiscoverScreen({super.key, required this.libraryId});

  @override
  State<BookDiscoverScreen> createState() => _BookDiscoverScreenState();
}

class _BookDiscoverScreenState extends BookCategoryState<BookDiscoverScreen> {
  final _search = TextEditingController();
  BookDiscoverFeed? _feed;
  String? _subject;

  @override
  String get libraryId => widget.libraryId;

  @override
  void initState() {
    super.initState();
    if (!vm.isLoading) _startFeed();
  }

  @override
  void dispose() {
    _feed?.dispose();
    _search.dispose();
    super.dispose();
  }

  /// The library's format is only known once it loads, and picks the source.
  @override
  void contentChanged() {
    if (!vm.isLoading && _feed?.isAudiobook != vm.isAudiobookLibrary) {
      _startFeed();
    }
    super.contentChanged();
  }

  void _startFeed() {
    _feed?.dispose();
    final feed = _feed = BookDiscoverFeed(isAudiobook: vm.isAudiobookLibrary)
      ..addListener(contentChanged);
    _subject = null;
    _search.clear();
    unawaited(feed.load());
  }

  void _open(BookDiscoverFeed feed, Object item) => Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => item is LibrivoxBook
          ? LibrivoxBookDetailScreen(
              book: item,
              coverUrl: feed.covers[item.id],
              allBooks: feed.audiobooks,
              coverCache: Map.of(feed.covers),
            )
          : DiscoverBookDetailScreen(book: item as DiscoverBook),
    ),
  );

  void _pick(String? subject) {
    _search.clear();
    setState(() => _subject = subject);
  }

  Future<void> _pickSubjects(
    AppLocalizations l10n,
    BookDiscoverFeed feed,
  ) async {
    final picked = await showMultiSelectDialog(
      context: context,
      title: feed.isAudiobook ? l10n.audiobookGenres : l10n.discoverySubjects,
      items: {for (final subject in feed.pool) subject: feed.labelOf(subject)},
      selected: feed.subjects.toSet(),
    );
    if (!mounted || picked == null || picked.isEmpty) return;
    if (!picked.contains(_subject)) _subject = null;
    unawaited(feed.setSubjects(picked));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return buildCategoryPage(
      () => LayoutBuilder(
        builder: (context, constraints) => buildSections(
          () => _addSections(l10n, constraints.maxWidth),
          onRefresh: () async => _feed?.load(),
          header: () =>
              buildHeader(title: BookCategoryKind.discover.label(l10n)),
        ),
      ),
    );
  }

  void _addSections(AppLocalizations l10n, double width) {
    final feed = _feed;
    _addSearch(l10n, feed?.isAudiobook ?? vm.isAudiobookLibrary);
    if (feed == null) return addLoadingSection();
    _addChips(l10n, feed);
    final expansion = cardFocusExpansion;
    if (feed.query.isNotEmpty) return _addResults(feed, width, expansion);
    final first = feed.rows[feed.subjects.first]?.firstOrNull;
    if (_subject == null && first != null) _addHero(l10n, feed, first);
    final picked = _subject;
    for (final subject in picked == null ? feed.subjects : [picked]) {
      _addShelf(l10n, feed, subject, expansion);
    }
  }

  void _addSearch(AppLocalizations l10n, bool audio) {
    final focus = node('search');
    final stop = addStop(
      RowFocusEntry.node(focus, containerKey: sectionKey('search')),
    );
    addSection(
      Padding(
        key: sectionKey('search'),
        padding: EdgeInsets.fromLTRB(inset, 4, endInset, 14),
        // Up and Down leave the field everywhere, and so does Left on a TV,
        // where the field only takes text through its keyboard.
        child: Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onKeyEvent: (_, event) {
            if (!event.isActionable) return KeyEventResult.ignored;
            final key = event.logicalKey;
            if (key.isUpKey || key.isDownKey) {
              move(stop, key.isUpKey);
            } else if (key.isLeftKey && PlatformDetection.isTV) {
              leaveLeft();
            } else {
              return KeyEventResult.ignored;
            }
            return KeyEventResult.handled;
          },
          child: LocalSearchField(
            controller: _search,
            focusNode: focus,
            hint: audio
                ? l10n.bookDiscoverSearchAudiobooks
                : l10n.bookDiscoverSearchBooks,
            onChanged: (text) => _feed?.search(text),
          ),
        ),
      ),
    );
  }

  void _addChips(AppLocalizations l10n, BookDiscoverFeed feed) {
    String id(String? subject) => 'chip:${subject ?? 'all'}';
    final stop = addStop(
      RowFocusEntry.node(node(id(_subject)), containerKey: sectionKey('chips')),
    );
    void up() => move(stop, true);
    void down() => move(stop, false);
    final subjects = [null, ...feed.subjects];
    addSection(
      SingleChildScrollView(
        key: sectionKey('chips'),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(inset, 4, endInset, 4),
        child: Row(
          children: [
            for (final (i, subject) in subjects.indexed) ...[
              MusicChip(
                label: subject == null ? l10n.all : feed.labelOf(subject),
                selected: subject == _subject,
                focusNode: node(id(subject)),
                onTap: () => _pick(subject),
                onNavigateUp: up,
                onNavigateDown: down,
                onNavigateLeft: i == 0 ? leaveLeft : null,
              ),
              const SizedBox(width: 8),
            ],
            MusicPillButton(
              focusNode: node('chip:edit'),
              icon: Icons.tune_rounded,
              height: 36,
              semanticLabel: feed.isAudiobook
                  ? l10n.audiobookGenres
                  : l10n.discoverySubjects,
              onTap: () => unawaited(_pickSubjects(l10n, feed)),
              onNavigateUp: up,
              onNavigateDown: down,
              onNavigateRight: feed.isAudiobook ? null : () {},
            ),
            if (feed.isAudiobook) ...[
              const SizedBox(width: 8),
              MusicPillButton(
                focusNode: node('chip:authors'),
                icon: Icons.people_alt_rounded,
                height: 36,
                semanticLabel: l10n.authors,
                onTap: () {
                  final books = feed.audiobooks;
                  if (books.isEmpty) return;
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => LibrivoxAuthorsScreen(
                        books: books,
                        coverCache: Map.unmodifiable(feed.covers),
                      ),
                    ),
                  );
                },
                onNavigateUp: up,
                onNavigateDown: down,
                onNavigateRight: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _addHero(AppLocalizations l10n, BookDiscoverFeed feed, Object item) {
    final title = feed.describe(item);
    final stop = addStop(
      RowFocusEntry.node(
        node('hero:details'),
        containerKey: sectionKey('hero'),
      ),
    );
    final onSurface = AppColorScheme.onSurface;
    addSection(
      Padding(
        key: sectionKey('hero'),
        padding: EdgeInsets.fromLTRB(inset, 14, endInset, 4),
        child: Container(
          padding: EdgeInsets.all(wide ? 24 : 16),
          decoration: BoxDecoration(
            color: onSurface.withValues(alpha: 0.06),
            borderRadius: AppRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: wide ? 150 : 100,
                child: AspectRatio(
                  aspectRatio: feed.isAudiobook ? 1 : 2 / 3,
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(8),
                    child: musicArt(
                      title.cover,
                      icon: feed.isAudiobook
                          ? Icons.headphones_rounded
                          : Icons.menu_book_rounded,
                    ),
                  ),
                ),
              ),
              SizedBox(width: wide ? 28 : 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${l10n.bookDiscoverFeatured} · ${feed.labelOf(feed.subjects.first)}'
                          .toUpperCase(),
                      style: musicEyebrowStyle(),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: wide ? 28 : 22,
                        fontWeight: FontWeight.w800,
                        color: onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [title.author, ?title.year?.toString()].join(' · '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: onSurface.withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(height: 18),
                    MusicPillButton(
                      focusNode: node('hero:details'),
                      icon: Icons.info_outline_rounded,
                      label: l10n.details,
                      primary: true,
                      onTap: () => _open(feed, item),
                      onNavigateUp: () => move(stop, true),
                      onNavigateDown: () => move(stop, false),
                      onNavigateLeft: leaveLeft,
                      onNavigateRight: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addShelf(
    AppLocalizations l10n,
    BookDiscoverFeed feed,
    String subject,
    bool expansion,
  ) {
    final items = feed.rows[subject] ?? const [];
    final muted = TextStyle(
      fontSize: 15,
      color: AppColorScheme.onSurface.withValues(alpha: 0.65),
    );
    final Widget body;
    if (items.isNotEmpty) {
      final id = 'shelf:$subject';
      final stop = addStop(
        RowFocusEntry.node(node('$id:0'), containerKey: sectionKey(id)),
      );
      final width = wide ? 150.0 : 112.0;
      final aspect = feed.isAudiobook ? 1.0 : 2 / 3;
      body = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(
          inset,
          MediaCard.focusHeadroom(width / aspect, expansion: expansion),
          endInset,
          8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final (i, item) in items.indexed) ...[
              if (i > 0) SizedBox(width: gridSpacing),
              _card(
                feed,
                item,
                id: id,
                index: i,
                count: items.length,
                columns: items.length,
                stop: stop,
                width: width,
                expansion: expansion,
                down: () => move(stop, false),
              ),
            ],
          ],
        ),
      );
    } else if (feed.failed.contains(subject)) {
      final retry = node('retry:$subject');
      final stop = addStop(
        RowFocusEntry.node(retry, containerKey: sectionKey('shelf:$subject')),
      );
      body = Padding(
        padding: EdgeInsets.fromLTRB(inset, 10, endInset, 8),
        child: Row(
          children: [
            Flexible(
              child: Text(
                feed.isAudiobook
                    ? l10n.couldNotLoadGenre
                    : l10n.couldNotLoadSubject,
                style: muted,
              ),
            ),
            const SizedBox(width: 12),
            MusicPillButton(
              focusNode: retry,
              icon: Icons.refresh_rounded,
              label: l10n.retry,
              onTap: () => unawaited(feed.loadRow(subject)),
              onNavigateUp: () => move(stop, true),
              onNavigateDown: () => move(stop, false),
              onNavigateLeft: leaveLeft,
              onNavigateRight: () {},
            ),
          ],
        ),
      );
    } else {
      body = Padding(
        padding: EdgeInsets.fromLTRB(inset, 16, endInset, 16),
        child: feed.loading.contains(subject)
            ? const Center(child: CircularProgressIndicator())
            : Text(l10n.noItemsFound, style: muted),
      );
    }
    addSection(
      Column(
        key: sectionKey('shelf:$subject'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(inset, 22, endInset, 0),
            child: Text(
              feed.labelOf(subject),
              style: musicSectionTitleStyle(large: wide),
            ),
          ),
          body,
        ],
      ),
    );
  }

  void _addResults(BookDiscoverFeed feed, double width, bool expansion) {
    final results = feed.results;
    if (results == null) return addLoadingSection();
    if (results.isEmpty) return addEmptySection();
    final columns = columnsFor(width);
    final cell = cellWidth(width, columns);
    final aspect = feed.isAudiobook ? 1.0 : 2 / 3;
    final headroom =
        MediaCard.focusHeadroom(cell / aspect, expansion: expansion) +
        MediaCard.focusRingOutset;
    final stop = addStop(
      RowFocusEntry.node(
        node('result:0'),
        containerKey: sectionKey('result:row:0'),
      ),
    );
    for (var start = 0; start < results.length; start += columns) {
      addSection(
        Padding(
          key: sectionKey('result:row:$start'),
          padding: EdgeInsets.fromLTRB(inset, headroom, endInset, gridSpacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = start; i < start + columns; i++) ...[
                if (i > start) SizedBox(width: gridSpacing),
                SizedBox(
                  width: cell,
                  child: i >= results.length
                      ? null
                      : _card(
                          feed,
                          results[i],
                          id: 'result',
                          index: i,
                          count: results.length,
                          columns: columns,
                          stop: stop,
                          width: cell,
                          expansion: expansion,
                        ),
                ),
              ],
            ],
          ),
        ),
      );
    }
  }

  Widget _card(
    BookDiscoverFeed feed,
    Object item, {
    required String id,
    required int index,
    required int count,
    required int columns,
    required int stop,
    required double width,
    required bool expansion,
    VoidCallback? down,
  }) {
    final title = feed.describe(item);
    final focus = node('$id:$index');
    return MediaCard(
      width: width,
      aspectRatio: feed.isAudiobook ? 1 : 2 / 3,
      title: title.title,
      subtitle: title.author,
      imageUrl: title.cover,
      itemType: feed.isAudiobook ? 'AudioBook' : 'Book',
      cardFocusExpansion: expansion,
      focusNode: focus,
      onFocus: wide ? () => reveal(focus) : null,
      onKeyEvent: (_, event) => gridKey(
        event,
        id: id,
        index: index,
        count: count,
        columns: columns,
        stop: stop,
        down: down,
      ),
      onTap: () => _open(feed, item),
    );
  }
}
