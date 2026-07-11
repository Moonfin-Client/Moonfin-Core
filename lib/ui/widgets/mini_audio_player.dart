import 'dart:async';

import 'offline_aware_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../util/focus/dpad_keys.dart';
import '../../util/platform_detection.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';
import '../screensaver/screensaver_controller.dart';

class MiniAudioPlayer extends StatefulWidget {
  const MiniAudioPlayer({super.key});

  @override
  State<MiniAudioPlayer> createState() => _MiniAudioPlayerState();
}

class _MiniAudioPlayerState extends State<MiniAudioPlayer> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _clientFactory = GetIt.instance<MediaServerClientFactory>();
  final _subs = <StreamSubscription>[];
  String? _dismissedItemId;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;

  @override
  void initState() {
    super.initState();
    _subs.addAll([
      _state.playingStream.listen((_) => _rebuild()),
      _queue.queueChangedStream.listen((_) => _rebuild()),
    ]);
    appRouter.routerDelegate.addListener(_onRouteChanged);
    PlayerRouteObserver.instance.isPlayerActive.addListener(_onRouteChanged);
  }

  void _onRouteChanged() {
    if (mounted) setState(() {});
  }

  void _rebuild() {
    final item = _currentItem;
    if (item == null || item.id != _dismissedItemId) {
      _dismissedItemId = null;
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    PlayerRouteObserver.instance.isPlayerActive.removeListener(_onRouteChanged);
    super.dispose();
  }

  AggregatedItem? get _currentItem {
    final raw = _queue.currentItem;
    return raw is AggregatedItem ? raw : null;
  }

  String? _artUrl(AggregatedItem item) {
    try {
      final client = _clientFactory.getClientIfExists(item.serverId) ??
          GetIt.instance<MediaServerClient>();
      final albumTag = item.albumPrimaryImageTag;
      final albumId = item.albumId;
      if (item.type == 'Audio' && albumTag != null && albumId != null) {
        return client.imageApi
            .getPrimaryImageUrl(albumId, maxHeight: 120, tag: albumTag);
      }
      if (item.primaryImageTag != null) {
        return client.imageApi
            .getPrimaryImageUrl(item.id, maxHeight: 120, tag: item.primaryImageTag);
      }
    } catch (_) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final path = appRouter.routerDelegate.currentConfiguration.uri.path;
    final hasPlayerMatch = appRouter.routerDelegate.currentConfiguration.matches.any(
      (m) => m.matchedLocation.startsWith('/player/') ||
             m.matchedLocation == '/live-tv/player',
    );
    if (path.startsWith('/player/') ||
        path == '/live-tv/player' ||
        hasPlayerMatch ||
        PlayerRouteObserver.instance.isPlayerActive.value) {
      return const SizedBox.shrink();
    }

    final item = _currentItem;
    if (item == null || !item.isAudioLike) {
      return const SizedBox.shrink();
    }

    final isPlaying = _state.isPlaying;
    final artUrl = _artUrl(item);

    if (PlatformDetection.isTV) {
      return _TvMiniAudioBar(
        item: item,
        artUrl: artUrl,
        isPlaying: isPlaying,
        state: _state,
        onPrev: _manager.previous,
        onPlayPause: isPlaying ? _manager.pause : _manager.resume,
        onNext: _manager.next,
        onStop: () => unawaited(_manager.stop(userInitiated: true)),
        onOpen: () => appRouter.push(Destinations.audioPlayer),
      );
    }

    if (_dismissedItemId == item.id) {
      return const SizedBox.shrink();
    }

    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    return Dismissible(
      key: ValueKey('mini-player-${item.id}'),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        setState(() => _dismissedItemId = item.id);
        unawaited(_manager.stop(userInitiated: false));
      },
      child: GestureDetector(
        onTap: () => appRouter.push(Destinations.audioPlayer),
        child: GlassSurface(
          cornerRadius: 0,
          fallbackColor: AppColorScheme.surface,
          padding: EdgeInsets.only(bottom: bottomPad),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(child: _ProgressSliver(state: _state)),
              SizedBox(
                height: 62,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      _ArtThumbnail(artUrl: artUrl),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _TrackInfo(item: item),
                      ),
                      _TransportButtons(
                        isPlaying: isPlaying,
                        onPrev: _manager.previous,
                        onPlayPause: isPlaying ? _manager.pause : _manager.resume,
                        onNext: _manager.next,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressSliver extends StatefulWidget {
  final PlayerState state;
  const _ProgressSliver({required this.state});

  @override
  State<_ProgressSliver> createState() => _ProgressSliverState();
}

class _ProgressSliverState extends State<_ProgressSliver> {
  StreamSubscription? _posSub;
  StreamSubscription? _durSub;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _position = widget.state.position;
    _duration = widget.state.duration;
    _posSub = widget.state.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });
    _durSub = widget.state.durationStream.listen((d) {
      if (mounted) setState(() => _duration = d);
    });
  }

  @override
  void dispose() {
    _posSub?.cancel();
    _durSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxMs = _duration.inMilliseconds.toDouble();
    final value = maxMs > 0
        ? (_position.inMilliseconds.toDouble().clamp(0, maxMs) / maxMs)
        : 0.0;

    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColorScheme.onSurface.withValues(alpha: 0.12),
      color: AppColorScheme.accent,
      minHeight: 2,
    );
  }
}

class _ArtThumbnail extends StatelessWidget {
  final String? artUrl;
  const _ArtThumbnail({this.artUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.circular(4),
      child: SizedBox(
        width: 44,
        height: 44,
        child: artUrl != null
            ? OfflineAwareImage(
                imageUrl: artUrl!,
                fit: BoxFit.cover,
                placeholder: (_, _) => _placeholder(),
                errorWidget: (_, _, _) => _placeholder(),
              )
            : _placeholder(),
      ),
    );
  }

  static Widget _placeholder() {
    return Container(
      color: AppColorScheme.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.music_note,
          size: 22,
          color: AppColorScheme.onSurface.withValues(alpha: 0.38),
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  final AggregatedItem item;
  const _TrackInfo({required this.item});

  @override
  Widget build(BuildContext context) {
    final artist = item.artists.isNotEmpty
        ? item.artists.join(', ')
        : item.albumArtist ?? '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (artist.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            artist,
            style: TextStyle(
              color: AppColorScheme.onSurface.withValues(alpha: 0.6),
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

class _TransportButtons extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPrev;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;

  const _TransportButtons({
    required this.isPlaying,
    required this.onPrev,
    required this.onPlayPause,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.skip_previous, size: 24, color: AppColorScheme.onSurface),
          onPressed: onPrev,
        ),
        IconButton(
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 28,
            color: AppColorScheme.onSurface,
          ),
          onPressed: onPlayPause,
        ),
        IconButton(
          icon: Icon(Icons.skip_next, size: 24, color: AppColorScheme.onSurface),
          onPressed: onNext,
        ),
      ],
    );
  }
}

/// TV variant of the mini player: a D-pad navigable bottom bar. Track info opens
/// the full audio player, transport has prev / play-pause / next and a dedicated
/// Stop (there is no swipe-to-dismiss on a remote).
class _TvMiniAudioBar extends StatelessWidget {
  final AggregatedItem item;
  final String? artUrl;
  final bool isPlaying;
  final PlayerState state;
  final VoidCallback onPrev;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onStop;
  final VoidCallback onOpen;

  const _TvMiniAudioBar({
    required this.item,
    required this.artUrl,
    required this.isPlaying,
    required this.state,
    required this.onPrev,
    required this.onPlayPause,
    required this.onNext,
    required this.onStop,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      onKeyEvent: (node, event) {
        if (event.logicalKey.isDownKey) {
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: FocusTraversalGroup(
        child: GlassSurface(
          cornerRadius: 0,
          fallbackColor: AppColorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(child: _ProgressSliver(state: state)),
              SizedBox(
                height: 84,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      Expanded(
                        child: _TvFocusable(
                          onSelect: onOpen,
                          builder: (focused) => _TvTrackInfo(
                            item: item,
                            artUrl: artUrl,
                            focused: focused,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _TvFocusable(
                        onSelect: onPrev,
                        builder: (f) => _tvCircle(Icons.skip_previous, f),
                      ),
                      const SizedBox(width: 12),
                      _TvFocusable(
                        onSelect: onPlayPause,
                        builder: (f) => _tvCircle(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          f,
                          large: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      _TvFocusable(
                        onSelect: onNext,
                        builder: (f) => _tvCircle(Icons.skip_next, f),
                      ),
                      const SizedBox(width: 12),
                      _TvFocusable(
                        onSelect: onStop,
                        builder: (f) => _tvCircle(Icons.stop, f),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tvCircle(IconData icon, bool focused, {bool large = false}) {
  final diameter = large ? 56.0 : 48.0;
  return AnimatedContainer(
    duration: const Duration(milliseconds: 90),
    width: diameter,
    height: diameter,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: focused
          ? AppColorScheme.onSurface
          : AppColorScheme.onSurface.withValues(alpha: 0.10),
    ),
    child: Icon(
      icon,
      size: large ? 30 : 26,
      color: focused ? AppColorScheme.surface : AppColorScheme.onSurface,
    ),
  );
}

class _TvTrackInfo extends StatelessWidget {
  final AggregatedItem item;
  final String? artUrl;
  final bool focused;
  const _TvTrackInfo({
    required this.item,
    required this.artUrl,
    required this.focused,
  });

  @override
  Widget build(BuildContext context) {
    final artist = item.artists.isNotEmpty
        ? item.artists.join(', ')
        : item.albumArtist ?? '';
    final fg = focused ? AppColorScheme.surface : AppColorScheme.onSurface;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 90),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular(12),
        color: focused ? AppColorScheme.onSurface : Colors.transparent,
      ),
      child: Row(
        children: [
          _ArtThumbnail(artUrl: artUrl),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: fg,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (artist.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    artist,
                    style: TextStyle(
                      color: fg.withValues(alpha: 0.7),
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A focusable D-pad target: activates [onSelect] on the remote Select/OK key
/// and shows focus via [builder]'s `focused` flag. Directional keys are left
/// unhandled so Flutter's focus traversal moves naturally (Up escapes the bar
/// back to content; the bar never traps focus, and never autofocuses on launch).
class _TvFocusable extends StatefulWidget {
  final VoidCallback onSelect;
  final Widget Function(bool focused) builder;
  const _TvFocusable({required this.onSelect, required this.builder});

  @override
  State<_TvFocusable> createState() => _TvFocusableState();
}

class _TvFocusableState extends State<_TvFocusable> {
  final _node = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focused != _node.hasFocus && mounted) {
      setState(() => _focused = _node.hasFocus);
    }
  }

  @override
  void dispose() {
    _node.removeListener(_onFocusChanged);
    _node.dispose();
    super.dispose();
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (GetIt.instance<ScreensaverController>().visible.value) {
      return KeyEventResult.ignored;
    }
    if (isActivateKey(event)) {
      widget.onSelect();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _node,
      onKeyEvent: _onKey,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onSelect,
        child: widget.builder(_focused),
      ),
    );
  }
}
