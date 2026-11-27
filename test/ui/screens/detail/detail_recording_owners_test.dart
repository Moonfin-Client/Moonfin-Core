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
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/models/live_tv_recording_state.dart';
import 'package:moonfin/data/repositories/offline_repository.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/data/services/recording_owners_service.dart';
import 'package:moonfin/data/viewmodels/item_detail_view_model.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:moonfin/l10n/app_localizations_en.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/ui/screens/detail/item_detail_screen.dart';
import 'package:moonfin/util/platform_detection.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel extends Mock implements ItemDetailViewModel {}

class _Sync extends Mock implements PluginSyncService {}

class _SeerrPrefs extends Mock implements SeerrPreferences {}

class _Users extends Mock implements UserRepository {}

class _Offline extends Mock implements OfflineRepository {}

class _Playback extends Mock implements PlaybackManager {}

class _Queue extends Mock implements QueueService {}

class _Client extends Mock implements MediaServerClient {}

/// Answers the plugin's Lookup endpoint with [items] (id -> owner names) and,
/// when set, [recordings], and records each request path.
class _LookupAdapter implements HttpClientAdapter {
  final items = <String, List<String>>{};
  Set<String>? recordings;
  final requests = <String>[];

  /// While set, Lookup answers wait for it to complete.
  Completer<void>? gate;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options.uri.path);
    await gate?.future;
    final body = options.uri.path.endsWith('/Lookup')
        ? jsonEncode({
            'timers': <String, dynamic>{},
            'seriesTimers': <String, dynamic>{},
            'items': {
              for (final e in items.entries)
                e.key: [
                  for (final name in e.value)
                    {'userId': '${name.toLowerCase()}-id', 'name': name},
                ],
            },
            'recordingItemIds': ?recordings?.toList(),
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

// A finished Jellyfin recording comes back typed Episode, not Recording.
final _episode = AggregatedItem(
  id: 'episode1',
  serverId: 'server-1',
  rawData: const {
    'Id': 'episode1',
    'Name': 'Big Game',
    'Type': 'Episode',
    'CanDelete': true,
    'RunTimeTicks': 36000000000,
    'UserData': {
      'Played': false,
      'IsFavorite': false,
      'PlaybackPositionTicks': 0,
    },
  },
);

void main() {
  final en = AppLocalizationsEn();
  late _LookupAdapter adapter;
  late RecordingOwnersService owners;

  setUp(() async {
    await GetIt.instance.reset();
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    GetIt.instance.registerSingleton<UserPreferences>(UserPreferences(store));

    final sync = _Sync();
    when(() => sync.seerrAvailable).thenReturn(false);
    GetIt.instance.registerSingleton<PluginSyncService>(sync);

    final seerrPrefs = _SeerrPrefs();
    when(() => seerrPrefs.showRequestStatus).thenReturn(false);
    GetIt.instance.registerSingleton<SeerrPreferences>(seerrPrefs);

    final users = _Users();
    when(() => users.currentUserStream).thenAnswer((_) => const Stream.empty());
    when(() => users.currentUser).thenReturn(
      PrivateUser(
        id: 'me-id',
        name: 'Me',
        serverId: 'server-1',
        accessToken: 't',
        lastUsed: DateTime(2026),
      ),
    );
    GetIt.instance.registerSingleton<UserRepository>(users);

    final offline = _Offline();
    when(() => offline.getItem(any())).thenAnswer((_) async => null);
    GetIt.instance.registerSingleton<OfflineRepository>(offline);

    final queue = _Queue();
    final playback = _Playback();
    when(() => playback.queueService).thenReturn(queue);
    GetIt.instance.registerSingleton<PlaybackManager>(playback);

    final client = _Client();
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
    adapter = _LookupAdapter();
    owners = RecordingOwnersService(
      client: () => client,
      dio: Dio()..httpClientAdapter = adapter,
    );
    GetIt.instance.registerSingleton<RecordingOwnersService>(owners);
  });

  tearDown(() async {
    owners.dispose();
    PlatformDetection.setInterfaceLayout(InterfaceLayout.automatic);
    await GetIt.instance.reset();
  });

  Future<void> pumpButtons(WidgetTester tester) async {
    PlatformDetection.setInterfaceLayout(InterfaceLayout.tv);
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final vm = _ViewModel();
    when(() => vm.item).thenReturn(_episode);
    when(() => vm.isSeerrOnly).thenReturn(false);
    when(() => vm.actionsSettled).thenReturn(true);
    when(() => vm.supportsPersonalRating).thenReturn(false);
    when(() => vm.searchesYouTubeForTrailer).thenReturn(false);
    when(() => vm.features).thenReturn(const []);
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('en')],
        home: Scaffold(
          body: SingleChildScrollView(
            child: DetailActionButtons(
              viewModel: vm,
              itemId: _episode.id,
              onSelectedMediaSourceChanged: (_) {},
            ),
          ),
        ),
      ),
    );
    // The owners lookup runs on real async time.
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets(
    'a finished recording typed Episode offers Add to My Recordings and warns '
    'before a shared delete',
    (tester) async {
      owners.setSupported(true);
      adapter.items['episode1'] = ['Alex'];
      await pumpButtons(tester);
      expect(adapter.requests, contains('/Moonfin/LiveTv/Owners/Lookup'));
      expect(owners.isMine(OwnedKind.item, 'episode1'), isFalse);

      // Add to My Recordings lives behind More.
      expect(find.byIcon(Icons.bookmark_add_outlined), findsNothing);
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pump();
      expect(find.byIcon(Icons.bookmark_add_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.delete_forever));
      await tester.pump();
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
      expect(find.text(en.sharedDeleteOne('Alex')), findsOneWidget);
      await tester.tap(find.text(en.sharedKeep));
      await tester.pumpAndSettle();
      expect(find.text(en.sharedDeleteOne('Alex')), findsNothing);
    },
  );

  testWidgets('an unowned item typed Episode offers no claim', (tester) async {
    owners.setSupported(true);
    await pumpButtons(tester);
    expect(adapter.requests, contains('/Moonfin/LiveTv/Owners/Lookup'));
    expect(owners.isRecording('episode1'), isNull);
    if (find.byIcon(Icons.expand_more).evaluate().isNotEmpty) {
      await tester.tap(find.byIcon(Icons.expand_more));
      await tester.pump();
    }
    expect(find.byIcon(Icons.bookmark_add_outlined), findsNothing);
  });

  testWidgets('an unowned recording the plugin names can be claimed', (
    tester,
  ) async {
    owners.setSupported(true);
    adapter.recordings = {'episode1'};
    await pumpButtons(tester);
    expect(owners.isRecording('episode1'), isTrue);
    await tester.tap(find.byIcon(Icons.expand_more));
    await tester.pump();
    expect(find.byIcon(Icons.bookmark_add_outlined), findsOneWidget);
  });

  testWidgets('owners changing during a lookup read them once more, at most', (
    tester,
  ) async {
    owners.setSupported(true);
    adapter.items['episode1'] = ['Alex'];
    adapter.gate = Completer<void>();
    await pumpButtons(tester);
    const lookup = '/Moonfin/LiveTv/Owners/Lookup';
    expect(adapter.requests, [lookup]);

    // A recording changes twice while that lookup is still out.
    notifyLiveTvRecordingsChanged();
    notifyLiveTvRecordingsChanged();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump();
    expect(adapter.requests, [lookup]);

    // Its answer is dropped with the old cache, so one more read follows.
    adapter.gate!.complete();
    adapter.gate = null;
    for (var i = 0; i < 3; i++) {
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(adapter.requests, [lookup, lookup]);
    expect(owners.isMine(OwnedKind.item, 'episode1'), isFalse);
  });

  testWidgets('owners are read again when support arrives after the screen', (
    tester,
  ) async {
    adapter.items['episode1'] = ['Alex'];
    await pumpButtons(tester);
    expect(adapter.requests, isEmpty);
    owners.setSupported(true);
    // Let the lookup start, then answer it on real async time.
    await tester.pump(const Duration(milliseconds: 100));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pump();
    expect(adapter.requests, contains('/Moonfin/LiveTv/Owners/Lookup'));
    expect(owners.isMine(OwnedKind.item, 'episode1'), isFalse);
  });
}
