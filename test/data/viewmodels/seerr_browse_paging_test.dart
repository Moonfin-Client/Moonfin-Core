import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_browse_view_model.dart';

/// Serves 20 movies a page and, like TMDB, refuses any page past 500 even
/// though it reports more.
class _Repo implements SeerrRepository {
  _Repo({this.available = const {}, this.failFrom});

  final Set<int> available;
  final int? failFrom;
  final requested = <int>[];

  /// While set, pages from 7 on wait for it.
  Completer<void>? hold;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    switch (invocation.memberName) {
      case #ensureInitialized:
        return Future<void>.value();
      case #discoverMovies:
        return _page(invocation.namedArguments[#page] as int);
      default:
        return Future<Never>.error(
          UnsupportedError('${invocation.memberName}'),
        );
    }
  }

  Future<SeerrDiscoverPage> _page(int page) async {
    requested.add(page);
    if (page >= 7) await hold?.future;
    if (page > 500 || (failFrom != null && page >= failFrom!)) {
      throw StateError('page $page');
    }
    return SeerrDiscoverPage(
      page: page,
      totalPages: 1000,
      results: [
        for (var id = page * 100; id < page * 100 + 20; id++)
          SeerrDiscoverItem(
            id: id,
            mediaType: 'movie',
            title: 'Movie $id',
            mediaInfo: available.contains(id)
                ? const SeerrMediaInfo(status: SeerrMediaStatus.available)
                : null,
          ),
      ],
    );
  }
}

void main() {
  test('an Available filter that runs dry stops paging', () async {
    final repo = _Repo(available: {101});
    final vm = SeerrBrowseViewModel(repo, mediaType: 'movie');
    vm.setFilter(SeerrBrowseFilter.available);
    await pumpEventQueue();

    await vm.loadMore();
    await vm.loadMore();

    expect(vm.state.items.map((i) => i.id), [101]);
    expect(vm.state.canLoadMore, isFalse);
    expect(repo.requested, [for (var p = 1; p <= 12; p++) p]);
  });

  test('paging stops at the last page TMDB serves', () async {
    final repo = _Repo();
    final vm = SeerrBrowseViewModel(repo, mediaType: 'movie');
    await vm.load();

    for (var i = 0; i < 600 && vm.state.canLoadMore; i++) {
      await vm.loadMore();
    }

    expect(repo.requested.last, 500);
    expect(vm.state.canLoadMore, isFalse);
    expect(vm.state.items, hasLength(500 * 20));
  });

  test(
    'a page that fails ends paging instead of being asked for again',
    () async {
      final repo = _Repo(failFrom: 2);
      final vm = SeerrBrowseViewModel(repo, mediaType: 'movie');
      await vm.load();

      await vm.loadMore();
      await vm.loadMore();

      expect(repo.requested, [1, 2]);
      expect(vm.state.items, hasLength(20));
      expect(vm.state.isLoadingMore, isFalse);
    },
  );

  test(
    'switching back to All drops the scan still reading for Available',
    () async {
      final repo = _Repo(available: {101});
      final vm = SeerrBrowseViewModel(repo, mediaType: 'movie');
      vm.setFilter(SeerrBrowseFilter.available);
      await pumpEventQueue();

      repo.hold = Completer();
      final stale = vm.loadMore();
      await pumpEventQueue();
      vm.setFilter(SeerrBrowseFilter.all);
      await pumpEventQueue();
      repo.hold!.complete();
      await stale;

      expect(vm.state.items.map((i) => i.id), [
        for (var id = 100; id < 120; id++) id,
      ]);
      expect(vm.state.currentPage, 1);
      expect(vm.state.isLoadingMore, isFalse);
      expect(repo.requested.where((p) => p > 7), isEmpty);
    },
  );
}
