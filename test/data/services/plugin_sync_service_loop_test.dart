import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}
class _MockConnectivityAwareClient extends Mock
    implements ConnectivityAwareMediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

/// Serves canned plugin responses and records every request, so the tests can
/// assert exactly which sync calls went over the wire.
class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];

  /// Body returned for the Resolved endpoint, replaceable per test.
  Map<String, dynamic> resolvedProfile = {};
  Map<String, dynamic>? lastPushedProfile;
  List<String>? savedPins;
  bool supportsPinChanges = true;
  bool failPinChanges = false;
  bool missingProfileUntilPins = false;
  Completer<void>? responseReady;
  Completer<void>? responseGate;
  final List<String> pinActions = [];

  void applyPinChange(Map<dynamic, dynamic> change) {
    final action = change['action'] as String;
    pinActions.add(action);
    if (action == 'initializeIfAbsent') {
      savedPins ??= List<String>.from(change['filters'] as List);
      return;
    }
    final pins = savedPins ??= <String>[];
    final filter = change['filter'] as String;
    if (action == 'add' && !pins.contains(filter)) pins.add(filter);
    if (action == 'remove') pins.remove(filter);
  }

  Future<void> holdResponse() async {
    final gate = responseGate;
    if (gate == null) return;
    if (responseReady?.isCompleted == false) {
      responseReady!.complete();
    }
    await gate.future;
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final path = options.uri.path;
    requests.add('${options.method} $path');

    Map<String, dynamic>? body;
    if (path.endsWith('/Moonfin/Ping')) {
      body = {'installed': true, 'settingsSyncEnabled': true};
    } else if (path.contains('/Moonfin/Settings/Resolved/')) {
      if (missingProfileUntilPins && savedPins == null) {
        return ResponseBody.fromString('', 404);
      }
      body = {
        ...resolvedProfile,
        if (savedPins != null) 'liveTvSavedFilters': List<String>.of(savedPins!),
      };
      await holdResponse();
    } else if (path.contains('/Moonfin/Settings/Profile/')) {
      if (options.method == 'POST' && failPinChanges) {
        return ResponseBody.fromString('Temporarily unavailable', 503);
      }
      body = {
        if (supportsPinChanges && savedPins != null)
          'liveTvSavedFilters': List<String>.of(savedPins!),
      };
      if (options.method == 'POST') await holdResponse();
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

  Future<List<String>?> togglePin(String filter) =>
      service.changePinnedGuideFilter(client, filter: filter);

  int postCount() => adapter.requests
      .where((r) => r.startsWith('POST') && r.contains('/Settings/Profile/'))
      .length;
  int resolvedCount() =>
      adapter.requests.where((r) => r.contains('/Settings/Resolved/')).length;

  setUp(() async {
    SharedPreferences.setMockInitialValues({
      'pref_last_server_id': 'srv1', 'pref_last_user_id': 'user1',
    });
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
    when(() => client.userId).thenReturn('user1');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.deviceInfo).thenReturn(const DeviceInfo(
      id: 'dev1', name: 'test', appName: 'moonfin', appVersion: '0.0.0',
    ));

    adapter = _RecordingAdapter();
    final dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      if (request.method == 'POST' &&
          request.path.contains('/Settings/Profile/') &&
          request.data is Map) {
        final body = request.data as Map;
        if (body['profile'] case final Map profile) {
          adapter.lastPushedProfile = Map<String, dynamic>.from(profile);
        }
        if (body['liveTvSavedFilterChange'] case final Map change
            when adapter.supportsPinChanges && !adapter.failPinChanges) {
          adapter.applyPinChange(change);
        }
      }
      handler.next(request);
    }));
    dio.httpClientAdapter = adapter;
    service = PluginSyncService(prefs, store, dio: dio);

    // Enabled while the plugin still reads unavailable, so this set schedules
    // nothing. Availability comes from the canned Ping afterwards.
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    expect(await service.refreshAvailability(client), isTrue);
    GetIt.instance.registerSingleton<MediaServerClient>(client);
    adapter.requests.clear();
  });

  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('atomic pin toggles preserve request order', () async {
    adapter.savedPins = [];
    await Future.wait([togglePin('group:Sports'), togglePin('group:Sports')]);
    expect(adapter.pinActions, ['add', 'remove']);
    expect(prefs.get(UserPreferences.liveTvSavedFilters), isEmpty);
  });

  test('regular settings updates do not overwrite atomic guide pins', () async {
    const local = ['group:US | SPORTS, Canada', 'category:sports'];
    await prefs.set(UserPreferences.liveTvSavedFilters, local);
    await prefs.set(UserPreferences.liveTvSavedFiltersUnsynced, true);
    await service.pushSettingsForProfile(client, profile: 'desktop');
    expect(adapter.lastPushedProfile?.containsKey('liveTvSavedFilters'), isFalse);

    expect(await togglePin('group:News'), [...local, 'group:News']);
    expect(adapter.pinActions, ['initializeIfAbsent', 'add']);
    adapter.savedPins = ['group:News', 'category:movies'];
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
    expect(prefs.get(UserPreferences.liveTvSavedFilters), adapter.savedPins);
    // With no personal pins, subsequent pulls follow changed admin defaults.
    adapter.savedPins = null;
    for (final pins in [
      ['group:Sports'],
      ['group:News'],
      <String>[],
    ]) {
      adapter.resolvedProfile = {'liveTvSavedFilters': pins};
      expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
      expect(prefs.get(UserPreferences.liveTvSavedFilters), pins);
    }
    expect(adapter.pinActions, ['initializeIfAbsent', 'add']);

    // An explicit empty server list still wins over unsynced local pins.
    adapter.savedPins = [];
    await prefs.set(UserPreferences.liveTvSavedFilters, ['group:Local']);
    await prefs.set(UserPreferences.liveTvSavedFiltersUnsynced, true);
    expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
    expect(prefs.get(UserPreferences.liveTvSavedFilters), isEmpty);
  });

  test('offline pins import when Moonbase first becomes available', () async {
    adapter.missingProfileUntilPins = true;
    await prefs.set(UserPreferences.liveTvSavedFilters, ['group:Sports']);
    service.resetState();
    expect(
      await Future.wait([togglePin('group:Movies'), togglePin('group:News')]),
      [null, null],
    );
    expect(adapter.requests, isEmpty);
    expect(prefs.get(UserPreferences.liveTvSavedFiltersUnsynced), isTrue);

    expect(await service.refreshAvailability(client), isTrue);
    expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
    expect(adapter.pinActions, ['initializeIfAbsent']);
    expect(adapter.savedPins, ['group:Sports', 'group:Movies', 'group:News']);
    expect(prefs.get(UserPreferences.liveTvSavedFiltersUnsynced), isFalse);
  });

  test('legacy and failing Moonbase writes preserve pins until recovery', () async {
    adapter.supportsPinChanges = false;
    adapter.resolvedProfile = {
      'liveTvSavedFilters': ['group:Admin'],
      'use24HourClock': true,
    };
    await prefs.set(UserPreferences.liveTvSavedFilters, ['group:Sports']);
    expect(await togglePin('group:Movies'), isNull);
    const local = ['group:Sports', 'group:Movies'];
    // The first sign-in must restore ordinary settings even with old Moonbase.
    await service.syncOnLogin(client, serverId: 'srv1');
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
    expect(prefs.get(UserPreferences.liveTvSavedFilters), local);

    adapter.supportsPinChanges = true;
    adapter.failPinChanges = true;
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
    expect(prefs.get(UserPreferences.liveTvSavedFilters), local);
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    adapter.failPinChanges = false;
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
    expect(adapter.savedPins, local);
    expect(prefs.get(UserPreferences.liveTvSavedFiltersUnsynced), isFalse);
  });

  test('queued pin replies cannot overwrite newer settings or another account', () async {
    adapter.savedPins = [];
    adapter.responseReady = Completer<void>();
    adapter.responseGate = Completer<void>();
    final saving = togglePin('group:Sports');
    await adapter.responseReady!.future;
    adapter.savedPins = ['group:Sports', 'group:News'];
    final updating = service.handleServerEvent(client, {'type': 'settingsUpdated'});
    await Future<void>.delayed(Duration.zero);
    expect(resolvedCount(), 0);
    adapter.responseGate!.complete();
    expect(await saving, ['group:Sports']);
    await updating;
    expect(prefs.get(UserPreferences.liveTvSavedFilters),
        ['group:Sports', 'group:News']);

    adapter.responseReady = Completer<void>();
    adapter.responseGate = Completer<void>();
    final stale = togglePin('group:Movies');
    await adapter.responseReady!.future;
    final queued = togglePin('group:Kids');
    final rejected = expectLater(stale, throwsA(isA<StateError>()));
    final queuedRejected = expectLater(queued, throwsA(isA<StateError>()));
    when(() => client.userId).thenReturn('other');
    adapter.responseGate!.complete();
    await Future.wait([rejected, queuedRejected]);
    expect(prefs.get(UserPreferences.liveTvSavedFilters),
        ['group:Sports', 'group:News']);
  });

  test('pin edits wait for sign-in through the active client wrapper', () async {
    final active = _MockConnectivityAwareClient();
    when(() => active.onlineClient).thenReturn(client);
    await GetIt.instance.unregister<MediaServerClient>();
    GetIt.instance.registerSingleton<MediaServerClient>(active);
    adapter.resolvedProfile = {'use24HourClock': true};
    adapter.savedPins = ['group:Sports'];
    await prefs.set(UserPreferences.pluginSyncInitializedForServer('srv1'), true);
    adapter.responseReady = Completer<void>();
    adapter.responseGate = Completer<void>();
    final signingIn = service.syncOnLogin(client, serverId: 'srv1');
    await adapter.responseReady!.future;
    final add = togglePin('group:News');
    expect(adapter.pinActions, isEmpty);
    adapter.responseGate!.complete();
    await signingIn;
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(await add, ['group:Sports', 'group:News']);
    expect(prefs.get(UserPreferences.liveTvSavedFilters),
        ['group:Sports', 'group:News']);
    service.resetState();
  });

  test('only changed, forced, or reset settings push again', () async {
    await service.pushSettingsForProfile(client, profile: 'desktop');
    await service.pushSettingsForProfile(client, profile: 'desktop');
    expect(postCount(), 1);

    await prefs.set(UserPreferences.use24HourClock, true);
    await service.pushSettingsForProfile(client, profile: 'desktop');
    expect(postCount(), 2);

    await service.pushSettingsForProfile(client, profile: 'desktop', force: true);
    expect(postCount(), 3);

    service.resetState();
    await service.refreshAvailability(client);
    await service.pushSettingsForProfile(client, profile: 'desktop');
    expect(postCount(), 4);
  });

  test('remote settings apply without pushing them back', () async {
    adapter.resolvedProfile = {'use24HourClock': true};
    var notified = false;
    prefs.addListener(() => notified = true);
    await service.handleServerEvent(client, {'type': 'settingsUpdated'});
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(notified, isTrue);

    await service.pushSettings(client);
    // Allow the push debounce to expire before checking for an echo.
    await Future<void>.delayed(const Duration(milliseconds: 1400));
    expect(resolvedCount(), 1);
    expect(postCount(), 0);
  });

}
