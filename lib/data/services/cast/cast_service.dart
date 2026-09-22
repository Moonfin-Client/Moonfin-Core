import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../models/aggregated_item.dart';
import '../log_service.dart';
import 'cast_provider.dart';
import 'cast_target.dart';
import 'cast_transport_controls.dart';
import 'native_airplay_channel.dart';
import 'native_cast_channel.dart';
import 'native_dlna_channel.dart';

class CastService {
  final List<CastProvider> _providers;
  final NativeCastChannel? _nativeCast;
  final NativeDlnaChannel? _nativeDlna;
  void Function(CastTarget)? _discoverySink;
  static final Logger _logger = Logger();
  final List<StreamSubscription<Map<String, dynamic>>> _nativeEventSubscriptions = [];
  final ValueNotifier<CastTargetKind?> activeKindNotifier = ValueNotifier(null);
  final ValueNotifier<CastTarget?> activeTargetNotifier = ValueNotifier(null);
  final ValueNotifier<AggregatedItem?> castItemNotifier = ValueNotifier(null);
  final ValueNotifier<String?> remoteStateNotifier = ValueNotifier(null);
  final ValueNotifier<int> remotePositionNotifier = ValueNotifier(0);
  final ValueNotifier<double?> remoteVolumeNotifier = ValueNotifier(null);
  Timer? _remotePollTimer;
  static const _remotePollInterval = Duration(seconds: 5);

  /// Latest receiver-side failure. A load request reports success as soon as
  /// it is issued, so a receiver that cant play the stream has no other way to
  /// say so. The mini player shows the message and clears it.
  final ValueNotifier<String?> remoteErrorNotifier = ValueNotifier(null);

  CastService(
    this._providers, {
    NativeCastChannel? nativeCast,
    NativeDlnaChannel? nativeDlna,
    NativeAirPlayChannel? nativeAirPlay,
  })  : _nativeCast = nativeCast,
        _nativeDlna = nativeDlna {
    if (nativeCast != null) {
      _nativeEventSubscriptions.add(
        nativeCast.googleCastEventStream().listen(
          (e) => _handleNativeEvent(e, 'googleCast', CastTargetKind.googleCast),
          onError: (e, st) =>
              _logger.w('Google Cast event stream error', error: e, stackTrace: st),
        ),
      );
    }
    if (nativeDlna != null) {
      _nativeEventSubscriptions.add(
        nativeDlna.dlnaEventStream().listen(
          (e) => _handleNativeEvent(e, 'dlna', CastTargetKind.dlna),
          onError: (e, st) =>
              _logger.w('DLNA event stream error', error: e, stackTrace: st),
        ),
      );
    }
    if (nativeAirPlay != null) {
      _nativeEventSubscriptions.add(
        nativeAirPlay.airPlayEventStream().listen(
          (e) => _handleNativeEvent(e, 'airPlay', CastTargetKind.airPlay),
          onError: (e, st) =>
              _logger.w('AirPlay event stream error', error: e, stackTrace: st),
        ),
      );
    }
  }

  void _handleNativeEvent(
    Map<String, dynamic> event,
    String expectedKind,
    CastTargetKind castKind,
  ) {
    final kind = event['kind'] as String?;
    if (kind != expectedKind) return;
    final state = event['state'] as String?;
    switch (state) {
      case 'connected':
        activeKindNotifier.value = castKind;
        remoteStateNotifier.value = null;
        if (castKind == CastTargetKind.googleCast || castKind == CastTargetKind.dlna) {
          _refreshVolume(castKind);
        }
      case 'disconnected':
        if (activeKindNotifier.value == castKind) {
          activeKindNotifier.value = null;
          activeTargetNotifier.value = null;
          castItemNotifier.value = null;
          remoteStateNotifier.value = null;
          remotePositionNotifier.value = 0;
          remoteVolumeNotifier.value = null;
        }
      case 'playing' || 'paused' || 'buffering' || 'idle':
        remoteStateNotifier.value = state;
        remotePositionNotifier.value = (event['positionTicks'] as int?) ?? 0;
      case 'error':
        castDiag(
          'receiver error (${castKind.name}): '
          '${event['message'] ?? 'unknown'}',
          level: LogLevel.warning,
        );
        if (activeKindNotifier.value == castKind) {
          remoteErrorNotifier.value =
              event['message'] as String? ?? 'Playback failed on the receiver';
        }
      case 'deviceFound':
        _discoverySink?.call(_targetFromEvent(event, castKind));
    }
  }

