import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../models/aggregated_item.dart';
import '../media_server_client_factory.dart';
import 'cast_provider.dart';
import 'cast_target.dart';
import 'cast_transport_controls.dart';

class RemoteSessionCastProvider
    implements CastProvider, CastTransportControls, PollableRemoteState {
  final MediaServerClientFactory _clientFactory;

  String? _activeSessionId;
  String? _activeServerId;

  /// The last level we asked for, as a fraction. A receiver that reports no
  /// volume of its own still takes SetVolume, so this keeps the slider on a
  /// number rather than marking a working control unavailable.
  double? _lastSentVolume;

  RemoteSessionCastProvider(this._clientFactory);

  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.jellyfinSession};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.jellyfinSession};

  MediaServerClient _clientFor(AggregatedItem item) {
    return _clientFactory.getClientIfExists(item.serverId) ??
        GetIt.instance<MediaServerClient>();
  }

  MediaServerClient get _activeClient =>
      (_activeServerId != null
          ? _clientFactory.getClientIfExists(_activeServerId!)
          : null) ??
      GetIt.instance<MediaServerClient>();

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async {
    final client = _clientFor(item);
    final sessions = await client.sessionApi.getSessions();
    final selfDeviceId = client.deviceInfo.id;

    final targets = <CastTarget>[];
    for (final session in sessions) {
      final sessionId = session['Id']?.toString();
      if (sessionId == null || sessionId.isEmpty) {
        continue;
      }
      final supports = session['SupportsMediaControl'];
      if (supports is bool && !supports) {
        continue;
      }
      final deviceId = session['DeviceId']?.toString();
      if (deviceId != null && deviceId == selfDeviceId) {
        continue;
      }

      final user = session['UserName'] as String?;
      final clientName = session['Client'] as String?;
      final deviceName = session['DeviceName'] as String?;
      final nowPlaying = session['NowPlayingItem'] as Map<String, dynamic>?;
      final subtitle = nowPlaying != null
          ? (nowPlaying['Name'] as String? ?? 'Now playing')
          : [
              if (clientName != null && clientName.isNotEmpty) clientName,
              if (deviceName != null && deviceName.isNotEmpty) deviceName,
            ].join(' • ');
      final title = user != null && user.isNotEmpty
          ? user
          : (deviceName?.isNotEmpty ?? false)
          ? deviceName!
          : 'Unknown device';

      targets.add(
        CastTarget(
          id: sessionId,
          kind: CastTargetKind.jellyfinSession,
          title: title,
          subtitle: subtitle,
        ),
      );
    }

    return targets;
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
    _activeSessionId = target.id;
    _activeServerId = item.serverId;
    final client = _clientFor(item);
    final itemIds = (queueItems == null || queueItems.isEmpty)
        ? <String>[item.id]
        : queueItems.map((entry) => entry.id).toList(growable: false);
    await client.sessionApi.sendPlayCommand(
      target.id,
      playCommand: 'PlayNow',
      itemIds: itemIds,
      startPositionTicks: startPositionTicks,
      mediaSourceId: mediaSourceId,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );
  }

  @override
  Future<void> play(CastTargetKind kind) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    await _activeClient.sessionApi.sendPlayStateCommand(sessionId, 'Unpause');
  }

  @override
  Future<void> pause(CastTargetKind kind) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    await _activeClient.sessionApi.sendPlayStateCommand(sessionId, 'Pause');
  }

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    await _activeClient.sessionApi.sendPlayStateCommand(
      sessionId,
      'Seek',
      seekPositionTicks: positionTicks,
    );
  }

  @override
  Future<void> stop(CastTargetKind kind) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    await _activeClient.sessionApi.sendPlayStateCommand(sessionId, 'Stop');
    _activeSessionId = null;
    _activeServerId = null;
    _lastSentVolume = null;
  }

  /// The server's current record of the session being cast to, or null when
  /// nothing is active or the server could not be reached.
  Future<Map<String, dynamic>?> _fetchActiveSession() async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return null;
    try {
      final sessions = await _activeClient.sessionApi.getSessions();
      return sessions.cast<Map<String, dynamic>?>().firstWhere(
        (entry) => entry?['Id']?.toString() == sessionId,
        orElse: () => null,
      );
    } catch (_) {
      return null;
    }
  }

  double? _volumeFrom(Map<String, dynamic>? session) {
    final playState = session?['PlayState'] as Map<String, dynamic>?;
    final level = (playState?['VolumeLevel'] as num?)?.toDouble();
    if (level == null) return null;
    return (level / 100).clamp(0.0, 1.0);
  }

  @override
  Future<RemotePlaybackSnapshot?> fetchRemoteSnapshot(
    CastTargetKind kind,
  ) async {
    final session = await _fetchActiveSession();
    if (session == null) return null;

    final playState = session['PlayState'] as Map<String, dynamic>?;
    final nowPlaying = session['NowPlayingItem'] as Map<String, dynamic>?;
    return RemotePlaybackSnapshot(
      // Nothing playing reads as no state at all rather than as paused, which
      // is what the mini player shows an idle receiver.
      state: nowPlaying == null
          ? null
          : (playState?['IsPaused'] as bool? ?? false)
                ? 'paused'
                : 'playing',
      positionTicks: (playState?['PositionTicks'] as num?)?.toInt() ?? 0,
      volume: _volumeFrom(session) ?? _lastSentVolume,
    );
  }

  @override
  Future<double?> getVolume(CastTargetKind kind) async {
    if (_activeSessionId == null) return null;
    return _volumeFrom(await _fetchActiveSession()) ?? _lastSentVolume;
  }

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    // The slider works in fractions and the server in whole percent.
    final fraction = volume.clamp(0.0, 1.0);
    await _activeClient.sessionApi.sendGeneralCommand(
      sessionId,
      'SetVolume',
      arguments: {'Volume': (fraction * 100).round().toString()},
    );
    _lastSentVolume = fraction;
  }
}
