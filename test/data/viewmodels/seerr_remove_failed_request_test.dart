import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/repositories/seerr_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/seerr/arr_queue.dart';
import 'package:moonfin/data/services/seerr/seerr_api_models.dart';
import 'package:moonfin/data/services/seerr/seerr_error.dart';
import 'package:moonfin/data/services/seerr/seerr_models.dart';
import 'package:moonfin/data/viewmodels/seerr_requests_view_model.dart';

class _FakeSync extends Fake implements PluginSyncService {
  @override
  bool get arrQueueAvailable => false;
}

SeerrRequest _failed(int id, {int status = SeerrRequest.statusFailed}) =>
    SeerrRequest(id: id, status: status, type: 'movie');

/// A Silo whose request list can be held mid-read. [readBeforeHold] says
/// whether a held read takes its page before or after it is let go.
class _FakeSilo extends Fake implements SeerrRepository {
  _FakeSilo(int count) : list = [for (var i = 1; i <= count; i++) _failed(i)];

  final List<SeerrRequest> list;
  final offsets = <int>[];
  Completer<void>? hold;
  bool readBeforeHold = false;
  // Holds the read at that offset, taking its page once let go.
  final holds = <int, Completer<void>>{};
  // Holds a removal's reply after Silo has already dropped the request.
  Completer<void>? removeHold;
  Object? removeError;
  Object? getRequestError;
  SeerrRequest? reread;

  List<SeerrRequest> _page(int offset, int limit) =>
      list.skip(offset).take(limit).toList();

  @override
  Future<void> ensureInitialized({bool force = false}) async {}

  @override
  Future<SeerrUser> getCurrentUser() async => SeerrUser(id: 1);

  @override
  Future<SeerrRequestListResponse> getRequests({
    String? filter,
    String? sort,
    int? requestedBy,
    int limit = 50,
    int offset = 0,
  }) async {
    offsets.add(offset);
    var page = readBeforeHold ? _page(offset, limit) : null;
    await hold?.future;
    await holds.remove(offset)?.future;
    page ??= _page(offset, limit);
    return SeerrRequestListResponse(results: page);
  }

  @override
  Future<void> removeFailedRequest(int requestId) async {
    if (removeError != null) throw removeError!;
    list.removeWhere((r) => r.id == requestId);
    await removeHold?.future;
  }

  @override
  Future<SeerrRequest> getRequest(int requestId) async {
    if (getRequestError != null) throw getRequestError!;
    return reread ?? list.firstWhere((r) => r.id == requestId);
  }

  @override
  Future<SeerrMediaSummary?> getMediaSummary(
    int tmdbId,
    String mediaType,
  ) async => null;

  @override
  Future<ArrQueue?> getArrQueue({int? tmdbId, int? tvdbId}) async => null;
}

