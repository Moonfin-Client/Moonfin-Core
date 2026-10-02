import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../data/models/trickplay_info.dart';
import '../../data/models/trickplay_preview_layout.dart';
import '../../data/models/media_segment.dart';
import '../../data/services/media_segment_service.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../../playback/hdr_composition.dart';
import '../../playback/media_kit_player_backend.dart';
import '../../preference/preference_constants.dart';
import '../../preference/user_preferences.dart';
import '../../util/auto_hdr_switcher.dart';
import '../../util/platform_detection.dart';
import '../../util/playback_time_label.dart';
import '../../syncplay/syncplay_manager.dart';
import '../navigation/app_router.dart';
import '../navigation/destinations.dart';
import '../screens/playback/hdr_overlay_capture.dart';
import 'adaptive/sf_symbol.dart';
import '../screensaver/screensaver_controller.dart';
import 'aether_video_view.dart';
import 'player_volume_control.dart';
import 'playback/seek_icons.dart';
import 'playback/track_picker.dart';
import 'playback/trickplay.dart';
import 'playback/trickplay_tile_image.dart';
import 'syncplay/syncplay_player_button.dart';

/// Whether the video player has been shrunk into the bar along the bottom of
/// the app. Playback keeps running in [PlaybackManager] the whole time; this
/// tracks that the viewer left the full player without stopping it, and holds
/// what the player screen hands over while it is gone: the native HDR session
/// on Windows, the display's HDR mode, and the autoplay setting.
class VideoMiniPlayerController {
  VideoMiniPlayerController._() {
    PlayerRouteObserver.instance.isPlayerActive.addListener(_onPlayerRoute);
    GetIt.instance<PlaybackManager>().sessionEndedStream.listen((_) => clear());
  }

  static final instance = VideoMiniPlayerController._();

  /// Desktop only. macOS draws AetherEngine into whichever view attached last,
  /// and Windows shows mpv's texture or moves its native HDR window into the
  /// thumbnail. Phones and tablets have system PiP instead.
  static bool get isSupported =>
      PlatformDetection.isMacOS || PlatformDetection.isWindows;

  /// App lifetime, so the display's HDR mode survives the player screen going
  /// away while the video keeps playing here. The player screen borrows it.
  final autoHdrSwitcher = AutoHdrSwitcher();

  /// The thumbnail's rect in logical pixels while the native HDR window shows
  /// through it. Everything Flutter paints under this rect has to stay
  /// transparent, or it covers the video sitting behind the window.
  final ValueNotifier<Rect?> hdrHole = ValueNotifier<Rect?>(null);

  bool _minimized = false;

  /// Between a minimize and either the player taking over again or the bar
  /// ending. While true this controller owns what the screen handed over.
  bool _holdsSession = false;

  bool get isMinimized => _minimized;

  /// Whether the bar shows: minimized, with no player route on screen.
  final ValueNotifier<bool> visible = ValueNotifier<bool>(false);

  /// The backend whose native HDR window this controller may present, on
  /// Windows only.
  MediaKitPlayerBackend? get hdrBackend =>
      PlatformDetection.supportsNativeHdrWindow &&
          GetIt.instance.isRegistered<MediaKitPlayerBackend>()
      ? GetIt.instance<MediaKitPlayerBackend>()
      : null;

  /// Called by the player screen as it goes. [screen] is its HDR presenter
  /// identity: when the video sits behind a transparent Flutter window the
  /// session moves here instead of being torn down, so the HDR picture, and
  /// the display mode with it, carry on into the thumbnail.
  void minimize({Object? screen}) {
    _minimized = true;
    _holdsSession = true;
    final backend = hdrBackend;
    if (screen != null &&
        backend != null &&
        HdrComposition.videoBehindFlutter &&
        !backend.hdrOutput.hasFailed) {
      backend.transferNativeHdrPresenter(from: screen, to: this);
    }
    _sync();
  }

  void playerScreenOpened(Object screen) {
    _minimized = false;
    if (_holdsSession) {
      _holdsSession = false;
      hdrHole.value = null;
      hdrBackend?.transferNativeHdrPresenter(from: this, to: screen);
    }
    _sync();
  }

  void clear() {
    _minimized = false;
    _sync();
  }

  // Any player taking the screen again, the restored video or something new
  // started from a detail page, owns playback from then on.
  void _onPlayerRoute() {
    if (PlayerRouteObserver.instance.isPlayerActive.value) _minimized = false;
    _sync();
  }

