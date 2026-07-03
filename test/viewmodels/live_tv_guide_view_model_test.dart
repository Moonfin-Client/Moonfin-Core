import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

Map<String, dynamic> _channel(String id) => {'Id': id, 'Name': 'Ch $id'};

void main() {
  late _MockClient client;
  late _MockLiveTvApi liveTv;

  setUp(() {
    client = _MockClient();
    liveTv = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTv);
    when(() => client.userId).thenReturn('user');
    when(
      () => liveTv.getGuide(
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        channelIds: any(named: 'channelIds'),
        fields: any(named: 'fields'),
        enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
        enableImages: any(named: 'enableImages'),
        enableUserData: any(named: 'enableUserData'),
        userId: any(named: 'userId'),
      ),
    ).thenAnswer((_) async => {'Items': <dynamic>[]});
  });

  test(
    'load() fetches only the first batch; loadMorePrograms() paginates the rest',
    () async {
      // 120 channels → batches of 50 (never one giant all-channels request).
      final channels = List.generate(120, (i) => _channel('c$i'));
      when(
        () => liveTv.getChannels(
          sortBy: any(named: 'sortBy'),
          sortOrder: any(named: 'sortOrder'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
          userId: any(named: 'userId'),
        ),
      ).thenAnswer((_) async => {'Items': channels});

      final vm = LiveTvGuideViewModel(client);
      await vm.load();

      // Initial load requested exactly one batch of 50 channels, not all 120.
      final captured = verify(
        () => liveTv.getGuide(
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          channelIds: captureAny(named: 'channelIds'),
          fields: any(named: 'fields'),
          enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
          enableImages: any(named: 'enableImages'),
          enableUserData: any(named: 'enableUserData'),
          userId: any(named: 'userId'),
        ),
      ).captured;
      expect(captured.length, 1);
      expect((captured.single as List).length, 50);
      expect(vm.programsHighWater, 50);
      expect(vm.hasMorePrograms, isTrue);

      await vm.loadMorePrograms();
      expect(vm.programsHighWater, 100);
      expect(vm.hasMorePrograms, isTrue);

      await vm.loadMorePrograms();
      expect(vm.programsHighWater, 120);
      expect(vm.hasMorePrograms, isFalse);

      // Further calls are no-ops once every channel has been requested.
      await vm.loadMorePrograms();
      expect(vm.programsHighWater, 120);
    },
  );
}
