import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../../data/services/sponsorblock_service.dart';
import '../../../data/services/youtube_stream_resolver.dart';
import '../../../l10n/app_localizations.dart';
import '../../../playback/appletv_preview_player.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/adaptive/sf_symbol.dart';
import '../../widgets/web_youtube_trailer.dart';

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

  bool get _supportsEmbeddedYouTubePlatform {
    return PlatformDetection.isAndroid ||
        PlatformDetection.isIOS ||
        PlatformDetection.isMacOS;
  }

  @override
  void initState() {
    super.initState();
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
    if (PlatformDetection.isAppleTV) {
      unawaited(_openTrailerAppleTv());
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
    _sponsorBlockPositionSub?.cancel();
    _appleTvCompletedSub?.cancel();
    unawaited(_appleTvPlayer?.dispose());
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
            backend: 'mpv',
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

  void _clearSponsorBlockTracking() {
    _sponsorBlockToken++;
    _sponsorBlockPositionSub?.cancel();
    _sponsorBlockPositionSub = null;
    _sponsorBlockSeekInFlight = false;
    _sponsorBlockSession.clear();
  }

  void _startSponsorBlockTracking(String videoId) {
    final player = _player;
    if (player == null) {
      _clearSponsorBlockTracking();
      return;
    }

    _clearSponsorBlockTracking();
    final token = ++_sponsorBlockToken;
    _sponsorBlockPositionSub = player.stream.position.listen((position) {
      _handleSponsorBlockPosition(position);
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

  void _handleSponsorBlockPosition(Duration position) {
    final player = _player;
    if (player == null || _sponsorBlockSeekInFlight) {
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
        await player.seek(skipTo);
      } catch (_) {
      } finally {
        _sponsorBlockSeekInFlight = false;
      }
    }());
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
                  : PlatformDetection.isAppleTV
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
                  onPressed: () {
                    _player?.stop();
                    unawaited(_appleTvPlayer?.stop());
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