  // The route observer fires while the navigator builds, and a listener
  // outside the navigator marked dirty then is never rebuilt, which left the
  // bar up under a reopened player. Settle the value after the frame instead.
  void _sync() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      visible.value =
          _minimized && !PlayerRouteObserver.instance.isPlayerActive.value;
      // Nobody took the session back (the video stopped, or another kind of
      // player opened), so hand back what the player screen would have.
      if (!_minimized && _holdsSession) _end();
    });
    SchedulerBinding.instance.ensureVisualUpdate();
  }

  void _end() {
    _holdsSession = false;
    hdrHole.value = null;
    final backend = hdrBackend;
    if (backend != null) unawaited(backend.releaseNativeHdrPresenter(this));
    unawaited(autoHdrSwitcher.restore());
    GetIt.instance<PlaybackManager>().autoAdvanceEnabled = true;
    TrackPicker.resetDelays();
  }
}

class VideoMiniPlayer extends StatelessWidget {
  const VideoMiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    if (!VideoMiniPlayerController.isSupported) return const SizedBox.shrink();
    return ValueListenableBuilder<bool>(
      valueListenable: VideoMiniPlayerController.instance.visible,
      builder: (context, visible, _) =>
          visible ? const _VideoMiniPlayerBar() : const SizedBox.shrink(),
    );
  }
}

class _VideoMiniPlayerBar extends StatefulWidget {
  const _VideoMiniPlayerBar();

  @override
  State<_VideoMiniPlayerBar> createState() => _VideoMiniPlayerBarState();
}

