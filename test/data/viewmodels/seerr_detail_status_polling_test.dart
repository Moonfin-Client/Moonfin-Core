import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/viewmodels/seerr_media_detail_view_model.dart';
import 'package:moonfin/preference/seerr_preferences.dart';

/// A Seerr server whose answer for the title can be changed between ticks.
class _FakeSeerr extends Fake implements SeerrRepository {
  SeerrMediaInfo mediaInfo = const SeerrMediaInfo(status: 1);
  int detailFetches = 0;

  /// Holds a refetch in flight until it completes.
  Completer<void>? hold;

  SeerrMovieDetails get _details => SeerrMovieDetails(
    id: 299534,
    title: 'Avengers: Endgame',
    mediaInfo: mediaInfo,
  );

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<Map<String, dynamic>> getPublicSettings() async => const {};

  @override
  Future<SeerrUser> getCurrentUser() async => SeerrUser(id: 1);

  @override
  Future<(SeerrMovieDetails, bool)> getMovieDetailsWithWatchlist(
    int tmdbId,
  ) async => (_details, false);

  @override
  Future<SeerrMovieDetails> getMovieDetails(int tmdbId) async {
    detailFetches++;
    await hold?.future;
    return _details;
  }

  @override
  Future<SeerrRequest> createRequest({
    required int mediaId,
    required String mediaType,
    List<int>? seasons,
    bool allSeasons = false,
    bool is4k = false,
    int? profileId,
    String? rootFolder,
    int? serverId,
  }) async => const SeerrRequest(
    id: 1,
    status: SeerrRequest.statusApproved,
    type: 'movie',
    is4k: false,
  );
}

class _FakePrefs extends Fake implements SeerrPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the open page follows a request until the title lands', () {
    fakeAsync((async) {
      final seerr = _FakeSeerr();
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      vm.load('299534', 'movie');
      async.flushMicrotasks();

      seerr.mediaInfo = const SeerrMediaInfo(status: 3);
      vm.submitRequest();
      async.flushMicrotasks();
      expect(vm.state.hdDownload, isNull);

      seerr.mediaInfo = const SeerrMediaInfo(
        status: 3,
        downloadStatus: [SeerrDownloadingItem(size: 100, sizeLeft: 40)],
      );
      async.elapse(const Duration(seconds: 30));
      expect(vm.state.hdDownload?.percent, 60);

      // Radarr has imported it but Seerr hasn't seen it in the library yet.
      seerr.mediaInfo = const SeerrMediaInfo(status: 3);
      async.elapse(const Duration(seconds: 15));
      expect(vm.state.hdDownload, isNull);
      expect(vm.state.hd.isProcessing, isTrue);

      seerr.mediaInfo = const SeerrMediaInfo(status: 5);
      async.elapse(const Duration(seconds: 30));
      expect(vm.state.hd.isFullyAvailable, isTrue);

      final fetchesOnceAvailable = seerr.detailFetches;
      async.elapse(const Duration(minutes: 5));
      expect(seerr.detailFetches, fetchesOnceAvailable);

      vm.dispose();
    });
  });

  test('a refetch that lands after the page closes starts nothing', () {
    fakeAsync((async) {
      final seerr = _FakeSeerr()..mediaInfo = const SeerrMediaInfo(status: 3);
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      vm.load('299534', 'movie');
      async.flushMicrotasks();

      final held = Completer<void>();
      seerr.hold = held;
      async.elapse(const Duration(seconds: 30));
      vm.dispose();
      seerr.mediaInfo = const SeerrMediaInfo(
        status: 3,
        downloadStatus: [SeerrDownloadingItem(size: 100, sizeLeft: 40)],
      );
      held.complete();
      async.flushMicrotasks();

      final fetchesAtClose = seerr.detailFetches;
      async.elapse(const Duration(minutes: 2));
      expect(seerr.detailFetches, fetchesAtClose);
    });
  });

  test('an available title never starts polling', () {
    fakeAsync((async) {
      final seerr = _FakeSeerr()..mediaInfo = const SeerrMediaInfo(status: 5);
      final vm = SeerrMediaDetailViewModel(seerr, _FakePrefs());
      vm.load('299534', 'movie');
      async.elapse(const Duration(minutes: 2));

      expect(seerr.detailFetches, 0);
      vm.dispose();
    });
  });
}
