import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:playback_plex/playback_plex.dart';
import 'package:server_core/server_core.dart';

import '../../../util/platform_detection.dart';
import '../../../playback/silo_playback_environment.dart';
import '../../../playback/silo_plugin_for.dart';
import '../../models/aggregated_item.dart';
import '../media_server_client_factory.dart';
import 'cast_provider.dart';
import 'cast_session_reporter.dart';
import 'cast_target.dart';
import 'cast_transport_controls.dart';
import 'native_dlna_channel.dart';
import 'receiver_device_profiles.dart';

/// The MIME type a DLNA renderer is told the stream has. Some renderers (LG)
/// refuse a URI whose metadata names none, and the server's extension-less
/// stream paths leave nothing else to go by.
String dlnaMimeType(StreamResolutionResult resolution) {
  final audio = resolution.mediaType.toLowerCase() == 'audio';
  final path = Uri.tryParse(resolution.streamUrl)?.path.toLowerCase() ?? '';
  // ffprobe names an MP4 'mov,mp4,m4a,3gp,3g2,mj2', so MP4 wins a list.
  final containers = (resolution.container ?? '').toLowerCase().split(',');
  final container = containers.contains('mp4') ? 'mp4' : containers.first;
  if (path.endsWith('.m3u8') || container == 'hls' || container == 'm3u8') {
    return 'application/vnd.apple.mpegurl';
  }
  // Jellyfin and Emby report the source's container for a transcode too, and
  // the DLNA profile transcodes audio to MP3.
  if (audio && resolution.playMethod == StreamPlayMethod.transcode) {
    return 'audio/mpeg';
  }
  return switch (container) {
    'mkv' || 'matroska' => audio ? 'audio/x-matroska' : 'video/x-matroska',
    'mp4' || 'm4v' => audio ? 'audio/mp4' : 'video/mp4',
    'mov' => 'video/quicktime',
    'ts' || 'mpegts' || 'm2ts' => 'video/mp2t',
    'webm' => audio ? 'audio/webm' : 'video/webm',
    'avi' => 'video/x-msvideo',
    'mp3' => 'audio/mpeg',
    'aac' => 'audio/aac',
    'm4a' || 'm4b' => 'audio/mp4',
    'flac' => 'audio/flac',
    'wav' => 'audio/wav',
    'ogg' || 'oga' => 'audio/ogg',
    _ => audio ? 'audio/*' : 'video/*',
  };
}

/// The DLNA fourth field of the res protocolInfo. A file the server sends as
/// it is takes byte-range seeks, and without that flag some renderers (LG)
/// accept a Seek and stay where they are. A remux, transcode or HLS playlist
/// is produced as it plays and has no bytes to seek in, so it claims nothing.
String dlnaFeatures(StreamResolutionResult resolution) {
  if (resolution.playMethod != StreamPlayMethod.directPlay ||
      dlnaMimeType(resolution) == 'application/vnd.apple.mpegurl') {
    return '*';
  }
  return 'DLNA.ORG_OP=01;DLNA.ORG_CI=0;DLNA.ORG_FLAGS=01500000000000000000000000000000';
}

