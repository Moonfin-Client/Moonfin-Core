import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/live_tv/live_tv_recording_dialog.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockLiveTvApi extends Mock implements LiveTvApi {}

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
  });

  tearDown(() => GetIt.instance.reset());

  group('current program recording state', () {
    const program = {'Id': 'program-1', 'TimerId': 'timer-1'};

    test('only an in-progress timer marks the program as recording', () {
      final scheduled = LiveTvRecordingState.fromProgram(program, [
        {'Id': 'timer-1', 'Status': 'New'},
      ]);
      expect(scheduled.timerId, 'timer-1');
      expect(scheduled.isRecording, isFalse);

      final active = LiveTvRecordingState.fromProgram(program, [
        {'Id': 'timer-1', 'Status': 'InProgress', 'SeriesTimerId': 'series-1'},
      ]);
      expect(active.isRecording, isTrue);
      expect(active.seriesTimerId, 'series-1');
    });

    test('a cancelled timer in stale guide data is not cancellable again', () {
      final state = LiveTvRecordingState.fromProgram(program, [
        {'Id': 'timer-1', 'Status': 'Cancelled'},
        {'ProgramId': 'another-program', 'Id': 'other', 'Status': 'InProgress'},
      ]);
      expect(state.timerId, isNull);
      expect(state.isRecording, isFalse);
    });

    test('finds a timer created after the guide was fetched', () {
      final state = LiveTvRecordingState.fromProgram(
        {'Id': 'abc-def'},
        [
          {'ProgramId': 'abcdef', 'Id': 'new-timer', 'Status': 'InProgress'},
        ],
      );
      expect(state.timerId, 'new-timer');
      expect(state.isRecording, isTrue);
    });

    test('an active timer takes precedence over another pending timer', () {
      final state = LiveTvRecordingState.fromProgram(program, [
        {'ProgramId': 'program-1', 'Id': 'pending', 'Status': 'New'},
        {'ProgramId': 'program-1', 'Id': 'active', 'Status': 'InProgress'},
      ]);
      expect(state.timerId, 'active');
      expect(state.isRecording, isTrue);
    });

    test('retains the series rule after one episode has been cancelled', () {
      final state = LiveTvRecordingState.fromProgram({
        'Id': 'program-1',
        'SeriesTimerId': 'series-1',
      }, []);
      expect(state.timerId, isNull);
      expect(state.seriesTimerId, 'series-1');
    });

    test('next series recording is the earliest future pending episode', () {
      final state = LiveTvRecordingState.fromProgram(
        {'Id': 'current', 'SeriesTimerId': 'series-1'},
        [
          {
            'SeriesTimerId': 'series-1',
            'Status': 'New',
            'StartDate': '2026-10-06T20:00:00Z',
          },
          {
            'SeriesTimerId': 'other',
            'Status': 'New',
            'StartDate': '2026-10-04T21:00:00Z',
          },
          {
            'SeriesTimerId': 'series-1',
            'Status': 'Cancelled',
            'StartDate': '2026-10-04T22:00:00Z',
          },
          {
            'SeriesTimerId': 'series-1',
            'Status': 'InProgress',
            'StartDate': '2026-10-04T19:30:00Z',
          },
          {
            'SeriesTimerId': 'series-1',
            'Status': 'New',
            'StartDate': '2026-10-03T20:00:00Z',
          },
          {
            'SeriesTimerId': 'series1',
            'Status': 'New',
            'StartDate': '2026-10-05T20:00:00Z',
          },
          {
            'SeriesTimerId': 'series-1',
            'Status': 'New',
            'StartDate': 'invalid',
          },
        ],
        now: DateTime.utc(2026, 10, 4, 20),
      );
      expect(state.nextSeriesRecording, DateTime.utc(2026, 10, 5, 20));
    });

    test('a series rule can exist without a future episode in the guide', () {
      final state = LiveTvRecordingState.fromProgram(
        {'Id': 'current', 'SeriesTimerId': 'series-1'},
        [],
        now: DateTime.utc(2026, 10, 4),
      );
      expect(state.seriesTimerId, 'series-1');
      expect(state.nextSeriesRecording, isNull);
    });
  });

  testWidgets('an open recording dialog follows application theme changes', (
    tester,
  ) async {
    final surface = ValueNotifier<Color>(Colors.blueGrey);
    addTearDown(surface.dispose);
    await tester.pumpWidget(
      ValueListenableBuilder<Color>(
        valueListenable: surface,
        builder: (context, color, child) => MaterialApp(
          theme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(surface: color),
            dialogTheme: DialogThemeData(
              backgroundColor: color,
              surfaceTintColor: Colors.transparent,
            ),
          ),
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () => showLiveTvRecordingDialog(
                  context: context,
                  programName: 'Current Show',
                  isSeries: true,
                  recording: const LiveTvRecordingState(),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    final dialog = find
        .ancestor(
          of: find.text('Current Show'),
          matching: find.byType(Material),
        )
        .first;
    expect(tester.widget<Material>(dialog).color, Colors.blueGrey);
    surface.value = Colors.deepPurple;
    await tester.pumpAndSettle();
    expect(tester.widget<Material>(dialog).color, Colors.deepPurple);
    expect(find.text('Record This Episode'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
  });

  group('recording dialog', () {
    late FocusNode opener;
    LiveTvRecordingAction? result;
    bool completed = false;

    setUp(() {
      opener = FocusNode();
      result = null;
      completed = false;
    });

    tearDown(() => opener.dispose());

    Future<void> open(
      WidgetTester tester, {
      bool isSeries = true,
      LiveTvRecordingState recording = const LiveTvRecordingState(),
      bool use24HourClock = false,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                focusNode: opener,
                onPressed: () async {
                  result = await showLiveTvRecordingDialog(
                    context: context,
                    programName: 'Current Show',
                    isSeries: isSeries,
                    recording: recording,
                    use24HourClock: use24HourClock,
                  );
                  completed = true;
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      opener.requestFocus();
      await tester.pump();
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
    }

    testWidgets('offers episode and series recording as separate actions', (
      tester,
    ) async {
      await open(tester);
      expect(find.text('Record This Episode'), findsOneWidget);
      expect(find.text('Record Series'), findsOneWidget);
      await tester.tap(find.text('Record Series'));
      await tester.pumpAndSettle();
      expect(result, LiveTvRecordingAction.recordSeries);
      expect(opener.hasFocus, isTrue);
    });

    testWidgets(
      'current-program recording is independent of series recording',
      (tester) async {
        await open(tester);
        await tester.tap(find.text('Record This Episode'));
        await tester.pumpAndSettle();
        expect(result, LiveTvRecordingAction.recordProgram);
      },
    );

    for (final series in [false, true]) {
      testWidgets('active recording offers applicable cancellation ($series)', (
        tester,
      ) async {
        await open(
          tester,
          recording: LiveTvRecordingState(
            timerId: 'timer-1',
            seriesTimerId: series ? 'series-1' : null,
            isRecording: true,
          ),
        );
        expect(find.text('Cancel This Recording'), findsOneWidget);
        expect(
          find.text('Record Series'),
          series ? findsNothing : findsOneWidget,
        );
        expect(
          find.text('Cancel Series Recording'),
          series ? findsOneWidget : findsNothing,
        );
        await tester.tap(
          find.text(
            series ? 'Cancel Series Recording' : 'Cancel This Recording',
          ),
        );
        await tester.pumpAndSettle();
        expect(
          result,
          series
              ? LiveTvRecordingAction.cancelSeries
              : LiveTvRecordingAction.cancelProgram,
        );
      });
    }

    testWidgets('can add a series rule while this episode is recording', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(
          timerId: 'timer-1',
          isRecording: true,
        ),
      );
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Record Series'), findsOneWidget);
      await tester.tap(find.text('Record Series'));
      await tester.pumpAndSettle();
      expect(result, LiveTvRecordingAction.recordSeries);
      expect(opener.hasFocus, isTrue);
    });

    testWidgets('a series rule that skips this showing says so', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(seriesTimerId: 'series-1'),
      );
      expect(
        find.text('The series recording will skip this showing'),
        findsOneWidget,
      );
      expect(find.text('Series Settings'), findsOneWidget);
    });

    testWidgets('a showing the series rule will record has no skip note', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(
          timerId: 'timer-1',
          seriesTimerId: 'series-1',
        ),
      );
      expect(
        find.text('The series recording will skip this showing'),
        findsNothing,
      );
      expect(find.text('Series Settings'), findsOneWidget);
    });

    testWidgets('Series Settings is offered only with a series rule', (
      tester,
    ) async {
      await open(tester);
      expect(find.text('Series Settings'), findsNothing);
      expect(
        find.text('The series recording will skip this showing'),
        findsNothing,
      );
    });

    testWidgets('choosing Series Settings returns the change action', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(seriesTimerId: 'series-1'),
      );
      await tester.tap(find.text('Series Settings'));
      await tester.pumpAndSettle();
      expect(result, LiveTvRecordingAction.changeSeries);
    });

    testWidgets('a non-series program offers only current-program recording', (
      tester,
    ) async {
      await open(tester, isSeries: false);
      expect(find.text('Record This Program'), findsOneWidget);
      expect(find.text('Record Series'), findsNothing);
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();
      expect(completed, isTrue);
      expect(result, isNull);
      expect(opener.hasFocus, isTrue);
    });

    testWidgets('D-pad Select activates Close and restores focus', (
      tester,
    ) async {
      await open(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();
      expect(completed, isTrue);
      expect(result, isNull);
      expect(opener.hasFocus, isTrue);
    });

    for (final use24Hour in [false, true]) {
      testWidgets('shows the next series recording in italic ($use24Hour)', (
        tester,
      ) async {
        await open(
          tester,
          use24HourClock: use24Hour,
          recording: LiveTvRecordingState(
            seriesTimerId: 'series-1',
            nextSeriesRecording: DateTime(2026, 10, 5, 20),
          ),
        );
        final expected =
            'Next series recording: Oct 5, 2026 · ${use24Hour ? '20:00' : '8:00 PM'}';
        final text = tester.widget<Text>(find.text(expected));
        expect(text.style?.fontStyle, FontStyle.italic);
        expect(find.text('Record This Episode'), findsOneWidget);
        expect(find.text('Cancel Series Recording'), findsOneWidget);
        expect(find.text('Record Series'), findsNothing);
      });
    }

    testWidgets('explains when a series has no future episode timer', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(seriesTimerId: 'series-1'),
      );
      expect(
        find.text(
          'Series recording is scheduled, but the guide has no upcoming episodes',
        ),
        findsOneWidget,
      );
      expect(find.textContaining('Next series recording:'), findsNothing);
    });

    testWidgets('D-pad can choose series recording from the default Close', (
      tester,
    ) async {
      await open(tester);
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pumpAndSettle();
      expect(completed, isTrue);
      expect(result, LiveTvRecordingAction.recordSeries);
    });

    testWidgets('Back dismisses an active-recording dialog without an action', (
      tester,
    ) async {
      await open(
        tester,
        recording: const LiveTvRecordingState(
          timerId: 'timer-1',
          seriesTimerId: 'series-1',
          isRecording: true,
        ),
      );
      await tester.sendKeyEvent(
        LogicalKeyboardKey.goBack,
        physicalKey: PhysicalKeyboardKey.escape,
      );
      await tester.pumpAndSettle();
      expect(completed, isTrue);
      expect(result, isNull);
      expect(opener.hasFocus, isTrue);
      expect(find.text('Open'), findsOneWidget);
    });
  });

  group('recording flow shared by both Live TV players', () {
    final en = AppLocalizationsEn();
    late _MockLiveTvApi api;
    String? message;
    bool finished = false;

    setUp(() {
      api = _MockLiveTvApi();
      message = null;
      finished = false;
    });

    GuideProgram airingNow() {
      final now = DateTime.now();
      return GuideProgram(
        id: 'program-1',
        channelId: 'channel-1',
        name: 'Current Show',
        startDate: now.subtract(const Duration(minutes: 10)),
        endDate: now.add(const Duration(minutes: 20)),
        rawData: const {'Id': 'program-1'},
      );
    }

    Future<void> run(
      WidgetTester tester, {
      required LiveTvRecordingState recording,
      bool stillOnProgram = true,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () async {
                  message = await runLiveTvRecordingFlow(
                    context: context,
                    liveTvApi: api,
                    program: airingNow(),
                    recording: recording,
                    programTime: '9:00 PM - 9:30 PM',
                    channel: '7 News',
                    use24HourClock: false,
                    stillOnProgram: () => stillOnProgram,
                  );
                  finished = true;
                },
                child: const Text('Record'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Record'));
      await tester.pumpAndSettle();
    }

    test('only an airing on now can be recorded', () {
      final now = DateTime.now();
      GuideProgram program(Duration startsIn, {String id = 'p'}) =>
          GuideProgram(
            id: id,
            channelId: 'c',
            name: 'Show',
            startDate: now.add(startsIn),
            endDate: now.add(startsIn + const Duration(minutes: 30)),
            rawData: const {},
          );
      expect(canRecordAiring(program(const Duration(minutes: -5))), isTrue);
      expect(canRecordAiring(program(const Duration(minutes: 5))), isFalse);
      expect(canRecordAiring(program(const Duration(hours: -1))), isFalse);
      expect(
        canRecordAiring(program(const Duration(minutes: -5), id: '')),
        isFalse,
      );
      expect(canRecordAiring(null), isFalse);
    });

    testWidgets('cancelling this recording reports it and tells the others', (
      tester,
    ) async {
      when(() => api.cancelTimer(any())).thenAnswer((_) async {});
      final revision = liveTvRecordingRevision.value;
      await run(
        tester,
        recording: const LiveTvRecordingState(
          timerId: 'timer-1',
          isRecording: true,
        ),
      );
      await tester.tap(find.text(en.cancelCurrentRecording));
      await tester.pumpAndSettle();
      expect(finished, isTrue);
      verify(() => api.cancelTimer('timer-1')).called(1);
      expect(message, en.recordingCancelled);
      expect(liveTvRecordingRevision.value, revision + 1);
    });

    testWidgets('closing the dialog changes nothing', (tester) async {
      await run(tester, recording: const LiveTvRecordingState());
      await tester.tap(find.text(en.close));
      await tester.pumpAndSettle();
      expect(finished, isTrue);
      expect(message, isNull);
      verifyZeroInteractions(api);
    });

    testWidgets('a player that left the airing drops the choice', (
      tester,
    ) async {
      await run(
        tester,
        recording: const LiveTvRecordingState(timerId: 'timer-1'),
        stillOnProgram: false,
      );
      await tester.tap(find.text(en.cancelCurrentRecording));
      await tester.pumpAndSettle();
      expect(finished, isTrue);
      expect(message, isNull);
      verifyZeroInteractions(api);
    });

    testWidgets('a failed request says what failed', (tester) async {
      when(() => api.cancelTimer(any())).thenThrow(Exception('offline'));
      await run(
        tester,
        recording: const LiveTvRecordingState(timerId: 'timer-1'),
      );
      await tester.tap(find.text(en.cancelCurrentRecording));
      await tester.pumpAndSettle();
      expect(message, en.failedToCancelRecording);
    });
  });
}
