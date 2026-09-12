import 'guide_cell.dart';
import 'guide_selection.dart';

/// Rounds down to :00, :15, :30 or :45.
DateTime floorToQuarterHour(DateTime t) =>
    DateTime(t.year, t.month, t.day, t.hour, t.minute - (t.minute % 15));

/// Rounds down to :00 or :30.
DateTime floorToHalfHour(DateTime t) =>
    DateTime(t.year, t.month, t.day, t.hour, t.minute - (t.minute % 30));

/// Left edge of the guide window: the nearest top or bottom of the hour at
/// or before [now]. Looking further back is the `‹` control's job.
DateTime guideLeftEdge(DateTime now) => floorToHalfHour(now);

/// The cell the selection currently addresses, or null when nothing in [cells]
/// represents it any more.
GuideCell? _selectedCell(GuideSelection current, List<GuideCell> cells) {
  final programId = current.programId;
  if (programId != null) {
    for (final cell in cells) {
      if (cell.program?.id == programId) return cell;
    }
    return null;
  }
  final anchor = current.anchorTime;
  if (anchor.isBefore(cells.first.start) || !anchor.isBefore(cells.last.end)) {
    return null;
  }
  return cells[resolveCellIndexAt(cells, anchor)];
}

/// Re-resolves [current] against a window that has just moved. The selected
/// cell is kept when it still intersects the window, with the anchor clamped
/// into its visible interval; otherwise the currently airing cell is taken and
/// the anchor reset to [now]. The channel is never changed.
GuideSelection reanchorSelection({
  required GuideSelection current,
  required List<GuideCell> cells,
  required DateTime now,
}) {
  if (cells.isEmpty) return current;

  final retained = _selectedCell(current, cells);
  if (retained != null) {
    return current.copyWith(
      anchorTime: clampAnchorInto(retained, current.anchorTime),
    );
  }

  final airing = cells[resolveCellIndexAt(cells, now)];
  return current.copyWith(
    anchorTime: now,
    programId: airing.program?.id,
    clearProgramId: airing.program == null,
  );
}
