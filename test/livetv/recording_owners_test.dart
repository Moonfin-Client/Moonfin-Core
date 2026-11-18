import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/models/user.dart';
import 'package:moonfin/auth/repositories/user_repository.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/recording_owners_service.dart';
import 'package:moonfin/data/viewmodels/live_tv_guide_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/preference_constants.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/widgets/live_tv/live_tv_recording_dialog.dart';
import 'package:moonfin/ui/widgets/live_tv/recording_owner_badge.dart';
import 'package:moonfin/ui/widgets/live_tv/recording_owner_line.dart';
import 'package:moonfin/ui/widgets/live_tv/shared_recording_warning.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockLiveTvApi extends Mock implements LiveTvApi {}

class _MockPluginSync extends Mock implements PluginSyncService {}

/// Answers the plugin's Lookup endpoint from [timers] and [seriesTimers]
/// (id -> owners) and records each request.
class _PluginAdapter implements HttpClientAdapter {
  final timers = <String, List<RecordingOwner>>{};
  final seriesTimers = <String, List<RecordingOwner>>{};
  final requests = <String>[];

  /// The Lookup answer's `recordingItemIds`; left out while null.
  List<String>? recordingItemIds;

  /// Answers this status for any request whose path ends with the key.
  final failing = <String, int>{};

  /// The JSON body sent with a [failing] status; empty when not set.
  final failingBody = <String, Map<String, dynamic>>{};

  /// When set, every answer waits for it, as a slow server's does.
  Completer<void>? hold;

  static Map<String, dynamic> _json(RecordingOwner o) => {
    'userId': o.userId,
    'name': o.name,
    if (o.imageTag != null) 'imageTag': o.imageTag,
  };

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add('${options.method} ${options.uri.path}');
    await hold?.future;
    for (final e in failing.entries) {
      if (options.uri.path.endsWith(e.key)) {
        final body = failingBody[e.key];
        return body == null
            ? ResponseBody.fromString('', e.value)
            : ResponseBody.fromString(
                jsonEncode(body),
                e.value,
                headers: {
                  Headers.contentTypeHeader: [Headers.jsonContentType],
                },
              );
      }
    }
    final body = options.uri.path.endsWith('/Lookup')
        ? jsonEncode({
            'timers': {
              for (final e in timers.entries)
                e.key: e.value.map(_json).toList(),
            },
            'seriesTimers': {
              for (final e in seriesTimers.entries)
                e.key: e.value.map(_json).toList(),
            },
            'items': <String, dynamic>{},
            'recordingItemIds': ?recordingItemIds,
          })
        : '{}';
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

const _me = RecordingOwner(userId: 'me-id', name: 'Alex');
const _jordan = RecordingOwner(userId: 'jordan-id', name: 'Jordan');
const _sam = RecordingOwner(userId: 'sam-id', name: 'Sam');

List<RecordingOwner> _users(int count) => [
  for (var i = 0; i < count; i++)
    RecordingOwner(userId: 'user-$i', name: 'User $i'),
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final en = AppLocalizationsEn();

  late _PluginAdapter adapter;
  late RecordingOwnersService service;
  late UserPreferences prefs;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues(const {});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);
    GetIt.instance.registerSingleton<UserRepository>(
      UserRepository()..setCurrentUser(
        PrivateUser(
          id: _me.userId,
          name: _me.name,
          serverId: 's1',
          accessToken: 't',
          lastUsed: DateTime(2026),
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
    service = RecordingOwnersService(
      client: () => client,
      dio: Dio()..httpClientAdapter = adapter,
    );
    GetIt.instance.registerSingleton<RecordingOwnersService>(service);
  });

  tearDown(() async {
    service.dispose();
    await GetIt.instance.reset();
  });

  Widget app(Widget child) => MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );

