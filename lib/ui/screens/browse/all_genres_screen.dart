import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/models/aggregated_item.dart';
import '../../../auth/repositories/user_repository.dart';
import '../../../data/services/background_service.dart';
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
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;
const _genresPageSize = 200;
const _initialArtworkBatch = 12;
const _backgroundArtworkConcurrency = 4;

bool _isCompact(BuildContext context) =>
    PlatformDetection.useMobileUi ||
    MediaQuery.sizeOf(context).width < _kCompactBreakpoint;

class AllGenresScreen extends StatefulWidget {
  const AllGenresScreen({super.key});

  @override
  State<AllGenresScreen> createState() => _AllGenresScreenState();
}

class _AllGenresScreenState extends State<AllGenresScreen> {
  final _client = GetIt.instance<MediaServerClient>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  final _prefs = GetIt.instance<UserPreferences>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;
  bool _disposed = false;

  ImageType get _imageType => _prefs.get(UserPreferences.allGenresImageType);

  PosterSize get _posterSize => _prefs.resolveLibraryPosterSize();

  List<GenreCardData> _genres = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _backgroundSub = _backgroundService.backgroundStream.listen((url) {
      if (mounted) setState(() => _backdropUrl = url);
    });
    _backdropUrl = _backgroundService.currentUrl;
    _load();
  }

  @override
  void dispose() {
    _disposed = true;
    _backgroundSub?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    try {
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
          includeItemTypes: kBrowsableGenreItemTypes,
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
              normalizedItemTypes: kBrowsableGenreItemTypes,
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
          itemCount: 0,
          imageUrl: imageUrl,
          backdropUrl: backdropUrl,
          isGenreFallback: !hasCustomArtwork,
        );
      }).toList();
    } catch (_) {}

    _isLoading = false;
    if (!_disposed && mounted) setState(() {});

    _loadGenreArtwork();
  }

  Future<void> _loadGenreArtwork() async {
    final toLoad = _genres.take(_initialArtworkBatch).toList();
    await Future.wait(toLoad.map(_loadGenreItems));

    if (!_disposed && _genres.length > _initialArtworkBatch) {
      unawaited(
        _loadGenreArtworkAsync(_genres.skip(_initialArtworkBatch).toList()),
      );
    }
  }

  Future<void> _loadGenreArtworkAsync(List<GenreCardData> remaining) async {
    for (
      var i = 0;
      i < remaining.length && !_disposed;
      i += _backgroundArtworkConcurrency
    ) {
      final batch = remaining.skip(i).take(_backgroundArtworkConcurrency);
      await Future.wait(batch.map(_loadGenreItems));
    }
  }

  Future<void> _loadGenreItems(GenreCardData genre) async {
    if (_disposed) return;
    try {
      final response = await _client.itemsApi.getItems(
        genreIds: [genre.id],
        includeItemTypes: kBrowsableGenreItemTypes,
        excludeItemTypes: ['Episode'],
        sortBy: 'Random',
        sortOrder: 'Ascending',
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

      if (genre.isGenreFallback) {
        final maps = List<Map<String, dynamic>>.from(
          items.whereType<Map>().map((item) => item.cast<String, dynamic>()),
        );
        maps.shuffle();

        final (imageUrl, backdropUrl) = resolveGenreFallbackArtwork(
          items: maps,
          imageApi: _client.imageApi,
          maxWidth: _genreCardRequestMaxWidth(),
        );

        genre.imageUrl = imageUrl;
        genre.backdropUrl = backdropUrl;
      }

      if (!_disposed && mounted) setState(() {});
    } catch (_) {}
  }

  String? _tagForType(Map<String, dynamic> item, String imageType) {
    final tags = item['ImageTags'];
    if (tags is! Map) return null;
    return tags[imageType] as String?;
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
      ImageType.banner => posterSize.landscapeHeight * (16 / 9),
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * _desktopUiScaleFactor();
  }

  double _cardAspectRatio() {
    return switch (_imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => 16 / 9,
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
      await _loadGenreArtwork();
    }

    if (previousPosterSize != _posterSize || previousImageType != _imageType) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = _desktopUiScaleFactor();
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
      return Center(
        child: CircularProgressIndicator(color: AppColorScheme.accent),
      );
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
        final minColumns = isMobile ? 1 : 2;
        final maxColumns = isMobile ? 4 : 8;
        final crossAxisCount =
            ((constraints.maxWidth - hPad * 2 + spacing) /
                    (_cardWidth() + spacing))
                .floor()
                .clamp(minColumns, maxColumns);

        return GridView.builder(
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
