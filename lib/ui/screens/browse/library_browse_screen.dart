import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/models/aggregated_item.dart';
import '../../../data/repositories/mdblist_repository.dart';
import '../../../data/services/background_service.dart';
import '../../../data/viewmodels/library_browse_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/media_card.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/rating_display.dart';
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
Color get _jellyfinBlue => AppColorScheme.accent;
const _bookAccent = Color(0xFF32B9E8);
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;
bool _isCompact(BuildContext context) =>
    PlatformDetection.useMobileUi ||
    MediaQuery.sizeOf(context).width < _kCompactBreakpoint;

double _desktopUiScaleFactor() {
  return GetIt.instance<UserPreferences>()
      .get(UserPreferences.desktopUiScale)
      .scaleFactor;
}

enum _BookMediaTab { books, audiobooks }

enum _BookOrganizeMode { all, author, genre }

class LibraryBrowseScreen extends StatefulWidget {
  final String libraryId;
  final String? genreId;
  final String? genreName;
  final List<String>? includeItemTypes;

  const LibraryBrowseScreen({
    super.key,
    required this.libraryId,
    this.genreId,
    this.genreName,
    this.includeItemTypes,
  });

  @override
  State<LibraryBrowseScreen> createState() => _LibraryBrowseScreenState();
}

