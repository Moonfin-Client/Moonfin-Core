import 'dart:async';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/models/aggregated_library.dart';
import '../../data/repositories/mdblist_repository.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';
import '../navigation/destinations.dart';
import 'focusable_dialog_row.dart';
import 'media_card.dart';
import 'overlay_sheet.dart';
import 'rating_display.dart';
import 'shuffle_options_dialog.dart';

const _kShuffleCardCount = 5;
const _kShuffleLoadTimeout = Duration(seconds: 25);
const _kShuffleMaxAttempts = 3;
const _kShuffleRetryDelay = Duration(milliseconds: 800);

enum _ShuffleLoadTrigger { initial, random, library, genre }

Future<void> showShuffleOverlay(BuildContext context) {
  final prefs = GetIt.instance<UserPreferences>();
  final contentType = prefs.get(UserPreferences.shuffleContentType);
  final _ = contentType;
  return showFocusRestoringDialog<void>(
    context: context,
    useSafeArea: false,
    barrierColor: AppColorScheme.scrim.withValues(alpha: 0.7),
    builder: (_) => _ShuffleOverlay(
      launcherContext: context,
      initialContentType: contentType,
    ),
  );
}

class _ShuffleOverlay extends StatefulWidget {
  final BuildContext launcherContext;
  final String initialContentType;

  const _ShuffleOverlay({
    required this.launcherContext,
    required this.initialContentType,
  });

  @override
  State<_ShuffleOverlay> createState() => _ShuffleOverlayState();
}

class _ShuffleOverlayState extends State<_ShuffleOverlay> {
  final _prefs = GetIt.instance<UserPreferences>();
  final _focusScopeNode = FocusScopeNode(
    debugLabel: 'ShuffleOverlayScope',
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
  );
  final _mobilePageController = PageController(viewportFraction: 0.62);
  final _cardFocusNodes = List<FocusNode>.generate(
    _kShuffleCardCount,
    (index) => FocusNode(debugLabel: 'ShuffleOverlayCard$index'),
  );
  final _libraryButtonFocusNode = FocusNode(
    debugLabel: 'ShuffleOverlayLibrary',
  );
  final _shuffleButtonFocusNode = FocusNode(debugLabel: 'ShuffleOverlayReroll');
  final _genresButtonFocusNode = FocusNode(debugLabel: 'ShuffleOverlayGenres');

  late final String _contentType;
  List<AggregatedItem> _items = const <AggregatedItem>[];
  AggregatedItem? _selectedItem;
  int _selectedIndex = 0;
  Map<String, double> _selectedRatings = const {};
  final Map<String, String?> _tmdbIdCache = <String, String?>{};
  final Map<String, Map<String, double>> _ratingsCache =
      <String, Map<String, double>>{};
  String? _activeLibraryId;
  String? _activeGenreName;
  bool _loading = true;
  bool _hasLoadError = false;
  int _loadRequestId = 0;
  int _ratingsRequestId = 0;
  _ShuffleLoadTrigger _activeLoadTrigger = _ShuffleLoadTrigger.initial;

  @override
  void initState() {
    super.initState();
    _contentType = widget.initialContentType;
    _logShuffleLoadInfo(
      'overlay initialized',
      context: {
        'initialContentType': _contentType,
        'isTv': PlatformDetection.isTV,
        'useMobileUi': PlatformDetection.useMobileUi,
        'useDesktopUi': PlatformDetection.useDesktopUi,
      },
    );
    _loadItems(
      requestInitialFocus: true,
      trigger: _ShuffleLoadTrigger.initial,
    );
  }

  @override
  void dispose() {
    _focusScopeNode.dispose();
    _mobilePageController.dispose();
    for (final node in _cardFocusNodes) {
      node.dispose();
    }
    _libraryButtonFocusNode.dispose();
    _shuffleButtonFocusNode.dispose();
    _genresButtonFocusNode.dispose();
    super.dispose();
  }

  void _logShuffleLoadInfo(
    String message, {
    Map<String, Object?> context = const <String, Object?>{},
  }) {
    _logShuffleEvent(message, context: context);
  }

