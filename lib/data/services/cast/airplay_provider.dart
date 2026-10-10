import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

import '../../../l10n/current_app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../models/aggregated_item.dart';
import '../media_server_client_factory.dart';
import 'cast_provider.dart';
import 'cast_target.dart';
import 'cast_transport_controls.dart';
import 'native_airplay_channel.dart';
import 'native_cast_channel.dart';
import 'receiver_device_profiles.dart';

class AirPlayProvider implements CastProvider, CastTransportControls {
  final NativeCastChannel _native;
  final NativeAirPlayChannel _nativeAirPlay;
  final MediaServerClientFactory _clientFactory;

  const AirPlayProvider(this._native, this._nativeAirPlay, this._clientFactory);

  MediaStreamResolver _resolverForClient(MediaServerClient client) {
    return switch (client.serverType) {
      ServerType.jellyfin => JellyfinPlugin(client).createStreamResolver(),
      ServerType.emby => EmbyPlugin(client).createStreamResolver(),
      ServerType.silo => SiloPlugin(client).createStreamResolver(),
    };
  }

  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.airPlay};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.airPlay};

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async {
    if (!PlatformDetection.isIOS) {
      return const [];
    }

    final isAvailable = await _native.isAirPlayRoutePickerAvailable();
    if (!isAvailable) {
      return const [];
    }

    final l10n = currentAppLocalizations();
    return [
      CastTarget(
        id: 'airplay-system-picker',
        kind: CastTargetKind.airPlay,
        title: l10n.castAirPlay,
        subtitle: l10n.openIosRoutePicker,
      ),
    ];
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
    final isAvailable = await _native.isAirPlayRoutePickerAvailable();
    if (!isAvailable) {
      throw StateError(currentAppLocalizations().airPlayRoutePickerUnavailable);
    }

    final client =
        _clientFactory.getClientIfExists(item.serverId) ?? GetIt.instance<MediaServerClient>();
    // An explicit track pick forces a transcode so the server applies it,
    // since AVPlayer is never told which embedded track to use.
    final hasExplicitIndices =
        audioStreamIndex != null || subtitleStreamIndex != null;
    final resolution = await _resolverForClient(client).resolve(
      item,
      deviceProfile: airPlayDeviceProfile(),
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
      startTimeTicks: null,
      mediaSourceId: mediaSourceId,
      enableDirectPlay: !hasExplicitIndices,
      enableDirectStream: !hasExplicitIndices,
    );

    var streamUrl = resolution.streamUrl;
    final token = client.accessToken;
    if (token != null &&
        token.isNotEmpty &&
        !streamUrl.toLowerCase().contains('api_key=') &&
        !streamUrl.toLowerCase().contains('apikey=')) {
      final separator = streamUrl.contains('?') ? '&' : '?';
      streamUrl =
          '$streamUrl$separator${client.serverType.tokenQueryParam}=${Uri.encodeComponent(token)}';
    }

    streamUrl = streamUrl.replaceFirst('?&', '?');

    // The native side seeks once the item is ready, so the resolve above
    // stays at zero and the whole stream remains seekable.
    await _nativeAirPlay.loadAirPlay(
      url: streamUrl,
      title: item.name,
      positionTicks: startPositionTicks ?? 0,
    );

    await _native.showAirPlayRoutePicker();
  }

  @override
  Future<void> play(CastTargetKind kind) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
    await _nativeAirPlay.playAirPlay();
  }

  @override
  Future<void> pause(CastTargetKind kind) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
    await _nativeAirPlay.pauseAirPlay();
  }

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
    await _nativeAirPlay.seekAirPlay(positionTicks: positionTicks);
  }

  @override
  Future<void> stop(CastTargetKind kind) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
    await _nativeAirPlay.stopAirPlay();
  }

  @override
  Future<double?> getVolume(CastTargetKind kind) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
    return null;
  }

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {
    if (kind != CastTargetKind.airPlay) {
      throw UnsupportedError('Unsupported cast kind for AirPlayProvider.');
    }
  }
}
