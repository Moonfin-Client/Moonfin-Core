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

class _FakeSilo extends Fake implements SeerrRepository {
  _FakeSilo(int count) : list = [for (var i = 1; i <= count; i++) _failed(i)];

  final List<SeerrRequest> list;
  final offsets = <int>[];
  Object? removeError;
  SeerrRequest? reread;

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
    return SeerrRequestListResponse(
      results: list.skip(offset).take(limit).toList(),
    );
  }

  @override
  Future<void> removeFailedRequest(int requestId) async {
    if (removeError != null) throw removeError!;
    list.removeWhere((r) => r.id == requestId);
  }

  @override
  Future<SeerrRequest> getRequest(int requestId) async =>
      reread ?? list.firstWhere((r) => r.id == requestId);

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

  test('a removal drops the card and the next page starts after it', () async {
    final silo = _FakeSilo(25);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    expect(await vm.removeFailedRequest(5), SeerrRemoveResult.removed);
    expect(vm.state.actioningRequestId, isNull);
    await vm.loadMore();

    expect(silo.offsets, [0, 19]);
    expect(_ids(vm), [for (var i = 1; i <= 25; i++) if (i != 5) i]);
    vm.dispose();
  });

  test('a refusal reads the request again and keeps the card', () async {
    final silo = _FakeSilo(3)
      ..removeError =
          const SeerrRequestException(SeerrRequestErrorKind.duplicate)
      ..reread = _failed(2, status: SeerrRequest.statusApproved);
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.refused);
    expect(_ids(vm), [1, 2, 3]);
    expect(vm.state.requests[1].status, SeerrRequest.statusApproved);
    expect(vm.state.actioningRequestId, isNull);
    vm.dispose();
  });

  test('any other error leaves the card as it was', () async {
    final silo = _FakeSilo(3)..removeError = Exception('offline');
    final vm = SeerrRequestsViewModel(silo);
    await vm.load();

    expect(await vm.removeFailedRequest(2), SeerrRemoveResult.failed);
    expect(_ids(vm), [1, 2, 3]);
    expect(vm.state.actioningRequestId, isNull);
    vm.dispose();
  });
}
