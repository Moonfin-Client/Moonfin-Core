import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
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
    final store = PreferenceStore();
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

    // Stale fetch should be ignored because edits are pending sync
    await service.fetchNotificationPrefs(client);
    expect(seerr.notifyOnNewRequests, isTrue);

    // Session teardown clears pending notification changes
    service.resetState();
    adapter.failNotificationPush = false;
    await service.refreshAvailability(client);

    // Now fetch applies server preferences
    await service.fetchNotificationPrefs(client);
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
}