class _VideoMiniPlayerBarState extends State<_VideoMiniPlayerBar> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _prefs = GetIt.instance<UserPreferences>();
  final _subs = <StreamSubscription>[];
  final _barKey = GlobalKey();

  /// While a picker opened from here is up. Its barrier covers the
  /// navigator, not this bar, so the bar stops taking clicks itself instead
  /// of stacking a second dialog on every press.
  bool _pickerOpen = false;
  final _screensaver = GetIt.instance<ScreensaverController>();

  static const _trickplayFrameWidth = 320;
  TrickplayInfo? _trickplay;
  String? _trickplayItemId;
  String? _trickplaySourceId;
  int _trickplayGeneration = 0;

  /// The player's own volume, 0-100, which desktop drives instead of the OS.
  double _volume = 100;
  double _volumeBeforeMute = 100;
  Timer? _persistVolumeTimer;

  MediaSegmentService? _segments;
  MediaSegment? _askSegment;
  Duration? _askSkipTo;

  PlayerState get _state => _manager.state;
  QueueService get _queue => _manager.queueService;

  bool get _inSyncPlay => _manager.hasTransportInterceptor;

  @override
  void initState() {
    super.initState();
    _screensaver.setPlaybackActive(_state.isPlaying);
    _volume = _prefs
        .get(UserPreferences.playerVolume)
        .clamp(0.0, 100.0)
        .toDouble();
    _subs.addAll([
      _state.playingStream.listen((playing) {
        _screensaver.setPlaybackActive(playing);
        _rebuild();
      }),
      _queue.queueChangedStream.listen((_) {
        _rebuild();
        unawaited(_loadTrickplay());
        unawaited(_loadSegments());
      }),
      _state.positionStream.listen(_checkSegments),
      // A new backend starts at its own default, so it gets the level back.
      _manager.backendChangedStream.listen(
        (backend) => unawaited(backend.setVolume(_volume)),
      ),
      // A session remote sets the level without coming through here.
      _manager.volumeStream.listen((level) {
        if ((level - _volume).abs() < 0.5) return;
        setState(() => _volume = level);
        _persistVolume();
      }),
    ]);
    unawaited(_loadTrickplay());
    unawaited(_loadSegments());
  }

  void _setVolume(double fraction) {
    final level = (fraction * 100).clamp(0.0, 100.0).toDouble();
    setState(() => _volume = level);
    unawaited(_manager.backend?.setVolume(level));
    _manager.reportVolumeState(volume: level, isMuted: level <= 0);
    _persistVolume();
  }

  void _toggleMute() {
    if (_volume > 0) {
      _volumeBeforeMute = _volume;
      _setVolume(0);
    } else {
      _setVolume((_volumeBeforeMute > 0 ? _volumeBeforeMute : 100) / 100);
    }
  }

  void _persistVolume() {
    _persistVolumeTimer?.cancel();
    _persistVolumeTimer = Timer(const Duration(milliseconds: 400), () {
      unawaited(_prefs.set(UserPreferences.playerVolume, _volume));
    });
  }

  /// Intro and credits skipping keeps working while minimized: the same
  /// service the full player uses, with the "ask" case as a button in the bar
  /// instead of the overlay.
  Future<void> _loadSegments() async {
    final item = _queue.currentItem;
    _segments?.clear();
    if (_askSegment != null) setState(() => _askSegment = null);
    if (item is! AggregatedItem) return;
    final client = _clientFor(item);
    final service = MediaSegmentService(
      client,
      FeatureDetector(serverType: client.serverType, serverVersion: ''),
      _prefs,
    );
    _segments = service;
    await service.loadSegments(item.id);
  }

  void _checkSegments(Duration position) {
    final service = _segments;
    if (service == null || !mounted) return;
    final result = service.checkPosition(position);
    if (result.shouldSkip && result.skipTo != null) {
      unawaited(_manager.seekTo(result.skipTo!));
      if (_askSegment != null) setState(() => _askSegment = null);
      return;
    }
    if (result.shouldAsk && result.segment != null) {
      if (_askSegment?.id != result.segment!.id) {
        setState(() {
          _askSegment = result.segment;
          _askSkipTo = result.skipTo;
        });
      }
    } else if (result.isNone && _askSegment != null) {
      setState(() => _askSegment = null);
    }
  }

  /// What the right side needs besides the volume slider: its icon buttons,
  /// plus room for the skip label when it shows.
  double _rightSideWidth(double scale) {
    var buttons = 3; // audio, volume or mute, and open player
    if (_streamCount('Subtitle') > 0 || _canDownloadSubtitles) buttons++;
    if (GetIt.instance.isRegistered<SyncPlayManager>() &&
        GetIt.instance<SyncPlayManager>().state.enabled) {
      buttons++;
    }
    return buttons * 44 * scale + (_askSegment != null ? 160 : 0);
  }

  int _streamCount(String type) =>
      _manager.currentResolution?.mediaStreams
          .where((s) => s['Type'] == type)
          .length ??
      0;

  bool get _canDownloadSubtitles {
    final item = _queue.currentItem;
    return item is AggregatedItem &&
        TrackPicker.canDownloadRemoteSubtitles(item);
  }

  Future<void> _pickTrack({required bool audio}) async {
    if (_pickerOpen) return;
    // The bar sits outside the app's navigator, so the dialog opens on it.
    final navigatorContext =
        appRouter.routerDelegate.navigatorKey.currentContext;
    if (navigatorContext == null) return;
    setState(() => _pickerOpen = true);
    try {
      await TrackPicker.show(
        navigatorContext,
        manager: _manager,
        audio: audio,
        clientFor: _clientFor,
      );
    } finally {
      if (mounted) setState(() => _pickerOpen = false);
    }
  }

  void _skipAskedSegment() {
    final target = _askSkipTo;
    setState(() => _askSegment = null);
    if (target != null) unawaited(_manager.seekTo(target));
  }

  MediaServerClient _clientFor(AggregatedItem item) =>
      GetIt.instance<MediaServerClientFactory>().getClientIfExists(
        item.serverId,
      ) ??
      GetIt.instance<MediaServerClient>();

  /// Same sources as the full player: the item's own trickplay manifest, or
  /// the server's thumbnail set when the item carries none.
  Future<void> _loadTrickplay() async {
    final generation = ++_trickplayGeneration;
    final item = _queue.currentItem;
    final sourceId = _manager.currentResolution?.mediaSourceId;
    if (item is! AggregatedItem ||
        _prefs.get(UserPreferences.trickPlayMode) == TrickplayMode.disabled) {
      if (mounted) setState(() => _trickplay = null);
      return;
    }
    if (item.id == _trickplayItemId && sourceId == _trickplaySourceId) return;

    var info = TrickplayInfo.fromItemData(
      item.rawData,
      mediaSourceId: sourceId,
    );
    if (info == null) {
      try {
        final set = await _clientFor(item).trickplayApi?.getThumbnailSet(
          item.id,
          width: _trickplayFrameWidth,
          mediaSourceId: sourceId,
        );
        if (set != null && set.isValid) {
          info = TrickplayInfo.fromThumbnailSet(
            set,
            width: _trickplayFrameWidth,
          );
        }
      } catch (_) {
      }
    }
    if (!mounted || generation != _trickplayGeneration) return;
    setState(() {
      _trickplay = info?.isValid == true ? info : null;
      _trickplayItemId = item.id;
      _trickplaySourceId = sourceId;
    });
  }

  TrickplayTile? _trickplayTileAt(Duration position) {
    final info = _trickplay;
    final item = _queue.currentItem;
    if (info == null || item is! AggregatedItem) return null;
    final duration = _state.duration;
    final at = duration > Duration.zero && position >= duration
        ? duration - const Duration(milliseconds: 1)
        : position;
    final resolution = info.resolveTile(at);
    final client = _clientFor(item);
    final String? url;
    if (!info.usesIndividualFrames) {
      url = client.imageApi.getTrickplayTileImageUrl(
        item.id,
        width: info.width,
        index: resolution.imageIndex,
        mediaSourceId: _trickplaySourceId,
      );
    } else if (resolution.imageIndex < 0 ||
        resolution.imageIndex >= info.frames.length) {
      return null;
    } else {
      final frame = info.frames[resolution.imageIndex];
      url = client.trickplayApi?.getFrameImageUrl(
        item.id,
        width: info.width,
        positionTicks: resolution.positionTicks ?? frame.positionTicks,
        imageTag: resolution.imageTag ?? frame.imageTag,
        mediaSourceId: _trickplaySourceId,
      );
    }
    if (url == null) return null;
    final token = client.accessToken;
    return TrickplayTile(
      url: url,
      headers: {
        ...serverImageHeaders,
        if (token != null && token.isNotEmpty)
          'Authorization': 'MediaBrowser Token="$token"',
      },
      resolution: resolution,
    );
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    if (_persistVolumeTimer?.isActive ?? false) {
      _persistVolumeTimer!.cancel();
      unawaited(_prefs.set(UserPreferences.playerVolume, _volume));
    }
    // A reopened player has already claimed the display, so only let go
    // when the bar closes on its own.
    if (!PlayerRouteObserver.instance.isPlayerActive.value) {
      _screensaver.setPlaybackActive(false);
    }
    super.dispose();
  }

  void _openPlayer() => appRouter.push(Destinations.videoPlayer);

  /// Stops this client only. In a SyncPlay group a user stop would end
  /// playback for everyone, while leaving the full player only stops here, so
  /// the bar does the same.
  Future<void> _stop() async {
    VideoMiniPlayerController.instance.clear();
    await _manager.stop(userInitiated: !_inSyncPlay);
  }

  /// Resumes the way the full player does, stepping back by the configured
  /// unpause rewind first, except in a SyncPlay group.
  Future<void> _togglePlayPause() async {
    if (_state.isPlaying) {
      await _manager.pause();
      return;
    }
    // In a group the seek is debounced and could land after the unpause, and
    // the group's unpause carries the position anyway.
    final rewindMs = _inSyncPlay
        ? 0
        : _prefs.get(UserPreferences.unpauseRewindDuration);
    if (rewindMs > 0) {
      final rewind = Duration(milliseconds: rewindMs);
      final current = _state.position;
      try {
        await _manager.seekTo(
          current > rewind ? current - rewind : Duration.zero,
        );
      } catch (_) {}
    }
    await _manager.resume();
  }

  void _seekRelative(int ms) {
    final target = _state.position + Duration(milliseconds: ms);
    final duration = _state.duration;
    final upper = duration > Duration.zero ? duration : target;
    final clamped = target < Duration.zero
        ? Duration.zero
        : (target > upper ? upper : target);
    unawaited(_manager.seekTo(clamped));
  }

  ({String title, String? subtitle}) _describe(Object? item) {
    String? name;
    String? series;
    int? season;
    int? episode;
    if (item is AggregatedItem) {
      name = item.name;
      series = item.seriesName;
      season = item.parentIndexNumber;
      episode = item.indexNumber;
    } else {
      final meta = item is Map ? item : _manager.currentOfflineMetadata;
      name = meta?['Name'] as String?;
      series = meta?['SeriesName'] as String?;
      season = meta?['ParentIndexNumber'] as int?;
      episode = meta?['IndexNumber'] as int?;
      if (name == null && item is String) name = item.split('/').last;
    }
    name ??= '';
    if (series == null || series.isEmpty) return (title: name, subtitle: null);
    final number = episode == null ? null : 'S${season ?? '?'} · E$episode';
    final subtitle = [?number, if (name.isNotEmpty) name].join(' — ');
    return (title: series, subtitle: subtitle.isEmpty ? null : subtitle);
  }

  @override
  Widget build(BuildContext context) {
    final item = _queue.currentItem;
    if (item == null || (item is AggregatedItem && item.isAudioLike)) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    final info = _describe(item);
    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    // While the native HDR window shows through the thumbnail, the bar's own
    // fill must not paint over it.
    return AbsorbPointer(
      absorbing: _pickerOpen,
      child: ClipPath(
        key: _barKey,
        clipper: _HoleClipper(
          hole: VideoMiniPlayerController.instance.hdrHole,
          originKey: _barKey,
        ),
        child: GlassSurface(
          cornerRadius: 0,
          fallbackColor: AppColorScheme.surface,
          padding: EdgeInsets.only(bottom: bottomPad),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 720;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MiniProgressBar(
                    state: _state,
                    onSeek: (position) => unawaited(_manager.seekTo(position)),
                    tileAt: _trickplayTileAt,
                  ),
                  wide
                      ? _buildWide(l10n, info.title, info.subtitle)
                      : _buildCompact(l10n, info.title, info.subtitle),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWide(AppLocalizations l10n, String title, String? subtitle) {
    final back = _prefs.get(UserPreferences.skipBackLength);
    final forward = _prefs.get(UserPreferences.skipForwardLength);
    final scale = _prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    return SizedBox(
      height: 96,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  _VideoThumbnail(height: 80, onTap: _openPlayer),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _TitleBlock(
                      title: title,
                      subtitle: subtitle,
                      state: _state,
                      showTime: true,
                    ),
                  ),
                ],
              ),
            ),
            _TransportButton(
              icon: Icons.skip_previous_rounded,
              tooltip: l10n.playerTooltipPrevious,
              size: 24 * scale,
              extent: 44 * scale,
              onPressed: _manager.previous,
            ),
            _TransportButton(
              icon: seekBackIcon(back),
              tooltip: l10n.playerTooltipSeekBack,
              size: 28 * scale,
              extent: 48 * scale,
              onPressed: () => _seekRelative(-back),
            ),
            _TransportButton(
              icon: _state.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              tooltip: _state.isPlaying ? l10n.pause : l10n.play,
              size: 38 * scale,
              extent: 56 * scale,
              onPressed: _togglePlayPause,
            ),
            _TransportButton(
              icon: seekForwardIcon(forward),
              tooltip: l10n.playerTooltipSeekForward,
              size: 28 * scale,
              extent: 48 * scale,
              onPressed: () => _seekRelative(forward),
            ),
            _TransportButton(
              icon: Icons.skip_next_rounded,
              tooltip: l10n.next,
              size: 24 * scale,
              extent: 44 * scale,
              onPressed: _manager.next,
            ),
            _TransportButton(
              icon: Icons.stop_rounded,
              tooltip: l10n.stop,
              size: 24 * scale,
              extent: 44 * scale,
              onPressed: _stop,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_askSegment case final segment?)
                      Flexible(
                        child: _SkipSegmentButton(
                          label: l10n.skipSegment(segment.type.displayName),
                          onPressed: _skipAskedSegment,
                        ),
                      ),
                    if (_streamCount('Subtitle') > 0 || _canDownloadSubtitles)
                      _TransportButton(
                        icon: _streamCount('Subtitle') == 0
                            ? Icons.download_rounded
                            : Icons.subtitles_outlined,
                        tooltip: l10n.subtitles,
                        size: 22 * scale,
                        extent: 44 * scale,
                        onPressed: () => unawaited(_pickTrack(audio: false)),
                      ),
                    _TransportButton(
                      icon: Icons.audiotrack_outlined,
                      tooltip: l10n.audio,
                      size: 22 * scale,
                      extent: 44 * scale,
                      onPressed: () => unawaited(_pickTrack(audio: true)),
                    ),
                    if (GetIt.instance.isRegistered<SyncPlayManager>())
                      SyncPlayPlayerButton(
                        size: 22 * scale,
                        extent: 44 * scale,
                        sheetContext: () => appRouter
                            .routerDelegate
                            .navigatorKey
                            .currentContext,
                      ),
                    if (PlatformDetection.isDesktop &&
                        constraints.maxWidth >= _rightSideWidth(scale) + 168)
                      PlayerVolumeControl(
                        volume: _volume / 100,
                        onChanged: _setVolume,
                        onToggleMute: _toggleMute,
                      )
                    else if (PlatformDetection.isDesktop)
                      _TransportButton(
                        icon: volumeIconFor(_volume / 100),
                        tooltip: _volume > 0 ? l10n.mute : l10n.unmute,
                        size: 22 * scale,
                        extent: 44 * scale,
                        onPressed: _toggleMute,
                      ),
                    _TransportButton(
                      icon: Icons.open_in_full_rounded,
                      tooltip: l10n.miniPlayerOpenPlayer,
                      size: 22 * scale,
                      extent: 44 * scale,
                      onPressed: _openPlayer,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompact(AppLocalizations l10n, String title, String? subtitle) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            _VideoThumbnail(height: 52, onTap: _openPlayer),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _openPlayer,
                child: _TitleBlock(
                  title: title,
                  subtitle: subtitle,
                  state: _state,
                  showTime: false,
                ),
              ),
            ),
            _TransportButton(
              icon: _state.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              tooltip: _state.isPlaying ? l10n.pause : l10n.play,
              onPressed: _togglePlayPause,
            ),
            if (_askSegment case final segment?)
              _SkipSegmentButton(
                label: l10n.skipSegment(segment.type.displayName),
                onPressed: _skipAskedSegment,
              ),
            _TransportButton(
              icon: Icons.close_rounded,
              tooltip: l10n.stop,
              onPressed: _stop,
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final double height;
  final VoidCallback onTap;

  const _VideoThumbnail({required this.height, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ClipRRect(
          borderRadius: AppRadius.circular(_thumbnailRadius),
          child: SizedBox(
            height: height,
            width: height * 16 / 9,
            child: PlatformDetection.isWindows
                ? const _WindowsVideoSurface()
                : const ColoredBox(
                    color: Colors.black,
                    // The engine draws into whichever view attached last, so
                    // this takes the video over from the player and hands it
                    // back on restore.
                    child: AetherVideoView(),
                  ),
          ),
        ),
      ),
    );
  }
}

