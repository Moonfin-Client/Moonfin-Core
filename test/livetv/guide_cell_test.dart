import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/livetv/guide/guide_cell.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';

GuideProgram _p(String id, int sh, int sm, int eh, int em) => GuideProgram(
      id: id,
      channelId: 'c1',
      name: id,
      startDate: DateTime(2026, 9, 8, sh, sm),
      endDate: DateTime(2026, 9, 8, eh, em),
      overview: null,
      episodeTitle: null,
      isMovie: false,
      isSeries: false,
      isSports: false,
      isNews: false,
      isKids: false,
      isPremiere: false,
      hasTimer: false,
      hasSeriesTimer: false,
      rawData: const <String, dynamic>{},
    );

final _ws = DateTime(2026, 9, 8, 19, 0);
final _we = DateTime(2026, 9, 8, 22, 0);

void main() {
  test('cells tile the window with no holes and no overlaps', () {
    final cells = buildRowCells(
      visible: [_p('a', 19, 0, 20, 0), _p('b', 21, 0, 22, 0)],
      unfiltered: [_p('a', 19, 0, 20, 0), _p('b', 21, 0, 22, 0)],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.loaded,
    );
    expect(cells.first.start, _ws);
    expect(cells.last.end, _we);
    for (var i = 1; i < cells.length; i++) {
      expect(cells[i].start, cells[i - 1].end);
    }
  });

  test('a hole with no underlying programme is a gap', () {
    final cells = buildRowCells(
      visible: [_p('a', 19, 0, 20, 0)],
      unfiltered: [_p('a', 19, 0, 20, 0)],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.loaded,
    );
    expect(cells.last.kind, GuideCellKind.gap);
  });

  test('a hole created by the genre filter is filtered, not a gap', () {
    // The programme exists; the filter removed it. Labelling this "No programme
    // data" would describe a known show as missing data.
    final cells = buildRowCells(
      visible: [_p('a', 19, 0, 20, 0)],
      unfiltered: [_p('a', 19, 0, 20, 0), _p('b', 20, 0, 22, 0)],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.loaded,
    );
    expect(cells.last.kind, GuideCellKind.filtered);
  });

  test('a partially filtered hole keeps its real gap portions distinct', () {
    final cells = buildRowCells(
      visible: [_p('a', 19, 0, 20, 0)],
      unfiltered: [_p('a', 19, 0, 20, 0), _p('hidden', 20, 30, 21, 0)],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.loaded,
    );

    expect(cells.map((cell) => (cell.start, cell.end, cell.kind)), [
      (
        _p('a', 19, 0, 20, 0).startDate,
        _p('a', 19, 0, 20, 0).endDate,
        GuideCellKind.program,
      ),
      (
        DateTime(2026, 9, 8, 20),
        DateTime(2026, 9, 8, 20, 30),
        GuideCellKind.gap,
      ),
      (
        DateTime(2026, 9, 8, 20, 30),
        DateTime(2026, 9, 8, 21),
        GuideCellKind.filtered,
      ),
      (DateTime(2026, 9, 8, 21), _we, GuideCellKind.gap),
    ]);
  });

  test('an unloaded channel is one loading cell spanning the window', () {
    final cells = buildRowCells(
      visible: const [],
      unfiltered: const [],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.loading,
    );
    expect(cells, hasLength(1));
    expect(cells.single.kind, GuideCellKind.loading);
  });

  test('a failed channel is one failed cell spanning the window', () {
    final cells = buildRowCells(
      visible: const [],
      unfiltered: const [],
      windowStart: _ws,
      windowEnd: _we,
      loadState: GuideChannelLoadState.failed,
    );
    expect(cells.single.kind, GuideCellKind.failed);
  });
}
