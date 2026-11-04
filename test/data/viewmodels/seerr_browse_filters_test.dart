import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_browse_view_model.dart';

/// Answers the calls a browse load makes and keeps the discover ones.
class _Repo implements SeerrRepository {
  final discovers = <Invocation>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    switch (invocation.memberName) {
      case #ensureInitialized:
        return Future<void>.value();
      case #discoverMovies:
      case #discoverTv:
        discovers.add(invocation);
        return Future.value(const SeerrDiscoverPage());
      default:
        return Future<Never>.error(UnsupportedError('${invocation.memberName}'));
    }
  }
}

void main() {
  test('switching to movies keeps the sort by name and drops series statuses', () async {
    final repo = _Repo();
    final vm = SeerrBrowseViewModel(
      repo,
      filterId: '18',
      mediaType: 'tv',
      filterType: 'genre',
    );
    vm.setSortBy(const SeerrSortOption('Title', 'name.desc'));
    vm.toggleTvStatus(SeerrTvStatus.ended);
    vm.toggleGenre(35);

    vm.setMediaType('movie');
    await Future<void>.delayed(Duration.zero);

    expect(vm.mediaType, 'movie');
    expect(vm.state.sortBy.value, 'original_title.desc');
    expect(vm.state.tvStatuses, isEmpty);
    expect(vm.state.genreIds, isEmpty);
    expect(repo.discovers.last.memberName, #discoverMovies);
    expect(repo.discovers.last.namedArguments[#sortBy], 'original_title.desc');
    expect(repo.discovers.last.namedArguments[#genre], '18');
  });

  test('a sort only movies have falls back to the first series sort', () async {
    final repo = _Repo();
    final vm = SeerrBrowseViewModel(repo, mediaType: 'movie', filterType: 'keyword');
    vm.setSortBy(const SeerrSortOption('Revenue', 'revenue.desc'));

    vm.setMediaType('tv');
    await Future<void>.delayed(Duration.zero);

    expect(vm.state.sortBy.value, 'popularity.desc');
    expect(repo.discovers.last.memberName, #discoverTv);
  });

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
