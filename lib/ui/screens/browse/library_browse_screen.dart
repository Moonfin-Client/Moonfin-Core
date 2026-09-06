import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import '../../widgets/bounded_network_image.dart';
import '../../widgets/offline_aware_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
import '../../widgets/quick_return_wrapper.dart';
import '../../widgets/rating_display.dart';
import '../detail/item_detail_screen.dart';
import '../../widgets/local_search_field.dart';
import '../../../l10n/app_localizations.dart';

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
    with GridFocusNodeMixin<LibraryBrowseScreen> {
  late final LibraryBrowseViewModel _vm;
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  final _homeButtonFocusNode = FocusNode(debugLabel: 'library_home_button');
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
  }

  final _allLetterFocusNode = FocusNode(debugLabel: 'alpha_all_letter');

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _homeButtonFocusNode.dispose();
    _allLetterFocusNode.dispose();
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _hasSubtitlesCache = null;
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
  /// leading edge, loading pages first if it hasn't arrived yet.
  Future<void> _jumpToLetter(String letter) async {
    // Scrubbing along the alphabet bar starts a jump per letter, and an older
    // one would keep re-asserting its own offset against the newest, so each
    // jump checks in after every await and bows out once superseded.
    final generation = ++_letterJumpGeneration;
    bool stillCurrent() => mounted && generation == _letterJumpGeneration;

    _vm.setLetterFilter(letter);
    if (!mounted) return;
    setState(() => _isJumpingToLetter = true);

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
  KeyEventResult _onTvSearchKey(FocusNode node, KeyEvent event) {
    if (!event.isActionable) return KeyEventResult.ignored;
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
      context.push(Destinations.folder(item.id));
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

  /// Width to ask the server for, covering [cellWidth] at this display's
  /// density. Rounded up in coarse steps so the server keeps serving the sizes
  /// it has already encoded rather than a new one per device.
  int _requestWidthFor(double cellWidth, int step) {
    final pixels = BoundedNetworkImage.physicalPixels(
      cellWidth,
      MediaQuery.devicePixelRatioOf(context),
    );
    return (pixels / step).ceil() * step;
  }

  String? _imageUrl(AggregatedItem item, {double? cellWidth}) {
    final api = _vm.imageApi;
    final width = cellWidth ?? _cardWidth();
    final posterMaxW = _requestWidthFor(width, 140);
    final landscapeMaxW = _requestWidthFor(width, 240);

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
  Widget build(BuildContext context) =>
      RequestInitialFocus(
        targetNode: _homeButtonFocusNode,
        child: QuickReturnWrapper(
          scrollController: _scrollController,
          scrollDirection:
              _vm.scrollDirection == LibraryScrollDirection.horizontal
              ? Axis.horizontal
              : Axis.vertical,
          // cleanupGridFocusNodes disposes node 0 once the list empties, and
          // the wrapper would keep holding it, so pass nothing instead.
          topFocusNode: _vm.items.isNotEmpty ? getGridItemFocusNode(0) : null,
          child: _buildContent(context),
        ),
      );

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final hasBackdrop = !isMobile && !hideBackdrops && _backdropUrl != null;
    final blurAmount = _prefs
      .get(UserPreferences.browsingBackgroundBlurAmount)
      .toDouble();
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
          Column(
            children: [
              _LibraryHeader(
                libraryName: () {
                  if (_vm.favoritesOnly) {
                    return AppLocalizations.of(context).favorites;
                  }
                  if (_vm.includeItemTypes != null &&
                      _vm.includeItemTypes!.isNotEmpty) {
                    final type = _vm.includeItemTypes!.first;
                    if (type == 'MusicAlbum') {
                      return AppLocalizations.of(context).albums;
                    } else if (type == 'AlbumArtist') {
                      return AppLocalizations.of(context).albumArtists;
                    } else if (type == 'MusicArtist') {
                      return AppLocalizations.of(context).artists;
                    } else if (type == 'Audio') {
                      return AppLocalizations.of(context).songs;
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
                allLetterFocusNode: _allLetterFocusNode,
                homeFocusNode: _homeButtonFocusNode,
                onTvSearchKey: _onTvSearchKey,
                isMusicBrowse: _vm.isMusicBrowse,
                playedFilter: _vm.playedFilter,
                searchController: _searchController,
                searchFocusNode: _searchFocusNode,
                onSearchChanged: (query) => _vm.setSearchQuery(query),
                onBack: () => PlatformDetection.isWeb
                    ? context.popOrHome()
                    : context.pop(),
                onSort: () => _showFilterSortDialog(context),
                onGroupBy: () => _showGroupByDialog(),
                isMovieOrSeriesLibrary: _vm.isMovieOrSeriesLibrary,
                onSettings: () => _showSettingsDialog(context),
                onShuffle: _isSongsBrowse ? () => _shuffleSongsLibrary() : null,
                isSongsBrowse: _isSongsBrowse,
                onLetterChanged: (l) => _jumpToLetter(l),
                onPlayedFilterChanged: (status) => _vm.setPlayedFilter(status),
              ),
              Expanded(child: _buildBody()),
            ],
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
        fields: 'PrimaryImageAspectRatio,SortName,Type,IsFolder,UserData,CommunityRating,OfficialRating,RunTimeTicks,ProductionYear,ProviderIds,ImageTags,BackdropImageTags,ParentBackdropItemId,ParentBackdropImageTags,ParentThumbItemId,ParentThumbImageTag,SeriesId,SeriesPrimaryImageTag,Album,AlbumId,AlbumArtist,Artists',
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
    showDialog<void>(
      context: context,
      builder: (context) => _GroupByDialog(vm: _vm),
    );
  }

  /// The chevrons drive [_scrollController], which only runs horizontally for
  /// the plain horizontal grid. Grouped rows and the songs list keep the
  /// controller on a vertical list, so pointing left and right at it there
  /// would scroll the page up and down instead.
  bool get _horizontalGridIsScrollable =>
      _vm.scrollDirection == LibraryScrollDirection.horizontal &&
      !_isSongsBrowse &&
      !_vm.isGrouping;

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
    final spinnerColor = _vm.isBookLibrary ? const Color(0xFFD97706) : _jellyfinBlue;
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
            LibraryBrowseState.loading => Center(
                child: CircularProgressIndicator(color: spinnerColor),
              ),
            LibraryBrowseState.error => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _vm.isNetworkError
                          ? AppLocalizations.of(context).unableToConnectToServer
                          : _vm.errorMessage ?? AppLocalizations.of(context).failedToLoadLibrary,
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
          padding: EdgeInsets.fromLTRB(hPad, 8, hPad, 32),
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
                onArrowUp: index == 0
                    ? () {
                        if (_allLetterFocusNode.context != null) {
                          _allLetterFocusNode.requestFocus();
                        } else {
                          _homeButtonFocusNode.requestFocus();
                        }
                      }
                    : null,
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
        final textHeight = (_hasSubtitles ? 42.0 : 24.0) * desktopTextScale;
        final cellHeight = cellWidth / ar + textHeight;
        final childAspectRatio = cellWidth / cellHeight;
        // A focused card grows about its center and paints past its cell, so
        // the viewport clips the top row and the row below covers the title
        // under the row above it. The grid reserves that much room instead.
        // Mobile keeps its layout, since a touch press only scales while the
        // finger is down.
        final focusOverhang = isMobile
            ? 0.0
            : MediaCard.focusGap(cellHeight, minimum: 0.0);
        final rowSpacing = math.max(8.0, focusOverhang);
        _gridGeometry = (
          perLine: crossAxisCount,
          lineExtent: cellHeight,
          lineSpacing: rowSpacing,
          leadingPad: 8 + focusOverhang,
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
          final slivers = <Widget>[];

          groupedMap.forEach((categoryKey, categoryItems) {
            final categoryTitle = switch (categoryKey) {
              'Video' => l10n.videoPlaylistsSection,
              'Audio' => l10n.audioPlaylistsSection,
              'AudioBook' => l10n.audiobookPlaylistsSection,
              'Book' => l10n.bookPlaylistsSection,
              'Photo' => l10n.photoPlaylistsSection,
              _ => l10n.mixedPlaylistsSection,
            };

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
                padding: EdgeInsets.fromLTRB(gridPadding, 0, gridPadding, 16),
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
                      );
                    },
                    childCount: categoryItems.length,
                  ),
                ),
              ),
            );
          });

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

          return CustomScrollView(
            controller: _scrollController,
            slivers: slivers,
          );
        }

        final itemsToDisplay =
            _vm.isGrouping ? _vm.currentCategoryItems : gridItems;

        final verticalScrollView = CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                gridPadding,
                8 + focusOverhang,
                gridPadding,
                math.max(16.0, focusOverhang),
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
  }) {
    // Section headers throw off the uniform row maths in _scrollToGridRow, so a
    // grouped card asks the viewport to reveal it and needs its own context.
    // Every other grid keeps the row scrolling and skips the extra element.
    final isGrouped =
        (_vm.isPlaylistBrowse && _vm.groupByType) || _vm.isGrouping;

    Widget card(BuildContext? revealContext) {
      return MediaCard(
        title: item.name,
        subtitle: _cardSubtitle(item),
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
          if (PlatformDetection.isTV &&
              event.isActionable &&
              event.logicalKey.isUpKey &&
              positionInSection < crossAxisCount) {
            _homeButtonFocusNode.requestFocus();
            return KeyEventResult.handled;
          }
          if (PlatformDetection.isTV &&
              event.isActionable &&
              event.logicalKey.isBackKey &&
              _allLetterFocusNode.context != null) {
            _allLetterFocusNode.requestFocus();
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

  Widget _buildGroupedHorizontalRows() {
    final categories = _vm.groupedCategories;
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
    final textHeight = (_hasSubtitles ? 42.0 : 24.0) * desktopTextScale;
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
        padding: EdgeInsets.symmetric(vertical: gridPadding),
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
      return _buildGroupedHorizontalRows();
    }
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
        final ar = _gridBaseAspectRatio();
        final desktopTextScale = MediaQuery.textScalerOf(context).scale(1.0);
        final textHeight = (_hasSubtitles ? 46.0 : 30.0) * desktopTextScale;

        final cellWidth = _cardWidth();
        final spacing = cardFocusExpansion && !isMobile
            ? MediaCard.focusGap(cellWidth)
            : 12.0;
        final targetImageHeight = cellWidth / ar;
        final targetCellHeight = targetImageHeight + textHeight;

        final availableHeight = constraints.maxHeight - vertPadding * 2;
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
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  horizPadding, vertPadding, horizPadding, vertPadding,
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
                      if (index >= _vm.items.length) return null;
                      final item = _vm.items[index];
                      return MediaCard(
                        title: item.name,
                        subtitle: _cardSubtitle(item),
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
                          if (!_vm.hasMore && !_vm.loadingMore) {
                            return KeyEventResult.ignored;
                          }
                          if (!event.isActionable ||
                              !event.logicalKey.isRightKey) {
                            return KeyEventResult.ignored;
                          }
                          final col = index ~/ rowCount;
                          final isLastCol =
                              (col + 1) * rowCount >= _vm.items.length;
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
                    childCount: _vm.items.length,
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

  void _showFilterSortDialog(BuildContext context) {
    showFocusRestoringDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => _FilterSortDialog(vm: _vm),
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
  final LibrarySortBy sortBy;
  final String letterFilter;
  final FocusNode? allLetterFocusNode;
  final bool isMusicBrowse;
  final PlayedStatusFilter playedFilter;
  final VoidCallback? onGroupBy;
  final bool isMovieOrSeriesLibrary;
  final VoidCallback onBack;
  final VoidCallback onSort;
  final VoidCallback onSettings;
  final VoidCallback? onShuffle;
  final ValueChanged<String> onLetterChanged;
  final ValueChanged<PlayedStatusFilter> onPlayedFilterChanged;
  final FocusNode? homeFocusNode;
  final KeyEventResult Function(FocusNode, KeyEvent)? onTvSearchKey;
  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final ValueChanged<String>? onSearchChanged;

  /// Songs render as one flat track list where a letter jump has nowhere
  /// sensible to land, so the alphabet bar stays hidden there.
  final bool isSongsBrowse;

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
    this.allLetterFocusNode,
    this.homeFocusNode,
    this.onTvSearchKey,
    this.isMusicBrowse = false,
    this.playedFilter = PlayedStatusFilter.all,
    this.onGroupBy,
    this.isMovieOrSeriesLibrary = false,
    required this.onBack,
    required this.onSort,
    required this.onSettings,
    this.onShuffle,
    required this.onLetterChanged,
    required this.onPlayedFilterChanged,
    this.searchController,
    this.searchFocusNode,
    this.onSearchChanged,
    this.isSongsBrowse = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    final isCompactLandscape = isMobile && isLandscape;
    final isCompactPortrait = isMobile && !isLandscape;
    final prefs = GetIt.instance<UserPreferences>();
    final showAlpha =
        !isSongsBrowse &&
        prefs.get(UserPreferences.showAlphabeticalFilters) &&
        (isMusicBrowse ||
            sortBy == LibrarySortBy.name ||
            sortBy == LibrarySortBy.albumArtist ||
            sortBy == LibrarySortBy.album);
    final showInlineAlpha = showAlpha && (!isMobile || isCompactLandscape);
    final showBelowAlpha = showAlpha && isCompactPortrait;
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
            mainAxisAlignment: (isMobile && !showInlineAlpha)
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
              if (isMovieOrSeriesLibrary && onGroupBy != null) ...[
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
                  child: _AlphaPickerBar(
                    onChanged: onLetterChanged,
                    allFocusNode: allLetterFocusNode,
                    onUpKey: _focusSearch,
                  ),
                ),
              ],
            ],
          ),
          if (showBelowAlpha) ...[
            const SizedBox(height: 8),
            _AlphaPickerBar(
              onChanged: onLetterChanged,
              allFocusNode: allLetterFocusNode,
              onUpKey: _focusSearch,
            ),
          ],
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
            '$totalCount Items',
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

class _AlphaPickerBar extends StatelessWidget {
  final FocusNode? allFocusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback? onUpKey;

  const _AlphaPickerBar({
    required this.onChanged,
    this.allFocusNode,
    this.onUpKey,
  });

  static const _letters = [
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
          return _AlphaLetterButton(
            label: letter.isEmpty ? AppLocalizations.of(context).all : letter,
            onTap: () => onChanged(letter),
            focusNode: letter.isEmpty ? allFocusNode : null,
            onUpKey: onUpKey,
          );
        }).toList(),
      ),
    );
  }
}