class _LibraryBrowseScreenState extends State<LibraryBrowseScreen>
    with GridFocusNodeMixin<LibraryBrowseScreen> {
  late final LibraryBrowseViewModel _vm;
  final _scrollController = ScrollController();
  final _prefs = GetIt.instance<UserPreferences>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;
  _BookMediaTab _bookMediaTab = _BookMediaTab.books;
  _BookOrganizeMode _bookOrganizeMode = _BookOrganizeMode.all;
  final Set<String> _localProgressItemIds = const {};

  @override
  void initState() {
    super.initState();
    _vm = LibraryBrowseViewModel(
      libraryId: widget.libraryId,
      client: GetIt.instance<MediaServerClient>(),
      prefs: _prefs,
      mdbListRepository: GetIt.instance<MdbListRepository>(),
      genreId: widget.genreId,
      overrideName: widget.genreName,
      includeItemTypes: widget.includeItemTypes,
    );
    _vm.addListener(_onChanged);
    _vm.load();
    _scrollController.addListener(_onScroll);
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _prefs.addListener(_onChanged);
  }

  @override
  void dispose() {
    _backgroundSub?.cancel();
    _scrollController.dispose();
    _vm.removeListener(_onChanged);
    _prefs.removeListener(_onChanged);
    _vm.dispose();
    disposeGridFocusNodes();
    super.dispose();
  }

  int _lastGridItemsLength = -1;
  Object? _lastGridFirstItemId;

  void _maybeBumpGridVersion() {
    final length = _vm.items.length;
    final firstId = length == 0 ? null : _vm.items.first.id;
    if (length != _lastGridItemsLength || firstId != _lastGridFirstItemId) {
      _lastGridItemsLength = length;
      _lastGridFirstItemId = firstId;
      gridContentVersion++;
      cleanupGridFocusNodes(length);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) restoreGridFocusIfNeeded();
      });
    }
  }

  void _onChanged() {
    if (mounted) setState(() {});
    _maybeBumpGridVersion();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (pos.pixels > pos.maxScrollExtent - 400) {
      _vm.loadMore();
    }
  }

  void _scrollToGridRow({
    required int index,
    required int crossAxisCount,
    required double cellHeight,
    required double mainAxisSpacing,
    double gridTopPadding = 8.0,
  }) {
    if (!mounted || !_scrollController.hasClients) return;
    final row = index ~/ crossAxisCount;
    final rowTop = gridTopPadding + row * (cellHeight + mainAxisSpacing);
    final rowBottom = rowTop + cellHeight;
    final position = _scrollController.position;
    final viewportH = position.viewportDimension;
    final current = position.pixels;
    const topPad = 8.0;
    const bottomPad = 52.0;
    double target = current;
    if (rowTop - topPad < current) {
      target = rowTop - topPad;
    } else if (rowBottom + bottomPad > current + viewportH) {
      target = rowBottom + bottomPad - viewportH;
    }
    target = target.clamp(position.minScrollExtent, position.maxScrollExtent);
    if ((target - current).abs() < 1) return;
    unawaited(
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  void _onItemFocused(AggregatedItem item) {
    _vm.setFocusedItem(item);
    _backgroundService.setBackground(item, context: BlurContext.browsing);
  }

  void _onItemTap(AggregatedItem item) {
    if (_vm.isNavigableFolder(item)) {
      context.push(Destinations.folder(item.id));
      return;
    }

    context
        .push(
          Destinations.itemOrPhoto(
            item.id,
            serverId: item.serverId,
            type: item.type,
          ),
        )
        .then((result) {
          if (result == true && mounted) {
            _vm.load();
          }
        });
  }

  bool _isAudiobook(AggregatedItem item) {
    final type = (item.type ?? '').toLowerCase();
    final mediaType = (item.rawData['MediaType'] as String? ?? '')
        .toLowerCase();
    return type == 'audio' || type == 'audiobook' || mediaType == 'audio';
  }

  String _primaryAuthor(AggregatedItem item) {
    final directAuthor = (item.rawData['Author'] as String?)?.trim();
    if (directAuthor != null && directAuthor.isNotEmpty) {
      return directAuthor;
    }

    final authors = (item.rawData['Authors'] as List?)
        ?.whereType<String>()
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    if (authors != null && authors.isNotEmpty) {
      return authors.first;
    }

    final people =
        (item.rawData['People'] as List?)
            ?.whereType<Map>()
            .map((p) => p.cast<String, dynamic>())
            .toList() ??
        const <Map<String, dynamic>>[];
    for (final person in people) {
      final type = (person['Type'] as String?)?.toLowerCase();
      if (type != 'author' && type != 'writer') continue;
      final name = (person['Name'] as String?)?.trim();
      if (name != null && name.isNotEmpty) {
        return name;
      }
    }

    if ((item.albumArtist ?? '').trim().isNotEmpty) {
      return item.albumArtist!.trim();
    }
    if (item.albumArtists.isNotEmpty) {
      final first = (item.albumArtists.first['Name'] as String?)?.trim();
      if (first != null && first.isNotEmpty) {
        return first;
      }
    }
    if (item.artists.isNotEmpty && item.artists.first.trim().isNotEmpty) {
      return item.artists.first.trim();
    }
    return AppLocalizations.of(context).unknownAuthor;
  }

  String _primaryGenre(AggregatedItem item) {
    if (item.genres.isNotEmpty && item.genres.first.trim().isNotEmpty) {
      return item.genres.first.trim();
    }
    return AppLocalizations.of(context).uncategorized;
  }

  double? _displayPlayedPercentage(AggregatedItem item) {
    final server = item.playedPercentage;
    if (server != null && server > 0) {
      return server;
    }
    final hasTicks = (item.playbackPositionTicks ?? 0) > 0;
    if (hasTicks || _localProgressItemIds.contains(item.id)) {
      return 3;
    }
    return null;
  }

  double _cardWidth() {
    final desktopScale = _desktopUiScaleFactor();
    if (_vm.isMusicBrowse || _vm.isPlaylistBrowse) {
      return _vm.posterSize.portraitHeight.toDouble() * desktopScale;
    }
    final posterSize = _vm.posterSize;
    final baseWidth = switch (_vm.imageType) {
      ImageType.thumb => posterSize.landscapeHeight * (16 / 9),
      ImageType.banner => posterSize.landscapeHeight * (16 / 9),
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * desktopScale;
  }

  double _selectedImageAspectRatio() {
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => 16 / 9,
      ImageType.poster => 2 / 3,
    };
  }

  double _gridBaseAspectRatio() {
    if (_vm.isMusicBrowse || _vm.isPlaylistBrowse) return 1.0;
    if (_vm.isGenreBrowse) return _selectedImageAspectRatio();
    if (_vm.imageType != ImageType.poster &&
        _vm.items.isNotEmpty &&
        _vm.items.every(_vm.isNavigableFolder)) {
      return 16 / 9;
    }
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => 16 / 9,
      ImageType.poster => 2 / 3,
    };
  }

  double _itemAspectRatio(AggregatedItem item) {
    if (_vm.isMusicBrowse || _vm.isPlaylistBrowse) return 1.0;
    if (_vm.isGenreBrowse) return _selectedImageAspectRatio();
    if (_vm.isNavigableFolder(item) && _vm.imageType != ImageType.poster) {
      return 16 / 9;
    }
    return switch (_vm.imageType) {
      ImageType.thumb => switch (item.type) {
        'MusicAlbum' ||
        'MusicArtist' ||
        'Audio' ||
        'Playlist' ||
        'Person' => 1.0,
        _ => 16 / 9,
      },
      ImageType.banner => 16 / 9,
      ImageType.poster => MediaCard.aspectRatioForType(item.type),
    };
  }

  bool _prefersThumbArtwork(AggregatedItem item) {
    return switch (item.type) {
      'Episode' || 'Program' || 'Recording' || 'Video' || 'MusicVideo' => true,
      _ => false,
    };
  }

  String? _tagForType(AggregatedItem item, String imageType) {
    final tags = item.rawData['ImageTags'];
    if (tags is! Map) return null;
    return tags[imageType] as String?;
  }

  String? _imageUrl(AggregatedItem item) {
    final api = _vm.imageApi;
    final baseCardWidth = _cardWidth();
    final posterMaxW = baseCardWidth < 260
        ? 420
        : (baseCardWidth < 340 ? 560 : 700);
    final landscapeMaxW = baseCardWidth < 260
        ? 720
        : (baseCardWidth < 340 ? 960 : 1200);

    final itemThumbTag = _tagForType(item, 'Thumb');
    final itemBannerTag = _tagForType(item, 'Banner');
    final parentThumbItemId = item.rawData['ParentThumbItemId']?.toString();
    final parentThumbTag = item.rawData['ParentThumbImageTag'] as String?;
    final prefersThumbArtwork = _prefersThumbArtwork(item);

    if (_vm.isNavigableFolder(item)) {
      if (_vm.imageType == ImageType.poster) {
        if (item.primaryImageTag != null) {
          return api.getPrimaryImageUrl(
            item.id,
            maxWidth: posterMaxW,
            tag: item.primaryImageTag,
          );
        }
        if (itemThumbTag != null) {
          return api.getThumbImageUrl(
            item.id,
            maxWidth: landscapeMaxW,
            tag: itemThumbTag,
          );
        }
        if (item.backdropImageTags.isNotEmpty) {
          return api.getBackdropImageUrl(
            item.id,
            maxWidth: landscapeMaxW,
            tag: item.backdropImageTags.first,
          );
        }
        return null;
      }
      if (itemThumbTag != null) {
        return api.getThumbImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemThumbTag,
        );
      }
      if (itemBannerTag != null) {
        return api.getBannerImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemBannerTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: item.backdropImageTags.first,
        );
      }
      if (item.primaryImageTag != null) {
        return api.getPrimaryImageUrl(
          item.id,
          maxWidth: posterMaxW,
          tag: item.primaryImageTag,
        );
      }
      if (parentThumbItemId != null && parentThumbTag != null) {
        return api.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: landscapeMaxW,
          tag: parentThumbTag,
        );
      }
      return null;
    }

    if (_vm.isPlaylistBrowse) {
      return item.primaryImageTag != null
          ? api.getPrimaryImageUrl(item.id, maxWidth: posterMaxW)
          : null;
    }

    if (_vm.imageType == ImageType.banner) {
      if (itemBannerTag != null) {
        return api.getBannerImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemBannerTag,
        );
      }
      if (item.primaryImageTag != null) {
        return api.getPrimaryImageUrl(
          item.id,
          maxWidth: posterMaxW,
          tag: item.primaryImageTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: item.backdropImageTags.first,
        );
      }
      return null;
    }

    if (_vm.imageType == ImageType.thumb) {
      if (itemThumbTag != null) {
        return api.getThumbImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemThumbTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: item.backdropImageTags.first,
        );
      }
      if (parentThumbItemId != null && parentThumbTag != null) {
        return api.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: landscapeMaxW,
          tag: parentThumbTag,
        );
      }
      if (item.parentBackdropItemId != null &&
          item.parentBackdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.parentBackdropItemId!,
          maxWidth: landscapeMaxW,
          tag: item.parentBackdropImageTags.first,
        );
      }
      if (item.primaryImageTag != null) {
        return api.getPrimaryImageUrl(
          item.id,
          maxWidth: posterMaxW,
          tag: item.primaryImageTag,
        );
      }
      return null;
    }

    if (prefersThumbArtwork && !_vm.isGenreBrowse) {
      if (itemThumbTag != null) {
        return api.getThumbImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemThumbTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: item.backdropImageTags.first,
        );
      }
      if (parentThumbItemId != null && parentThumbTag != null) {
        return api.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: landscapeMaxW,
          tag: parentThumbTag,
        );
      }
    }

    if (item.primaryImageTag != null) {
      return api.getPrimaryImageUrl(
        item.id,
        maxWidth: posterMaxW,
        tag: item.primaryImageTag,
      );
    }

    if (item.seriesId != null && item.seriesPrimaryImageTag != null) {
      return api.getPrimaryImageUrl(
        item.seriesId!,
        maxWidth: posterMaxW,
        tag: item.seriesPrimaryImageTag,
      );
    }

    if (itemThumbTag != null) {
      return api.getThumbImageUrl(
        item.id,
        maxWidth: landscapeMaxW,
        tag: itemThumbTag,
      );
    }

    if (item.backdropImageTags.isNotEmpty) {
      return api.getBackdropImageUrl(
        item.id,
        maxWidth: landscapeMaxW,
        tag: item.backdropImageTags.first,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final hasBackdrop = !isMobile && _backdropUrl != null;
    return Scaffold(
      backgroundColor: _navyBackground,
      body: Stack(
        children: [
          if (hasBackdrop)
            Positioned.fill(
              child: FullscreenBackdropSwitcher(
                imageUrl: _backdropUrl!,
                duration: BackgroundService.transitionDuration,
              ),
            ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: _navyBackground.withAlpha(hasBackdrop ? 115 : 191),
              ),
            ),
          ),
          Column(
            children: [
              _LibraryHeader(
                libraryName: () {
                  if (_vm.includeItemTypes != null &&
                      _vm.includeItemTypes!.isNotEmpty) {
                    final type = _vm.includeItemTypes!.first;
                    if (type == 'MusicAlbum') {
                      return AppLocalizations.of(context).albums;
                    } else if (type == 'AlbumArtist') {
                      return AppLocalizations.of(context).albumArtists;
                    } else if (type == 'MusicArtist') {
                      return AppLocalizations.of(context).artists;
                    }
                  }
                  return _vm.libraryName;
                }(),
                totalCount: _vm.totalCount,
                focusedItem: _vm.focusedItem,
                focusedRatings: _vm.focusedRatings,
                enableAdditionalRatings: _prefs.get(
                  UserPreferences.enableAdditionalRatings,
                ),
                enabledRatings: _prefs.get(UserPreferences.enabledRatings),
                showLabels: _prefs.get(UserPreferences.showRatingLabels),
                showBadges: _prefs.get(UserPreferences.showRatingBadges),
                showMediaDetails: _prefs.get(
                  UserPreferences.showMediaDetailsOnLibraryPage,
                ),
                sortBy: _vm.sortBy,
                letterFilter: _vm.letterFilter,
                isMusicBrowse: _vm.isMusicBrowse,
                isBookBrowse: false,
                activeBookTab: _bookMediaTab,
                bookOrganizeMode: _bookOrganizeMode,
                playedFilter: _vm.playedFilter,
                favoriteFilter: _vm.favoriteFilter,
                onBack: () => PlatformDetection.isWeb
                    ? context.popOrHome()
                    : context.pop(),
                onSort: () => _showFilterSortDialog(context),
                onSettings: () => _showSettingsDialog(context),
                onBookTabChanged: (tab) => setState(() => _bookMediaTab = tab),
                onBookOrganizeChanged: (mode) =>
                    setState(() => _bookOrganizeMode = mode),
                onLetterChanged: (l) => _vm.setLetterFilter(l),
                onPlayedFilterChanged: (status) => _vm.setPlayedFilter(status),
                onFavoriteFilterChanged: (value) =>
                    _vm.setFavoriteFilter(value),
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final spinnerColor = _vm.isBookLibrary ? _bookAccent : _jellyfinBlue;
    return switch (_vm.state) {
      LibraryBrowseState.loading => Center(
        child: CircularProgressIndicator(color: spinnerColor),
      ),
      LibraryBrowseState.error => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _vm.errorMessage ??
                  AppLocalizations.of(context).failedToLoadLibrary,
              style: TextStyle(
                color: _vm.isBookLibrary
                    ? const Color(0xFFF4E6D5)
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _vm.load,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      ),
      LibraryBrowseState.ready =>
        _vm.isBookLibrary ? _buildBookGrid() : _buildGrid(),
    };
  }

  Widget _buildGrid() {
    if (_vm.items.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noItemsFound,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    final cardWidth = _cardWidth();
    final spacing = _vm.isBookLibrary ? 16.0 : 12.0;
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = _isCompact(context);
        final gridPadding = isMobile ? 16.0 : _horizontalPadding;
        final crossAxisCount =
            ((constraints.maxWidth - gridPadding * 2 + spacing) /
                    (cardWidth + spacing))
                .floor()
                .clamp(2, 20);

        final cellWidth =
            (constraints.maxWidth -
                gridPadding * 2 -
                (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        final ar = _gridBaseAspectRatio();
        final hasSubtitles = _vm.items.any(
          (item) => (_cardSubtitle(item)?.isNotEmpty ?? false),
        );
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = (hasSubtitles ? 42.0 : 24.0) * desktopTextScale;
        final childAspectRatio = cellWidth / (cellWidth / ar + textHeight);

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(gridPadding, 8, gridPadding, 16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: spacing,
                  childAspectRatio: childAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = _vm.items[index];
                  final itemAspectRatio = _itemAspectRatio(item);
                  final focusColor = _vm.isGenreBrowse
                      ? ThemeRegistry.active.borders.focusBorder.color
                      : Color(
                          _prefs.get(UserPreferences.focusColor).colorValue,
                        );
                  final isNeon =
                      ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
                  Widget card = MediaCard(
                    title: item.name,
                    subtitle: _cardSubtitle(item),
                    imageUrl: _imageUrl(item),
                    width: double.infinity,
                    aspectRatio: itemAspectRatio,
                    focusColor: focusColor,
                    focusNode: getGridItemFocusNode(index),
                    cardFocusExpansion: _prefs.get(
                      UserPreferences.cardFocusExpansion,
                    ),
                    suppressFocusGlow: isNeon,
                    isPlayed: item.isPlayed,
                    isFavorite: item.isFavorite,
                    unplayedCount: item.unplayedItemCount,
                    playedPercentage: _displayPlayedPercentage(item),
                    watchedBehavior: watchedBehavior,
                    itemType: item.type,
                    onFocus: isMobile
                        ? null
                        : () {
                            _onItemFocused(item);
                            _scrollToGridRow(
                              index: index,
                              crossAxisCount: crossAxisCount,
                              cellHeight: cellWidth / childAspectRatio,
                              mainAxisSpacing: 8.0,
                            );
                          },
                    onHoverStart: isMobile ? null : () => _onItemFocused(item),
                    onHoverEnd: isMobile
                        ? null
                        : () => _vm.setFocusedItem(null),
                    onKeyEvent: (_, event) {
                      if (event.isActionable && event.logicalKey.isRightKey) {
                        final isLastColumn =
                            (index % crossAxisCount) == crossAxisCount - 1;
                        final isLastItem = index == _vm.items.length - 1;
                        if (isLastColumn || isLastItem) {
                          // Keep focus in the current grid row at the right edge.
                          return KeyEventResult.handled;
                        }
                      }

                      if (!_vm.hasMore && !_vm.loadingMore) {
                        return KeyEventResult.ignored;
                      }
                      if (!event.isActionable || !event.logicalKey.isDownKey) {
                        return KeyEventResult.ignored;
                      }

                      final nextRowIndex = index + crossAxisCount;
                      final atBottomLoadedRow =
                          nextRowIndex >= _vm.items.length;
                      if (!atBottomLoadedRow) {
                        return KeyEventResult.ignored;
                      }

                      _vm.loadMore();
                      return KeyEventResult.handled;
                    },
                    onLongPress: () => showContextMenu(
                      context,
                      item,
                      onChanged: () => setState(() {}),
                    ),
                    onTap: () => _onItemTap(item),
                  );
                  return card;
                }, childCount: _vm.items.length),
              ),
            ),
            if (_vm.loadingMore)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: _vm.isBookLibrary ? _bookAccent : _jellyfinBlue,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildBookGrid() {
    final baseItems = _vm.items.where((item) => !_vm.isNavigableFolder(item));
    final tabFiltered = baseItems.where(
      (item) => _bookMediaTab == _BookMediaTab.books
          ? !_isAudiobook(item)
          : _isAudiobook(item),
    );

    final filtered =
        tabFiltered.where((item) {
          final progress = item.playedPercentage ?? 0;
          final watchedMatch = switch (_vm.playedFilter) {
            PlayedStatusFilter.all => true,
            PlayedStatusFilter.watched => item.isPlayed || progress >= 100,
            PlayedStatusFilter.unwatched => !item.isPlayed && progress < 100,
          };
          final favoriteMatch = !_vm.favoriteFilter || item.isFavorite;
          return watchedMatch && favoriteMatch;
        }).toList()..sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );

    if (filtered.isEmpty) {
      final label = _bookMediaTab == _BookMediaTab.books
          ? AppLocalizations.of(context).books.toLowerCase()
          : AppLocalizations.of(context).audiobooks.toLowerCase();
      return Center(
        child: Text(
          AppLocalizations.of(context).noLabelFound(label),
          style: const TextStyle(color: Color(0xFFD4B28B)),
        ),
      );
    }

    final sections = <MapEntry<String, List<AggregatedItem>>>[];
    if (_bookOrganizeMode == _BookOrganizeMode.all) {
      sections.add(MapEntry('All', List<AggregatedItem>.from(filtered)));
    } else {
      final grouped = <String, List<AggregatedItem>>{};
      for (final item in filtered) {
        final key = _bookOrganizeMode == _BookOrganizeMode.author
            ? _primaryAuthor(item)
            : _primaryGenre(item);
        grouped.putIfAbsent(key, () => []).add(item);
      }
      final keys = grouped.keys.toList()..sort();
      for (final key in keys) {
        sections.add(MapEntry(key, grouped[key]!));
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = _isCompact(context);
        final hPad = isMobile ? 16.0 : _horizontalPadding;
        final spacing = isMobile ? 10.0 : 14.0;
        final desiredWidth = isMobile ? 112.0 : 136.0;
        final crossAxisCount =
            ((constraints.maxWidth - hPad * 2 + spacing) /
                    (desiredWidth + spacing))
                .floor()
                .clamp(2, 10);

        final cellWidth =
            (constraints.maxWidth - hPad * 2 - (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        const cardRatio = 2 / 3;
        final textHeight = 44.0 * _desktopUiScaleFactor();
        final childAspectRatio =
            cellWidth / (cellWidth / cardRatio + textHeight);

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(hPad, 10, hPad, 40),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final section = sections[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_bookOrganizeMode != _BookOrganizeMode.all)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            section.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFE6C3),
                            ),
                          ),
                        ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: section.value.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: 10,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemBuilder: (context, i) {
                          final item = section.value[i];
                          return MediaCard(
                            title: item.name,
                            subtitle: _primaryAuthor(item),
                            imageUrl: _imageUrl(item),
                            width: double.infinity,
                            aspectRatio: 2 / 3,
                            focusColor: _bookAccent,
                            cardFocusExpansion: _prefs.get(
                              UserPreferences.cardFocusExpansion,
                            ),
                            suppressFocusGlow:
                                ThemeRegistry.active.id ==
                                ThemeRegistry.neonPulseId,
                            isPlayed: item.isPlayed,
                            isFavorite: item.isFavorite,
                            playedPercentage: _displayPlayedPercentage(item),
                            watchedBehavior: _prefs.get(
                              UserPreferences.watchedIndicatorBehavior,
                            ),
                            itemType: item.type,
                            onFocus: isMobile
                                ? null
                                : () => _onItemFocused(item),
                            onHoverStart: isMobile
                                ? null
                                : () => _onItemFocused(item),
                            onHoverEnd: isMobile
                                ? null
                                : () => _vm.setFocusedItem(null),
                            onTap: () => _onItemTap(item),
                            onLongPress: () => showContextMenu(
                              context,
                              item,
                              onChanged: () => setState(() {}),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                    ],
                  );
                }, childCount: sections.length),
              ),
            ),
            if (_vm.loadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(color: _bookAccent),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  String? _cardSubtitle(AggregatedItem item) {
    if (item.type == 'Playlist') {
      final count = item.childCount ?? item.recursiveItemCount;
      if (count != null) {
        return AppLocalizations.of(context).itemCountLabel(count);
      }
      return null;
    }

    final parts = <String>[];
    if (item.type == 'MusicAlbum') {
      if (item.artists.isNotEmpty) return item.artists.join(', ');
      if (item.albumArtists.isNotEmpty) {
        return item.albumArtists
            .map((a) => a['Name'] as String? ?? '')
            .where((n) => n.isNotEmpty)
            .join(', ');
      }
      final albumArtist = item.albumArtist;
      if (albumArtist != null && albumArtist.isNotEmpty) {
        return albumArtist;
      }
    }

    if (_vm.isNavigableFolder(item)) {
      if (item.childCount != null) {
        parts.add(
          AppLocalizations.of(context).itemCountLabel(item.childCount!),
        );
      }
      return parts.isEmpty
          ? AppLocalizations.of(context).folder
          : parts.join('  ');
    }

    if (_vm.isPlaylistBrowse) {
      final count = item.childCount ?? item.recursiveItemCount;
      if (count != null) {
        parts.add(AppLocalizations.of(context).itemCountLabel(count));
      }
      return parts.isEmpty ? null : parts.join('  ');
    }

    final useDetailed = _prefs.get(UserPreferences.useDetailedSubHeadings);
    if (!useDetailed) {
      return item.productionYear != null ? '${item.productionYear}' : null;
    }

    if (item.productionYear != null) parts.add('${item.productionYear}');
    if (item.officialRating != null) parts.add(item.officialRating!);
    final rt = item.runtime;
    if (rt != null) {
      final h = rt.inHours;
      final m = rt.inMinutes % 60;
      if (h > 0) {
        parts.add('${h}h ${m}m');
      } else {
        parts.add('${m}m');
      }
    }
    final resolution = item.videoResolution;
    if (resolution != null) parts.add('• $resolution');
    if (item.communityRating != null) {
      parts.add('★ ${item.communityRating!.toStringAsFixed(1)}');
    }
    return parts.isEmpty ? null : parts.join('  ');
  }

  void _showFilterSortDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _FilterSortDialog(vm: _vm),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _SettingsDialog(vm: _vm),
    );
  }
}

class _LibraryHeader extends StatelessWidget {
  final String libraryName;
  final int totalCount;
  final AggregatedItem? focusedItem;
  final Map<String, double> focusedRatings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;
  final bool showMediaDetails;
  final LibrarySortBy sortBy;
  final String letterFilter;
  final bool isMusicBrowse;
  final bool isBookBrowse;
  final _BookMediaTab activeBookTab;
  final _BookOrganizeMode bookOrganizeMode;
  final PlayedStatusFilter playedFilter;
  final bool favoriteFilter;
  final VoidCallback onBack;
  final VoidCallback onSort;
  final VoidCallback onSettings;
  final ValueChanged<_BookMediaTab> onBookTabChanged;
  final ValueChanged<_BookOrganizeMode> onBookOrganizeChanged;
  final ValueChanged<String> onLetterChanged;
  final ValueChanged<PlayedStatusFilter> onPlayedFilterChanged;
  final ValueChanged<bool> onFavoriteFilterChanged;

  const _LibraryHeader({
    required this.libraryName,
    required this.totalCount,
    this.focusedItem,
    this.focusedRatings = const {},
    this.enableAdditionalRatings = false,
    this.enabledRatings = 'tomatoes,stars',
    this.showLabels = true,
    this.showBadges = true,
    required this.showMediaDetails,
    required this.sortBy,
    required this.letterFilter,
    this.isMusicBrowse = false,
    this.isBookBrowse = false,
    this.activeBookTab = _BookMediaTab.books,
    this.bookOrganizeMode = _BookOrganizeMode.all,
    this.playedFilter = PlayedStatusFilter.all,
    this.favoriteFilter = false,
    required this.onBack,
    required this.onSort,
    required this.onSettings,
    required this.onBookTabChanged,
    required this.onBookOrganizeChanged,
    required this.onLetterChanged,
    required this.onPlayedFilterChanged,
    required this.onFavoriteFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    final isCompactLandscape = isMobile && isLandscape;
    final isCompactPortrait = isMobile && !isLandscape;
    final showInlineAlpha =
        !isBookBrowse &&
        sortBy == LibrarySortBy.name &&
        (!isMobile || isCompactLandscape);
    final showBelowAlpha =
        !isBookBrowse && sortBy == LibrarySortBy.name && isCompactPortrait;
    final topPad = (isMobile ? MediaQuery.of(context).padding.top : 0.0) + 8.0;
    final hPad = isMobile ? 16.0 : _horizontalPadding * desktopScale;

    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, topPad, hPad, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                libraryName,
                style: TextStyle(
                  fontSize: 26 * desktopScale,
                  fontWeight: isBookBrowse ? FontWeight.w600 : FontWeight.w300,
                  color: isBookBrowse ? const Color(0xFFF3E3CF) : Colors.white,
                  letterSpacing: isBookBrowse ? 0.4 : 0,
                ),
              ),
              if (totalCount > 0) ...[
                SizedBox(width: 12 * desktopScale),
                Text(
                  '$totalCount Items',
                  style: TextStyle(
                    fontSize: 12 * desktopScale,
                    color: isBookBrowse
                        ? const Color(0xFFE5C9A3)
                        : Colors.white.withAlpha(102),
                  ),
                ),
              ],
            ],
          ),
          if (showMediaDetails && !isMobile && !isBookBrowse) ...[
            const SizedBox(height: 2),
            _FocusedItemHud(
              item: focusedItem,
              ratings: focusedRatings,
              enableAdditionalRatings: enableAdditionalRatings,
              enabledRatings: enabledRatings,
              showLabels: showLabels,
              showBadges: showBadges,
            ),
          ],
          SizedBox(height: isBookBrowse ? 2 : 8),
          Row(
            mainAxisAlignment: (isMobile && !showInlineAlpha)
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (PlatformDetection.isTV)
                FocusableToolbarButton(
                  icon: Icons.home,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: () => context.go(Destinations.home),
                )
              else
                FocusableToolbarButton(
                  icon: Icons.arrow_back,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onBack,
                ),
              if (!isBookBrowse) ...[
                SizedBox(width: 2 * desktopScale),
                FocusableToolbarButton(
                  icon: Icons.sort,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onSort,
                ),
              ],
              if (!isMusicBrowse && !isBookBrowse) ...[
                SizedBox(width: 2 * desktopScale),
                FocusableToolbarButton(
                  icon: Icons.settings,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onSettings,
                ),
              ],
              if (showInlineAlpha) ...[
                SizedBox(width: 10 * desktopScale),
                Expanded(
                  child: _AlphaPickerBar(
                    selected: letterFilter,
                    onChanged: onLetterChanged,
                  ),
                ),
              ],
            ],
          ),
          if (showBelowAlpha) ...[
            const SizedBox(height: 8),
            _AlphaPickerBar(selected: letterFilter, onChanged: onLetterChanged),
          ],
          if (isBookBrowse) ...[
            const SizedBox(height: 10),
            _BookMediaTabs(
              activeTab: activeBookTab,
              onChanged: onBookTabChanged,
            ),
            const SizedBox(height: 8),
            _BookStatusCategories(
              playedFilter: playedFilter,
              favoriteFilter: favoriteFilter,
              onPlayedFilterChanged: onPlayedFilterChanged,
              onFavoriteFilterChanged: onFavoriteFilterChanged,
            ),
            const SizedBox(height: 8),
            _BookOrganizeChips(
              mode: bookOrganizeMode,
              onChanged: onBookOrganizeChanged,
            ),
          ],
        ],
      ),
    );
  }
}

