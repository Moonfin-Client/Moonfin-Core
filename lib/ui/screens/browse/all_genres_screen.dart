import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

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
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;
const _kCompactBreakpoint = 600.0;
const _genresPageSize = 200;
const _initialArtworkBatch = 18;
const _backgroundArtworkConcurrency = 6;

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
          fields: 'ItemCounts',
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

      _genres = items.map((g) {
        final data = g as Map<String, dynamic>;
        final itemCount = browsableGenreCount(
          data,
          normalizedItemTypes: kBrowsableGenreItemTypes,
        );
        return GenreCardData(
          id: data['Id'] as String,
          name: data['Name'] as String? ?? '',
          itemCount: itemCount,
        );
      }).where((genre) => genre.itemCount > 0).toList();
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
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        limit: 4,
        fields: 'PrimaryImageTag,ImageTags,BackdropImageTags',
        enableImageTypes: 'Primary,Backdrop',
        imageTypeLimit: 1,
      );

      final items = (response['Items'] as List?) ?? [];
      final rawTotalCount = response['TotalRecordCount'];
      final totalCount =
          rawTotalCount is num ? rawTotalCount.toInt() : items.length;
      if (totalCount <= 0 || items.isEmpty) {
        if (_genres.remove(genre) && !_disposed && mounted) {
          setState(() {});
        }
        return;
      }

      genre.itemCount = totalCount;
      String? imageUrl;
      for (final raw in items) {
        final item = raw as Map<String, dynamic>;
        final backdropUrl = _backdropUrlFor(item);
        genre.backdropUrl ??= backdropUrl;
        imageUrl ??= _imageUrlFor(item, _imageType, backdropUrl: backdropUrl);
        if (imageUrl != null && genre.backdropUrl != null) {
          break;
        }
      }
      genre.imageUrl = imageUrl ?? genre.backdropUrl;
      if (!_disposed && mounted) setState(() {});
    } catch (_) {}
  }

  String? _tagForType(Map<String, dynamic> item, String imageType) {
    final tags = item['ImageTags'];
    if (tags is! Map) return null;
    return tags[imageType] as String?;
  }

  String? _backdropUrlFor(Map<String, dynamic> item) {
    final tags = (item['BackdropImageTags'] as List?) ?? const [];
    if (tags.isEmpty) {
      return null;
    }
    return _client.imageApi.getBackdropImageUrl(
      item['Id'] as String,
      maxWidth: BackgroundService.backdropMaxWidth,
      tag: tags.first as String,
    );
  }

  String? _imageUrlFor(
    Map<String, dynamic> item,
    ImageType imageType, {
    String? backdropUrl,
  }) {
    final itemId = item['Id'] as String;
    final primaryTag = item['PrimaryImageTag'] as String?;
    final thumbTag = _tagForType(item, 'Thumb');
    final bannerTag = _tagForType(item, 'Banner');
    final maxWidth = _genreCardRequestMaxWidth();
    final resolvedBackdropUrl = backdropUrl ?? _backdropUrlFor(item);

    return switch (imageType) {
      ImageType.poster =>
        primaryTag != null
            ? _client.imageApi.getPrimaryImageUrl(
                itemId,
                tag: primaryTag,
                maxWidth: maxWidth,
              )
            : resolvedBackdropUrl ??
                  (thumbTag != null
                      ? _client.imageApi.getThumbImageUrl(
                          itemId,
                          tag: thumbTag,
                          maxWidth: maxWidth,
                        )
                      : null),
      ImageType.thumb =>
        thumbTag != null
            ? _client.imageApi.getThumbImageUrl(
                itemId,
                tag: thumbTag,
                maxWidth: maxWidth,
              )
            : resolvedBackdropUrl ??
                  (primaryTag != null
                      ? _client.imageApi.getPrimaryImageUrl(
                          itemId,
                          tag: primaryTag,
                          maxWidth: maxWidth,
                        )
                      : null),
      ImageType.banner =>
        bannerTag != null
            ? _client.imageApi.getBannerImageUrl(
                itemId,
                tag: bannerTag,
                maxWidth: maxWidth,
              )
            : resolvedBackdropUrl ??
                  (primaryTag != null
                      ? _client.imageApi.getPrimaryImageUrl(
                          itemId,
                          tag: primaryTag,
                          maxWidth: maxWidth,
                        )
                      : null),
    };
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
