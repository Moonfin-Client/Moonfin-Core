/// One reading of a player's network and buffer state, for the playback stats
/// overlay. Rates rather than raw counters, so engines that only report rates,
/// like mpv's cache speed, can fill it too. Fields an engine can't report stay
/// null and the overlay leaves their rows out.
class PlaybackNetworkStats {
  const PlaybackNetworkStats({
    required this.bufferAhead,
    this.activityBitsPerSecond,
    this.bufferCeiling,
    this.bufferedBytes,
    this.targetBufferBytes,
    this.rebuffers,
  });

  /// How much is buffered past the play position.
  final Duration bufferAhead;

  /// Data received from the network over the last second.
  final int? activityBitsPerSecond;

  /// The most the engine buffers ahead for this source.
  final Duration? bufferCeiling;

  /// Memory the buffer holds now, and the most it may hold.
  final int? bufferedBytes;
  final int? targetBufferBytes;

  /// Times playback stalled to buffer this item, seeks left out.
  final int? rebuffers;
}
