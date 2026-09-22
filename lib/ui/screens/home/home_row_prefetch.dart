import '../../../util/device_performance.dart';

/// Rows below the focused one to warm, and how many cards past the visible
/// count to warm in each.
typedef RowPrefetchBudget = ({int rowsAhead, int extraCards});

/// What the next rows may cost right now, or null when nothing should be
/// warmed.
///
/// The reduced tier gets nothing: its two fetch slots and 32 MB decode cache
/// are spoken for by what is on screen. Cellular gets one row and only what
/// fits, since a browse the user never scrolls to would otherwise cost them
/// data. The background gets nothing, a screen nobody is looking at has no
/// next row.
RowPrefetchBudget? rowPrefetchBudget({
  required DevicePerformanceTier tier,
  required bool canReachServer,
  required bool isBackgrounded,
  required bool cellularOnly,
}) {
  if (tier == DevicePerformanceTier.reduced) return null;
  if (!canReachServer || isBackgrounded) return null;
  if (cellularOnly) return (rowsAhead: 1, extraCards: 0);
  return (rowsAhead: 2, extraCards: 2);
}

/// A row to warm and how many of its leading cards.
typedef HomeRowPrefetchTarget = ({int row, int count});

/// The rows below [fromRow] to warm, skipping rows that have nothing to show
/// yet, each capped so a row of hundreds never costs more than a screenful.
/// [visibleCards] answers per row, since each row has its own card width.
List<HomeRowPrefetchTarget> homeRowPrefetchTargets({
  required int rowCount,
  required int fromRow,
  required int rowsAhead,
  required int Function(int row) visibleCards,
  required int extraCards,
  required bool Function(int row) isRowReady,
  required int Function(int row) itemCount,
  int maxPerRow = 12,
}) {
  final targets = <HomeRowPrefetchTarget>[];
  for (var row = fromRow + 1; row <= fromRow + rowsAhead; row++) {
    if (row < 0 || row >= rowCount) break;
    if (!isRowReady(row)) continue;
    final count = [
      itemCount(row),
      visibleCards(row) + extraCards,
      maxPerRow,
    ].reduce((a, b) => a < b ? a : b);
    if (count <= 0) continue;
    targets.add((row: row, count: count));
  }
  return targets;
}

int visibleCardsFor({
  required double viewportWidth,
  required double cardWidth,
  required double spacing,
}) {
  final pitch = cardWidth + spacing;
  if (pitch <= 0 || viewportWidth <= 0) return 0;
  return (viewportWidth / pitch).ceil();
}

/// How far past the viewport a library grid lays out, so the row about to
/// scroll in has already asked for its artwork. The framework default of
/// 250 pixels is less than one poster row. On the reduced tier the default
/// stays: laying out a row early costs decodes its cache can't hold.
double? gridCacheExtentFor({
  required DevicePerformanceTier tier,
  required double cellExtent,
  required double spacing,
}) {
  if (tier == DevicePerformanceTier.reduced) return null;
  return cellExtent + spacing;
}