  void _logShuffleLoadError(
    String message,
    Object error,
    StackTrace stackTrace, {
    Map<String, Object?> context = const <String, Object?>{},
  }
  ) {
    _logShuffleEvent(
      message,
      level: 1000,
      context: context,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void _logShuffleEvent(
    String message, {
    int level = 800,
    Map<String, Object?> context = const <String, Object?>{},
    Object? error,
    StackTrace? stackTrace,
  }) {
    final _ = message;
    final __ = level;
    final ___ = context;
    final ____ = error;
    final _____ = stackTrace;
  }

  String _describeError(Object error) {
    if (error is TimeoutException) {
      return 'TimeoutException(message=${error.message ?? 'none'})';
    }
    if (error is DioException) {
      final request = error.requestOptions;
      return 'DioException('
          'type=${error.type}, '
          'status=${error.response?.statusCode}, '
          'method=${request.method}, '
          'uri=${request.uri}, '
          'message=${error.message})';
    }
    return '${error.runtimeType}: $error';
  }

  Future<void> _loadItems({
    bool requestInitialFocus = false,
    _ShuffleLoadTrigger trigger = _ShuffleLoadTrigger.random,
  }) async {
    final requestId = ++_loadRequestId;
    _logShuffleLoadInfo(
      'load requested',
      context: {
        'requestId': requestId,
        'requestedTrigger': trigger.name,
        'requestInitialFocus': requestInitialFocus,
      },
    );
    if (mounted) {
      setState(() {
        _loading = true;
        _hasLoadError = false;
        _selectedRatings = const {};
        _activeLoadTrigger = trigger;
      });
    }

    final stopwatch = Stopwatch()..start();
    Object? lastError;

    for (var attempt = 1; attempt <= _kShuffleMaxAttempts; attempt++) {
      if (!mounted || requestId != _loadRequestId) return;
      _logShuffleLoadInfo(
        'load attempt start',
        context: {
          'requestId': requestId,
          'attempt': attempt,
          'maxAttempts': _kShuffleMaxAttempts,
          'parentId': _activeLibraryId ?? 'none',
          'genreName': _activeGenreName ?? 'none',
          'limit': _kShuffleCardCount,
        },
      );

      try {
        final items = await fetchRandomItems(
          contentType: _contentType,
          parentId: _activeLibraryId,
          genreName: _activeGenreName,
          limit: _kShuffleCardCount,
        ).timeout(_kShuffleLoadTimeout);

        if (!mounted || requestId != _loadRequestId) return;
        final selectedItem = items.isEmpty ? null : items.first;
        setState(() {
          _items = items;
          _loading = false;
          _hasLoadError = false;
          _selectedIndex = 0;
          _selectedItem = selectedItem;
        });

        _logShuffleLoadInfo(
          'load success',
          context: {
            'requestId': requestId,
            'attempt': attempt,
            'itemCount': items.length,
            'elapsedMs': stopwatch.elapsedMilliseconds,
          },
        );

        if (PlatformDetection.useMobileUi) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || !_mobilePageController.hasClients) return;
            _syncMobilePage(0, jump: true);
          });
        }

        _loadRatingsForSelected(selectedItem);
        _warmRatingsCache(items, selectedItem: selectedItem);

        if (requestInitialFocus) {
          _requestInitialFocus();
        }
        return;
      } on TimeoutException catch (error, stackTrace) {
        lastError = error;
        _logShuffleLoadError(
          'load attempt timeout',
          error,
          stackTrace,
          context: {
            'requestId': requestId,
            'attempt': attempt,
            'elapsedMs': stopwatch.elapsedMilliseconds,
            'errorDetail': _describeError(error),
          },
        );
        break;
      } catch (error, stackTrace) {
        lastError = error;
        _logShuffleLoadError(
          'load attempt failed',
          error,
          stackTrace,
          context: {
            'requestId': requestId,
            'attempt': attempt,
            'elapsedMs': stopwatch.elapsedMilliseconds,
            'errorDetail': _describeError(error),
          },
        );

        if (attempt >= _kShuffleMaxAttempts) {
          break;
        }

        await Future.delayed(_kShuffleRetryDelay);
      }
    }

    if (!mounted || requestId != _loadRequestId) return;
    _logShuffleLoadInfo(
      'load failed after retries',
      context: {
        'requestId': requestId,
        'failedTrigger': trigger.name,
        'attempts': _kShuffleMaxAttempts,
        'elapsedMs': stopwatch.elapsedMilliseconds,
        'lastError': lastError == null ? 'none' : _describeError(lastError),
      },
    );
    setState(() {
      _items = const <AggregatedItem>[];
      _loading = false;
      _hasLoadError = true;
      _selectedIndex = 0;
      _selectedItem = null;
      _selectedRatings = const {};
    });

    if (requestInitialFocus) {
      _requestInitialFocus();
    }
  }

  void _requestInitialFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_items.isNotEmpty) {
        final index = _selectedIndex < _items.length ? _selectedIndex : 0;
        final cardFocusNode = _cardFocusNodes[index];
        if (cardFocusNode.canRequestFocus) {
          cardFocusNode.requestFocus();
          return;
        }
      }
      if (_shuffleButtonFocusNode.canRequestFocus) {
        _shuffleButtonFocusNode.requestFocus();
      }
    });
  }

  Future<void> _pickLibrary() async {
    final l10n = AppLocalizations.of(context);
    final selected = await showFocusRestoringDialog<AggregatedLibrary>(
      context: context,
      builder: (_) => _ShufflePickerDialog<AggregatedLibrary>(
        title: l10n.shuffleSelectLibrary,
        emptyLabel: l10n.shuffleNoLibraries,
        loadItems: () => fetchShuffleLibraries(contentType: _contentType),
        itemLabelBuilder: (library) => library.name,
      ),
    );

    if (!mounted || selected == null) return;

    setState(() {
      _activeLibraryId = selected.id;
      _activeGenreName = null;
    });

    _logShuffleLoadInfo(
      'library selected',
      context: {
        'libraryId': selected.id,
        'libraryName': selected.name,
      },
    );

    await _loadItems(
      requestInitialFocus: true,
      trigger: _ShuffleLoadTrigger.library,
    );
  }

  Future<void> _pickGenre() async {
    final l10n = AppLocalizations.of(context);
    final selected = await showFocusRestoringDialog<String>(
      context: context,
      builder: (_) => _ShufflePickerDialog<String>(
        title: l10n.shuffleSelectGenre,
        emptyLabel: l10n.shuffleNoGenres,
        loadItems: () => fetchShuffleGenres(contentType: _contentType),
        itemLabelBuilder: (genre) => genre,
      ),
    );

    if (!mounted || selected == null) return;

    setState(() {
      _activeGenreName = selected;
      _activeLibraryId = null;
    });

    _logShuffleLoadInfo(
      'genre selected',
      context: {'genre': selected},
    );

    await _loadItems(
      requestInitialFocus: true,
      trigger: _ShuffleLoadTrigger.genre,
    );
  }

  void _setSelectedAt(int index, {bool syncPage = true}) {
    if (index < 0 || index >= _items.length) {
      return;
    }

    final item = _items[index];
    final sameSelection =
        _selectedIndex == index &&
        _selectedItem?.id == item.id &&
        _selectedItem?.serverId == item.serverId;

    if (sameSelection) {
      if (syncPage) {
        _syncMobilePage(index);
      }
      return;
    }

    setState(() {
      _selectedIndex = index;
      _selectedItem = item;
    });

    if (syncPage) {
      _syncMobilePage(index);
    }

    _loadRatingsForSelected(item);
  }

  void _syncMobilePage(int index, {bool jump = false}) {
    if (!PlatformDetection.useMobileUi || !_mobilePageController.hasClients) {
      return;
    }

    final currentPage =
        _mobilePageController.page ??
        _mobilePageController.initialPage.toDouble();
    if ((currentPage - index).abs() < 0.01) {
      return;
    }

    if (jump) {
      _mobilePageController.jumpToPage(index);
      return;
    }

    _mobilePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }

  void _handleCardTap(int index, AggregatedItem item) {
    if (PlatformDetection.useMobileUi) {
      _openDetails(item);
      return;
    }
    if (index != _selectedIndex) {
      _setSelectedAt(index);
      final node = _cardFocusNodes[index];
      if (node.canRequestFocus) {
        node.requestFocus();
      }
      return;
    }
    _openDetails(item);
  }

  void _openDetails(AggregatedItem item) {
    final destination = Destinations.itemOrPhoto(
      item.id,
      serverId: item.serverId,
      type: item.type,
    );
    Navigator.of(context, rootNavigator: true).pop();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.launcherContext.mounted) {
        widget.launcherContext.push(destination);
      }
    });
  }

  MediaServerClient _clientForItem(AggregatedItem item) {
    final factory = GetIt.instance<MediaServerClientFactory>();
    return factory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  String? _resolvePrimaryImageUrl(
    AggregatedItem item,
    ImageApi imageApi, {
    int? maxHeight,
    int? maxWidth,
  }) {
    String? primary(String? id, String? tag) {
      if (id == null || tag == null) return null;
      return imageApi.getPrimaryImageUrl(
        id,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        tag: tag,
      );
    }

    return primary(item.id, item.primaryImageTag) ??
        primary(item.primaryImageItemId, item.primaryImageTagField) ??
        primary(item.parentPrimaryImageItemId, item.parentPrimaryImageTag);
  }

  String? _resolveCardImageUrl(
    AggregatedItem item,
    double cardWidth,
    double aspectRatio,
  ) {
    final imageApi = _clientForItem(item).imageApi;
    final requestScale = PlatformDetection.isTV
        ? 2.4
        : (PlatformDetection.useMobileUi ? 1.8 : 1.6);
    final requestedWidth = (cardWidth * requestScale).round();
    final maxWidth = math.max(
      requestedWidth,
      PlatformDetection.isTV ? 360 : requestedWidth,
    );
    final maxHeight = (maxWidth / aspectRatio).round();

    if (aspectRatio > 1.2) {
      if (item.thumbImageTag != null) {
        return imageApi.getThumbImageUrl(
          item.id,
          maxWidth: maxWidth,
          tag: item.thumbImageTag,
        );
      }
      if (item.backdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          item.id,
          maxWidth: maxWidth,
          tag: item.backdropImageTags.first,
        );
      }
      if (item.parentThumbItemId != null && item.parentThumbImageTag != null) {
        return imageApi.getThumbImageUrl(
          item.parentThumbItemId!,
          maxWidth: maxWidth,
          tag: item.parentThumbImageTag,
        );
      }
      if (item.parentBackdropItemId != null &&
          item.parentBackdropImageTags.isNotEmpty) {
        return imageApi.getBackdropImageUrl(
          item.parentBackdropItemId!,
          maxWidth: maxWidth,
          tag: item.parentBackdropImageTags.first,
        );
      }
    }

    return _resolvePrimaryImageUrl(
      item,
      imageApi,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }

  String _truncate(String value, int maxChars) {
    if (value.length <= maxChars) {
      return value;
    }
    return '${value.substring(0, maxChars - 3).trim()}...';
  }

  String _heroTagline(AggregatedItem? item) {
    if (item == null) {
      return 'Shuffle something new.';
    }

    final overview = (item.overview ?? '').trim();
    if (overview.isNotEmpty) {
      return _truncate(overview, PlatformDetection.useMobileUi ? 76 : 118);
    }

    final subtitle = (item.subtitle ?? '').trim();
    if (subtitle.isNotEmpty) {
      return subtitle;
    }

    final type = (item.type ?? 'item').toLowerCase();
    return 'Discover a random $type from your library.';
  }

  String? _formatRuntime(Duration? runtime) {
    if (runtime == null) {
      return null;
    }
    final hours = runtime.inHours;
    final minutes = runtime.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  Future<String?> _resolveTmdbId(AggregatedItem item) async {
    var tmdbId = item.tmdbId;
    if (tmdbId != null && tmdbId.isNotEmpty) {
      return tmdbId;
    }

    final cacheKey = '${item.serverId}:${item.id}';
    if (_tmdbIdCache.containsKey(cacheKey)) {
      return _tmdbIdCache[cacheKey];
    }

    final clientFactory = GetIt.instance<MediaServerClientFactory>();
    final client =
        clientFactory.getClientIfExists(item.serverId) ??
        clientFactory.getActiveClient();
    try {
      final details = await client.itemsApi.getItem(item.id);
      tmdbId = (details['ProviderIds'] as Map?)?['Tmdb'] as String?;
    } catch (error, stackTrace) {
      _logShuffleLoadError(
        'failed to resolve tmdb id from item details',
        error,
        stackTrace,
        context: {
          'itemId': item.id,
          'serverId': item.serverId,
          'cacheKey': cacheKey,
          'errorDetail': _describeError(error),
        },
      );
      tmdbId = null;
    }

    _tmdbIdCache[cacheKey] = tmdbId;
    return tmdbId;
  }

  void _warmRatingsCache(
    List<AggregatedItem> items, {
    AggregatedItem? selectedItem,
  }) {
    if (!_prefs.get(UserPreferences.enableAdditionalRatings)) return;

    final selectedKey = selectedItem == null
        ? null
        : '${selectedItem.serverId}:${selectedItem.id}';
    for (final item in items) {
      final cacheKey = '${item.serverId}:${item.id}';
      if (cacheKey == selectedKey || _ratingsCache.containsKey(cacheKey)) {
        continue;
      }
      unawaited(_fetchAndCacheRatings(item, cacheKey));
    }
  }

  Future<void> _fetchAndCacheRatings(
    AggregatedItem item,
    String cacheKey,
  ) async {
    try {
      final tmdbId = await _resolveTmdbId(item);
      if (tmdbId == null || tmdbId.isEmpty) {
        _ratingsCache[cacheKey] = const <String, double>{};
        return;
      }

      final result = await GetIt.instance<MdbListRepository>().getRatings(
        tmdbId: tmdbId,
        mediaType: item.type ?? 'Movie',
      );

      _ratingsCache[cacheKey] = (result != null && result.isNotEmpty)
          ? result
          : const <String, double>{};
    } catch (error, stackTrace) {
      _logShuffleLoadError(
        'ratings prefetch failed',
        error,
        stackTrace,
        context: {
          'cacheKey': cacheKey,
          'itemId': item.id,
          'errorDetail': _describeError(error),
        },
      );
    }
  }

  Future<void> _loadRatingsForSelected(AggregatedItem? item) async {
    final requestId = ++_ratingsRequestId;

    if (item == null) {
      if (mounted) {
        setState(() => _selectedRatings = const {});
      }
      return;
    }

    if (!_prefs.get(UserPreferences.enableAdditionalRatings)) {
      if (mounted) {
        setState(() => _selectedRatings = const {});
      }
      return;
    }

    final cacheKey = '${item.serverId}:${item.id}';
    final cachedRatings = _ratingsCache[cacheKey];
    if (cachedRatings != null) {
      if (mounted) {
        setState(() => _selectedRatings = cachedRatings);
      }
      return;
    }

    if (mounted) {
      setState(() => _selectedRatings = const {});
    }

    final tmdbId = await _resolveTmdbId(item);

    if (!mounted || requestId != _ratingsRequestId) return;

    if (tmdbId == null || tmdbId.isEmpty) {
      _ratingsCache[cacheKey] = const <String, double>{};
      return;
    }

    Map<String, double>? result;
    try {
      result = await GetIt.instance<MdbListRepository>().getRatings(
        tmdbId: tmdbId,
        mediaType: item.type ?? 'Movie',
      );
    } catch (error, stackTrace) {
      _logShuffleLoadError(
        'load ratings for selected remote request failed',
        error,
        stackTrace,
        context: {
          'ratingsRequestId': requestId,
          'cacheKey': cacheKey,
          'tmdbId': tmdbId,
          'errorDetail': _describeError(error),
        },
      );
      if (mounted && requestId == _ratingsRequestId) {
        _ratingsCache[cacheKey] = const <String, double>{};
        setState(() {
          _selectedRatings = const <String, double>{};
        });
      }
      return;
    }

    if (!mounted || requestId != _ratingsRequestId) return;

    final resolvedRatings = (result != null && result.isNotEmpty)
        ? result
        : const <String, double>{};
    _ratingsCache[cacheKey] = resolvedRatings;

    setState(() {
      _selectedRatings = resolvedRatings;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isMobile = PlatformDetection.useMobileUi;
    final showTopStrip = !PlatformDetection.isTV;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: isMobile ? 8 : 24,
          vertical: isMobile ? 8 : 18,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? 460 : (PlatformDetection.isTV ? 1680 : 1480),
              maxHeight: MediaQuery.sizeOf(context).height,
            ),
            child: FocusScope(
              node: _focusScopeNode,
              autofocus: true,
              child: ClipRRect(
                borderRadius: AppRadius.circular(isMobile ? 22 : 28),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColorScheme.background.withValues(alpha: 0.97),
                        AppColorScheme.surface.withValues(alpha: 0.96),
                      ],
                    ),
                    borderRadius: AppRadius.circular(isMobile ? 22 : 28),
                    border: Border.fromBorderSide(
                      ThemeRegistry.active.borders.chipBorder.copyWith(
                        color: AppColorScheme.onSurface.withValues(alpha: 0.22),
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColorScheme.scrim.withValues(alpha: 0.35),
                        blurRadius: isMobile ? 24 : 40,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: const Alignment(0, -0.76),
                                radius: 1.2,
                                colors: [
                                  AppColorScheme.accent.withValues(alpha: 0.12),
                                  AppColorScheme.accent.withValues(alpha: 0.04),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.44, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          isMobile ? 12 : 18,
                          isMobile ? 10 : 16,
                          isMobile ? 12 : 18,
                          isMobile ? 12 : 16,
                        ),
                        child: Column(
                          children: [
                            if (showTopStrip) ...[
                              _buildTopStrip(l10n),
                              SizedBox(height: isMobile ? 6 : 8),
                            ],
                            Expanded(child: _buildCardsArea(l10n)),
                            SizedBox(height: isMobile ? 8 : 10),
                            _buildFocusHeader(l10n),
                            SizedBox(height: isMobile ? 6 : 8),
                            _buildInfoPanel(l10n),
                            SizedBox(height: isMobile ? 10 : 12),
                            _buildActionButtons(l10n),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardsArea(AppLocalizations l10n) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_hasLoadError) {
      return _buildCardsErrorState(l10n);
    }

    if (_items.isEmpty) {
      return Center(
        child: Text(
          l10n.noItemsFound,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.72),
          ),
        ),
      );
    }

    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);
    final cardFocusExpansion = _prefs.get(UserPreferences.cardFocusExpansion);
    final watchedBehavior = _prefs.get(
      UserPreferences.watchedIndicatorBehavior,
    );
    final disablePosterOpacity =
        ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    if (PlatformDetection.useMobileUi) {
      return _buildMobileCardsArea(
        focusColor: focusColor,
        cardFocusExpansion: cardFocusExpansion,
        watchedBehavior: watchedBehavior,
        disablePosterOpacity: disablePosterOpacity,
      );
    }

    return _buildDesktopCardsArea(
      focusColor: focusColor,
      cardFocusExpansion: cardFocusExpansion,
      watchedBehavior: watchedBehavior,
      disablePosterOpacity: disablePosterOpacity,
    );
  }

  Widget _buildCardsErrorState(AppLocalizations l10n) {
    final isMobile = PlatformDetection.useMobileUi;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: isMobile ? 26 : 30,
              color: AppColorScheme.onSurface.withValues(alpha: 0.84),
            ),
            SizedBox(height: isMobile ? 10 : 12),
            Text(
              l10n.unableToConnectToServer,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.82),
                fontSize: isMobile ? 14 : 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 14),
            OutlinedButton.icon(
              onPressed: () {
                _logShuffleLoadInfo(
                  'error state retry pressed',
                  context: {'retryTrigger': _activeLoadTrigger.name},
                );
                _loadItems(
                  requestInitialFocus: true,
                  trigger: _activeLoadTrigger,
                );
              },
              icon: const Icon(Icons.refresh_rounded),
              label: Text(l10n.tryAgain),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopCardsArea({
    required Color focusColor,
    required dynamic cardFocusExpansion,
    required dynamic watchedBehavior,
    required bool disablePosterOpacity,
  }) {
    final isTv = PlatformDetection.isTV;

    return LayoutBuilder(
      builder: (context, constraints) {
        const posterAspectRatio = 2 / 3;
        const centerScale = 1.18;
        final cardExpansionScale = cardFocusExpansion == true ? 1.05 : 1.0;
        final selectedScale = centerScale * cardExpansionScale;
        final textBlockHeight = isTv ? 8.0 : 6.0;

        final spacing = isTv ? 18.0 : 14.0;
        final minCardWidth = isTv ? 130.0 : 112.0;
        final maxCardWidth = isTv ? 250.0 : 220.0;

        final cardsAvailableWidth = math.max(0, constraints.maxWidth - 4);
        final totalSpacing = spacing * (_items.length - 1);
        final widthUnits = (_items.length - 1) + centerScale;

        final widthBased = widthUnits > 0
            ? ((cardsAvailableWidth - totalSpacing) / widthUnits).clamp(
                minCardWidth,
                maxCardWidth,
              )
            : minCardWidth;

        final maxStripHeight = constraints.maxHeight - (isTv ? 64 : 26);
        final maxImageHeight = math.max(
          0,
          (maxStripHeight - textBlockHeight) / selectedScale,
        );
        final heightBased = maxImageHeight * posterAspectRatio;
        final cardWidth = math
            .min(widthBased.toDouble(), heightBased)
            .clamp(80.0, maxCardWidth)
            .toDouble();

        return Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var index = 0; index < _items.length; index++) ...[
                      if (index > 0) SizedBox(width: spacing),
                      AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        alignment: Alignment.topCenter,
                        scale: index == _selectedIndex ? centerScale : 0.9,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 180),
                          opacity: disablePosterOpacity
                              ? 1.0
                              : (index == _selectedIndex ? 1.0 : 0.55),
                          child: _buildCarouselCard(
                            index: index,
                            cardWidth: cardWidth,
                            focusColor: focusColor,
                            cardFocusExpansion: cardFocusExpansion,
                            watchedBehavior: watchedBehavior,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMobileCardsArea({
    required Color focusColor,
    required dynamic cardFocusExpansion,
    required dynamic watchedBehavior,
    required bool disablePosterOpacity,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth * 0.56)
            .clamp(128.0, 220.0)
            .toDouble();

        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _mobilePageController,
                itemCount: _items.length,
                onPageChanged: (index) {
                  _setSelectedAt(index, syncPage: false);
                  final node = _cardFocusNodes[index];
                  if (node.canRequestFocus) {
                    node.requestFocus();
                  }
                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _mobilePageController,
                    child: _buildCarouselCard(
                      index: index,
                      cardWidth: cardWidth,
                      focusColor: focusColor,
                      cardFocusExpansion: cardFocusExpansion,
                      watchedBehavior: watchedBehavior,
                    ),
                    builder: (context, child) {
                      var page = _selectedIndex.toDouble();
                      if (_mobilePageController.hasClients) {
                        page =
                            _mobilePageController.page ??
                            _mobilePageController.initialPage.toDouble();
                      }

                      final distance = (page - index).abs().clamp(0.0, 1.0);
                      final scale = 1.0 - (distance * 0.18);
                      final opacity = disablePosterOpacity
                          ? 1.0
                          : (1.0 - (distance * 0.45));
                      final yOffset = distance * 12;

                      return Center(
                        child: Opacity(
                          opacity: opacity,
                          child: Transform.translate(
                            offset: Offset(0, yOffset),
                            child: Transform.scale(
                              scale: scale,
                              alignment: Alignment.topCenter,
                              child: child,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCarouselCard({
    required int index,
    required double cardWidth,
    required Color focusColor,
    required dynamic cardFocusExpansion,
    required dynamic watchedBehavior,
  }) {
    final item = _items[index];
    final aspectRatio = MediaCard.aspectRatioForType(item.type);
    final imageUrl = _resolveCardImageUrl(item, cardWidth, aspectRatio);

    return Semantics(
      button: true,
      label: item.name,
      child: MediaCard(
        title: null,
        subtitle: null,
        imageUrl: imageUrl,
        width: cardWidth,
        aspectRatio: aspectRatio,
        itemType: item.type,
        isFavorite: item.isFavorite,
        isPlayed: item.isPlayed,
        unplayedCount: item.unplayedItemCount,
        playedPercentage: item.playedPercentage,
        watchedBehavior: watchedBehavior,
        focusColor: focusColor,
        cardFocusExpansion: cardFocusExpansion,
        focusNode: _cardFocusNodes[index],
        autofocus: index == _selectedIndex,
        onFocus: () => _setSelectedAt(index),
        onHoverStart: () => _setSelectedAt(index),
        onLongPress: () => _setSelectedAt(index),
        onTap: () => _handleCardTap(index, item),
      ),
    );
  }

  Widget _buildActionButtons(AppLocalizations l10n) {
    final isMobile = PlatformDetection.useMobileUi;
    final isTv = PlatformDetection.isTV;
    final tvDense = isTv && !isMobile;
    final focusColor = Color(_prefs.get(UserPreferences.focusColor).colorValue);

    return Container(
      padding: EdgeInsets.all(isMobile ? 8 : (tvDense ? 6 : 10)),
      decoration: BoxDecoration(
        color: AppColorScheme.scrim.withValues(alpha: 0.28),
        borderRadius: AppRadius.circular(isMobile ? 20 : (tvDense ? 18 : 24)),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.cardBorder.copyWith(
            color: AppColorScheme.onSurface.withValues(alpha: 0.15),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_loading)
            Padding(
              padding: EdgeInsets.only(bottom: isMobile ? 8 : 10),
              child: Row(
                children: [
                  SizedBox(
                    width: isMobile ? 14 : 16,
                    height: isMobile ? 14 : 16,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: isMobile ? 8 : 10),
                  Text(
                    l10n.loadingShuffle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                flex: isMobile ? 1 : 30,
                child: _ShuffleActionCard(
                  focusNode: _libraryButtonFocusNode,
                  focusColor: focusColor,
                  label: l10n.libraryShuffleLabel,
                  subtitle: tvDense ? '' : l10n.shuffleSelectLibrary,
                  icon: const Icon(Icons.video_library_rounded),
                  compact: isMobile,
                  dense: tvDense,
                  onTap: () {
                    _logShuffleLoadInfo('library shuffle action pressed');
                    if (_loading &&
                        _activeLoadTrigger == _ShuffleLoadTrigger.library) {
                      _logShuffleLoadInfo(
                        'library shuffle action ignored because request is already loading',
                      );
                      return;
                    }
                    _pickLibrary();
                  },
                ),
              ),
              SizedBox(width: isMobile ? 8 : (tvDense ? 8 : 12)),
              Expanded(
                flex: isMobile ? 1 : 40,
                child: _ShuffleActionCard(
                  focusNode: _shuffleButtonFocusNode,
                  focusColor: focusColor,
                  label: l10n.randomShuffleLabel,
                  subtitle: '',
                  icon: const Icon(Icons.shuffle_rounded),
                  compact: isMobile,
                  dense: tvDense,
                  primary: false,
                  onTap: () {
                    _logShuffleLoadInfo('random shuffle action pressed');
                    if (_loading &&
                        _activeLoadTrigger == _ShuffleLoadTrigger.random) {
                      _logShuffleLoadInfo(
                        'random shuffle action ignored because request is already loading',
                      );
                      return;
                    }
                    _loadItems(
                      requestInitialFocus: true,
                      trigger: _ShuffleLoadTrigger.random,
                    );
                  },
                ),
              ),
              SizedBox(width: isMobile ? 8 : (tvDense ? 8 : 12)),
              Expanded(
                flex: isMobile ? 1 : 30,
                child: _ShuffleActionCard(
                  focusNode: _genresButtonFocusNode,
                  focusColor: focusColor,
                  label: l10n.genresShuffleLabel,
                  subtitle: tvDense ? '' : l10n.shuffleSelectGenre,
                  icon: Image.asset(
                    'assets/icons/genres.png',
                    width: isMobile ? 18 : (tvDense ? 18 : 20),
                    height: isMobile ? 18 : (tvDense ? 18 : 20),
                    color: AppColorScheme.onSurface,
                    fit: BoxFit.contain,
                  ),
                  compact: isMobile,
                  dense: tvDense,
                  onTap: () {
                    _logShuffleLoadInfo('genre shuffle action pressed');
                    if (_loading &&
                        _activeLoadTrigger == _ShuffleLoadTrigger.genre) {
                      _logShuffleLoadInfo(
                        'genre shuffle action ignored because request is already loading',
                      );
                      return;
                    }
                    _pickGenre();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopStrip(AppLocalizations l10n) {
    final isMobile = PlatformDetection.useMobileUi;
    final showClose = !PlatformDetection.isTV;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 12,
            vertical: isMobile ? 5 : 7,
          ),
          decoration: BoxDecoration(
            color: AppColorScheme.scrim.withValues(alpha: 0.34),
            borderRadius: AppRadius.circular(999),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.cardBorder.copyWith(
                color: AppColorScheme.onSurface.withValues(alpha: 0.22),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shuffle_rounded,
                size: isMobile ? 14 : 16,
                color: AppColorScheme.accent,
              ),
              const SizedBox(width: 6),
              Text(
                'RANDOM ${l10n.shuffle.toUpperCase()}',
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.94),
                  fontSize: isMobile ? 10 : 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.05,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (showClose)
          Material(
            color: AppColorScheme.scrim.withValues(alpha: 0.34),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => Navigator.of(context, rootNavigator: true).pop(),
              child: SizedBox(
                width: isMobile ? 30 : 34,
                height: isMobile ? 30 : 34,
                child: Icon(
                  Icons.close_rounded,
                  size: isMobile ? 18 : 20,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.92),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFocusHeader(AppLocalizations l10n) {
    final isMobile = PlatformDetection.useMobileUi;
    final item = _selectedItem;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item?.name ?? l10n.noItemsFound,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColorScheme.onSurface,
          fontSize: isMobile ? 22 : 32,
          fontWeight: FontWeight.w800,
          height: 1.05,
        ),
      ),
    );
  }

  Widget _buildInfoPanel(AppLocalizations l10n) {
    final isMobile = PlatformDetection.useMobileUi;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 14,
        vertical: isMobile ? 10 : 12,
      ),
      decoration: BoxDecoration(
        color: AppColorScheme.scrim.withValues(alpha: 0.35),
        borderRadius: AppRadius.circular(16),
        border: Border.fromBorderSide(
          ThemeRegistry.active.borders.cardBorder.copyWith(
            color: AppColorScheme.onSurface.withValues(alpha: 0.18),
          ),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeOut,
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [...previousChildren, ?currentChild],
          );
        },
        child: _selectedItem == null
            ? SizedBox(
                key: const ValueKey<String>('shuffleInfoEmpty'),
                height: isMobile ? 36 : 44,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    l10n.noItemsFound,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.72),
                    ),
                  ),
                ),
              )
            : _buildInfoContent(_selectedItem!),
      ),
    );
  }

  Widget _buildInfoContent(AggregatedItem item) {
    final parts = <Widget>[];
    final showRatings =
        _selectedRatings.isNotEmpty ||
        item.communityRating != null ||
        item.criticRating != null;

    void addPart(Widget part) {
      if (parts.isNotEmpty) {
        parts.add(_buildMetaSeparator());
      }
      parts.add(part);
    }

    if (item.officialRating != null && item.officialRating!.isNotEmpty) {
      addPart(_buildMetaChip(item.officialRating!));
    }

    if (item.genres.isNotEmpty) {
      addPart(_buildMetaText(item.genres.take(3).join(', ')));
    }

    final runtimeLabel = _formatRuntime(item.runtime);
    if (runtimeLabel != null) {
      addPart(_buildMetaText(runtimeLabel));
    }

    if (item.productionYear != null) {
      addPart(_buildMetaText(item.productionYear.toString()));
    }

    final firstRowParts = <Widget>[...parts];
    if (showRatings) {
      if (firstRowParts.isNotEmpty) {
        firstRowParts.add(_buildMetaSeparator());
      }
      firstRowParts.add(
        RatingsRow(
          ratings: _selectedRatings,
          communityRating: item.communityRating,
          criticRating: item.criticRating,
          enableAdditionalRatings: _prefs.get(
            UserPreferences.enableAdditionalRatings,
          ),
          enabledRatings: _prefs.get(UserPreferences.enabledRatings),
          showLabels: _prefs.get(UserPreferences.showRatingLabels),
          showBadges: _prefs.get(UserPreferences.showRatingBadges),
        ),
      );
    }

    final overview = (item.overview ?? '').trim();
    final overviewText = overview.isEmpty ? _heroTagline(item) : overview;
    final overviewStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColorScheme.onSurface.withValues(alpha: 0.86),
      height: 1.3,
    );
    final overviewFontSize = overviewStyle?.fontSize ?? 12;
    final overviewLineHeight =
        overviewFontSize * (overviewStyle?.height ?? 1.0);
    final overviewMinHeight = (overviewLineHeight * 3) + 4;

    return KeyedSubtree(
      key: ValueKey<String>('${item.serverId}:${item.id}'),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (firstRowParts.isNotEmpty)
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: firstRowParts,
              ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: overviewMinHeight),
              child: Text(
                overviewText,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: overviewStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaText(String value) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppColorScheme.onSurface.withValues(alpha: 0.9),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMetaSeparator() {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildMetaChip(String label) {
    final borders = ThemeRegistry.active.borders;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: borders.chipBackground,
        borderRadius: borders.chipRadius,
        border: Border.fromBorderSide(
          borders.chipBorder.copyWith(
            color: AppColorScheme.onSurface.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColorScheme.onSurface.withValues(alpha: 0.9),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.35,
        ),
      ),
    );
  }
}

class _ShuffleActionCard extends StatefulWidget {
  final FocusNode focusNode;
  final Color focusColor;
  final String label;
  final String subtitle;
  final Widget icon;
  final VoidCallback onTap;
  final bool primary;
  final bool compact;
  final bool dense;

  const _ShuffleActionCard({
    required this.focusNode,
    required this.focusColor,
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.primary = false,
    this.compact = false,
    this.dense = false,
  });

  @override
  State<_ShuffleActionCard> createState() => _ShuffleActionCardState();
}

class _ShuffleActionCardState extends State<_ShuffleActionCard> {
  bool _hovered = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    setState(() => _focused = widget.focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final active = _focused || _hovered;
    final titleStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
      color: AppColorScheme.onSurface,
      fontWeight: FontWeight.w700,
      letterSpacing: widget.dense ? 0.8 : 1.1,
    );
    final subtitleStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppColorScheme.onSurface.withValues(alpha: 0.72),
      fontWeight: FontWeight.w500,
      height: 1.2,
    );

    final baseDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: widget.primary
            ? [
                AppColorScheme.accent.withValues(alpha: active ? 0.46 : 0.36),
                AppColorScheme.accent.withValues(alpha: active ? 0.3 : 0.22),
              ]
            : [
                AppColorScheme.surface.withValues(alpha: active ? 0.66 : 0.54),
                AppColorScheme.scrim.withValues(alpha: active ? 0.42 : 0.34),
              ],
      ),
      borderRadius: AppRadius.circular(widget.compact ? 18 : (widget.dense ? 16 : 20)),
      border: Border.fromBorderSide(
        ThemeRegistry.active.borders.cardBorder.copyWith(
          color: active
              ? widget.focusColor.withValues(alpha: 0.78)
              : AppColorScheme.onSurface.withValues(alpha: 0.18),
        ),
      ),
      boxShadow: active
          ? [
              BoxShadow(
                color: widget.focusColor.withValues(
                  alpha: widget.primary ? 0.32 : 0.2,
                ),
                blurRadius: widget.primary ? 20 : 14,
                spreadRadius: widget.primary ? 1 : 0,
              ),
            ]
          : null,
    );

    final content = AnimatedContainer(
      duration: const Duration(milliseconds: 160),
      height: widget.compact ? 92 : (widget.dense ? 66 : (widget.primary ? 90 : 84)),
      decoration: baseDecoration,
      padding: EdgeInsets.symmetric(
        horizontal: widget.compact ? 8 : (widget.dense ? 10 : 14),
        vertical: widget.compact ? 6 : (widget.dense ? 6 : 10),
      ),
      child: widget.compact
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.primary
                        ? AppColorScheme.accent.withValues(alpha: 0.24)
                        : AppColorScheme.onSurface.withValues(alpha: 0.08),
                  ),
                  child: Center(
                    child: IconTheme(
                      data: IconThemeData(
                        color: AppColorScheme.onSurface,
                        size: 18,
                      ),
                      child: widget.icon,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: titleStyle,
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  width: widget.dense ? 30 : 38,
                  height: widget.dense ? 30 : 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.primary
                        ? AppColorScheme.accent.withValues(alpha: 0.24)
                        : AppColorScheme.onSurface.withValues(alpha: 0.08),
                  ),
                  child: Center(
                    child: IconTheme(
                      data: IconThemeData(
                        color: AppColorScheme.onSurface,
                        size: widget.dense ? 18 : 22,
                      ),
                      child: widget.icon,
                    ),
                  ),
                ),
                SizedBox(width: widget.dense ? 8 : 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle,
                      ),
                      if (!widget.dense && widget.subtitle.trim().isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: subtitleStyle,
                        ),
                      ],
                    ],
                  ),
                ),
                if (!widget.dense)
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 22,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.86),
                  ),
              ],
            ),
    );

    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Focus(
          focusNode: widget.focusNode,
          onKeyEvent: (_, event) {
            if (event is KeyDownEvent &&
                (event.logicalKey == LogicalKeyboardKey.select ||
                    event.logicalKey == LogicalKeyboardKey.enter)) {
              widget.onTap();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(onTap: widget.onTap, child: content),
        ),
      ),
    );
  }
}

class _ShufflePickerDialog<T> extends StatefulWidget {
  final String title;
  final String emptyLabel;
  final Future<List<T>> Function() loadItems;
  final String Function(T item) itemLabelBuilder;

  const _ShufflePickerDialog({
    required this.title,
    required this.emptyLabel,
    required this.loadItems,
    required this.itemLabelBuilder,
  });

  @override
  State<_ShufflePickerDialog<T>> createState() =>
      _ShufflePickerDialogState<T>();
}

class _ShufflePickerDialogState<T> extends State<_ShufflePickerDialog<T>> {
  List<T> _items = <T>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await widget.loadItems();
    if (!mounted) return;
    setState(() {
      _items = items;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Container(
        constraints: const BoxConstraints(minWidth: 340, maxWidth: 440),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.9),
          borderRadius: AppRadius.circular(20),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: _loading
                  ? const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : _items.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          widget.emptyLabel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(
                              alpha: 0.72,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 420),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _items.length,
                        itemBuilder: (_, index) {
                          final item = _items[index];
                          return FocusableDialogRow(
                            label: widget.itemLabelBuilder(item),
                            autofocus: index == 0,
                            onTap: () => Navigator.pop(context, item),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 1,
              color: AppColorScheme.onSurface.withValues(alpha: 0.08),
            ),
            const SizedBox(height: 4),
            FocusableDialogRow(
              label: l10n.cancel,
              dimmed: true,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
