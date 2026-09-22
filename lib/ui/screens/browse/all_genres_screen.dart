import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/models/aggregated_item.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/background_service.dart';
import '../../../data/services/log_service.dart';
import '../../../data/utils/genre_browse_utils.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/focus/focusable_toolbar_button.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/genre_grid_card.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/poster_size_settings_dialog.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../widgets/quick_return_wrapper.dart';
import '../../widgets/skeleton/skeleton_library_grid.dart';
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;
const _genresPageSize = 200;
const _initialArtworkBatch = 12;
const _backgroundArtworkConcurrency = 4;

/// Only movies and series can be opened from this screen, so counting anything
/// else puts genres in the grid that lead nowhere.
const _videoGenreItemTypes = ['Movie', 'Series'];

bool _isCompact(BuildContext context) =>
    !PlatformDetection.isTV &&
    (PlatformDetection.useMobileUi ||
        MediaQuery.sizeOf(context).width < _kCompactBreakpoint);

class AllGenresScreen extends StatefulWidget {
  const AllGenresScreen({super.key});

  @override
  State<AllGenresScreen> createState() => _AllGenresScreenState();
}

class _AllGenresScreenState extends State<AllGenresScreen> {
  final _client = GetIt.instance<MediaServerClient>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _scrollController = ScrollController();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;
  bool _disposed = false;

  ImageType get _imageType => _prefs.get(UserPreferences.allGenresImageType);

  PosterSize get _posterSize => _prefs.resolveLibraryPosterSize();

  List<GenreCardData> _genres = [];
  bool _isLoading = true;
  bool _lastGroupCollections = false;
  final Set<String> _usedArtworkIds = {};

  /// A grouping toggle starts a second load, so the first stops writing.
  int _loadToken = 0;

