import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/home_row.dart';
import 'package:moonfin/data/services/topshelf_service.dart';

HomeRow _row(String id, {HomeRowType type = HomeRowType.latestMedia}) =>
    HomeRow(id: id, title: id, rowType: type);

void main() {
  group('TopShelfService.isLatestRow', () {
    test('takes the Latest rows in every shape they are built', () {
      expect(TopShelfService.isLatestRow(_row('latest_lib1')), isTrue);
      expect(TopShelfService.isLatestRow(_row('latest_srv1_lib1')), isTrue);
      expect(
        TopShelfService.isLatestRow(_row('mergedtype_latest_movies')),
        isTrue,
      );
    });

    test('leaves out the other rows that share the latestMedia type', () {
      for (final id in [
        'favorites_lib1',
        'lastPlayed_lib1',
        'sinceYouWatched0',
        'rewatch',
        'recently_released_lib1',
        'mergedtype_recently_released_movies',
        'movie_lib1',
      ]) {
        expect(TopShelfService.isLatestRow(_row(id)), isFalse, reason: id);
      }
    });

    test('ignores the id when the row is some other type', () {
      expect(
        TopShelfService.isLatestRow(
          _row('latest_lib1', type: HomeRowType.nextUp),
        ),
        isFalse,
      );
    });
  });
}
