import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../data/models/lyrics.dart';
import '../../../data/repositories/item_mutation_repository.dart';
import '../../../data/services/cast/cast_service.dart';
import '../../../data/services/cast/cast_target.dart';
import '../../../data/services/media_server_client_factory.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/remote_play_to_session_dialog.dart';
import '../../widgets/playback/lyrics_view.dart';
import '../../../l10n/app_localizations.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

enum _TvAudioFocusArea {
  topActions,
  progress,
  transport,
  queue,
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  static const _tvSeekStepMs = 10000;
  static const _tvBackPopSuppressDuration = Duration(milliseconds: 280);

  final _manager = GetIt.instance<PlaybackManager>();
  final _castService = GetIt.instance<CastService>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _mutations = GetIt.instance<ItemMutationRepository>();
  final _subs = <StreamSubscription>[];
  final _tvOverlayFocus = FocusNode(debugLabel: 'AudioPlayerTvOverlay');
  final _queueScrollController = ScrollController();
  bool _isExitingPlayback = false;
  bool _showQueue = false;
  bool _showLyrics = false;
  bool? _localFavorite;
  String? _favoriteItemId;
  LyricsData? _lyrics;
  String? _lyricsItemId;
  _TvAudioFocusArea _tvFocusArea = _TvAudioFocusArea.transport;
  int _tvTopActionIndex = 0;
  int _tvTransportActionIndex = 2;
  int _tvQueueFocusIndex = 0;
  DateTime? _tvBackPopSuppressedUntil;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;
  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _manager.backend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  MediaServerClient _clientForItem(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  @override
  void initState() {
    super.initState();
    _subs.addAll([
      _manager.backendChangedStream.listen((_) => _rebuild()),
      _state.playingStream.listen((_) => _rebuild()),
      _state.positionStream.listen((_) => _rebuild()),
      _state.durationStream.listen((_) => _rebuild()),
      _state.repeatModeStream.listen((_) => _rebuild()),
      _state.shuffleStream.listen((_) => _rebuild()),
      _queue.queueChangedStream.listen((_) {
        _syncTvQueueFocusIndex();
        _rebuild();
        _loadLyricsIfNeeded();
      }),
      _manager.sessionEndedStream.listen((_) {
        if (!mounted || _isExitingPlayback) return;
        unawaited(_exitPlayback());
      }),
    ]);
    if (PlatformDetection.useNativeVideoSurface) {
      unawaited(_activeMedia3Backend?.setVolume(100.0));
    }
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _tvOverlayFocus.requestFocus();
      });
    }
    _loadLyricsIfNeeded();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  void _toggleQueuePanel() {
    final nextShowQueue = !_showQueue;
    setState(() {
      _showQueue = nextShowQueue;
      if (_showQueue) {
        _showLyrics = false;
      }
      if (PlatformDetection.isTV && _showQueue) {
        _tvFocusArea = _TvAudioFocusArea.queue;
        _tvTopActionIndex = 1;
        _tvQueueFocusIndex = _initialTvQueueFocusIndex();
      } else if (PlatformDetection.isTV) {
        _tvFocusArea = _TvAudioFocusArea.topActions;
        _tvTopActionIndex = 1;
      }
    });

    if (PlatformDetection.isTV && nextShowQueue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _scrollTvQueueIntoView(_tvQueueFocusIndex);
      });
    }
  }

  bool get _canUseTopActionsOnTv => _resolveCurrentItem() != null;

  void _seekTvRelative(int deltaMs) {
    final totalMs = _state.duration.inMilliseconds;
    if (totalMs <= 0) return;
    final currentMs = _state.position.inMilliseconds;
    final targetMs = (currentMs + deltaMs).clamp(0, totalMs).toInt();
    unawaited(_manager.seekTo(Duration(milliseconds: targetMs)));
  }

  void _moveTvHorizontalFocus(int delta) {
    if (_tvFocusArea == _TvAudioFocusArea.topActions) {
      final next = (_tvTopActionIndex + delta).clamp(0, 1);
      if (next != _tvTopActionIndex) {
        setState(() => _tvTopActionIndex = next);
      }
      return;
    }

    if (_tvFocusArea == _TvAudioFocusArea.transport) {
      final next = (_tvTransportActionIndex + delta).clamp(0, 4);
      if (next != _tvTransportActionIndex) {
        setState(() => _tvTransportActionIndex = next);
      }
      return;
    }

    if (_tvFocusArea == _TvAudioFocusArea.progress) {
      _seekTvRelative(delta < 0 ? -_tvSeekStepMs : _tvSeekStepMs);
    }
  }

  void _moveTvVerticalFocus(int delta) {
    final current = _tvFocusArea;
    _TvAudioFocusArea next = current;

    if (delta < 0) {
      switch (current) {
        case _TvAudioFocusArea.transport:
          next = _TvAudioFocusArea.progress;
          break;
        case _TvAudioFocusArea.progress:
          next = _canUseTopActionsOnTv
              ? _TvAudioFocusArea.topActions
              : _TvAudioFocusArea.progress;
          break;
        case _TvAudioFocusArea.topActions:
        case _TvAudioFocusArea.queue:
          break;
      }
    } else if (delta > 0) {
      switch (current) {
        case _TvAudioFocusArea.topActions:
          next = _TvAudioFocusArea.progress;
          break;
        case _TvAudioFocusArea.progress:
          next = _TvAudioFocusArea.transport;
          break;
        case _TvAudioFocusArea.transport:
        case _TvAudioFocusArea.queue:
          break;
      }
    }

    if (next != current) {
      setState(() => _tvFocusArea = next);
    }
  }

  void _activateTvTopAction() {
    final item = _resolveCurrentItem();
    if (item == null) return;

    switch (_tvTopActionIndex) {
      case 0:
        unawaited(_toggleFavorite(item));
        return;
      case 1:
        _toggleQueuePanel();
        return;
    }
  }

  void _activateTvTransportAction() {
    switch (_tvTransportActionIndex) {
      case 0:
        _manager.toggleShuffle();
        return;
      case 1:
        unawaited(_manager.previous());
        return;
      case 2:
        if (_state.isPlaying) {
          unawaited(_manager.pause());
        } else {
          unawaited(_manager.resume());
        }
        return;
      case 3:
        unawaited(_manager.next());
        return;
      case 4:
        _manager.toggleRepeat();
        return;
    }
  }

  Widget _tvFocusShell({
    required bool focused,
    required Widget child,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) {
    if (!PlatformDetection.isTV) {
      return child;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: focused
              ? AppColorScheme.accent
              : AppColorScheme.onSurface.withValues(alpha: 0.0),
          width: 2.4,
        ),
        color: focused
            ? AppColorScheme.onSurface.withValues(alpha: 0.24)
            : Colors.transparent,
        boxShadow: focused
            ? [
                BoxShadow(
                  color: AppColorScheme.accent.withValues(alpha: 0.45),
                  blurRadius: 14,
                  spreadRadius: 1.4,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }

  int _initialTvQueueFocusIndex() {
    final count = _queue.items.length;
    if (count <= 0) return 0;
    final current = _queue.currentIndex;
    if (current < 0) return 0;
    if (current >= count) return count - 1;
    return current;
  }

  void _syncTvQueueFocusIndex() {
    if (!PlatformDetection.isTV || !_showQueue) return;
    final count = _queue.items.length;
    if (count <= 0) {
      if (_tvQueueFocusIndex != 0) {
        setState(() => _tvQueueFocusIndex = 0);
      }
      return;
    }

    final clamped = _tvQueueFocusIndex.clamp(0, count - 1);
    if (clamped != _tvQueueFocusIndex) {
      setState(() => _tvQueueFocusIndex = clamped);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _scrollTvQueueIntoView(_tvQueueFocusIndex, animate: false);
      });
    }
  }

  void _setTvQueueFocusIndex(int index) {
    final count = _queue.items.length;
    if (count <= 0) {
      if (_tvQueueFocusIndex != 0) {
        setState(() => _tvQueueFocusIndex = 0);
      }
      return;
    }

    final clamped = index.clamp(0, count - 1);
    if (clamped == _tvQueueFocusIndex) return;

    setState(() => _tvQueueFocusIndex = clamped);
    _scrollTvQueueIntoView(clamped);
  }

  void _scrollTvQueueIntoView(int index, {bool animate = true}) {
    if (!_queueScrollController.hasClients) return;
    final targetOffset = (index * 72.0).clamp(
      _queueScrollController.position.minScrollExtent,
      _queueScrollController.position.maxScrollExtent,
    );
    if (animate) {
      unawaited(
        _queueScrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
        ),
      );
    } else {
      _queueScrollController.jumpTo(targetOffset);
    }
  }

  bool _isTvBackPopSuppressed() {
    final until = _tvBackPopSuppressedUntil;
    if (!PlatformDetection.isTV || until == null) return false;
    if (DateTime.now().isAfter(until)) {
      _tvBackPopSuppressedUntil = null;
      return false;
    }
    return true;
  }

  void _suppressTvBackPop() {
    if (!PlatformDetection.isTV) return;
    _tvBackPopSuppressedUntil = DateTime.now().add(_tvBackPopSuppressDuration);
  }

  KeyEventResult _handleTvKeyEvent(FocusNode node, KeyEvent event) {
    if (!PlatformDetection.isTV || !event.isActionable) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;
    if (key.isBackKey) {
      if (event is KeyRepeatEvent) {
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (_showQueue) {
      if (key.isUpKey) {
        _setTvQueueFocusIndex(_tvQueueFocusIndex - 1);
        return KeyEventResult.handled;
      }
      if (key.isDownKey) {
        _setTvQueueFocusIndex(_tvQueueFocusIndex + 1);
        return KeyEventResult.handled;
      }
      if (key.isSelectKey) {
        final count = _queue.items.length;
        if (count > 0) {
          final index = _tvQueueFocusIndex.clamp(0, count - 1);
          unawaited(_manager.playFromQueue(index));
        }
        return KeyEventResult.handled;
      }
      if (key.isLeftKey || key.isRightKey) {
        _toggleQueuePanel();
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    if (key.isLeftKey) {
      _moveTvHorizontalFocus(-1);
      return KeyEventResult.handled;
    }

    if (key.isRightKey) {
      _moveTvHorizontalFocus(1);
      return KeyEventResult.handled;
    }

    if (key.isUpKey) {
      _moveTvVerticalFocus(-1);
      return KeyEventResult.handled;
    }

    if (key.isDownKey) {
      _moveTvVerticalFocus(1);
      return KeyEventResult.handled;
    }

    if (key.isSelectKey) {
      if (_tvFocusArea == _TvAudioFocusArea.topActions) {
        _activateTvTopAction();
      } else if (_tvFocusArea == _TvAudioFocusArea.transport) {
        _activateTvTransportAction();
      }
      return KeyEventResult.handled;
    }

    if (key.isContextMenuKey) {
      _toggleQueuePanel();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  bool _getIsFavorite(AggregatedItem item) {
    if (_favoriteItemId == item.id) return _localFavorite ?? item.isFavorite;
    return item.isFavorite;
  }

  Future<void> _toggleFavorite(AggregatedItem item) async {
    final current = _getIsFavorite(item);
    final newVal = !current;
    setState(() {
      _favoriteItemId = item.id;
      _localFavorite = newVal;
    });
    try {
      await _mutations.setFavorite(item.id, isFavorite: newVal);
    } catch (_) {
      if (mounted) setState(() => _localFavorite = current);
    }
  }

  Future<void> _exitPlayback() async {
    if (_isExitingPlayback || !mounted) return;
    _isExitingPlayback = true;
    try {
      await _manager.stop(userInitiated: false);
    } catch (_) {}
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    _tvOverlayFocus.dispose();
    _queueScrollController.dispose();
    super.dispose();
  }

  AggregatedItem? _resolveCurrentItem() {
    final currentItem = _queue.currentItem;
    if (currentItem is AggregatedItem) return currentItem;
    final meta = _manager.currentOfflineMetadata;
    if (meta == null) return null;
    final id = meta['Id'] as String? ?? '';
    final serverId = meta['ServerId'] as String? ?? '';
    return AggregatedItem(id: id, serverId: serverId, rawData: meta);
  }

  String? _offlinePosterPath() {
    final meta = _manager.currentOfflineMetadata;
    return meta?['_localPosterPath'] as String?;
  }

  Future<void> _loadLyricsIfNeeded() async {
    final resolved = _resolveCurrentItem();
    if (resolved == null) return;
    if (resolved.id == _lyricsItemId) return;
    _lyricsItemId = resolved.id;

    final meta = _manager.currentOfflineMetadata;
    final lyricsPath = meta?['_localLyricsPath'] as String?;
    if (lyricsPath != null) {
      try {
        final file = File(lyricsPath);
        if (await file.exists()) {
          final data = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
          if (mounted && _lyricsItemId == resolved.id) {
            setState(() => _lyrics = LyricsData.fromJson(data));
          }
          return;
        }
      } catch (_) {}
    }

    if (_manager.isOfflinePlayback) {
      if (mounted) setState(() => _lyrics = LyricsData.empty);
      return;
    }
    try {
      final client = _clientForItem(resolved);
      final data = await client.itemsApi.getLyrics(resolved.id);
      if (mounted && _lyricsItemId == resolved.id) {
        setState(() => _lyrics = LyricsData.fromJson(data));
      }
    } catch (_) {
      if (mounted) setState(() => _lyrics = LyricsData.empty);
    }
  }

  String? _getArtUrl(AggregatedItem item) {
    final client = _clientForItem(item);
    final albumTag = item.albumPrimaryImageTag;
    final albumId = item.albumId;
    if (item.type == 'Audio' && albumTag != null && albumId != null) {
      return client.imageApi
          .getPrimaryImageUrl(albumId, maxHeight: 600, tag: albumTag);
    }
    if (item.primaryImageTag != null) {
      return client.imageApi
          .getPrimaryImageUrl(item.id, maxHeight: 600, tag: item.primaryImageTag);
    }
    return null;
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  bool _shouldUseSplitLyricsLayout(BuildContext context) {
    if (_showQueue || _lyrics == null || _lyrics!.isEmpty) {
      return false;
    }
    final size = MediaQuery.sizeOf(context);
    final isLandscape = size.width > size.height;
    return !PlatformDetection.useMobileUi || isLandscape;
  }

  @override
  Widget build(BuildContext context) {
    final item = _resolveCurrentItem();
    final localPoster = _offlinePosterPath();
    final artUrl = item != null && !_manager.isOfflinePlayback ? _getArtUrl(item) : null;
    final useSplitLyricsLayout = _shouldUseSplitLyricsLayout(context);
    final attachMedia3View =
        PlatformDetection.useNativeVideoSurface && _activeMedia3Backend != null;

    final content = Stack(
      fit: StackFit.expand,
      children: [
        if (attachMedia3View)
          const Positioned(
            left: -2,
            top: -2,
            width: 1,
            height: 1,
            child: IgnorePointer(
              child: Media3VideoView(fill: Color(0x00000000)),
            ),
          ),
        if (localPoster != null && File(localPoster).existsSync())
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Image.file(
                File(localPoster),
                fit: BoxFit.cover,
                cacheWidth: 256,
                color: AppColorScheme.scrim.withValues(alpha: 0.54),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          )
        else if (artUrl != null)
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: CachedNetworkImage(
                imageUrl: artUrl,
                fit: BoxFit.cover,
                memCacheWidth: 256,
                color: AppColorScheme.scrim.withValues(alpha: 0.54),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
        SafeArea(
          child: Column(
            children: [
              _buildTopBar(context, item),
              Expanded(
                child: _showQueue
                    ? _buildQueueList()
                    : useSplitLyricsLayout
                        ? _buildNowPlayingWithLyrics(
                            item,
                            artUrl,
                            localPoster: localPoster,
                          )
                        : _showLyrics && _lyrics != null && _lyrics!.isNotEmpty
                        ? LyricsView(
                            lyrics: _lyrics!,
                            positionStream: _state.positionStream,
                            position: _state.position,
                          )
                        : _buildNowPlaying(item, artUrl, localPoster: localPoster),
              ),
              if (item != null &&
                  (PlatformDetection.isTV || (!_showQueue && !_showLyrics)))
                _buildFavoriteRow(item),
              _buildProgressBar(),
              _buildTransportControls(),
              const SizedBox(height: AppSpacing.spaceLg),
            ],
          ),
        ),
      ],
    );

    final tvWrappedContent = PlatformDetection.isTV
        ? Focus(
            focusNode: _tvOverlayFocus,
            autofocus: true,
            onKeyEvent: _handleTvKeyEvent,
            child: content,
          )
        : content;

    return PopScope(
      canPop: !_showQueue,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isTvBackPopSuppressed()) return;
        if (_showQueue) {
          _suppressTvBackPop();
          _toggleQueuePanel();
        }
      },
      child: Scaffold(
        backgroundColor: AppColorScheme.background,
        body: tvWrappedContent,
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, AggregatedItem? item) {
    final useSplitLyricsLayout = _shouldUseSplitLyricsLayout(context);
    final isTv = PlatformDetection.isTV;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceSm,
        vertical: AppSpacing.spaceXs,
      ),
      child: Row(
        children: [
          if (!isTv)
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          const Spacer(),
          if (_lyrics != null && _lyrics!.isNotEmpty && !useSplitLyricsLayout)
            IconButton(
              icon: Icon(
                Icons.lyrics_outlined,
                size: 24,
                color: _showLyrics ? AppColorScheme.accent : null,
              ),
              onPressed: () => setState(() {
                _showLyrics = !_showLyrics;
                if (_showLyrics) _showQueue = false;
              }),
            ),
          if (!isTv && item != null)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: _castService.activeKindNotifier,
              builder: (context, kind, _) => IconButton(
                icon: Icon(
                  _castIcon(kind),
                  size: 24,
                  color: kind != null ? AppColorScheme.accent : null,
                ),
                onPressed: () => _castToDevice(item),
              ),
            ),
          if (!isTv)
            ValueListenableBuilder<CastTargetKind?>(
              valueListenable: _castService.activeKindNotifier,
              builder: (context, kind, _) {
                if (kind == null) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.settings_remote_rounded, size: 24),
                  onPressed: _showCastControls,
                );
              },
            ),
          if (!isTv)
            IconButton(
              icon: Icon(
                _showQueue ? Icons.album : Icons.queue_music,
                size: 24,
                color: _showQueue ? AppColorScheme.accent : null,
              ),
              onPressed: _toggleQueuePanel,
            ),
        ],
      ),
    );
  }

  Widget _buildNowPlayingWithLyrics(
    AggregatedItem? item,
    String? artUrl, {
    String? localPoster,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: _buildNowPlaying(item, artUrl, localPoster: localPoster),
          ),
          const SizedBox(width: AppSpacing.spaceLg),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.spaceSm),
              child: LyricsView(
                lyrics: _lyrics!,
                positionStream: _state.positionStream,
                position: _state.position,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNowPlaying(AggregatedItem? item, String? artUrl, {String? localPoster}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxArtByWidth = (constraints.maxWidth - (AppSpacing.space2xl * 2))
            .clamp(160.0, 560.0);
        final maxArtByHeight = (constraints.maxHeight * 0.62)
            .clamp(160.0, 560.0);
        final artSize = maxArtByWidth < maxArtByHeight ? maxArtByWidth : maxArtByHeight;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space2xl),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: artSize,
                  height: artSize,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.black,
                          blurRadius: 30,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: localPoster != null && File(localPoster).existsSync()
                        ? Image.file(
                            File(localPoster),
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => _artPlaceholder(),
                          )
                        : artUrl != null
                            ? CachedNetworkImage(
                                imageUrl: artUrl,
                                fit: BoxFit.cover,
                                placeholder: (_, _) => _artPlaceholder(),
                                errorWidget: (_, _, _) => _artPlaceholder(),
                              )
                            : _artPlaceholder(),
                  ),
                ),
                const SizedBox(height: AppSpacing.spaceXl),
                Text(
                  item?.name ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.spaceXs),
                Text(
                  _artistLine(item),
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (item?.album != null) ...[
                  const SizedBox(height: AppSpacing.space2xs),
                  Text(
                    item!.album!,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _artPlaceholder() {
    return Container(
      color: AppColorScheme.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.music_note,
          size: 64,
          color: AppColorScheme.onSurface.withValues(alpha: 0.38),
        ),
      ),
    );
  }

  Widget _queueArtPlaceholder() {
    return Container(
      color: AppColorScheme.surfaceVariant,
      child: Icon(
        Icons.music_note,
        size: 24,
        color: AppColorScheme.onSurface.withValues(alpha: 0.38),
      ),
    );
  }

  String _artistLine(AggregatedItem? item) {
    if (item == null) return '';
    if (item.artists.isNotEmpty) return item.artists.join(', ');
    if (item.albumArtist != null) return item.albumArtist!;
    return '';
  }

  Future<void> _castToDevice(AggregatedItem item) async {
    if (_manager.isOfflinePlayback) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.castingUnavailableOffline)),
      );
      return;
    }

    final positionTicks = _state.position.inMicroseconds * 10;
    final startIndex = _queue.currentIndex < 0 ? 0 : _queue.currentIndex;
    final queueItems = _queue.items
        .skip(startIndex)
        .whereType<AggregatedItem>()
        .toList(growable: false);

    await showRemotePlayToSessionDialog(
      context,
      item: item,
      queueItems: queueItems.length > 1 ? queueItems : null,
      startPositionTicks: positionTicks,
      audioStreamIndex: _manager.audioStreamIndex,
      subtitleStreamIndex: _manager.subtitleStreamIndex,
    );
  }

  IconData _castIcon(CastTargetKind? kind) => switch (kind) {
    CastTargetKind.googleCast => Icons.cast_connected,
    CastTargetKind.airPlay => Icons.airplay,
    CastTargetKind.dlna => Icons.router,
    CastTargetKind.jellyfinSession => Icons.devices,
    null => Icons.cast,
  };

  Future<void> _runCastAction(
    Future<void> Function(CastTargetKind kind) action,
  ) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    try {
      await action(kind);
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final label = switch (kind) {
        CastTargetKind.googleCast => 'Google Cast',
        CastTargetKind.airPlay => 'AirPlay',
        CastTargetKind.dlna => 'DLNA',
        CastTargetKind.jellyfinSession => l10n.remotePlayback,
      };
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.castActionFailed(label, '$e'))));
    }
  }

  Future<void> _refreshRemoteVolume() async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    try {
      _castService.remoteVolumeNotifier.value = await _castService.getVolume(kind);
    } catch (_) {
      _castService.remoteVolumeNotifier.value = null;
    }
  }

  Future<void> _setRemoteVolume(double volume) async {
    final kind = _castService.activeKind;
    if (kind == null || !mounted) return;
    _castService.remoteVolumeNotifier.value = volume;
    try {
      await _castService.setVolume(kind, volume: volume);
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.failedToSetCastVolume('$e'))));
    }
  }

  void _showCastControls() {
    final kind = _castService.activeKind;
    if (kind == null) return;

    _refreshRemoteVolume();

    final l10n = AppLocalizations.of(context);
    final label = switch (kind) {
      CastTargetKind.googleCast => 'Google Cast',
      CastTargetKind.airPlay => 'AirPlay',
      CastTargetKind.dlna => 'DLNA',
      CastTargetKind.jellyfinSession => l10n.remotePlayback,
    };

    showFocusRestoringModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorScheme.surface,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: _castService.remoteStateNotifier,
              builder: (context, stateVal, _) {
                return ValueListenableBuilder<int>(
                  valueListenable: _castService.remotePositionNotifier,
                  builder: (context, ticks, _) => ListTile(
                    title: Text(
                      l10n.castControlsTitle(label),
                      style: TextStyle(
                        color: AppColorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: stateVal != null
                        ? Text(
                            '${stateVal[0].toUpperCase()}${stateVal.substring(1)}'
                            ' · ${_formatDuration(Duration(microseconds: ticks ~/ 10))}',
                            style: TextStyle(
                              color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
            if (kind == CastTargetKind.googleCast || kind == CastTargetKind.dlna)
              ListTile(
                leading: Icon(Icons.volume_up_rounded, color: AppColorScheme.onSurface),
                title: Text(
                  l10n.deviceVolume,
                  style: TextStyle(color: AppColorScheme.onSurface),
                ),
                subtitle: ValueListenableBuilder<double?>(
                  valueListenable: _castService.remoteVolumeNotifier,
                  builder: (context, vol, _) => vol == null
                      ? Text(
                          l10n.unavailable,
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                          ),
                        )
                      : SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: AppColorScheme.accent,
                            inactiveTrackColor:
                                AppColorScheme.onSurface.withValues(alpha: 0.24),
                            thumbColor: AppColorScheme.onSurface,
                            overlayColor:
                                AppColorScheme.onSurface.withValues(alpha: 0.24),
                          ),
                          child: Slider(
                            value: vol.clamp(0.0, 1.0),
                            min: 0,
                            max: 1,
                            onChanged: _setRemoteVolume,
                          ),
                        ),
                ),
                trailing: ValueListenableBuilder<double?>(
                  valueListenable: _castService.remoteVolumeNotifier,
                  builder: (context, vol, _) => vol == null
                      ? const SizedBox.shrink()
                      : Text(
                          '${(vol * 100).round()}%',
                          style: TextStyle(
                            color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                ),
              ),
            ListTile(
              leading: Icon(Icons.play_arrow_rounded, color: AppColorScheme.onSurface),
              title: Text(l10n.play, style: TextStyle(color: AppColorScheme.onSurface)),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.play(k));
              },
            ),
            ListTile(
              leading: Icon(Icons.pause_rounded, color: AppColorScheme.onSurface),
              title: Text(l10n.pause, style: TextStyle(color: AppColorScheme.onSurface)),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.pause(k));
              },
            ),
            ListTile(
              leading: Icon(Icons.sync_rounded, color: AppColorScheme.onSurface),
              title: Text(
                l10n.syncPosition,
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                final positionTicks = _state.position.inMicroseconds * 10;
                _runCastAction((k) => _castService.seek(k, positionTicks: positionTicks));
              },
            ),
            ListTile(
              leading: Icon(Icons.stop_rounded, color: AppColorScheme.onSurface),
              title: Text(
                l10n.stopCast(label),
                style: TextStyle(color: AppColorScheme.onSurface),
              ),
              onTap: () {
                Navigator.of(ctx).pop();
                _runCastAction((k) => _castService.stop(k));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteRow(AggregatedItem item) {
    final isTv = PlatformDetection.isTV;
    final isFav = _getIsFavorite(item);
    final favoriteButton = IconButton(
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        size: 28,
        color:
            isFav
                ? AppColorScheme.accent
                : AppColorScheme.onSurface.withValues(alpha: 0.7),
      ),
      onPressed: () => _toggleFavorite(item),
    );

    if (!isTv) {
      return favoriteButton;
    }

    final favoriteFocused =
        !_showQueue && _tvFocusArea == _TvAudioFocusArea.topActions &&
        _tvTopActionIndex == 0;
    final queueFocused =
        !_showQueue && _tvFocusArea == _TvAudioFocusArea.topActions &&
        _tvTopActionIndex == 1;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space2xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _tvFocusShell(
            focused: favoriteFocused,
            child: favoriteButton,
          ),
          const SizedBox(width: AppSpacing.spaceSm),
          _tvFocusShell(
            focused: queueFocused,
            child: IconButton(
              icon: Icon(
                _showQueue ? Icons.album : Icons.queue_music,
                size: 28,
                color: _showQueue
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: _toggleQueuePanel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final pos = _state.position;
    final dur = _state.duration;
    final maxMs = dur.inMilliseconds.toDouble();
    final isTvFocused =
        PlatformDetection.isTV &&
        !_showQueue &&
        _tvFocusArea == _TvAudioFocusArea.progress;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceXl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: AppColorScheme.rangeProgress,
              inactiveTrackColor: AppColorScheme.rangeTrack,
              thumbColor: (PlatformDetection.isTV && isTvFocused)
                  ? Colors.white
                  : AppColorScheme.rangeThumb,
              overlayColor: AppColorScheme.rangeThumb.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: maxMs > 0
                  ? pos.inMilliseconds.toDouble().clamp(0, maxMs)
                  : 0,
              max: maxMs > 0 ? maxMs : 1,
              onChanged: (v) {
                _manager.seekTo(Duration(milliseconds: v.toInt()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(pos),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  _formatDuration(dur),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransportControls() {
    final isTv = PlatformDetection.isTV;
    final isPlaying = _state.isPlaying;
    final repeatMode = _queue.repeatMode;
    final isShuffled = _queue.isShuffled;

    Widget wrapTvTransport({
      required int index,
      required Widget child,
      BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    }) {
      final focused =
          isTv && !_showQueue && _tvFocusArea == _TvAudioFocusArea.transport &&
          _tvTransportActionIndex == index;
      return _tvFocusShell(
        focused: focused,
        borderRadius: borderRadius,
        child: child,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          wrapTvTransport(
            index: 0,
            child: IconButton(
              icon: Icon(
                Icons.shuffle,
                size: 24,
                color: isShuffled
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: () => _manager.toggleShuffle(),
            ),
          ),
          wrapTvTransport(
            index: 1,
            child: IconButton(
              icon: Icon(
                Icons.skip_previous,
                size: 36,
                color: AppColorScheme.onSurface,
              ),
              onPressed: () => _manager.previous(),
            ),
          ),
          wrapTvTransport(
            index: 2,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.accent,
              ),
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: AppColorScheme.onSurface,
                ),
                onPressed: () {
                  if (isPlaying) {
                    _manager.pause();
                  } else {
                    _manager.resume();
                  }
                },
              ),
            ),
          ),
          wrapTvTransport(
            index: 3,
            child: IconButton(
              icon: Icon(
                Icons.skip_next,
                size: 36,
                color: AppColorScheme.onSurface,
              ),
              onPressed: () => _manager.next(),
            ),
          ),
          wrapTvTransport(
            index: 4,
            child: IconButton(
              icon: Icon(
                repeatMode == RepeatMode.repeatOne
                    ? Icons.repeat_one
                    : Icons.repeat,
                size: 24,
                color: repeatMode != RepeatMode.none
                    ? AppColorScheme.accent
                    : AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
              onPressed: () => _manager.toggleRepeat(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQueueList() {
    final items = _queue.items;
    final currentIdx = _queue.currentIndex;
    final isTv = PlatformDetection.isTV;

    if (items.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context).queueIsEmpty,
          style: TextStyle(color: AppColorScheme.onSurface.withValues(alpha: 0.54)),
        ),
      );
    }

    return ListView.builder(
      controller: isTv ? _queueScrollController : null,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceLg),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final raw = items[index];
        final item = raw is AggregatedItem ? raw : null;
        final isCurrent = index == currentIdx;
        final isTvFocused = isTv && index == _tvQueueFocusIndex;
        final artUrl = item != null ? _getArtUrl(item) : null;

        return ListTile(
          selected: isTvFocused,
          selectedTileColor: AppColorScheme.accent.withValues(alpha: 0.26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: isTvFocused
                ? BorderSide(color: AppColorScheme.accent, width: 2.4)
                : BorderSide.none,
          ),
          leading: SizedBox(
            width: 48,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: artUrl != null
                  ? CachedNetworkImage(
                      imageUrl: artUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, _) => _queueArtPlaceholder(),
                      errorWidget: (_, _, _) => _queueArtPlaceholder(),
                    )
                  : _queueArtPlaceholder(),
            ),
          ),
          title: Text(
            item?.name ?? AppLocalizations.of(context).trackNumber(index + 1),
            style: TextStyle(
              color: isCurrent ? AppColorScheme.accent : AppColorScheme.onSurface,
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _artistLine(item),
            style: TextStyle(
              fontSize: 12,
              color: AppColorScheme.onSurface.withValues(alpha: 0.5),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: isCurrent
              ? Icon(Icons.equalizer, color: AppColorScheme.accent, size: 20)
              : null,
          onTap: () {
            if (isTv) {
              _setTvQueueFocusIndex(index);
            }
            _manager.playFromQueue(index);
          },
        );
      },
    );
  }
}
