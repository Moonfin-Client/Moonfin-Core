// Issue #1610: Live TV tiles took focus from a remote but never opened, since
// each wrapped a GestureDetector, which only answers pointer taps.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
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

      expect(find.text((await l10n()).cancelSeriesRecordingQuestion),
          findsOneWidget);
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
