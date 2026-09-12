import 'guide_cell.dart';

/// Selection the grid renders from, keyed by identity rather than row index so
/// it survives re-sorting, filtering and data replacement.
class GuideSelection {
  final String channelId;
  final DateTime anchorTime;
  final String? programId;

  const GuideSelection({
    required this.channelId,
    required this.anchorTime,
    this.programId,
  });

  GuideSelection copyWith({
    String? channelId,
    DateTime? anchorTime,
    String? programId,
    bool clearProgramId = false,
  }) =>
      GuideSelection(
        channelId: channelId ?? this.channelId,
        anchorTime: anchorTime ?? this.anchorTime,
        programId: clearProgramId ? null : (programId ?? this.programId),
      );
}

/// Index of the cell covering [anchor]; cells tile the window, so one always matches.
int resolveCellIndexAt(List<GuideCell> cells, DateTime anchor) {
  for (var i = 0; i < cells.length; i++) {
    if (!cells[i].start.isAfter(anchor) && cells[i].end.isAfter(anchor)) return i;
  }
  return anchor.isBefore(cells.first.start) ? 0 : cells.length - 1;
}

/// Pulls [anchor] inside [cell]'s half-open interval.
/// Precondition: [cell] is non-empty (`start` strictly before `end`).
DateTime clampAnchorInto(GuideCell cell, DateTime anchor) {
  if (anchor.isBefore(cell.start)) return cell.start;
  if (!anchor.isBefore(cell.end)) {
    return cell.end.subtract(const Duration(microseconds: 1));
  }
  return anchor;
}
