import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

HomeRow placeholder(String id) => HomeRow(
  id: id,
  title: id,
  rowType: HomeRowType.pluginDynamic,
  isLoading: true,
);

HomeRow populated(String id) => placeholder(id).copyWith(
  isLoading: false,
  items: [
    AggregatedItem(id: id, serverId: 'server', rawData: {'Name': id}),
  ],
);

List<String> visibleIds(List<HomeRow> rows) =>
    HomeViewModel.rowsForDisplay(rows).map((row) => row.id).toList();

void main() {
  group('empty Home sections on Web and native clients', () {
    test('never appear while a fresh load resolves', () {
      expect(
        visibleIds([placeholder('empty'), placeholder('latest')]),
        isEmpty,
      );
      expect(visibleIds([placeholder('empty'), populated('latest')]), [
        'latest',
      ]);
      expect(visibleIds([populated('latest')]), ['latest']);
    });

    test('stay hidden when focus regain recreates their placeholders', () {
      final latest = populated('latest');
      expect(visibleIds([latest]), ['latest']);
      expect(visibleIds([placeholder('empty'), latest]), ['latest']);
      expect(visibleIds([latest]), ['latest']);
    });

    test('hides loaded empty sections, including Continue Watching', () {
      for (final type in HomeRowType.values) {
        if (type == HomeRowType.liveTv) continue;
        final empty = HomeRow(id: type.name, title: type.name, rowType: type);
        expect(visibleIds([empty, populated('latest')]), ['latest']);
      }
    });

    test('a formerly empty section can gain content in configured order', () {
      final latest = populated('latest');
      expect(visibleIds([placeholder('resume'), latest]), ['latest']);
      expect(visibleIds([populated('resume'), latest]), ['resume', 'latest']);
    });

    test('keeps cached content and loaded action rows without media items', () {
      final liveTv = HomeRow(
        id: 'liveTv',
        title: 'Live TV',
        rowType: HomeRowType.liveTv,
      );
      expect(visibleIds([placeholder('empty'), populated('cached'), liveTv]), [
        'cached',
        'liveTv',
      ]);
      expect(visibleIds([populated('cached').copyWith(isLoading: true)]), [
        'cached',
      ]);
    });

    test('all clients hide titled Continue Watching loading placeholders', () {
      final resume = HomeRow(
        id: 'resume',
        title: 'Continue Watching',
        rowType: HomeRowType.resume,
        isLoading: true,
      );
      expect(visibleIds([resume, populated('latest')]), ['latest']);
    });
  });
}
