import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'
    show CupertinoAlertDialog, CupertinoDialogAction;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/incomplete_recordings_service.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/ui/widgets/live_tv/incomplete_recording.dart';
import 'package:moonfin/util/idiom/app_ui_idiom.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

/// Answers the plugin's endpoints with [incomplete] and records each request.
class _PluginAdapter implements HttpClientAdapter {
  List<Map<String, dynamic>> incomplete = [];
  final requests = <String>[];
  Map<String, dynamic> options = {};
  Object? lastPost;
  Completer<void>? optionsGate;

  /// Holds each list read back until it completes, when set.
  Completer<void>? gate;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add('${options.method} ${options.uri.path}');
    final isList = options.uri.path.endsWith('/Incomplete');
    final isOptions = options.uri.path.endsWith('/Options');
    if (options.method == 'POST') lastPost = options.data;
    final body = isList
        ? jsonEncode(incomplete)
        : isOptions
        ? jsonEncode(this.options)
        : '{}';
    if (isOptions && optionsGate != null) await optionsGate!.future;
    final held = gate;
    if (isList && held != null) await held.future;
    return ResponseBody.fromString(
      body,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _incomplete(String id, {String? state, String? at}) => {
  'itemId': id,
  'recordedMinutes': 23,
  'expectedMinutes': 37,
  'state': ?state,
  'scheduledStart': state == 'scheduled' ? at : null,
  'recordedAt': state == 'recorded' ? at : null,
};

class _WorkflowService extends IncompleteRecordingsService {
  CompleteShowingOptions options;
  Completer<CompleteShowingOptions>? optionsGate;
  int scheduled = 0;
  int searches = 0;

  _WorkflowService(this.options) : super(client: () => null);

  @override
  bool get supported => true;
  @override
  bool get extendedSupported => true;
  @override
  Future<CompleteShowingOptions> completeShowingOptions(
    String programId,
  ) async => optionsGate == null ? options : await optionsGate!.future;
  @override
  Future<bool> scheduleSuggestedShowing(
    String programId,
    SuggestedShowing showing,
  ) async {
    scheduled++;
    return true;
  }

  @override
  Future<bool> requestCompleteShowing(String programId) async {
    searches++;
    return true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _PluginAdapter adapter;
  late IncompleteRecordingsService service;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));
    GetIt.instance.registerSingleton<UserRepository>(
      UserRepository()..setCurrentUser(
        PrivateUser(
          id: 'u1',
          name: 'User',
          serverId: 's1',
          accessToken: 't',
          lastUsed: DateTime(2026),
          canManageLiveTv: true,
        ),
      ),
    );

    final client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://server.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );

    adapter = _PluginAdapter();
    service = IncompleteRecordingsService(
      client: () => client,
      dio: Dio()..httpClientAdapter = adapter,
    );
    GetIt.instance.registerSingleton<IncompleteRecordingsService>(service);
  });

  tearDown(() async {
    AppUiIdiomResolver.setOverride(InterfaceStyle.automatic);
    service.dispose();
    await GetIt.instance.reset();
  });

  // Dio needs real async, which a widget test's fake clock never advances.
  Future<void> load(WidgetTester tester, List<Map<String, dynamic>> items) =>
      tester.runAsync(() async {
        adapter.incomplete = items;
        service.setSupported(true);
        await service.refresh();
      });

  Widget app(Widget child, {TargetPlatform? platform}) => MaterialApp(
    theme: ThemeData(platform: platform),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );

  Map<String, dynamic> candidate() => {
    'programId': 'future-id',
    'cancellationVersion': 'cancel-1:manual',
    'name': 'Stephen King: A Necessary Evil',
    'description': 'Interviews explore the author and his work.',
    'startDate': DateTime.now()
        .add(const Duration(days: 1))
        .toUtc()
        .toIso8601String(),
    'channelName': 'WPTODT',
    'channelNumber': '16.1',
  };

  test(
    'older plugins never receive movie or suggestion endpoint calls',
    () async {
      service.setSupported(true);
      adapter.requests.clear();
      final options = await service.completeShowingOptions('source-id');
      expect(options.canSearch, isFalse);
      expect(options.showing, isNull);
      expect(
        adapter.requests.where((p) => p.contains('CompleteShowing')),
        isEmpty,
      );
    },
  );

  test('suggestions retain the selected airing and are invalid after a server switch', () async {
    adapter.options = {'showing': candidate()};
    service.setSupported(true, extended: true);
    final options = await service.completeShowingOptions('source-id');
    expect(options.showing!.name, 'Stephen King: A Necessary Evil');
    expect(
      await service.scheduleSuggestedShowing('source-id', options.showing!),
      isTrue,
    );
    final sent = adapter.lastPost as Map;
    expect(sent['programId'], 'source-id');
    expect((sent['showing'] as Map)['programId'], 'future-id');
    expect((sent['showing'] as Map)['cancellationVersion'], 'cancel-1:manual');
    service.setSupported(false);
    service.setSupported(true, extended: true);
    expect(
      await service.scheduleSuggestedShowing('source-id', options.showing!),
      isFalse,
    );
  });

  test(
    'dismissing another item does not invalidate a confirmed airing',
    () async {
      adapter.options = {'showing': candidate()};
      service.setSupported(true, extended: true);
      final offered = (await service.completeShowingOptions('source-id'))
          .showing!;
      expect(await service.dismiss('unrelated-item'), isTrue);
      expect(
        await service.scheduleSuggestedShowing('source-id', offered),
        isTrue,
      );
    },
  );

  test('an options response from an old session is discarded', () async {
    adapter.options = {'canSearch': true, 'showing': candidate()};
    adapter.optionsGate = Completer<void>();
    service.setSupported(true, extended: true);
    final pending = service.completeShowingOptions('source-id');
    await Future<void>.delayed(Duration.zero);
    service.setSupported(false);
    adapter.optionsGate!.complete();
    final options = await pending;
    expect(options.canSearch, isFalse);
    expect(options.showing, isNull);
  });

  test('incomplete or expired suggestion payloads are ignored', () async {
    service.setSupported(true, extended: true);
    for (final bad in [
      {...candidate(), 'description': ''},
      {...candidate(), 'startDate': 'invalid'},
      {
        ...candidate(),
        'startDate': DateTime.now()
            .subtract(const Duration(days: 1))
            .toUtc()
            .toIso8601String(),
      },
    ]) {
      adapter.options = {'showing': bad};
      expect(
        (await service.completeShowingOptions('source-id')).showing,
        isNull,
      );
    }
    adapter.options = {
      'canSearch': true,
      'showing': {...candidate(), 'description': ''},
    };
    expect(
      (await service.completeShowingOptions('source-id')).showing,
      isNotNull,
    );
    adapter.options = {'canSearch': true};
    expect(
      (await service.completeShowingOptions('source-id')).canSearch,
      isTrue,
    );
  });

  for (final platform in [TargetPlatform.iOS, TargetPlatform.macOS]) {
    testWidgets('future-airing dialog lays out on $platform', (tester) async {
      AppUiIdiomResolver.setOverride(InterfaceStyle.apple);
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showRecordPrompt(
                context: context,
                programName: 'Current program',
                airing: RecordPromptAiring(
                  start: DateTime.now().subtract(const Duration(minutes: 5)),
                  description: 'A long description. ' * 20,
                ),
                suggestion: SuggestedShowing(
                  candidate(),
                  0,
                  DateTime.now().add(const Duration(days: 1)),
                ),
                searchForCompleteShowing: false,
              ),
              child: const Text('Record'),
            ),
          ),
          platform: platform,
        ),
      );
      await tester.tap(find.text('Record'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(find.byType(CupertinoDialogAction), findsNWidgets(3));
      expect(find.text('Record Tomorrow Only'), findsOneWidget);
      expect(find.text('Record Now and Tomorrow'), findsOneWidget);
      await tester.ensureVisible(find.text('Record Now Only'));
      await tester.tap(find.text('Record Now Only'));
      await tester.pumpAndSettle();
      expect(find.byType(CupertinoAlertDialog), findsNothing);
    });
  }

  for (final differ in [false, true]) {
    testWidgets(
      'the prompt shows both descriptions and flags a difference: $differ',
      (tester) async {
        await tester.pumpWidget(
          app(
            Builder(
              builder: (context) => TextButton(
                onPressed: () => showRecordPrompt(
                  context: context,
                  programName: 'Insight',
                  airing: RecordPromptAiring(
                    start: DateTime.now().subtract(const Duration(minutes: 12)),
                    end: DateTime.now().add(const Duration(minutes: 18)),
                    channel: '25.9 WBQCLD9',
                    description: differ
                        ? 'Tonight a historian talks about bridges.'
                        : 'interviews explore  the author and his work.',
                    season: 4,
                    episode: 2,
                  ),
                  suggestion: SuggestedShowing(
                    {...candidate(), 'alreadyScheduled': !differ},
                    0,
                    DateTime.now().add(const Duration(days: 1)),
                  ),
                ),
                child: const Text('Record'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Record'));
        await tester.pumpAndSettle();

        expect(find.text('Record Insight'), findsOneWidget);
        expect(
          find.text('Already set to record'),
          differ ? findsNothing : findsOneWidget,
        );
        expect(find.text('12 min already aired'), findsOneWidget);
        expect(find.textContaining('25.9 WBQCLD9'), findsOneWidget);
        expect(
          find.textContaining(differ ? 'historian' : 'interviews explore'),
          findsOneWidget,
        );
        expect(find.textContaining('Interviews explore'), findsOneWidget);
        expect(
          find.text(
            'The descriptions differ, so this may be a different program.',
          ),
          differ ? findsOneWidget : findsNothing,
        );
        expect(
          find.text('Same episode (S4E2)'),
          differ ? findsNothing : findsOneWidget,
        );
        // A doubtful match defaults to recording only the airing now.
        final defaultChoice = find.text(
          differ ? 'Record Now Only' : 'Record Now and Tomorrow',
        );
        expect(Focus.of(tester.element(defaultChoice)).hasFocus, isTrue);
      },
    );
  }

  testWidgets(
    'at the largest UI scale on the TV canvas the question stays above the buttons',
    (tester) async {
      tester.view
        ..physicalSize = const Size(1150, 647)
        ..devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.6;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showRecordPrompt(
                context: context,
                programName: 'Modern Marvels',
                airing: RecordPromptAiring(
                  start: DateTime.now().subtract(const Duration(minutes: 6)),
                  end: DateTime.now().add(const Duration(minutes: 54)),
                  channel: '5.4 WLWTDT4',
                  description: 'A jet truck that can travel 300 mph. ' * 6,
                  season: 9,
                  episode: 37,
                ),
                suggestion: SuggestedShowing(
                  {
                    ...candidate(),
                    'description': 'A jet truck that can travel 300 mph. ' * 6,
                  },
                  0,
                  DateTime.now().add(const Duration(days: 1)),
                ),
              ),
              child: const Text('Record'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Record'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final question = find.text(
        'Also record the future showing to get a complete recording?',
      );
      expect(tester.getBottomLeft(question).dy, lessThanOrEqualTo(647));
      expect(
        tester.getBottomLeft(find.text('Same episode (S9E37)')).dy,
        lessThan(tester.getTopLeft(question).dy),
      );
      expect(
        tester.getBottomLeft(question).dy,
        lessThan(tester.getTopLeft(find.text('Record Now Only')).dy),
      );
    },
  );

  testWidgets('the button names when the future showing airs', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      app(
        Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );
    final now = DateTime(2026, 10, 23, 18);
    expect(
      laterShowingWhen(context, DateTime(2026, 10, 24, 9, 30), now: now),
      'Tomorrow',
    );
    expect(
      laterShowingWhen(context, DateTime(2026, 10, 26, 9, 30), now: now),
      'Monday',
    );
    expect(
      laterShowingWhen(context, DateTime(2026, 11, 5, 9, 30), now: now),
      'Nov 5',
    );
    expect(
      laterShowingWhen(context, DateTime(2026, 10, 23, 21, 30), now: now),
      isNot(anyOf('Tomorrow', 'Friday')),
    );
  });

  for (final answered in [true, false]) {
    testWidgets(
      'the server decides how the showing matched when it answers: $answered',
      (tester) async {
        final payload = candidate();
        final fake = _WorkflowService(
          CompleteShowingOptions(
            answered: answered,
            showing: SuggestedShowing(
              payload,
              0,
              DateTime.parse(payload['startDate'] as String).toLocal(),
            ),
          ),
        );
        await GetIt.instance.unregister<IncompleteRecordingsService>();
        GetIt.instance.registerSingleton<IncompleteRecordingsService>(fake);
        await tester.pumpWidget(
          app(
            Builder(
              builder: (context) => TextButton(
                onPressed: () => recordAiring(
                  context: context,
                  programId: 'source-id',
                  programName: payload['name'] as String,
                  programStart: DateTime.now().subtract(
                    const Duration(minutes: 5),
                  ),
                  rawProgram: const {'ParentIndexNumber': 1, 'IndexNumber': 2},
                  createTimer: () async {},
                ),
                child: const Text('Record'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Record'));
        await tester.pumpAndSettle();

        // The guide's own numbers only stand in when the server didn't answer.
        expect(
          find.textContaining('Matched by title'),
          answered ? findsOneWidget : findsNothing,
        );
        expect(
          find.text('Same episode (S1E2)'),
          answered ? findsNothing : findsOneWidget,
        );
        await tester.ensureVisible(find.text('Record Now Only'));
        await tester.tap(find.text('Record Now Only'));
        await tester.pumpAndSettle();
      },
    );
  }

  testWidgets('the prompt fits a narrow phone', (tester) async {
    tester.view
      ..physicalSize = const Size(360, 640)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      app(
        Builder(
          builder: (context) => TextButton(
            onPressed: () => showRecordPrompt(
              context: context,
              programName: 'Current program',
              airing: RecordPromptAiring(
                start: DateTime.now().subtract(const Duration(minutes: 5)),
                description: 'A long description. ' * 20,
              ),
              suggestion: SuggestedShowing(
                candidate(),
                0,
                DateTime.now().add(const Duration(days: 1)),
              ),
            ),
            child: const Text('Record'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Record'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('Record Now Only'));
    await tester.tap(find.text('Record Now Only'));
    await tester.pumpAndSettle();
  });

  test('descriptions differ only when both say something different', () {
    expect(descriptionsDiffer('Same  words.', 'same words.'), isFalse);
    expect(descriptionsDiffer('', 'Anything.'), isFalse);
    expect(descriptionsDiffer('One plot.', 'Another plot.'), isTrue);
  });

  for (final changed in [false, true]) {
    testWidgets(
      'a slow options lookup shows progress and handles program change: $changed',
      (tester) async {
        final fake = _WorkflowService(const CompleteShowingOptions())
          ..optionsGate = Completer<CompleteShowingOptions>();
        await GetIt.instance.unregister<IncompleteRecordingsService>();
        GetIt.instance.registerSingleton<IncompleteRecordingsService>(fake);
        var recordings = 0;
        var current = true;
        RecordAiringOutcome? outcome;
        await tester.pumpWidget(
          app(
            Builder(
              builder: (context) => TextButton(
                onPressed: () async {
                  outcome = await recordAiring(
                    context: context,
                    programId: 'source-id',
                    programName: 'Current program',
                    programStart: DateTime.now().subtract(
                      const Duration(minutes: 5),
                    ),
                    rawProgram: const {},
                    createTimer: () async {
                      recordings++;
                    },
                    stillValid: () => current,
                  );
                },
                child: const Text('Record'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Record'));
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(recordings, 0);
        current = !changed;
        await tester.pump(const Duration(seconds: 4));
        await tester.pumpAndSettle();
        expect(recordings, changed ? 0 : 1);
        expect(
          outcome,
          changed
              ? RecordAiringOutcome.cancelled
              : RecordAiringOutcome.recorded,
        );
        expect(find.byType(CircularProgressIndicator), findsNothing);
        if (changed) {
          final context = tester.element(find.text('Record'));
          expect(
            recordAiringMessage(AppLocalizations.of(context), outcome!),
            isNull,
          );
        }
        fake.optionsGate!.complete(const CompleteShowingOptions());
        await tester.pump();
      },
    );
  }

  for (final action in [
    'accept',
    'decline',
    'later only',
    'back',
    'movie',
    'known movie',
    'known episode',
    'no match',
  ]) {
    testWidgets('the unnumbered Record workflow: $action', (tester) async {
      final payload = candidate();
      final fake = _WorkflowService(
        CompleteShowingOptions(
          answered: true,
          canSearch: action == 'movie' || action.startsWith('known'),
          showing: action == 'movie' || action == 'no match'
              ? null
              : SuggestedShowing(
                  payload,
                  0,
                  DateTime.parse(payload['startDate'] as String).toLocal(),
                ),
        ),
      );
      await GetIt.instance.unregister<IncompleteRecordingsService>();
      GetIt.instance.registerSingleton<IncompleteRecordingsService>(fake);
      var recordings = 0;
      RecordAiringOutcome? outcome;
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                outcome = await recordAiring(
                  context: context,
                  programId: 'source-id',
                  programName: payload['name'] as String,
                  programStart: DateTime.now().subtract(
                    const Duration(minutes: 5),
                  ),
                  rawProgram: action == 'known episode'
                      ? const {'ParentIndexNumber': 1, 'IndexNumber': 2}
                      : const {},
                  createTimer: () async {
                    recordings++;
                  },
                );
              },
              child: const Text('Record'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Record'));
      await tester.pumpAndSettle();
      if (action == 'no match') {
        expect(outcome, RecordAiringOutcome.recorded);
        expect(recordings, 1);
      } else {
        expect(recordings, 0);
        expect(find.text('Now'), findsOneWidget);
        if (action.startsWith('known')) {
          expect(find.text('Future showing'), findsOneWidget);
          expect(find.textContaining('WPTODT'), findsOneWidget);
          expect(find.textContaining('Matched by title'), findsNothing);
          expect(
            find.text('Same episode (S1E2)'),
            action == 'known episode' ? findsOneWidget : findsNothing,
          );
        } else if (action == 'movie') {
          expect(
            find.text(
              'Also record a future showing automatically once one is found, to get a complete recording?',
            ),
            findsOneWidget,
          );
          expect(find.text('Future showing'), findsNothing);
          expect(find.text('Record Now and Future Showing'), findsOneWidget);
        } else {
          expect(find.text('Future showing'), findsOneWidget);
          expect(find.textContaining('Interviews explore'), findsOneWidget);
          expect(
            find.text(
              "Matched by title and description only. Check it's the same program.",
            ),
            findsOneWidget,
          );
          // The caution and the question stay out of the scrolling cards, in
          // that order, just above the buttons.
          final note = find.textContaining('Matched by title');
          final question = find.text(
            'Also record the future showing to get a complete recording?',
          );
          // The notes and question never scroll with the cards.
          final cardsScroll = find.ancestor(
            of: find.text('Future showing'),
            matching: find.byType(SingleChildScrollView),
          );
          for (final pinned in [note, question]) {
            expect(
              find.ancestor(of: pinned, matching: cardsScroll),
              findsNothing,
            );
            expect(
              find.descendant(of: cardsScroll, matching: pinned),
              findsNothing,
            );
          }
          expect(
            tester.getTopLeft(question).dy,
            greaterThan(tester.getBottomLeft(note).dy),
          );
          expect(
            tester.getBottomLeft(question).dy,
            lessThan(tester.getTopLeft(find.text('Record Now Only')).dy),
          );
          expect(find.textContaining('16.1 WPTODT'), findsOneWidget);
        }
        if (action == 'back') {
          await tester.binding.handlePopRoute();
        } else {
          await tester.tap(
            find.text(
              action == 'decline'
                  ? 'Record Now Only'
                  : action == 'later only'
                  ? 'Record Tomorrow Only'
                  : action == 'movie'
                  ? 'Record Now and Future Showing'
                  : 'Record Now and Tomorrow',
            ),
          );
        }
        await tester.pumpAndSettle();
        expect(recordings, action == 'back' || action == 'later only' ? 0 : 1);
        expect(
          fake.scheduled,
          action == 'accept' ||
                  action == 'later only' ||
                  action.startsWith('known')
              ? 1
              : 0,
        );
        expect(fake.searches, action == 'movie' ? 1 : 0);
        expect(
          outcome,
          action == 'back'
              ? RecordAiringOutcome.cancelled
              : action == 'decline'
              ? RecordAiringOutcome.recorded
              : action == 'later only'
              ? RecordAiringOutcome.laterShowingOnly
              : RecordAiringOutcome.recordedWithLaterShowing,
        );
      }
      fake.dispose();
    });
  }

  test(
    'the Record prompt is offered only for a numbered episode already airing',
    () {
      final start = DateTime(2026, 10, 22, 20);
      bool offers({
        Duration after = const Duration(minutes: 5),
        int? season = 3,
        bool supported = true,
        bool canManage = true,
      }) => offersCompleteShowing(
        programStart: start,
        now: start.add(after),
        season: season,
        episode: 7,
        supported: supported,
        canManage: canManage,
      );

      expect(offers(), isTrue);
      expect(offers(after: const Duration(seconds: 30)), isFalse);
      expect(offers(season: null), isFalse);
      expect(offers(supported: false), isFalse);
      expect(offers(canManage: false), isFalse);
    },
  );

  testWidgets('choosing the future showing records now and asks the plugin', (
    tester,
  ) async {
    service.setSupported(true);
    late BuildContext context;
    await tester.pumpWidget(
      app(
        Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );

    var created = 0;
    final outcome = recordAiring(
      context: context,
      programId: 'p1',
      programName: 'Storage Wars',
      programStart: DateTime.now().subtract(const Duration(minutes: 10)),
      rawProgram: const {'ParentIndexNumber': 3, 'IndexNumber': 7},
      createTimer: () async => created++,
    );
    await tester.pumpAndSettle();

    final l10n = AppLocalizations.of(context);
    expect(find.text(l10n.recordPromptStarted(10)), findsOneWidget);
    await tester.tap(find.text(l10n.recordNowAndLater));
    await tester.pumpAndSettle();

    final result = await tester.runAsync(() => outcome);
    expect(result, RecordAiringOutcome.recordedWithLaterShowing);
    expect(created, 1);
    expect(adapter.requests, contains('POST /Moonfin/LiveTv/CompleteShowing'));
  });

  test('a read from before a session change never fills the set', () async {
    final gate = Completer<void>();
    adapter
      ..gate = gate
      ..incomplete = [_incomplete('old')];
    service.setSupported(true);
    final stale = service.refresh();
    await pumpEventQueue();
    expect(adapter.requests, ['GET /Moonfin/LiveTv/Recordings/Incomplete']);

    service.setSupported(false);
    adapter
      ..gate = null
      ..incomplete = [_incomplete('new')];
    service.setSupported(true);
    final fresh = service.refresh();
    gate.complete();
    await stale;
    await fresh;

    expect(service.stateFor('old'), isNull);
    expect(service.stateFor('new'), isNotNull);
  });

  test('a read from before a dismiss never brings the item back', () async {
    final gate = Completer<void>();
    adapter
      ..gate = gate
      ..incomplete = [_incomplete('item1')];
    service.setSupported(true);
    final stale = service.refresh();
    await pumpEventQueue();
    expect(adapter.requests, ['GET /Moonfin/LiveTv/Recordings/Incomplete']);

    adapter
      ..gate = null
      ..incomplete = [];
    expect(await service.dismiss('item1'), isTrue);
    gate.complete();
    await stale;

    expect(service.stateFor('item1'), isNull);
  });

  test('a malformed entry is read without losing the rest', () async {
    adapter.incomplete = [
      {'itemId': 'a', 'recordedMinutes': '23', 'expectedMinutes': 37},
      {'itemId': 'b', 'recordedMinutes': true, 'expectedMinutes': 37},
    ];
    service.setSupported(true);
    await service.refresh();

    expect(service.stateFor('a')?.recordedMinutes, 23);
    expect(service.stateFor('b')?.recordedMinutes, 0);
  });

  test('reporting the same unsupported state again notifies nobody', () {
    service.setSupported(false, extended: true);
    var notified = 0;
    service.addListener(() => notified++);

    service.setSupported(false, extended: true);

    expect(notified, 0);
  });

  test('a read that changes nothing notifies nobody', () async {
    adapter.incomplete = [_incomplete('item1')];
    service.setSupported(true);
    await service.refresh();
    var notified = 0;
    service.addListener(() => notified++);

    await service.refresh();

    expect(notified, 0);
  });

  testWidgets('the badge draws only for an incomplete item', (tester) async {
    await load(tester, [_incomplete('item1')]);
    await tester.pumpWidget(
      app(
        const Column(
          children: [
            IncompleteRecordingBadge(itemId: 'item1'),
            IncompleteRecordingBadge(itemId: 'item2'),
          ],
        ),
      ),
    );

    expect(find.byType(IncompleteRecordingPill), findsOneWidget);
  });

  // A phone's episode card is a fixed 90 pixels tall, so a badge on a line of
  // its own would push a two line overview out of it.
  testWidgets('a phone episode card fits the badge with or without a runtime', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await load(tester, [_incomplete('ep1'), _incomplete('ep2')]);

    Widget card(String id, {int? runTimeTicks}) => DetailEpisodeCard(
      episode: AggregatedItem(
        id: id,
        serverId: 's1',
        rawData: {
          'Id': id,
          'Name': 'Pilot',
          'Type': 'Episode',
          'IndexNumber': 1,
          'RunTimeTicks': ?runTimeTicks,
          'Overview':
              'A long overview that runs well past two lines on a phone, so '
              'the card has to cut it off at its limit.',
        },
      ),
      imageApi: _MockImageApi(),
    );

    await tester.pumpWidget(
      app(
        Column(children: [card('ep1', runTimeTicks: 22200000000), card('ep2')]),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.byType(IncompleteRecordingPill), findsNWidgets(2));
  });

  testWidgets('nothing draws without the plugin', (tester) async {
    adapter.incomplete = [_incomplete('item1')];
    await tester.pumpWidget(
      app(const IncompleteRecordingBadge(itemId: 'item1')),
    );

    expect(find.byType(IncompleteRecordingPill), findsNothing);
    expect(adapter.requests, isEmpty);
  });

  testWidgets('the detail line describes each state', (tester) async {
    const at = '2026-10-22T20:00:00Z';
    await load(tester, [
      _incomplete('scheduled', state: 'scheduled', at: at),
      _incomplete('recorded', state: 'recorded', at: at),
      _incomplete('notFound', state: 'notFound'),
    ]);
    await tester.pumpWidget(
      app(
        const Column(
          children: [
            IncompleteRecordingDetailLine(itemId: 'scheduled'),
            IncompleteRecordingDetailLine(itemId: 'recorded'),
            IncompleteRecordingDetailLine(itemId: 'notFound'),
          ],
        ),
      ),
    );

    final lines = tester
        .widgetList<Text>(find.byType(Text))
        .map((t) => t.data!)
        .toList();
    expect(
      lines[0],
      startsWith('Incomplete · 23 of 37 min · Complete showing scheduled '),
    );
    expect(
      lines[1],
      startsWith('Incomplete · 23 of 37 min · Complete copy recorded '),
    );
    expect(lines[2], 'Incomplete · 23 of 37 min · No complete showing found');
  });
}
