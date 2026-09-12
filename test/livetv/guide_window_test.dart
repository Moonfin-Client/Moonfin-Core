import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_cell.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_selection.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_window.dart';

void main() {
  test('leftEdge is the nearest top or bottom of the hour at or before now', () {
    expect(guideLeftEdge(DateTime(2026, 9, 8, 19, 26)), DateTime(2026, 9, 8, 19, 0));
    expect(guideLeftEdge(DateTime(2026, 9, 8, 19, 31)), DateTime(2026, 9, 8, 19, 30));
    expect(guideLeftEdge(DateTime(2026, 9, 8, 19, 44)), DateTime(2026, 9, 8, 19, 30));
    expect(guideLeftEdge(DateTime(2026, 9, 8, 19, 46)), DateTime(2026, 9, 8, 19, 30));
  });

  test('leftEdge stays within 0 to 30 minutes behind now, always on :00 or :30', () {
    var t = DateTime(2026, 9, 8);
    for (var i = 0; i < 24 * 60; i++) {
      final edge = guideLeftEdge(t);
      final behindBy = t.difference(edge).inMinutes;
      expect(behindBy, inInclusiveRange(0, 30), reason: 'at $t');
      expect(edge.minute == 0 || edge.minute == 30, isTrue, reason: 'at $t');
      t = t.add(const Duration(minutes: 1));
    }
  });

  test('leftEdge floors within the day, no midnight crossing needed', () {
    expect(guideLeftEdge(DateTime(2026, 9, 8, 0, 5)), DateTime(2026, 9, 8, 0, 0));
  });

  group('reanchorSelection', () {
    GuideProgram program(String id, DateTime start, DateTime end) => GuideProgram(
      id: id,
      channelId: 'ch1',
      name: id,
      startDate: start,
      endDate: end,
      rawData: const {},
    );

    test('a cell that survives the shift keeps its programme and clamps the anchor', () {
      final windowStart = DateTime(2026, 9, 8, 19, 15);
      final film = program('film', DateTime(2026, 9, 8, 19, 0), DateTime(2026, 9, 8, 21, 0));
      final cells = [
        GuideCell(
          start: windowStart,
          end: DateTime(2026, 9, 8, 21, 0),
          kind: GuideCellKind.program,
          program: film,
        ),
        GuideCell(
          start: DateTime(2026, 9, 8, 21, 0),
          end: DateTime(2026, 9, 8, 22, 0),
          kind: GuideCellKind.gap,
        ),
      ];

      final result = reanchorSelection(
        current: GuideSelection(
          channelId: 'ch1',
          anchorTime: DateTime(2026, 9, 8, 19, 0),
          programId: 'film',
        ),
        cells: cells,
        now: DateTime(2026, 9, 8, 19, 31),
      );

      expect(result.programId, 'film');
      expect(result.channelId, 'ch1');
      expect(result.anchorTime, windowStart);
    });

    test('a cell that falls out of the window resets the anchor to now on the same channel', () {
      final now = DateTime(2026, 9, 8, 19, 31);
      final airing = program('airing', DateTime(2026, 9, 8, 19, 15), DateTime(2026, 9, 8, 20, 0));
      final cells = [
        GuideCell(
          start: DateTime(2026, 9, 8, 19, 15),
          end: DateTime(2026, 9, 8, 20, 0),
          kind: GuideCellKind.program,
          program: airing,
        ),
      ];

      final result = reanchorSelection(
        current: GuideSelection(
          channelId: 'ch1',
          anchorTime: DateTime(2026, 9, 8, 18, 50),
          programId: 'ended',
        ),
        cells: cells,
        now: now,
      );

      expect(result.channelId, 'ch1');
      expect(result.anchorTime, now);
      expect(result.programId, 'airing');
    });
  });
}
