import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import '../../widgets/offline_aware_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/utils/alphabet_bucket.dart';
import '../../../data/repositories/mdblist_repository.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../data/viewmodels/library_browse_view_model.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../ui/mixins/focus_state_mixin.dart';
import '../../../util/accent_folding.dart';
import '../../../util/artwork_request_size.dart';
import '../home/home_row_prefetch.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/focus/grid_focus_node_mixin.dart';
import '../../../util/focus/grid_section_target.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../navigation/route_lifecycle_observer.dart';
import '../../widgets/alphabet_scrub_rail.dart';
import '../../widgets/bottom_nav/bottom_navbar.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/media_card.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/quick_return_wrapper.dart';
import '../../widgets/rating_display.dart';
import '../detail/item_detail_screen.dart';
import '../detail/playlist_sort_filter_bar.dart';
import 'library_header_styles.dart';
import '../../widgets/local_search_field.dart';
import '../../widgets/skeleton/skeleton_library_grid.dart';
import '../../../l10n/app_localizations.dart';
import '../../util/error_message.dart';

Color get _navyBackground => AppColorScheme.background;
Color get _jellyfinBlue => AppColorScheme.accent;
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;

const _kLoadMoreExtent = 400.0;

/// Grouped rows run tighter than the flat grid so a row of posters and its
/// category heading both fit.
const _kGroupedRowCardScale = 0.88;

/// Slack above and below a grouped row's cards so the focus ring isn't clipped.
const _kGroupedRowFocusPadding = 36.0;

/// Doubles as the stride the row uses to pin a focused card to the left edge.
const _kGroupedRowCardGap = 12.0;

/// The horizontal grid only takes another row once there is most of one to
/// spare, so a sliver of leftover height doesn't squash every card.
const _kHorizontalRowRoundUpThreshold = 1.7;

/// Stops a very tall window shrinking cards into unreadable thumbnails.
const _kMaxHorizontalRows = 8;

const _kChevronScrollStep = 480.0;

/// Row height of the songs list, which the letter jump multiplies out because
/// that list has no grid geometry to read.
const _kSongRowHeight = 56.0;

/// One line of the grid, across whichever axis it scrolls.
typedef GridGeometry = ({
  int perLine,
  double lineExtent,
  double lineSpacing,
  double leadingPad,
});

/// Leading edge of the line holding [index], in the scroll view's own
/// coordinates.
double gridLineStart(GridGeometry geometry, int index) =>
    geometry.leadingPad +
    (index ~/ geometry.perLine) *
        (geometry.lineExtent + geometry.lineSpacing);

bool _isCompact(BuildContext context) =>
    !PlatformDetection.isTV &&
    (PlatformDetection.useMobileUi ||
        MediaQuery.sizeOf(context).width < _kCompactBreakpoint);

double _desktopUiScaleFactor() {
  return GetIt.instance<UserPreferences>()
      .get(UserPreferences.desktopUiScale)
      .scaleFactor;
}

/// Shared by the Sort & Filter dialog and the labeled header controls.
String _librarySortLabel(
  LibraryBrowseViewModel vm,
  LibrarySortBy option,
  AppLocalizations l10n,
) {
  if (option == LibrarySortBy.runtime &&
      (vm.isMusicBrowse || vm.isSongsBrowse)) {
    return l10n.librarySortLength;
  }
  return librarySortLabel(option, l10n);
}

String _playedStatusLabel(
  LibraryBrowseViewModel vm,
  PlayedStatusFilter status,
  AppLocalizations l10n,
) => switch (status) {
  PlayedStatusFilter.all => l10n.all,
  PlayedStatusFilter.watched => vm.isBookLibrary
      ? l10n.readStatus
      : l10n.watched,
  PlayedStatusFilter.unwatched => vm.isBookLibrary
      ? l10n.unread
      : l10n.unwatched,
  PlayedStatusFilter.inProgress => l10n.filterInProgress,
};

String _groupByLabel(LibraryGroupBy groupBy, AppLocalizations l10n) =>
    switch (groupBy) {
      LibraryGroupBy.none => l10n.none,
      LibraryGroupBy.decade => l10n.groupByDecade,
      LibraryGroupBy.genres => l10n.genres,
      LibraryGroupBy.parentalRatings => l10n.groupByParentalRating,
      LibraryGroupBy.studio => l10n.groupByStudio,
    };

class LibraryBrowseScreen extends StatefulWidget {
  final String libraryId;
  final String? serverId;
  final String? genreId;
  final String? genreName;
  final String? studioName;
  final List<String>? includeItemTypes;
  final bool favoritesOnly;

  const LibraryBrowseScreen({
    super.key,
    required this.libraryId,
    this.serverId,
    this.genreId,
    this.genreName,
    this.studioName,
    this.includeItemTypes,
    this.favoritesOnly = false,
  });

  @override
  State<LibraryBrowseScreen> createState() => _LibraryBrowseScreenState();
}