class _FocusedItemHud extends StatelessWidget {
  final AggregatedItem? item;
  final Map<String, double> ratings;
  final bool enableAdditionalRatings;
  final String enabledRatings;
  final bool showLabels;
  final bool showBadges;

  const _FocusedItemHud({
    this.item,
    this.ratings = const {},
    this.enableAdditionalRatings = false,
    this.enabledRatings = 'tomatoes,stars',
    this.showLabels = true,
    this.showBadges = true,
  });

  @override
  Widget build(BuildContext context) {
    final hudHeight = (showLabels ? 105.0 : 86.0) * _desktopUiScaleFactor();
    return SizedBox(
      height: hudHeight,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: item == null
            ? const SizedBox.shrink(key: ValueKey('empty'))
            : Column(
                key: ValueKey(item!.id),
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item!.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  _MetadataRow(item: item!),
                  const SizedBox(height: 4),
                  RatingsRow(
                    ratings: ratings,
                    communityRating: item!.communityRating,
                    criticRating: item!.criticRating,
                    enableAdditionalRatings: enableAdditionalRatings,
                    enabledRatings: enabledRatings,
                    showLabels: showLabels,
                    showBadges: showBadges,
                  ),
                  const SizedBox(height: 2),
                ],
              ),
      ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  final AggregatedItem item;

  const _MetadataRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (item.productionYear != null) {
      children.add(_infoText('${item.productionYear}'));
    }

    if (item.type != 'Series') {
      final rt = item.runtime;
      if (rt != null) {
        final h = rt.inHours;
        final m = rt.inMinutes % 60;
        final timeStr = h > 0 ? '${h}h ${m}m' : '${m}m';
        children.add(_infoText(timeStr));
      }
    }

    if (item.type == 'Series' && item.status != null) {
      final continuing = item.status == 'Continuing';
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: continuing
                ? const Color(0xFF22C55E)
                : const Color(0xFFEF4444),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            continuing ? 'Continuing' : 'Ended',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    if (item.officialRating != null && item.type != 'Playlist') {
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(38),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            item.officialRating!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }

  Widget _infoText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white.withAlpha(179),
      ),
    );
  }
}

