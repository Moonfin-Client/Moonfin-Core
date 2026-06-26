import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../data/services/row_data_source.dart';
import '../../../data/viewmodels/book_browse_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/destinations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/book/book_segmented_control.dart';
import '../../widgets/book/book_spotlight.dart';
import '../../widgets/book/book_stats_band.dart';
import '../../widgets/book/discover/book_discover_tab.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';

class BookBrowseScreen extends StatefulWidget {
  final String libraryId;
  final String? collectionType;

  const BookBrowseScreen({
    super.key,
    required this.libraryId,
    this.collectionType,
  });

  @override
  State<BookBrowseScreen> createState() => _BookBrowseScreenState();
}

class _BookBrowseScreenState extends State<BookBrowseScreen> {
  late final BookBrowseViewModel _vm;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _vm = BookBrowseViewModel(
      libraryId: widget.libraryId,
      dataSource: GetIt.instance<RowDataSource>(),
      client: GetIt.instance<MediaServerClient>(),
      collectionType: widget.collectionType,
    );
    _vm.addListener(_onChanged);
    _vm.load();
  }

  @override
  void dispose() {
    _vm.removeListener(_onChanged);
    _vm.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  List<String> get _itemTypes =>
      _vm.isAudiobookLibrary ? const ['AudioBook', 'Audio'] : const ['Book'];

  void _onItemTap(AggregatedItem item, HomeRow row) {
    if (row.rowType == HomeRowType.genres) {
      context.push(
        Destinations.genre(
          item.name,
          genreId: item.id,
          parentId: widget.libraryId,
          includeType: _vm.isAudiobookLibrary ? 'AudioBook' : 'Book',
        ),
      );
      return;
    }
    _openItem(item);
  }

  void _openItem(AggregatedItem item) {
    final type = item.type;
    if (type == 'BoxSet') {
      context.push(Destinations.collection(item.id));
      return;
    }
    final isFolder = item.rawData['IsFolder'] as bool? ?? false;
    if (isFolder || type == 'Folder' || type == 'CollectionFolder') {
      context.push(Destinations.folder(item.id, serverId: item.serverId));
      return;
    }
    if (type == 'Book') {
      context.push(Destinations.book(item.id, serverId: item.serverId));
      return;
    }
    context.push(Destinations.item(item.id, serverId: item.serverId));
  }

  List<BookStat> _stats(AppLocalizations l10n) => [
    BookStat(
      label: _vm.isAudiobookLibrary ? l10n.audiobooks : l10n.books,
      count: _vm.titleCount,
    ),
    BookStat(label: l10n.series, count: _vm.seriesCount),
    BookStat(label: l10n.authors, count: _vm.authorCount),
    BookStat(label: l10n.genres, count: _vm.genreCount),
  ];

  void _onSeeAll(HomeRow row) {
    if (row.rowType == HomeRowType.genres) {
      context.push(Destinations.libraryGenresOf(widget.libraryId));
      return;
    }
    context.push(
      Destinations.library(widget.libraryId, includeItemTypes: _itemTypes),
    );
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: _vm.isLoading
            ? Center(
                child: CircularProgressIndicator(color: AppColorScheme.accent),
              )
            : RefreshIndicator(
                onRefresh: _vm.refresh,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 120),
                  children: _buildSlivers(context),
                ),
              ),
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final topReserve = MediaQuery.paddingOf(context).top + 56;
    final featured = _vm.featuredItem;

    return [
      if (featured != null)
        BookSpotlight(
          eyebrow: l10n.continueReading,
          title: featured.name,
          subtitle: _vm.bookSubtitle(featured),
          ctaLabel: l10n.continueReading,
          imageUrl: _vm.bookImageUrl(featured),
          progress: (featured.playedPercentage ?? 0) > 0
              ? (featured.playedPercentage! / 100).clamp(0.0, 1.0)
              : null,
          topInset: topReserve,
          onPrimary: () => _openItem(featured),
        )
      else
        SizedBox(height: topReserve),
      BookStatsBand(stats: _stats(l10n)),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
        child: BookSegmentedControl(
          labels: [l10n.library, l10n.discover],
          selectedIndex: _tab,
          onChanged: (v) => setState(() => _tab = v),
        ),
      ),
      if (_tab == 0)
        ..._vm.rows.map((row) => _buildRow(row, l10n))
      else
        BookDiscoverTab(
          libraryId: widget.libraryId,
          isAudiobook: _vm.isAudiobookLibrary,
        ),
    ];
  }

  Widget _buildRow(HomeRow row, AppLocalizations l10n) {
    return LibraryRow(
      key: ValueKey(row.id),
      title: localizeHomeRowTitle(row: row, l10n: l10n),
      onSeeAll: () => _onSeeAll(row),
      children: [
        for (final item in row.items)
          MediaCard(
            width: 132,
            aspectRatio: 2 / 3,
            title: item.name,
            subtitle: _vm.bookSubtitle(item),
            imageUrl: _vm.bookImageUrl(item),
            itemType: item.type,
            isFavorite: item.isFavorite,
            isPlayed: item.isPlayed,
            playedPercentage: item.playedPercentage,
            onTap: () => _onItemTap(item, row),
          ),
      ],
    );
  }
}
