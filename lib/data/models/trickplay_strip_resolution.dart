class TrickplayStripResolver {
  const TrickplayStripResolver._();

  static List<TrickplayStripSlot> resolve({
    required Duration fakeTimelinePosition,
    required Duration totalDuration,
    required int stepMs,
    int slotCount = 5,
    int? highlightIndex,
  }) {
    assert(slotCount > 0);
    final highlight = (highlightIndex ?? slotCount ~/ 2).clamp(
      0,
      slotCount - 1,
    );
    return List.generate(slotCount, (i) {
      final slotIndex = i - highlight;
      final targetMs =
          fakeTimelinePosition.inMilliseconds + slotIndex * stepMs;
      final inRange = targetMs >= 0 && targetMs <= totalDuration.inMilliseconds;
      return TrickplayStripSlot(
        slotIndex: slotIndex,
        targetPosition: inRange ? Duration(milliseconds: targetMs) : null,
        inRange: inRange,
      );
    }, growable: false);
  }
}

class TrickplayStripSlot {
  final int slotIndex;
  final Duration? targetPosition;
  final bool inRange;

  const TrickplayStripSlot({
    required this.slotIndex,
    required this.targetPosition,
    required this.inRange,
  });
}
