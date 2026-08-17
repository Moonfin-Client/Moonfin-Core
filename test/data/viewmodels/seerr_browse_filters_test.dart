import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/viewmodels/seerr_browse_view_model.dart';

void main() {
  test('tv statuses carry the values seerr defines, pipe joined', () {
    expect(SeerrTvStatus.returningSeries.apiValue, 0);
    expect(SeerrTvStatus.planned.apiValue, 1);
    expect(SeerrTvStatus.inProduction.apiValue, 2);
    expect(SeerrTvStatus.ended.apiValue, 3);
    expect(SeerrTvStatus.canceled.apiValue, 4);
    expect(SeerrTvStatus.pilot.apiValue, 5);

    final joined = {SeerrTvStatus.ended, SeerrTvStatus.canceled}
        .map((s) => s.apiValue)
        .join('|');
    expect(joined, '3|4');
  });

  test('release windows map to full year spans', () {
    expect(SeerrReleaseWindow.tens.dateGte, '2010-01-01');
    expect(SeerrReleaseWindow.tens.dateLte, '2019-12-31');
    // Open ended windows leave the unbounded side off entirely.
    expect(SeerrReleaseWindow.twenties.dateLte, isNull);
    expect(SeerrReleaseWindow.older.dateGte, isNull);
    expect(SeerrReleaseWindow.any.dateGte, isNull);
    expect(SeerrReleaseWindow.any.dateLte, isNull);
  });

  test('runtime windows are half open at the ends', () {
    expect(SeerrRuntimeFilter.underHalfHour.gte, isNull);
    expect(SeerrRuntimeFilter.underHalfHour.lte, 30);
    expect(SeerrRuntimeFilter.overTwoHours.gte, 120);
    expect(SeerrRuntimeFilter.overTwoHours.lte, isNull);
    expect(SeerrRuntimeFilter.any.gte, isNull);
    expect(SeerrRuntimeFilter.any.lte, isNull);
  });

  test('a fresh state reports no active discover filters', () {
    const state = SeerrBrowseState();
    expect(state.hasDiscoverFilters, isFalse);
    expect(
      state.copyWith(genreIds: {28}).hasDiscoverFilters,
      isTrue,
    );
    expect(
      state.copyWith(minRating: SeerrMinRating.seven).hasDiscoverFilters,
      isTrue,
    );
    expect(
      state.copyWith(released: SeerrReleaseWindow.nineties).hasDiscoverFilters,
      isTrue,
    );
  });
}
