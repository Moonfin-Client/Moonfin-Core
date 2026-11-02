import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/models/series_recording_episodes.dart';
import 'package:moonfin/data/viewmodels/recordings_view_model.dart';
import 'package:moonfin/data/viewmodels/schedule_view_model.dart';
import 'package:moonfin/data/viewmodels/series_recordings_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/live_tv/live_tv_recording_icon.dart';
import 'package:moonfin/ui/widgets/live_tv/series_recording_dialog.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

final _en = AppLocalizationsEn();

Map<String, dynamic> _timer(
  String id,
  String? status, {
  Duration startsIn = const Duration(hours: 1),
  Duration? endsIn = const Duration(hours: 2),
}) {
  final now = DateTime.now();
  return {
    'Id': id,
    'Name': 'Timer $id',
    'Status': ?status,
    'StartDate': now.add(startsIn).toUtc().toIso8601String(),
    if (endsIn != null) 'EndDate': now.add(endsIn).toUtc().toIso8601String(),
  };
}

void main() {
  group('SeriesRecordingEpisodes', () {
    test('new-only wins even when the library skip flag is off', () {
      expect(
        SeriesRecordingEpisodes.fromSeriesTimer({
          'RecordNewOnly': true,
          'SkipEpisodesInLibrary': false,
        }),
        SeriesRecordingEpisodes.newOnly,
      );
    });

    test('new-only wins when the library skip flag is also on', () {
      expect(
        SeriesRecordingEpisodes.fromSeriesTimer({
          'RecordNewOnly': true,
          'SkipEpisodesInLibrary': true,
        }),
        SeriesRecordingEpisodes.newOnly,
      );
    });

    test('skipping episodes in the library alone means not already recorded', () {
      expect(
        SeriesRecordingEpisodes.fromSeriesTimer({
          'RecordNewOnly': false,
          'SkipEpisodesInLibrary': true,
        }),
        SeriesRecordingEpisodes.notRecorded,
      );
    });

    test('neither flag, or a rule without them, records all episodes', () {
      expect(
        SeriesRecordingEpisodes.fromSeriesTimer({
          'RecordNewOnly': false,
          'SkipEpisodesInLibrary': false,
        }),
        SeriesRecordingEpisodes.all,
      );
      expect(
        SeriesRecordingEpisodes.fromSeriesTimer(const {}),
        SeriesRecordingEpisodes.all,
      );
    });

    test('settings carry both flags for each choice', () {
      expect(SeriesRecordingEpisodes.all.settings, {
        'RecordNewOnly': false,
        'SkipEpisodesInLibrary': false,
      });
      expect(SeriesRecordingEpisodes.notRecorded.settings, {
        'RecordNewOnly': false,
        'SkipEpisodesInLibrary': true,
      });
      expect(SeriesRecordingEpisodes.newOnly.settings, {
        'RecordNewOnly': true,
        'SkipEpisodesInLibrary': true,
      });
    });

    test('every choice reads back as itself from its own settings', () {
      for (final choice in SeriesRecordingEpisodes.values) {
        expect(SeriesRecordingEpisodes.fromSeriesTimer(choice.settings), choice);
      }
    });
  });

  group('LiveTvRecordingIcon', () {
    Future<Icon> pumpIcon(
      WidgetTester tester, {
      required bool hasTimer,
      required bool hasSeriesTimer,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LiveTvRecordingIcon(
            hasTimer: hasTimer,
            hasSeriesTimer: hasSeriesTimer,
            size: 16,
          ),
        ),
      );
      return tester.widget<Icon>(find.byType(Icon));
    }

    test('shows for a timer or a series rule, and not for neither', () {
      expect(
        LiveTvRecordingIcon.shows(hasTimer: true, hasSeriesTimer: true),
        isTrue,
      );
      expect(
        LiveTvRecordingIcon.shows(hasTimer: false, hasSeriesTimer: true),
        isTrue,
      );
      expect(
        LiveTvRecordingIcon.shows(hasTimer: true, hasSeriesTimer: false),
        isTrue,
      );
      expect(
        LiveTvRecordingIcon.shows(hasTimer: false, hasSeriesTimer: false),
        isFalse,
      );
    });

    testWidgets('a series rule with a timer draws the series icon in red', (
      tester,
    ) async {
      final icon = await pumpIcon(tester, hasTimer: true, hasSeriesTimer: true);
      expect(icon.icon, Icons.fiber_smart_record);
      expect(icon.color, LiveTvRecordingIcon.recordColor);
    });

    testWidgets('a series rule that skips this airing draws it in grey', (
      tester,
    ) async {
      final icon = await pumpIcon(
        tester,
        hasTimer: false,
        hasSeriesTimer: true,
      );
      expect(icon.icon, Icons.fiber_smart_record);
      expect(icon.color, LiveTvRecordingIcon.skippedColor);
    });

    testWidgets('a one-off timer draws a single red dot', (tester) async {
      final icon = await pumpIcon(
        tester,
        hasTimer: true,
        hasSeriesTimer: false,
      );
      expect(icon.icon, Icons.fiber_manual_record);
      expect(icon.color, LiveTvRecordingIcon.recordColor);
    });
  });

  group('TimerItem.isUpcoming', () {
    final now = DateTime(2026, 10, 21, 12);

    TimerItem timer({String? status, DateTime? end}) => TimerItem.fromJson({
      'Id': 't',
      'Name': 'Timer',
      'Status': ?status,
      'EndDate': ?end?.toUtc().toIso8601String(),
    });

    test('cancelled, completed and failed timers are not upcoming', () {
      for (final status in ['Cancelled', 'Completed', 'Error']) {
        expect(
          timer(
            status: status,
            end: now.add(const Duration(hours: 1)),
          ).isUpcoming(now),
          isFalse,
          reason: '$status timer should be hidden',
        );
      }
    });

    test('new and in-progress timers are upcoming', () {
      for (final status in ['New', 'InProgress']) {
        expect(
          timer(
            status: status,
            end: now.add(const Duration(hours: 1)),
          ).isUpcoming(now),
          isTrue,
          reason: '$status timer should show',
        );
      }
    });

    test('a timer whose end date has passed is not upcoming', () {
      expect(
        timer(
          status: 'New',
          end: now.subtract(const Duration(minutes: 1)),
        ).isUpcoming(now),
        isFalse,
      );
    });

    test('a timer without an end date is upcoming', () {
      expect(timer(status: 'New').isUpcoming(now), isTrue);
      expect(timer().isUpcoming(now), isTrue);
    });
  });

  group('scheduled timers hide the ones that will not record', () {
    late _MockClient client;
    late _MockLiveTvApi liveTv;

    setUp(() {
      client = _MockClient();
      liveTv = _MockLiveTvApi();
      when(() => client.liveTvApi).thenReturn(liveTv);
      when(() => liveTv.getTimers()).thenAnswer(
        (_) async => {
          'Items': [
            _timer('new', 'New'),
            _timer('running', 'InProgress'),
            _timer('cancelled', 'Cancelled'),
            _timer('completed', 'Completed'),
            _timer('error', 'Error'),
            _timer('past', 'New', endsIn: const Duration(minutes: -30)),
          ],
        },
      );
      when(
        () => liveTv.getRecordings(
          limit: any(named: 'limit'),
          fields: any(named: 'fields'),
          enableImages: any(named: 'enableImages'),
          isSeries: any(named: 'isSeries'),
          isMovie: any(named: 'isMovie'),
          isSports: any(named: 'isSports'),
          isKids: any(named: 'isKids'),
        ),
      ).thenAnswer((_) async => {'Items': <dynamic>[]});
    });

    test('the schedule lists only timers that are still to record', () async {
      final vm = ScheduleViewModel(client);
      await vm.load();

      expect(vm.state, ScheduleState.ready);
      final ids = [for (final g in vm.groups) for (final i in g.items) i.id];
      expect(ids, unorderedEquals(['new', 'running']));
    });

    test('a refresh re-reads the schedule without showing it loading', () async {
      final vm = ScheduleViewModel(client);
      await vm.load();
      final states = <ScheduleState>[];
      vm.addListener(() => states.add(vm.state));

      await vm.refresh();

      expect(states, isNot(contains(ScheduleState.loading)));
      expect(vm.state, ScheduleState.ready);
    });

    test('a read finishing after a newer one does not bring back its list', () async {
      final vm = ScheduleViewModel(client);
      await vm.load();
      final older = Completer<Map<String, dynamic>>();
      final newer = Completer<Map<String, dynamic>>();
      final replies = [older, newer];
      when(() => liveTv.getTimers()).thenAnswer((_) => replies.removeAt(0).future);

      final first = vm.refresh();
      final second = vm.refresh();
      newer.complete({
        'Items': [_timer('new', 'New')],
      });
      await second;
      older.complete({
        'Items': [_timer('new', 'New'), _timer('since-cancelled', 'New')],
      });
      await first;

      final ids = [for (final g in vm.groups) for (final i in g.items) i.id];
      expect(ids, ['new']);
    });

    test('a read started before a cancel does not bring the timer back', () async {
      final vm = ScheduleViewModel(client);
      await vm.load();
      final older = Completer<Map<String, dynamic>>();
      when(() => liveTv.getTimers()).thenAnswer((_) => older.future);
      when(() => liveTv.cancelTimer(any())).thenAnswer((_) async {});

      final stale = vm.refresh();
      await vm.cancelTimer('running');
      older.complete({
        'Items': [_timer('new', 'New'), _timer('running', 'InProgress')],
      });
      await stale;

      final ids = [for (final g in vm.groups) for (final i in g.items) i.id];
      expect(ids, ['new']);
    });

    test('a failed refresh does not stop the first load finishing', () async {
      final vm = ScheduleViewModel(client);
      final initial = Completer<Map<String, dynamic>>();
      final replies = [initial.future, Future<Map<String, dynamic>>.error(Exception('offline'))];
      when(() => liveTv.getTimers()).thenAnswer((_) => replies.removeAt(0));

      final loading = vm.load();
      await vm.refresh();
      initial.complete({
        'Items': [_timer('new', 'New')],
      });
      await loading;

      expect(vm.state, ScheduleState.ready);
      expect(vm.groups.single.items.single.id, 'new');
    });

    test('the Recordings scheduled row lists only timers still to record', () async {
      final vm = RecordingsViewModel(client);
      await vm.load();

      expect(vm.state, RecordingsState.ready);
      expect(
        vm.scheduledNext24h.map((r) => r.id),
        unorderedEquals(['new', 'running']),
      );
    });

    test('refreshing the scheduled row applies the same filter', () async {
      final vm = RecordingsViewModel(client);
      await vm.refreshScheduled();

      expect(
        vm.scheduledNext24h.map((r) => r.id),
        unorderedEquals(['new', 'running']),
      );
    });
  });

  group('series rules', () {
    late _MockClient client;
    late _MockLiveTvApi liveTv;

    Map<String, dynamic> rules(List<String> ids) => {
      'Items': [
        for (final id in ids) {'Id': id, 'Name': 'Rule $id'},
      ],
    };

    setUp(() {
      client = _MockClient();
      liveTv = _MockLiveTvApi();
      when(() => client.liveTvApi).thenReturn(liveTv);
      when(() => liveTv.getSeriesTimers()).thenAnswer((_) async => rules(['a']));
    });

    test('a refresh re-reads the rules without showing them loading', () async {
      final vm = SeriesRecordingsViewModel(client);
      await vm.load();
      when(() => liveTv.getSeriesTimers()).thenAnswer((_) async => rules(['a', 'b']));
      final states = <SeriesRecordingsState>[];
      vm.addListener(() => states.add(vm.state));

      await vm.refresh();

      expect(states, isNot(contains(SeriesRecordingsState.loading)));
      expect(vm.seriesTimers.map((t) => t.id), ['a', 'b']);
    });

    test('a read finishing after a newer one does not bring back its list', () async {
      final vm = SeriesRecordingsViewModel(client);
      await vm.load();
      final older = Completer<Map<String, dynamic>>();
      final newer = Completer<Map<String, dynamic>>();
      final replies = [older, newer];
      when(() => liveTv.getSeriesTimers()).thenAnswer((_) => replies.removeAt(0).future);

      final first = vm.refresh();
      final second = vm.refresh();
      newer.complete(rules(['a']));
      await second;
      older.complete(rules(['a', 'since-cancelled']));
      await first;

      expect(vm.seriesTimers.map((t) => t.id), ['a']);
    });

    test('a read started before a cancel does not bring the rule back', () async {
      when(() => liveTv.getSeriesTimers()).thenAnswer((_) async => rules(['a', 'b']));
      final vm = SeriesRecordingsViewModel(client);
      await vm.load();
      final older = Completer<Map<String, dynamic>>();
      when(() => liveTv.getSeriesTimers()).thenAnswer((_) => older.future);
      when(() => liveTv.cancelSeriesTimer(any())).thenAnswer((_) async {});

      final stale = vm.refresh();
      await vm.cancelSeriesTimer('b');
      older.complete(rules(['a', 'b']));
      await stale;

      expect(vm.seriesTimers.map((t) => t.id), ['a']);
    });
  });

  group('changeSeriesRecordingEpisodes', () {
    late _MockLiveTvApi liveTv;
    late Map<String, dynamic> rule;
    bool? changed;
    int revisionBefore = 0;

    setUpAll(() => registerFallbackValue(<String, dynamic>{}));

    setUp(() async {
      await GetIt.instance.reset();
      SharedPreferences.setMockInitialValues(const {});
      final store = PreferenceStore();
      await store.init();
      GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

      liveTv = _MockLiveTvApi();
      rule = {
        'Id': 'series-1',
        'Name': 'Show',
        'ChannelId': 'channel-9',
        'Days': ['Monday', 'Friday'],
        'RecordAnyTime': false,
        'RecordNewOnly': false,
        'SkipEpisodesInLibrary': true,
      };
      when(() => liveTv.getSeriesTimer('series-1')).thenAnswer((_) async => rule);
      when(() => liveTv.updateSeriesTimer(any(), any())).thenAnswer((_) async {});
      changed = null;
      revisionBefore = liveTvRecordingRevision.value;
    });

    tearDown(() => GetIt.instance.reset());

    Future<void> open(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () async {
                  changed = await changeSeriesRecordingEpisodes(
                    context: context,
                    liveTvApi: liveTv,
                    seriesTimerId: 'series-1',
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
    }

    testWidgets('a different choice saves the whole rule with the new flags', (
      tester,
    ) async {
      await open(tester);
      await tester.tap(find.text(_en.seriesRecordingNewEpisodesOnly));
      await tester.pumpAndSettle();

      expect(changed, isTrue);
      final saved =
          verify(
                () => liveTv.updateSeriesTimer('series-1', captureAny()),
              ).captured.single
              as Map<String, dynamic>;
      expect(saved, {
        ...rule,
        'RecordNewOnly': true,
        'SkipEpisodesInLibrary': true,
      });
      expect(saved['Days'], ['Monday', 'Friday']);
      expect(saved['ChannelId'], 'channel-9');
      expect(liveTvRecordingRevision.value, revisionBefore + 1);
    });

    testWidgets('picking all episodes clears both flags', (tester) async {
      await open(tester);
      await tester.tap(find.text(_en.seriesRecordingAllEpisodes));
      await tester.pumpAndSettle();

      final saved =
          verify(
                () => liveTv.updateSeriesTimer('series-1', captureAny()),
              ).captured.single
              as Map<String, dynamic>;
      expect(saved['RecordNewOnly'], false);
      expect(saved['SkipEpisodesInLibrary'], false);
    });

    testWidgets('picking the current choice saves nothing', (tester) async {
      await open(tester);
      await tester.tap(find.text(_en.seriesRecordingNotRecordedEpisodes));
      await tester.pumpAndSettle();

      expect(changed, isFalse);
      verifyNever(() => liveTv.updateSeriesTimer(any(), any()));
      expect(liveTvRecordingRevision.value, revisionBefore);
    });

    testWidgets('Cancel saves nothing', (tester) async {
      await open(tester);
      await tester.tap(find.text(_en.cancel));
      await tester.pumpAndSettle();

      expect(changed, isFalse);
      verifyNever(() => liveTv.updateSeriesTimer(any(), any()));
      expect(liveTvRecordingRevision.value, revisionBefore);
    });
  });
}
