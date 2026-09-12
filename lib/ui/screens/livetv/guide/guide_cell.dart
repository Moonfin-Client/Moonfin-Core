import '../../../../data/viewmodels/live_tv_guide_view_model.dart';

/// What a guide row's presentation cell represents at a given interval.
enum GuideCellKind { program, gap, filtered, loading, failed }

/// A presentation-only slice of a guide row's timeline; never written back to
/// the server-backed program cache.
class GuideCell {
  final DateTime start;
  final DateTime end;
  final GuideCellKind kind;
  final GuideProgram? program;

  const GuideCell({
    required this.start,
    required this.end,
    required this.kind,
    this.program,
  });
}

/// Builds the continuous, non-overlapping timeline of cells for one guide row
/// across `[windowStart, windowEnd)`, so vertical navigation always resolves a
/// clock time to a cell.
List<GuideCell> buildRowCells({
  required List<GuideProgram> visible,
  required List<GuideProgram> unfiltered,
  required DateTime windowStart,
  required DateTime windowEnd,
  required GuideChannelLoadState loadState,
}) {
  if (loadState != GuideChannelLoadState.loaded) {
    final kind = loadState == GuideChannelLoadState.loading
        ? GuideCellKind.loading
        : GuideCellKind.failed;
    return [GuideCell(start: windowStart, end: windowEnd, kind: kind)];
  }

  // Clip and sort the visible programs to the window; the server can return
  // programs unsorted, and clipping can also produce a zero-width interval
  // for a program that only touches the window edge.
  final clipped = visible
      .map((p) {
        final start =
            p.startDate.isAfter(windowStart) ? p.startDate : windowStart;
        final end = p.endDate.isBefore(windowEnd) ? p.endDate : windowEnd;
        return (start: start, end: end, program: p);
      })
      .where((c) => c.start.isBefore(c.end))
      .toList()
    ..sort((a, b) => a.start.compareTo(b.start));

  final cells = <GuideCell>[];
  var cursor = windowStart;
  for (final c in clipped) {
    // Overlapping input programs can put c.start behind the cursor; skip the
    // already-covered portion rather than emitting an overlapping cell.
    final start = c.start.isBefore(cursor) ? cursor : c.start;
    if (!start.isBefore(c.end)) continue;
    if (start.isAfter(cursor)) {
      cells.addAll(_fillHole(cursor, start, unfiltered));
    }
    cells.add(
      GuideCell(
        start: start,
        end: c.end,
        kind: GuideCellKind.program,
        program: c.program,
      ),
    );
    cursor = c.end;
  }
  if (cursor.isBefore(windowEnd)) {
    cells.addAll(_fillHole(cursor, windowEnd, unfiltered));
  }
  return cells;
}

/// Partitions a hole at hidden-program boundaries so real gaps are not
/// swallowed by a filtered programme that covers only part of the interval.
List<GuideCell> _fillHole(
  DateTime start,
  DateTime end,
  List<GuideProgram> unfiltered,
) {
  final hidden = unfiltered
      .map((program) {
        final clippedStart =
            program.startDate.isAfter(start) ? program.startDate : start;
        final clippedEnd =
            program.endDate.isBefore(end) ? program.endDate : end;
        return (start: clippedStart, end: clippedEnd);
      })
      .where((interval) => interval.start.isBefore(interval.end))
      .toList()
    ..sort((a, b) => a.start.compareTo(b.start));

  final cells = <GuideCell>[];
  var cursor = start;
  for (final interval in hidden) {
    final filteredStart =
        interval.start.isBefore(cursor) ? cursor : interval.start;
    if (filteredStart.isAfter(cursor)) {
      cells.add(
        GuideCell(start: cursor, end: filteredStart, kind: GuideCellKind.gap),
      );
    }
    if (filteredStart.isBefore(interval.end)) {
      cells.add(
        GuideCell(
          start: filteredStart,
          end: interval.end,
          kind: GuideCellKind.filtered,
        ),
      );
      cursor = interval.end;
    }
  }
  if (cursor.isBefore(end)) {
    cells.add(GuideCell(start: cursor, end: end, kind: GuideCellKind.gap));
  }
  return cells;
}