  Future<void> _refreshVolume(CastTargetKind kind) async {
    try {
      remoteVolumeNotifier.value = await getVolume(kind);
    } catch (_) {
      remoteVolumeNotifier.value = null;
    }
  }

  /// Keeps the notifiers current for a receiver that reports nothing on its
  /// own. Without this the mini player never learns the receiver is playing,
  /// so its pause button stays a play button and its seek bar stays at zero.
  void _startRemotePolling(CastTargetKind kind) {
    _stopRemotePolling();
    final pollable = _pollableForKind(kind);
    if (pollable == null) return;
    unawaited(_pollRemoteState(kind, pollable));
    _remotePollTimer = Timer.periodic(
      _remotePollInterval,
      (_) => unawaited(_pollRemoteState(kind, pollable)),
    );
  }

  PollableRemoteState? _pollableForKind(CastTargetKind kind) {
    try {
      final Object provider = _controlProviderForKind(kind);
      return provider is PollableRemoteState ? provider : null;
    } on UnsupportedError {
      return null;
    }
  }

  Future<void> _pollRemoteState(
    CastTargetKind kind,
    PollableRemoteState pollable,
  ) async {
    if (activeKindNotifier.value != kind) return;
    try {
      final snapshot = await pollable.fetchRemoteSnapshot(kind);
      // The target can be dropped while the request is out, and writing then
      // would light the mini player back up for a session nobody is on.
      if (snapshot == null || activeKindNotifier.value != kind) return;
      remoteStateNotifier.value = snapshot.state;
      remotePositionNotifier.value = snapshot.positionTicks;
      remoteVolumeNotifier.value = snapshot.volume;
    } catch (_) {}
  }

  void _stopRemotePolling() {
    _remotePollTimer?.cancel();
    _remotePollTimer = null;
  }

  CastTargetKind? get activeKind => activeKindNotifier.value;

  void setActiveKind(CastTargetKind? kind) {
    activeKindNotifier.value = kind;
  }

  /// Streams cast targets as they are found, keeping the native scan running
  /// until the listener cancels. A single one-shot scan returns before mDNS
  /// (Cast) and SSDP (DLNA) renderers have answered, so discovery must stay
  /// open: this emits an initial snapshot from every provider, then forwards
  /// `deviceFound` events (via [_handleNativeEvent]) for as long as the picker
  /// is listening.
  Stream<CastTarget> discoverTargetsStreamed(AggregatedItem item) {
    late final StreamController<CastTarget> controller;
    final seen = <String>{};

    void emit(CastTarget target) {
      if (target.id.isEmpty) return;
      final key = '${target.kind.name}:${target.id}';
      if (seen.add(key) && !controller.isClosed) {
        controller.add(target);
      }
    }

    void start() {
      _discoverySink = emit;
      _nativeCast?.startGoogleCastDiscovery().catchError(
            (e, st) => _logger.w('Failed to start Google Cast discovery',
                error: e, stackTrace: st),
          );
      _nativeDlna?.startDlnaDiscovery().catchError(
            (e, st) =>
                _logger.w('Failed to start DLNA discovery', error: e, stackTrace: st),
          );

      for (final provider in _providers) {
        provider.discoverTargets(item).then((targets) {
          targets.forEach(emit);
        }).catchError((e, st) {
          _logger.w('Cast provider snapshot discovery failed',
              error: e, stackTrace: st);
        });
      }
    }

    void stop() {
      if (identical(_discoverySink, emit)) _discoverySink = null;
      _nativeCast?.stopGoogleCastDiscovery().catchError(
            (e, st) => _logger.w('Failed to stop Google Cast discovery',
                error: e, stackTrace: st),
          );
      _nativeDlna?.stopDlnaDiscovery().catchError(
            (e, st) =>
                _logger.w('Failed to stop DLNA discovery', error: e, stackTrace: st),
          );
    }

    controller = StreamController<CastTarget>(onListen: start, onCancel: stop);
    return controller.stream;
  }