  void _onChanged() {
    if (!mounted) return;
    final currentGroup =
        _prefs.get(UserPreferences.groupItemsIntoCollections);
    if (_lastGroupCollections != currentGroup) {
      _lastGroupCollections = currentGroup;
      _load();
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _lastGroupCollections =
        _prefs.get(UserPreferences.groupItemsIntoCollections);
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _prefs.addListener(_onChanged);
    _load();
  }

  @override
  void dispose() {
    _disposed = true;
    _backgroundSub?.cancel();
    _prefs.removeListener(_onChanged);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final token = ++_loadToken;
    try {
      _usedArtworkIds.clear();
      final items = <dynamic>[];
      var startIndex = 0;
      int? total;

      while (true) {
        final response = await _client.itemsApi.getGenres(
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: _genresPageSize,
          fields: 'ItemCounts,PrimaryImageTag,ImageTags,BackdropImageTags,PrimaryImageAspectRatio',
          includeItemTypes: _videoGenreItemTypes,
        );

        total ??= response['TotalRecordCount'] as int?;
        final pageItems = (response['Items'] as List?) ?? const [];
        if (pageItems.isEmpty) break;
        items.addAll(pageItems);

        startIndex += pageItems.length;
        if (pageItems.length < _genresPageSize) break;
        if (total != null && startIndex >= total) break;
      }

      final temp = items
          .map((g) {
            final data = g as Map<String, dynamic>;
            final itemCount = browsableGenreCount(
              data,
              normalizedItemTypes: _videoGenreItemTypes,
            );
            return (
              data: data,
              itemCount: itemCount,
            );
          })
          .where((x) => x.itemCount > 0)
          .toList();

      _genres = temp.map((x) {
        final data = x.data;
        final primaryTag = data['PrimaryImageTag'] as String?;
        final imageTags = data['ImageTags'] as Map?;
        final primaryAr = data['PrimaryImageAspectRatio'] as num?;
        final backdropTags = data['BackdropImageTags'] as List?;

        final customThumb = imageTags?['Thumb'] as String?;
        final hasCustomArtwork = (primaryTag != null && primaryAr != null && primaryAr < 1.0) ||
            (customThumb != null && customThumb.isNotEmpty);

        String? imageUrl;
        String? backdropUrl;

        if (hasCustomArtwork) {
          if (customThumb != null && customThumb.isNotEmpty) {
            imageUrl = _client.imageApi.getThumbImageUrl(
              data['Id']?.toString() ?? '',
              tag: customThumb,
              maxWidth: _genreCardRequestMaxWidth(),
            );
          } else if (primaryTag != null) {
            imageUrl = _client.imageApi.getPrimaryImageUrl(
              data['Id']?.toString() ?? '',
              tag: primaryTag,
              maxWidth: _genreCardRequestMaxWidth(),
            );
          }

          if (backdropTags != null && backdropTags.isNotEmpty) {
            backdropUrl = _client.imageApi.getBackdropImageUrl(
              data['Id']?.toString() ?? '',
              tag: backdropTags.first.toString(),
              maxWidth: 960,
            );
          }
        }

        return GenreCardData(
          id: data['Id']?.toString() ?? '',
          name: data['Name'] as String? ?? '',
          itemCount: x.itemCount,
          imageUrl: imageUrl,
          backdropUrl: backdropUrl,
          isGenreFallback: !hasCustomArtwork,
        );
      }).toList();
    } catch (e) {
      // The screen shows the same empty state either way, so without this a
      // server that refuses the request looks like a library with no genres.
      if (GetIt.instance.isRegistered<LogService>()) {
        GetIt.instance<LogService>().log(
          LogCategory.network,
          'Loading genres failed',
          level: LogLevel.warning,
          error: e,
        );
      }
    }

    if (token != _loadToken) return;
    _isLoading = false;
    if (!_disposed && mounted) setState(() {});

    _loadGenreArtwork(token);
  }

  Future<void> _loadGenreArtwork(int token) async {
    final groupCollections = _lastGroupCollections;

    // A genre with its own artwork already has an exact count from getGenres,
    // so it only needs a query when grouping changes what that count means.
    final needsWork = _genres
        .where((genre) => genre.isGenreFallback || groupCollections)
        .toList();

    if (needsWork.isEmpty) return;

    final toLoad = needsWork.take(_initialArtworkBatch).toList();
    await Future.wait(toLoad.map((genre) => _loadGenreItems(genre, token)));

    if (!_disposed && needsWork.length > _initialArtworkBatch) {
      unawaited(
        _loadGenreArtworkAsync(
          needsWork.skip(_initialArtworkBatch).toList(),
          token,
        ),
      );
    }
  }

  Future<void> _loadGenreArtworkAsync(
    List<GenreCardData> remaining,
    int token,
  ) async {
    for (
      var i = 0;
      i < remaining.length && !_disposed && token == _loadToken;
      i += _backgroundArtworkConcurrency
    ) {
      final batch = remaining.skip(i).take(_backgroundArtworkConcurrency);
      await Future.wait(batch.map((genre) => _loadGenreItems(genre, token)));
    }
  }

  Future<void> _loadGenreItems(GenreCardData genre, int token) async {
    if (_disposed || token != _loadToken) return;
    try {
      final groupCollections = _lastGroupCollections;
      final includeItemTypes = groupCollections
          ? const ['Movie', 'Series', 'BoxSet']
          : _videoGenreItemTypes;

      // This genre has art of its own, so the count is all that is missing.
      if (!genre.isGenreFallback) {
        final response = await _client.itemsApi.getItems(
          genreIds: [genre.id],
          includeItemTypes: includeItemTypes,
          excludeItemTypes: kNonRootBrowseItemTypes,
          collapseBoxSetItems: groupCollections,
          recursive: true,
          limit: 0,
          enableTotalRecordCount: true,
        );

        final rawTotalCount = response['TotalRecordCount'];
        final totalCount = rawTotalCount is num
            ? rawTotalCount.toInt()
            : 0;
        if (totalCount <= 0) {
          if (_genres.remove(genre) && !_disposed && mounted) {
            setState(() {});
          }
          return;
        }

        genre.itemCount = totalCount;
        if (!_disposed && mounted) setState(() {});
        return;
      }

      // Four random items to build the tile from, since this genre has none.
      final response = await _client.itemsApi.getItems(
        genreIds: [genre.id],
        includeItemTypes: includeItemTypes,
        excludeItemTypes: kNonRootBrowseItemTypes,
        sortBy: 'Random',
        sortOrder: 'Ascending',
        collapseBoxSetItems: groupCollections,
        recursive: true,
        limit: 4,
        fields: 'PrimaryImageTag,ImageTags,BackdropImageTags,PrimaryImageAspectRatio',
        enableImageTypes: 'Primary,Backdrop,Thumb',
        imageTypeLimit: 1,
      );

      final items = (response['Items'] as List?) ?? [];
      final rawTotalCount = response['TotalRecordCount'];
      final totalCount = rawTotalCount is num
          ? rawTotalCount.toInt()
          : items.length;
      if (totalCount <= 0 || items.isEmpty) {
        if (_genres.remove(genre) && !_disposed && mounted) {
          setState(() {});
        }
        return;
      }

      genre.itemCount = totalCount;

      final maps = List<Map<String, dynamic>>.from(
        items.whereType<Map>().map((item) => item.cast<String, dynamic>()),
      );
      maps.shuffle();

      final (imageUrl, backdropUrl, usedId) = resolveGenreFallbackArtwork(
        items: maps,
        imageApi: _client.imageApi,
        maxWidth: _genreCardRequestMaxWidth(),
        avoidIds: _usedArtworkIds,
      );

      genre.imageUrl = imageUrl;
      genre.backdropUrl = backdropUrl;
      if (usedId != null) _usedArtworkIds.add(usedId);

      if (!_disposed && mounted) setState(() {});
    } catch (_) {}
  }

  int _genreCardRequestMaxWidth() {
    final requestScale = MediaQuery.devicePixelRatioOf(context).clamp(1.0, 2.0);
    final widthPx = (_cardWidth() * requestScale).round();
    if (widthPx < 160) return 160;
    if (widthPx > 720) return 720;
    return widthPx;
  }

  double _cardWidth() {
    final posterSize = _posterSize;
    final baseWidth = switch (_imageType) {
      ImageType.thumb => posterSize.landscapeHeight * (16 / 9),
      ImageType.banner => kBannerCardHeight * kBannerAspectRatio,
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * _desktopUiScaleFactor();
  }

  double _cardAspectRatio() {
    return switch (_imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => kBannerAspectRatio,
      ImageType.poster => 2 / 3,
    };
  }

  double _desktopUiScaleFactor() {
    return _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
  }

  Future<void> _showSettingsDialog() async {
    final previousPosterSize = _posterSize;
    final previousImageType = _imageType;
    await showFocusRestoringDialog(
      context: context,
      builder: (_) => PosterSizeSettingsDialog(
        prefs: _prefs,
        imageTypePreference: UserPreferences.allGenresImageType,
        posterSizePreference: UserPreferences.libraryPosterSize,
      ),
    );

    if (!mounted) {
      return;
    }

    if (previousImageType != _imageType) {
      for (final genre in _genres) {
        genre.imageUrl = null;
      }
      await _loadGenreArtwork(_loadToken);
    }

    if (previousPosterSize != _posterSize || previousImageType != _imageType) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(
        child: QuickReturnWrapper(
          scrollController: _scrollController,
          child: _buildContent(context),
        ),
      );

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
    final hideBackdrops = _prefs.get(UserPreferences.hideBackdropsInLibraries);
    final hasBackdrop = !isMobile && !hideBackdrops && _backdropUrl != null;
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
              color: _navyBackground.withAlpha(hasBackdrop ? 140 : 191),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  isMobile ? 16.0 : _horizontalPadding,
                  isMobile ? MediaQuery.of(context).padding.top + 8 : 20.0,
                  isMobile ? 16.0 : _horizontalPadding,
                  8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FocusableToolbarButton(
                      icon: Icons.home,
                      size: 42 * desktopScale,
                      iconSize: 24 * desktopScale,
                      tooltip: AppLocalizations.of(context).home,
                      onTap: () => context.go(Destinations.home),
                    ),
                    SizedBox(width: 4 * desktopScale),
                    FocusableToolbarButton(
                      icon: Icons.settings,
                      size: 42 * desktopScale,
                      iconSize: 24 * desktopScale,
                      tooltip: AppLocalizations.of(context).displaySettings,
                      onTap: _showSettingsDialog,
                    ),
                    SizedBox(width: 12 * desktopScale),
                    Text(
                      AppLocalizations.of(context).allGenres,
                      style: TextStyle(
                        fontSize: 26 * desktopScale,
                        fontWeight: FontWeight.w300,
                        color: AppColorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: _buildBody()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const SkeletonLibraryGrid(aspectRatio: 16 / 9);
    }

    if (_genres.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).noGenresFound,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = _isCompact(context);
        final desktopScale = _desktopUiScaleFactor();
        final hPad = isMobile ? 16.0 : _horizontalPadding * desktopScale;
        final spacing = 16.0 * desktopScale;
        final minColumns = _imageType == ImageType.banner
            ? (constraints.maxWidth < 600 ? 1 : 2)
            : (isMobile ? 1 : 2);
        final maxColumns = isMobile ? 4 : 8;
        final crossAxisCount =
            ((constraints.maxWidth - hPad * 2 + spacing) /
                    (_cardWidth() + spacing))
                .floor()
                .clamp(minColumns, maxColumns);

        return GridView.builder(
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(hPad, 20, hPad, 32),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: _cardAspectRatio(),
          ),
          itemCount: _genres.length,
          itemBuilder: (context, index) {
            final genre = _genres[index];
            return GenreGridCard(
              genre: genre,
              cardFocusExpansion: _prefs.get(
                UserPreferences.cardFocusExpansion,
              ),
              onTap: () => context.push(
                Destinations.genre(genre.name, genreId: genre.id),
              ),
              onLongPress: () {
                final serverId = GetIt.instance<UserRepository>().currentUser?.serverId ?? '';
                final aggregatedItem = AggregatedItem(
                  id: genre.id,
                  serverId: serverId,
                  rawData: {
                    'Type': 'Genre',
                    'Name': genre.name,
                    'Id': genre.id,
                  },
                );
                showContextMenu(context, aggregatedItem, onChanged: () => setState(() {}));
              },
              onHover: isMobile
                  ? null
                  : (hovering) {
                      final backgroundUrl = genre.backdropUrl ?? genre.imageUrl;
                      if (hovering && backgroundUrl != null) {
                        _backgroundService.setBackgroundUrl(backgroundUrl);
                      }
                    },
            );
          },
        );
      },
    );
  }
}
