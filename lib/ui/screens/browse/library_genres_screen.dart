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
import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/fullscreen_backdrop_switcher.dart';
import '../../widgets/genre_grid_card.dart';
import '../../widgets/focus/context_menu_sheet.dart';
import '../../../l10n/app_localizations.dart';

Color get _navyBackground => AppColorScheme.background;
const _horizontalPadding = 60.0;
const _mobileHorizontalPadding = 16.0;
const _kCompactBreakpoint = 600.0;
const _initialArtworkBatch = 12;
const _backgroundArtworkConcurrency = 4;

bool _isCompact(BuildContext context) =>
    PlatformDetection.useMobileUi ||
    MediaQuery.sizeOf(context).width < _kCompactBreakpoint;

class LibraryGenresScreen extends StatefulWidget {
  final String libraryId;

  const LibraryGenresScreen({super.key, required this.libraryId});

  @override
  State<LibraryGenresScreen> createState() => _LibraryGenresScreenState();
}

class _LibraryGenresScreenState extends State<LibraryGenresScreen> {
  final _client = GetIt.instance<MediaServerClient>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _backgroundService = GetIt.instance<BackgroundService>();
  StreamSubscription<String?>? _backgroundSub;
  String? _backdropUrl;

  List<GenreCardData> _genres = [];
  bool _isLoading = true;
  String _libraryName = '';
  String? _collectionType;

  bool _disposed = false;

  ImageType get _imageType =>
      _prefs.get(UserPreferences.libraryImageType(widget.libraryId));

  PosterSize get _posterSize => _prefs.resolveLibraryPosterSize();

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
      final parentData = await _client.itemsApi.getItem(widget.libraryId);
      _libraryName = parentData['Name'] as String? ?? '';
      _collectionType = (parentData['CollectionType'] as String?)
          ?.toLowerCase();

      final response = await _client.itemsApi.getGenres(
        parentId: widget.libraryId,
        userId: _client.userId,
        sortBy: 'SortName',
        sortOrder: 'Ascending',
        recursive: true,
        fields: 'ItemCounts,PrimaryImageTag,ImageTags,BackdropImageTags,PrimaryImageAspectRatio',
      );