const _thumbnailRadius = 6.0;

/// mpv's picture on Windows, in whichever of its two outputs it is on.
///
/// SDR plays into media_kit's texture, shared with the full player, so this
/// is the same `Video` the Live TV preview uses. HDR on an HDR display plays
/// into mpv's own window behind the transparent Flutter window: the session
/// came here from the player screen, so the window moves to this rect and the
/// thumbnail paints nothing, leaving a hole the picture shows through, still
/// in HDR. Either can change while minimized, when the next item is HDR or not
/// or the window crosses onto another monitor.
class _WindowsVideoSurface extends StatelessWidget {
  const _WindowsVideoSurface();

  @override
  Widget build(BuildContext context) {
    final controller = VideoMiniPlayerController.instance;
    final backend = controller.hdrBackend;
    if (backend == null) return const ColoredBox(color: Colors.black);
    final hdr = backend.hdrOutput;
    return ListenableBuilder(
      listenable: Listenable.merge([hdr.status, backend.nativeRendererCycling]),
      builder: (context, _) {
        final native = hdr.isEngaged && identical(hdr.presenter, controller);
        if (!native) return _texture(backend);
        // A renderer cycle shows nothing in the window for a moment, and the
        // desktop would show through the hole.
        if (backend.nativeRendererCycling.value) {
          return const ColoredBox(color: Colors.black);
        }
        return _HdrHole(
          onGeometry: (rect) => unawaited(hdr.window.claim(controller, rect)),
          onDetached: () => unawaited(hdr.window.release(controller)),
        );
      },
    );
  }

