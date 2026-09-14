import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_cell.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_selection.dart';

GuideCell _c(int sh, int sm, int eh, int em, [GuideCellKind k = GuideCellKind.program]) =>
    GuideCell(
      start: DateTime(2026, 9, 8, sh, sm),
      end: DateTime(2026, 9, 8, eh, em),
      kind: k,
      program: null,
    );

void main() {
  final row = [
    _c(18, 0, 19, 0),
    _c(19, 0, 19, 30, GuideCellKind.gap),
    _c(19, 30, 21, 0),
  ];

  test('resolves the cell containing the anchor, start-inclusive end-exclusive', () {
    expect(resolveCellIndexAt(row, DateTime(2026, 9, 8, 19, 15)), 1);
    expect(resolveCellIndexAt(row, DateTime(2026, 9, 8, 19, 0)), 1);
    expect(resolveCellIndexAt(row, DateTime(2026, 9, 8, 19, 30)), 2);
  });

  test('a gap is selectable like any other cell', () {
    expect(row[resolveCellIndexAt(row, DateTime(2026, 9, 8, 19, 10))].kind,
        GuideCellKind.gap);
  });

  test('clamp pulls an anchor forward into a retained cell', () {
    // Spec A6: a 19:00-21:00 film retained across a re-anchor to leftEdge 19:15
    // must not keep anchor 19:00, which no longer renders.
    final visible = _c(19, 15, 21, 0);
    expect(clampAnchorInto(visible, DateTime(2026, 9, 8, 19, 0)),
        DateTime(2026, 9, 8, 19, 15));
  });

  test('clamp leaves an already-visible anchor alone', () {
    final visible = _c(19, 15, 21, 0);
    final a = DateTime(2026, 9, 8, 20, 0);
    expect(clampAnchorInto(visible, a), a);
  });

  test('clamp stays inside an interval shorter than one minute', () {
    // Subtracting a whole minute from the exclusive upper bound would land
    // before the start.
    final tiny = GuideCell(
      start: DateTime(2026, 9, 8, 19, 29, 30),
      end: DateTime(2026, 9, 8, 19, 30, 0),
      kind: GuideCellKind.program,
      program: null,
    );
    final clamped = clampAnchorInto(tiny, DateTime(2026, 9, 8, 20, 0));
    expect(clamped.isBefore(tiny.end), isTrue);
    expect(clamped.isBefore(tiny.start), isFalse);
  });
}