class _LibraryBrowseScreenState extends State<LibraryBrowseScreen>
    with GridFocusNodeMixin<LibraryBrowseScreen>, RouteAware {
  late final LibraryBrowseViewModel _vm;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _homeButtonFocusNode = FocusNode(debugLabel: 'library_home_button');
  final _sortFocusNode = FocusNode(debugLabel: 'library_sort_button');
  final _dockedPanelScope = FocusScopeNode(debugLabel: 'library_docked_panel');
  Timer? _backdropDebounce;
  bool? _hasSubtitlesCache;
  final _prefs = GetIt.instance<UserPreferences>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;
  final Set<String> _localProgressItemIds = const {};

  @override
  void initState() {
    super.initState();
    final client = GetIt.instance<MediaServerClientFactory>()
        .clientForServerOrActive(widget.serverId);
    _vm = LibraryBrowseViewModel(
      libraryId: widget.libraryId,
      client: client,
      prefs: _prefs,
      mdbListRepository: GetIt.instance<MdbListRepository>(),
      genreId: widget.genreId,
      studioName: widget.studioName,
      overrideName: widget.genreName ?? widget.studioName,
      includeItemTypes: widget.includeItemTypes,
      favoritesOnly: widget.favoritesOnly,
    );
    _vm.addListener(_onChanged);
    _vm.load();
    _scrollController.addListener(_onScroll);
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _prefs.addListener(_onChanged);
    InlineBackInterceptor.push(_backToAlphabet);
  }

  ModalRoute<dynamic>? _observedRoute;

  final _allLetterFocusNode = FocusNode(debugLabel: 'alpha_all_letter');
  final _gridAreaFocusNode = FocusNode(
    debugLabel: 'library_grid_area',
    canRequestFocus: false,
    skipTraversal: true,
  );

  /// The node keeps its context after the bar goes away, for instance when a
  /// sort without letters replaces the one it opened with, so only a mounted
  /// one is on screen.
  bool get _alphabetBarShown => _allLetterFocusNode.context?.mounted ?? false;

  /// On TV, Back from the grid moves up to the alphabet bar when it's shown,
  /// and the next Back leaves the library. It has to run before the route
  /// pops, which a card's key handler can't do.
  bool _backToAlphabet() {
    if (!PlatformDetection.isTV ||
        !_alphabetBarShown ||
        !_gridAreaFocusNode.hasFocus) {
      return false;
    }
    _allLetterFocusNode.requestFocus();
    return true;
  }

  @override
  void didPopNext() {
    super.didPopNext();
    unawaited(_vm.syncUserDataIfStale());
  }

  @override
  void dispose() {
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
      _observedRoute = null;
    }
    _searchController.dispose();
    _searchFocusNode.dispose();
    _homeButtonFocusNode.dispose();
    _sortFocusNode.dispose();
    _dockedPanelScope.dispose();
    InlineBackInterceptor.remove(_backToAlphabet);
    _allLetterFocusNode.dispose();
    _gridAreaFocusNode.dispose();
    _backdropDebounce?.cancel();
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
      // A reload can land on the count the fill stopped at, which would read
      // as a page that added nothing.
      _lastFillItemCount = -1;
      gridContentVersion++;
      cleanupGridFocusNodes(length);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) restoreGridFocusIfNeeded();
      });
    }
  }

  void _onChanged() {
    _hasSubtitlesCache = null;
    if (mounted) setState(() {});
    _maybeBumpGridVersion();
  }

  // Scanning every loaded item is O(N) and the grid's LayoutBuilder re-runs on
  // every focus move, so hold the answer until the items, the preferences or
  // the locale actually change.
  bool get _hasSubtitles => _hasSubtitlesCache ??= _vm.items.any(
        (item) => (_cardSubtitle(item)?.isNotEmpty ?? false),
      );

  bool get _showCardTitles => _prefs.get(UserPreferences.libraryCardTitles);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _hasSubtitlesCache = null;
    final route = ModalRoute.of(context);
    if (route == null || route == _observedRoute) return;
    if (_observedRoute != null) {
      routeLifecycleObserver.unsubscribe(this);
    }
    _observedRoute = route;
    routeLifecycleObserver.subscribe(this, route);
  }

  /// Whether the scroll view has settled metrics and is within
  /// [_kLoadMoreExtent] of its end.
  bool get _nearGridEnd {
    if (!_scrollController.hasClients) return false;
    // Two grids briefly share the controller while one is swapped out.
    if (_scrollController.positions.length != 1) return false;
    final pos = _scrollController.position;
    // extentAfter reads both of these, and throws before they are set.
    if (!pos.hasPixels || !pos.hasContentDimensions) return false;
    return pos.extentAfter < _kLoadMoreExtent;
  }

  void _onScroll() {
    if (_nearGridEnd) _vm.loadMore();
  }

  bool _fillCheckScheduled = false;
  int _lastFillItemCount = -1;

  /// A wide window lays out more columns, so a whole page of cards can fit
  /// without overflowing the viewport. Nothing scrolls then, [_onScroll] never
  /// fires, and paging stalls until the window is made smaller again. Top the
  /// grid up after layout instead, until it overflows or the library runs out.
  void _scheduleViewportFillCheck() {
    // Every path that can page again notifies and rebuilds, which re-runs the
    // builder, so skipping here never latches the fill off for good.
    if (_fillCheckScheduled || _vm.loadingMore || !_vm.hasMore) return;
    _fillCheckScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fillCheckScheduled = false;
      _maybeFillViewport();
    });
  }

  void _maybeFillViewport() {
    if (!mounted || !_nearGridEnd) return;
    // Top up once per delivered page. A page still in flight, or one that
    // rendered nothing new, leaves the count where it was and ends the fill.
    final count = _vm.items.length;
    if (count == _lastFillItemCount) return;
    _lastFillItemCount = count;
    _vm.loadMore();
  }

  /// Geometry from the last grid layout, so a letter jump and a focus scroll
  /// both land on the line the grid really drew instead of one worked out from
  /// a second copy of the sums.
  GridGeometry? _gridGeometry;

  void _scrollToGridRow(int index) {
    if (!mounted || !_scrollController.hasClients) return;
    final geometry = _gridGeometry;
    if (geometry == null) return;

    final rowTop = gridLineStart(geometry, index);
    final rowBottom = rowTop + geometry.lineExtent;
    final position = _scrollController.position;
    final viewportH = position.viewportDimension;
    final current = position.pixels;
    final topPad = geometry.leadingPad;
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

  bool _isJumpingToLetter = false;
  int _letterJumpGeneration = 0;

  /// Scrolls the first item whose sort name starts with [letter] to the
  /// leading edge, loading pages first if it hasn't arrived yet. The phone rail
  /// passes [scrubbing] so a jump per letter doesn't flash the spinner.
  Future<void> _jumpToLetter(String letter, {bool scrubbing = false}) async {
    // Scrubbing along the alphabet bar starts a jump per letter, and an older
    // one would keep re-asserting its own offset against the newest, so each
    // jump checks in after every await and bows out once superseded.
    final generation = ++_letterJumpGeneration;
    bool stillCurrent() => mounted && generation == _letterJumpGeneration;

    _vm.setLetterFilter(letter);
    if (!mounted) return;
    setState(() => _isJumpingToLetter = !scrubbing);

    try {
      await _vm.ensureItemsLoadedForPrefix(letter).timeout(
        const Duration(seconds: 15),
        onTimeout: () => false,
      );
      if (!stillCurrent()) return;
      // The walk notifies once when it finishes, so wait for the frame that
      // lays those items out before measuring anything against them.
      await WidgetsBinding.instance.endOfFrame;
      if (!stillCurrent() || !_scrollController.hasClients) return;

      final targetIndex = _indexOfLetter(letter);
      if (targetIndex < 0) return;

      double targetOffset = 0.0;
      if (_isSongsBrowse) {
        targetOffset = targetIndex * _kSongRowHeight;
      } else {
        final geometry = _gridGeometry;
        if (geometry == null) return;
        targetOffset = gridLineStart(geometry, targetIndex);
      }

      // Slivers report maxScrollExtent lazily as children are laid out, so a
      // jump deeper than the built children clamps short. Re-jump across
      // frame boundaries until the layout reaches the target or the true
      // scroll bottom.
      for (int i = 0; i < 5; i++) {
        final currentMax = _scrollController.position.maxScrollExtent;
        final destination = targetOffset.clamp(0.0, currentMax);
        _scrollController.jumpTo(destination);

        await WidgetsBinding.instance.endOfFrame;
        if (!stillCurrent()) return;
        if (!_scrollController.hasClients) break;

        final currentPixels = _scrollController.position.pixels;
        final newMax = _scrollController.position.maxScrollExtent;
        if ((currentPixels - targetOffset).abs() < 2.0 ||
            (destination >= currentMax && currentMax == newMax)) {
          break;
        }
      }

      if (PlatformDetection.isTV) {
        // Delay the focus shift slightly so the D-Pad OK release registers on
        // the letter button rather than firing onTap on the freshly focused
        // tile.
        await Future.delayed(const Duration(milliseconds: 150));
        if (!stillCurrent()) return;
        getGridItemFocusNode(targetIndex).requestFocus();
      }
    } finally {
      // A superseded jump leaves the flag for the jump that replaced it.
      if (stillCurrent()) setState(() => _isJumpingToLetter = false);
    }
  }

  int _indexOfLetter(String letter) {
    final items = _vm.items;
    if (items.isEmpty) return -1;
    if (letter.isEmpty || letter == 'ALL') return 0;
    return items.indexWhere((item) => matchesAlphabetBucket(item, letter));
  }

  /// The field sits at the top of the screen, so sideways and upward presses
  /// have nowhere to go and would otherwise throw focus out of the header.
  /// Modern puts it in the bar between Home and Sort, and Docked in the panel
  /// where Up, Down and Right move on through the panel and out to the grid.
  KeyEventResult _onTvSearchKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
    final key = event.logicalKey;
    switch (_prefs.get(UserPreferences.libraryStyle)) {
      case LibraryStyle.modern:
        if (key.isLeftKey) {
          _homeButtonFocusNode.requestFocus();
          return KeyEventResult.handled;
        }
        if (key.isRightKey) {
          _sortFocusNode.requestFocus();
          return KeyEventResult.handled;
        }
        return key.isUpKey ? KeyEventResult.handled : KeyEventResult.ignored;
      case LibraryStyle.docked:
        return key.isLeftKey ? KeyEventResult.handled : KeyEventResult.ignored;
      case LibraryStyle.classic:
        break;
    }
    if (event.logicalKey.isUpKey ||
        event.logicalKey.isLeftKey ||
        event.logicalKey.isRightKey) {
      return KeyEventResult.handled;
    }
    if (event.logicalKey.isDownKey) {
      _homeButtonFocusNode.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _onItemFocused(AggregatedItem item) {
    _vm.setFocusedItem(item);
    // Debounced because holding the D-pad walks the grid a cell at a time and
    // each backdrop is a fullscreen fetch, decode and blur. Only the item the
    // user settles on is worth loading one for.
    _backdropDebounce?.cancel();
    _backdropDebounce = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      _backgroundService.setBackground(item, context: BlurContext.browsing);
    });
  }

  void _onItemTap(AggregatedItem item) {
    if (_vm.isNavigableFolder(item)) {
      context.push(Destinations.folder(item.id, serverId: item.serverId));
      return;
    }

    context
        .push(
          Destinations.itemOrPhoto(
            item.id,
            serverId: item.serverId,
            type: item.type,
            channelId: item.channelId,
          ),
        )
        .then((result) {
          if (result == true && mounted) {
            _vm.load();
          }
        });
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
      ImageType.banner => kBannerCardHeight * kBannerAspectRatio,
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * desktopScale;
  }

  double _selectedImageAspectRatio() {
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => kBannerAspectRatio,
      ImageType.poster => 2 / 3,
    };
  }

  double _gridBaseAspectRatio() {
    if (_vm.isMusicBrowse || _vm.isPlaylistBrowse) return 1.0;
    if (_vm.isFilterBrowse) return _selectedImageAspectRatio();
    if (_vm.imageType != ImageType.poster &&
        _vm.items.isNotEmpty &&
        _vm.items.every(_vm.isNavigableFolder)) {
      return _vm.imageType == ImageType.banner ? kBannerAspectRatio : 16 / 9;
    }
    return switch (_vm.imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => kBannerAspectRatio,
      ImageType.poster => 2 / 3,
    };
  }

  double _itemAspectRatio(AggregatedItem item) {
    if (_vm.isMusicBrowse || _vm.isPlaylistBrowse) return 1.0;
    if (_vm.isFilterBrowse) return _selectedImageAspectRatio();
    if (_vm.isNavigableFolder(item) && _vm.imageType != ImageType.poster) {
      return _vm.imageType == ImageType.banner ? kBannerAspectRatio : 16 / 9;
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
      ImageType.banner => kBannerAspectRatio,
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

  /// See [gridCacheExtentFor].
  ScrollCacheExtent? _gridScrollCacheExtent({
    required double cellExtent,
    required double spacing,
  }) {
    final pixels = gridCacheExtentFor(
      tier: _prefs.resolveDevicePerformanceTier(),
      cellExtent: cellExtent,
      spacing: spacing,
    );
    return pixels == null ? null : ScrollCacheExtent.pixels(pixels);
  }

  /// Width to ask the server for, covering [cellWidth] at this display's
  /// density. See [artworkRequestWidth].
  int _requestWidthFor(double cellWidth, ArtworkShape shape) =>
      artworkRequestWidth(
        cellWidth,
        MediaQuery.devicePixelRatioOf(context),
        shape,
      );

  String? _imageUrl(AggregatedItem item, {double? cellWidth}) {
    final api = _vm.imageApi;
    final width = cellWidth ?? _cardWidth();
    final posterMaxW = _requestWidthFor(width, ArtworkShape.poster);
    final landscapeMaxW = _requestWidthFor(width, ArtworkShape.landscape);

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
      if (_vm.imageType == ImageType.banner) {
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
        if (itemThumbTag != null) {
          return api.getThumbImageUrl(
            item.id,
            maxWidth: landscapeMaxW,
            tag: itemThumbTag,
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
          ? api.getPrimaryImageUrl(
              item.id,
              maxWidth: posterMaxW,
              tag: item.primaryImageTag,
            )
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
      if (item.backdropImageTags.isNotEmpty) {
        return api.getBackdropImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: item.backdropImageTags.first,
        );
      }
      // A landscape thumb beats the portrait primary here, since cropping a
      // poster down to banner shape loses far more of the image.
      if (itemThumbTag != null) {
        return api.getThumbImageUrl(
          item.id,
          maxWidth: landscapeMaxW,
          tag: itemThumbTag,
        );
      }
      if (parentThumbItemId != null && parentThumbTag != null) {
        return api.getThumbImageUrl(
          parentThumbItemId,
          maxWidth: landscapeMaxW,
          tag: parentThumbTag,
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

    if (prefersThumbArtwork && !_vm.isFilterBrowse) {
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
  Widget build(BuildContext context) {
    Widget screen = QuickReturnWrapper(
      scrollController: _scrollController,
      scrollDirection:
          _vm.scrollDirection == LibraryScrollDirection.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      // cleanupGridFocusNodes disposes node 0 once the list empties, and
      // the wrapper would keep holding it, so pass nothing instead.
      topFocusNode: _vm.items.isNotEmpty ? getGridItemFocusNode(0) : null,
      child: _buildContent(context),
    );
    // The wrapper floats its button above whatever this scope says covers
    // the bottom of the screen.
    if (_usesDockedBar) {
      screen = BottomNavInsetScope(
        height: _dockedBarInset(context),
        child: screen,
      );
    }
    return RequestInitialFocus(
      targetNode: _homeButtonFocusNode,
      child: screen,
    );
  }

  LibraryStyle get _libraryStyle => _prefs.get(UserPreferences.libraryStyle);

  bool get _usesDockedPanel =>
      _libraryStyle == LibraryStyle.docked && !_isCompact(context);

  bool get _usesDockedBar =>
      _libraryStyle == LibraryStyle.docked && _isCompact(context);

  /// Songs render as one flat track list where a letter jump has nowhere
  /// sensible to land, and only the name sorts line up with the letters.
  bool get _alphabetApplies =>
      !_isSongsBrowse &&
      (_vm.isMusicBrowse ||
          _vm.sortBy == LibrarySortBy.name ||
          _vm.sortBy == LibrarySortBy.foldersFirst ||
          _vm.sortBy == LibrarySortBy.albumArtist ||
          _vm.sortBy == LibrarySortBy.album);

  bool get _showsScrubRail =>
      _alphabetApplies &&
      _prefs.get(UserPreferences.showAlphabeticalFilters) &&
      _isCompact(context);

  /// What the floating Docked bar covers, counting its margin and the system
  /// inset under it.
  double _dockedBarInset(BuildContext context) =>
      kDockedBarHeight +
      kDockedBarMargin +
      MediaQuery.paddingOf(context).bottom;

  /// [base] everywhere but under the Docked bar, where the last row has to
  /// scroll clear of it.
  double _gridBottomPadding(double base) => _usesDockedBar
      ? math.max(base, _dockedBarInset(context) + 16)
      : base;

  String _libraryTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_vm.favoritesOnly) return l10n.favorites;
    final types = _vm.includeItemTypes;
    if (types != null && types.isNotEmpty) {
      switch (types.first) {
        case 'MusicAlbum':
          return l10n.albums;
        case 'AlbumArtist':
          return l10n.albumArtists;
        case 'MusicArtist':
          return l10n.artists;
        case 'Audio':
          return l10n.songs;
      }
    }
    return _vm.libraryName;
  }

  void _onBack() =>
      PlatformDetection.isWeb ? context.popOrHome() : context.pop();

  LibraryHeaderModel _headerModel(BuildContext context, bool isMobile) {
    final l10n = AppLocalizations.of(context);
    final showMediaDetails = _prefs.get(
      UserPreferences.showMediaDetailsOnLibraryPage,
    );
    return LibraryHeaderModel(
      title: _libraryTitle(context),
      itemCount: _vm.totalCount,
      homeFocusNode: _homeButtonFocusNode,
      sortFocusNode: _sortFocusNode,
      searchFocusNode: _searchFocusNode,
      allLetterFocusNode: _allLetterFocusNode,
      searchController: _searchController,
      onSearchChanged: _vm.setSearchQuery,
      onTvSearchKey: _onTvSearchKey,
      onHome: PlatformDetection.isTV
          ? () => context.go(Destinations.home)
          : _onBack,
      sortLabel: _librarySortLabel(_vm, _vm.sortBy, l10n),
      sortAscending: _vm.sortDirection == SortDirection.ascending,
      onSort: () => _showFilterSortDialog(context),
      groupLabel: _groupByLabel(_vm.groupBy, l10n),
      onGroupBy: _vm.canGroup ? _showGroupByDialog : null,
      showLabel: _playedStatusLabel(_vm, _vm.playedFilter, l10n),
      onShow: _vm.isMusicBrowse
          ? null
          : () => _showFilterSortDialog(context, initialSection: 'played'),
      displayLabel: _vm.isPlaylistBrowse
          ? null
          : switch (_vm.imageType) {
              ImageType.poster => l10n.posterLabel,
              ImageType.thumb => l10n.thumbnailLabel,
              ImageType.banner => l10n.bannerLabel,
            },
      onDisplay: _vm.isMusicBrowse ? null : () => _showSettingsDialog(context),
      onShuffle: _isSongsBrowse ? _shuffleSongsLibrary : null,
      alphabetApplies: _alphabetApplies,
      alphabetOn: _prefs.get(UserPreferences.showAlphabeticalFilters),
      onToggleAlphabet: () => _prefs.set(
        UserPreferences.showAlphabeticalFilters,
        !_prefs.get(UserPreferences.showAlphabeticalFilters),
      ),
      onLetter: _jumpToLetter,
      hud: showMediaDetails && !isMobile
          ? _FocusedItemHud(
              item: _vm.focusedItem,
              ratings: _vm.focusedRatings,
              enableAdditionalRatings: _prefs.get(
                UserPreferences.enableAdditionalRatings,
              ),
              enabledRatings: _prefs.get(UserPreferences.enabledRatings),
              showLabels: _prefs.get(UserPreferences.showRatingLabels),
              showBadges: _prefs.get(UserPreferences.showRatingBadges),
            )
          : null,
    );
  }

  /// Left from the grid's first column and Up from its top row land on the
  /// panel control used last, or Home before any was.
  void _focusDockedPanel() {
    if (_dockedPanelScope.focusedChild != null) {
      _dockedPanelScope.requestFocus();
    } else {
      _homeButtonFocusNode.requestFocus();
    }
  }

  /// Right out of the panel goes back to the card focused last, or the first.
  void _focusDockedGrid() {
    final last = lastFocusedGridIndex;
    final remembered = last == null ? null : gridItemFocusNodes[last];
    final target = remembered?.context != null
        ? remembered!
        : _vm.items.isNotEmpty
        ? getGridItemFocusNode(0)
        : null;
    if (target?.context != null) target!.requestFocus();
  }

  Widget _buildGridArea(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final showRail = _showsScrubRail;
    // A vertical phone grid keeps 16 of its own padding at the edge, so it
    // only needs what the rail takes past that. Sideways rows scroll under
    // that edge instead, so they stop short of the whole rail.
    final scrollsSideways =
        _vm.scrollDirection == LibraryScrollDirection.horizontal &&
        !_isSongsBrowse;
    final railGap = showRail
        ? padding.right + kAlphabetScrubRailWidth + (scrollsSideways ? 4 : -12)
        : 0.0;
    // The rail stops above the quick return button, which is 48 tall and
    // floats 24 up, or 12 above the Docked bar.
    final buttonBottom = _usesDockedBar
        ? _dockedBarInset(context) + 12
        : 24 + padding.bottom;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          right: railGap,
          child: Focus(
            focusNode: _gridAreaFocusNode,
            child: _buildBody(),
          ),
        ),
        if (showRail)
          Positioned(
            top: 0,
            right: padding.right,
            bottom: buttonBottom + 48 + 8,
            width: kAlphabetScrubRailWidth,
            child: AlphabetScrubRail(
              onLetter: (letter) => _jumpToLetter(letter, scrubbing: true),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final hasBackdrop = !isMobile && !hideBackdrops && _backdropUrl != null;
    final blurAmount = _prefs
      .get(UserPreferences.browsingBackgroundBlurAmount)
      .toDouble();
    final style = _libraryStyle;
    final model = style == LibraryStyle.classic
        ? null
        : _headerModel(context, isMobile);
    final Widget content;
    if (model == null) {
      content = Column(
        children: [
          _LibraryHeader(
            libraryName: _libraryTitle(context),
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
            alphabetApplies: _alphabetApplies,
            letterFilter: _vm.letterFilter,
            allLetterFocusNode: _allLetterFocusNode,
            homeFocusNode: _homeButtonFocusNode,
            onTvSearchKey: _onTvSearchKey,
            isMusicBrowse: _vm.isMusicBrowse,
            searchController: _searchController,
            searchFocusNode: _searchFocusNode,
            onSearchChanged: (query) => _vm.setSearchQuery(query),
            onBack: _onBack,
            onSort: () => _showFilterSortDialog(context),
            onGroupBy: () => _showGroupByDialog(),
            canGroup: _vm.canGroup,
            onSettings: () => _showSettingsDialog(context),
            onShuffle: _isSongsBrowse ? () => _shuffleSongsLibrary() : null,
            onLetterChanged: (l) => _jumpToLetter(l),
          ),
          Expanded(child: _buildGridArea(context)),
        ],
      );
    } else if (style == LibraryStyle.docked && !isMobile) {
      final scale = _desktopUiScaleFactor();
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DockedLibraryPanel(
            model: model,
            scopeNode: _dockedPanelScope,
            onExitRight: _focusDockedGrid,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 12 * scale),
                if (model.hud != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _horizontalPadding * scale,
                    ),
                    // The panel leaves less width than the HUD's ratings need
                    // on one line, and its height is fixed, so it shrinks
                    // rather than wrapping out of its box.
                    child: SizedBox(
                      height: _FocusedItemHud.heightFor(
                        _prefs.get(UserPreferences.showRatingLabels),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.topLeft,
                          child: model.hud,
                        ),
                      ),
                    ),
                  ),
                Expanded(child: _buildGridArea(context)),
              ],
            ),
          ),
        ],
      );
    } else {
      content = Column(
        children: [
          if (style == LibraryStyle.modern)
            ModernLibraryHeader(model: model, compact: isMobile)
          else
            CompactLibraryHeader(model: model, showControls: false),
          Expanded(child: _buildGridArea(context)),
        ],
      );
    }
    final padding = MediaQuery.paddingOf(context);
    // The keyboard pushes the body up, and a bar riding on top of it would
    // cover the results being typed for.
    final showDockedBar =
        model != null &&
        _usesDockedBar &&
        MediaQuery.viewInsetsOf(context).bottom == 0;
    return Scaffold(
      backgroundColor: _navyBackground,
      body: Stack(
        children: [
          if (hasBackdrop)
            Positioned.fill(
              child: FullscreenBackdropSwitcher(
                imageUrl: _backdropUrl!,
                duration: BackgroundService.transitionDuration,
                imageBuilder: (imageUrl) => _blurredImage(imageUrl, blurAmount),
              ),
            ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: _navyBackground.withAlpha(hasBackdrop ? 115 : 191),
              ),
            ),
          ),
          if (_isJumpingToLetter)
            Positioned.fill(
              child: Container(
                color: Colors.black45,
                child: Center(
                  child: CircularProgressIndicator(color: _jellyfinBlue),
                ),
              ),
            ),
          content,
          if (showDockedBar)
            Positioned(
              left: kDockedBarMargin + padding.left,
              right: kDockedBarMargin + padding.right,
              bottom: kDockedBarMargin + padding.bottom,
              child: DockedLibraryBar(model: model),
            ),
        ],
      ),
    );
  }

  Widget _blurredImage(String imageUrl, double blur) {
    final blurred = blur > 0;
    final image = OfflineAwareImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      fadeInDuration: Duration.zero,
      memCacheWidth: blurred
          ? BackgroundService.backdropBlurredDecodeWidth
          : BackgroundService.backdropMaxWidth,
      priority: ImageFetchPriority.high,
      errorWidget: (_, _, _) => const SizedBox.shrink(),
    );
    if (!blurred) return image;
    final sigma = GlassSettings.decorativeSigma(blur);
    return RepaintBoundary(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: TileMode.decal,
        ),
        child: image,
      ),
    );
  }

  bool get _isSongsBrowse => _vm.isSongsBrowse;

  Future<void> _playSongFromIndex(int index) async {
    final manager = GetIt.instance<PlaybackManager>();
    await manager.playItems(_vm.items, startIndex: index);
    if (!mounted) return;
    context.push(Destinations.audioPlayer);
  }

  /// What a player shows for a queued track. These go straight into the queue
  /// rather than onto a grid, so they carry none of the poster and series
  /// artwork a browse card needs.
  static const _audioShuffleFields =
      'Type,UserData,RunTimeTicks,ImageTags,Album,AlbumId,'
      'AlbumPrimaryImageTag,AlbumArtist,Artists';

  Future<void> _shuffleSongsLibrary() async {
    final client = GetIt.instance<MediaServerClientFactory>()
        .clientForServerOrActive(widget.serverId);
    try {
      final response = await client.itemsApi.getItems(
        parentId: widget.libraryId,
        includeItemTypes: const ['Audio'],
        recursive: true,
        sortBy: 'Random',
        limit: 300,
        fields: _audioShuffleFields,
      );
      final rawItems = (response['Items'] as List?) ?? [];
      final mapped = rawItems
          .whereType<Map>()
          .map((raw) => AggregatedItem(
                id: raw['Id']?.toString() ?? '',
                serverId: client.baseUrl,
                rawData: raw.cast<String, dynamic>(),
              ))
          .toList();
      if (mapped.isEmpty) return;
      final manager = GetIt.instance<PlaybackManager>();
      await manager.playItems(mapped);
      if (!mounted) return;
      context.push(Destinations.audioPlayer);
    } catch (_) {}
  }

  void _showGroupByDialog() {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _GroupByDialog(vm: _vm),
    ).whenComplete(_restoreGridFocusAfterDialog);
  }

  /// The chevrons drive [_scrollController], which only runs horizontally for
  /// the plain horizontal grid. Grouped rows and the songs list keep the
  /// controller on a vertical list, so pointing left and right at it there
  /// would scroll the page up and down instead.
  bool get _horizontalGridIsScrollable =>
      _vm.scrollDirection == LibraryScrollDirection.horizontal &&
      !_isSongsBrowse &&
      !_vm.isGrouping &&
      !(_vm.isPlaylistBrowse && _vm.groupByType);

  static String _playlistSectionTitle(AppLocalizations l10n, String key) =>
      switch (key) {
        'Video' => l10n.videoPlaylistsSection,
        'MusicVideo' => l10n.musicVideoPlaylistsSection,
        'Audio' => l10n.audioPlaylistsSection,
        'AudioBook' => l10n.audiobookPlaylistsSection,
        'Book' => l10n.bookPlaylistsSection,
        'Photo' => l10n.photoPlaylistsSection,
        _ => l10n.mixedPlaylistsSection,
      };

  void _nudgeHorizontalGrid(double delta) {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    _scrollController.animateTo(
      (_scrollController.offset + delta).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildBody() {
    final showHorizChevrons =
        _horizontalGridIsScrollable &&
        _vm.state == LibraryBrowseState.ready &&
        PlatformDetection.useDesktopUi &&
        !PlatformDetection.isTV;
    return Column(
      children: [
        if (showHorizChevrons)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  descendantsAreFocusable: false,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => _nudgeHorizontalGrid(-_kChevronScrollStep),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Focus(
                  canRequestFocus: false,
                  skipTraversal: true,
                  descendantsAreFocusable: false,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => _nudgeHorizontalGrid(_kChevronScrollStep),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: switch (_vm.state) {
            LibraryBrowseState.loading => SkeletonLibraryGrid(
                cardWidth: _cardWidth(),
                aspectRatio: _gridBaseAspectRatio(),
                isSongs: _isSongsBrowse,
                isHorizontal: _vm.scrollDirection == LibraryScrollDirection.horizontal,
              ),
            LibraryBrowseState.error => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _vm.isNetworkError
                          ? AppLocalizations.of(context).unableToConnectToServer
                          : describeError(_vm.error!, AppLocalizations.of(context)),
                      style: TextStyle(
                        color: _vm.isBookLibrary ? const Color(0xFFF4E6D5) : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(onPressed: _vm.load, child: Text(AppLocalizations.of(context).retry)),
                  ],
                ),
              ),
            LibraryBrowseState.ready =>
              _isSongsBrowse ? _buildSongsList() : _buildGrid(),
          },
        ),
      ],
    );
  }

  Widget _buildSongsList() {
    if (_vm.items.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noItemsFound,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }
    final isMobile = _isCompact(context);
    final hPad = isMobile ? 16.0 : _horizontalPadding;
    final items = _vm.items;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(hPad, 8, hPad, _gridBottomPadding(32)),
          sliver: SliverFixedExtentList.builder(
            itemExtent: _kSongRowHeight,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final track = items[index];
              return TrackTile(
                key: ValueKey('song-track-${track.id}'),
                track: track,
                focusNode: getGridItemFocusNode(index),
                onFocused: () => _onItemFocused(track),
                onArrowUp: index == 0 ? _focusAboveGrid : null,
                index: index + 1,
                totalCount: items.length,
                currentIndex: index,
                reorderable: false,
                reorderIndex: index,
                onTap: () => _playSongFromIndex(index),
                showAlbum: true,
              );
            },
          ),
        ),
      ],
    );
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

    if (_vm.scrollDirection == LibraryScrollDirection.horizontal) {
      return _buildHorizontalGrid();
    }
    return _buildVerticalGrid();
  }

  Widget _buildVerticalGrid() {
    final cardWidth = _cardWidth();
    final cardFocusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        _scheduleViewportFillCheck();
        final l10n = AppLocalizations.of(context);
        final isMobile = _isCompact(context);
        final gridPadding = isMobile ? 16.0 : _horizontalPadding;
        final spacing = cardFocusExpansion && !isMobile
            ? MediaCard.focusGap(cardWidth)
            : 12.0;
        final minClamp = _vm.imageType == ImageType.banner
            ? (constraints.maxWidth < 600 ? 1 : 2)
            : 2;
        final crossAxisCount =
            ((constraints.maxWidth - gridPadding * 2 + spacing) /
                    (cardWidth + spacing))
                .floor()
                .clamp(minClamp, 20);

        final cellWidth =
            (constraints.maxWidth -
                gridPadding * 2 -
                (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        final ar = _gridBaseAspectRatio();
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = _showCardTitles
            ? (_hasSubtitles ? 50.0 : 26.0) * desktopTextScale
            : 0.0;
        final imageHeight = cellWidth / ar;
        final cellHeight = imageHeight + textHeight;
        final childAspectRatio = cellWidth / cellHeight;
        // Artwork scales upward from the bottomCenter anchor, so reserve the full
        // upward growth in top padding and row spacing so focused cards clear
        // the filter header and previous row metadata lines.
        final upwardGrowth = cardFocusExpansion && !isMobile
            ? (imageHeight * (MediaCard.focusScale - 1))
            : 0.0;
        final baseRowSpacing = 16.0;
        final rowSpacing = baseRowSpacing + upwardGrowth;
        final baseTopPadding = 18.0;
        final topPadding = baseTopPadding + upwardGrowth;
        _gridGeometry = (
          perLine: crossAxisCount,
          lineExtent: cellHeight,
          lineSpacing: rowSpacing,
          leadingPad: topPadding,
        );

        final focusColor = _vm.isFilterBrowse
            ? ThemeRegistry.active.borders.focusBorder.color
            : Color(
                _prefs.get(UserPreferences.focusColor).colorValue,
              );
        final isNeon =
            ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

        // Grouping and the type checkboxes both move cards around, so focus
        // nodes key on a card's place in the full list to stay with it.
        final gridItems = _vm.visiblePlaylists;
        final indexInItems = _vm.isPlaylistBrowse
            ? <String, int>{
                for (var i = 0; i < _vm.items.length; i++) _vm.items[i].id: i,
              }
            : const <String, int>{};

        if (_vm.isPlaylistBrowse && _vm.groupByType) {
          final groupedMap = _vm.groupedPlaylists;
          final groupEntries = groupedMap.entries.toList();
          final sectionLengths = [
            for (final entry in groupEntries) entry.value.length,
          ];
          final slivers = <Widget>[];

          for (var s = 0; s < groupEntries.length; s++) {
            final categoryKey = groupEntries[s].key;
            final categoryItems = groupEntries[s].value;

            final categoryTitle = _playlistSectionTitle(l10n, categoryKey);

            slivers.add(
              SliverPadding(
                padding: EdgeInsets.fromLTRB(gridPadding, 16, gridPadding, 8),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    categoryTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            );

            slivers.add(
              SliverPadding(
                padding: EdgeInsets.fromLTRB(gridPadding, topPadding, gridPadding, 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: rowSpacing,
                    crossAxisSpacing: spacing,
                    childAspectRatio: childAspectRatio,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = categoryItems[index];
                      final itemAspectRatio = _itemAspectRatio(item);

                      GridSectionCell? cell({required bool down}) =>
                          gridSectionTarget(
                            sectionLengths: sectionLengths,
                            crossAxisCount: crossAxisCount,
                            section: s,
                            index: index,
                            down: down,
                          );
                      VoidCallback? focusCell(GridSectionCell? target) {
                        if (target == null) return null;
                        final cards = groupEntries[target.section].value;
                        final node = indexInItems[cards[target.index].id];
                        if (node == null) return null;
                        return () => getGridItemFocusNode(node).requestFocus();
                      }

                      final upCell = cell(down: false);
                      final onTvUp = upCell == null
                          ? _focusAboveGrid
                          : focusCell(upCell);
                      // Nothing below leaves the bottom edge to the pagination
                      // the card falls through to.
                      final onTvDown = focusCell(cell(down: true));

                      return _buildGridCard(
                        item: item,
                        index: indexInItems[item.id] ?? index,
                        positionInSection: index,
                        sectionCount: categoryItems.length,
                        crossAxisCount: crossAxisCount,
                        cellWidth: cellWidth,
                        itemAspectRatio: itemAspectRatio,
                        focusColor: focusColor,
                        isNeon: isNeon,
                        watchedBehavior: watchedBehavior,
                        isMobile: isMobile,
                        onTvUp: onTvUp,
                        onTvDown: onTvDown,
                      );
                    },
                    childCount: categoryItems.length,
                  ),
                ),
              ),
            );
          }

          if (_vm.loadingMore) {
            slivers.add(
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(color: _jellyfinBlue),
                  ),
                ),
              ),
            );
          }
          if (_usesDockedBar) {
            slivers.add(
              SliverToBoxAdapter(child: SizedBox(height: _gridBottomPadding(0))),
            );
          }

          return CustomScrollView(
            controller: _scrollController,
            scrollCacheExtent: _gridScrollCacheExtent(
              cellExtent: cellHeight,
              spacing: rowSpacing,
            ),
            slivers: slivers,
          );
        }

        final itemsToDisplay =
            _vm.isGrouping ? _vm.currentCategoryItems : gridItems;

        final verticalScrollView = CustomScrollView(
          controller: _scrollController,
          scrollCacheExtent: _gridScrollCacheExtent(
            cellExtent: cellHeight,
            spacing: rowSpacing,
          ),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                gridPadding,
                topPadding,
                gridPadding,
                _gridBottomPadding(math.max(16.0, upwardGrowth)),
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: rowSpacing,
                  crossAxisSpacing: spacing,
                  childAspectRatio: childAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = itemsToDisplay[index];
                  final itemAspectRatio = _itemAspectRatio(item);
                  return _buildGridCard(
                    item: item,
                    index: indexInItems[item.id] ?? index,
                    positionInSection: index,
                    sectionCount: itemsToDisplay.length,
                    crossAxisCount: crossAxisCount,
                    cellWidth: cellWidth,
                    itemAspectRatio: itemAspectRatio,
                    focusColor: focusColor,
                    isNeon: isNeon,
                    watchedBehavior: watchedBehavior,
                    isMobile: isMobile,
                  );
                }, childCount: itemsToDisplay.length),
              ),
            ),
            if (_vm.loadingMore)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(color: _jellyfinBlue),
                  ),
                ),
              ),
          ],
        );

        if (_vm.isGrouping) {
          return Column(
            children: [
              _CategoryTabBar(
                groupedCategories: _vm.groupedCategories,
                selectedTab: _vm.selectedCategoryTab,
                onSelectTab: (cat) => _vm.setSelectedCategoryTab(cat),
              ),
              Expanded(child: verticalScrollView),
            ],
          );
        }

        return verticalScrollView;
      },
    );
  }

  /// The alphabet bar sits directly above the grid, so it takes focus from the
  /// top row, and the header button covers a page that shows no bar. Nothing
  /// sits above the grid in Docked, so the panel takes it there.
  void _focusAboveGrid() {
    if (_usesDockedPanel) {
      _focusDockedPanel();
    } else if (_alphabetBarShown) {
      _allLetterFocusNode.requestFocus();
    } else {
      _homeButtonFocusNode.requestFocus();
    }
  }

  /// [index] keys the focus node and is the card's place in the full item list,
  /// so it stays put as more pages arrive. [positionInSection] and
  /// [sectionCount] describe the grid it's drawn in, which is one category once
  /// the playlists page groups by type or a library groups by category.
  ///
  /// [paginateOnEdge] is false for sections that already hold every item they
  /// will ever hold, so the edge keys stay free to move focus instead of being
  /// swallowed by a fetch that has nothing left to fetch.
  Widget _buildGridCard({
    required AggregatedItem item,
    required int index,
    required int positionInSection,
    required int sectionCount,
    required int crossAxisCount,
    required double cellWidth,
    required double itemAspectRatio,
    required Color focusColor,
    required bool isNeon,
    required WatchedIndicatorBehavior watchedBehavior,
    required bool isMobile,
    VoidCallback? onCardFocused,
    bool paginateOnEdge = true,
    VoidCallback? onTvUp,
    VoidCallback? onTvDown,
  }) {
    // Section headers throw off the uniform row maths in _scrollToGridRow, so a
    // grouped card asks the viewport to reveal it and needs its own context.
    // Every other grid keeps the row scrolling and skips the extra element.
    final isGrouped =
        (_vm.isPlaylistBrowse && _vm.groupByType) || _vm.isGrouping;

    Widget card(BuildContext? revealContext) {
      return MediaCard(
        animeMarkerItemId: item.id,
        recordingItemId: item.id,
        title: item.name,
        subtitle: _cardSubtitle(item),
        showLabel: _showCardTitles,
        imageUrl: _imageUrl(item, cellWidth: cellWidth),
        width: double.infinity,
        aspectRatio: itemAspectRatio,
        isBanner: _vm.imageType == ImageType.banner,
        focusColor: focusColor,
        focusNode: getGridItemFocusNode(index),
        cardFocusExpansion: _prefs.get(UserPreferences.cardFocusExpansion),
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
                if (onCardFocused != null) {
                  onCardFocused();
                } else if (revealContext == null) {
                  _scrollToGridRow(positionInSection);
                } else if (revealContext.mounted) {
                  unawaited(
                    Scrollable.ensureVisible(
                      revealContext,
                      alignment: 0.15,
                      duration: const Duration(milliseconds: 160),
                      curve: Curves.easeOutCubic,
                    ),
                  );
                }
              },
        onHoverStart: isMobile ? null : () => _onItemFocused(item),
        onHoverEnd: isMobile ? null : () => _vm.setFocusedItem(null),
        onKeyEvent: (_, event) {
          if (event.isActionable &&
              event.logicalKey.isLeftKey &&
              positionInSection % crossAxisCount == 0 &&
              _usesDockedPanel) {
            _focusDockedPanel();
            return KeyEventResult.handled;
          }
          if (PlatformDetection.isTV &&
              event.isActionable &&
              event.logicalKey.isUpKey) {
            if (onTvUp != null) {
              onTvUp();
              return KeyEventResult.handled;
            } else if (positionInSection < crossAxisCount) {
              _focusAboveGrid();
              return KeyEventResult.handled;
            }
          }
          if (PlatformDetection.isTV &&
              event.isActionable &&
              event.logicalKey.isDownKey &&
              onTvDown != null) {
            onTvDown();
            return KeyEventResult.handled;
          }
          if (event.isActionable && event.logicalKey.isRightKey) {
            // Measured against the section the card sits in, so the end of a
            // ragged last row holds focus instead of jumping to the next
            // category's first card.
            final isLastColumn =
                (positionInSection % crossAxisCount) == crossAxisCount - 1;
            final isLastInSection = positionInSection == sectionCount - 1;
            if (isLastColumn || isLastInSection) {
              return KeyEventResult.handled;
            }
          }

          if (!paginateOnEdge || (!_vm.hasMore && !_vm.loadingMore)) {
            return KeyEventResult.ignored;
          }
          if (!event.isActionable || !event.logicalKey.isDownKey) {
            return KeyEventResult.ignored;
          }

          final nextRowIndex = index + crossAxisCount;
          final atBottomLoadedRow = nextRowIndex >= _vm.items.length;
          if (!atBottomLoadedRow) {
            return KeyEventResult.ignored;
          }

          _vm.loadMore();
          return KeyEventResult.handled;
        },
        onLongPress: () =>
            showContextMenu(context, item, onChanged: () => setState(() {})),
        onTap: () => _onItemTap(item),
      );
    }

    return isGrouped ? Builder(builder: card) : card(null);
  }

  Widget _buildGroupedHorizontalRows(
    Map<String, List<AggregatedItem>> categories,
  ) {
    if (categories.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noItemsFound,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }

    final cardWidth = _cardWidth() * _kGroupedRowCardScale;
    final isMobile = _isCompact(context);
    final gridPadding = isMobile ? 16.0 : _horizontalPadding;
    final ar = _gridBaseAspectRatio();
    final watchedBehavior = _prefs.get(UserPreferences.watchedIndicatorBehavior);
    final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
    final textHeight = _showCardTitles
        ? (_hasSubtitles ? 42.0 : 24.0) * desktopTextScale
        : 0.0;
    final rowCardHeight = cardWidth / ar + textHeight;
    final rowContainerHeight = rowCardHeight + _kGroupedRowFocusPadding;

    final focusColor = _vm.isFilterBrowse
        ? ThemeRegistry.active.borders.focusBorder.color
        : Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    final keys = categories.keys.toList();

    // Focus nodes are cached by index alone, so hand each row a slice of the
    // numbering wide enough for its own cards. A running total keeps the slices
    // packed and, unlike a fixed stride, can't overflow into the next row.
    final focusOffsets = List<int>.filled(keys.length, 0);
    var runningOffset = 0;
    for (var i = 0; i < keys.length; i++) {
      focusOffsets[i] = runningOffset;
      runningOffset += categories[keys[i]]!.length;
    }

    return FocusTraversalGroup(
      policy: ReadingOrderTraversalPolicy(),
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(
          top: gridPadding,
          bottom: _gridBottomPadding(gridPadding),
        ),
        itemCount: keys.length,
        itemBuilder: (context, idx) {
          final key = keys[idx];
          final catItems = categories[key]!;

          return _GroupedCategoryRow(
            categoryKey: key,
            items: catItems,
            focusIndexOffset: focusOffsets[idx],
            cardWidth: cardWidth,
            rowContainerHeight: rowContainerHeight,
            gridPadding: gridPadding,
            focusColor: focusColor,
            isNeon: isNeon,
            watchedBehavior: watchedBehavior,
            isMobile: isMobile,
            buildGridCard: _buildGridCard,
            getItemAspectRatio: _itemAspectRatio,
          );
        },
      ),
    );
  }

  Widget _buildHorizontalGrid() {
    if (_vm.isGrouping) {
      return _buildGroupedHorizontalRows(_vm.groupedCategories);
    }
    if (_vm.isPlaylistBrowse && _vm.groupByType) {
      final l10n = AppLocalizations.of(context);
      return _buildGroupedHorizontalRows({
        for (final entry in _vm.groupedPlaylists.entries)
          _playlistSectionTitle(l10n, entry.key): entry.value,
      });
    }
    final items = _vm.visiblePlaylists;
    final cardFocusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final watchedBehavior = _prefs.get(UserPreferences.watchedIndicatorBehavior);
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return LayoutBuilder(
      builder: (context, constraints) {
        _scheduleViewportFillCheck();
        final isMobile = _isCompact(context);
        final horizPadding = isMobile ? 16.0 : _horizontalPadding;
        final vertPadding = isMobile ? 12.0 : 20.0;
        final bottomPadding = _gridBottomPadding(vertPadding);
        final ar = _gridBaseAspectRatio();
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = _showCardTitles
            ? (_hasSubtitles ? 46.0 : 30.0) * desktopTextScale
            : 0.0;

        final cellWidth = _cardWidth();
        final spacing = cardFocusExpansion && !isMobile
            ? MediaCard.focusGap(cellWidth)
            : 12.0;
        final targetImageHeight = cellWidth / ar;
        final targetCellHeight = targetImageHeight + textHeight;

        final availableHeight =
            constraints.maxHeight - vertPadding - bottomPadding;
        final rawRows = (availableHeight + spacing) / (targetCellHeight + spacing);
        final rowCount = (rawRows >= _kHorizontalRowRoundUpThreshold
                ? rawRows.round()
                : rawRows.floor())
            .clamp(1, _kMaxHorizontalRows);

        final double actualCellHeight;
        final double actualImageHeight;
        if (rowCount == 1 && targetCellHeight < availableHeight) {
          actualCellHeight = targetCellHeight;
          actualImageHeight = targetImageHeight;
        } else {
          actualCellHeight = (availableHeight - (rowCount - 1) * spacing) / rowCount;
          actualImageHeight = (actualCellHeight - textHeight).clamp(40.0, 1000.0);
        }
        final actualCellWidth = actualImageHeight * ar;
        final childAspectRatio = actualCellHeight / actualCellWidth;
        _gridGeometry = (
          perLine: rowCount,
          lineExtent: actualCellWidth,
          lineSpacing: spacing,
          leadingPad: horizPadding,
        );

        return Listener(
          onPointerSignal: (signal) {
            if (signal is PointerScrollEvent && _scrollController.hasClients) {
              final pos = _scrollController.position;
              final newOffset =
                  (_scrollController.offset + signal.scrollDelta.dy)
                      .clamp(pos.minScrollExtent, pos.maxScrollExtent);
              _scrollController.jumpTo(newOffset);
            }
          },
          child: CustomScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            scrollCacheExtent: _gridScrollCacheExtent(
              cellExtent: actualCellWidth,
              spacing: spacing,
            ),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  horizPadding, vertPadding, horizPadding, bottomPadding,
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: rowCount,
                    mainAxisSpacing: spacing,
                    crossAxisSpacing: spacing,
                    childAspectRatio: childAspectRatio,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      // No childCount on this delegate, so returning null is
                      // what tells the sliver where the list ends.
                      if (index >= items.length) return null;
                      final item = items[index];
                      return MediaCard(
                        recordingItemId: item.id,
                        title: item.name,
                        subtitle: _cardSubtitle(item),
                        showLabel: _showCardTitles,
                        imageUrl: _imageUrl(item, cellWidth: actualCellWidth),
                        width: double.infinity,
                        aspectRatio: _itemAspectRatio(item),
                        focusColor: focusColor,
                        focusNode: getGridItemFocusNode(index),
                        cardFocusExpansion: cardFocusExpansion,
                        suppressFocusGlow: isNeon,
                        isPlayed: item.isPlayed,
                        isFavorite: item.isFavorite,
                        unplayedCount: item.unplayedItemCount,
                        playedPercentage: _displayPlayedPercentage(item),
                        watchedBehavior: watchedBehavior,
                        itemType: item.type,
                        onFocus: () => _onItemFocused(item),
                        onHoverStart: () => _onItemFocused(item),
                        onHoverEnd: () => _vm.setFocusedItem(null),
                        onKeyEvent: (_, event) {
                          if (event.isActionable &&
                              event.logicalKey.isLeftKey &&
                              index < rowCount &&
                              _usesDockedPanel) {
                            _focusDockedPanel();
                            return KeyEventResult.handled;
                          }
                          if (!_vm.hasMore && !_vm.loadingMore) {
                            return KeyEventResult.ignored;
                          }
                          if (!event.isActionable ||
                              !event.logicalKey.isRightKey) {
                            return KeyEventResult.ignored;
                          }
                          final col = index ~/ rowCount;
                          final isLastCol =
                              (col + 1) * rowCount >= items.length;
                          if (!isLastCol) return KeyEventResult.ignored;
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
                    },
                    childCount: items.length,
                  ),
                ),
              ),
              if (_vm.loadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: _jellyfinBlue,
                      ),
                    ),
                  ),
                ),
            ],
          ),
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

  void _showFilterSortDialog(BuildContext context, {String? initialSection}) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) =>
          _FilterSortDialog(vm: _vm, initialSection: initialSection),
    ).whenComplete(_restoreGridFocusAfterDialog);
  }

  void _showSettingsDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _SettingsDialog(vm: _vm),
    ).whenComplete(_restoreGridFocusAfterDialog);
  }

  // Sorting or filtering can rebuild the grid while the dialog is open, which
  // disposes the row the dialog restores focus to. Once the dialog is gone,
  // point focus back at a valid grid row.
  void _restoreGridFocusAfterDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) restoreGridFocusIfNeeded();
    });
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
  final bool alphabetApplies;
  final String letterFilter;
  final FocusNode? allLetterFocusNode;
  final bool isMusicBrowse;
  final VoidCallback? onGroupBy;
  final bool canGroup;
  final VoidCallback onBack;
  final VoidCallback onSort;
  final VoidCallback onSettings;
  final VoidCallback? onShuffle;
  final ValueChanged<String> onLetterChanged;
  final FocusNode? homeFocusNode;
  final KeyEventResult Function(FocusNode, KeyEvent)? onTvSearchKey;
  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final ValueChanged<String>? onSearchChanged;

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
    required this.alphabetApplies,
    required this.letterFilter,
    this.allLetterFocusNode,
    this.homeFocusNode,
    this.onTvSearchKey,
    this.isMusicBrowse = false,
    this.onGroupBy,
    this.canGroup = false,
    required this.onBack,
    required this.onSort,
    required this.onSettings,
    this.onShuffle,
    required this.onLetterChanged,
    this.searchController,
    this.searchFocusNode,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
    final prefs = GetIt.instance<UserPreferences>();
    final showAlpha =
        alphabetApplies && prefs.get(UserPreferences.showAlphabeticalFilters);
    // Phones draw the scrub rail along the grid instead.
    final showInlineAlpha = showAlpha && !isMobile;
    final topPad = (isMobile ? MediaQuery.of(context).padding.top : 0.0) + 8.0;
    final hPad = isMobile ? 16.0 : _horizontalPadding * desktopScale;

    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, topPad, hPad, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitleAndSearch(context, isMobile: isMobile, desktopScale: desktopScale),
          if (showMediaDetails && !isMobile) ...[
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (PlatformDetection.isTV)
                FocusableToolbarButton(
                  focusNode: homeFocusNode,
                  icon: Icons.home,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: () => context.go(Destinations.home),
                  onUpKey: _focusSearch,
                )
              else
                FocusableToolbarButton(
                  focusNode: homeFocusNode,
                  icon: Icons.arrow_back,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onBack,
                  onUpKey: _focusSearch,
                ),
              SizedBox(width: 2 * desktopScale),
              FocusableToolbarButton(
                icon: Icons.sort,
                size: 30 * desktopScale,
                iconSize: 20 * desktopScale,
                unfocusedIconAlpha: 128,
                onTap: onSort,
                onUpKey: _focusSearch,
              ),
              if (canGroup && onGroupBy != null) ...[
                SizedBox(width: 2 * desktopScale),
                FocusableToolbarButton(
                  icon: Icons.category_outlined,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onGroupBy!,
                  onUpKey: _focusSearch,
                ),
              ],
              if (onShuffle != null) ...[
                SizedBox(width: 2 * desktopScale),
                FocusableToolbarButton(
                  icon: Icons.shuffle,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onShuffle!,
                  onUpKey: _focusSearch,
                ),
              ],
              if (!isMusicBrowse) ...[
                SizedBox(width: 2 * desktopScale),
                FocusableToolbarButton(
                  icon: Icons.settings,
                  size: 30 * desktopScale,
                  iconSize: 20 * desktopScale,
                  unfocusedIconAlpha: 128,
                  onTap: onSettings,
                  onUpKey: _focusSearch,
                ),
              ],
              if (showInlineAlpha) ...[
                SizedBox(width: 10 * desktopScale),
                Expanded(
                  child: AlphaPickerBar(
                    onChanged: onLetterChanged,
                    allFocusNode: allLetterFocusNode,
                    onUpKey: _focusSearch,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void _focusSearch() => searchFocusNode?.requestFocus();

  Widget _buildTitleAndSearch(
    BuildContext context, {
    required bool isMobile,
    required double desktopScale,
  }) {
    final titleWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          libraryName,
          style: TextStyle(
            fontSize: 26 * desktopScale,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        if (totalCount > 0) ...[
          SizedBox(width: 12 * desktopScale),
          Text(
            AppLocalizations.of(context).itemCountLabel(totalCount),
            style: TextStyle(
              fontSize: 12 * desktopScale,
              color: Colors.white.withAlpha(102),
            ),
          ),
        ],
      ],
    );

    if (searchController == null || searchFocusNode == null) {
      return Center(child: titleWidget);
    }

    if (!isMobile) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final desiredSearchWidth = 320 * desktopScale;
          final maxSearchWidth = (constraints.maxWidth - 220 * desktopScale) / 2;
          final searchWidth = (desiredSearchWidth < maxSearchWidth
                  ? desiredSearchWidth
                  : maxSearchWidth)
              .clamp(160.0, 400.0);

          return Row(
            children: [
              SizedBox(width: searchWidth),
              Expanded(child: Center(child: titleWidget)),
              SizedBox(
                width: searchWidth,
                child: LocalSearchField(
                  controller: searchController!,
                  focusNode: searchFocusNode!,
                  onChanged: onSearchChanged,
                  onTvKeyEvent: onTvSearchKey,
                ),
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        Center(child: titleWidget),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: LocalSearchField(
              controller: searchController!,
              focusNode: searchFocusNode!,
              onChanged: onSearchChanged,
              onTvKeyEvent: onTvSearchKey,
            ),
          ),
        ),
      ],
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

  static double heightFor(bool showLabels) =>
      (showLabels ? 105.0 : 86.0) * _desktopUiScaleFactor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFor(showLabels),
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
                    personalRating: item!.personalRating,
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
            borderRadius: AppRadius.circular(4),
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
            borderRadius: AppRadius.circular(4),
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

class _FilterSortDialog extends StatefulWidget {
  final LibraryBrowseViewModel vm;

  /// The group to open on, the sort group when null.
  final String? initialSection;

  const _FilterSortDialog({required this.vm, this.initialSection});

  @override
  State<_FilterSortDialog> createState() => _FilterSortDialogState();
}

class _FilterSortDialogState extends State<_FilterSortDialog> {
  /// Only one group stays open at a time, and every group starts closed as a
  /// heading unless the panel was opened for one.
  late String? _expandedSection = widget.initialSection;

  /// Shorter lists are quicker to scroll through than to search.
  static const _searchableMinimum = 10;

  final _headingFocus = <String, FocusNode>{};
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
    unawaited(widget.vm.ensureFacetValuesLoaded());
  }

  @override
  void dispose() {
    widget.vm.removeListener(_rebuild);
    for (final node in _headingFocus.values) {
      node.dispose();
    }
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  FocusNode _headingNode(String key) =>
      _headingFocus.putIfAbsent(key, FocusNode.new);

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.vm;
    final isBookBrowse = vm.isBookLibrary;
    final accent = _jellyfinBlue;
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(alpha: 0.92);
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final sectionColor = onSurface.withValues(alpha: 0.72);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      380.0,
    );

    // Every label is read twice, once for its own row and once for the summary
    // the closed heading carries.
    String sortLabel(LibrarySortBy option) =>
        _librarySortLabel(vm, option, l10n);

    String playedLabel(PlayedStatusFilter status) =>
        _playedStatusLabel(vm, status, l10n);

    String likedLabel(LikedStatusFilter status) => switch (status) {
      LikedStatusFilter.all => l10n.all,
      LikedStatusFilter.liked => l10n.like,
      LikedStatusFilter.disliked => l10n.dislike,
    };

    String seriesLabel(SeriesStatusFilter status) => switch (status) {
      SeriesStatusFilter.all => l10n.all,
      SeriesStatusFilter.continuing => l10n.continuing,
      SeriesStatusFilter.ended => l10n.ended,
      SeriesStatusFilter.unreleased => l10n.filterUnreleased,
    };

    String featureLabel(LibraryFeatureFilter option) => switch (option) {
      LibraryFeatureFilter.subtitles => l10n.subtitles,
      LibraryFeatureFilter.trailer => l10n.filterTrailers,
      LibraryFeatureFilter.extras => l10n.filterExtras,
      LibraryFeatureFilter.themeSong => l10n.filterThemeSongs,
      LibraryFeatureFilter.themeVideo => l10n.filterThemeVideos,
    };

    String qualityLabel(LibraryVideoQualityFilter option) => switch (option) {
      LibraryVideoQualityFilter.sd => 'SD',
      LibraryVideoQualityFilter.hd => 'HD',
      LibraryVideoQualityFilter.uhd => '4K',
      LibraryVideoQualityFilter.threeD => '3D',
    };

    String? countSummary(int count) => count > 0 ? '$count' : null;

    String? selectedLibraryName() {
      final id = vm.libraryFilter;
      if (id == null) return null;
      for (final lib in vm.libraries) {
        if (lib['Id']?.toString() == id) return lib['Name'] as String?;
      }
      return null;
    }

    // The body is a callback, so a closed group builds none of its rows, which
    // matters for the facets that run to hundreds of values. The key is what
    // tracks the open group, so a translated title never closes one behind the
    // user.
    List<Widget> section({
      required String key,
      required String title,
      required String? summary,
      required List<Widget> Function() body,
    }) {
      final expanded = _expandedSection == key;
      return [
        Divider(color: dividerColor),
        _DialogExpanderTile(
          label: title,
          summary: summary,
          expanded: expanded,
          focusNode: _headingNode(key),
          onTap: () {
            _searchController.clear();
            setState(() => _expandedSection = expanded ? null : key);
          },
          sectionColor: sectionColor,
          accent: accent,
        ),
        if (expanded) ...body(),
      ];
    }

    // The tile goes away once its group is empty, so focus moves to the
    // heading first rather than being left on nothing.
    Widget clearGroupTile(String key, LibraryFilterGroup group) =>
        _DialogActionTile(
          label: l10n.clear,
          icon: Icons.filter_alt_off,
          onTap: () {
            _headingNode(key).requestFocus();
            unawaited(vm.clearFilterGroup(group));
          },
          accent: accent,
        );

    List<Widget> facetSection({
      required String key,
      required String title,
      required LibraryFilterGroup group,
      required List<String> values,
      required Set<String> selected,
      required Future<void> Function(String) onToggle,
      Map<String, String> labels = const {},
    }) {
      if (values.isEmpty) return const [];
      return section(
        key: key,
        title: title,
        summary: countSummary(values.where(selected.contains).length),
        body: () {
          final query = foldForSearch(_searchController.text.trim());
          final shown = query.isEmpty
              ? values
              : values
                    .where((v) => foldForSearch(labels[v] ?? v).contains(query))
                    .toList();
          return [
            if (selected.isNotEmpty) clearGroupTile(key, group),
            if (values.length >= _searchableMinimum)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 8),
                child: LocalSearchField(
                  controller: _searchController,
                  focusNode: _searchFocus,
                  hint: title,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            for (final value in shown)
              _DialogCheckboxTile(
                label: labels[value] ?? value,
                checked: selected.contains(value),
                onTap: () => onToggle(value),
                accent: accent,
                onSurface: onSurface,
              ),
            if (shown.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Text(
                  l10n.noResults,
                  style: TextStyle(fontSize: 15, color: sectionColor),
                ),
              ),
          ];
        },
      );
    }

    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
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
            _DialogCheckboxTile(
              label: l10n.showAlphabeticalFilters,
              checked: GetIt.instance<UserPreferences>().get(
                UserPreferences.showAlphabeticalFilters,
              ),
              onTap: () {
                final prefs = GetIt.instance<UserPreferences>();
                final val = prefs.get(UserPreferences.showAlphabeticalFilters);
                prefs.set(UserPreferences.showAlphabeticalFilters, !val);
                setState(() {});
              },
              accent: accent,
              onSurface: onSurface,
            ),
            if (vm.canFolderView)
              _DialogCheckboxTile(
                label: l10n.libraryFolderView,
                checked: vm.folderView,
                onTap: () => vm.setFolderView(!vm.folderView),
                accent: accent,
                onSurface: onSurface,
              ),
            ...section(
              key: 'sort',
              title: l10n.sortBy,
              summary: sortLabel(vm.sortBy),
              body: () => [
                for (final option in vm.sortOptions)
                  _DialogRadioTile(
                    label: sortLabel(option),
                    selected: vm.sortBy == option,
                    trailing: vm.sortBy == option
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              vm.sortDirection == SortDirection.ascending
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: accent,
                              size: 18,
                            ),
                          )
                        : null,
                    onTap: () {
                      if (vm.sortBy == option) {
                        vm.toggleSortDirection();
                      } else {
                        vm.setSortBy(option);
                      }
                    },
                    accent: accent,
                    onSurface: onSurface,
                  ),
              ],
            ),
            if (!vm.favoritesOnly)
              ...section(
                key: 'favorites',
                title: l10n.filters,
                summary: vm.favoriteFilter ? l10n.favorites : null,
                body: () => [
                  _DialogCheckboxTile(
                    label: l10n.favorites,
                    checked: vm.favoriteFilter,
                    onTap: () => vm.setFavoriteFilter(!vm.favoriteFilter),
                    accent: accent,
                    onSurface: onSurface,
                  ),
                ],
              ),
            if (!vm.isMusicBrowse)
              ...section(
                key: 'played',
                title: isBookBrowse ? l10n.readingStatus : l10n.playedStatus,
                summary: vm.playedFilter == PlayedStatusFilter.all
                    ? null
                    : playedLabel(vm.playedFilter),
                body: () => [
                  for (final status in PlayedStatusFilter.values)
                    _DialogRadioTile(
                      label: playedLabel(status),
                      selected: vm.playedFilter == status,
                      onTap: () => vm.setPlayedFilter(status),
                      accent: accent,
                      onSurface: onSurface,
                    ),
                ],
              ),
            if (vm.supportsExtraFilters)
              ...section(
                key: 'liked',
                title: l10n.personalRatingMine,
                summary: vm.likedFilter == LikedStatusFilter.all
                    ? null
                    : likedLabel(vm.likedFilter),
                body: () => [
                  for (final status in LikedStatusFilter.values)
                    _DialogRadioTile(
                      label: likedLabel(status),
                      selected: vm.likedFilter == status,
                      onTap: () => vm.setLikedFilter(status),
                      accent: accent,
                      onSurface: onSurface,
                    ),
                ],
              ),
            if (vm.isSeriesLibrary && vm.supportsExtraFilters)
              ...section(
                key: 'series',
                title: l10n.seriesStatus,
                summary: vm.seriesFilter == SeriesStatusFilter.all
                    ? null
                    : seriesLabel(vm.seriesFilter),
                body: () => [
                  for (final status in SeriesStatusFilter.values)
                    if (status != SeriesStatusFilter.unreleased ||
                        vm.supportsUnreleasedSeriesFilter)
                      _DialogRadioTile(
                        label: seriesLabel(status),
                        selected: vm.seriesFilter == status,
                        onTap: () => vm.setSeriesFilter(status),
                        accent: accent,
                        onSurface: onSurface,
                      ),
                ],
              ),
            if (vm.supportsVideoFilters) ...[
              if (vm.supportsExtraFilters)
                ...section(
                  key: 'features',
                  title: l10n.features,
                  summary: countSummary(vm.featureFilters.length),
                  body: () => [
                    if (vm.featureFilters.isNotEmpty)
                      clearGroupTile('features', LibraryFilterGroup.features),
                    for (final option in LibraryFeatureFilter.values)
                      _DialogCheckboxTile(
                        label: featureLabel(option),
                        checked: vm.featureFilters.contains(option),
                        onTap: () => vm.toggleFeatureFilter(option),
                        accent: accent,
                        onSurface: onSurface,
                      ),
                  ],
                ),
              ...section(
                key: 'quality',
                title: l10n.quality,
                summary: countSummary(vm.videoQualityFilters.length),
                body: () => [
                  if (vm.videoQualityFilters.isNotEmpty)
                    clearGroupTile('quality', LibraryFilterGroup.quality),
                  for (final option in LibraryVideoQualityFilter.values)
                    if ((option != LibraryVideoQualityFilter.uhd ||
                            vm.supportsUhdFilter) &&
                        (option != LibraryVideoQualityFilter.threeD ||
                            vm.supportsExtraFilters))
                      _DialogCheckboxTile(
                        label: qualityLabel(option),
                        checked: vm.videoQualityFilters.contains(option),
                        onTap: () => vm.toggleVideoQualityFilter(option),
                        accent: accent,
                        onSurface: onSurface,
                      ),
                ],
              ),
              if (vm.supportsExtraFilters)
                ...section(
                  key: 'source',
                  title: l10n.source,
                  summary: countSummary(vm.videoSourceFilters.length),
                  body: () => [
                    if (vm.videoSourceFilters.isNotEmpty)
                      clearGroupTile('source', LibraryFilterGroup.source),
                    for (final option in LibraryVideoSourceFilter.values)
                      _DialogCheckboxTile(
                        label: option.displayName,
                        checked: vm.videoSourceFilters.contains(option),
                        onTap: () => vm.toggleVideoSourceFilter(option),
                        accent: accent,
                        onSurface: onSurface,
                      ),
                  ],
                ),
            ],
            ...facetSection(
              key: 'genres',
              group: LibraryFilterGroup.genres,
              title: l10n.genres,
              values: vm.facetValues.genres,
              selected: vm.genreFilters,
              onToggle: vm.toggleGenreFilter,
            ),
            ...facetSection(
              key: 'ratings',
              group: LibraryFilterGroup.ratings,
              title: l10n.groupByParentalRating,
              values: vm.facetValues.officialRatings,
              selected: vm.officialRatingFilters,
              onToggle: vm.toggleOfficialRatingFilter,
            ),
            ...facetSection(
              key: 'tags',
              group: LibraryFilterGroup.tags,
              title: l10n.tags,
              values: vm.facetValues.tags,
              selected: vm.tagFilters,
              onToggle: vm.toggleTagFilter,
            ),
            ...facetSection(
              key: 'years',
              group: LibraryFilterGroup.years,
              title: l10n.years,
              values: vm.facetValues.years.map((e) => e.toString()).toList(),
              selected: vm.yearFilters,
              onToggle: vm.toggleYearFilter,
            ),
            ...facetSection(
              key: 'audio',
              group: LibraryFilterGroup.audioLanguages,
              title: l10n.audioLanguage,
              values: vm.facetValues.audioLanguages
                  .map((e) => e.value)
                  .toList(),
              labels: {
                for (final e in vm.facetValues.audioLanguages) e.value: e.name,
              },
              selected: vm.audioLanguageFilters,
              onToggle: vm.toggleAudioLanguageFilter,
            ),
            ...facetSection(
              key: 'subtitles',
              group: LibraryFilterGroup.subtitleLanguages,
              title: l10n.subtitleLanguage,
              values: vm.facetValues.subtitleLanguages
                  .map((e) => e.value)
                  .toList(),
              labels: {
                for (final e in vm.facetValues.subtitleLanguages)
                  e.value: e.name,
              },
              selected: vm.subtitleLanguageFilters,
              onToggle: vm.toggleSubtitleLanguageFilter,
            ),
            if (vm.hasActiveFilters) ...[
              Divider(color: dividerColor),
              // Closing hands focus back to the grid. Leaving the dialog open
              // would drop the remote on a tile that just removed itself.
              _DialogActionTile(
                label: l10n.clearFilters,
                icon: Icons.filter_alt_off,
                onTap: () {
                  Navigator.of(context).pop();
                  vm.clearFilters();
                },
                accent: accent,
              ),
            ],
            if (vm.isGenreBrowse && vm.libraries.isNotEmpty)
              ...section(
                key: 'library',
                title: l10n.library,
                summary: selectedLibraryName(),
                body: () => [
                  _DialogRadioTile(
                    label: l10n.allLibraries,
                    selected: vm.libraryFilter == null,
                    onTap: () => vm.setLibraryFilter(null),
                    accent: accent,
                    onSurface: onSurface,
                  ),
                  for (final lib in vm.libraries)
                    _DialogRadioTile(
                      label: lib['Name'] as String? ?? '',
                      selected: vm.libraryFilter == lib['Id'],
                      onTap: () =>
                          vm.setLibraryFilter(lib['Id']?.toString() ?? ''),
                      accent: accent,
                      onSurface: onSurface,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DialogRadioTile extends StatefulWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color? accent;
  final Color onSurface;

  const _DialogRadioTile({
    required this.label,
    required this.selected,
    required this.onTap,
    this.trailing,
    this.accent,
    required this.onSurface,
  });

  @override
  State<_DialogRadioTile> createState() => _DialogRadioTileState();
}

class _DialogRadioTileState extends State<_DialogRadioTile> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final effectiveAccent = widget.accent ?? AppColorScheme.accent;
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.onSurface;

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
            color: showActive ? focusColor.withValues(alpha: 0.12) : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: widget.selected
                            ? effectiveAccent
                            : color.withValues(alpha: 0.5),
                        width: 2,
                      ),
                    ),
                    color: widget.selected ? effectiveAccent : Colors.transparent,
                  ),
                  child: widget.selected
                      ? Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.onSurface,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.selected
                          ? color
                          : color.withValues(alpha: 0.72),
                    ),
                  ),
                ),
                if (widget.trailing != null) widget.trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DialogCheckboxTile extends StatefulWidget {
  final String label;
  final bool checked;
  final VoidCallback onTap;
  final Color accent;
  final Color onSurface;

  const _DialogCheckboxTile({
    required this.label,
    required this.checked,
    required this.onTap,
    required this.accent,
    required this.onSurface,
  });

  @override
  State<_DialogCheckboxTile> createState() => _DialogCheckboxTileState();
}