  Widget _texture(MediaKitPlayerBackend backend) {
    final videoController = backend.videoController;
    if (videoController == null) {
      return const ColoredBox(color: Colors.black);
    }
    return Video(
      controller: videoController,
      controls: NoVideoControls,
      fill: Colors.black,
      // The full player paused on backgrounding; a thumbnail must not.
      pauseUponEnteringBackgroundMode: false,
      subtitleViewConfiguration: const SubtitleViewConfiguration(
        visible: false,
      ),
    );
  }
}

/// Paints nothing, and tells the native HDR window where to sit and the rest
/// of the app where to stay transparent.
class _HdrHole extends StatefulWidget {
  final void Function(Rect rect) onGeometry;
  final VoidCallback onDetached;

  const _HdrHole({required this.onGeometry, required this.onDetached});

  @override
  State<_HdrHole> createState() => _HdrHoleState();
}

class _HdrHoleState extends State<_HdrHole> {
  Rect? _published;

  void _publish() {
    if (!mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final rect = box.localToGlobal(Offset.zero) & box.size;
    if (rect == _published) return;
    _published = rect;
    VideoMiniPlayerController.instance.hdrHole.value = rect;
  }

  @override
  void dispose() {
    final hole = VideoMiniPlayerController.instance.hdrHole;
    if (hole.value == _published) hole.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Relayouts (window resize, the bar switching layouts) move the rect
    // without rebuilding this, so measure after every layout.
    return LayoutBuilder(
      builder: (context, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _publish());
        return HdrVideoGeometry(
          onGeometry: widget.onGeometry,
          onDetached: widget.onDetached,
        );
      },
    );
  }
}

