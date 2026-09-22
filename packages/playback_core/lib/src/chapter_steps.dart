/// How far past a chapter start a press still counts as being on it, so a
/// press a second in doesn't seek to where you already are. Matches the
/// grace the restart rule uses.
const _stepGrace = Duration(seconds: 3);

/// The chapter to step back to from [position], or null when there is none
/// and the caller should fall through to whatever previous means for the
/// queue.
///
/// Stepping back from inside a chapter lands on that chapter's own start
/// first, which is how a second press reaches the one before it.
Duration? previousChapterStart(List<Duration> starts, Duration position) {
  final threshold = position - _stepGrace;
  Duration? best;
  for (final start in starts) {
    if (start > threshold) continue;
    if (best == null || start > best) best = start;
  }
  return best;
}

/// The chapter to step forward to from [position], or null when the position
/// is already inside the last one.
Duration? nextChapterStart(List<Duration> starts, Duration position) {
  Duration? best;
  for (final start in starts) {
    if (start <= position) continue;
    if (best == null || start < best) best = start;
  }
  return best;
}
