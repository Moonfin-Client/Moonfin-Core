import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:playback_core/playback_core.dart';
import 'package:playback_emby/playback_emby.dart';
import 'package:playback_silo/playback_silo.dart';
import 'package:playback_jellyfin/playback_jellyfin.dart';
import 'package:server_core/server_core.dart';

import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../models/aggregated_item.dart';
import '../media_server_client_factory.dart';
import 'cast_provider.dart';
import 'cast_target.dart';
import 'cast_transport_controls.dart';
import 'native_cast_channel.dart';
import 'receiver_device_profiles.dart';

/// Subtitles off arrives as -1, which is the absence of a pick rather than a
/// pick. Counting it as one forced every cast onto the no-direct-play path
/// for nothing. The -1 itself still goes to the server, where it keeps the
/// transcode from burning in whatever subtitle the server would default to.
bool isExplicitSubtitlePick(int? subtitleStreamIndex) =>
    subtitleStreamIndex != null && subtitleStreamIndex >= 0;

class GoogleCastProvider implements CastProvider, CastTransportControls {
  final NativeCastChannel _native;
  final MediaServerClientFactory _clientFactory;

  static final Logger _logger = Logger();

  const GoogleCastProvider(this._native, this._clientFactory);

  // The receiver pulls the stream itself, so the ceiling that matters is the
  // one the user set for their own network, the same value the local players
  // read. Unset leaves the profile on its own default.
  int? get _maxBitrateMbps {
    if (!GetIt.instance.isRegistered<UserPreferences>()) return null;
    return int.tryParse(
      GetIt.instance<UserPreferences>().get(UserPreferences.maxBitrate),
    );
  }

  MediaStreamResolver _resolverForClient(MediaServerClient client) {
    return switch (client.serverType) {
      ServerType.jellyfin => JellyfinPlugin(client).createStreamResolver(),
      ServerType.emby => EmbyPlugin(client).createStreamResolver(),
      ServerType.silo => SiloPlugin(client).createStreamResolver(),
    };
  }

  Future<StreamResolutionResult> _resolveForItem(
    MediaServerClient client,
    AggregatedItem item, {
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    // An explicit track pick forces a transcode so the server applies it,
    // since the receiver has no track selection of its own.
    final hasExplicitIndices =
        audioStreamIndex != null || isExplicitSubtitlePick(subtitleStreamIndex);
    final resolver = _resolverForClient(client);

    Future<StreamResolutionResult> attempt({required bool open}) =>
        resolver.resolve(
          item,
          deviceProfile: chromecastDeviceProfile(
            maxBitrateMbps: _maxBitrateMbps,
          ),
          mediaSourceId: mediaSourceId,
          audioStreamIndex: audioStreamIndex,
          subtitleStreamIndex: subtitleStreamIndex,
          enableDirectPlay: open || !hasExplicitIndices,
          enableDirectStream: open || !hasExplicitIndices,
        );

    try {
      final resolution = await attempt(open: false);
      castDiag(
        'resolved ${item.id}: ${resolution.playMethod.name}, '
        'container=${resolution.container ?? '?'}, '
        'explicitTracks=$hasExplicitIndices',
      );
      return resolution;
    } catch (e) {
      // A pick is worth less than the cast itself. Whatever refused the
      // constrained request gets one open retry, where the server is free to
      // offer anything, before the failure reaches the user.
      if (!hasExplicitIndices) {
        castDiag('resolve failed for ${item.id}', error: e);
        rethrow;
      }
      castDiag(
        'constrained resolve failed for ${item.id}, retrying open',
        error: e,
      );
      final retry = await attempt(open: true);
      castDiag(
        'open retry for ${item.id}: ${retry.playMethod.name}, '
        'container=${retry.container ?? '?'}',
      );
      return retry;
    }
  }

  // The receiver picks its player from the MIME type, since the stream URL
  // carries no file extension to go on.
  String _contentTypeFor(StreamResolutionResult resolution) {
    if (resolution.playMethod == StreamPlayMethod.transcode ||
        resolution.streamUrl.contains('.m3u8')) {
      return 'application/x-mpegURL';
    }
    final container =
        resolution.container?.split(',').first.trim().toLowerCase();
    return container == 'webm' ? 'video/webm' : 'video/mp4';
  }

  String? _posterUrlFor(MediaServerClient client, AggregatedItem item) {
    final tag = item.primaryImageTag;
    if (tag == null || tag.isEmpty) return null;
    return client.imageApi.getPrimaryImageUrl(item.id, maxWidth: 800, tag: tag);
  }

  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.googleCast};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.googleCast};

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async {
    if (!PlatformDetection.isAndroid && !PlatformDetection.isIOS) {
      return const [];
    }

    try {
      return await _native.discoverGoogleCastTargets();
    } catch (e, st) {
      _logger.w('Google Cast discovery failed', error: e, stackTrace: st);
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
    final resolution = await _resolveForItem(
      client,
      item,
      mediaSourceId: mediaSourceId,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
    final streamUrl = resolution.streamUrl;
    final effectiveQueueItems =
        (queueItems == null || queueItems.isEmpty)
            ? <AggregatedItem>[item]
            : queueItems;
    final queuePayload = <Map<String, dynamic>>[];
    for (final entry in effectiveQueueItems) {
      final entryResolution =
          entry.id == item.id ? resolution : await _resolveForItem(client, entry);
      final posterUrl = _posterUrlFor(client, entry);
      queuePayload.add(
        <String, dynamic>{
          'streamUrl': entryResolution.streamUrl,
          'contentType': _contentTypeFor(entryResolution),
          'title': entry.name,
          if (entry.overview?.isNotEmpty == true) 'subtitle': entry.overview,
          'posterUrl': ?posterUrl,
        },
      );
    }

    final contentType = _contentTypeFor(resolution);
    castDiag(
      'loading on ${target.id}: $contentType, '
      'queue=${queuePayload.length}, url=$streamUrl',
    );
    try {
      await _native.startGoogleCastSession(
        targetId: target.id,
        streamUrl: streamUrl,
        contentType: contentType,
        title: item.name,
        subtitle: item.overview,
        posterUrl: _posterUrlFor(client, item),
        queueItems: queuePayload.length > 1 ? queuePayload : null,
        startPositionTicks: startPositionTicks,
      );
    } catch (e) {
      castDiag('native cast load failed', error: e);
      rethrow;
    }
  }

  @override
  Future<void> pause(CastTargetKind kind) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    await _native.pauseGoogleCast();
  }

  @override
  Future<void> play(CastTargetKind kind) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    await _native.playGoogleCast();
  }

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    await _native.seekGoogleCast(positionTicks: positionTicks);
  }

  @override
  Future<void> stop(CastTargetKind kind) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    await _native.stopGoogleCastSession();
  }

  @override
  Future<double?> getVolume(CastTargetKind kind) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    return _native.getGoogleCastVolume();
  }

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {
    if (kind != CastTargetKind.googleCast) {
      throw UnsupportedError('Unsupported cast kind for GoogleCastProvider.');
    }
    await _native.setGoogleCastVolume(volume: volume);
  }
}
