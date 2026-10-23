import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockImageApi extends Mock implements ImageApi {}

/// Answers the plugin's endpoints with [incomplete] and records each request.
class _PluginAdapter implements HttpClientAdapter {
  List<Map<String, dynamic>> incomplete = [];
  final requests = <String>[];

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
    final body = isList ? jsonEncode(incomplete) : '{}';
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

  Widget app(Widget child) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );

  test('the Record prompt is offered only for a numbered episode already airing', () {
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
  });

  testWidgets('choosing the later showing records now and asks the plugin', (
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
    expect(find.text(l10n.recordPromptAlreadyStarted), findsOneWidget);
    await tester.tap(find.text(l10n.alsoRecordLaterShowing));
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
    expect(lines[0], startsWith('Incomplete · 23 of 37 min · Complete showing scheduled '));
    expect(lines[1], startsWith('Incomplete · 23 of 37 min · Complete copy recorded '));
    expect(lines[2], 'Incomplete · 23 of 37 min · No complete showing found');
  });
}
