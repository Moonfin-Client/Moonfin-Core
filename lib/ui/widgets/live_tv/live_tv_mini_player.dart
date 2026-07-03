import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';

import '../../../playback/media_kit_player_backend.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';

class LiveTvMiniPlayer extends StatefulWidget {
  final String? imageUrl;
  final String channelName;
  final String? channelNumber;
  final String? programTitle;
  final VoidCallback onActivate;
  final FocusNode? focusNode;
  final FocusOnKeyEventCallback? onKeyEvent;
  final bool showLiveVideo;
  final ValueListenable<int?>? appleTvTextureId;

  /// When true the preview area is left fully transparent so a video surface
  /// rendered behind this widget shows through. Used by the in-player Live TV
  /// guide overlay, which draws the single player surface behind this focusable
  /// frame instead of duplicating it.
  final bool transparentPreview;

  const LiveTvMiniPlayer({
    super.key,
    this.imageUrl,
    required this.channelName,
    this.channelNumber,
    this.programTitle,
    required this.onActivate,
    this.focusNode,
    this.onKeyEvent,
    this.showLiveVideo = false,
    this.appleTvTextureId,
    this.transparentPreview = false,
  });

  @override
  State<LiveTvMiniPlayer> createState() => _LiveTvMiniPlayerState();
}

class _LiveTvMiniPlayerState extends State<LiveTvMiniPlayer> {
  final _manager = GetIt.instance<PlaybackManager>();
  final MediaKitPlayerBackend? _fallbackMediaKitBackend =
      (PlatformDetection.isTizen || PlatformDetection.isAppleTV)
      ? null
      : GetIt.instance<MediaKitPlayerBackend>();
  final _prefs = GetIt.instance<UserPreferences>();

  late FocusNode _effectiveFocusNode;
  bool _ownsFocusNode = false;
  bool _focused = false;
  StreamSubscription<PlayerBackend>? _backendSub;

  MediaKitPlayerBackend? get _activeMediaKitBackend {
    final backend = _manager.backend;
    return backend is MediaKitPlayerBackend ? backend : null;
  }

  Media3PlayerBackend? get _activeMedia3Backend {
    final backend = _manager.backend;
    return backend is Media3PlayerBackend ? backend : null;
  }

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _effectiveFocusNode.addListener(_onFocusChanged);
    _backendSub = _manager.backendChangedStream.listen((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant LiveTvMiniPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode == widget.focusNode) return;

    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsFocusNode) {
      _effectiveFocusNode.dispose();
    }

    _effectiveFocusNode = widget.focusNode ?? FocusNode();
    _ownsFocusNode = widget.focusNode == null;
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _backendSub?.cancel();
    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsFocusNode) {
      _effectiveFocusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged() {
    if (!mounted) return;
    final hasFocus = _effectiveFocusNode.hasFocus;
    if (_focused != hasFocus) {
      setState(() => _focused = hasFocus);
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    final override = widget.onKeyEvent?.call(node, event);
    if (override != null && override != KeyEventResult.ignored) {
      return override;
    }

    if (event is KeyDownEvent || event is KeyRepeatEvent) {
      if (event.logicalKey == LogicalKeyboardKey.select ||
          event.logicalKey == LogicalKeyboardKey.enter) {
        widget.onActivate();
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = ThemeRegistry.active.borders.focusBorder.color;
    final subtitle = widget.programTitle?.trim().isNotEmpty == true
        ? widget.programTitle!.trim()
        : widget.channelNumber == null || widget.channelNumber!.isEmpty
            ? widget.channelName
            : '${widget.channelNumber}  ${widget.channelName}';

    return Focus(
      focusNode: _effectiveFocusNode,
      onKeyEvent: _handleKeyEvent,
      child: InkWell(
        onTap: widget.onActivate,
        borderRadius: AppRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          decoration: BoxDecoration(
            color: widget.transparentPreview
                ? Colors.transparent
                : Colors.white.withValues(alpha: _focused ? 0.18 : 0.10),
            borderRadius: AppRadius.circular(12),
            border: Border.fromBorderSide(
              ThemeRegistry.active.borders.focusBorder.copyWith(
                color: _focused
                    ? focusColor
                    : ThemeRegistry.active.borders.cardBorder.color,
                width: _focused ? 2 : 1,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: AppRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildPreviewSurface(),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.channelName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: AppTypography.fontSizeMd,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              subtitle,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: AppTypography.fontSizeSm,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.open_in_full_rounded,
                        size: 18,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSurface() {
    if (widget.transparentPreview) {
      return const SizedBox.expand();
    }
    if (widget.showLiveVideo) {
      final liveSurface = _buildLiveVideoSurface();
      if (liveSurface != null) {
        return liveSurface;
      }
    }

    return _buildImageFallback();
  }

  Widget? _buildLiveVideoSurface() {
    if (PlatformDetection.isAppleTV) {
      final listenable = widget.appleTvTextureId;
      if (listenable == null) {
        return null;
      }
      return ValueListenableBuilder<int?>(
        valueListenable: listenable,
        builder: (context, textureId, _) {
          if (textureId == null) {
            return _buildImageFallback();
          }
          return FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 1280,
              height: 720,
              child: Texture(textureId: textureId),
            ),
          );
        },
      );
    }

    final prefersMedia3 =
        _prefs.get(UserPreferences.playbackEnginePreference) ==
        PlaybackEnginePreference.media3;
    final prewarmMedia3 = _manager.backend == null && prefersMedia3;

    if (_activeMedia3Backend != null || prewarmMedia3) {
      return null;
    }

    final mediaKitBackend = _activeMediaKitBackend ?? _fallbackMediaKitBackend;
    if (mediaKitBackend == null) {
      return null;
    }
    if (PlatformDetection.useNativeVideoSurface) {
      return NativeVideoView(
        player: mediaKitBackend.player,
        fill: Colors.black,
        videoOutput: 'gpu',
        hardwareDecodingEnabled: _prefs.get(UserPreferences.hardwareDecoding),
      );
    }

    final controller = mediaKitBackend.videoController;
    if (controller == null) {
      return null;
    }

    return Video(
      controller: controller,
      controls: NoVideoControls,
      fit: BoxFit.cover,
      fill: Colors.black,
      pauseUponEnteringBackgroundMode: false,
    );
  }

  Widget _buildImageFallback() {
    if (widget.imageUrl == null) {
      return Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Icon(Icons.tv, color: Colors.white70, size: 28),
      );
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl!,
      fit: BoxFit.cover,
      errorWidget: (_, _, _) => Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Icon(Icons.tv, color: Colors.white70, size: 28),
      ),
    );
  }
}