class _AlphaPickerBar extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _AlphaPickerBar({required this.selected, required this.onChanged});

  static const _letters = [
    '',
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _letters.map((letter) {
          final isSelected = selected == letter;
          return _AlphaLetterButton(
            label: letter.isEmpty ? AppLocalizations.of(context).all : letter,
            isSelected: isSelected,
            onTap: () => onChanged(letter),
          );
        }).toList(),
      ),
    );
  }
}

class _AlphaLetterButton extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AlphaLetterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_AlphaLetterButton> createState() => _AlphaLetterButtonState();
}

class _AlphaLetterButtonState extends State<_AlphaLetterButton>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final desktopScale = _desktopUiScaleFactor();
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 30 * desktopScale,
            height: 30 * desktopScale,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.isSelected ? Colors.white.withAlpha(26) : null,
              borderRadius: BorderRadius.circular(4),
              border: showFocusBorder
                  ? Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: focusColor,
                        width: 1.5,
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 15 * desktopScale,
                fontWeight: widget.isSelected
                    ? FontWeight.w700
                    : FontWeight.w500,
                color: widget.isSelected
                    ? _jellyfinBlue
                    : Colors.white.withAlpha(140),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterSortDialog extends StatefulWidget {
  final LibraryBrowseViewModel vm;

  const _FilterSortDialog({required this.vm});

  @override
  State<_FilterSortDialog> createState() => _FilterSortDialogState();
}