  CastTarget _targetFromEvent(Map<String, dynamic> event, CastTargetKind kind) {
    return CastTarget(
      id: event['id']?.toString() ?? '',
      kind: kind,
      title: event['title']?.toString() ?? '',
      subtitle: event['subtitle']?.toString() ?? '',
    );
  }

  Future<void> playToTarget(
    CastTarget target, {
    required AggregatedItem item,
    List<AggregatedItem>? queueItems,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    final provider = _providers.firstWhere(
      (p) => p.supportedKinds.contains(target.kind),
      orElse: () => throw StateError('No cast provider found for target'),
    );
    castDiag(
      'playToTarget ${target.kind.name} "${target.title}" item=${item.id} '
      'audio=$audioStreamIndex subtitle=$subtitleStreamIndex '
      'source=$mediaSourceId',
    );
    await provider.playToTarget(
      target,
      item: item,
      queueItems: queueItems,
      startPositionTicks: startPositionTicks,
      mediaSourceId: mediaSourceId,
      audioStreamIndex: audioStreamIndex,
      subtitleStreamIndex: subtitleStreamIndex,
    );

    activeTargetNotifier.value = target;
    castItemNotifier.value = item;
    activeKindNotifier.value = target.kind;
    remoteStateNotifier.value = null;
    remotePositionNotifier.value = startPositionTicks ?? 0;
    remoteVolumeNotifier.value = null;
    remoteErrorNotifier.value = null;
    _startRemotePolling(target.kind);
  }

  Future<void> play(CastTargetKind kind) async {
    final provider = _controlProviderForKind(kind);
    await provider.play(kind);
  }

  Future<void> pause(CastTargetKind kind) async {
    final provider = _controlProviderForKind(kind);
    await provider.pause(kind);
  }

  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {
    final provider = _controlProviderForKind(kind);
    await provider.seek(kind, positionTicks: positionTicks);
  }

  Future<void> stop(CastTargetKind kind) async {
    final provider = _controlProviderForKind(kind);
    await provider.stop(kind);
    if (activeKindNotifier.value == kind) {
      _stopRemotePolling();
      activeKindNotifier.value = null;
      activeTargetNotifier.value = null;
      castItemNotifier.value = null;
      remoteStateNotifier.value = null;
      remotePositionNotifier.value = 0;
      remoteVolumeNotifier.value = null;
    }
  }

  Future<double?> getVolume(CastTargetKind kind) async {
    final provider = _controlProviderForKind(kind);
    return provider.getVolume(kind);
  }

  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {
    final provider = _controlProviderForKind(kind);
    await provider.setVolume(kind, volume: volume);
  }

  CastTransportControls _controlProviderForKind(CastTargetKind kind) {
    final provider = _providers.whereType<CastTransportControls>().firstWhere(
      (p) => p.controllableKinds.contains(kind),
      orElse: () => throw UnsupportedError('No transport controls for cast kind: $kind'),
    );

    return provider;
  }

  Future<void> dispose() async {
    _stopRemotePolling();
    for (final subscription in _nativeEventSubscriptions) {
      await subscription.cancel();
    }
    _nativeEventSubscriptions.clear();
    activeKindNotifier.dispose();
    activeTargetNotifier.dispose();
    castItemNotifier.dispose();
    remoteStateNotifier.dispose();
    remotePositionNotifier.dispose();
    remoteVolumeNotifier.dispose();
    remoteErrorNotifier.dispose();
  }
}
