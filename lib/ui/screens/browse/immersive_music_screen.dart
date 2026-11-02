import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/home_row.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/row_focus_coordinator.dart';
import '../../navigation/destinations.dart';
import '../../util/home_row_title_localizer.dart';
import '../../widgets/book/book_navigation.dart';
import '../../widgets/book/book_see_all_button.dart';
import '../../widgets/focus/focusable_wrapper.dart';
import '../../widgets/media_card.dart';
import '../../widgets/music/music_navigation.dart';
import '../../widgets/music/music_widgets.dart';
import '../../widgets/offline_aware_image.dart';
import 'music_library_base.dart';

/// The Immersive music library: the album being listened to on a full-width
/// hero with Play, Shuffle and Favorite, then the categories and rows. Wide
/// layouts put the categories in the app's pill tabs, list the album's songs
/// beside the hero and show recent albums and genres as grids.
class ImmersiveMusicScreen extends StatefulWidget {
  final String libraryId;

  const ImmersiveMusicScreen({super.key, required this.libraryId});

  @override
  State<ImmersiveMusicScreen> createState() => _ImmersiveMusicScreenState();
}

class _ImmersiveMusicScreenState
    extends MusicLibraryState<ImmersiveMusicScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  @override
  String get libraryId => widget.libraryId;

  @override
  void onLoaded() {
    vm.loadFeaturedAlbum();
    if (wide) vm.loadGenres();
  }

  String? get _albumId {
    final featured = vm.featuredItem;
    if (featured == null) return null;
    return vm.featuredAlbum?.id ??
        (featured.type == 'MusicAlbum' ? featured.id : featured.albumId);
  }

  void _play() {
    final featured = vm.featuredItem;
    if (featured == null) return;
    if (featured.type == 'Audio') {
      unawaited(playMusicTrack(context, featured));
    } else if (vm.featuredTracks.isNotEmpty) {
      unawaited(playMusicTrack(context, vm.featuredTracks.first));
    } else {
      openMusicItem(context, featured, autoPlay: true);
    }
  }

  void _shuffle() {
    final featured = vm.featuredItem;
    final parentId = _albumId ?? featured?.id;
    if (parentId == null) return;
    unawaited(
      shuffleMusic(context, parentId: parentId, serverId: featured?.serverId),
    );
  }

  void _openAlbum() {
    final albumId = _albumId;
    final featured = vm.featuredItem;
    if (albumId == null || featured == null) return;
    context.push(Destinations.item(albumId, serverId: featured.serverId));
  }

  void _toggleFavorite() {
    final album = vm.featuredAlbum;
    if (album == null) return;
    unawaited(vm.setFeaturedAlbumFavorite(!album.isFavorite));
  }

  @override
  Widget build(BuildContext context) =>
      buildPage(() => buildSectionList(_addSections));

  void _addSections() {
    final l10n = AppLocalizations.of(context);
    final inset = (wide ? 48.0 : 20.0) + bookSidebarInset;
    final featured = vm.featuredItem;

    headerIndex = addStop(
      RowFocusEntry.node(
        node(wide ? 'tabs' : 'search'),
        containerKey: sectionKey('header'),
      ),
    );
    final heroIndex = featured == null
        ? -1
        : addStop(
            // On a wide screen the header scrolls into view with the hero,
            // so landing on Play never tucks it under the navbar.
            RowFocusEntry.node(
              node('play'),
              containerKey: sectionKey(wide ? 'top' : 'hero'),
            ),
          );
    addSection(
      wide
          ? _buildWideTop(l10n, inset, featured, heroIndex)
          : _buildPhoneTop(l10n, inset, featured, heroIndex),
    );

    if (!wide) {
      final index = addStop(
        RowFocusEntry.node(
          node('category:0'),
          containerKey: sectionKey('categories'),
        ),
      );
      addSection(_buildCategories(inset, index));
    }

    final lastPlayed = rowOf('lastPlayed_');
    if (wide) {
      final latest = rowOf('latest_');
      if (latest != null) {
        final index = addStop(
          RowFocusEntry.node(
            node('latest:0'),
            containerKey: sectionKey(latest.id),
          ),
        );
        addSection(_buildLatestGrid(l10n, latest, inset, index));
      }
      addList(
        lastPlayed,
        title: l10n.lastPlayed,
        inset: inset,
        onLeftEdge: focusBookSidebar,
      );
      if (vm.genres.isNotEmpty) {
        final index = addStop(
          RowFocusEntry.node(
            node('genre:0'),
            containerKey: sectionKey('genres'),
          ),
        );
        addSection(_buildGenres(l10n, inset, index));
      }
    } else {
      addList(
        lastPlayed,
        title: l10n.lastPlayed,
        inset: inset,
        onLeftEdge: focusBookSidebar,
      );
      addShelf(rowOf('latest_'), inset: inset, onLeftEdge: focusBookSidebar);
    }
    for (final prefix in const [
      'albumartist_',
      'favorites_',
      'playlists',
      'musicartist_',
      'musicalbum_',
    ]) {
      addShelf(rowOf(prefix), inset: inset, onLeftEdge: focusBookSidebar);
    }
  }

  String _eyebrow(AppLocalizations l10n) =>
      (vm.featuredIsRecent ? l10n.jumpBackIn : l10n.recentlyAdded)
          .toUpperCase();

  String _heroTitle(AggregatedItem featured) =>
      vm.featuredAlbum?.name ??
      (featured.type == 'Audio' ? featured.album ?? featured.name : featured.name);

  String _heroMeta(AppLocalizations l10n, AggregatedItem featured) {
    final source = vm.featuredAlbum ?? featured;
    final tracks = vm.featuredTracks.length;
    return [
      vm.getMusicSubtitle(source),
      if (source.productionYear != null) '${source.productionYear}',
      if (tracks > 0) l10n.trackCount(tracks),
    ].where((part) => part.isNotEmpty).join(' · ');
  }

  /// Play, Shuffle and Favorite. Right from the last one reaches the album's
  /// songs when they're listed beside the hero.
  Widget _buildHeroButtons(
    AppLocalizations l10n,
    int heroIndex, {
    required bool expand,
    VoidCallback? onExitRight,
  }) {
    final album = vm.featuredAlbum;
    final height = expand ? 48.0 : 52.0;
    VoidCallback leave(bool isUp) =>
        () => move(heroIndex, isUp);

    Widget pill({
      required String id,
      required String label,
      required IconData icon,
      required VoidCallback onTap,
      required bool primary,
      VoidCallback? onNavigateLeft,
      VoidCallback? onNavigateRight,
    }) {
      final button = MusicPillButton(
        focusNode: node(id),
        icon: icon,
        label: label,
        primary: primary,
        height: height,
        onTap: onTap,
        onNavigateUp: leave(true),
        onNavigateDown: leave(false),
        onNavigateLeft: onNavigateLeft,
        onNavigateRight: onNavigateRight,
      );
      return expand ? Expanded(child: button) : button;
    }

    final favorite = album == null
        ? null
        : MusicPillButton(
            focusNode: node('favorite'),
            icon: album.isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            iconColor: album.isFavorite ? AppColorScheme.accent : null,
            semanticLabel: album.isFavorite ? l10n.favorited : l10n.favorite,
            height: height,
            onTap: _toggleFavorite,
            onNavigateUp: leave(true),
            onNavigateDown: leave(false),
            onNavigateRight: onExitRight ?? () {},
          );

    return Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      children: [
        pill(
          id: 'play',
          label: l10n.play,
          icon: Icons.play_arrow_rounded,
          onTap: _play,
          primary: true,
          onNavigateLeft: focusBookSidebar,
        ),
        const SizedBox(width: 10),
        pill(
          id: 'shuffle',
          label: l10n.shuffle,
          icon: Icons.shuffle_rounded,
          onTap: _shuffle,
          primary: false,
          onNavigateRight: favorite == null ? (onExitRight ?? () {}) : null,
        ),
        if (favorite != null) ...[const SizedBox(width: 10), favorite],
      ],
    );
  }

  Widget _headerButton(String id, IconData icon, String label, VoidCallback on,
      {VoidCallback? onNavigateRight}) => FocusableWrapper(
    highlightOnHover: true,
    focusNode: node(id),
    borderRadius: 22,
    disableScale: true,
    semanticLabel: label,
    onSelect: on,
    onNavigateUp: () => move(headerIndex, true),
    onNavigateDown: () => move(headerIndex, false),
    onNavigateRight: onNavigateRight,
    child: Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withValues(alpha: 0.35),
      ),
      child: Icon(icon, size: 22, color: Colors.white),
    ),
  );

  Widget _buildPhoneTop(
    AppLocalizations l10n,
    double inset,
    AggregatedItem? featured,
    int heroIndex,
  ) {
    final top = topReserve;
    final background = AppColorScheme.background;
    final header = Row(
      children: [
        Expanded(
          child: Text(
            vm.libraryName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        _headerButton('search', Icons.search_rounded, l10n.searchMusic, search),
        const SizedBox(width: 8),
        _headerButton(
          'filter',
          Icons.tune_rounded,
          l10n.sortAndFilter,
          showSortAndFilter,
          onNavigateRight: () {},
        ),
      ],
    );
    if (featured == null) {
      return KeyedSubtree(
        key: sectionKey('header'),
        child: Padding(
          padding: EdgeInsets.fromLTRB(inset, top + 4, 16, 0),
          child: header,
        ),
      );
    }
    return SizedBox(
      height: top + 400,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: _openAlbum,
            child: musicArt(vm.getMusicImageUrl(featured, maxHeight: 900)),
          ),
          IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                    background.withValues(alpha: 0.85),
                    background,
                  ],
                  stops: const [0.0, 0.3, 0.75, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            key: sectionKey('header'),
            top: top + 4,
            left: inset,
            right: 16,
            child: header,
          ),
          Positioned(
            key: sectionKey('hero'),
            left: inset,
            right: inset,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _eyebrow(l10n),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                    color: AppColorScheme.accent,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _heroTitle(featured),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                    letterSpacing: -0.5,
                    color: AppColorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _heroMeta(l10n, featured),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.78),
                  ),
                ),
                const SizedBox(height: 16),
                _buildHeroButtons(l10n, heroIndex, expand: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideTop(
    AppLocalizations l10n,
    double inset,
    AggregatedItem? featured,
    int heroIndex,
  ) {
    final top = topReserve;
    final categories = musicCategories(context, libraryId);
    final tracks = vm.featuredTracks;
    final backdropUrl =
        featured == null ||
            _prefs.get(UserPreferences.hideBackdropsInLibraries)
        ? null
        : vm.getMusicImageUrl(featured, maxHeight: 600);

    final tabs = MusicCategoryTabs(
      labels: [l10n.overview, for (final c in categories) c.label],
      current: 0,
      onOpen: (index) => context.push(categories[index - 1].route),
      focusNode: node('tabs'),
      onVerticalNavigation: (isUp) => move(headerIndex, isUp),
      onExitLeft: focusBookSidebar,
      onExitRight: node('search').requestFocus,
    );

    final header = Padding(
      key: sectionKey('header'),
      padding: EdgeInsets.fromLTRB(inset, top + 16, 48, 0),
      child: Row(
        children: [
          Text(
            vm.libraryName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 28),
          Expanded(child: tabs),
          const SizedBox(width: 16),
          _headerButton('search', Icons.search_rounded, l10n.searchMusic, search),
          const SizedBox(width: 8),
          _headerButton(
            'filter',
            Icons.tune_rounded,
            l10n.sortAndFilter,
            showSortAndFilter,
            onNavigateRight: () {},
          ),
        ],
      ),
    );

    Widget? hero;
    if (featured != null) {
      hero = LayoutBuilder(
        builder: (context, constraints) {
          final available = constraints.maxWidth - inset - 48;
          // The album's songs need room beside the art and the title.
          final showTracks = tracks.isNotEmpty && available >= 1000;
          // On a narrower screen the art and the songs each shrink by up to 80,
          // so Play, Shuffle and Favorite keep at least 360 between them.
          final fit = showTracks
              ? ((available - 1000) / 160).clamp(0.0, 1.0)
              : 1.0;
          final artSize = 220 + 80 * fit;
          final shown = tracks.take(6).toList();
          return Padding(
            key: sectionKey('hero'),
            padding: EdgeInsets.fromLTRB(inset, 32, 48, 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _openAlbum,
                  child: Container(
                    width: artSize,
                    height: artSize,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.55),
                          blurRadius: 60,
                          offset: const Offset(0, 24),
                        ),
                      ],
                    ),
                    child: musicArt(
                      vm.getMusicImageUrl(featured, maxHeight: 600),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _eyebrow(l10n),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.6,
                          color: AppColorScheme.accent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _heroTitle(featured),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                          letterSpacing: -1.5,
                          color: AppColorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _heroMeta(l10n, featured),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColorScheme.onSurface.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildHeroButtons(
                        l10n,
                        heroIndex,
                        expand: false,
                        onExitRight: showTracks
                            ? node('albumTrack:0').requestFocus
                            : null,
                      ),
                    ],
                  ),
                ),
                if (showTracks) ...[
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 340 + 80 * fit,
                    child: _buildAlbumTracks(l10n, featured, shown, heroIndex),
                  ),
                ],
              ],
            ),
          );
        },
      );
    }

    return Stack(
      key: sectionKey('top'),
      children: [
        if (backdropUrl != null)
          Positioned.fill(child: _Backdrop(imageUrl: backdropUrl)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [header, ?hero],
        ),
      ],
    );
  }

  /// The hero album's songs, the one played last picked out.
  Widget _buildAlbumTracks(
    AppLocalizations l10n,
    AggregatedItem featured,
    List<AggregatedItem> tracks,
    int heroIndex,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: AppRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 6),
            child: Text(
              l10n.fromThisAlbum.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
          for (var i = 0; i < tracks.length; i++)
            MusicTrackTile(
              title: tracks[i].name,
              subtitle: '',
              leadingLabel: '${tracks[i].indexNumber ?? i + 1}',
              trailing: musicRunTime(tracks[i]),
              highlighted: tracks[i].id == featured.id,
              focusNode: node('albumTrack:$i'),
              onTap: () => unawaited(playMusicTrack(context, tracks[i])),
              onNavigateRight: () {},
              edges: MusicGridEdges(
                up: i == 0 ? () => move(heroIndex, true) : null,
                down: i == tracks.length - 1
                    ? () => move(heroIndex, false)
                    : null,
                left: () => node(
                  vm.featuredAlbum != null ? 'favorite' : 'shuffle',
                ).requestFocus(),
              ),
            ),
        ],
      ),
    );
  }

  /// Artists, Albums, Songs, Playlists, Genres and Favorites as tiles under
  /// the hero on phones.
  Widget _buildCategories(double inset, int entryIndex) {
    final categories = musicCategories(context, libraryId);
    const columns = 3;
    return Padding(
      key: sectionKey('categories'),
      padding: EdgeInsets.fromLTRB(inset, 16, inset, 0),
      child: MusicGrid(
        columns: columns,
        children: [
          for (var i = 0; i < categories.length; i++)
            MusicTile(
              label: categories[i].label,
              icon: categories[i].icon,
              focusNode: node('category:$i'),
              onTap: () => context.push(categories[i].route),
              edges: MusicGridEdges.of(
                i,
                count: categories.length,
                columns: columns,
                onLeaveUp: () => move(entryIndex, true),
                onLeaveDown: () => move(entryIndex, false),
                onLeaveLeft: focusBookSidebar,
              ),
            ),
        ],
      ),
    );
  }

  /// Two rows of the newest albums as a grid of cards.
  Widget _buildLatestGrid(
    AppLocalizations l10n,
    HomeRow row,
    double inset,
    int entryIndex,
  ) {
    return KeyedSubtree(
      key: sectionKey(row.id),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const spacing = 20.0;
          final available = constraints.maxWidth - inset - 48;
          final columns = ((available + spacing) / 200).floor().clamp(3, 8);
          final items = row.items.take(columns * 2).toList();
          final expansion = _prefs.get(UserPreferences.cardFocusExpansion);
          final headroom = MediaCard.focusHeadroom(
            (available - spacing * (columns - 1)) / columns,
            expansion: expansion,
          );
          return MusicSection(
            title: localizeHomeRowTitle(row: row, l10n: l10n),
            large: true,
            padding: EdgeInsets.fromLTRB(inset, 0, 48, 0),
            child: MusicGrid(
              columns: columns,
              spacing: spacing,
              headroom: headroom,
              children: [
                for (var i = 0; i < items.length; i++)
                  MusicGridCard(
                    focusNode: node('latest:$i'),
                    onTap: () => openItem(items[i]),
                    edges: MusicGridEdges.of(
                      i,
                      count: items.length,
                      columns: columns,
                      onLeaveUp: () => move(entryIndex, true),
                      onLeaveDown: () => move(entryIndex, false),
                      onLeaveLeft: focusBookSidebar,
                    ),
                    builder: (focused) => LayoutBuilder(
                      builder: (context, cell) => MediaCard(
                        width: cell.maxWidth,
                        aspectRatio: 1,
                        title: items[i].name,
                        subtitle: vm.getMusicSubtitle(items[i]),
                        imageUrl: vm.getMusicImageUrl(items[i], maxHeight: 400),
                        itemType: items[i].type,
                        isFavorite: items[i].isFavorite,
                        externalIsFocused: focused,
                        cardFocusExpansion: expansion,
                        onTap: () => openItem(items[i]),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenres(AppLocalizations l10n, double inset, int entryIndex) {
    final genres = vm.genres;
    final seeAll = node('seeAll:genres');
    return KeyedSubtree(
      key: sectionKey('genres'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const spacing = 16.0;
          final available = constraints.maxWidth - inset - 48;
          final columns = ((available + spacing) / 166).floor().clamp(2, 8);
          final shown = genres.take(columns).toList();
          return MusicSection(
            title: l10n.browseByGenre,
            large: true,
            padding: EdgeInsets.fromLTRB(inset, 0, 48, 0),
            trailing: BookSeeAllButton(
              onPressed: () => context.push(
                Destinations.musicCategory(
                  libraryId,
                  MusicCategoryKind.genres.name,
                ),
              ),
              focusNode: seeAll,
              onNavigateUp: () => move(entryIndex, true),
              onNavigateDown: node('genre:0').requestFocus,
            ),
            child: MusicGrid(
              columns: columns,
              spacing: spacing,
              children: [
                for (var i = 0; i < shown.length; i++)
                  MusicTile(
                    label: shown[i].name,
                    color: kMusicTileColors[i % kMusicTileColors.length],
                    height: 96,
                    focusNode: node('genre:$i'),
                    onTap: () => context.push(
                      Destinations.genre(
                        shown[i].name,
                        genreId: shown[i].id,
                        parentId: libraryId,
                        includeType: 'MusicAlbum',
                      ),
                    ),
                    edges: MusicGridEdges.of(
                      i,
                      count: shown.length,
                      columns: columns,
                      onLeaveUp: seeAll.requestFocus,
                      onLeaveDown: () => move(entryIndex, false),
                      onLeaveLeft: focusBookSidebar,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// The hero album blurred behind the top of the page, fading into it.
class _Backdrop extends StatelessWidget {
  final String imageUrl;

  const _Backdrop({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final background = AppColorScheme.background;
    final image = OfflineAwareImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
    final sigma = GlassSettings.capSigma(40);
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Without a blur budget a faded image keeps the text readable.
          if (sigma > 0)
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: image,
            )
          else
            Opacity(opacity: 0.35, child: image),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  background.withValues(alpha: 0.35),
                  background.withValues(alpha: 0.7),
                  background,
                ],
                stops: const [0.0, 0.65, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