class _FilterSortDialogState extends State<_FilterSortDialog> {
  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final isBookBrowse = vm.isBookLibrary;
    final accent = isBookBrowse ? _bookAccent : _jellyfinBlue;
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(
      alpha: isBookBrowse ? 0.96 : 0.92,
    );
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final sectionColor = onSurface.withValues(alpha: 0.72);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      380.0,
    );
    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.sortAndFilter,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            _sectionHeader(l10n.sortBy, sectionColor),
            for (final option
                in (vm.isHomeVideosLibrary || vm.isMixedContentLibrary)
                    ? const [
                        LibrarySortBy.name,
                        LibrarySortBy.dateAdded,
                        LibrarySortBy.random,
                      ]
                    : LibrarySortBy.values.where((o) => !vm.isMusicBrowse || (
                        o != LibrarySortBy.rating &&
                        o != LibrarySortBy.criticRating &&
                        o != LibrarySortBy.communityRating
                      )))
              _radioTile(
                label: (vm.isMusicBrowse && option == LibrarySortBy.premiereDate)
                    ? 'Release Date'
                    : option.displayName,
                selected: vm.sortBy == option,
                trailing: vm.sortBy == option
                    ? IconButton(
                        icon: Icon(
                          vm.sortDirection == SortDirection.ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: accent,
                          size: 18,
                        ),
                        onPressed: () => vm.toggleSortDirection(),
                      )
                    : null,
                onTap: () {
                  if (vm.sortBy == option) {
                    vm.toggleSortDirection();
                  } else {
                    vm.setSortBy(option);
                  }
                },
                onSurface: onSurface,
              ),
            Divider(color: dividerColor),
            _sectionHeader(l10n.filters, sectionColor),
            _checkboxTile(
              label: l10n.favorites,
              checked: vm.favoriteFilter,
              onTap: () => vm.setFavoriteFilter(!vm.favoriteFilter),
              accent: accent,
              onSurface: onSurface,
            ),
            if (!vm.isMusicBrowse) ...[
              Divider(color: dividerColor),
              _sectionHeader(
                isBookBrowse ? l10n.readingStatus : l10n.playedStatus,
                sectionColor,
              ),
              for (final status in PlayedStatusFilter.values)
                _radioTile(
                  label: switch (status) {
                    PlayedStatusFilter.all => l10n.all,
                    PlayedStatusFilter.watched =>
                      isBookBrowse ? l10n.readStatus : l10n.watched,
                    PlayedStatusFilter.unwatched =>
                      isBookBrowse ? l10n.unread : l10n.unwatched,
                  },
                  selected: vm.playedFilter == status,
                  onTap: () => vm.setPlayedFilter(status),
                  accent: accent,
                  onSurface: onSurface,
                ),
            ],
            if (vm.isSeriesLibrary) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.seriesStatus, sectionColor),
              for (final status in SeriesStatusFilter.values)
                _radioTile(
                  label: switch (status) {
                    SeriesStatusFilter.all => l10n.all,
                    SeriesStatusFilter.continuing => l10n.continuing,
                    SeriesStatusFilter.ended => l10n.ended,
                  },
                  selected: vm.seriesFilter == status,
                  onTap: () => vm.setSeriesFilter(status),
                  accent: accent,
                  onSurface: onSurface,
                ),
            ],
            if (vm.isGenreBrowse && vm.libraries.isNotEmpty) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.library, sectionColor),
              _radioTile(
                label: l10n.allLibraries,
                selected: vm.libraryFilter == null,
                onTap: () => vm.setLibraryFilter(null),
                accent: accent,
                onSurface: onSurface,
              ),
              for (final lib in vm.libraries)
                _radioTile(
                  label: lib['Name'] as String? ?? '',
                  selected: vm.libraryFilter == lib['Id'],
                  onTap: () => vm.setLibraryFilter(lib['Id']?.toString() ?? ''),
                  accent: accent,
                  onSurface: onSurface,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, Color sectionColor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: sectionColor,
        ),
      ),
    );
  }

  Widget _radioTile({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    Widget? trailing,
    Color? accent,
    required Color onSurface,
  }) {
    final effectiveAccent = accent ?? AppColorScheme.accent;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: selected
                        ? effectiveAccent
                        : onSurface.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                color: selected ? effectiveAccent : Colors.transparent,
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: onSurface,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: selected
                      ? onSurface
                      : onSurface.withValues(alpha: 0.72),
                ),
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }

  Widget _checkboxTile({
    required String label,
    required bool checked,
    required VoidCallback onTap,
    required Color accent,
    required Color onSurface,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.fromBorderSide(
                  ThemeRegistry.active.borders.chipBorder.copyWith(
                    color: checked ? accent : onSurface.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                color: checked ? accent : Colors.transparent,
              ),
              child: checked
                  ? Center(
                      child: Text(
                        '✓',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: onSurface,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: checked ? onSurface : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsDialog extends StatefulWidget {
  final LibraryBrowseViewModel vm;

  const _SettingsDialog({required this.vm});

  @override
  State<_SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<_SettingsDialog> {
  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final isBookBrowse = vm.isBookLibrary;
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(
      alpha: isBookBrowse ? 0.96 : 0.92,
    );
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final sectionColor = onSurface.withValues(alpha: 0.72);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      340.0,
    );
    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: ThemeRegistry.active.borders.chipBorder.copyWith(
          color: onSurface.withValues(alpha: 0.18),
        ),
      ),
      child: SizedBox(
        width: dialogWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.display,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            if (!vm.isPlaylistBrowse) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
                child: Text(
                  l10n.imageType,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: sectionColor,
                  ),
                ),
              ),
              for (final type in ImageType.values) _settingsRadioTile(vm, type),
              Divider(color: dividerColor),
            ],
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
              child: Text(
                l10n.posterSize,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sectionColor,
                ),
              ),
            ),
            for (final size in PosterSize.values)
              _posterSizeRadioTile(vm, size),
          ],
        ),
      ),
    );
  }

  Widget _settingsRadioTile(LibraryBrowseViewModel vm, ImageType type) {
    final selected = vm.imageType == type;
    final accent = vm.isBookLibrary ? _bookAccent : _jellyfinBlue;
    final onSurface = AppColorScheme.onSurface;
    return InkWell(
      onTap: () => vm.setImageType(type),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected, accent),
            const SizedBox(width: 12),
            Text(
              type.name[0].toUpperCase() + type.name.substring(1),
              style: TextStyle(
                fontSize: 15,
                color: selected ? onSurface : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterSizeRadioTile(LibraryBrowseViewModel vm, PosterSize size) {
    final selected = vm.posterSize == size;
    final accent = vm.isBookLibrary ? _bookAccent : _jellyfinBlue;
    final onSurface = AppColorScheme.onSurface;
    final label = switch (size) {
      PosterSize.small => AppLocalizations.of(context).small,
      PosterSize.medium => AppLocalizations.of(context).medium,
      PosterSize.large => AppLocalizations.of(context).large,
      PosterSize.extraLarge => AppLocalizations.of(context).extraLarge,
    };
    return InkWell(
      onTap: () => vm.setPosterSize(size),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            _radioCircle(selected, accent),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: selected ? onSurface : onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioCircle(bool selected, Color accent) {
    final onSurface = AppColorScheme.onSurface;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.chipBorder.copyWith(
            color: selected ? accent : onSurface.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        color: selected ? accent : Colors.transparent,
      ),
      child: selected
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: onSurface,
                ),
              ),
            )
          : null,
    );
  }
}

