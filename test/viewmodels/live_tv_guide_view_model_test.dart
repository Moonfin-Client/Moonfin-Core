import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:server_core/server_core.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

Map<String, dynamic> _channel(String id) => {'Id': id, 'Name': 'Ch $id'};

GuideProgram _program(Map<String, dynamic> raw) => GuideProgram.fromRawItem(
      raw,
      channelId: 'c1',
      startDate: DateTime(2026, 8, 5, 20),
      endDate: DateTime(2026, 8, 5, 21),
    );

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

  // Guide providers are patchy about which of ParentIndexNumber and
  // IndexNumber they fill in, so every combination has to read well.
  group('episodeLabel', () {
    test('puts the season and episode ahead of the title', () {
      final program = _program({
        'Name': 'Blue Bloods',
        'EpisodeTitle': 'The Poor Door',
        'ParentIndexNumber': 5,
        'IndexNumber': 9,
      });

      expect(program.seasonNumber, 5);
      expect(program.episodeNumber, 9);
      expect(program.episodeLabel, 'S5:E9 - The Poor Door');
    });

    test('numbers the episode on its own when the season is missing', () {
      expect(
        _program({'EpisodeTitle': 'The Poor Door', 'IndexNumber': 9})
            .episodeLabel,
        '9. The Poor Door',
      );
    });

    test('spans a listing that runs several episodes', () {
      expect(
        _program({
          'EpisodeTitle': 'Marathon',
          'ParentIndexNumber': 5,
          'IndexNumber': 9,
          'IndexNumberEnd': 12,
        }).episodeLabel,
        'S5:E9-12 - Marathon',
      );
    });

    test('drops to the numbers alone when the listing has no title', () {
      expect(
        _program({
          'Name': 'Blue Bloods',
          'ParentIndexNumber': 5,
          'IndexNumber': 9,
        }).episodeLabel,
        'S5:E9',
      );
    });

    test('leaves a titled listing with no numbers as it was', () {
      expect(
        _program({'Name': 'Blue Bloods', 'EpisodeTitle': 'The Poor Door'})
            .episodeLabel,
        'The Poor Door',
      );
    });

    test('has no line at all for a listing with neither', () {
      expect(_program({'Name': 'The Six O Clock News'}).episodeLabel, isNull);
      expect(_program({'EpisodeTitle': '  '}).episodeLabel, isNull);
    });

    test('reads numbers a server sent as decimals', () {
      expect(
        _program({
          'EpisodeTitle': 'The Poor Door',
          'ParentIndexNumber': 5.0,
          'IndexNumber': 9.0,
        }).episodeLabel,
        'S5:E9 - The Poor Door',
      );
    });
  });
}