class _DialogCheckboxTileState extends State<_DialogCheckboxTile> with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.onSurface;

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
            color: showActive ? focusColor.withValues(alpha: 0.12) : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.circular(4),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.focusBorder.copyWith(
                        color: widget.checked ? widget.accent : color.withValues(alpha: 0.5),
                        width: 2,
                      ),
                    ),
                    color: widget.checked ? widget.accent : Colors.transparent,
                  ),
                  child: widget.checked
                      ? Center(
                          child: Text(
                            '✓',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: widget.onSurface,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.checked ? color : color.withValues(alpha: 0.72),
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

class _DialogExpanderTile extends StatefulWidget {
  final String label;
  final String? summary;
  final bool expanded;
  final FocusNode? focusNode;
  final VoidCallback onTap;
  final Color sectionColor;
  final Color accent;

  const _DialogExpanderTile({
    required this.label,
    required this.summary,
    required this.expanded,
    this.focusNode,
    required this.onTap,
    required this.sectionColor,
    required this.accent,
  });

  @override
  State<_DialogExpanderTile> createState() => _DialogExpanderTileState();
}

class _DialogExpanderTileState extends State<_DialogExpanderTile>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.sectionColor;
    final summary = widget.summary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        focusNode: widget.focusNode,
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
            color: showActive
                ? focusColor.withValues(alpha: 0.12)
                : Colors.transparent,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
                // A tag or a library name can run long, so the summary takes
                // a fixed slice and the title keeps the rest.
                if (summary != null && summary.isNotEmpty)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 140),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        summary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: widget.accent,
                        ),
                      ),
                    ),
                  ),
                Icon(
                  widget.expanded ? Icons.expand_less : Icons.expand_more,
                  size: 18,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DialogActionTile extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color accent;

  const _DialogActionTile({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.accent,
  });

  @override
  State<_DialogActionTile> createState() => _DialogActionTileState();
}

