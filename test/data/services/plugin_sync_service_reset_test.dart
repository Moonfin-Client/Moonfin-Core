import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/services/incomplete_recordings_service.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

/// Serves canned plugin responses and records every request, so the tests can
/// assert exactly which calls the reset made.
class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];

  /// Body returned for the Resolved endpoint, replaceable per test.
  Map<String, dynamic> resolvedProfile = {};

  /// Set when the server should refuse to delete.
  bool failDeletes = false;

  /// Set when nothing is left to resolve after a delete.
  bool failResolved = false;

  /// What the ping says about incomplete recordings.
  bool incompleteRecordingsSupported = false;

  /// Notification preferences returned by the server.
  Map<String, dynamic> notificationPrefs = {
    'notifyOnNewRequests': false,
    'notifyOnLibraryAdded': false,
    'notifyOnIssues': false,
    'notifyOnNewMedia': false,
  };

  /// Set when notification preference POST should fail.
  bool failNotificationPush = false;

  /// Holds the payload from the most recent notification POST.
  dynamic lastNotificationPostPayload;

  /// Optional completer to delay notification GET responses.
  Completer<void>? notificationGetCompleter;

  /// Optional completer to delay notification POST responses.
  Completer<void>? notificationPostCompleter;

  /// Optional completer triggered when a notification POST request reaches the adapter.
  Completer<void>? notificationPostReceivedCompleter;

  /// Optional completer to delay ping responses during endpoint resolution.
  Completer<void>? pingCompleter;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    requests.add('${options.method} $path');

    if (options.method == 'DELETE') {
      return ResponseBody.fromString('', failDeletes ? 500 : 200);
    }
    if (path.endsWith('/Moonfin/Notifications/Prefs')) {
      if (options.method == 'POST') {
        lastNotificationPostPayload = options.data;
        if (notificationPostReceivedCompleter != null &&
            !notificationPostReceivedCompleter!.isCompleted) {
          notificationPostReceivedCompleter!.complete();
        }
        if (notificationPostCompleter != null) {
          await notificationPostCompleter!.future;
        }
        return ResponseBody.fromString('', failNotificationPush ? 500 : 200);
      }
      if (notificationGetCompleter != null) {
        await notificationGetCompleter!.future;
      }
      return ResponseBody.fromString(
        jsonEncode(notificationPrefs),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    if (path.endsWith('/Moonfin/Ping') && pingCompleter != null) {
      await pingCompleter!.future;
    }

    Map<String, dynamic>? body;
    if (path.endsWith('/Moonfin/Ping')) {
      body = {
        'installed': true,
        'settingsSyncEnabled': true,
        'incompleteRecordingsSupported': incompleteRecordingsSupported,
      };
    } else if (path.contains('/Moonfin/Settings/Resolved/')) {
      body = failResolved ? null : resolvedProfile;
    } else if (path.contains('/Moonfin/Settings/Profile/')) {
      body = {};
    }

    if (body == null) {
      return ResponseBody.fromString('', 404);
    }
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingAdapter adapter;
  late PreferenceStore store;
  late UserPreferences prefs;
  late PluginSyncService service;
  late _MockClient client;

  int postCount() => adapter.requests
      .where((r) => r.startsWith('POST') && r.contains('/Settings/Profile/'))
      .length;

  /// Waits out the 1000ms push debounce plus slack.
  Future<void> settle() =>
      Future<void>.delayed(const Duration(milliseconds: 1400));

  setUp(() async {
    SharedPreferences.setMockInitialValues({'pref_last_server_id': 'srv1'});
    store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);

    final session = _MockSessionRepository();
    when(() => session.activeUserId).thenReturn('user1');
    GetIt.instance.registerSingleton<SeerrPreferences>(
      SeerrPreferences(store, session),
    );

    client = _MockClient();
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    when(() => client.accessToken).thenReturn('token');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.deviceInfo).thenReturn(
      const DeviceInfo(
        id: 'dev1',
        name: 'test',
        appName: 'moonfin',
        appVersion: '0.0.0',
      ),
    );

    adapter = _RecordingAdapter();
    final dio = Dio();
    dio.httpClientAdapter = adapter;
    service = PluginSyncService(prefs, store, dio: dio);

    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    expect(await service.refreshAvailability(client), isTrue);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    adapter.requests.clear();
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('a device profile reset deletes it and reloads what is left', () async {
    final ok = await service.resetProfileToDefaults(client, profile: 'desktop');

    expect(ok, isTrue);
    expect(
      adapter.requests,
      containsAllInOrder([
        'DELETE /Moonfin/Settings/Profile/desktop',
        'GET /Moonfin/Settings/Resolved/desktop',
      ]),
    );
  });

  test('resetting global deletes the whole settings file', () async {
    final ok = await service.resetProfileToDefaults(client, profile: 'global');

    expect(ok, isTrue);
    expect(adapter.requests, contains('DELETE /Moonfin/Settings'));
  });

  test('a changed setting is back to its default afterwards', () async {
    await prefs.set(UserPreferences.use24HourClock, true);
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);

    await service.resetProfileToDefaults(client, profile: 'desktop');

    expect(prefs.get(UserPreferences.use24HourClock), isFalse);
  });

  test('what the server still resolves lands on top of the defaults', () async {
    adapter.resolvedProfile = {'use24HourClock': true};

    await service.resetProfileToDefaults(client, profile: 'desktop');

    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
  });

  test('the reset never pushes the cleared settings back', () async {
    await prefs.set(UserPreferences.use24HourClock, true);
    await service.resetProfileToDefaults(client, profile: 'desktop');
    await settle();

    expect(postCount(), 0);
  });

  test('an edit after a reset still reaches the server', () async {
    await service.resetProfileToDefaults(client, profile: 'desktop');

    await prefs.set(UserPreferences.use24HourClock, true);
    await settle();

    expect(postCount(), 1);
  });

  test('the snapshot of the deleted profile stops suppressing', () async {
    // Pushed while everything is still at its default, so the payload the
    // reset leaves behind is the one already recorded. Only clearing the
    // snapshot lets the push below through.
    await service.pushSettingsForProfile(client, profile: 'desktop');
    expect(postCount(), 1);

    adapter.failResolved = true;
    await service.resetProfileToDefaults(client, profile: 'desktop');
    await service.pushSettingsForProfile(client, profile: 'desktop');

    expect(postCount(), 2);
  });

  test('a refused delete leaves the settings alone', () async {
    await prefs.set(UserPreferences.use24HourClock, true);
    adapter.failDeletes = true;

    final ok = await service.resetProfileToDefaults(client, profile: 'desktop');

    expect(ok, isFalse);
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
  });

  test('a re-ping keeps the incomplete recordings it already has', () async {
    final incomplete = IncompleteRecordingsService(
      client: () => client,
      dio: Dio()..httpClientAdapter = adapter,
    );
    GetIt.instance.registerSingleton<IncompleteRecordingsService>(incomplete);
    int reads() => adapter.requests
        .where((r) => r == 'GET /Moonfin/LiveTv/Recordings/Incomplete')
        .length;

    adapter.incompleteRecordingsSupported = true;
    await service.refreshAvailability(client);
    await pumpEventQueue();
    await service.refreshAvailability(client);
    await pumpEventQueue();

    expect(incomplete.supported, isTrue);
    expect(reads(), 1);

    adapter.incompleteRecordingsSupported = false;
    await service.refreshAvailability(client);

    expect(incomplete.supported, isFalse);
    incomplete.dispose();
  });

  test(
      'failed notification push followed by same-session refresh preserves unsynced edits and blocks stale fetch',
      () async {
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(true);
    expect(seerr.notifyOnNewRequests, isTrue);

    adapter.failNotificationPush = true;
    final pushed = await service.pushNotificationPrefs(client);
    expect(pushed, isFalse);

    // Stale server values have false
    adapter.notificationPrefs = {'notifyOnNewRequests': false};

    // Same-session refresh preserves pending changes
    await service.refreshAvailability(client);

    adapter.requests.clear();
    // Stale fetch should be ignored because edits are pending sync
    await service.fetchNotificationPrefs(client);
    expect(
      adapter.requests,
      isNot(contains('GET /Moonfin/Notifications/Prefs')),
    );
    expect(seerr.notifyOnNewRequests, isTrue);

    // Session teardown clears pending notification changes
    service.resetState(clearPersistedNotificationEdits: true);
    adapter.failNotificationPush = false;
    adapter.requests.clear();
    await service.refreshAvailability(client);

    // Now fetch applies server preferences
    await service.fetchNotificationPrefs(client);
    expect(
      adapter.requests,
      contains('GET /Moonfin/Notifications/Prefs'),
    );
    expect(seerr.notifyOnNewRequests, isFalse);
  });

  test(
      'in-flight notification fetch does not overwrite local toggle changed before push and push sends new value',
      () async {
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(false);
    expect(seerr.notifyOnNewRequests, isFalse);

    // Server has false
    adapter.notificationPrefs = {'notifyOnNewRequests': false};
    adapter.notificationGetCompleter = Completer<void>();

    // Start fetch in background
    final fetchFuture = service.fetchNotificationPrefs(client);

    // User toggles setting in UI: mark modified, update local preference,
    // and simulate permission request delay before push
    service.markNotificationPrefsModified();
    await seerr.setNotifyOnNewRequests(true);
    await Future<void>.delayed(const Duration(milliseconds: 20));

    // GET completes while permission / push is pending
    adapter.notificationGetCompleter!.complete();
    await fetchFuture;

    // Verify local preference was NOT overwritten by the GET response
    expect(seerr.notifyOnNewRequests, isTrue);

    // Push local preferences to server
    final pushed = await service.pushNotificationPrefs(client);
    expect(pushed, isTrue);

    // Verify POST payload contains the new value
    expect(
      adapter.lastNotificationPostPayload,
      isA<Map<String, dynamic>>(),
    );
    expect(
      adapter.lastNotificationPostPayload['notifyOnNewRequests'],
      isTrue,
    );
  });

  test(
      'pending notification edit survives restart and blocks stale startup fetch',
      () async {
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(true);
    adapter.failNotificationPush = true;
    final pushed = await service.pushNotificationPrefs(client);
    expect(pushed, isFalse);

    // Simulate restart with fresh service instance sharing the store
    final dio = Dio()..httpClientAdapter = adapter;
    final restartedService = PluginSyncService(prefs, store, dio: dio);
    adapter.failNotificationPush = false;
    adapter.notificationPrefs = {'notifyOnNewRequests': false};
    expect(await restartedService.refreshAvailability(client), isTrue);

    adapter.requests.clear();
    await restartedService.fetchNotificationPrefs(client);
    expect(
      adapter.requests,
      isNot(contains('GET /Moonfin/Notifications/Prefs')),
    );
    expect(seerr.notifyOnNewRequests, isTrue);
  });

  test(
      'availability gap retries pending edits when plugin availability returns',
      () {
    fakeAsync((async) {
      final seerr = GetIt.instance<SeerrPreferences>();
      seerr.setNotifyOnNewRequests(true);
      async.flushMicrotasks();

      adapter.failNotificationPush = true;
      service.pushNotificationPrefs(client);
      async.elapse(const Duration(milliseconds: 100));

      // Plugin becomes unavailable while retry timer is ticking
      service.resetState(keepPendingNotificationChanges: true);
      adapter.failNotificationPush = false;
      adapter.requests.clear();

      // Fire the 5-second retry timer while plugin is still unavailable
      async.elapse(const Duration(seconds: 6));

      // Assert that no POST succeeded while unavailable
      expect(
        adapter.requests.where((r) => r.startsWith('POST /Moonfin/Notifications/Prefs')),
        isEmpty,
      );

      // Now plugin availability returns
      service.refreshAvailability(client);
      async.elapse(const Duration(milliseconds: 100));

      // Assert that new POST was sent upon recovery with local value
      expect(
        adapter.requests,
        contains('POST /Moonfin/Notifications/Prefs'),
      );
      expect(
        adapter.lastNotificationPostPayload['notifyOnNewRequests'],
        isTrue,
      );
    });
  });

  test(
      'availability refresh catch branch preserves pending notification edits',
      () async {
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(true);

    adapter.failNotificationPush = true;
    expect(await service.pushNotificationPrefs(client), isFalse);

    // Re-ping fails with error
    when(() => client.baseUrl).thenThrow(Exception('network error'));
    expect(await service.refreshAvailability(client), isFalse);

    // When client recovers, pending edit is still unsynced and not wiped
    when(() => client.baseUrl).thenReturn('http://plugin.test');
    adapter.failNotificationPush = false;
    adapter.notificationPrefs = {'notifyOnNewRequests': false};
    await service.refreshAvailability(client);

    adapter.requests.clear();
    await service.fetchNotificationPrefs(client);
    expect(
      adapter.requests,
      isNot(contains('GET /Moonfin/Notifications/Prefs')),
    );
    expect(seerr.notifyOnNewRequests, isTrue);
  });

  test('concurrent notification preference pushes are serialized', () async {
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(true);

    final push1 = service.pushNotificationPrefs(client);
    await seerr.setNotifyOnLibraryAdded(true);
    final push2 = service.pushNotificationPrefs(client);

    final results = await Future.wait([push1, push2]);
    expect(results, [true, true]);
    expect(adapter.lastNotificationPostPayload['notifyOnLibraryAdded'], isTrue);
  });

  test(
      'older POST completion does not clear unsynced flag when newer edit is queued and subsequent failed POST retries',
      () {
    fakeAsync((async) {
      final seerr = GetIt.instance<SeerrPreferences>();
      seerr.setNotifyOnNewRequests(true);
      async.flushMicrotasks();

      // Hold the first POST
      adapter.notificationPostReceivedCompleter = Completer<void>();
      adapter.notificationPostCompleter = Completer<void>();
      adapter.failNotificationPush = false;
      service.pushNotificationPrefs(client);

      // Wait until the first POST reaches the adapter before queuing the second edit
      async.elapse(const Duration(milliseconds: 100));
      expect(adapter.notificationPostReceivedCompleter!.isCompleted, isTrue);

      // Queue a second edit while first POST is in-flight
      service.markNotificationPrefsModified(client: client);
      seerr.setNotifyOnLibraryAdded(true);
      service.pushNotificationPrefs(client);
      async.flushMicrotasks();

      // Release first POST so it succeeds
      adapter.notificationPostCompleter!.complete();
      adapter.notificationPostCompleter = null;
      async.flushMicrotasks();

      // Make second POST fail
      adapter.failNotificationPush = true;
      async.elapse(const Duration(milliseconds: 100));

      // Verify edit remains pending
      expect(service.hasUnsyncedNotificationPrefsFor('http_plugin_test/'), isTrue);

      // Verify that the timer retries with the latest preferences before calling fetchNotificationPrefs
      adapter.requests.clear();
      adapter.failNotificationPush = false;
      adapter.notificationPrefs = {
        'notifyOnNewRequests': false,
        'notifyOnLibraryAdded': false,
      };

      // Advance virtual time across the 5s retry timer
      async.elapse(const Duration(seconds: 6));

      // Assert timer started a retry with the latest preferences
      expect(
        adapter.requests,
        contains('POST /Moonfin/Notifications/Prefs'),
      );
      expect(
        adapter.lastNotificationPostPayload['notifyOnNewRequests'],
        isTrue,
      );
      expect(
        adapter.lastNotificationPostPayload['notifyOnLibraryAdded'],
        isTrue,
      );
      expect(service.hasUnsyncedNotificationPrefsFor('http_plugin_test/'), isFalse);

      // Now call fetchNotificationPrefs; since unsynced is cleared, it can safely fetch from server
      adapter.requests.clear();
      service.fetchNotificationPrefs(client);
      async.elapse(const Duration(milliseconds: 100));
      expect(
        adapter.requests,
        contains('GET /Moonfin/Notifications/Prefs'),
      );
    });
  });

  test(
      'older push completion after session reset does not clear newer active push or allow concurrent push',
      () {
    fakeAsync((async) {
      final seerr = GetIt.instance<SeerrPreferences>();
      seerr.setNotifyOnNewRequests(true);
      async.flushMicrotasks();

      // Start push1 and hold it in adapter
      final post1Received = Completer<void>();
      final post1Release = Completer<void>();
      adapter.notificationPostReceivedCompleter = post1Received;
      adapter.notificationPostCompleter = post1Release;
      service.pushNotificationPrefs(client);
      async.elapse(const Duration(milliseconds: 100));
      expect(post1Received.isCompleted, isTrue);

      // Session reset clears _activeNotificationPush but post1 is still in flight
      service.resetState();
      expect(service.pluginAvailable, isFalse);

      // Restore plugin availability for a new session
      service.refreshAvailability(client);
      async.elapse(const Duration(milliseconds: 100));
      expect(service.pluginAvailable, isTrue);

      // Start push2 for the new session and hold it in adapter as well
      final post2Release = Completer<void>();
      adapter.notificationPostCompleter = post2Release;
      seerr.setNotifyOnLibraryAdded(true);
      service.pushNotificationPrefs(client);
      async.elapse(const Duration(milliseconds: 100));

      // Release the older post1. Its finally block must NOT clear _activeNotificationPush
      // because _activeNotificationPush now refers to push2.
      post1Release.complete();
      async.flushMicrotasks();

      // Triggering another push while push2 is still in flight should be queued,
      // NOT sent concurrently as a second active POST.
      adapter.requests.clear();
      service.pushNotificationPrefs(client);
      async.flushMicrotasks();
      expect(
        adapter.requests.where((r) => r.startsWith('POST /Moonfin/Notifications/Prefs')),
        isEmpty,
      );

      // Now release push2; the queued push drains sequentially
      post2Release.complete();
      async.elapse(const Duration(milliseconds: 100));
      expect(
        adapter.requests.where((r) => r.startsWith('POST /Moonfin/Notifications/Prefs')),
        isNotEmpty,
      );
    });
  });

  test(
      'canPushNotificationPrefsOnSignIn guards sign-in push after failed fetch',
      () async {
    // Fresh client before any fetch or edits
    expect(service.canPushNotificationPrefsOnSignIn(client), isFalse);

    // After successful fetch, sign-in push is allowed
    adapter.notificationPrefs = {'notifyOnNewRequests': true};
    await service.fetchNotificationPrefs(client);
    expect(service.hasFetchedNotificationPrefs(client), isTrue);
    expect(service.canPushNotificationPrefsOnSignIn(client), isTrue);

    // Reset session without edits
    service.resetState();
    expect(service.canPushNotificationPrefsOnSignIn(client), isFalse);

    // If an unsynced local edit exists, sign-in push is allowed to retry
    final seerr = GetIt.instance<SeerrPreferences>();
    await seerr.setNotifyOnNewRequests(true);
    service.markNotificationPrefsModified(client: client);
    expect(service.canPushNotificationPrefsOnSignIn(client), isTrue);
  });

  test(
      'syncOnLogin skips duplicate notification preference GET when first fetch succeeds',
      () async {
    // Unset sync initialized so the initial configuration branch runs
    await prefs.set(
      UserPreferences.pluginSyncInitializedForServer('http_plugin_test/'),
      false,
    );
    adapter.requests.clear();
    await service.syncOnLogin(client);
    final getPrefsRequests = adapter.requests
        .where((r) => r.startsWith('GET /Moonfin/Notifications/Prefs'))
        .toList();
    expect(getPrefsRequests.length, 1);
  });

  test(
      'pushNotificationPrefs aborts POST if session is reset while awaiting endpoint resolution',
      () {
    fakeAsync((async) {
      final seerr = GetIt.instance<SeerrPreferences>();
      seerr.setNotifyOnNewRequests(true);
      async.flushMicrotasks();

      final plexClient = _MockClient();
      when(() => plexClient.baseUrl).thenReturn('http://plex.test');
      when(() => plexClient.accessToken).thenReturn('token');
      when(() => plexClient.serverType).thenReturn(ServerType.plex);
      when(() => plexClient.userId).thenReturn('user1');
      when(() => plexClient.deviceInfo).thenReturn(
        const DeviceInfo(id: 'dev1', name: 'test', appName: 'moonfin', appVersion: '0.0.0'),
      );

      adapter.pingCompleter = Completer<void>();
      adapter.requests.clear();

      service.pushNotificationPrefs(plexClient);
      async.elapse(const Duration(milliseconds: 50));

      // Reset session while ping is still pending
      service.resetState();

      // Release ping
      adapter.pingCompleter!.complete();
      adapter.pingCompleter = null;
      async.elapse(const Duration(milliseconds: 100));

      // Assert that POST was aborted and never sent
      expect(
        adapter.requests.where((r) => r.startsWith('POST')),
        isEmpty,
      );
    });
  });

  test(
      'dispose cancels notification push retry timer and prevents rescheduling',
      () {
    fakeAsync((async) {
      final seerr = GetIt.instance<SeerrPreferences>();
      seerr.setNotifyOnNewRequests(true);
      async.flushMicrotasks();

      // Failed push schedules retry
      adapter.failNotificationPush = true;
      service.pushNotificationPrefs(client);
      async.elapse(const Duration(milliseconds: 100));

      // Dispose service
      service.dispose();
      adapter.failNotificationPush = false;
      adapter.requests.clear();

      // Advancing virtual time should NOT trigger a retry POST
      async.elapse(const Duration(seconds: 10));
      expect(
        adapter.requests.where((r) => r.startsWith('POST /Moonfin/Notifications/Prefs')),
        isEmpty,
      );
    });
  });

  test(
      'pending notification edit for one user does not block another user fetch or trigger push',
      () async {
    final clientA = client;
    final userKeyA = service.userSyncKey(clientA);

    final clientB = _MockClient();
    when(() => clientB.baseUrl).thenReturn('http://plugin.test');
    when(() => clientB.accessToken).thenReturn('token_b');
    when(() => clientB.serverType).thenReturn(ServerType.jellyfin);
    when(() => clientB.userId).thenReturn('user2');
    when(() => clientB.deviceInfo).thenReturn(
      const DeviceInfo(id: 'dev1', name: 'test', appName: 'moonfin', appVersion: '0.0.0'),
    );
    final userKeyB = service.userSyncKey(clientB);

    // User A marks edits modified
    service.markNotificationPrefsModified(client: clientA);
    expect(service.hasUnsyncedNotificationPrefsFor(userKeyA), isTrue);
    expect(service.hasUnsyncedNotificationPrefsFor(userKeyB), isFalse);

    // Prepare response for user B's fetch
    adapter.notificationPrefs = {'notifyOnNewRequests': true};
    adapter.requests.clear();

    // User B fetches notification prefs
    await service.fetchNotificationPrefs(clientB);

    // Assert that User B issued a GET, did not POST, and did not clear User A's pending state
    expect(
      adapter.requests.where((r) => r.startsWith('GET /Moonfin/Notifications/Prefs')).length,
      1,
    );
    expect(
      adapter.requests.where((r) => r.startsWith('POST')),
      isEmpty,
    );
    expect(service.hasUnsyncedNotificationPrefsFor(userKeyA), isTrue);
    expect(service.hasUnsyncedNotificationPrefsFor(userKeyB), isFalse);
  });
}
