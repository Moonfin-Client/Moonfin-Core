// Regression test for GH #1610: recording tiles could be focused with a
// D-pad/remote but never opened, because each card wrapped a GestureDetector -
// which only reacts to pointer taps - in a bare Focus with no key handling.
//
// The tab buttons on the same screen use InkWell and so already answered Enter,
// which is what made the tiles look selectively broken.
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
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockImageApi extends Mock implements ImageApi {}

const _recordingId = 'rec-1';
const _recordingName = 'Recorded Show';
const _seriesTimerName = 'Recorded Series';

/// The route the recordings tab pushes on activation, with a sentinel body so
/// the test asserts the navigation itself rather than the detail screen.
final _itemDetailKey = const ValueKey<String>('item-detail-route');

void main() {
  late _MockMediaServerClient client;
  late _MockLiveTvApi liveTvApi;

  setUp(() async {
    await GetIt.instance.reset();
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

    when(() => liveTvApi.getTimers())
        .thenAnswer((_) async => <String, dynamic>{'Items': <dynamic>[]});
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

  Future<void> pumpRecordings(WidgetTester tester) async {
    // Wide enough that the header's title plus three tab pills do not
    // overflow the Row; a TV surface is never this cramped.
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const LiveTvRecordingsScreen()),
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

  /// Focuses the card that renders [label]. The card's Focus owns an internal
  /// node, so it is reached through the element tree rather than a held node.
  void focusCardShowing(WidgetTester tester, String label) {
    Focus.of(tester.element(find.text(label))).requestFocus();
  }

  testWidgets('a recording tile opens on Enter from a remote', (tester) async {
    await pumpRecordings(tester);
    expect(find.text(_recordingName), findsOneWidget);

    focusCardShowing(tester, _recordingName);
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();

    expect(find.byKey(_itemDetailKey), findsOneWidget);
  });

  testWidgets('a recording tile opens on the TV select key', (tester) async {
    await pumpRecordings(tester);

    focusCardShowing(tester, _recordingName);
    await tester.pumpAndSettle();

    // What an Android TV remote's centre button actually reports.
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();

    expect(find.byKey(_itemDetailKey), findsOneWidget);
  });

  testWidgets('a pointer tap on a recording tile still opens it',
      (tester) async {
    await pumpRecordings(tester);

    await tester.tap(find.text(_recordingName));
    await tester.pumpAndSettle();

    expect(find.byKey(_itemDetailKey), findsOneWidget);
  });

  testWidgets('a directional key does not activate a focused tile',
      (tester) async {
    await pumpRecordings(tester);

    focusCardShowing(tester, _recordingName);
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();

    expect(find.byKey(_itemDetailKey), findsNothing);
  });

  testWidgets('a series timer tile activates on Enter from a remote',
      (tester) async {
    await pumpRecordings(tester);

    await tester.tap(find.textContaining(RegExp('Series')).first);
    await tester.pumpAndSettle();
    expect(find.text(_seriesTimerName), findsOneWidget,
        reason: 'the Series tab should list the stubbed series timer');

    focusCardShowing(tester, _seriesTimerName);
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();

    // The series card's activation opens the cancel confirmation.
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    expect(find.text(l10n.cancelSeriesRecordingQuestion), findsOneWidget);
  });
}
