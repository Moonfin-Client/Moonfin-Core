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
/// accept a Seek and stay where they are. A transcode or HLS playlist has no
/// bytes to seek in, so it claims nothing.
String dlnaFeatures(StreamResolutionResult resolution) {
  if (resolution.playMethod == StreamPlayMethod.transcode ||
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
    final resolution = await _resolverForClient(client).resolve(
      item,
      deviceProfile: dlnaDeviceProfile(),
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      mediaSourceId: mediaSourceId,
      enableDirectPlay: !hasExplicitIndices,
      enableDirectStream: !hasExplicitIndices,
    );
    final streamUrl = resolution.streamUrl;

    await _native.playToDlnaDevice(
      targetId: target.id,
      streamUrl: streamUrl,
      title: item.name,
      mimeType: dlnaMimeType(resolution),
      dlnaFeatures: dlnaFeatures(resolution),
      startPositionTicks: startPositionTicks,
    );
    _serverPlayback = castNeedsSessionReports(client)
        ? CastServerPlayback(
            service: siloPluginFor(client).createPlaySessionService(),
            item: item,
            resolution: resolution,
          )
        : null;
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
    await _native.playDlna();
  }

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
    await _native.seekDlna(positionTicks: positionTicks);
  }

  @override
  Future<void> stop(CastTargetKind kind) async {
    if (kind != CastTargetKind.dlna) {
      throw UnsupportedError('Unsupported cast kind for DlnaProvider.');
    }
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