class _BookMediaTabs extends StatelessWidget {
  final _BookMediaTab activeTab;
  final ValueChanged<_BookMediaTab> onChanged;

  const _BookMediaTabs({required this.activeTab, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _BookFilterChip(
            label: l10n.books,
            selected: activeTab == _BookMediaTab.books,
            onTap: () => onChanged(_BookMediaTab.books),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _BookFilterChip(
            label: l10n.audiobooks,
            selected: activeTab == _BookMediaTab.audiobooks,
            onTap: () => onChanged(_BookMediaTab.audiobooks),
          ),
        ),
      ],
    );
  }
}

class _BookOrganizeChips extends StatelessWidget {
  final _BookOrganizeMode mode;
  final ValueChanged<_BookOrganizeMode> onChanged;

  const _BookOrganizeChips({required this.mode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _BookFilterChip(
          label: l10n.all,
          selected: mode == _BookOrganizeMode.all,
          onTap: () => onChanged(_BookOrganizeMode.all),
        ),
        _BookFilterChip(
          label: l10n.author,
          selected: mode == _BookOrganizeMode.author,
          onTap: () => onChanged(_BookOrganizeMode.author),
        ),
        _BookFilterChip(
          label: l10n.genres,
          selected: mode == _BookOrganizeMode.genre,
          onTap: () => onChanged(_BookOrganizeMode.genre),
        ),
      ],
    );
  }
}

