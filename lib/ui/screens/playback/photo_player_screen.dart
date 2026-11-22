import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/image_fetch_priority.dart';
import '../../../util/system_ui.dart';
import '../../navigation/destinations.dart';
import '../../navigation/playback_launcher.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/offline_aware_image.dart';
import 'photo_slideshow_scheduler.dart';

class PhotoPlayerScreen extends StatefulWidget {
  final String itemId;

  const PhotoPlayerScreen({super.key, required this.itemId});

  @override
  State<PhotoPlayerScreen> createState() => _PhotoPlayerScreenState();
}

class _PhotoPlayerScreenState extends State<PhotoPlayerScreen>
    with ImmersiveSystemUi {
  final _client = GetIt.instance<MediaServerClient>();
  final _transformController = TransformationController();

  List<AggregatedItem> _items = [];
  int _currentIndex = 0;
  bool _controlsVisible = true;
  Timer? _hideTimer;
  int _pointerCount = 0;
  Offset _swipeStart = Offset.zero;
  Offset _swipeLast = Offset.zero;
  bool _swipeIgnored = false;

  static const _swipeMinDistance = 50.0;
  static const _slideshowInterval = Duration(seconds: 5);
  static const _photoTransition = Duration(milliseconds: 400);

  late final _slideshow = PhotoSlideshowScheduler(
    interval: _slideshowInterval,
    onAdvance: _next,
  );

  @override
  void initState() {
    super.initState();
    _loadPhoto();
    setImmersive(true);
    _scheduleHideControls();
  }

  @override
  void dispose() {
    _slideshow.dispose();
    _hideTimer?.cancel();
    _transformController.dispose();
    super.dispose();
  }

  Future<void> _loadPhoto() async {
    try {
      final data = await _client.itemsApi.getItem(widget.itemId);
      final item = AggregatedItem(
        id: data['Id']?.toString() ?? '',
        serverId: data['ServerId']?.toString() ?? '',
        rawData: data,
      );
      final parentId = item.parentId;
      if (parentId != null) {
        final siblings = await _client.itemsApi.getItems(
          parentId: parentId,
          includeItemTypes: ['Photo', 'Video'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          limit: 500,
        );
        final rawItems = siblings['Items'] as List? ?? [];
        final items = rawItems
            .cast<Map<String, dynamic>>()
            .map(
              (d) => AggregatedItem(
                id: d['Id']?.toString() ?? '',
                serverId: d['ServerId']?.toString() ?? '',
                rawData: d,
              ),
            )
            .toList();
        final idx = items.indexWhere((i) => i.id == widget.itemId);
        // The album list is capped, so a photo past the cap is added to the
        // end, where its name sorts, rather than opening on the first one.
        if (idx < 0) items.add(item);
        if (!mounted) return;
        setState(() {
          _items = items;
          _currentIndex = idx >= 0 ? idx : items.length - 1;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _items = [item];
          _currentIndex = 0;
        });
      }
      _onPhotoShown();
    } catch (_) {}
  }

  String? _getImageUrl(AggregatedItem item) {
    return _client.imageApi.getPrimaryImageUrl(
      item.id,
      maxWidth: 1920,
      tag: item.primaryImageTag,
    );
  }

  void _goTo(int index) {
    if (index < 0 || index >= _items.length) return;
    // A swipe still in progress belongs to the photo it started on.
    if (_pointerCount > 0) _swipeIgnored = true;
    _transformController.value = Matrix4.identity();
    setState(() => _currentIndex = index);
    _onPhotoShown();
  }

  /// Completes once the photo at [index] has loaded (or failed to), using
  /// the same provider [_buildPhotoView] paints, so it shares that load
  /// rather than fetching the photo a second time.
  Future<void> _photoReady(
    int index, {
    ImageFetchPriority priority = ImageFetchPriority.normal,
  }) {
    if (!mounted || index < 0 || index >= _items.length) {
      return Future.value();
    }
    final url = _getImageUrl(_items[index]);
    if (url == null) return Future.value();
    return precacheImage(
      ArtworkDecode.provider(url, headers: artworkFetchHeaders(url, priority)),
      context,
      onError: (_, _) {},
    );
  }

  /// Completes once the current photo has loaded and the crossfade to it has
  /// finished.
  Future<void> _currentPhotoShown([Future<void>? ready]) => Future.wait([
    ready ?? _photoReady(_currentIndex),
    Future<void>.delayed(_photoTransition),
  ]);

  /// Restarts the slideshow countdown for the current photo, then preloads
  /// the next one so it's ready when its turn comes.
  void _onPhotoShown() {
    final ready = _photoReady(_currentIndex);
    _slideshow.photoChanged(_currentPhotoShown(ready));
    if (_items.length < 2) return;
    final nextIndex = (_currentIndex + 1) % _items.length;
    ready.whenComplete(() {
      if (mounted) _photoReady(nextIndex, priority: ImageFetchPriority.low);
    });
  }

  void _next() {
    if (_currentIndex < _items.length - 1) {
      _goTo(_currentIndex + 1);
    } else {
      _goTo(0);
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      _goTo(_currentIndex - 1);
    } else {
      _goTo(_items.length - 1);
    }
  }

  bool _isVideo(AggregatedItem item) => item.type == 'Video';

  Future<void> _playVideo(AggregatedItem item) async {
    if (_slideshow.isRunning) {
      _slideshow.stop();
      setState(() {});
    }
    final manager = GetIt.instance<PlaybackManager>();
    try {
      await launchPlayerWhilePreparing(
        context,
        manager: manager,
        destination: Destinations.videoPlayer,
        startPlayback: (session) async {
          final data = await _client.itemsApi.getItem(item.id);
          final full = AggregatedItem(
            id: data['Id']?.toString() ?? item.id,
            serverId: GetIt.instance<MediaServerClientFactory>().serverIdOf(
              _client,
            ),
            rawData: data,
          );
          await runPlaybackStart(session, () => manager.playItems([full]));
          return true;
        },
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).failedToPlayChannel(item.name),
          ),
        ),
      );
    }
  }

  /// A swipe is one finger down, moved and lifted, on a photo that isn't
  /// zoomed in. Raw pointers are tracked rather than the viewer's scale
  /// callbacks, which only start once the finger has already moved and would
  /// also report a trackpad scroll.
  void _onPointerDown(PointerDownEvent e) {
    if (_pointerCount == 0) {
      _swipeStart = e.position;
      _swipeLast = e.position;
      _swipeIgnored = _transformController.value.getMaxScaleOnAxis() > 1.01;
    }
    _pointerCount++;
    if (_pointerCount > 1) _swipeIgnored = true;
  }

  void _onPointerMove(PointerMoveEvent e) => _swipeLast = e.position;

  void _onPointerUp(PointerUpEvent e) {
    _swipeLast = e.position;
    _onPointerDone(swipe: true);
  }

  void _onPointerCancel(PointerCancelEvent e) => _onPointerDone(swipe: false);

  void _onPointerDone({required bool swipe}) {
    if (_pointerCount > 0) _pointerCount--;
    if (_pointerCount > 0) return;
    final ignored = _swipeIgnored;
    _swipeIgnored = false;
    if (!swipe || ignored || _items.length < 2) return;
    final delta = _swipeLast - _swipeStart;
    if (delta.dx.abs() < _swipeMinDistance ||
        delta.dx.abs() < delta.dy.abs() * 1.5) {
      return;
    }
    _showControlsTemporarily();
    if (delta.dx < 0) {
      _next();
    } else {
      _previous();
    }
  }

  void _toggleSlideshow() {
    if (_slideshow.isRunning) {
      _slideshow.stop();
    } else {
      _slideshow.start(_currentPhotoShown());
    }
    setState(() {});
  }

  void _showControlsTemporarily() {
    setState(() => _controlsVisible = true);
    _scheduleHideControls();
  }

  void _scheduleHideControls() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() => _controlsVisible = false);
    });
  }

  void _toggleControls() {
    if (_controlsVisible) {
      _hideTimer?.cancel();
      setState(() => _controlsVisible = false);
    } else {
      _showControlsTemporarily();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: _onPointerDown,
        onPointerMove: _onPointerMove,
        onPointerUp: _onPointerUp,
        onPointerCancel: _onPointerCancel,
        child: GestureDetector(
          onTap: _toggleControls,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildPhotoView(),
              if (_items.isNotEmpty && _isVideo(_items[_currentIndex]))
                Center(
                  child: IconButton(
                    iconSize: 72,
                    tooltip: AppLocalizations.of(context).play,
                    icon: AdaptiveIcon(
                      Icons.play_circle_fill,
                      color: AppColorScheme.onSurface,
                      size: 72,
                    ),
                    onPressed: () => _playVideo(_items[_currentIndex]),
                  ),
                ),
              if (_controlsVisible) _buildOverlay(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoView() {
    if (_items.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: AppColorScheme.accent),
      );
    }

    final item = _items[_currentIndex];
    final url = _getImageUrl(item);
    if (url == null) {
      return Center(
        child: AdaptiveIcon(
          Icons.broken_image,
          color: AppColorScheme.onSurface.withValues(alpha: 0.38),
          size: 64,
        ),
      );
    }

    return AnimatedSwitcher(
      duration: _photoTransition,
      child: InteractiveViewer(
        key: ValueKey(item.id),
        transformationController: _transformController,
        minScale: 1.0,
        maxScale: 5.0,
        child: Center(
          child: OfflineAwareImage(
            imageUrl: url,
            fit: BoxFit.contain,
            // The viewer zooms to 5x, so the photo keeps its source pixels.
            decodeBound: DecodeBound.none,
            placeholder: (_, _) => Center(
              child: CircularProgressIndicator(color: AppColorScheme.accent),
            ),
            errorWidget: (_, _, _) => AdaptiveIcon(
              Icons.broken_image,
              color: AppColorScheme.onSurface,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    final item = _items.isNotEmpty ? _items[_currentIndex] : null;
    final padding = MediaQuery.of(context).padding;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              top: padding.top + 8,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColorScheme.scrim, Colors.transparent],
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: AdaptiveIcon(Icons.arrow_back, color: AppColorScheme.onSurface),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    }
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item?.name ?? '',
                    style: TextStyle(
                      color: AppColorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (_items.length > 1)
                  Text(
                    AppLocalizations.of(
                      context,
                    ).photoCountOf(_currentIndex + 1, _items.length),
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              bottom: padding.bottom + 16,
              left: 16,
              right: 16,
              top: 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColorScheme.scrim, Colors.transparent],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: AdaptiveIcon(
                    Icons.skip_previous,
                    color: AppColorScheme.onSurface,
                    size: 32,
                  ),
                  onPressed: _items.length > 1 ? _previous : null,
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: AdaptiveIcon(
                    _slideshow.isRunning ? Icons.pause : Icons.play_arrow,
                    color: AppColorScheme.onSurface,
                    size: 40,
                  ),
                  onPressed: _items.length > 1 ? _toggleSlideshow : null,
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: AdaptiveIcon(
                    Icons.skip_next,
                    color: AppColorScheme.onSurface,
                    size: 32,
                  ),
                  onPressed: _items.length > 1 ? _next : null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
