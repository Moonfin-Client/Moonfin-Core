import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' hide RepeatMode;
import 'package:get_it/get_it.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:moonfin_native_video/moonfin_native_video.dart';
import 'package:playback_core/playback_core.dart';

import '../../../data/services/sponsorblock_service.dart';
import '../../../data/services/youtube_stream_resolver.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/appletv_preview_player.dart';
import '../../../playback/media3_player_backend.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../screensaver/screensaver_controller.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/web_youtube_trailer.dart';
import 'trailer_media3_controls.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final String? videoId;
  final String? trailerUrl;

  const TrailerPlayerScreen({super.key, this.videoId, this.trailerUrl});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  static const _openTimeout = Duration(seconds: 12);
  static const _resolveTimeout = Duration(seconds: 10);

  Player? _player;
  VideoController? _controller;
  AppleTvPreviewPlayer? _appleTvPlayer;
  StreamSubscription<void>? _appleTvCompletedSub;
  StreamSubscription<Duration>? _sponsorBlockPositionSub;
  final _sponsorBlockService = SponsorBlockService();
  final _sponsorBlockSession = SponsorBlockSkipSession();
  bool _loading = true;
  String? _error;
  String? _webVideoId;
  bool _useEmbeddedYouTube = false;
  bool _embedFallbackTriggered = false;
  bool _sponsorBlockSeekInFlight = false;
  int _sponsorBlockToken = 0;
  final _screensaverController = GetIt.instance<ScreensaverController>();
  final Media3PlayerBackend? _media3Backend =
      GetIt.instance.isRegistered<Media3PlayerBackend>()
      ? GetIt.instance<Media3PlayerBackend>()
      : null;
  bool _usingMedia3 = false;
  StreamSubscription<bool>? _media3PlayingSub;
  StreamSubscription<bool>? _media3CompletedSub;
  StreamSubscription<Map<String, dynamic>>? _media3ErrorSub;
  Timer? _media3StartTimeout;

  bool get _supportsEmbeddedYouTubePlatform {
    return PlatformDetection.isAndroid ||
        PlatformDetection.isIOS ||
        PlatformDetection.isMacOS;
  }

  bool get _useMedia3TrailerPath {
    if (_media3Backend == null) return false;
    final prefs = GetIt.instance<UserPreferences>();
    if (prefs.get(UserPreferences.playbackEnginePreference) !=
        PlaybackEnginePreference.media3) {
      return false;
    }
    // A live Media3 main session (background music, a paused video) owns the
    // shared native view slot. A preview attach would be refused and a main
    // source would kill that session, so mpv plays the trailer instead.
    final manager = GetIt.instance<PlaybackManager>();
    if (manager.backend is Media3PlayerBackend &&
        manager.queueService.currentItem != null) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    // Keep the screen awake and the screensaver disarmed while a trailer plays,
    // matching the other full-screen players.
    _screensaverController.setPlaybackActive(true);
    final resolvedVideoId = _resolvedVideoId();

    if (kIsWeb) {
      if (resolvedVideoId == null || resolvedVideoId.isEmpty) {
        _error = AppLocalizations.of(context).unableToLoadTrailerStream;
      } else {
        _webVideoId = resolvedVideoId;
      }
      _loading = false;
      return;
    }

    if (_supportsEmbeddedYouTubePlatform &&
        resolvedVideoId != null &&
        resolvedVideoId.isNotEmpty) {
      _useEmbeddedYouTube = true;
      _webVideoId = resolvedVideoId;
      _loading = true;
      return;
    }

    _startStreamPlaybackPath();
  }

  String? _resolvedVideoId() {
    final videoId = widget.videoId;
    if (videoId != null && videoId.isNotEmpty) {
      return videoId;
    }
    final trailerUrl = widget.trailerUrl;
    if (trailerUrl == null || trailerUrl.isEmpty) {
      return null;
    }
    return YouTubeStreamResolver.extractVideoId(trailerUrl);
  }

  void _startStreamPlaybackPath() {
    if (PlatformDetection.useApplePreviewPlayer) {
      unawaited(_openTrailerAppleTv());
      return;
    }
    if (_useMedia3TrailerPath) {
      _usingMedia3 = true;
      unawaited(_openTrailerMedia3());
      return;
    }
    _player ??= Player(configuration: const PlayerConfiguration(libass: false));
    _controller ??= VideoController(
      _player!,
      configuration: VideoControllerConfiguration(
        hwdec: PlatformDetection.isLinux ? 'auto-safe' : null,
      ),
    );
    unawaited(_openTrailer());
  }

  void _onEmbeddedPlaybackStarted() {
    if (!mounted || !_loading) {
      return;
    }
    setState(() => _loading = false);
  }

  void _fallBackToStreamPlayback() {
    if (_embedFallbackTriggered || !_useEmbeddedYouTube) {
      return;
    }
    // AVFoundation cannot decode what the resolver pulls out of YouTube, so
    // on Apple the embed is the only thing that can play this. Leave it up for
    // the viewer to start rather than falling back to a stream path with
    // nothing behind it.
    if (PlatformDetection.useApplePreviewPlayer) {
      if (_loading) setState(() => _loading = false);
      return;
    }
    _embedFallbackTriggered = true;
    setState(() {
      _useEmbeddedYouTube = false;
      _error = null;
      _loading = true;
    });
    _startStreamPlaybackPath();
  }

  @override
  void dispose() {
    _screensaverController.setPlaybackActive(false);
    _sponsorBlockPositionSub?.cancel();
    _appleTvCompletedSub?.cancel();
    unawaited(_appleTvPlayer?.dispose());
    _media3StartTimeout?.cancel();
    _media3PlayingSub?.cancel();
    _media3CompletedSub?.cancel();
    _media3ErrorSub?.cancel();
    // Stop rather than dispose, the backend is the shared Android singleton.
    if (_usingMedia3) {
      unawaited(_media3Backend?.stop());
    }
    _player?.stop();
    _player?.dispose();
    super.dispose();
  }

  Future<({String? streamUrl, String? sponsorBlockVideoId, bool useYouTubeHeaders})>
  _resolveStreamUrl() async {
    String? streamUrl;
    String? sponsorBlockVideoId;
    bool useYouTubeHeaders = false;

    if (widget.videoId != null && widget.videoId!.isNotEmpty) {
      sponsorBlockVideoId = widget.videoId;
      streamUrl = await YouTubeStreamResolver.resolve(
        widget.videoId!,
      ).timeout(_resolveTimeout, onTimeout: () => null);
      if (streamUrl != null && streamUrl.isNotEmpty) {
        useYouTubeHeaders = true;
      } else {
        streamUrl = 'https://www.youtube.com/watch?v=${widget.videoId!}';
        useYouTubeHeaders = false;
      }
    } else if (widget.trailerUrl != null && widget.trailerUrl!.isNotEmpty) {
      final trailerUrl = widget.trailerUrl!;
      final youtubeVideoId = YouTubeStreamResolver.extractVideoId(trailerUrl);
      sponsorBlockVideoId = youtubeVideoId;
      streamUrl = await YouTubeStreamResolver.resolveFromUrl(
        trailerUrl,
      ).timeout(_resolveTimeout, onTimeout: () => null);
      if (streamUrl != null && streamUrl.isNotEmpty) {
        useYouTubeHeaders = youtubeVideoId != null;
      } else {
        streamUrl = trailerUrl;
        useYouTubeHeaders = false;
      }
    }

    return (
      streamUrl: streamUrl,
      sponsorBlockVideoId: sponsorBlockVideoId,
      useYouTubeHeaders: useYouTubeHeaders,
    );
  }

  Future<void> _openTrailerAppleTv() async {
    final resolved = await _resolveStreamUrl();
    if (!mounted) return;
    final streamUrl = resolved.streamUrl;
    if (streamUrl == null || streamUrl.isEmpty) {
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.unableToLoadTrailerStream;
      });
      return;
    }

    try {
      final player = AppleTvPreviewPlayer();
      _appleTvPlayer = player;
      _appleTvCompletedSub = player.completedStream.listen((_) {
        if (mounted) Navigator.of(context).maybePop();
      });
      await player
          .open(
            streamUrl,
            headers: resolved.useYouTubeHeaders
                ? YouTubeStreamResolver.youtubeHeaders
                : null,
            volume: 100,
          )
          .timeout(_openTimeout);
      if (!mounted) {
        await player.dispose();
        return;
      }
      await player.resume();
      if (!mounted) {
        await player.dispose();
        return;
      }
      setState(() => _loading = false);
    } on TimeoutException {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.trailerTimedOut;
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.playbackFailedForTrailer;
      });
    }
  }

  Future<void> _openTrailer() async {
    final resolved = await _resolveStreamUrl();
    final streamUrl = resolved.streamUrl;
    final sponsorBlockVideoId = resolved.sponsorBlockVideoId;
    final useYouTubeHeaders = resolved.useYouTubeHeaders;

    if (!mounted) return;

    if (streamUrl == null || streamUrl.isEmpty) {
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.unableToLoadTrailerStream;
      });
      return;
    }

    try {
      final media = useYouTubeHeaders
          ? Media(streamUrl, httpHeaders: YouTubeStreamResolver.youtubeHeaders)
          : Media(streamUrl);
      await _player!.open(media).timeout(_openTimeout);
      if (!mounted) return;
      setState(() {
        _loading = false;
      });

      if (sponsorBlockVideoId != null && sponsorBlockVideoId.isNotEmpty) {
        _startSponsorBlockTracking(sponsorBlockVideoId);
      } else {
        _clearSponsorBlockTracking();
      }
    } on TimeoutException {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.trailerTimedOut;
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = l10n.playbackFailedForTrailer;
      });
    }
  }

  Future<void> _openTrailerMedia3() async {
    final backend = _media3Backend!;
    final resolved = await _resolveStreamUrl();
    if (!mounted) return;

    final l10n = AppLocalizations.of(context);
    final streamUrl = resolved.streamUrl;
    // The resolver falls back to the raw watch URL, which ExoPlayer can't
    // read, so a failed resolve is a hard error here.
    final unresolvedYouTube =
        streamUrl != null &&
        !resolved.useYouTubeHeaders &&
        YouTubeStreamResolver.extractVideoId(streamUrl) != null;
    if (streamUrl == null || streamUrl.isEmpty || unresolvedYouTube) {
      setState(() {
        _loading = false;
        _error = l10n.unableToLoadTrailerStream;
      });
      return;
    }

    _media3PlayingSub = backend.playingStream.listen((playing) {
      if (!playing || !mounted) return;
      _media3StartTimeout?.cancel();
      if (_loading) setState(() => _loading = false);
    });
    _media3CompletedSub = backend.completedStream.listen((completed) {
      if (completed && mounted) Navigator.of(context).maybePop();
    });
    _media3ErrorSub = backend.errorStream.listen((_) {
      if (!mounted || _error != null) return;
      _media3StartTimeout?.cancel();
      setState(() {
        _loading = false;
        _error = l10n.playbackFailedForTrailer;
      });
      unawaited(backend.stop());
    });

    try {
      await backend.setVolume(100);
      // The singleton re-sends its stored repeat mode on play(), and a leaked
      // repeat-one from an inline preview would loop this trailer forever.
      await backend.setRepeatMode(RepeatMode.none);
      if (!mounted) return;

      // The preview flag disarms the backend's own stall watchdog, so this
      // screen keeps its own started deadline.
      _media3StartTimeout = Timer(_openTimeout, () {
        if (!mounted || !_loading || _error != null) return;
        setState(() {
          _loading = false;
          _error = l10n.trailerTimedOut;
        });
        unawaited(backend.stop());
      });
      await backend
          .play(<String, dynamic>{
            'url': streamUrl,
            'mediaType': 'video',
            'preview': true,
            if (resolved.useYouTubeHeaders)
              'headers': YouTubeStreamResolver.youtubeHeaders,
          })
          .timeout(_openTimeout);
      if (!mounted) {
        await backend.stop();
        return;
      }

      final sponsorBlockVideoId = resolved.sponsorBlockVideoId;
      if (sponsorBlockVideoId != null && sponsorBlockVideoId.isNotEmpty) {
        _startSponsorBlockTracking(sponsorBlockVideoId);
      } else {
        _clearSponsorBlockTracking();
      }
    } on TimeoutException {
      unawaited(backend.stop());
      if (!mounted) return;
      _media3StartTimeout?.cancel();
      setState(() {
        _loading = false;
        _error = l10n.trailerTimedOut;
      });
    } catch (_) {
      unawaited(backend.stop());
      if (!mounted) return;
      _media3StartTimeout?.cancel();
      setState(() {
        _loading = false;
        _error = l10n.playbackFailedForTrailer;
      });
    }
  }

  void _clearSponsorBlockTracking() {
    _sponsorBlockToken++;
    _sponsorBlockPositionSub?.cancel();
    _sponsorBlockPositionSub = null;
    _sponsorBlockSeekInFlight = false;
    _sponsorBlockSession.clear();
  }

  void _startSponsorBlockTracking(String videoId) {
    final positions = _usingMedia3
        ? _media3Backend?.positionStream
        : _player?.stream.position;
    final seek = _usingMedia3 ? _media3Backend?.seekTo : _player?.seek;
    if (positions == null || seek == null) {
      _clearSponsorBlockTracking();
      return;
    }

    _clearSponsorBlockTracking();
    final token = ++_sponsorBlockToken;
    _sponsorBlockPositionSub = positions.listen((position) {
      _handleSponsorBlockPosition(position, seek);
    });

    unawaited(() async {
      final segments = await _sponsorBlockService.fetchSegments(
        videoId,
        categories: sponsorBlockDefaultCategories,
      );
      if (!mounted || token != _sponsorBlockToken) {
        return;
      }
      _sponsorBlockSession.setSegments(segments);
    }());
  }

  void _handleSponsorBlockPosition(
    Duration position,
    Future<void> Function(Duration) seek,
  ) {
    if (_sponsorBlockSeekInFlight) {
      return;
    }

    final decision = _sponsorBlockSession.checkPosition(position);
    if (!decision.shouldSkip || decision.skipTo == null) {
      return;
    }

    final skipTo = decision.skipTo!;
    if (skipTo <= position + const Duration(milliseconds: 500)) {
      return;
    }

    _sponsorBlockSeekInFlight = true;
    unawaited(() async {
      try {
        await seek(skipTo);
      } catch (_) {
      } finally {
        _sponsorBlockSeekInFlight = false;
      }
    }());
  }

  void _stopAndPop() {
    _player?.stop();
    unawaited(_appleTvPlayer?.stop());
    // Stop while our view is still attached, so the bridge doesn't queue a
    // stale stop for whichever view mounts next.
    if (_usingMedia3) {
      unawaited(_media3Backend?.stop());
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black,
              child: ((kIsWeb || _useEmbeddedYouTube) && _webVideoId != null)
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: WebYouTubeTrailer(
                          videoId: _webVideoId!,
                          muted: false,
                          loop: false,
                          onPlaybackStarted: _onEmbeddedPlaybackStarted,
                          onEmbeddedUnavailable: _useEmbeddedYouTube
                              ? _fallBackToStreamPlayback
                              : null,
                          onAutoplayFailed: _useEmbeddedYouTube
                              ? _fallBackToStreamPlayback
                              : null,
                        ),
                      ),
                    )
                  : PlatformDetection.useApplePreviewPlayer
                  ? (_appleTvPlayer?.textureId != null
                        ? FittedBox(
                            fit: BoxFit.contain,
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              width: 1920,
                              height: 1080,
                              child: Texture(
                                textureId: _appleTvPlayer!.textureId!,
                              ),
                            ),
                          )
                        : const SizedBox.shrink())
                  : _usingMedia3
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        const Media3VideoView(
                          fill: Colors.black,
                          role: 'preview',
                        ),
                        TrailerMedia3Controls(
                          backend: _media3Backend!,
                          onExit: _stopAndPop,
                        ),
                      ],
                    )
                  : (_controller != null
                        ? Video(
                            controller: _controller!,
                            controls: AdaptiveVideoControls,
                            fit: BoxFit.contain,
                            pauseUponEnteringBackgroundMode: false,
                            fill: Colors.black,
                          )
                        : const SizedBox.shrink()),
            ),
          ),
          if (_loading) const Center(child: CircularProgressIndicator()),
          if (_error != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  _error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: const AdaptiveIcon(Icons.arrow_back, color: Colors.white),
                  onPressed: _stopAndPop,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