/// Clips [hole] out of whatever it wraps. The hole is in global logical
/// pixels and is mapped into the clipped widget's own space through
/// [originKey], or used as is when there is no key (a widget at the origin).
class _HoleClipper extends CustomClipper<Path> {
  final ValueListenable<Rect?> hole;
  final GlobalKey? originKey;

  _HoleClipper({required this.hole, this.originKey}) : super(reclip: hole);

  @override
  Path getClip(Size size) {
    final path = Path()..addRect(Offset.zero & size);
    var rect = hole.value;
    if (rect == null) return path;
    final box = originKey?.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && box.hasSize) {
      rect = rect.shift(-box.localToGlobal(Offset.zero));
    }
    return path
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(_thumbnailRadius)),
      );
  }

  @override
  bool shouldReclip(_HoleClipper oldClipper) =>
      oldClipper.hole != hole || oldClipper.originKey != originKey;
}

/// Clips the HDR thumbnail's hole out of the app's backdrop, so nothing
/// behind the shell covers the video either. Used by the app shell.
class VideoMiniPlayerHoleClip extends StatelessWidget {
  final Widget child;

  const VideoMiniPlayerHoleClip({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetection.isWindows) return child;
    return ClipPath(
      clipper: _HoleClipper(hole: VideoMiniPlayerController.instance.hdrHole),
      child: child,
    );
  }
}

class _SkipSegmentButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _SkipSegmentButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          Icons.skip_next_rounded,
          size: 18,
          color: AppColorScheme.accent,
        ),
        label: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColorScheme.onSurface),
        ),
      ),
    );
  }
}

class _TitleBlock extends StatelessWidget {
  final String title;
  final String? subtitle;
  final PlayerState state;
  final bool showTime;

  const _TitleBlock({
    required this.title,
    required this.subtitle,
    required this.state,
    required this.showTime,
  });