class _DialogActionTileState extends State<_DialogActionTile>
    with FocusStateMixin {
  @override
  Widget build(BuildContext context) {
    final showActive = focused || hovered;
    final color = showActive ? focusColor : widget.accent;

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
            color: showActive
                ? focusColor.withValues(alpha: 0.12)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Icon(widget.icon, size: 18, color: color),
                const SizedBox(width: 12),
                Text(
                  widget.label,
                  style: TextStyle(fontSize: 15, color: color),
                ),
              ],
            ),
          ),
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
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(alpha: 0.92);
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
        borderRadius: AppRadius.circular(20),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
              child: Text(
                l10n.scrollDirection,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: sectionColor,
                ),
              ),
            ),
            _scrollDirectionRadioTile(
              vm,
              LibraryScrollDirection.vertical,
              l10n.scrollDirectionVertical,
            ),
            _scrollDirectionRadioTile(
              vm,
              LibraryScrollDirection.horizontal,
              l10n.scrollDirectionHorizontal,
            ),
            if (!vm.isPlaylistBrowse) ...[
              Divider(color: dividerColor),
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
            if (vm.imageType != ImageType.banner) ...[
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
              for (final size in PosterSize.gridValues)
                _posterSizeRadioTile(vm, size),
            ],
            if (vm.isPlaylistBrowse) ...[
              Divider(color: dividerColor),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
                child: Text(
                  l10n.grouping,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: sectionColor,
                  ),
                ),
              ),
              _DialogCheckboxTile(
                label: l10n.groupByType,
                checked: vm.groupByType,
                onTap: () => vm.setGroupByType(!vm.groupByType),
                accent: _jellyfinBlue,
                onSurface: onSurface,
              ),
              Divider(color: dividerColor),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
                child: Text(
                  l10n.playlistTypes,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: sectionColor,
                  ),
                ),
              ),
              for (final typeOption in [
                ('Video', l10n.playlistTypeVideo),
                ('MusicVideo', l10n.playlistTypeMusicVideo),
                ('Audio', l10n.playlistTypeAudio),
                ('AudioBook', l10n.playlistTypeAudiobook),
                ('Book', l10n.playlistTypeBook),
                ('Photo', l10n.playlistTypePhoto),
                ('Mixed', l10n.playlistTypeMixed),
              ])
                _DialogCheckboxTile(
                  label: typeOption.$2,
                  checked: vm.playlistTypeFilters.contains(typeOption.$1),
                  onTap: () => vm.togglePlaylistTypeFilter(typeOption.$1),
                  accent: _jellyfinBlue,
                  onSurface: onSurface,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _scrollDirectionRadioTile(
    LibraryBrowseViewModel vm,
    LibraryScrollDirection direction,
    String label,
  ) {
    final selected = vm.scrollDirection == direction;
    final accent = vm.isBookLibrary ? const Color(0xFFD97706) : _jellyfinBlue;
    final onSurface = AppColorScheme.onSurface;
    return _DialogRadioTile(
      label: label,
      selected: selected,
      onTap: () => vm.setScrollDirection(direction),
      accent: accent,
      onSurface: onSurface,
    );
  }

  Widget _settingsRadioTile(LibraryBrowseViewModel vm, ImageType type) {
    final selected = vm.imageType == type;
    final accent = _jellyfinBlue;
    final onSurface = AppColorScheme.onSurface;
    final l10n = AppLocalizations.of(context);
    return _DialogRadioTile(
      label: switch (type) {
        ImageType.poster => l10n.imageTypePoster,
        ImageType.thumb => l10n.imageTypeThumbnail,
        ImageType.banner => l10n.imageTypeBanner,
      },
      selected: selected,
      onTap: () => vm.setImageType(type),
      accent: accent,
      onSurface: onSurface,
    );
  }

  Widget _posterSizeRadioTile(LibraryBrowseViewModel vm, PosterSize size) {
    final selected = vm.posterSize == size;
    final accent = _jellyfinBlue;
    final onSurface = AppColorScheme.onSurface;
    final label = switch (size) {
      PosterSize.small => AppLocalizations.of(context).small,
      PosterSize.medium => AppLocalizations.of(context).medium,
      PosterSize.large => AppLocalizations.of(context).large,
      PosterSize.extraLarge ||
      PosterSize.grandparents => AppLocalizations.of(context).extraLarge,
    };
    return _DialogRadioTile(
      label: label,
      selected: selected,
      onTap: () => vm.setPosterSize(size),
      accent: accent,
      onSurface: onSurface,
    );
  }
}