class DlnaProvider
    implements CastProvider, CastTransportControls, CastServerPlaybackSource {
  final NativeDlnaChannel _native;
  final MediaServerClientFactory _clientFactory;

  static final Logger _logger = Logger();

  DlnaProvider(this._native, this._clientFactory);

  /// The last cast's Silo session, for the cast service to report.
  CastServerPlayback? _serverPlayback;

  /// The cast on the renderer, for a seek its stream can't do itself.
  _DlnaCast? _cast;

  @override
  CastServerPlayback? takeServerPlayback() {
    final playback = _serverPlayback;
    _serverPlayback = null;
    return playback;
  }

  MediaStreamResolver _resolverForClient(MediaServerClient client) {
    return switch (client.serverType) {
      ServerType.jellyfin => JellyfinPlugin(client).createStreamResolver(),
      ServerType.emby => EmbyPlugin(client).createStreamResolver(),
      ServerType.plex => PlexMediaStreamResolver(client),
      // The renderer loads the stream itself.
      ServerType.silo => siloPluginFor(
        client,
        environment: () => siloReceiverEnvironment('dlna'),
      ).createStreamResolver(),
    };
  }

  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.dlna};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.dlna};

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async {
    if (!PlatformDetection.isAndroid && !PlatformDetection.isIOS) {
      return const [];
    }

    try {
      return await _native.discoverDlnaTargets();
    } catch (e, st) {
      _logger.w('DLNA discovery failed', error: e, stackTrace: st);
      return const [];
    }
  }

  @override
  Future<void> playToTarget(
    CastTarget target, {
    required AggregatedItem item,
    List<AggregatedItem>? queueItems,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    final client =
        _clientFactory.getClientIfExists(item.serverId) ?? GetIt.instance<MediaServerClient>();
    final hasExplicitIndices = audioStreamIndex != null || subtitleStreamIndex != null;
    // A seek still served for the cast before stops sending its stream; the
    // cast is back if this one can't start.
    final previous = _cast;
    _cast = null;
    final resolver = _resolverForClient(client);
    final silo = client.serverType == ServerType.silo;
    final StreamResolutionResult resolution;
    try {
      resolution = await resolver.resolve(
        item,
        deviceProfile: dlnaDeviceProfile(),
        audioStreamIndex: audioStreamIndex,
        subtitleStreamIndex: subtitleStreamIndex,
        // Silo starts a remux there; a file it sends as it is is seeked
        // on the renderer once it plays.
        startTimeTicks: silo ? startPositionTicks : null,
        mediaSourceId: mediaSourceId,
        enableDirectPlay: !hasExplicitIndices,
        enableDirectStream: !hasExplicitIndices,
      );
    } catch (_) {
      if (_cast == null && previous != null && !previous.stopped) {
        _cast = previous;
      }
      rethrow;
    }
    _cast = _DlnaCast(
      target: target,
      item: item,
      resolver: resolver,
      resolution: resolution,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      mediaSourceId: mediaSourceId,
      directAllowed: !hasExplicitIndices,
    );
    final cast = _cast!;

    await _send(
      target,
      item,
      resolution,
      startPositionTicks: resolution.seeksThroughServer
          ? null
          : startPositionTicks,
    );
    _serverPlayback = castNeedsSessionReports(client)
        ? CastServerPlayback(
            service: siloPluginFor(client).createPlaySessionService(),
            item: item,
            resolution: resolution,
            currentResolution: () => cast.resolution,
            replacing: () => cast.seekRunning,
            positionsOnMediaTimeline: true,
          )
        : null;
  }

  /// Hands [resolution]'s stream to [target], told its MIME type, flags and
  /// the runtime it covers (from where it starts to the end).
  Future<void> _send(
    CastTarget target,
    AggregatedItem item,
    StreamResolutionResult resolution, {
    int? startPositionTicks,
  }) {
    final offset = resolution.timelineOffset.inMicroseconds * 10;
    final runtime = item.runTimeTicks;
    return _native.playToDlnaDevice(
      targetId: target.id,
      streamUrl: resolution.streamUrl,
      title: item.name,
      mimeType: dlnaMimeType(resolution),
      dlnaFeatures: dlnaFeatures(resolution),
      startPositionTicks: startPositionTicks,
      durationTicks: runtime != null && runtime > offset ? runtime - offset : null,
      positionOffsetTicks: offset,
    );
  }

  /// The cast's stream replaced by one Silo starts at [positionTicks], for
  /// a stream the renderer can't seek in. False when it can. Seeks made while
  /// one is being served only move its target; the latest is served next.
  Future<bool> _replanAt(int positionTicks) async {
    final cast = _cast;
    if (cast == null) return false;
    if (cast.seekRunning) {
      cast.seekTarget = positionTicks;
      return true;
    }
    if (!cast.resolution.seeksThroughServer) return false;
    final resolver = cast.resolver;
    if (resolver is! StreamReplanner) return false;
    final replanner = resolver as StreamReplanner;
    if (!replanner.canReplan(cast.resolution)) return false;
    cast
      ..seekTarget = positionTicks
      ..seekRunning = true;
    try {
      int? served;
      while (identical(_cast, cast) && cast.seekTarget != served) {
        final target = cast.seekTarget!;
        final next = await replanner.replan(
          cast.item,
          cast.resolution,
          ReplanRequest(
            reason: ReplanReason.seek,
            position: Duration(microseconds: target ~/ 10),
            deviceProfile: dlnaDeviceProfile(),
            audioStreamIndex: cast.audioStreamIndex,
            subtitleStreamIndex: cast.subtitleStreamIndex,
            mediaSourceId: cast.mediaSourceId,
            enableDirectPlay: cast.directAllowed,
            enableDirectStream: cast.directAllowed,
          ),
        );
        // Silo's session plays the new stream from here, whatever the
        // renderer does with it.
        cast.resolution = next;
        served = target;
        // Stopped, or another cast started, while Silo answered.
        if (!identical(_cast, cast)) return true;
        await _send(
          cast.target,
          cast.item,
          next,
          // A stream that doesn't start there is seeked on the renderer.
          startPositionTicks: next.seeksThroughServer ? null : target,
        );
        // A stop that crossed the send: the renderer may have started it.
        if (cast.stopped) {
          try {
            await _native.stopDlna();
          } catch (_) {}
        }
      }
    } finally {
      cast.seekRunning = false;
    }
    return true;
  }

  @override
  Future<void> pause(CastTargetKind kind) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    await _native.pauseDlna();
  }

  @override
  Future<void> play(CastTargetKind kind) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    // The server has dropped a stream paused this long (by the phone or the
    // TV's remote): start a new one at the position instead.
    // A seek being served starts its stream playing.
    if (_cast?.seekRunning ?? false) return;
    final idle = _cast?.resolution.reopenAfterPause;
    final pausedSince = _native.pausedSince;
    if (idle != null &&
        pausedSince != null &&
        DateTime.now().difference(pausedSince) >= idle &&
        await _replanAt(_native.lastPositionTicks)) {
      return;
    }
    await _native.playDlna();
  }

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    if (await _replanAt(positionTicks)) return;
    await _native.seekDlna(positionTicks: positionTicks);
  }

  @override
  Future<void> stop(CastTargetKind kind) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    // Cleared first, so a seek Silo is still answering doesn't recast.
    _cast?.stopped = true;
    _cast = null;
    await _native.stopDlna();
  }

  @override
  Future<double?> getVolume(CastTargetKind kind) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    return _native.getDlnaVolume();
  }

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    await _native.setDlnaVolume(volume: volume);
  }
}

/// A cast on a DLNA renderer: what [DlnaProvider] needs to ask the server for
/// the same stream starting elsewhere.
class _DlnaCast {
  _DlnaCast({
    required this.target,
    required this.item,
    required this.resolver,
    required this.resolution,
    required this.audioStreamIndex,
    required this.subtitleStreamIndex,
    required this.mediaSourceId,
    required this.directAllowed,
  });

  final CastTarget target;
  final AggregatedItem item;
  final MediaStreamResolver resolver;

  /// The stream on the renderer, replaced by a seek Silo serves.
  StreamResolutionResult resolution;

  /// The position the latest seek asked for, and whether one is being
  /// served.
  int? seekTarget;
  bool seekRunning = false;

  /// Whether the viewer stopped this cast.
  bool stopped = false;
  final int? audioStreamIndex;
  final int? subtitleStreamIndex;
  final String? mediaSourceId;
  final bool directAllowed;
}
