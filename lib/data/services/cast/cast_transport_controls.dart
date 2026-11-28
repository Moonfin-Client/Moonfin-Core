import '../../models/aggregated_item.dart';
import 'cast_target.dart';

/// What a receiver says about the item it is playing.
class RemotePlaybackSnapshot {
  /// 'playing' or 'paused', and null when the receiver is on nothing.
  final String? state;
  final int positionTicks;

  /// A fraction, or null when the receiver reports no volume of its own.
  final double? volume;

  /// The item currently playing on the receiver, when reported.
  final AggregatedItem? item;

  const RemotePlaybackSnapshot({
    this.state,
    this.positionTicks = 0,
    this.volume,
    this.item,
  });
}

abstract class CastTransportControls {
  Set<CastTargetKind> get controllableKinds;

  Future<void> play(CastTargetKind kind);

  Future<void> pause(CastTargetKind kind);

  Future<void> seek(CastTargetKind kind, {required int positionTicks});

  Future<void> stop(CastTargetKind kind);

  Future<double?> getVolume(CastTargetKind kind);

  Future<void> setVolume(CastTargetKind kind, {required double volume});
}

/// Optional queue navigation for receivers that support track/item skipping
/// (such as Jellyfin remote sessions).
abstract class CastTrackSkipControls {
  Future<void> nextTrack(CastTargetKind kind);

  Future<void> previousTrack(CastTargetKind kind);
}

/// A transport whose receiver has to be asked where it is. Cast, DLNA and
/// AirPlay push native events and don't implement this, so polling stays off
/// for them.
abstract class PollableRemoteState {
  Future<RemotePlaybackSnapshot?> fetchRemoteSnapshot(CastTargetKind kind);
}
