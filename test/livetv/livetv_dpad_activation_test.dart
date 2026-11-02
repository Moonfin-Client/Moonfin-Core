// Issue #1610: Live TV tiles took focus from a remote but never opened, since
// each wrapped a GestureDetector, which only answers pointer taps.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/navigation/destinations.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_recordings_screen.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_schedule_screen.dart';
import 'package:moonfin/ui/screens/livetv/live_tv_series_recordings_screen.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockImageApi extends Mock implements ImageApi {}

const _recordingId = 'rec-1';
const _recordingName = 'Recorded Show';
const _seriesTimerName = 'Recorded Series';
const _scheduledName = 'Scheduled Show';

const _itemDetailKey = ValueKey<String>('item-detail-route');

void main() {
  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<PreferenceStore>(store);
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    client = _MockMediaServerClient();
    liveTvApi = _MockLiveTvApi();
    when(() => client.liveTvApi).thenReturn(liveTvApi);
    when(() => client.imageApi).thenReturn(_MockImageApi());
    when(() => client.userId).thenReturn('user');

    // Only the unfiltered call carries an item, so the Recordings tab renders
    // exactly one row with exactly one card to aim at.
    when(
      () => liveTvApi.getRecordings(
        limit: any(named: 'limit'),
        fields: any(named: 'fields'),
        enableImages: any(named: 'enableImages'),
        isSeries: any(named: 'isSeries'),
        isMovie: any(named: 'isMovie'),
        isSports: any(named: 'isSports'),
        isKids: any(named: 'isKids'),
      ),
    ).thenAnswer((invocation) async {
      final filtered = <Symbol>[#isSeries, #isMovie, #isSports, #isKids]
          .any((name) => invocation.namedArguments[name] == true);
      if (filtered) return <String, dynamic>{'Items': <dynamic>[]};
      return <String, dynamic>{
        'Items': <dynamic>[
          <String, dynamic>{'Id': _recordingId, 'Name': _recordingName},
        ],
      };
    });

    // Three days out, so the schedule screen lists it and the recordings
    // screen's next 24 hours row leaves it out.
    final start = DateTime.now().add(const Duration(days: 3));
    when(() => liveTvApi.getTimers()).thenAnswer(
      (_) async => <String, dynamic>{
        'Items': <dynamic>[
          <String, dynamic>{
            'Id': 'timer-1',
            'Name': _scheduledName,
            'StartDate': start.toUtc().toIso8601String(),
          },
        ],
      },
    );
    when(() => liveTvApi.getSeriesTimers()).thenAnswer(
      (_) async => <String, dynamic>{
        'Items': <dynamic>[
          <String, dynamic>{'Id': 'st-1', 'Name': _seriesTimerName},
        ],
      },
    );

    GetIt.instance.registerSingleton<MediaServerClient>(client);
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  Future<AppLocalizations> l10n() =>
      AppLocalizations.delegate.load(const Locale('en'));

  Future<void> pumpScreen(WidgetTester tester, Widget home) async {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => home),
        GoRoute(
          path: Destinations.itemDetail,
          builder: (_, _) =>
              Scaffold(key: _itemDetailKey, body: const SizedBox.shrink()),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> focusCardShowing(WidgetTester tester, String label) async {
    Focus.of(tester.element(find.text(label))).requestFocus();
    await tester.pumpAndSettle();
  }

  Future<void> pressKey(WidgetTester tester, LogicalKeyboardKey key) async {
    await tester.sendKeyEvent(key);
    await tester.pumpAndSettle();
  }

  group('recordings screen', () {
    testWidgets('a recording tile opens on Enter from a remote',
        (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());
      expect(find.text(_recordingName), findsOneWidget);

      await focusCardShowing(tester, _recordingName);
      await pressKey(tester, LogicalKeyboardKey.enter);

      expect(find.byKey(_itemDetailKey), findsOneWidget);
    });

    testWidgets('a recording tile opens on the TV select key', (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());

      await focusCardShowing(tester, _recordingName);

      // An Android TV remote's centre button.
      await pressKey(tester, LogicalKeyboardKey.select);

      expect(find.byKey(_itemDetailKey), findsOneWidget);
    });

    testWidgets('a pointer tap on a recording tile still opens it',
        (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());

      await tester.tap(find.text(_recordingName));
      await tester.pumpAndSettle();

      expect(find.byKey(_itemDetailKey), findsOneWidget);
    });

    testWidgets('a directional key does not activate a focused tile',
        (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());

      await focusCardShowing(tester, _recordingName);
      await pressKey(tester, LogicalKeyboardKey.arrowRight);

      expect(find.byKey(_itemDetailKey), findsNothing);
    });

    testWidgets('a series timer tile activates on Enter from a remote',
        (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());

      await tester.tap(find.textContaining((await l10n()).seriesRecordings));
      await tester.pumpAndSettle();
      expect(find.text(_seriesTimerName), findsOneWidget,
          reason: 'the Series tab should list the stubbed series timer');

      await focusCardShowing(tester, _seriesTimerName);
      await pressKey(tester, LogicalKeyboardKey.enter);

      expect(find.text((await l10n()).seriesRecordingSettings),
          findsOneWidget,
          reason: 'Enter should open the series recording options');
      expect(find.text((await l10n()).cancelSeriesRecording), findsOneWidget);
    });

    testWidgets('the Series tab picks up a rule added while it is open',
        (tester) async {
      await pumpScreen(tester, const LiveTvRecordingsScreen());
      await tester.tap(find.textContaining((await l10n()).seriesRecordings));
      await tester.pumpAndSettle();

      when(() => liveTvApi.getSeriesTimers()).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': <dynamic>[
            <String, dynamic>{'Id': 'st-1', 'Name': _seriesTimerName},
            <String, dynamic>{'Id': 'st-2', 'Name': 'Added Series'},
          ],
        },
      );
      notifyLiveTvRecordingsChanged();
      await tester.pumpAndSettle();

      expect(find.text('Added Series'), findsOneWidget);
    });

    testWidgets('the recordings header fits a phone screen', (tester) async {
      tester.view.physicalSize = const Size(412, 915);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await pumpScreen(tester, const LiveTvRecordingsScreen());

      expect(tester.takeException(), isNull);
    });
  });

  group('schedule screen', () {
    testWidgets('a scheduled tile activates on Enter from a remote',
        (tester) async {
      await pumpScreen(tester, const LiveTvScheduleScreen());
      expect(find.text(_scheduledName), findsOneWidget);

      await focusCardShowing(tester, _scheduledName);
      await pressKey(tester, LogicalKeyboardKey.enter);

      expect(find.text((await l10n()).cancelRecording), findsOneWidget);
    });

    testWidgets('a scheduled tile activates on the TV select key',
        (tester) async {
      await pumpScreen(tester, const LiveTvScheduleScreen());

      await focusCardShowing(tester, _scheduledName);
      await pressKey(tester, LogicalKeyboardKey.select);

      expect(find.text((await l10n()).cancelRecording), findsOneWidget);
    });

    testWidgets('a directional key does not activate a scheduled tile',
        (tester) async {
      await pumpScreen(tester, const LiveTvScheduleScreen());

      await focusCardShowing(tester, _scheduledName);
      await pressKey(tester, LogicalKeyboardKey.arrowRight);

      expect(find.text((await l10n()).cancelRecording), findsNothing);
    });
  });

  group('moving up the schedule brings each row title back into view', () {
    // Five rows, a day apart, so the list scrolls.
    void serveFiveDays() {
      final first = DateTime.now().add(const Duration(hours: 1));
      when(() => liveTvApi.getTimers()).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': <dynamic>[
            for (var day = 0; day < 5; day++)
              <String, dynamic>{
                'Id': 'timer-$day',
                'Name': 'Show $day',
                'StartDate': first
                    .add(Duration(days: day))
                    .toUtc()
                    .toIso8601String(),
              },
          ],
        },
      );
    }

    Future<void> moveDownAndBackUp(WidgetTester tester) async {
      final list = find.byWidgetPredicate(
        (w) => w is Scrollable && w.axisDirection == AxisDirection.down,
      );
      double offset() =>
          tester.state<ScrollableState>(list.first).position.pixels;

      await focusCardShowing(tester, 'Show 0');
      for (var i = 0; i < 4; i++) {
        await pressKey(tester, LogicalKeyboardKey.arrowDown);
      }
      expect(offset(), greaterThan(0));

      for (var i = 0; i < 4; i++) {
        await pressKey(tester, LogicalKeyboardKey.arrowUp);
      }

      expect(offset(), 0);
    }

    testWidgets('on the Recordings Schedule tab', (tester) async {
      serveFiveDays();
      await pumpScreen(tester, const LiveTvRecordingsScreen());
      await tester.tap(find.text('${(await l10n()).schedule} (5)'));
      await tester.pumpAndSettle();

      await moveDownAndBackUp(tester);
    });

    testWidgets('on the Schedule screen', (tester) async {
      serveFiveDays();
      await pumpScreen(tester, const LiveTvScheduleScreen());

      await moveDownAndBackUp(tester);
    });

    testWidgets('keeps the card in view when a row is taller than the list',
        (tester) async {
      // A large UI scale on a short screen.
      tester.view.physicalSize = const Size(800, 300);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.6;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      serveFiveDays();
      await pumpScreen(tester, const LiveTvScheduleScreen());

      final list = find.byWidgetPredicate(
        (w) => w is Scrollable && w.axisDirection == AxisDirection.down,
      );
      final viewport = tester.getRect(list.first);
      await focusCardShowing(tester, 'Show 0');
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      await pressKey(tester, LogicalKeyboardKey.arrowDown);
      await pressKey(tester, LogicalKeyboardKey.arrowUp);

      final card = tester.getRect(
        find.descendant(of: list.first, matching: find.text('Show 1')),
      );
      expect(card.top, greaterThanOrEqualTo(viewport.top));
      expect(card.bottom, lessThanOrEqualTo(viewport.bottom));
    });
  });

  group('cancelling a scheduled recording', () {
    // Jellyfin includes the timer's program under the program's own id.
    void serveTimerWithProgram() {
      final start = DateTime.now().add(const Duration(hours: 1));
      when(() => liveTvApi.getTimers()).thenAnswer(
        (_) async => <String, dynamic>{
          'Items': <dynamic>[
            <String, dynamic>{
              'Id': 'timer-1',
              'Name': _scheduledName,
              'StartDate': start.toUtc().toIso8601String(),
              'ProgramInfo': <String, dynamic>{
                'Id': 'program-1',
                'Name': _scheduledName,
                'TimerId': 'timer-1',
                'StartDate': start.toUtc().toIso8601String(),
              },
            },
          ],
        },
      );
      when(() => liveTvApi.cancelTimer(any())).thenAnswer((_) async {});
    }

    Future<void> cancel(WidgetTester tester) async {
      await focusCardShowing(tester, _scheduledName);
      await pressKey(tester, LogicalKeyboardKey.enter);
      await tester.tap(find.text((await l10n()).yesCancel));
      await tester.pumpAndSettle();
    }

    testWidgets('the Schedule screen cancels by the timer id', (tester) async {
      serveTimerWithProgram();
      await pumpScreen(tester, const LiveTvScheduleScreen());

      await cancel(tester);

      verify(() => liveTvApi.cancelTimer('timer-1')).called(1);
      expect(find.text((await l10n()).failedToCancelRecording), findsNothing);
    });

    testWidgets('the Recordings Schedule tab cancels by the timer id',
        (tester) async {
      serveTimerWithProgram();
      await pumpScreen(tester, const LiveTvRecordingsScreen());
      await tester.tap(find.text('${(await l10n()).schedule} (1)'));
      await tester.pumpAndSettle();

      await cancel(tester);

      verify(() => liveTvApi.cancelTimer('timer-1')).called(1);
      expect(find.text((await l10n()).failedToCancelRecording), findsNothing);
    });
  });

  group('series recordings screen', () {
    testWidgets('a series tile activates on Enter from a remote',
        (tester) async {
      await pumpScreen(tester, const LiveTvSeriesRecordingsScreen());
      expect(find.text(_seriesTimerName), findsWidgets);

      await focusCardShowing(tester, _seriesTimerName);
      await pressKey(tester, LogicalKeyboardKey.enter);

      // The tile's name already appears twice (card plus focused-item HUD), so
      // assert on the options dialog's own action instead of a name count.
      expect(find.text((await l10n()).cancelSeriesRecording), findsOneWidget);
    });

    testWidgets('a series tile activates on the TV select key', (tester) async {
      await pumpScreen(tester, const LiveTvSeriesRecordingsScreen());

      await focusCardShowing(tester, _seriesTimerName);
      await pressKey(tester, LogicalKeyboardKey.select);

      expect(find.text((await l10n()).cancelSeriesRecording), findsOneWidget);
    });

    testWidgets('a directional key does not activate a series tile',
        (tester) async {
      await pumpScreen(tester, const LiveTvSeriesRecordingsScreen());

      await focusCardShowing(tester, _seriesTimerName);
      await pressKey(tester, LogicalKeyboardKey.arrowRight);

      expect(find.text((await l10n()).cancelSeriesRecording), findsNothing);
    });
  });
}