      final items = (response['Items'] as List?) ?? [];
      final temp = items.map((g) {
        final data = g as Map<String, dynamic>;
        final count = data['ChildCount'] as int? ??
            (data['MovieCount'] as int? ?? 0) +
                (data['SeriesCount'] as int? ?? 0) +
                (data['AlbumCount'] as int? ?? 0) +
                (data['SongCount'] as int? ?? 0) +
                (data['ArtistCount'] as int? ?? 0) +
                (data['MusicVideoCount'] as int? ?? 0);
        return (
          data: data,
          itemCount: count,
        );
      }).where((genre) {
        if (_collectionType == 'music') return true;
        return genre.itemCount > 0;
      }).toList();

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
    } catch (_) {}

    _isLoading = false;
    if (!_disposed && mounted) setState(() {});

    _loadArtwork();
  }

  Future<void> _loadArtwork() async {
    final includeType = _includeType;
    final toLoad = _genres.take(_initialArtworkBatch).toList();
    await Future.wait(
      toLoad.map((genre) => _loadGenreArtwork(genre, includeType)),
    );

    if (!_disposed && _genres.length > _initialArtworkBatch) {
      final remaining = _genres.skip(_initialArtworkBatch).toList();
      for (
        var i = 0;
        i < remaining.length && !_disposed;
        i += _backgroundArtworkConcurrency
      ) {
        final batch = remaining.skip(i).take(_backgroundArtworkConcurrency);
        await Future.wait(
          batch.map((genre) => _loadGenreArtwork(genre, includeType)),
        );
      }
    }
  }

  Future<void> _loadGenreArtwork(
    GenreCardData genre,
    String? includeType,
  ) async {
    if (_disposed) return;
    try {
      final response = await _client.itemsApi.getItems(
        parentId: widget.libraryId,
        genreIds: [genre.id],
        includeItemTypes: includeType != null
            ? [includeType]
            : ['Movie', 'Series'],
        excludeItemTypes: includeType == null ? ['Episode'] : null,
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
      final totalCount =
          rawTotalCount is num ? rawTotalCount.toInt() : items.length;
      if (totalCount <= 0 || items.isEmpty) {
        if (_genres.remove(genre) && !_disposed && mounted) {
          setState(() {});
        }
        return;
      }

      genre.itemCount = totalCount;

      if (_collectionType == 'music') {
        for (final raw in items) {
          final item = raw as Map<String, dynamic>;
          final imageTags = item['ImageTags'];
          final hasPrimaryTag =
              item['PrimaryImageTag'] != null ||
              (imageTags is Map && imageTags['Primary'] != null);
          if (hasPrimaryTag) {
            final primaryUrl = _client.imageApi.getPrimaryImageUrl(
              item['Id']?.toString() ?? '',
              maxWidth: _genreCardRequestMaxWidth(),
            );
            genre.imageUrl = primaryUrl;
            genre.backdropUrl ??= primaryUrl;
            if (!_disposed && mounted) setState(() {});
            return;
          }
        }

        if (items.isNotEmpty) {
          final first = items.first as Map<String, dynamic>;
          final primaryUrl = _client.imageApi.getPrimaryImageUrl(
            first['Id']?.toString() ?? '',
            maxWidth: _genreCardRequestMaxWidth(),
          );
          genre.imageUrl = primaryUrl;
          genre.backdropUrl ??= primaryUrl;
          if (!_disposed && mounted) setState(() {});
          return;
        }
      } else {
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
      }
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
    final desktopScale = _desktopUiScaleFactor();
    if (_collectionType == 'music') {
      return _posterSize.portraitHeight.toDouble() * desktopScale;
    }

    final posterSize = _posterSize;
    final baseWidth = switch (_imageType) {
      ImageType.thumb => posterSize.landscapeHeight * (16 / 9),
      ImageType.banner => posterSize.landscapeHeight * (16 / 9),
      ImageType.poster => posterSize.portraitHeight * (2 / 3),
    };
    return baseWidth * desktopScale;
  }

  double _cardAspectRatio() {
    if (_collectionType == 'music') {
      return 1.0;
    }

    return switch (_imageType) {
      ImageType.thumb => 16 / 9,
      ImageType.banner => 16 / 9,
      ImageType.poster => 2 / 3,
    };
  }

  String? get _includeType {
    switch (_collectionType) {
      case 'movies':
        return 'Movie';
      case 'tvshows':
        return 'Series';
      case 'music':
        return 'MusicAlbum';
      default:
        return null;
    }
  }

  double _desktopUiScaleFactor() {
    return _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
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
              color: _navyBackground.withAlpha(hasBackdrop ? 140 : 191),
            ),
          ),
          Column(
            children: [
              _GenresHeader(
                libraryName: _libraryName,
                isMusic: _collectionType == 'music',
                onBack: () => PlatformDetection.isWeb
                    ? context.popOrHome()
                    : context.pop(),
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
        final isMusic = _collectionType == 'music';
        final desktopScale = _desktopUiScaleFactor();
        final horizontalPadding = isMobile
            ? _mobileHorizontalPadding
            : _horizontalPadding * desktopScale;
        final spacing = 16.0 * desktopScale;
        final minColumns = isMobile ? 1 : 2;
        final maxColumns = isMobile ? 4 : 8;
        final crossAxisCount =
            ((constraints.maxWidth - horizontalPadding * 2 + spacing) /
                    (_cardWidth() + spacing))
                .floor()
                .clamp(minColumns, maxColumns);

        return GridView.builder(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            20,
            horizontalPadding,
            32,
          ),
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
              centerTitle: isMusic,
              onTap: () {
                context.push(
                  Destinations.genre(
                    genre.name,
                    genreId: genre.id,
                    parentId: widget.libraryId,
                    includeType: _includeType,
                  ),
                );
              },
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

class _GenresHeader extends StatelessWidget {
  final String libraryName;
  final bool isMusic;
  final VoidCallback onBack;

  const _GenresHeader({
    required this.libraryName,
    this.isMusic = false,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = _isCompact(context);
    final desktopScale = GetIt.instance<UserPreferences>()
        .get(UserPreferences.desktopUiScale)
        .scaleFactor;
    final topPadding = isMobile ? MediaQuery.of(context).padding.top : 8.0;
    final horizontalPadding = isMobile
        ? _mobileHorizontalPadding
        : _horizontalPadding * desktopScale;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (PlatformDetection.isTV)
            IconButton(
              icon: Icon(
                Icons.home,
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                size: 22 * desktopScale,
              ),
              onPressed: () => context.go(Destinations.home),
              tooltip: AppLocalizations.of(context).home,
            )
          else
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                size: 22 * desktopScale,
              ),
              onPressed: onBack,
              tooltip: AppLocalizations.of(context).back,
            ),
          SizedBox(width: 12 * desktopScale),
          Text(
            isMusic
                ? AppLocalizations.of(context).genres
                : AppLocalizations.of(context).libraryGenresTitle(libraryName),
            style: TextStyle(
              fontSize: 26 * desktopScale,
              fontWeight: FontWeight.w300,
              color: AppColorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