  @override
  Widget build(BuildContext context) {
    final secondary = AppColorScheme.onSurface.withValues(alpha: 0.65);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColorScheme.onSurface,
            fontSize: AppTypography.fontSizeMd,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: secondary,
              fontSize: AppTypography.fontSizeSm,
            ),
          ),
        ],
        if (showTime) ...[
          const SizedBox(height: 2),
          StreamBuilder<Duration>(
            stream: state.positionStream,
            builder: (context, _) => Text(
              '${_formatDuration(state.position)} / '
              '${_formatDuration(state.duration)}',
              style: TextStyle(
                color: secondary,
                fontSize: AppTypography.fontSizeSm,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _TransportButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final double size;
  final double extent;

  const _TransportButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.size = 26,
    this.extent = 44,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: extent,
      height: extent,
      child: IconButton(
        onPressed: onPressed,
        tooltip: tooltip,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: AdaptiveIcon(icon, color: AppColorScheme.onSurface, size: size),
      ),
    );
  }
}

/// Seek bar across the top of the bar. Hovering shows where a click lands:
/// the track thickens, a marker sits under the pointer, and a preview above
/// it shows that moment's trickplay frame and time.
class _MiniProgressBar extends StatefulWidget {
  final PlayerState state;
  final ValueChanged<Duration> onSeek;
  final TrickplayTile? Function(Duration position) tileAt;

  const _MiniProgressBar({
    required this.state,
    required this.onSeek,
    required this.tileAt,
  });

  @override
  State<_MiniProgressBar> createState() => _MiniProgressBarState();
}

class _MiniProgressBarState extends State<_MiniProgressBar> {
  static const _hitHeight = 18.0;

  final _link = LayerLink();
  final _preview = OverlayPortalController();
  double? _hoverFraction;
  double? _dragFraction;
  double _width = 0;

  double? get _pointerFraction => _dragFraction ?? _hoverFraction;

  double _fractionAt(Offset local) =>
      _width <= 0 ? 0 : (local.dx / _width).clamp(0.0, 1.0);

  Duration _positionAt(double fraction) => widget.state.duration * fraction;

  void _setHover(double? fraction) {
    setState(() => _hoverFraction = fraction);
    _syncPreview();
  }

  void _syncPreview() {
    final show =
        _pointerFraction != null && widget.state.duration > Duration.zero;
    if (show) {
      _preview.show();
    } else {
      _preview.hide();
    }
  }

  void _commit(double fraction) {
    if (widget.state.duration <= Duration.zero) return;
    widget.onSeek(_positionAt(fraction));
  }

  @override
  Widget build(BuildContext context) {
    final active = _pointerFraction != null;
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _preview,
        overlayChildBuilder: _buildPreview,
        child: LayoutBuilder(
          builder: (context, constraints) {
            _width = constraints.maxWidth;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (e) => _setHover(_fractionAt(e.localPosition)),
              onExit: (_) => _setHover(null),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapUp: (d) => _commit(_fractionAt(d.localPosition)),
                onHorizontalDragStart: (d) {
                  setState(() => _dragFraction = _fractionAt(d.localPosition));
                  _syncPreview();
                },
                onHorizontalDragUpdate: (d) {
                  setState(() => _dragFraction = _fractionAt(d.localPosition));
                  _syncPreview();
                },
                onHorizontalDragEnd: (_) {
                  final fraction = _dragFraction;
                  setState(() => _dragFraction = null);
                  _syncPreview();
                  if (fraction != null) _commit(fraction);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: _hitHeight,
                  child: StreamBuilder<Duration>(
                    stream: widget.state.positionStream,
                    builder: (context, _) => CustomPaint(
                      painter: _SeekBarPainter(
                        played: _playedFraction(),
                        pointer: _pointerFraction,
                        dragging: _dragFraction != null,
                        expanded: active,
                        track: AppColorScheme.rangeTrack,
                        progress: AppColorScheme.rangeProgress,
                        thumb: AppColorScheme.rangeThumb,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  double _playedFraction() {
    final duration = widget.state.duration.inMilliseconds;
    if (duration <= 0) return 0;
    return (widget.state.position.inMilliseconds / duration).clamp(0.0, 1.0);
  }

  /// Laid out by the same plan as the full player's hover preview, so the
  /// trickplay size, position, follow and strip settings all carry over.
  Widget _buildPreview(BuildContext context) {
    final fraction = _pointerFraction;
    if (fraction == null) return const SizedBox.shrink();
    final position = _positionAt(fraction);
    final duration = widget.state.duration;
    final tile = widget.tileAt(position);
    final timeLabel = formatPlaybackDuration(position);

    if (tile == null) {
      final left = (fraction * _width - 32).clamp(
        0.0,
        _width > 64 ? _width - 64 : 0.0,
      );
      return _follow(
        offset: Offset(left, -(30 + AppSpacing.spaceSm)),
        child: Container(
          width: 64,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.8),
            borderRadius: AppRadius.circular(4),
          ),
          child: Text(
            timeLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppTypography.fontSizeSm,
            ),
          ),
        ),
      );
    }

    final prefs = GetIt.instance<UserPreferences>();
    final isStrip =
        prefs.get(UserPreferences.trickPlayMode) == TrickplayMode.strip;
    const spacing = AppSpacing.spaceXs;
    final plan = TrickplayPreviewLayout.plan(
      trackWidth: _width,
      scalePercent: prefs.get(UserPreferences.trickPlayPreviewScalePercent),
      aspect: tile.thumbHeight / tile.thumbWidth,
      // The full player budgets the screen between its top and bottom
      // overlays; here everything above the bar is free.
      maxHeightBudget:
          MediaQuery.sizeOf(context).height -
          _barHeightBudget -
          TrickplayPreviewLayout.verticalTravelTopMargin,
      positionMs: position.inMilliseconds.toDouble(),
      durationMs: duration.inMilliseconds.clamp(1, 1 << 62).toDouble(),
      followScrub: prefs.get(UserPreferences.trickPlayFollowScrubPosition),
      verticalPositionPercent: prefs.get(
        UserPreferences.trickPlayVerticalPositionPercent,
      ),
      isStrip: isStrip,
      spacing: spacing,
      overflowMargin: AppSpacing.spaceLg,
      seekPosition: position,
      totalDuration: duration,
      stepMs: prefs.get(UserPreferences.skipForwardLength).clamp(1, 1 << 31),
    );

    Widget image(TrickplayTile t) => TrickplayTileImage(
      sheet: CachedNetworkImageProvider(
        t.url,
        headers: t.headers.isEmpty ? null : t.headers,
      ),
      sourceRect: t.sourceRect,
      thumbWidth: t.thumbWidth,
      thumbHeight: t.thumbHeight,
      tileWidth: t.tileWidth,
      tileHeight: t.tileHeight,
    );

    return _follow(
      offset: Offset(
        plan.leftOffset,
        -(plan.tileHeight + AppSpacing.spaceSm + plan.verticalTravel),
      ),
      child: Trickplay(
        leftCount: plan.leftCount,
        rightCount: plan.rightCount,
        timeLabel: timeLabel,
        tileWidth: plan.tileWidth,
        tileHeight: plan.tileHeight,
        slotSpacing: spacing,
        content: (slotIndex) {
          if (slotIndex == 0) return image(tile);
          final target = plan.slotsByIndex[slotIndex]?.targetPosition;
          final slotTile = target == null ? null : widget.tileAt(target);
          return slotTile == null ? null : image(slotTile);
        },
      ),
    );
  }

  static const _barHeightBudget = 140.0;

  Widget _follow({required Offset offset, required Widget child}) {
    return Positioned(
      left: 0,
      top: 0,
      child: CompositedTransformFollower(
        link: _link,
        showWhenUnlinked: false,
        offset: offset,
        child: IgnorePointer(child: child),
      ),
    );
  }
}

class _SeekBarPainter extends CustomPainter {
  final double played;
  final double? pointer;
  final bool dragging;
  final bool expanded;
  final Color track;
  final Color progress;
  final Color thumb;

  const _SeekBarPainter({
    required this.played,
    required this.pointer,
    required this.dragging,
    required this.expanded,
    required this.track,
    required this.progress,
    required this.thumb,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = expanded ? 6.0 : 4.0;
    final top = (size.height - barHeight) / 2;
    final radius = Radius.circular(barHeight / 2);
    RRect bar(double from, double to) => RRect.fromLTRBR(
      size.width * from,
      top,
      size.width * to,
      top + barHeight,
      radius,
    );

    canvas.drawRRect(bar(0, 1), Paint()..color = track);
    final shown = dragging ? pointer! : played;
    canvas.drawRRect(bar(0, shown), Paint()..color = progress);

    final hover = pointer;
    if (hover != null && !dragging) {
      final from = hover < played ? hover : played;
      final to = hover < played ? played : hover;
      canvas.drawRRect(
        bar(from, to),
        Paint()..color = progress.withValues(alpha: 0.35),
      );
      final x = size.width * hover;
      canvas.drawRect(
        Rect.fromLTWH(x - 1, top - 3, 2, barHeight + 6),
        Paint()..color = Colors.white,
      );
    }

    if (expanded) {
      canvas.drawCircle(
        Offset(size.width * shown, size.height / 2),
        7,
        Paint()..color = thumb,
      );
    }
  }

  @override
  bool shouldRepaint(_SeekBarPainter old) =>
      old.played != played ||
      old.pointer != pointer ||
      old.dragging != dragging ||
      old.expanded != expanded ||
      old.track != track ||
      old.progress != progress ||
      old.thumb != thumb;
}

String _formatDuration(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  final ss = s.toString().padLeft(2, '0');
  if (h > 0) return '$h:${m.toString().padLeft(2, '0')}:$ss';
  return '$m:$ss';
}
