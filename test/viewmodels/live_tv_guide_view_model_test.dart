import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/services/user_data_sync.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/preference/preference_constants.dart';

import 'package:server_core/server_core.dart';
import 'package:server_emby/server_emby.dart';
import 'package:server_jellyfin/server_jellyfin.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _GroupedLiveTvApi extends _MockLiveTvApi implements ChannelGroupApi {}

class _MockUserLibraryApi extends Mock implements UserLibraryApi {}

Map<String, dynamic> _channel(String id, {String? number}) => {
  'Id': id,
  'Name': 'Ch $id',
  'ChannelNumber': ?number,
};

Map<String, dynamic> _program(
  String id,
  String channelId, {
  DateTime? start,
  bool isSports = false,
  bool isKids = false,
  bool isPremiere = false,
}) {
  final programStart = start ?? DateTime.parse('2026-09-11T10:00:00Z');
  return {
    'Id': id,
    'ChannelId': channelId,
    'Name': id,
    'StartDate': programStart.toIso8601String(),
    'EndDate': programStart.add(const Duration(minutes: 30)).toIso8601String(),
    'IsSports': isSports,
    'IsKids': isKids,
    'IsPremiere': isPremiere,
  };
}

Map<String, dynamic> _span(
  String id,
  String channelId,
  DateTime start,
  DateTime end,
) => {
  'Id': id,
  'ChannelId': channelId,
  'Name': id,
  'StartDate': start.toIso8601String(),
  'EndDate': end.toIso8601String(),
};