class _GroupByDialog extends StatefulWidget {
  final LibraryBrowseViewModel vm;

  const _GroupByDialog({required this.vm});

  @override
  State<_GroupByDialog> createState() => _GroupByDialogState();
}

class _GroupByDialogState extends State<_GroupByDialog> {
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
    final l10n = AppLocalizations.of(context);
    final surfaceColor = AppColorScheme.surface.withValues(alpha: 0.92);
    final onSurface = AppColorScheme.onSurface;
    final dividerColor = onSurface.withValues(alpha: 0.12);
    final dialogWidth = (MediaQuery.sizeOf(context).width - 32).clamp(
      280.0,
      360.0,
    );

    const options = [
      LibraryGroupBy.none,
      LibraryGroupBy.decade,
      LibraryGroupBy.genres,
      LibraryGroupBy.parentalRatings,
      LibraryGroupBy.studio,
    ];

    return Dialog(
      backgroundColor: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular(20),
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
                l10n.groupByTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: onSurface,
                ),
              ),
            ),
            Divider(color: dividerColor),
            for (final opt in options)
              _DialogRadioTile(
                label: _groupByLabel(opt, l10n),
                selected: vm.groupBy == opt,
                onTap: () {
                  vm.setGroupBy(opt);
                  Navigator.of(context).pop();
                },
                accent: _jellyfinBlue,
                onSurface: onSurface,
              ),
          ],
        ),
      ),
    );
  }
}