class _AlphaLetterButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onUpKey;

  const _AlphaLetterButton({
    required this.label,
    required this.onTap,
    this.focusNode,
    this.onUpKey,
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
        focusNode: widget.focusNode,
        onFocusChange: (f) => setFocused(f),
        onKeyEvent: (_, event) {
          if (event.isActionable && event.logicalKey.isUpKey && widget.onUpKey != null) {
            widget.onUpKey!();
            return KeyEventResult.handled;
          }
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
              borderRadius: AppRadius.circular(4),
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
                fontWeight: focused || hovered ? FontWeight.w700 : FontWeight.w500,
                color: focused || hovered ? _jellyfinBlue : AppColorScheme.onSurface.withValues(alpha: 0.85),
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
  /// A library can hold hundreds of tags or years, so the facet sections start
  /// closed and only the ones opened take up the dialog.
  final _expandedFacets = <String>{};

  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_rebuild);
    unawaited(widget.vm.ensureFacetValuesLoaded());
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
            Divider(color: dividerColor),
            _sectionHeader(l10n.sortBy, sectionColor),
            for (final option in vm.sortOptions)
              _DialogRadioTile(
                label: () {
                  if (option == LibrarySortBy.runtime &&
                      (vm.isMusicBrowse || vm.isSongsBrowse)) {
                    return 'Length';
                  }
                  if (option == LibrarySortBy.premiereDate &&
                      (vm.isMusicBrowse || vm.isSongsBrowse)) {
                    return 'Release Date';
                  }
                  return option.displayName;
                }(),
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
            if (!vm.favoritesOnly) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.filters, sectionColor),
              _DialogCheckboxTile(
                label: l10n.favorites,
                checked: vm.favoriteFilter,
                onTap: () => vm.setFavoriteFilter(!vm.favoriteFilter),
                accent: accent,
                onSurface: onSurface,
              ),
            ],
            if (!vm.isMusicBrowse) ...[
              Divider(color: dividerColor),
              _sectionHeader(
                isBookBrowse ? l10n.readingStatus : l10n.playedStatus,
                sectionColor,
              ),
              for (final status in PlayedStatusFilter.values)
                _DialogRadioTile(
                  label: switch (status) {
                    PlayedStatusFilter.all => l10n.all,
                    PlayedStatusFilter.watched =>
                      isBookBrowse ? l10n.readStatus : l10n.watched,
                    PlayedStatusFilter.unwatched =>
                      isBookBrowse ? l10n.unread : l10n.unwatched,
                    PlayedStatusFilter.inProgress => l10n.filterInProgress,
                },
                selected: vm.playedFilter == status,
                onTap: () => vm.setPlayedFilter(status),
                accent: accent,
                onSurface: onSurface,
              ),
            ],
            Divider(color: dividerColor),
            _sectionHeader(l10n.personalRatingMine, sectionColor),
            for (final status in LikedStatusFilter.values)
              _DialogRadioTile(
                label: switch (status) {
                  LikedStatusFilter.all => l10n.all,
                  LikedStatusFilter.liked => l10n.like,
                  LikedStatusFilter.disliked => l10n.dislike,
                },
                selected: vm.likedFilter == status,
                onTap: () => vm.setLikedFilter(status),
                accent: accent,
                onSurface: onSurface,
              ),
            if (vm.isSeriesLibrary) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.seriesStatus, sectionColor),
              for (final status in SeriesStatusFilter.values)
                if (status != SeriesStatusFilter.unreleased ||
                    vm.supportsUnreleasedSeriesFilter)
                  _DialogRadioTile(
                    label: switch (status) {
                      SeriesStatusFilter.all => l10n.all,
                      SeriesStatusFilter.continuing => l10n.continuing,
                      SeriesStatusFilter.ended => l10n.ended,
                      SeriesStatusFilter.unreleased => l10n.filterUnreleased,
                    },
                    selected: vm.seriesFilter == status,
                    onTap: () => vm.setSeriesFilter(status),
                    accent: accent,
                    onSurface: onSurface,
                  ),
            ],
            if (vm.supportsVideoFilters) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.features, sectionColor),
              for (final option in LibraryFeatureFilter.values)
                _DialogCheckboxTile(
                  label: switch (option) {
                    LibraryFeatureFilter.subtitles => l10n.subtitles,
                    LibraryFeatureFilter.trailer => l10n.filterTrailers,
                    LibraryFeatureFilter.extras => l10n.filterExtras,
                    LibraryFeatureFilter.themeSong => l10n.filterThemeSongs,
                    LibraryFeatureFilter.themeVideo => l10n.filterThemeVideos,
                  },
                  checked: vm.featureFilters.contains(option),
                  onTap: () => vm.toggleFeatureFilter(option),
                  accent: accent,
                  onSurface: onSurface,
                ),
              Divider(color: dividerColor),
              _sectionHeader(l10n.quality, sectionColor),
              for (final option in LibraryVideoQualityFilter.values)
                if (option != LibraryVideoQualityFilter.uhd ||
                    vm.supportsUhdFilter)
                  _DialogCheckboxTile(
                    label: switch (option) {
                      LibraryVideoQualityFilter.sd => 'SD',
                      LibraryVideoQualityFilter.hd => 'HD',
                      LibraryVideoQualityFilter.uhd => '4K',
                      LibraryVideoQualityFilter.threeD => '3D',
                    },
                    checked: vm.videoQualityFilters.contains(option),
                    onTap: () => vm.toggleVideoQualityFilter(option),
                    accent: accent,
                    onSurface: onSurface,
                  ),
              Divider(color: dividerColor),
              _sectionHeader(l10n.source, sectionColor),
              for (final option in LibraryVideoSourceFilter.values)
                _DialogCheckboxTile(
                  label: option.displayName,
                  checked: vm.videoSourceFilters.contains(option),
                  onTap: () => vm.toggleVideoSourceFilter(option),
                  accent: accent,
                  onSurface: onSurface,
                ),
            ],
            ..._facetSection(
              key: 'genres',
              title: l10n.genres,
              values: vm.facetValues.genres,
              selected: vm.genreFilters,
              onToggle: vm.toggleGenreFilter,
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
            ),
            ..._facetSection(
              key: 'ratings',
              title: l10n.groupByParentalRating,
              values: vm.facetValues.officialRatings,
              selected: vm.officialRatingFilters,
              onToggle: vm.toggleOfficialRatingFilter,
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
            ),
            ..._facetSection(
              key: 'tags',
              title: l10n.tags,
              values: vm.facetValues.tags,
              selected: vm.tagFilters,
              onToggle: vm.toggleTagFilter,
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
            ),
            ..._facetSection(
              key: 'years',
              title: l10n.years,
              values: vm.facetValues.years.map((e) => e.toString()).toList(),
              selected: vm.yearFilters,
              onToggle: vm.toggleYearFilter,
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
            ),
            ..._facetSection(
              key: 'audio',
              title: l10n.audioLanguage,
              values: vm.facetValues.audioLanguages
                  .map((e) => e.value)
                  .toList(),
              labels: {
                for (final e in vm.facetValues.audioLanguages) e.value: e.name,
              },
              selected: vm.audioLanguageFilters,
              onToggle: vm.toggleAudioLanguageFilter,
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
            ),
            ..._facetSection(
              key: 'subtitles',
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
              dividerColor: dividerColor,
              sectionColor: sectionColor,
              accent: accent,
              onSurface: onSurface,
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
            if (vm.isGenreBrowse && vm.libraries.isNotEmpty) ...[
              Divider(color: dividerColor),
              _sectionHeader(l10n.library, sectionColor),
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

  /// One collapsible group per facet, left out entirely when the library holds
  /// no values for it. The key tracks what is open, so a translated title
  /// never closes a section behind the user.
  List<Widget> _facetSection({
    required String key,
    required String title,
    required List<String> values,
    required Set<String> selected,
    required Future<void> Function(String) onToggle,
    required Color dividerColor,
    required Color sectionColor,
    required Color accent,
    required Color onSurface,
    Map<String, String> labels = const {},
  }) {
    if (values.isEmpty) return const [];
    final expanded = _expandedFacets.contains(key);
    final chosen = values.where(selected.contains).length;
    return [
      Divider(color: dividerColor),
      _DialogExpanderTile(
        label: title,
        selectedCount: chosen,
        expanded: expanded,
        onTap: () => setState(() {
          if (!_expandedFacets.remove(key)) _expandedFacets.add(key);
        }),
        sectionColor: sectionColor,
        accent: accent,
      ),
      if (expanded)
        for (final value in values)
          _DialogCheckboxTile(
            label: labels[value] ?? value,
            checked: selected.contains(value),
            onTap: () => onToggle(value),
            accent: accent,
            onSurface: onSurface,
          ),
    ];
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
  final int selectedCount;
  final bool expanded;
  final VoidCallback onTap;
  final Color sectionColor;
  final Color accent;

  const _DialogExpanderTile({
    required this.label,
    required this.selectedCount,
    required this.expanded,
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
                if (widget.selectedCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      '${widget.selectedCount}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: widget.accent,
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
              for (final size in PosterSize.values)
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
    return _DialogRadioTile(
      label: type.name[0].toUpperCase() + type.name.substring(1),
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
      PosterSize.extraLarge => AppLocalizations.of(context).extraLarge,
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

    final options = [
      (LibraryGroupBy.none, l10n.none),
      (LibraryGroupBy.decade, l10n.groupByDecade),
      (LibraryGroupBy.genres, l10n.genres),
      (LibraryGroupBy.parentalRatings, l10n.groupByParentalRating),
      (LibraryGroupBy.studio, l10n.groupByStudio),
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
                label: opt.$2,
                selected: vm.groupBy == opt.$1,
                onTap: () {
                  vm.setGroupBy(opt.$1);
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