  group('ownerLineText', () {
    test('no other owners gives no line', () {
      expect(ownerLineText(en, const []), isNull);
    });

    test('one, two and many owners are named or counted', () {
      expect(ownerLineText(en, [_jordan]), 'Jordan is recording this');
      expect(
        ownerLineText(en, [_jordan, _sam]),
        'Jordan and Sam are recording this',
      );
      expect(ownerLineText(en, _users(4)), '4 other users are recording this');
    });

    test('the waiting wording follows the same capping', () {
      expect(
        ownerLineText(en, [_jordan], waiting: true),
        en.ownerWaitingOne('Jordan'),
      );
      expect(
        ownerLineText(en, [_jordan, _sam], waiting: true),
        en.ownerWaitingTwo('Jordan', 'Sam'),
      );
      expect(
        ownerLineText(en, _users(3), waiting: true),
        en.ownerWaitingMany(3),
      );
    });
  });

  group('RecordingOwnerBadge', () {
    testWidgets('shows two pictures and a +13 chip for 15 owners', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          Align(
            alignment: Alignment.topLeft,
            child: RecordingOwnerBadge(owners: _users(15), cardWidth: 300),
          ),
        ),
      );
      expect(find.byType(RecordingOwnerAvatar), findsNWidgets(2));
      expect(find.text('+13'), findsOneWidget);
    });

    testWidgets('diameter is one fifth of the card width, at any width', (
      tester,
    ) async {
      for (final width in [150.0, 300.0, 640.0]) {
        await tester.pumpWidget(
          app(
            Align(
              alignment: Alignment.topLeft,
              child: RecordingOwnerBadge(owners: _users(15), cardWidth: width),
            ),
          ),
        );
        final diameter = width / 5;
        for (final avatar in tester.widgetList<RecordingOwnerAvatar>(
          find.byType(RecordingOwnerAvatar),
        )) {
          expect(avatar.size, diameter);
        }
        final chip = find.ancestor(
          of: find.text('+13'),
          matching: find.byType(Container),
        );
        expect(tester.getSize(chip.first), Size(diameter, diameter));
        expect(
          tester.getSize(find.byType(RecordingOwnerBadge)).height,
          diameter,
        );
      }
    });

    testWidgets('no +N chip when two or fewer own it; none when empty', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(RecordingOwnerBadge(owners: _users(2), cardWidth: 300)),
      );
      expect(find.byType(RecordingOwnerAvatar), findsNWidgets(2));
      expect(find.textContaining('+'), findsNothing);

      await tester.pumpWidget(
        app(const RecordingOwnerBadge(owners: [], cardWidth: 300)),
      );
      expect(find.byType(RecordingOwnerAvatar), findsNothing);
    });

    // The ring (or outline) round one owner's picture.
    Border borderOf(WidgetTester tester, String userId) {
      final avatar = find.byWidgetPredicate(
        (w) => w is RecordingOwnerAvatar && w.owner.userId == userId,
      );
      final box = tester.widget<Container>(
        find.descendant(of: avatar, matching: find.byType(Container)).first,
      );
      return (box.decoration! as BoxDecoration).border! as Border;
    }

    Future<void> pumpMixed(WidgetTester tester, {bool highlight = true}) =>
        tester.pumpWidget(
          app(
            Align(
              alignment: Alignment.topLeft,
              child: RecordingOwnerBadge(
                owners: [_me, _jordan],
                cardWidth: 300,
                highlightCurrentUser: highlight,
              ),
            ),
          ),
        );

    testWidgets('current user is ringed in Moonfin cyan', (tester) async {
      await pumpMixed(tester);
      expect(
        borderOf(tester, _me.userId).top.color,
        Color(AppTheme.moonfinCyan.colorValue),
      );
    });

    testWidgets('the ring turns 8-bit gold when focus colour is cyan', (
      tester,
    ) async {
      prefs.set(UserPreferences.focusColor, AppTheme.moonfinCyan);
      await pumpMixed(tester);
      expect(
        borderOf(tester, _me.userId).top.color,
        Color(AppTheme.eightBitGold.colorValue),
      );
    });

    testWidgets('other users get a thinner outline, not the ring', (
      tester,
    ) async {
      await pumpMixed(tester);
      final ring = borderOf(tester, _me.userId).top;
      final outline = borderOf(tester, _jordan.userId).top;
      expect(outline.color, isNot(ring.color));
      expect(outline.width, lessThan(ring.width));
    });

    testWidgets(
      'the current user comes first and is ringed past +N, any id spelling',
      (tester) async {
        // The current user's id spelled with capitals and without dashes.
        const meUpper = RecordingOwner(userId: 'MEID', name: 'Alex');
        await tester.pumpWidget(
          app(
            Align(
              alignment: Alignment.topLeft,
              child: RecordingOwnerBadge(
                owners: [..._users(3), meUpper],
                cardWidth: 300,
                highlightCurrentUser: true,
              ),
            ),
          ),
        );
        final shown = tester
            .widgetList<RecordingOwnerAvatar>(find.byType(RecordingOwnerAvatar))
            .map((a) => a.owner.userId)
            .toList();
        expect(shown, ['MEID', 'user-0']);
        expect(find.text('+2'), findsOneWidget);
        expect(
          borderOf(tester, 'MEID').top.color,
          Color(AppTheme.moonfinCyan.colorValue),
        );
      },
    );

    testWidgets('without highlightCurrentUser nobody is ringed', (
      tester,
    ) async {
      await pumpMixed(tester, highlight: false);
      final mine = borderOf(tester, _me.userId).top;
      expect(mine.color, isNot(Color(AppTheme.moonfinCyan.colorValue)));
      expect(mine.width, borderOf(tester, _jordan.userId).top.width);
    });
  });

  group('RecordingOwnerLine', () {
    testWidgets('shows the sentence, and nothing for no owners', (
      tester,
    ) async {
      await tester.pumpWidget(app(RecordingOwnerLine(others: [_jordan, _sam])));
      expect(find.text('Jordan and Sam are recording this'), findsOneWidget);
      expect(find.byType(RecordingOwnerAvatar), findsNWidgets(2));

      await tester.pumpWidget(app(const RecordingOwnerLine(others: [])));
      expect(find.byType(RecordingOwnerAvatar), findsNothing);
      expect(find.textContaining('recording'), findsNothing);
    });
  });

  group('RecordingOwnersService', () {
    test(
      'othersOf leaves out the current user; isMine is null until known',
      () async {
        service.setSupported(true);
        expect(service.isMine(OwnedKind.timer, 't1'), isNull);
        adapter.timers['t1'] = [_me, _jordan];
        await service.lookup(timerIds: ['t1']);
        expect(service.othersOf(OwnedKind.timer, 't1'), [_jordan]);
        expect(service.isMine(OwnedKind.timer, 't1'), isTrue);
        expect(service.isMine(OwnedKind.timer, 't2'), isNull);
      },
    );

    test('an id asked for and not returned is known as unowned', () async {
      service.setSupported(true);
      await service.lookup(timerIds: ['t9']);
      expect(service.isMine(OwnedKind.timer, 't9'), isFalse);
    });

    test(
      'isRecording follows recordingItemIds, and is unknown without it',
      () async {
        service.setSupported(true);
        await service.lookup(itemIds: ['item-1', 'item-2']);
        expect(service.isRecording('item-1'), isNull);

        adapter.recordingItemIds = ['ITEM1'];
        await service.lookup(itemIds: ['item-1', 'item-2']);
        expect(service.isRecording('item-1'), isTrue);
        expect(service.isRecording('item-2'), isFalse);
        expect(service.isRecording('item-3'), isNull);

        // Dropped with the rest of the cache.
        notifyLiveTvRecordingsChanged();
        expect(service.isRecording('item-1'), isNull);
      },
    );

    test('an unsupported plugin is never asked', () async {
      adapter.timers['t1'] = [_jordan];
      await service.lookup(timerIds: ['t1']);
      expect(adapter.requests, isEmpty);
      expect(service.ownersOf(OwnedKind.timer, 't1'), isEmpty);
      expect(supportedRecordingOwners(), isNull);
      expect(await freshOtherOwners(OwnedKind.timer, 't1'), isEmpty);
    });

    group('owners endpoints going away', () {
      late _MockLiveTvApi api;

      setUp(() {
        api = _MockLiveTvApi();
        when(() => api.createTimer(any())).thenAnswer((_) async {});
        when(
          () => api.createSeriesTimer(any(), settings: any(named: 'settings')),
        ).thenAnswer((_) async {});
        service.setSupported(true);
      });

      const record = 'POST /Moonfin/LiveTv/Owners/Record';
      const claim = 'POST /Moonfin/LiveTv/Owners/Claim';

      for (final status in [404, 405, 501, 503]) {
        test(
          'createTimerWithOwner falls back to the plain call and turns owners off on a bare $status',
          () async {
            adapter.failing['/Owners/Record'] = status;
            await createTimerWithOwner(api, 'p1');
            expect(adapter.requests, [record]);
            verify(() => api.createTimer('p1')).called(1);
            expect(service.supported, isFalse);
            expect(supportedRecordingOwners(), isNull);
          },
        );
      }

      test('a Lookup answering that the endpoints are gone turns owners off',
          () async {
        adapter.failing['/Owners/Lookup'] = 404;
        await service.lookup(timerIds: ['t1']);
        expect(service.supported, isFalse);
        expect(supportedRecordingOwners(), isNull);
      });

      test('a gone answer to a Lookup from a replaced session leaves owners on',
          () async {
        adapter.failing['/Owners/Lookup'] = 404;
        adapter.hold = Completer<void>();
        final pending = service.lookup(timerIds: ['t1']);
        // The session changes while the old server's answer is on its way.
        service.setSupported(false);
        service.setSupported(true);
        adapter.hold!.complete();
        await pending;
        expect(service.supported, isTrue);
      });

      test('a Lookup 404 naming another reason keeps owners on', () async {
        adapter.failing['/Owners/Lookup'] = 404;
        adapter.failingBody['/Owners/Lookup'] = {'error': 'Something else'};
        await service.lookup(timerIds: ['t1']);
        expect(service.supported, isTrue);
      });

      test('a 404 saying the feature is off turns owners off', () async {
        adapter.failing['/Owners/Record'] = 404;
        adapter.failingBody['/Owners/Record'] = {
          'error': 'Recording owners are not available',
        };
        await createTimerWithOwner(api, 'p1');
        expect(adapter.requests, [record]);
        verify(() => api.createTimer('p1')).called(1);
        expect(service.supported, isFalse);
      });

      test(
        'a 404 naming another reason falls back but keeps owners on',
        () async {
          adapter.failing['/Owners/Record'] = 404;
          adapter.failingBody['/Owners/Record'] = {
            'error': 'No guide program with that id',
          };
          await createTimerWithOwner(api, 'p1');
          expect(adapter.requests, [record]);
          verify(() => api.createTimer('p1')).called(1);
          expect(service.supported, isTrue);
        },
      );

      test(
        'createSeriesTimerWithOwner falls back on a 404 with the same settings',
        () async {
          adapter.failing['/Owners/RecordSeries'] = 404;
          final settings = {'keepUpTo': 3, 'recordNewOnly': true};
          await createSeriesTimerWithOwner(api, 'p1', settings: settings);
          expect(adapter.requests, [
            'POST /Moonfin/LiveTv/Owners/RecordSeries',
          ]);
          verify(
            () => api.createSeriesTimer('p1', settings: settings),
          ).called(1);
          expect(service.supported, isFalse);
        },
      );

      test('joinRecording on a bare 404 turns owners off and throws', () async {
        adapter.failing['/Owners/Claim'] = 404;
        await expectLater(
          joinRecording(OwnedKind.timer, 't1'),
          throwsA(isA<DioException>()),
        );
        expect(adapter.requests, [claim]);
        expect(service.supported, isFalse);
      });

      test(
        'joinRecording on "Nothing to claim" throws and keeps owners on',
        () async {
          adapter.failing['/Owners/Claim'] = 404;
          adapter.failingBody['/Owners/Claim'] = {
            'error': 'Nothing to claim with that id',
          };
          await expectLater(
            joinRecording(OwnedKind.timer, 't1'),
            throwsA(isA<DioException>()),
          );
          expect(adapter.requests, [claim]);
          expect(service.supported, isTrue);
        },
      );

      test('failures that arrive together start only one Ping', () async {
        registerFallbackValue(_MockClient());
        final sync = _MockPluginSync();
        final ping = Completer<bool>();
        when(
          () => sync.refreshAvailability(any()),
        ).thenAnswer((_) => ping.future);
        GetIt.instance.registerSingleton<PluginSyncService>(sync);
        adapter.failing['/Owners/Record'] = 404;
        await Future.wait([
          createTimerWithOwner(api, 'p1'),
          createTimerWithOwner(api, 'p2'),
        ]);
        expect(adapter.requests, [record, record]);
        verify(() => sync.refreshAvailability(any())).called(1);

        // Once that Ping is done, the next failure pings again.
        ping.complete(true);
        await Future<void>.delayed(Duration.zero);
        service.setSupported(true);
        await createTimerWithOwner(api, 'p3');
        verify(() => sync.refreshAvailability(any())).called(1);
      });

      test('a 500 from the owners endpoint does not fall back', () async {
        adapter.failing['/Owners/Record'] = 500;
        await expectLater(
          createTimerWithOwner(api, 'p1'),
          throwsA(isA<DioException>()),
        );
        verifyNever(() => api.createTimer(any()));
        expect(service.supported, isTrue);
      });
    });
  });

  group('recording dialog', () {
    LiveTvRecordingAction? result;

    Future<void> open(
      WidgetTester tester, {
      required LiveTvRecordingState recording,
      bool isSeries = false,
    }) async {
      result = null;
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () async {
                  result = await showLiveTvRecordingDialog(
                    context: context,
                    programName: 'Current Show',
                    isSeries: isSeries,
                    recording: recording,
                  );
                },
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pump();
      // The dialog's own lookup runs on real async time.
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
    }

    const oneOff = LiveTvRecordingState(timerId: 't1', isRecording: true);
    const episode = LiveTvRecordingState(
      timerId: 't1',
      seriesTimerId: 's1',
      isRecording: true,
    );

    testWidgets('non-owner of a one-off can join or cancel', (tester) async {
      service.setSupported(true);
      adapter.timers['t1'] = [_jordan];
      await open(tester, recording: oneOff);
      expect(find.text('Add to My Recordings'), findsOneWidget);
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Jordan is recording this'), findsOneWidget);
      expect(find.text('Add Series to My Recordings'), findsNothing);
      await tester.tap(find.text('Add to My Recordings'));
      await tester.pumpAndSettle();
      expect(result, LiveTvRecordingAction.joinProgram);
    });

    testWidgets('non-owner of a series episode joins through the series', (
      tester,
    ) async {
      service.setSupported(true);
      adapter.timers['t1'] = [_jordan];
      adapter.seriesTimers['s1'] = [_jordan];
      await open(tester, recording: episode, isSeries: true);
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Add Series to My Recordings'), findsOneWidget);
      expect(find.text('Cancel Series Recording'), findsOneWidget);
      expect(find.text('Add to My Recordings'), findsNothing);
      expect(find.text('Series Settings'), findsNothing);
      await tester.tap(find.text('Add Series to My Recordings'));
      await tester.pumpAndSettle();
      expect(result, LiveTvRecordingAction.joinSeries);
    });

    testWidgets('an owner sees the usual buttons and no join', (tester) async {
      service.setSupported(true);
      adapter.timers['t1'] = [_me, _jordan];
      adapter.seriesTimers['s1'] = [_me];
      await open(tester, recording: episode, isSeries: true);
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Series Settings'), findsOneWidget);
      expect(find.text('Cancel Series Recording'), findsOneWidget);
      expect(find.text('Add to My Recordings'), findsNothing);
      expect(find.text('Add Series to My Recordings'), findsNothing);
      // The other owner is still named.
      expect(find.text('Jordan is recording this'), findsOneWidget);
    });

    testWidgets('an unsupported plugin sees the usual buttons', (tester) async {
      adapter.timers['t1'] = [_jordan];
      adapter.seriesTimers['s1'] = [_jordan];
      await open(tester, recording: episode, isSeries: true);
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Series Settings'), findsOneWidget);
      expect(find.text('Cancel Series Recording'), findsOneWidget);
      expect(find.text('Add to My Recordings'), findsNothing);
      expect(find.text('Add Series to My Recordings'), findsNothing);
      expect(find.textContaining('recording this'), findsNothing);
      expect(adapter.requests, isEmpty);
    });

    testWidgets('an unsupported plugin sees the usual one-off buttons', (
      tester,
    ) async {
      adapter.timers['t1'] = [_jordan];
      await open(tester, recording: oneOff);
      expect(find.text('Cancel This Recording'), findsOneWidget);
      expect(find.text('Add to My Recordings'), findsNothing);
      expect(find.textContaining('recording this'), findsNothing);
      expect(adapter.requests, isEmpty);
    });
  });

  group('confirmSharedCancel', () {
    Future<void> open(
      WidgetTester tester,
      List<RecordingOwner> others,
      void Function(bool) onResult,
    ) async {
      await tester.pumpWidget(
        app(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async =>
                  onResult(await confirmSharedCancel(context, others)),
              child: const Text('Open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
    }

    testWidgets('with others, Keep holds the initial focus and returns false', (
      tester,
    ) async {
      bool? result;
      await open(tester, [_jordan], (v) => result = v);
      expect(find.text(en.sharedCancelOne('Jordan')), findsOneWidget);
      expect(find.text('Keep'), findsOneWidget);
      expect(find.text('Cancel for Everyone'), findsOneWidget);
      final focused = FocusManager.instance.primaryFocus!.context!;
      expect(
        find.descendant(
          of: find.byElementPredicate((e) => e == focused),
          matching: find.text('Keep'),
        ),
        findsOneWidget,
      );
      // A stray Enter on a remote keeps the recording.
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(result, isFalse);
    });

    testWidgets('tapping Keep returns false', (tester) async {
      bool? result;
      await open(tester, [_jordan, _sam], (v) => result = v);
      expect(find.text(en.sharedCancelTwo('Jordan', 'Sam')), findsOneWidget);
      await tester.tap(find.text('Keep'));
      await tester.pumpAndSettle();
      expect(result, isFalse);
    });

    testWidgets('Cancel for Everyone returns true; many are counted', (
      tester,
    ) async {
      bool? result;
      await open(tester, _users(3), (v) => result = v);
      expect(find.text(en.sharedCancelMany(3)), findsOneWidget);
      await tester.tap(find.text('Cancel for Everyone'));
      await tester.pumpAndSettle();
      expect(result, isTrue);
    });

    testWidgets('with no others it goes ahead without a dialog', (
      tester,
    ) async {
      bool? result;
      await open(tester, const [], (v) => result = v);
      expect(result, isTrue);
      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  group('toggleProgramRecording', () {
    late _MockLiveTvApi liveTv;
    late _MockClient guideClient;
    late LiveTvGuideViewModel vm;

    GuideProgram scheduled() => GuideProgram(
      id: 'p1',
      channelId: 'c1',
      name: 'Show',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 1, 2),
      hasTimer: true,
      rawData: const {'TimerId': 't1'},
    );

    setUp(() {
      liveTv = _MockLiveTvApi();
      guideClient = _MockClient();
      when(() => guideClient.liveTvApi).thenReturn(liveTv);
      when(() => guideClient.userId).thenReturn(_me.userId);
      when(() => liveTv.cancelTimer(any())).thenAnswer((_) async {});
      vm = LiveTvGuideViewModel(guideClient);
    });

    test('with other owners it does not cancel until confirmed', () async {
      service.setSupported(true);
      adapter.timers['t1'] = [_jordan];
      expect(await vm.toggleProgramRecording(scheduled()), isFalse);
      verifyNever(() => liveTv.cancelTimer(any()));
    });

    test('confirmed, it cancels the timer', () async {
      service.setSupported(true);
      adapter.timers['t1'] = [_jordan];
      await vm.toggleProgramRecording(scheduled(), sharedCancelConfirmed: true);
      verify(() => liveTv.cancelTimer('t1')).called(1);
    });

    test(
      'when only the current user owns it, it cancels straight away',
      () async {
        service.setSupported(true);
        adapter.timers['t1'] = [_me];
        expect(await vm.toggleProgramRecording(scheduled()), isTrue);
        verify(() => liveTv.cancelTimer('t1')).called(1);
      },
    );

    test('an unsupported plugin cancels as before, without asking', () async {
      adapter.timers['t1'] = [_jordan];
      expect(await vm.toggleProgramRecording(scheduled()), isTrue);
      verify(() => liveTv.cancelTimer('t1')).called(1);
      expect(adapter.requests, isEmpty);
    });
  });
}
