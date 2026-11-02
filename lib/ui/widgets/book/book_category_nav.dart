import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../navigation/destinations.dart';
import '../../screens/browse/music_browse_screen.dart' show MusicCategoryButton;
import '../music/music_widgets.dart';
import 'book_browse_nav.dart';
import 'book_navigation.dart';
import 'book_scope_filter.dart';

/// Where a book library is: its overview when [kind] is null, else one of its
/// destinations, with [scope] picking the titles' format.
typedef BookNavPlace = ({BookCategoryKind? kind, BookScope scope});

/// The destinations a book library's navigation offers. The browse lists
/// with nothing in them are left out, and so is Discover when it's off.
List<BookCategoryKind> bookCategoriesShown(BookLibraryHelpers facts) => [
  for (final kind in BookCategoryKind.values)
    if (switch (kind) {
      BookCategoryKind.titles => true,
      BookCategoryKind.series => facts.seriesCount > 0,
      BookCategoryKind.authors => facts.authorCount > 0,
      BookCategoryKind.genres => facts.genreCount > 0,
      BookCategoryKind.collections => facts.collectionCount > 0,
      BookCategoryKind.favorites => facts.favoriteCount > 0,
      BookCategoryKind.discover => GetIt.instance<UserPreferences>().get(
        UserPreferences.showBookDiscoverTab,
      ),
    })
      kind,
];

IconData bookScopeIcon(BookScope scope) => switch (scope) {
  BookScope.all => Icons.library_books_outlined,
  BookScope.books => Icons.menu_book_rounded,
  BookScope.audiobooks => Icons.headphones_rounded,
  BookScope.comics => Icons.auto_stories_rounded,
};

String bookScopeTitle(AppLocalizations l10n, BookScope scope) =>
    scope == BookScope.all ? l10n.allTitles : bookScopeLabel(l10n, scope);

/// Opens [place]'s screen from a library's overview, which is already showing
/// when [place] has no kind.
void openBookPlace(BuildContext context, String libraryId, BookNavPlace place) {
  final kind = place.kind;
  if (kind == null) return;
  context.push(
    Destinations.bookCategory(
      libraryId,
      kind.name,
      scope: kind == BookCategoryKind.titles && place.scope != BookScope.all
          ? place.scope.name
          : null,
    ),
  );
}

/// Bookstore's places: the title formats, the browse lists with their
/// counts, then Discover. A library of one format lists its titles once.
List<BookRailSection> bookstoreNavSections(
  AppLocalizations l10n,
  BookBrowseViewModel facts, {
  required BookNavPlace place,
  required ValueChanged<BookNavPlace> onSelect,
}) {
  final shown = bookCategoriesShown(facts);
  final scopes = facts.isMixedLibrary
      ? facts.availableScopes
      : const [BookScope.all];
  BookBrowseEntry entry(BookCategoryKind kind, {String? count}) =>
      BookBrowseEntry(
        id: kind.name,
        label: kind.label(l10n),
        icon: kind.icon,
        count: count,
        selected: place.kind == kind,
        onSelect: () => onSelect((kind: kind, scope: BookScope.all)),
      );
  final browse = [
    for (final kind in shown)
      if (kind != BookCategoryKind.titles && kind != BookCategoryKind.discover)
        entry(
          kind,
          count: switch (kind) {
            BookCategoryKind.series => '${facts.seriesCount}',
            BookCategoryKind.authors => '${facts.authorCount}',
            BookCategoryKind.genres => '${facts.genreCount}',
            BookCategoryKind.collections =>
              '${facts.collectionCount}${facts.collectionCountIsFloor ? '+' : ''}',
            _ => '${facts.favoriteCount}',
          },
        ),
  ];
  final onTitles = place.kind == null || place.kind == BookCategoryKind.titles;
  return [
    BookRailSection(
      header: l10n.titles,
      entries: [
        for (final scope in scopes)
          BookBrowseEntry(
            id: 'scope:${scope.name}',
            label: bookScopeTitle(l10n, scope),
            icon: bookScopeIcon(scope),
            count: '${facts.titleCountFor(scope)}',
            selected: onTitles && place.scope == scope,
            onSelect: () =>
                onSelect((kind: BookCategoryKind.titles, scope: scope)),
          ),
      ],
    ),
    if (browse.isNotEmpty)
      BookRailSection(header: l10n.browse, entries: browse),
    if (shown.contains(BookCategoryKind.discover))
      BookRailSection(entries: [entry(BookCategoryKind.discover)]),
  ];
}