class _BookStatusCategories extends StatelessWidget {
  final PlayedStatusFilter playedFilter;
  final bool favoriteFilter;
  final ValueChanged<PlayedStatusFilter> onPlayedFilterChanged;
  final ValueChanged<bool> onFavoriteFilterChanged;

  const _BookStatusCategories({
    required this.playedFilter,
    required this.favoriteFilter,
    required this.onPlayedFilterChanged,
    required this.onFavoriteFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _BookFilterChip(
          label: l10n.all,
          selected: playedFilter == PlayedStatusFilter.all && !favoriteFilter,
          onTap: () {
            onFavoriteFilterChanged(false);
            onPlayedFilterChanged(PlayedStatusFilter.all);
          },
        ),
        _BookFilterChip(
          label: l10n.unread,
          selected: playedFilter == PlayedStatusFilter.unwatched,
          onTap: () => onPlayedFilterChanged(PlayedStatusFilter.unwatched),
        ),
        _BookFilterChip(
          label: l10n.readStatus,
          selected: playedFilter == PlayedStatusFilter.watched,
          onTap: () => onPlayedFilterChanged(PlayedStatusFilter.watched),
        ),
        _BookFilterChip(
          label: l10n.favorites,
          selected: favoriteFilter,
          onTap: () => onFavoriteFilterChanged(!favoriteFilter),
        ),
      ],
    );
  }
}

class _BookFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BookFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: selected ? const Color(0x3332B9E8) : const Color(0x22131E33),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder.copyWith(
              color: selected ? _bookAccent : const Color(0x556388A8),
              width: selected ? 1.6 : 1,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? const Color(0xFFD9F2FF) : const Color(0xFFAECBE2),
          ),
        ),
      ),
    );
  }
}