List<String> _requestedIds(Invocation inv) =>
    (inv.namedArguments[#channelIds] as List<String>?) ?? const [];

Future<Map<String, dynamic>> Function(Invocation) _serverFiltered(
  bool Function(String id) isSports,
) =>
    (inv) async => {
      'Items': [
        for (final id in _requestedIds(inv))
          if (isSports(id)) _program('p-$id', id, isSports: true),
      ],
    };

Future<Map<String, dynamic>> _guide(
  LiveTvApi api, {
  GuideFilter? category,
  bool captureChannelIds = false,
  DateTime? start,
}) {
  bool? flag(GuideFilter f, String name) =>
      category == null ? any(named: name) : (category == f ? true : null);
  return api.getGuide(
    startDate: start ?? any(named: 'startDate'),
    endDate: any(named: 'endDate'),
    channelIds: captureChannelIds
        ? captureAny(named: 'channelIds')
        : any(named: 'channelIds'),
    isMovie: flag(GuideFilter.movies, 'isMovie'),
    isSeries: flag(GuideFilter.series, 'isSeries'),
    isSports: flag(GuideFilter.sports, 'isSports'),
    isNews: flag(GuideFilter.news, 'isNews'),
    isKids: flag(GuideFilter.kids, 'isKids'),
    fields: any(named: 'fields'),
    enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
    enableImages: any(named: 'enableImages'),
    enableUserData: any(named: 'enableUserData'),
    userId: any(named: 'userId'),
  );
}

Future<Map<String, dynamic>> _channelsRequest(LiveTvApi api) => api.getChannels(
  sortBy: any(named: 'sortBy'),
  sortOrder: any(named: 'sortOrder'),
  fields: any(named: 'fields'),
  enableTotalRecordCount: any(named: 'enableTotalRecordCount'),
  userId: any(named: 'userId'),
);

void _stubChannels(LiveTvApi api, List<Map<String, dynamic>> channels) {
  when(() => _channelsRequest(api))
      .thenAnswer((_) async => {'Items': channels});
}

void main() {
  late _MockClient client;
  late _MockLiveTvApi liveTv;

  setUp(() {
    userDataSync.reset();
    client = _MockClient();
    when(() => client.baseUrl).thenReturn('https://guide.test');
    liveTv = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTv);
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.userId).thenReturn('user');
    when(() => _guide(liveTv)).thenAnswer((_) async => {'Items': <dynamic>[]});
  });

  void stubNumberedChannels(int count) =>
      _stubChannels(liveTv, [for (var i = 0; i < count; i++) _channel('c$i', number: '$i')]);

  Completer<Map<String, dynamic>> pendingGuide(GuideFilter filter) {
    final response = Completer<Map<String, dynamic>>();
    when(() => _guide(liveTv, category: filter)).thenAnswer((_) => response.future);
    return response;
  }

  Future<LiveTvGuideViewModel> loadFilter(GuideFilter filter, {DateTime? start}) async {
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    await vm.load(windowStart: start);
    vm.setFilter(filter);
    await pumpEventQueue();
    return vm;
  }

  for (final type in [ServerType.emby, ServerType.jellyfin]) {
    test('${type.name} guide accepts good rows and drops malformed optional fields', () async {
      final jellyfin = type == ServerType.jellyfin;
      final groups = jellyfin ? 'groups' : 'Tags';
      final rows = [
        {..._channel('sports', number: '2'), groups: ['Sports'], 'ImageTags': {'Primary': 'logo', 'Thumb': 'thumb'},
          'UserData': {'IsFavorite': true}},
        {..._channel('news'), groups: ['Local'], 'ImageTags': {'Primary': 123, 'Thumb': 'news-thumb'},
          'UserData': [], 'ChannelNumber': 3},
        {..._channel('weather'), groups: [], 'ImageTags': [], 'UserData': {'IsFavorite': 'yes', 'Played': true}},
        if (!jellyfin) {'Id': 'invalid', 'Name': 123},
      ];
      final channelPath = jellyfin ? '/Moonfin/LiveTv/ChannelGroups' : '/LiveTv/Channels';
      var reads = 0;
      final transport = InterceptorsWrapper(onRequest: (request, handler) {
        final isLineup = request.path == channelPath;
        if (isLineup) reads++;
        final data = isLineup && jellyfin
            ? {'supported': true, 'channels': rows}
            : {'Items': isLineup ? rows : []};
        handler.resolve(Response(requestOptions: request, statusCode: 200, data: data));
      });
      final dio = Dio(BaseOptions(baseUrl: 'https://guide.test'))..interceptors.add(transport);
      when(() => client.serverType).thenReturn(type);
      when(() => client.liveTvApi).thenReturn(jellyfin
          ? JellyfinMediaServerClient(baseUrl: 'https://guide.test', interceptors: [transport],
              deviceInfo: const DeviceInfo(id: 'test', name: 'Test', appName: 'Moonfin', appVersion: '1')).liveTvApi
          : EmbyLiveTvApi(dio));
      final vm = LiveTvGuideViewModel(client);
      addTearDown(vm.dispose);
      await vm.load();
      final channels = {for (final c in vm.playbackChannels) c.id: c};
      expect(vm.state, GuideState.ready);
      expect(reads, 1);
      expect(vm.filters, GuideFilter.values);
      expect(channels.keys, unorderedEquals(['sports', 'news', 'weather']));
      expect(vm.availableGroups, ['Local', 'Sports']);
      expect(channels['sports']!.number, '2');
      expect(channels['sports']!.isFavorite, isTrue);
      expect(channels['sports']!.imageTag, 'logo');
      expect(channels['sports']!.rawData['ImageTags'], {'Primary': 'logo', 'Thumb': 'thumb'});
      expect(channels['news']!.imageTag, isNull);
      expect(channels['news']!.rawData.containsKey('UserData'), isFalse);
      expect(channels['weather']!.imageTag, isNull);
      expect(channels['weather']!.isFavorite, isFalse);
      if (jellyfin) {
        expect(channels['news']!.rawData['ImageTags'], {'Thumb': 'news-thumb'});
        expect(channels['weather']!.rawData['UserData'], {'Played': true});
      } else {
        expect(channels['news']!.number, isNull);
      }
    });
  }

  group('group membership on guide reload', () {
    late _GroupedLiveTvApi api;
    late LiveTvGuideViewModel vm;
    setUp(() {
      api = _GroupedLiveTvApi();
      when(() => client.liveTvApi).thenReturn(api);
      when(() => client.baseUrl).thenReturn('fixture');
      when(() => _guide(api)).thenAnswer((_) async => {'Items': []});
      vm = LiveTvGuideViewModel(client);
      addTearDown(vm.dispose);
    });
    for (final selected in ChannelGroupSource.values) {
      test('keeps ${selected.name} during a DVR outage and clears it after removal', () async {
        final dvr = ChannelGroupSource.dvr.groupId;
        final free = ChannelGroupSource.plexFreeTv.groupId;
        when(() => client.serverType).thenReturn(ServerType.plex);
        var lineup = ChannelGroupLineup(
          {'one': {dvr}, 'two': {free, 'Sports', 'Comedy'}}, channels: [_channel('one'), _channel('two')],
          sources: ChannelGroupSource.values,
          promoted: PromotedChannelGroup('Featured', () async => {'two'}),
        );
        when(() => api.getChannelGroups(userId: 'user')).thenAnswer((_) async => lineup);
        await vm.load();
        expect(vm.availableGroups, [dvr, free, 'Featured', 'Comedy', 'Sports']);
        expect(vm.filters, isNot(contains(anyOf(GuideFilter.sports, GuideFilter.kids, GuideFilter.news))));
        vm.setGroup(selected.groupId);
        lineup = ChannelGroupLineup(
          {'two': {free, 'News'}}, channels: [_channel('two')], sources: ChannelGroupSource.values,
          partial: true, unresolvedChannelIds: const {},
        );
        await vm.load();
        expect(vm.selectedGroup, selected.groupId);
        expect(vm.filteredChannels.map((row) => row.id),
            selected == ChannelGroupSource.dvr ? isEmpty : ['two']);
        lineup = ChannelGroupLineup(
          {}, channels: [_channel('two')], partial: true, unresolvedChannelIds: const {'two'},
        );
        await vm.load();
        expect(vm.selectedGroup, isNull);
        expect(vm.availableGroups, ['News']);
      });
    }

    test('Next follows a Featured lineup change while listings are pending', () async {
      var featured = 'one';
      when(() => client.serverType).thenReturn(ServerType.plex);
      when(() => api.getChannelGroups(userId: 'user')).thenAnswer(
        (_) async => ChannelGroupLineup(
          {},
          channels: [_channel('one'), _channel('two')],
          promoted: PromotedChannelGroup('Featured', () async => {featured}),
        ),
      );
      await vm.load();
      vm.setGroup('Featured');
      await pumpEventQueue();
      expect(vm.filteredChannels.single.id, 'one');

      final next = vm.windowEnd;
      final oldReply = Completer<Map<String, dynamic>>();
      final requests = <String>[];
      when(() => _guide(api)).thenAnswer((inv) async {
        final id = _requestedIds(inv).single;
        requests.add(id);
        if (id == 'one') return oldReply.future;
        final start = inv.namedArguments[#startDate] as DateTime;
        return {'Items': [_program('new', id, start: start)]};
      });
      final move = vm.setWindowStart(next, paging: true);
      await pumpEventQueue();
      expect(requests, ['one']);

      featured = 'two';
      await vm.refreshPromotedGroup(force: true);
      oldReply.complete({'FailedChannelIds': ['one']});

      expect(await move, isTrue);
      expect(requests, ['one', 'two']);
      expect(vm.windowStart, next);
      expect(vm.programsForChannel('two').single.startDate, next);
    });

    test('missing group metadata restores program categories', () async {
      _stubChannels(api, [_channel('one')]);
      when(() => api.getChannelGroups(userId: 'user')).thenThrow(
        TimeoutException('group metadata unavailable'),
      );
      await vm.load();
      expect(vm.availableProgrammeCategories, contains(GuideFilter.sports));
      expect(vm.playbackChannels.single.id, 'one');
    });
  });

  test('channel groups page by channel and keep every programme', () async {
    final grouped = _GroupedLiveTvApi();
    when(() => client.liveTvApi).thenReturn(grouped);
    when(() => client.baseUrl).thenReturn('fixture');
    final channels = [
      for (var i = 0; i < 200; i++) _channel('c$i', number: '$i'),
    ];
    _stubChannels(grouped, channels);
    when(() => grouped.getChannelGroups(userId: 'user')).thenAnswer(
      (_) async => ChannelGroupLineup({
        for (var i = 100; i < 162; i++) 'c$i': {'US| SPORTS', 'Kids'},
        'invisible': {'private group'},
      }),
    );
    final pages = <List<String>>[];
    when(() => _guide(grouped)).thenAnswer((inv) async {
      final ids = _requestedIds(inv);
      pages.add(ids);
      return {
        'Items': [
          for (final id in ids) ...[
            _program('news-$id', id),
            _program('sport-$id', id, isSports: true),
          ],
        ],
      };
    });
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    await vm.load();
    expect(vm.availableGroups, ['Kids', 'US| SPORTS']);
    vm.setGroup('US| SPORTS');
    await Future<void>.delayed(Duration.zero);
    expect(
      vm.filteredChannels.map((c) => c.id),
      channels.skip(100).take(62).map((c) => c['Id']),
    );
    expect(vm.programsForChannel('c100').map((p) => p.name), [
      'news-c100',
      'sport-c100',
    ]);
    expect(vm.programsHighWater, 50);
    await vm.loadMorePrograms();
    expect(vm.hasMorePrograms, false);
    expect(pages.map((p) => p.length), [50, 50, 12]);
    expect(pages.last.first, 'c150');
  });
  test('load() fetches only the first batch; loadMorePrograms() paginates the rest', () async {
    // 120 channels → batches of 50 (never one giant all-channels request).
    final channels = List.generate(120, (i) => _channel('c$i'));
    _stubChannels(liveTv, channels);

    final vm = LiveTvGuideViewModel(client);
    await vm.load();

    // Initial load requested exactly one batch of 50 channels, not all 120.
    final captured = verify(() => _guide(liveTv, category: GuideFilter.all, captureChannelIds: true)).captured;
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
  });

  test('a stale response for a superseded window is discarded', () async {
    final vm = LiveTvGuideViewModel(client);
    final early = DateTime(2026, 9, 9, 20);
    final later = early.add(const Duration(hours: 3));
    _stubChannels(liveTv, List.generate(51, (i) => _channel('c$i')));
    await vm.load(windowStart: early);
    await vm.loadMorePrograms();
    clearInteractions(liveTv);

    final oldBatch = Completer<Map<String, dynamic>>();
    when(() => _guide(liveTv)).thenAnswer((_) => oldBatch.future);
    final superseded = vm.recordingChanged();
    await pumpEventQueue();
    final oldRequests =
        verify(() => _guide(liveTv, captureChannelIds: true)).captured;
    expect(oldRequests, hasLength(1));
    expect(oldRequests.single as List<String>, containsAll(['c0', 'c49']));
    when(() => _guide(liveTv)).thenAnswer((_) async => {'Items': []});
    expect(await vm.setWindowStart(later, paging: true), isTrue);
    clearInteractions(liveTv);
    // The first window's reply lands last and must not overwrite the second.
    oldBatch.complete({
      'Items': [_program('stale', 'c1', start: early)],
    });
    await superseded;
    verifyNever(() => _guide(liveTv));

    expect(vm.programsForChannel('c1'), isEmpty);
  });

  test('paging during an outage keeps the old window until at least one batch recovers', () async {
    stubNumberedChannels(120);
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    final start = DateTime.utc(2026, 9, 11, 10);
    await vm.load(windowStart: start);
    while (vm.hasMorePrograms) { await vm.loadMorePrograms(); }
    final next = vm.windowEnd;
    var offline = true;
    when(() => _guide(liveTv)).thenAnswer((inv) async {
      final ids = _requestedIds(inv);
      if (offline || ids.contains('c50')) throw TimeoutException('tuner offline');
      return {'Items': [for (final id in ids) _program('next-$id', id, start: next)]};
    });
    final revision = vm.failedWindowMoveRevision;
    expect(await vm.setWindowStart(next), isFalse);
    expect(vm.windowStart, start);
    expect(vm.failedWindowMoveRevision, revision + 1);
    offline = false;
    expect(await vm.setWindowStart(next), isTrue);
    expect(vm.windowStart, next);
    expect(vm.programsForChannel('c0').single.id, 'next-c0');
    expect(vm.hasProgramsFor('c50'), isFalse);
    expect(vm.programsForChannel('c100').single.id, 'next-c100');
  });

  test('a stale lazy batch cannot merge into a reloaded window', () async {
    _stubChannels(liveTv, [_channel('c1')]);
    final pending = <Completer<Map<String, dynamic>>>[];
    when(() => _guide(liveTv, category: GuideFilter.all)).thenAnswer((_) {
      final completer = Completer<Map<String, dynamic>>();
      pending.add(completer);
      return completer.future;
    });

    final vm = LiveTvGuideViewModel(client);
    final early = DateTime(2026, 9, 9, 20);
    final later = early.add(const Duration(hours: 3));
    final superseded = vm.load(windowStart: early);
    await pumpEventQueue();
    final current = vm.load(windowStart: later);
    await pumpEventQueue();

    expect(pending, hasLength(2));
    pending[1].complete({
      'Items': [_program('current', 'c1', start: later)],
    });
    await current;
    pending[0].complete({
      'Items': [_program('stale', 'c1', start: early)],
    });
    await superseded;

    expect(vm.programsForChannel('c1').map((p) => p.id), ['current']);
    expect(vm.programsHighWater, 1);
  });

  test('targeted replacement leaves unrelated channels untouched', () async {
    _stubChannels(liveTv, [_channel('c0'), _channel('c1')]);

    final start = DateTime(2026, 9, 9, 20);
    void stubGuide(String prefix) {
      when(() => _guide(liveTv, category: GuideFilter.all)).thenAnswer((invocation) async {
        final ids = invocation.namedArguments[#channelIds] as List<String>;
        return {
          'Items': [
            for (final id in ids) _program('$prefix-$id', id, start: start),
          ],
        };
      });
    }

    stubGuide('old');
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    expect(vm.programsForChannel('c0').single.id, 'old-c0');

    stubGuide('new');
    await vm.replacePrograms(
      channelIds: const ['c1'],
      from: start,
      to: start.add(const Duration(hours: 3)),
    );

    expect(vm.programsForChannel('c0').single.id, 'old-c0');
    expect(vm.programsForChannel('c1').single.id, 'new-c1');
    expect(vm.state, GuideState.ready);
  });

  test('a targeted initial load requests only the named channels', () async {
    final channels = List.generate(120, (i) => _channel('c$i'));
    _stubChannels(liveTv, channels);

    final vm = LiveTvGuideViewModel(client);
    await vm.load(initialChannelIds: const ['c7', 'c9']);

    final captured = verify(() => _guide(liveTv, category: GuideFilter.all, captureChannelIds: true)).captured;
    expect(captured.length, 1);
    expect(captured.single, ['c7', 'c9']);
    // The ordered scroll prefix is untouched by a targeted open.
    expect(vm.programsHighWater, 0);
  });

  test(
    'moving the window replaces loaded rows without a loading state',
    () async {
      _stubChannels(liveTv, [_channel('c0')]);

      final firstStart = DateTime(2026, 9, 9, 20);
      final secondStart = firstStart.add(const Duration(minutes: 30));
      final replacement = Completer<Map<String, dynamic>>();
      var call = 0;
      when(() => _guide(liveTv, category: GuideFilter.all)).thenAnswer((_) {
        call++;
        if (call == 1) {
          return Future.value({
            'Items': [_program('old', 'c0', start: firstStart)],
          });
        }
        return replacement.future;
      });

      final vm = LiveTvGuideViewModel(client);
      await vm.load(windowStart: firstStart);
      final moving = vm.setWindowStart(secondStart);
      await pumpEventQueue();

      expect(vm.state, GuideState.ready);
      expect(vm.windowStart, firstStart);
      expect(vm.programsForChannel('c0').single.id, 'old');

      replacement.complete({
        'Items': [_program('new', 'c0', start: secondStart)],
      });
      expect(await moving, isTrue);
      expect(vm.windowStart, secondStart);
      expect(vm.programsForChannel('c0').single.id, 'new');

      when(() => _guide(liveTv)).thenThrow(Exception('offline'));
      await expectLater(vm.setWindowStart(firstStart), throwsException);
      expect(vm.windowStart, secondStart);
      expect(vm.programsForChannel('c0').single.id, 'new');
    },
  );

  test('leaving the guide stops carousel refresh requests', () async {
    stubNumberedChannels(1);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    vm.dispose();
    clearInteractions(liveTv);
    await vm.refreshCarouselPrograms();
    verifyNever(() => _guide(liveTv));
  });

  group('program-end boundary refresh', () {
    final base = DateTime.now();
    late DateTime clock;
    late LiveTvGuideViewModel vm;
    late List<Map<String, dynamic>> items;
    late List<DateTime> requestedFrom;
    late List<DateTime> requestedTo;
    late List<List<String>> requestedChannelIds;
    late bool guideThrows;

    DateTime at(int minutes) => base.add(Duration(minutes: minutes));

    setUp(() {
      clock = base;
      vm = LiveTvGuideViewModel(client, now: () => clock);
      guideThrows = false;
      items = <Map<String, dynamic>>[];
      requestedFrom = <DateTime>[];
      requestedTo = <DateTime>[];
      requestedChannelIds = <List<String>>[];

      _stubChannels(liveTv, [_channel('c0')]);

      when(() => _guide(liveTv, category: GuideFilter.all)).thenAnswer((invocation) async {
        requestedFrom.add(invocation.namedArguments[#startDate] as DateTime);
        requestedTo.add(invocation.namedArguments[#endDate] as DateTime);
        requestedChannelIds.add(_requestedIds(invocation));
        if (guideThrows) throw StateError('guide unavailable');
        return {'Items': List<Map<String, dynamic>>.from(items)};
      });
    });

    tearDown(() => vm.dispose());

    // A retained ended program plus one airing program. The schedule stops at
    // at(30), so a refresh past that boundary genuinely needs extending.
    void seedLapsingSchedule() {
      items = [
        _span('ended', 'c0', at(-90), at(-60)),
        _span('airing', 'c0', at(-60), at(30)),
      ];
    }

    test('an ended showing stays in the guide while a missing next listing gets a delayed retry', () async {
      seedLapsingSchedule();
      await vm.load();
      vm.scheduleBoundaryRefresh();
      expect(vm.boundaryDueAt, at(30));
      clock = at(31);
      await vm.handleBoundaryElapsed();
      await pumpEventQueue();
      expect(requestedFrom, hasLength(2));
      expect(vm.programsForChannel('c0').map((p) => p.id), ['ended', 'airing']);
      expect(vm.nextBoundaryAt, isNull);
      expect(vm.boundaryDueAt, clock.add(LiveTvGuideViewModel.noNewCoverageRetry));
    });

    test('a cached future start promotes while browsing ahead', () async {
      items = [_span('upcoming', 'c0', at(30), at(60))];
      await vm.load(windowStart: at(90), livePosition: false);
      vm.scheduleBoundaryRefresh();
      expect(vm.boundaryDueAt, at(30));
      clock = at(31);
      await vm.handleBoundaryElapsed();
      expect(requestedFrom, hasLength(1));
      expect(vm.boundaryDueAt, at(60));
    });

    test('a cached next program promotes with no request', () async {
      items = [
        _span('ended', 'c0', at(-90), at(-60)),
        _span('airing', 'c0', at(-60), at(30)),
        _span('next', 'c0', at(30), at(90)),
      ];

      await vm.load();
      vm.scheduleBoundaryRefresh();
      expect(requestedFrom, hasLength(1));

      clock = at(31);
      await vm.handleBoundaryElapsed();

      expect(requestedFrom, hasLength(1));
      expect(vm.boundaryDueAt, at(90));
    });

    test(
      'boundary refresh preserves the viewport and covers live horizon',
      () async {
        seedLapsingSchedule();

        await vm.load(windowStart: at(-360));
        vm.scheduleBoundaryRefresh();

        clock = at(31);
        items = [...items, _span('next', 'c0', at(30), at(200))];
        await vm.handleBoundaryElapsed();

        expect(requestedFrom.last, vm.windowStart);
        expect(
          requestedTo.last,
          at(31).add(LiveTvGuideViewModel.rollingRefreshHorizon),
        );
        expect(vm.boundaryDueAt, at(200));
      },
    );

    test(
      'rolling refresh reanchors beyond cached coverage in one bounded window',
      () async {
        _stubChannels(liveTv, [_channel('c0'), _channel('c1')]);
        items = [
          _span('old-0', 'c0', at(-60), at(30)),
          _span('old-1', 'c1', at(-60), at(30)),
        ];

        await vm.load();

        // The cache ends before the current clock. Staleness is coverage-based.
        clock = at(45);
        items = [
          _span('new-0', 'c0', at(35), at(90)),
          _span('new-1', 'c1', at(35), at(90)),
        ];
        await vm.refreshCarouselPrograms();

        expect(requestedFrom, hasLength(2));
        expect(requestedChannelIds.last, containsAll(<String>['c0', 'c1']));
        expect(
          requestedFrom.last,
          at(45).subtract(LiveTvGuideViewModel.rollingRefreshLookback),
        );
        expect(
          requestedTo.last,
          at(45).add(LiveTvGuideViewModel.rollingRefreshHorizon),
        );
        expect(vm.programsForChannel('c0').single.id, 'new-0');
        expect(vm.programsForChannel('c1').single.id, 'new-1');
      },
    );

    test('overlapping rolling refresh calls share one request', () async {
      seedLapsingSchedule();
      await vm.load();

      final reply = Completer<Map<String, dynamic>>();
      when(() => _guide(liveTv)).thenAnswer((_) => reply.future);

      final first = vm.refreshCarouselPrograms();
      await pumpEventQueue();
      final second = vm.refreshCarouselPrograms();

      expect(second, same(first));
      verify(() => _guide(liveTv, category: GuideFilter.all)).called(2);
      reply.complete({
        'Items': [_span('new', 'c0', at(-10), at(90))],
      });
      await Future.wait([first, second]);

      expect(vm.programsForChannel('c0').single.id, 'new');
    });

    test('a superseding replacement rejects a stale rolling reply', () async {
      seedLapsingSchedule();
      await vm.load();

      final pending = <Completer<Map<String, dynamic>>>[];
      when(() => _guide(liveTv)).thenAnswer((_) {
        final reply = Completer<Map<String, dynamic>>();
        pending.add(reply);
        return reply.future;
      });

      vm.scheduleBoundaryRefresh();
      final rolling = vm.refreshCarouselPrograms();
      await pumpEventQueue();
      final replacement = vm.replacePrograms(
        channelIds: const ['c0'],
        from: at(0),
        to: at(90),
      );
      await pumpEventQueue();

      expect(pending, hasLength(2));
      pending[1].complete({
        'Items': [_span('current', 'c0', at(-10), at(90))],
      });
      await replacement;
      pending[0].complete({
        'Items': [_span('stale', 'c0', at(-10), at(60))],
      });
      await rolling;

      expect(vm.programsForChannel('c0').single.id, 'current');
      expect(vm.boundaryDueAt, at(90));
    });

    test('a failed rolling refresh preserves the existing cache', () async {
      seedLapsingSchedule();
      await vm.load();

      guideThrows = true;
      await vm.refreshCarouselPrograms();

      expect(vm.programsForChannel('c0').map((p) => p.id), ['ended', 'airing']);
      expect(vm.boundaryDueAt, clock.add(LiveTvGuideViewModel.failureBackoff));
    });

    test('scheduled retry fetches a channel that never loaded', () async {
      _stubChannels(liveTv, [_channel('healthy'), _channel('missing')]);
      when(() => _guide(liveTv)).thenAnswer((_) async => {
        'Items': [_span('airing', 'healthy', at(0), at(30))],
        'FailedChannelIds': ['missing'],
      });

      await vm.load();
      vm.scheduleBoundaryRefresh();
      await vm.recordingChanged();
      expect(vm.loadStateFor('missing'), GuideChannelLoadState.failed);
      expect(vm.boundaryDueAt, clock.add(LiveTvGuideViewModel.failureBackoff));

      when(() => _guide(liveTv)).thenAnswer((inv) async {
        requestedChannelIds.add(_requestedIds(inv));
        return {'Items': [_span('recovered', 'missing', at(0), at(30))]};
      });
      clock = vm.boundaryDueAt!;
      await vm.handleBoundaryElapsed();

      expect(requestedChannelIds, [['missing']]);
      expect(vm.programsForChannel('missing').single.id, 'recovered');
      expect(vm.loadStateFor('missing'), GuideChannelLoadState.loaded);
      expect(vm.programsForChannel('healthy').single.id, 'airing');
    });

    test('a failed refresh backs off and keeps the data', () async {
      seedLapsingSchedule();
      await vm.load();
      vm.scheduleBoundaryRefresh();

      clock = at(31);
      guideThrows = true;
      await vm.handleBoundaryElapsed();

      expect(vm.programsForChannel('c0').map((p) => p.id), ['ended', 'airing']);
      expect(vm.boundaryDueAt, at(31).add(LiveTvGuideViewModel.failureBackoff));
    });

    test('a boundary passed while suspended refreshes on resume', () async {
      seedLapsingSchedule();
      await vm.load();
      vm.scheduleBoundaryRefresh();

      // The timer couldn't fire while the app was suspended.
      clock = at(45);
      vm.scheduleBoundaryRefresh();
      await pumpEventQueue();

      expect(requestedFrom, hasLength(2));
    });

    test('an empty schedule arms no timer', () async {
      items = <Map<String, dynamic>>[];

      await vm.load();
      vm.scheduleBoundaryRefresh();

      expect(vm.boundaryDueAt, isNull);
      expect(requestedFrom, hasLength(1));
    });

    test('an all-expired schedule refreshes immediately once', () async {
      items = [_span('expired', 'c0', at(-90), at(-30))];

      await vm.load();

      vm.scheduleBoundaryRefresh();
      await pumpEventQueue();

      expect(requestedFrom, hasLength(2));
      expect(
        vm.boundaryDueAt,
        clock.add(LiveTvGuideViewModel.noNewCoverageRetry),
      );
    });
  });

  group('re-entry and exit', () {
    setUp(() {
      _stubChannels(liveTv, [_channel('c0')]);
    });

    test(
      're-entry with a window over 30 minutes stale forces a reload',
      () async {
        var clock = DateTime(2026, 9, 9, 20);
        final vm = LiveTvGuideViewModel(client, now: () => clock);
        await vm.load();
        clearInteractions(liveTv);

        clock = clock.add(const Duration(minutes: 31));
        await vm.reloadIfStale();

        verify(() => _guide(liveTv, category: GuideFilter.all)).called(1);
        // A forced reload recomputes the window from the current clock.
        expect(vm.windowStart, DateTime(2026, 9, 9, 20));
      },
    );

    test('re-entry within 30 minutes does not reload', () async {
      var clock = DateTime(2026, 9, 9, 20);
      final vm = LiveTvGuideViewModel(client, now: () => clock);
      await vm.load();
      clearInteractions(liveTv);

      clock = clock.add(const Duration(minutes: 29));
      await vm.reloadIfStale();

      verifyNever(() => _guide(liveTv, category: GuideFilter.all));
    });

    test('exiting a paged-ahead session resets the window to now', () async {
      var clock = DateTime(2026, 9, 9, 20);
      final vm = LiveTvGuideViewModel(client, now: () => clock);
      await vm.load();

      await vm.shiftWindow(const Duration(hours: 6));
      expect(vm.windowStart, DateTime(2026, 9, 9, 26));

      clock = clock.add(const Duration(hours: 2));
      vm.resetWindowOnExit();

      expect(vm.windowStart, DateTime(2026, 9, 9, 22));
      expect(vm.windowEnd, DateTime(2026, 9, 10, 0, 30));
      expect(vm.guideDate, clock);
    });

    test('a reset window is reloaded on the next entry', () async {
      var clock = DateTime(2026, 9, 9, 20);
      final vm = LiveTvGuideViewModel(client, now: () => clock);
      await vm.load();
      await vm.shiftWindow(const Duration(hours: 3));

      final liveStart = DateTime(2026, 9, 9, 21, 45);
      clock = DateTime(2026, 9, 9, 22);
      vm.resetWindowOnExit(windowStart: liveStart);
      clearInteractions(liveTv);

      await vm.reloadIfStale(windowStart: liveStart);

      verify(() => _guide(liveTv, category: GuideFilter.all, start: liveStart)).called(1);
    });
  });

  group('recording defaults carry the program id', () {
    setUp(() {
      _stubChannels(liveTv, [_channel('c0')]);
      when(() => liveTv.createTimer(any())).thenAnswer((_) async {});
    });

    test(
      'toggleProgramRecording creates a timer for the program\'s own id',
      () async {
        final vm = LiveTvGuideViewModel(client);
        await vm.load();

        final program = GuideProgram(
          id: 'program-42',
          channelId: 'c0',
          name: 'Test',
          startDate: DateTime(2026, 9, 9, 20),
          endDate: DateTime(2026, 9, 9, 21),
          rawData: const {},
        );
        await vm.toggleProgramRecording(program);

        verify(() => liveTv.createTimer('program-42')).called(1);
      },
    );
  });

  test(
    'favoriting re-sorts only when the sort reads the favorite flag',
    () async {
      final channels = [
        {'Id': 'c1', 'Name': 'Ch 1', 'ChannelNumber': '1'},
        {'Id': 'c2', 'Name': 'Ch 2', 'ChannelNumber': '2'},
        {'Id': 'c3', 'Name': 'Ch 3', 'ChannelNumber': '3'},
      ];
      _stubChannels(liveTv, channels);
      final userLibrary = _MockUserLibraryApi();
      when(() => client.userLibraryApi).thenReturn(userLibrary);
      when(() => userLibrary.markFavorite(any())).thenAnswer((_) async {});

      final byNumber = LiveTvGuideViewModel(
        client,
        initialSortBy: ChannelSortBy.number,
      );
      await byNumber.load();
      await byNumber.toggleChannelFavorite('c3');
      expect(byNumber.filteredChannels.map((c) => c.id), ['c1', 'c2', 'c3']);

      userDataSync.reset();
      final favoritesFirst = LiveTvGuideViewModel(
        client,
        initialSortBy: ChannelSortBy.favoritesFirst,
      );
      await favoritesFirst.load();
      await favoritesFirst.toggleChannelFavorite('c3');
      expect(favoritesFirst.filteredChannels.map((c) => c.id), [
        'c3',
        'c1',
        'c2',
      ]);
    },
  );

  test('a channel number search keeps the All Channels or Favorites surfing lineup', () async {
    _stubChannels(liveTv, [
      for (final id in ['1', '2', '3'])
        {..._channel(id, number: '10$id'), 'UserData': {'IsFavorite': id != '2'}},
    ]);
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    await vm.load();
    vm.setChannelQuery('103');
    expect(vm.filteredChannels.single.id, '3');
    expect(vm.surfingChannels.map((c) => c.id), ['1', '2', '3']);
    vm.setFilter(GuideFilter.favorites);
    expect(vm.filteredChannels.single.id, '3');
    expect(vm.surfingChannels.map((c) => c.id), ['1', '3']);
  });

  test('channel favorites follow user-data updates and the favorites filter', () async {
    _stubChannels(liveTv, [_channel('c1'), _channel('c2')]);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    vm.setFilter(GuideFilter.favorites);
    expect(vm.filteredChannels, isEmpty);

    userDataSync.publish(serverChannelKey(client.baseUrl, 'c2'), {'IsFavorite': true});
    vm.syncChannelUserData();
    expect(vm.filteredChannels.map((channel) => channel.id), ['c2']);
    userDataSync.publish(serverChannelKey(client.baseUrl, 'c2'), {'IsFavorite': false});
    vm.syncChannelUserData();
    expect(vm.filteredChannels, isEmpty);
    vm.dispose();
  });

  test('a channel favorited under the favorites filter gets its programs', () async {
    stubNumberedChannels(120);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    vm.setFilter(GuideFilter.favorites);
    expect(vm.hasProgramsFor('c110'), isFalse);

    userDataSync.publish(serverChannelKey(client.baseUrl, 'c110'), {'IsFavorite': true});
    vm.syncChannelUserData();
    await Future<void>.delayed(Duration.zero);
    expect(vm.hasProgramsFor('c110'), isTrue);
    vm.dispose();
  });

  test('overlapping program requests fetch a channel once', () async {
    stubNumberedChannels(120);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    final reply = Completer<Map<String, dynamic>>();
    final requested = <String>[];
    when(() => _guide(liveTv)).thenAnswer((inv) {
      requested.addAll(_requestedIds(inv));
      return reply.future;
    });

    final first = vm.ensureProgramsForChannels(['c110']);
    final second = vm.ensureProgramsForChannels(['c110']);
    reply.complete({
      'Items': [_program('p', 'c110')],
    });
    await Future.wait([first, second]);

    expect(requested, ['c110']);
    expect(vm.programsForChannel('c110').map((p) => p.id), ['p']);
    vm.dispose();
  });

  test('a failed favorite program request is asked again later', () async {
    stubNumberedChannels(120);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    vm.setFilter(GuideFilter.favorites);
    when(() => _guide(liveTv)).thenThrow(Exception('offline'));

    userDataSync.publish(serverChannelKey(client.baseUrl, 'c110'), {'IsFavorite': true});
    vm.syncChannelUserData();
    await pumpEventQueue();
    expect(vm.hasProgramsFor('c110'), isFalse);

    when(() => _guide(liveTv)).thenAnswer((_) async => {'Items': <dynamic>[]});
    await vm.ensureProgramsForChannels(['c110']);
    expect(vm.hasProgramsFor('c110'), isTrue);
    vm.dispose();
  });

  test('a replacement playback lineup starts paging at the first missing channel', () async {
    _stubChannels(liveTv, [_channel('kept'), _channel('old')]);
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    await vm.load();
    expect(vm.programsHighWater, 2);

    vm.usePlaybackLineup([
      GuideChannel.fromRawItem(_channel('new')),
      vm.playbackChannels.firstWhere((c) => c.id == 'kept'),
    ]);
    expect(vm.programsHighWater, 0);
    await vm.loadMorePrograms();
    expect(vm.hasProgramsFor('new'), isTrue);
    expect(vm.programsHighWater, 2);
  });

  test('a lazy batch waits on a request already out and retries it', () async {
    stubNumberedChannels(120);
    final vm = LiveTvGuideViewModel(client);
    await vm.load();
    expect(vm.programsHighWater, 50);

    final calls =
        <({List<String> ids, Completer<Map<String, dynamic>> reply})>[];
    when(() => _guide(liveTv)).thenAnswer((inv) {
      final reply = Completer<Map<String, dynamic>>();
      calls.add((ids: _requestedIds(inv), reply: reply));
      return reply.future;
    });
    final favorite = vm.ensureProgramsForChannels(['c60']);
    final lazy = vm.loadMorePrograms();
    await pumpEventQueue();
    expect(calls, hasLength(2));
    expect(calls[1].ids, isNot(contains('c60')));

    calls[1].reply.complete({'Items': <dynamic>[]});
    calls[0].reply.completeError(Exception('offline'));
    await expectLater(favorite, throwsException);
    await lazy;
    expect(vm.hasProgramsFor('c60'), isFalse);
    expect(vm.programsHighWater, 50);

    final retry = vm.loadMorePrograms();
    await pumpEventQueue();
    expect(calls.last.ids, ['c60']);
    calls.last.reply.complete({'Items': <dynamic>[]});
    await retry;
    expect(vm.hasProgramsFor('c60'), isTrue);
    expect(vm.programsHighWater, 100);
    vm.dispose();
  });

  test('a lineup from before a user switch is dropped', () async {
    final reply = Completer<Map<String, dynamic>>();
    when(() => _channelsRequest(liveTv)).thenAnswer((_) => reply.future);
    final vm = LiveTvGuideViewModel(client);
    final loading = vm.load();
    await pumpEventQueue();

    userDataSync.reset();
    reply.complete({
      'Items': [
        {
          ..._channel('c1'),
          'UserData': {'IsFavorite': true},
        },
      ],
    });
    await loading;

    expect(userDataSync.favoriteFor(serverChannelKey(client.baseUrl, 'c1')), isNull);
    vm.dispose();
  });

  test('re-entering All reloads the lineup after a session change during the first listings', () async {
    final now = DateTime(2026, 9, 11, 10);
    _stubChannels(liveTv, [_channel('old')]);
    final pending = Completer<Map<String, dynamic>>();
    when(() => _guide(liveTv)).thenAnswer((_) => pending.future);
    final vm = LiveTvGuideViewModel(client, now: () => now);
    addTearDown(vm.dispose);
    final opening = vm.load();
    await pumpEventQueue();
    verify(() => _guide(liveTv)).called(1);

    userDataSync.reset();
    pending.complete({'Items': [_program('old-show', 'old', start: now)]});
    await opening;
    expect(vm.programsForChannel('old'), isEmpty);

    _stubChannels(liveTv, [_channel('new')]);
    when(() => _guide(liveTv)).thenAnswer((_) async => {
      'Items': [_program('new-show', 'new', start: now)],
    });
    await vm.reloadIfStale();
    expect(vm.filteredChannels.map((channel) => channel.id), ['new']);
    expect(vm.programsForChannel('new').single.id, 'new-show');
  });

  group('category filters', () {
    test('search keeps category stations for surfing until their listings change', () async {
      stubNumberedChannels(3);
      var matching = {'c0', 'c1'};
      when(() => _guide(liveTv, category: GuideFilter.sports))
          .thenAnswer(_serverFiltered((id) => matching.contains(id)));
      final vm = await loadFilter(GuideFilter.sports);
      vm.setChannelQuery('c1');
      await pumpEventQueue();
      expect(vm.filteredChannels.single.id, 'c1');
      expect(vm.surfingChannels.map((c) => c.id), ['c0', 'c1']);
      expect(vm.programsHighWater, 1);
      await vm.setWindowStart(vm.windowEnd);
      expect(vm.surfingChannels.map((c) => c.id), ['c0', 'c1']);
      matching = {'c1'};
      await vm.setWindowStart(vm.windowEnd);
      expect(vm.surfingChannels.single.id, 'c1');
    });

    for (final reload in [false, true]) {
      test('a viewer change during a category request reloads the guide on return (reload=$reload)', () async {
        stubNumberedChannels(1);
        final start = DateTime.now().add(const Duration(hours: 1));
        final vm = await loadFilter(GuideFilter.all, start: start);
        final stale = pendingGuide(GuideFilter.kids);
        vm.setFilter(GuideFilter.kids);
        await pumpEventQueue();
        expect(vm.state, GuideState.loading);
        final loading = reload ? vm.load(windowStart: start) : null;
        await pumpEventQueue();
        userDataSync.reset();
        stale.complete({'Items': [_program('old', 'c0', isKids: true)]});
        await loading;
        await pumpEventQueue();
        expect(vm.filteredChannels, isEmpty);
        expect(vm.state, GuideState.ready);
        expect(vm.hasMorePrograms, isTrue);
        clearInteractions(liveTv);
        when(() => _guide(liveTv, category: GuideFilter.kids))
            .thenAnswer((_) async => {'Items': [_program('fresh', 'c0', isKids: true)]});
        await vm.reloadIfStale(windowStart: start);
        verify(() => _channelsRequest(liveTv)).called(1);
      });
    }

    void stubSportsRetry(Map<String, dynamic> Function() retry, {bool hasListings = true}) {
      stubNumberedChannels(3);
      when(() => _guide(liveTv, category: GuideFilter.sports))
          .thenAnswer((inv) async {
        if (_requestedIds(inv).length == 1) {
          expect(_requestedIds(inv), ['c1']);
          return retry();
        }
        return {
          'Items': [if (hasListings) _program('sport-c0', 'c0', isSports: true)],
          'FailedChannelIds': ['c1'],
        };
      });
    }

    test('a malformed targeted retry with no listings still reports a guide error', () async {
      stubSportsRetry(() => throw const FormatException('Invalid EPG grid'), hasListings: false);

      final vm = await loadFilter(GuideFilter.sports);

      expect(vm.state, GuideState.error);
      expect(vm.error, isA<FormatException>());
    });

    final retryFailures = <String, Map<String, dynamic> Function()>{
      'timeout': () => throw TimeoutException('Plex grid temporarily unavailable'),
      'malformed grid': () => throw const FormatException('Invalid EPG grid'),
      'invalid JSON': () => throw DioException(
        requestOptions: RequestOptions(path: '/guide'),
        error: const FormatException('Invalid JSON'),
      ),
      'malformed Items': () => {'Items': 'invalid'},
      'missing station': () => {'Items': [], 'FailedChannelIds': ['c1']},
    };
    for (final failure in retryFailures.entries) {
      test('a targeted retry with ${failure.key} keeps healthy category programs', () async {
        var recovered = false;
        stubSportsRetry(() => recovered
            ? {'Items': [_program('sport-c1', 'c1', isSports: true)]}
            : failure.value());
        final vm = await loadFilter(GuideFilter.sports);

        expect(vm.state, GuideState.ready);
        expect(vm.filteredChannels.map((channel) => channel.id), ['c0']);
        expect(vm.hasFailedCategoryListings, isTrue);
        expect(vm.hasMorePrograms, isFalse);
        final requests = verify(() => _guide(liveTv, category: GuideFilter.sports, captureChannelIds: true)).captured;
        expect(requests, [['c0', 'c1', 'c2'], ['c1']]);
        recovered = true;
        if (failure.key == 'missing station') {
          vm.setFilter(GuideFilter.sports); // Choosing Sports again also retries its missing listings.
          await pumpEventQueue();
        } else {
          await vm.retryFailedCategoryListings();
        }
        expect(verify(() => _guide(liveTv, category: GuideFilter.sports, captureChannelIds: true)).captured, [['c1']]);
        expect(vm.filteredChannels.map((channel) => channel.id), ['c0', 'c1']);
        expect(vm.programsForChannel('c0').single.id, 'sport-c0');
        expect(vm.hasFailedCategoryListings, isFalse);
      });
    }

    for (final firstAvailable in [false, true]) {
      test('Retry fills gaps in a Sports guide during a tuner outage (first batch available=$firstAvailable)', () async {
        stubNumberedChannels(600);
        final offline = {if (!firstAvailable) 'c0', 'c200', 'c400'};
        final requests = <String>[];
        when(() => _guide(liveTv, category: GuideFilter.sports)).thenAnswer((inv) async {
          final station = _requestedIds(inv).first;
          requests.add(station);
          if (offline.contains(station)) throw TimeoutException('tuner offline');
          return {'Items': [_program('p-$station', station, isSports: true)]};
        });
        final vm = await loadFilter(GuideFilter.sports);
        expect(vm.filteredChannels.map((c) => c.id), firstAvailable ? ['c0'] : isEmpty);
        if (!firstAvailable) expect(requests, ['c0', 'c0']);
        expect(vm.hasFailedCategoryListings, isTrue);
        offline.removeAll(['c200', 'c400']);
        await vm.retryFailedCategoryListings();
        expect(vm.filteredChannels.map((c) => c.id), firstAvailable ? ['c0', 'c200', 'c400'] : ['c200', 'c400']);
        expect(vm.hasFailedCategoryListings, !firstAvailable);
        offline.clear();
        await vm.retryFailedCategoryListings();
        expect(vm.filteredChannels.map((c) => c.id), ['c0', 'c200', 'c400']);
        expect(vm.hasFailedCategoryListings, isFalse);
      });
    }

    test('a category chip walks the lineup in flagged batches', () async {
      stubNumberedChannels(120);
      when(() => _guide(liveTv, category: GuideFilter.sports)).thenAnswer(
        (inv) async => {
          'Items': [
            for (final id in _requestedIds(inv))
              if (const {'c110', 'c7', 'c60'}.contains(id))
                _program('p-$id', id, isSports: true),
            _program('p4', 'c8', isKids: true),
          ],
        },
      );

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      expect(vm.programsHighWater, 50);

      vm.setFilter(GuideFilter.sports);
      expect(vm.state, GuideState.loading);
      await Future<void>.delayed(Duration.zero);
      expect(vm.state, GuideState.ready);

      final captured = verify(
        () => _guide(
          liveTv,
          category: GuideFilter.sports,
          captureChannelIds: true,
        ),
      ).captured;
      expect((captured.single as List).length, 120);
      expect(vm.filteredChannels.map((c) => c.id), ['c7', 'c60', 'c110']);
      expect(vm.hasProgramsFor('c110'), isTrue);
      expect(vm.programsForChannel('c110').single.id, 'p-c110');
      expect(vm.programsHighWater, 3);
      expect(vm.hasMorePrograms, isFalse);
    });

    test('scrolling a category pulls the next batch of channels', () async {
      stubNumberedChannels(500);
      when(() => _guide(liveTv, category: GuideFilter.sports)).thenAnswer(
        _serverFiltered((id) => int.parse(id.substring(1)) % 10 == 0),
      );

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.sports);
      await Future<void>.delayed(Duration.zero);

      expect(vm.filteredChannels.length, 40);
      expect(vm.filteredChannels.first.id, 'c0');
      expect(vm.filteredChannels.last.id, 'c390');
      expect(vm.programsHighWater, 40);
      expect(vm.hasMorePrograms, isTrue);

      await vm.loadMorePrograms();
      expect(vm.filteredChannels.length, 50);
      expect(vm.filteredChannels.last.id, 'c490');
      expect(vm.hasMorePrograms, isFalse);
      await vm.loadMorePrograms();
      expect(vm.filteredChannels.length, 50);
      verify(() => _guide(liveTv, category: GuideFilter.sports)).called(3);
    });

    test(
      're-sorting keeps category rows and requests only unseen channels',
      () async {
        stubNumberedChannels(500);
        when(() => _guide(liveTv, category: GuideFilter.sports)).thenAnswer(
          _serverFiltered((id) => int.parse(id.substring(1)) % 10 == 0),
        );

        final vm = LiveTvGuideViewModel(client);
        await vm.load();
        vm.setFilter(GuideFilter.sports);
        await Future<void>.delayed(Duration.zero);
        expect(vm.filteredChannels.length, 40);
        clearInteractions(liveTv);

        vm.setSortBy(ChannelSortBy.name);
        await Future<void>.delayed(Duration.zero);

        expect(vm.filteredChannels.length, 50);
        expect(vm.filteredChannels.first.name, 'Ch c0');
        expect(vm.hasMorePrograms, isFalse);
        final captured = verify(
          () => _guide(
            liveTv,
            category: GuideFilter.sports,
            captureChannelIds: true,
          ),
        ).captured;
        final requested = captured.expand((ids) => ids as List<String>).toSet();
        expect(requested.length, 100);
        expect(
          requested.every((id) => int.parse(id.substring(1)) >= 400),
          isTrue,
        );
      },
    );

    test('a sparse category keeps walking until it finds rows', () async {
      stubNumberedChannels(1000);
      when(() => _guide(liveTv, category: GuideFilter.sports))
          .thenAnswer(_serverFiltered((id) => id == 'c999'));

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.sports);
      await Future<void>.delayed(Duration.zero);

      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels.map((c) => c.id), ['c999']);
      expect(vm.hasMorePrograms, isFalse);
      verify(() => _guide(liveTv, category: GuideFilter.sports)).called(5);
    });

    test('premiere has no server flag, so it matches client-side', () async {
      stubNumberedChannels(120);
      when(() => _guide(liveTv, category: GuideFilter.premiere)).thenAnswer(
        (inv) async => {
          'Items': [
            for (final id in _requestedIds(inv))
              _program('p-$id', id, isPremiere: id == 'c100'),
          ],
        },
      );

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.premiere);
      await Future<void>.delayed(Duration.zero);

      expect(vm.filteredChannels.map((c) => c.id), ['c100']);
      expect(vm.programsForChannel('c100').single.id, 'p-c100');
      expect(vm.hasMorePrograms, isFalse);
    });

    test('a Premiere window move stops after two consecutive timeouts', () async {
      stubNumberedChannels(500);
      when(() => _guide(liveTv, category: GuideFilter.premiere)).thenAnswer((inv) async => {
        'Items': [if (_requestedIds(inv).contains('c499')) _program('old', 'c499', isPremiere: true)],
      });
      final vm = await loadFilter(GuideFilter.premiere);
      final from = vm.windowStart;
      final next = from.add(const Duration(hours: 3));
      final attempts = <String>[];
      var firstBatchHealthy = false;
      when(() => _guide(liveTv, category: GuideFilter.premiere)).thenAnswer((inv) async {
        final ids = _requestedIds(inv);
        attempts.add(ids.first);
        if (firstBatchHealthy && ids.contains('c0')) {
          return {'Items': [_program('new', 'c0', start: next, isPremiere: true)]};
        }
        throw TimeoutException('guide unavailable');
      });
      expect(await vm.setWindowStart(next), isFalse);
      expect(attempts, ['c0', 'c50']);
      expect(vm.windowStart, from);
      expect(vm.programsForChannel('c499').single.id, 'old');

      attempts.clear();
      firstBatchHealthy = true;
      expect(await vm.setWindowStart(next), isTrue);
      expect(attempts, ['c0', 'c50', 'c100']);
      expect(vm.programsForChannel('c0').single.id, 'new');
      expect(vm.hasFailedCategoryListings, isTrue);
      expect(vm.hasMorePrograms, isTrue);
    });

    test('switching chips drops a stale in-flight category response', () async {
      _stubChannels(liveTv, List.generate(10, (i) => _channel('c$i')));
      final sports = Completer<Map<String, dynamic>>();
      when(() => _guide(liveTv, category: GuideFilter.sports))
          .thenAnswer((_) => sports.future);
      when(() => _guide(liveTv, category: GuideFilter.kids)).thenAnswer(
        (_) async => {
          'Items': [_program('k1', 'c3', isKids: true)],
        },
      );

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.sports);
      vm.setFilter(GuideFilter.kids);
      await Future<void>.delayed(Duration.zero);
      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels.map((c) => c.id), ['c3']);

      sports.complete({
        'Items': [_program('s1', 'c1', isSports: true)],
      });
      await Future<void>.delayed(Duration.zero);
      expect(vm.filter, GuideFilter.kids);
      expect(vm.filteredChannels.map((c) => c.id), ['c3']);
    });

    test('backing out of a pending category returns to All', () async {
      _stubChannels(liveTv, List.generate(10, (i) => _channel('c$i')));
      final sports = Completer<Map<String, dynamic>>();
      when(() => _guide(liveTv, category: GuideFilter.sports))
          .thenAnswer((_) => sports.future);

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.sports);
      expect(vm.state, GuideState.loading);
      vm.setFilter(GuideFilter.all);
      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels.length, 10);

      sports.complete({'Items': <dynamic>[]});
      await Future<void>.delayed(Duration.zero);
      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels.length, 10);
    });

    test('paging the Sports guide keeps the old listings until Retry loads the next window', () async {
      final start = DateTime.utc(2026, 9, 11, 10);
      final next = start.add(const Duration(hours: 3));
      stubNumberedChannels(2);
      when(() => _guide(liveTv, category: GuideFilter.sports)).thenAnswer(
          (_) async => {'Items': [_program('old', 'c1', start: start, isSports: true)]});
      final vm = await loadFilter(GuideFilter.sports, start: start);
      final oldEnd = vm.windowEnd;
      final oldDate = vm.guideDate;
      final changes = <DateTime>[];
      vm.addListener(() => changes.add(vm.windowStart));
      when(() => _guide(liveTv, category: GuideFilter.sports)).thenThrow(Exception('offline'));
      await expectLater(vm.setWindowStart(next), throwsException);
      expect(vm.windowStart, start);
      expect(vm.windowEnd, oldEnd);
      expect(vm.guideDate, oldDate);
      expect(vm.atLivePosition, isTrue);
      expect(vm.filteredChannels.single.id, 'c1');
      expect(vm.programsForChannel('c1').single.id, 'old');
      expect(changes, isEmpty);

      when(() => _guide(liveTv, category: GuideFilter.sports, start: next))
          .thenAnswer((_) async => {'Items': []});
      expect(await vm.setWindowStart(next), isTrue);
      expect(changes, [next]);
      expect(vm.windowEnd, next.add(vm.guideWindow));
      expect(vm.atLivePosition, isFalse);
      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels, isEmpty);
    });

    test('shifting the window re-fetches the active category', () async {
      _stubChannels(liveTv, List.generate(10, (i) => _channel('c$i')));
      when(() => _guide(liveTv, category: GuideFilter.kids)).thenAnswer(
        (_) async => {
          'Items': [_program('k1', 'c5', isKids: true)],
        },
      );

      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      vm.setFilter(GuideFilter.kids);
      await Future<void>.delayed(Duration.zero);
      await vm.shiftWindow(const Duration(hours: 3));

      verify(() => _guide(liveTv, category: GuideFilter.kids)).called(2);
      expect(vm.filteredChannels.map((c) => c.id), ['c5']);
    });
  });

  group('recording changes refresh the loaded rows in place', () {
    Map<String, dynamic> recorded(Map<String, dynamic> program) => {
      ...program,
      'TimerId': 'timer-1',
    };

    for (final external in [false, true]) {
      test('a recording made ${external ? 'elsewhere' : 'in the guide'} updates its badge without hiding listings', () async {
        stubNumberedChannels(1);
        final program = _program('p0', 'c0');
        var scheduled = false;
        when(() => _guide(liveTv)).thenAnswer((_) async => {'Items': [scheduled ? recorded(program) : program]});
        final vm = await loadFilter(GuideFilter.all);
        expect(vm.programsForChannel('c0').single.hasTimer, isFalse);
        clearInteractions(liveTv);
        await vm.reloadIfRecordingsChanged();
        verifyNever(() => _guide(liveTv));

        final states = <GuideState>[];
        vm.addListener(() => states.add(vm.state));
        final revision = liveTvRecordingRevision.value;
        scheduled = true;
        if (external) {
          notifyLiveTvRecordingsChanged();
          await vm.reloadIfRecordingsChanged();
        } else {
          await vm.recordingChanged();
        }
        expect(liveTvRecordingRevision.value, revision + 1);
        expect(vm.programsForChannel('c0').single.hasTimer, isTrue);
        expect(states, isNot(contains(GuideState.loading)));
        clearInteractions(liveTv);
        await vm.reloadIfRecordingsChanged();
        verifyNever(() => _guide(liveTv));
      });
    }

    final deniedRequest = RequestOptions();
    final denied = DioException(requestOptions: deniedRequest,
        response: Response(requestOptions: deniedRequest, statusCode: 403));

    Future<void> finishRecording(LiveTvGuideViewModel vm, GuideFilter category,
        Completer<Map<String, dynamic>> stale, Future<void> earlier, {bool staleSuccess = false}) async {
      final reply = pendingGuide(category);
      final states = <GuideState>[];
      vm.addListener(() => states.add(vm.state));
      final recording = vm.recordingChanged();
      await pumpEventQueue();
      if (!staleSuccess) stale.completeError(denied);
      await pumpEventQueue();
      final row = _program('show', 'c0', isKids: category == GuideFilter.kids, isSports: category == GuideFilter.sports);
      reply.complete({'Items': [recorded(row)]});
      await recording;
      if (staleSuccess) stale.complete({'Items': [row]});
      await earlier;
      expect(states, isNot(contains(GuideState.loading)));
      expect(vm.state, GuideState.ready);
      expect(vm.filteredChannels.map((c) => c.id), ['c0']);
      expect(vm.programsForChannel('c0').single.hasTimer, isTrue);
    }

    for (final action in ['recording', 'window', 'retry', 'late retry']) {
      test('a recording change wins over an earlier $action request', () async {
        const kids = GuideFilter.kids;
        stubNumberedChannels(1);
        when(() => _guide(liveTv, category: kids)).thenAnswer(
            (_) async => {'Items': [_program('show', 'c0', isKids: true)]});
        final vm = await loadFilter(kids);
        final retry = action.endsWith('retry');
        if (retry) {
          when(() => _guide(liveTv, category: kids)).thenAnswer(
              (_) async => {'Items': [], 'FailedChannelIds': ['c0']});
          await vm.recordingChanged();
          expect(vm.hasFailedCategoryListings, isTrue);
        }
        final stale = pendingGuide(kids);
        final earlier = retry ? vm.retryFailedCategoryListings() :
            action == 'window' ? vm.setWindowStart(vm.windowEnd) : vm.recordingChanged();
        await pumpEventQueue();
        await finishRecording(vm, kids, stale, earlier.then((_) {}), staleSuccess: action == 'late retry');
      });
    }

    for (final lookup in ['page', 'page retry', 'single channel']) {
      test('a superseded $lookup denial leaves the newer recording badge visible', () async {
        const sports = GuideFilter.sports;
        stubNumberedChannels(201);
        when(() => _guide(liveTv, category: sports)).thenAnswer(_serverFiltered((_) => true));
        final vm = await loadFilter(sports);
        final stale = Completer<Map<String, dynamic>>();
        var reads = 0;
        when(() => _guide(liveTv, category: sports)).thenAnswer((inv) async {
          if (++reads == 1 && lookup == 'page retry') return {'Items': [], 'FailedChannelIds': _requestedIds(inv)};
          return stale.future;
        });
        Future<void> browse() => lookup == 'single channel'
            ? expectLater(vm.ensureCategoryChannel('c200'), throwsA(same(denied))) : vm.loadMorePrograms();
        final earlier = browse();
        await pumpEventQueue();
        expect(reads, lookup == 'page retry' ? 2 : 1);
        await finishRecording(vm, sports, stale, earlier);
        expect(vm.hasMorePrograms, isTrue);
        when(() => _guide(liveTv, category: sports)).thenThrow(denied);
        await browse();
        expect(vm.listingsAccessDenied, isTrue);
      });
    }

    test('a failed recording reload is retried on re-entry until listings recover', () async {
      _stubChannels(liveTv, [_channel('c0')]);
      final vm = LiveTvGuideViewModel(client, now: () => DateTime(2026, 9, 11, 10, 10));
      await vm.load();
      var reads = 0;
      when(() => _guide(liveTv)).thenAnswer((_) async {
        if (++reads == 1) throw const FormatException('Invalid recording refresh');
        throw TimeoutException('Listings unavailable');
      });
      await vm.recordingChanged();
      expect(reads, 2);

      await vm.reloadIfStale();
      expect(reads, 3);
      when(() => _guide(liveTv)).thenAnswer((_) async => {
        'Items': [recorded(_program('p0', 'c0'))],
      });
      await vm.reloadIfRecordingsChanged();
      expect(vm.programsForChannel('c0').single.hasTimer, isTrue);
      clearInteractions(liveTv);
      await vm.reloadIfStale();
      verifyNever(() => _guide(liveTv));
      vm.dispose();
    });

    test('a second recording change supersedes an in-flight reload', () async {
      _stubChannels(liveTv, [_channel('c0')]);
      final vm = LiveTvGuideViewModel(client);
      await vm.load();
      final started = Completer<void>(), release = Completer<void>();
      var reads = 0;
      final program = _program('p0', 'c0');
      when(() => _guide(liveTv)).thenAnswer((_) async {
        if (++reads == 1) throw const FormatException('Invalid recording refresh');
        if (reads == 2) {
          started.complete();
          await release.future;
          return {'Items': [program]};
        }
        return {'Items': [recorded(program)]};
      });
      final first = vm.recordingChanged();
      await started.future;
      final second = vm.recordingChanged();
      release.complete();
      await Future.wait([first, second]);
      expect(vm.programsForChannel('c0').single.hasTimer, isTrue);
      vm.dispose();
    });

  });

  final guideStart = DateTime.utc(2026, 9, 11, 10);
  GuideProgram listing(String id, {String channel = 'c0', String? name, String? episode,
      Map<String, dynamic> raw = const {}}) => GuideProgram(
    id: id, name: name ?? id, channelId: channel, episodeTitle: episode, rawData: raw,
    startDate: guideStart, endDate: guideStart.add(const Duration(minutes: 30)),
  );

  Future<Map<String, dynamic>> lookup() => liveTv.getProgram(any(), userId: any(named: 'userId'));

  test('browsing new listings evicts the oldest cached artwork first', () async {
    when(lookup).thenAnswer((inv) async => _program(inv.positionalArguments.first as String, 'c0'));
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    final cap = LiveTvGuideViewModel.artworkCacheCap;
    for (var i = 0; i <= cap; i++) {
      await vm.artworkSourceFor(listing('p$i'));
    }
    expect(vm.hasArtworkResult('p0'), isFalse);
    expect(vm.hasArtworkResult('p1'), isTrue);
    expect(vm.hasArtworkResult('p$cap'), isTrue);
  });

  testWidgets('retrying artwork refreshes the guide with the right art for both channels', (tester) async {
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    final first = listing('p1', name: 'Paid Programming');
    final second = listing('p2', channel: 'c1', name: 'Paid Programming');
    when(lookup).thenThrow(Exception('offline'));
    expect(await vm.artworkSourceFor(first), isNull);
    expect(vm.hasArtworkResult(first.id), isFalse);
    when(lookup).thenAnswer((inv) async {
      final id = inv.positionalArguments.first as String;
      return {..._program(id, id == first.id ? 'c0' : 'c1'), 'Name': first.name, 'ImageTags': {'Primary': 'tag-$id'}};
    });
    expect((await vm.artworkSourceFor(first))?.tag, 'tag-p1');
    expect(vm.hasArtworkResult(first.id), isTrue);
    expect((await vm.artworkSourceFor(second))?.tag, 'tag-p2');
    verify(lookup).called(3);
    var redraws = 0;
    vm.addListener(() => redraws++);
    await tester.pump(const Duration(milliseconds: 200));
    expect(redraws, 1);
  });

  for (final empty in [false, true]) {
    test('changing filters replaces queued artwork (empty lineup: $empty)', () async {
      final pending = <String, Completer<Map<String, dynamic>>>{};
      when(lookup).thenAnswer((inv) {
        final id = inv.positionalArguments.first as String;
        return (pending[id] = Completer<Map<String, dynamic>>()).future;
      });
      final vm = LiveTvGuideViewModel(client);
      addTearDown(vm.dispose);
      vm.queueArtworkPrefetch([for (var i = 0; i < 5; i++) listing('p$i')]);
      expect(pending.keys, ['p0', 'p1', 'p2']);
      vm.queueArtworkPrefetch([if (!empty) listing('new')], replace: true);
      for (final id in ['p0', 'p1', 'p2']) {
        pending[id]!.complete(_program(id, 'c0'));
        await pumpEventQueue();
      }
      expect(pending.keys, ['p0', 'p1', 'p2', if (!empty) 'new']);
      pending['new']?.complete(_program('new', 'c0'));
      await pumpEventQueue();
    });
  }

  for (final offline in [false, true]) {
    test('redisplaying a 600-channel lineup bounds artwork requests (offline: $offline)', () async {
      var reads = 0;
      when(lookup).thenAnswer((inv) async {
        reads++;
        if (offline) throw StateError('unavailable');
        final id = inv.positionalArguments.first as String;
        return _program(id, 'c${id.substring(1)}');
      });
      final vm = LiveTvGuideViewModel(client);
      addTearDown(vm.dispose);
      final programs = [for (var i = 0; i < 600; i++) listing('p$i', channel: 'c$i')];
      vm.queueArtworkPrefetch(programs, replace: true);
      await pumpEventQueue(times: 5000);
      final settled = reads;
      expect(settled, offline ? lessThan(20) : programs.length);
      if (offline) expect(vm.artworkLookupsDisabled, isTrue);
      for (var i = 0; i < 3; i++) {
        vm.queueArtworkPrefetch(programs, replace: true);
        await pumpEventQueue(times: 200);
      }
      expect(reads, settled);
    });
  }

  test('guide artwork uses its own poster, series poster, or parent thumbnail', () async {
    final vm = LiveTvGuideViewModel(client);
    addTearDown(vm.dispose);
    final parent = {'ParentThumbItemId': 'parent', 'ParentThumbImageTag': 'thumb'};
    final series = {'SeriesId': 'series', 'SeriesPrimaryImageTag': 'poster'};
    for (final (raw, id, tag, thumb) in [
      (parent, 'parent', 'thumb', true),
      (series, 'series', 'poster', false),
      ({...parent, ...series, 'ImageTags': {'Primary': 'own'}}, 'p1', 'own', false),
    ]) {
      final source = await vm.artworkSourceFor(listing('p1', raw: raw));
      expect((source?.itemId, source?.tag, source?.isThumb), (id, tag, thumb));
    }
    verifyNever(lookup);
  });

  test('episode labels use the title and numbering available in the listing', () {
    String label(String? title, {int? season, int? episode}) =>
        listing('p1', episode: title, raw: {'ParentIndexNumber': ?season, 'IndexNumber': ?episode}).episodeLine;
    expect(label('The Reckoning', season: 1, episode: 5), 'The Reckoning (S1:E5)');
    expect(label('The Reckoning'), 'The Reckoning');
    expect(label(null, season: 2, episode: 9), '(S2:E9)');
    expect(label(null), isEmpty);
    expect(label('   '), isEmpty);
  });
}
