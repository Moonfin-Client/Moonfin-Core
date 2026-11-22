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
    page ??= _page(offset, limit);
    return SeerrRequestListResponse(results: page);
  }

  @override
  Future<void> removeFailedRequest(int requestId) async {
    if (removeError != null) throw removeError!;
    list.removeWhere((r) => r.id == requestId);
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
