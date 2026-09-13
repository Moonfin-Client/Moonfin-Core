import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/home/home_view_model.dart';

void main() {
  // Getting this wrong is visible either way. Keep too much and an item the
  // user removed sits on the row for the rest of the session, keep too little
  // and the row loses its pages, refills, and flickers doing it.
  group('a section landing on top of a row', () {
    bool keeps({
      bool pagedDuringLoad = true,
      int existing = 45,
      int fresh = 15,
    }) => HomeViewModel.keepsPagedRow(
      pagedDuringLoad: pagedDuringLoad,
      existingItemCount: existing,
      freshItemCount: fresh,
    );

    test('leaves a row that paged while the fetch was out alone', () {
      expect(keeps(), isTrue);
    });

    test('takes a shorter answer for a row that did not page', () {
      expect(keeps(pagedDuringLoad: false), isFalse);
    });

    test('takes a fetch that is not short', () {
      expect(keeps(existing: 45, fresh: 45), isFalse);
      expect(keeps(existing: 45, fresh: 60), isFalse);
      expect(keeps(existing: 0, fresh: 15), isFalse);
    });
  });
}