/// Classic's and Reading Room's places: the overview, then every destination
/// with something in it.
List<BookBrowseEntry> bookOverviewNavEntries(
  AppLocalizations l10n,
  BookLibraryHelpers facts, {
  required BookNavPlace place,
  required ValueChanged<BookNavPlace> onSelect,
}) => [
  BookBrowseEntry(
    id: 'overview',
    label: l10n.overview,
    icon: Icons.space_dashboard_outlined,
    selected: place.kind == null,
    onSelect: () => onSelect((kind: null, scope: BookScope.all)),
  ),
  for (final kind in bookCategoriesShown(facts))
    BookBrowseEntry(
      id: kind.name,
      label: kind.label(l10n),
      icon: kind.icon,
      selected: place.kind == kind,
      onSelect: () => onSelect((kind: kind, scope: BookScope.all)),
    ),
];

/// The edges every book library nav row hands focus across.
class BookNavEdges {
  final VoidCallback? up;
  final VoidCallback? down;
  final VoidCallback? left;

  const BookNavEdges({this.up, this.down, this.left});
}

/// Classic's pill strip: the library's name, then its places, the current
/// one filled.
class BookCategoryStrip extends StatelessWidget {
  final String title;
  final List<BookBrowseEntry> entries;
  final FocusNode focusNode;
  final bool Function(bool isUp)? onVerticalNavigation;
  final VoidCallback? onExitLeft;
  final double fontSize;

  const BookCategoryStrip({
    super.key,
    required this.title,
    required this.entries,
    required this.focusNode,
    this.onVerticalNavigation,
    this.onExitLeft,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final current = entries.indexWhere((entry) => entry.selected);
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: AppColorScheme.onSurface,
          ),
        ),
        SizedBox(width: fontSize),
        Expanded(
          child: MusicCategoryTabs(
            labels: [for (final entry in entries) entry.label],
            current: current < 0 ? 0 : current,
            onOpen: (index) => entries[index].onSelect(),
            focusNode: focusNode,
            onVerticalNavigation: onVerticalNavigation,
            onExitLeft: onExitLeft,
            onExitRight: () {},
          ),
        ),
      ],
    );
  }
}

/// A row of a book library's places that scrolls sideways and opens with the
/// current one in view. Reading Room draws them as icon chips, and Bookstore
/// on phones as accent chips.
class BookCategoryChips extends StatefulWidget {
  final List<BookBrowseEntry> entries;
  final FocusNode Function(String id) focusNodeFor;
  final BookNavEdges edges;
  final bool icons;

  const BookCategoryChips({
    super.key,
    required this.entries,
    required this.focusNodeFor,
    this.edges = const BookNavEdges(),
    this.icons = true,
  });

  @override
  State<BookCategoryChips> createState() => _BookCategoryChipsState();
}

class _BookCategoryChipsState extends State<BookCategoryChips> {
  final _selectedKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selected = _selectedKey.currentContext;
      if (mounted && selected != null) {
        Scrollable.ensureVisible(selected, alignment: 0.5);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.entries;
    final edges = widget.edges;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0) SizedBox(width: widget.icons ? 10 : 8),
            KeyedSubtree(
              key: entries[i].selected ? _selectedKey : null,
              child: widget.icons
                  ? MusicCategoryButton(
                      icon: entries[i].icon,
                      label: entries[i].label,
                      selected: entries[i].selected,
                      focusNode: widget.focusNodeFor(entries[i].id),
                      isFirst: i == 0,
                      isLast: i == entries.length - 1,
                      onTap: entries[i].onSelect,
                      onNavigateUp: edges.up,
                      onNavigateDown: edges.down,
                      onNavigateLeft: i == 0 ? edges.left : null,
                    )
                  : MusicChip(
                      label: entries[i].label,
                      selected: entries[i].selected,
                      focusNode: widget.focusNodeFor(entries[i].id),
                      onTap: entries[i].onSelect,
                      onNavigateUp: edges.up,
                      onNavigateDown: edges.down,
                      onNavigateLeft: i == 0 ? edges.left : null,
                      onNavigateRight: i == entries.length - 1 ? () {} : null,
                    ),
            ),
          ],
        ],
      ),
    );
  }
}
