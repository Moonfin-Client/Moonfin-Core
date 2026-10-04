import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/ui/widgets/live_tv/live_tv_recording_dialog.dart';

void main() {
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
              backgroundColor: color.withValues(alpha: 0.65),
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
    expect(
      tester.widget<Material>(dialog).color,
      Colors.blueGrey.withValues(alpha: 0.65),
    );
    surface.value = Colors.deepPurple;
    await tester.pumpAndSettle();
    expect(
      tester.widget<Material>(dialog).color,
      Colors.deepPurple.withValues(alpha: 0.65),
    );
    expect(find.text('Record This Episode'), findsOneWidget);
    expect(find.text('Exit'), findsOneWidget);
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

    testWidgets('a non-series program offers only current-program recording', (
      tester,
    ) async {
      await open(tester, isSeries: false);
      expect(find.text('Record This Program'), findsOneWidget);
      expect(find.text('Record Series'), findsNothing);
      await tester.tap(find.text('Exit'));
      await tester.pumpAndSettle();
      expect(completed, isTrue);
      expect(result, isNull);
      expect(opener.hasFocus, isTrue);
    });

    testWidgets('D-pad Select activates Exit and restores focus', (
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
          'Series recording scheduled; no upcoming episodes in the guide',
        ),
        findsOneWidget,
      );
      expect(find.textContaining('Next series recording:'), findsNothing);
    });

    testWidgets('D-pad can choose series recording from the default Exit', (
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
}