List<int> _ids(SeerrRequestsViewModel vm) =>
    vm.state.requests.map((r) => r.id).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => GetIt.instance.registerSingleton<PluginSyncService>(_FakeSync()));
  tearDown(() => GetIt.instance.reset());

  test('a refresh read before a removal does not bring the card back',
      () async {
    final silo = _FakeSilo(3);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    silo
      ..hold = Completer<void>()
      ..readBeforeHold = true;
    final refreshing = vm.refresh();
    await pumpEventQueue();
    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.removed);

    silo.hold!.complete();
    await refreshing;
    expect(_ids(vm), [1, 3]);
    vm.dispose();
  });

  test('a page out during a removal is read again from the new offset',
      () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();
    expect(vm.state.requests, hasLength(20));

    silo.hold = Completer<void>();
    final loading = vm.loadMore();
    await pumpEventQueue();
    expect(await vm.removeFailedRequest(5), SeerrRemoveResult.removed);

    silo.hold!.complete();
    await loading;
    expect(silo.offsets, [0, 20, 19]);
    expect(_ids(vm), [for (var i = 1; i <= 25; i++) if (i != 5) i]);
    vm.dispose();
  });

  test('a removal Silo applied before its reply moves a page read meanwhile',
      () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    final read = silo.holds[20] = Completer<void>();
    final loading = vm.loadMore();
    await pumpEventQueue();
    silo.removeHold = Completer<void>();
    final removing = vm.removeFailedRequest(5);
    await pumpEventQueue();
    read.complete();
    await pumpEventQueue();
    silo.removeHold!.complete();
    expect(await removing, SeerrRemoveResult.removed);

    await loading;
    expect(silo.offsets, [0, 20, 19]);
    expect(_ids(vm), [for (var i = 1; i <= 25; i++) if (i != 5) i]);
    vm.dispose();
  });

  test('a removal during the page read again moves it once more', () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    final first = silo.holds[20] = Completer<void>();
    final again = silo.holds[19] = Completer<void>();
    final loading = vm.loadMore();
    await pumpEventQueue();
    expect(await vm.removeFailedRequest(5), SeerrRemoveResult.removed);
    first.complete();
    await pumpEventQueue();
    expect(await vm.removeFailedRequest(6), SeerrRemoveResult.removed);
    again.complete();

    await loading;
    expect(silo.offsets, [0, 20, 19, 18]);
    expect(_ids(vm), [
      for (var i = 1; i <= 25; i++)
        if (i != 5 && i != 6) i,
    ]);
    vm.dispose();
  });

  test('a page still moved by a removal after the last read is dropped',
      () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    final reads = [for (var k = 0; k < 6; k++) silo.holds[20 - k] = Completer<void>()];
    final loading = vm.loadMore();
    for (var k = 0; k < 6; k++) {
      await pumpEventQueue();
      expect(await vm.removeFailedRequest(5 + k), SeerrRemoveResult.removed);
      reads[k].complete();
    }

    await loading;
    expect(silo.offsets, [0, 20, 19, 18, 17, 16, 15]);
    expect(_ids(vm), [
      for (var i = 1; i <= 20; i++)
        if (i < 5 || i > 10) i,
    ]);
    expect(vm.state.isLoadingMore, isFalse);
    expect(vm.state.hasMore, isTrue);
    vm.dispose();
  });

  test('no page is read while a refresh is out', () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    silo.hold = Completer<void>();
    final refreshing = vm.refresh();
    await pumpEventQueue();
    await vm.loadMore();
    silo.hold!.complete();
    await refreshing;
    expect(silo.offsets, [0, 0]);
    expect(_ids(vm), [for (var i = 1; i <= 20; i++) i]);
    vm.dispose();
  });

  test('a full load forgets removed ids, which the web may reuse', () async {
    final silo = _FakeSilo(3);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();
    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.removed);

    // A rebuilt client gave another request the removed one's number.
    silo.list.insert(1, _failed(2));
    await vm.refresh();
    expect(_ids(vm), [1, 2, 3]);
    vm.dispose();
  });

  test('a refusal reads the request again and keeps the list', () async {
    final silo = _FakeSilo(3)
      ..removeError =
          const SeerrRequestException(SeerrRequestErrorKind.duplicate)
      ..reread = _failed(2, status: SeerrRequest.statusApproved);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.refused);
    expect(vm.state.requests[1].status, SeerrRequest.statusApproved);
    expect(vm.state.actioningRequestId, isNull);
    vm.dispose();
  });

  test('a refusal whose read fails keeps the list and says it failed',
      () async {
    final silo = _FakeSilo(3)
      ..removeError =
          const SeerrRequestException(SeerrRequestErrorKind.duplicate)
      ..getRequestError = Exception('offline');
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();
    final reads = silo.offsets.length;

    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.failed);
    expect(_ids(vm), [1, 2, 3]);
    expect(vm.state.error, isNull);
    expect(vm.state.actioningRequestId, isNull);
    expect(silo.offsets, hasLength(reads), reason: 'no full reload');
    vm.dispose();
  });
}