class _GroupedCategoryRow extends StatefulWidget {
  final String categoryKey;
  final List<AggregatedItem> items;

  /// Where this row's cards start in the screen-wide focus node numbering.
  /// Nodes are cached by index alone, so every card across every category needs
  /// a distinct index or two rows end up sharing a node.
  final int focusIndexOffset;
  final double cardWidth;
  final double rowContainerHeight;
  final double gridPadding;
  final Color focusColor;
  final bool isNeon;
  final WatchedIndicatorBehavior watchedBehavior;
  final bool isMobile;
  final Widget Function({
    required AggregatedItem item,
    required int index,
    required int positionInSection,
    required int sectionCount,
    required int crossAxisCount,
    required double cellWidth,
    required double itemAspectRatio,
    required Color focusColor,
    required bool isNeon,
    required WatchedIndicatorBehavior watchedBehavior,
    required bool isMobile,
    VoidCallback? onCardFocused,
    bool paginateOnEdge,
  }) buildGridCard;
  final double Function(AggregatedItem item) getItemAspectRatio;

  const _GroupedCategoryRow({
    required this.categoryKey,
    required this.items,
    required this.focusIndexOffset,
    required this.cardWidth,
    required this.rowContainerHeight,
    required this.gridPadding,
    required this.focusColor,
    required this.isNeon,
    required this.watchedBehavior,
    required this.isMobile,
    required this.buildGridCard,
    required this.getItemAspectRatio,
  });

