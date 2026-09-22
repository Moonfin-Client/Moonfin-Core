import 'dart:math' as math;

/// A card's place in a grid that runs several sections down one scroll view.
typedef GridSectionCell = ({int section, int index});

/// The cell a vertical D-pad press moves to, or null when the press leaves the
/// grid, which is up from the first row of the first section or down from the
/// last row of the last one.
///
/// Sliver boundaries leave the framework's own directional traversal with no
/// geometry to work from once a section scrolls out of view, so the caller
/// moves focus itself and needs somewhere to move it to. [sectionLengths] is
/// the card count of every section in display order, and a section holding
/// nothing is stepped over rather than landed on.
GridSectionCell? gridSectionTarget({
  required List<int> sectionLengths,
  required int crossAxisCount,
  required int section,
  required int index,
  required bool down,
}) {
  final column = index % crossAxisCount;
  final row = index ~/ crossAxisCount;

  if (down) {
    final length = sectionLengths[section];
    if (row < _rowCount(length, crossAxisCount) - 1) {
      // The row below can be ragged, so a card over the gap takes its last.
      final below = index + crossAxisCount;
      return (section: section, index: below < length ? below : length - 1);
    }
    final next = _filledSection(sectionLengths, section + 1, 1);
    if (next == null) return null;
    return (section: next, index: math.min(column, sectionLengths[next] - 1));
  }

  if (row > 0) return (section: section, index: index - crossAxisCount);
  final previous = _filledSection(sectionLengths, section - 1, -1);
  if (previous == null) return null;
  // The previous section's last row is the one next to this card on screen.
  final previousLength = sectionLengths[previous];
  final lastRowStart =
      (_rowCount(previousLength, crossAxisCount) - 1) * crossAxisCount;
  return (
    section: previous,
    index: lastRowStart + math.min(column, previousLength - 1 - lastRowStart),
  );
}

int _rowCount(int length, int crossAxisCount) =>
    (length + crossAxisCount - 1) ~/ crossAxisCount;

/// The first section from [from] in the direction of [step] that has cards in
/// it, or null once the list runs out.
int? _filledSection(List<int> sectionLengths, int from, int step) {
  for (var i = from; i >= 0 && i < sectionLengths.length; i += step) {
    if (sectionLengths[i] > 0) return i;
  }
  return null;
}