  @override
  State<_GroupedCategoryRow> createState() => _GroupedCategoryRowState();
}

class _GroupedCategoryRowState extends State<_GroupedCategoryRow> {
  late final ScrollController _horizontalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  void _scrollToItemIndex(int itemIndex) {
    if (!_horizontalController.hasClients) return;
    final itemExtent = widget.cardWidth + _kGroupedRowCardGap;
    final maxOffset = _horizontalController.position.maxScrollExtent;
    final target = (itemIndex * itemExtent).clamp(0.0, maxOffset);
    _horizontalController.animateTo(
      target,
      duration: const Duration(milliseconds: 160),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(widget.gridPadding, 12, widget.gridPadding, 8),
          child: Row(
            children: [
              Text(
                widget.categoryKey,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${widget.items.length})',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withAlpha(128),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.rowContainerHeight,
          child: ListView.builder(
            controller: _horizontalController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: widget.gridPadding, vertical: 12),
            itemCount: widget.items.length,
            // The row's own context is what ensureVisible below needs, so the
            // builder's is left unnamed rather than shadowing it.
            itemBuilder: (_, itemIdx) {
              final item = widget.items[itemIdx];
              final itemAspectRatio = widget.getItemAspectRatio(item);
              return Padding(
                padding: const EdgeInsets.only(right: _kGroupedRowCardGap),
                child: SizedBox(
                  width: widget.cardWidth,
                  child: widget.buildGridCard(
                    item: item,
                    index: widget.focusIndexOffset + itemIdx,
                    positionInSection: itemIdx,
                    sectionCount: widget.items.length,
                    crossAxisCount: widget.items.length,
                    cellWidth: widget.cardWidth,
                    itemAspectRatio: itemAspectRatio,
                    focusColor: widget.focusColor,
                    isNeon: widget.isNeon,
                    watchedBehavior: widget.watchedBehavior,
                    isMobile: widget.isMobile,
                    paginateOnEdge: false,
                    onCardFocused: () {
                      _scrollToItemIndex(itemIdx);
                      if (!mounted) return;
                      unawaited(
                        Scrollable.ensureVisible(
                          context,
                          alignment: 0.05,
                          duration: const Duration(milliseconds: 160),
                          curve: Curves.easeOutCubic,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryTabBar extends StatelessWidget {
  final Map<String, List<AggregatedItem>> groupedCategories;
  final String? selectedTab;
  final ValueChanged<String> onSelectTab;

  const _CategoryTabBar({
    required this.groupedCategories,
    required this.selectedTab,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    if (groupedCategories.isEmpty) return const SizedBox.shrink();
    final keys = groupedCategories.keys.toList();
    final active = selectedTab ?? keys.first;
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
    final hPad = isMobile ? 16.0 : _horizontalPadding * desktopScale;

    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 6),
      // A studio grouping can run to hundreds of chips, so the row stays lazy
      // and each chip pulls itself into view as it takes focus.
      child: FocusTraversalGroup(
        policy: ReadingOrderTraversalPolicy(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: keys.length,
          itemBuilder: (context, index) {
            final key = keys[index];
            final isSelected = key == active;
            final count = groupedCategories[key]?.length ?? 0;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _CategoryChip(
                label: '$key ($count)',
                isSelected: isSelected,
                onTap: () => onSelectTab(key),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<_CategoryChip> with FocusStateMixin {
  void _onFocusChange(bool hasFocus) {
    setFocused(hasFocus);
    if (!hasFocus || !mounted) return;
    unawaited(
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showActive = focused || hovered;
    final accent = AppColorScheme.accent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setHovered(true),
      onExit: (_) => setHovered(false),
      child: Focus(
        onFocusChange: _onFocusChange,
        onKeyEvent: (_, event) {
          if (isActivateKey(event)) {
            widget.onTap();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedScale(
            scale: showActive ? 1.06 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: showActive
                    ? (widget.isSelected ? accent : Colors.white.withValues(alpha: 0.28))
                    : (widget.isSelected ? accent.withValues(alpha: 0.65) : Colors.white.withValues(alpha: 0.08)),
                borderRadius: AppRadius.circular(16),
                border: Border.all(
                  color: showActive
                      ? Colors.white
                      : (widget.isSelected ? accent : Colors.transparent),
                  width: showActive ? 2.5 : 1.5,
                ),
                boxShadow: showActive
                    ? [
                        BoxShadow(
                          color: (widget.isSelected ? accent : Colors.white).withValues(alpha: 0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: widget.isSelected || showActive ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
