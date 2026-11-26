import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/auth/repositories/session_repository.dart';
import 'package:moonfin/data/offline/connectivity_aware_media_server_client.dart';
import 'package:moonfin/data/services/guide_pin_transport.dart';
import 'package:moonfin/data/services/plugin_sync_service.dart';
import 'package:moonfin/preference/seerr_preferences.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockClient extends Mock implements MediaServerClient {}
class _MockConnectivityAwareClient extends Mock
    implements ConnectivityAwareMediaServerClient {}

class _MockSessionRepository extends Mock implements SessionRepository {}

class _TestPreferences extends UserPreferences {
  _TestPreferences(super.store);
  String? failWrite;

  @override
  Future<void> set<T>(Preference<T> pref, T value) async {
    await super.set(pref, value);
    if (pref.key == failWrite) {
      failWrite = null;
      throw StateError('Simulated preference write failure');
    }
  }
}

/// Serves canned plugin responses and records every request, so the tests can
/// assert exactly which sync calls went over the wire.
class _RecordingAdapter implements HttpClientAdapter {
  final List<String> requests = [];

  /// Body returned for the Resolved endpoint, replaceable per test.
  Map<String, dynamic> resolvedProfile = {};
  Map<String, dynamic>? lastPushedProfile;
  List<String>? savedPins;
  RequestOptions? lastPinRequest;
  bool supportsPinChanges = true;
  bool failPinChanges = false;
  String? unavailablePin;
  String? rejectedPin;
  bool missingProfileUntilPins = false;
  bool confirmsEmptyPins = false;
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

  void pauseResponses() {
    responseReady = Completer<void>();
    responseGate = Completer<void>();
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
        return ResponseBody.fromString(
          confirmsEmptyPins && options.queryParameters['includeLiveTvSavedFilters'] == true
              ? '{"liveTvSavedFilters":[]}'
              : '{}',
          404,
          headers: {Headers.contentTypeHeader: [Headers.jsonContentType]},
        );
      }
      body = {
        ...resolvedProfile,
        if (savedPins != null) 'liveTvSavedFilters': List<String>.of(savedPins!),
      };
      await holdResponse();
    } else if (path.contains('/Moonfin/Settings/Profile/')) {
      final change = options.data?['liveTvSavedFilterChange'];
      if (change != null) lastPinRequest = options;
      if (options.data?['profile'] case final Map profile) lastPushedProfile = Map<String, dynamic>.from(profile);
      final filter = options.data?['liveTvSavedFilterChange']?['filter'];
      if (filter != null && filter == rejectedPin) {
        await holdResponse();
        return ResponseBody.fromString('', 400);
      }
      if (options.method == 'POST' && (failPinChanges || (filter != null && filter == unavailablePin))) {
        return ResponseBody.fromString('Temporarily unavailable', 503);
      }
      if (options.method == 'POST' && supportsPinChanges && change is Map) applyPinChange(change);
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
  late _TestPreferences prefs;
  late PluginSyncService service;
  late _MockClient client;

  Future<List<String>?> togglePin(String filter) =>
      service.changePinnedGuideFilter(client, filter: filter);

  ({Future<List<String>?> saved, Future<void> local}) editPin(String pin) {
    final local = Completer<void>();
    final saved = service.changePinnedGuideFilter(client, filter: pin, onLocalChange: local.complete);
    return (saved: saved, local: local.future);
  }

  Future<void> settingsUpdated() => service.handleServerEvent(client, {'type': 'settingsUpdated'});
  List<String> getPins() => prefs.get(UserPreferences.liveTvSavedFilters);
  List<String> pendingPins() => prefs.get(UserPreferences.liveTvSavedFilterChanges);

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
    prefs = _TestPreferences(store);

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
    final dio = Dio()..httpClientAdapter = adapter;
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

  test('guide pin edits on an HTTP server opt into guarded redirects', () async {
    expect(await togglePin('group:Sports'), ['group:Sports']);
    final request = adapter.lastPinRequest!;
    expect(request.uri.scheme, 'http');
    expect(request.followRedirects, isFalse);
    expect(request.extra[sameOriginRedirectsOnly], isTrue);
  });

  test('the browser pin transport sends the edit with redirects disabled', () async {
    final options = RequestOptions(path: 'https://plugin.test/pins', data: {'action': 'add'});
    final reply = await http.runWithClient(
      () => postBrowserGuidePin(options),
      () => MockClient((request) async {
        expect(request.followRedirects, isFalse);
        expect(jsonDecode(request.body), options.data);
        return http.Response('{"liveTvSavedFilters":["group:Sports"]}', 200);
      }),
    );
    expect(reply.data?['liveTvSavedFilters'], ['group:Sports']);
  });

  for (final pref in [UserPreferences.liveTvSavedFilters, UserPreferences.liveTvSavedFilterChanges]) {
    test('a failed write to ${pref.key} preserves only earlier pin edits', () async {
      adapter.failPinChanges = true;
      await togglePin('group:News');
      prefs.failWrite = prefs.getEffectivePreference(pref).key;
      await expectLater(togglePin('group:Sports'), throwsStateError);
      expect(getPins(), ['group:News']);
      expect(pendingPins(), ['add:group:News']);
      adapter.failPinChanges = false;
      await settingsUpdated();
      expect(adapter.savedPins, ['group:News']);
      expect(adapter.pinActions, ['add']);
    });
  }

  test('rejecting the first add preserves a later add of the same pin', () async {
    const filter = 'group:Sports';
    adapter.rejectedPin = filter;
    adapter.pauseResponses();
    final first = togglePin(filter);
    await adapter.responseReady!.future;
    adapter.rejectedPin = null;
    final (saved: remove, local: removedChange) = editPin(filter);
    await removedChange;
    final (saved: add, local: addedChange) = editPin(filter);
    await addedChange;
    adapter.responseGate!.complete();
    await Future.wait([first, remove, add]);
    expect(postCount(), 2);
    expect(adapter.savedPins, [filter]);
    expect(getPins(), [filter]);
    expect(pendingPins(), isEmpty);
  });

  test('a second tap updates the guide while the first upload is waiting', () async {
    adapter.savedPins = [];
    adapter.pauseResponses();
    final first = togglePin('group:Sports');
    await adapter.responseReady!.future;
    final (saved: second, local: localChange) = editPin('group:Sports');
    await localChange;
    expect(getPins(), isEmpty);
    expect(adapter.pinActions, ['add']);
    adapter.responseGate!.complete();
    await Future.wait([first, second]);
    expect(adapter.pinActions, ['add', 'remove']);
    expect(adapter.savedPins, isEmpty);
    expect(pendingPins(), isEmpty);
  });

  test('switching sync off keeps queued pins local even after a settings event', () async {
    adapter.pauseResponses();
    final first = togglePin('group:Sports');
    await adapter.responseReady!.future;
    final (saved: second, local: localChange) = editPin('group:News');
    await localChange;
    final event = settingsUpdated();
    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    adapter.responseGate!.complete();
    await first;
    expect(await second, isNull);
    await event;
    await settingsUpdated();
    expect(resolvedCount(), 0);
    expect(adapter.savedPins, ['group:Sports']);
    expect(getPins(), ['group:Sports', 'group:News']);
    expect(pendingPins(), ['add:group:News']);
  });

  test('device reset reloads settings and leaves offline pins for the next sync', () async {
    service.resetState();
    await togglePin('group:Sports');
    adapter.savedPins = ['group:News'];
    adapter.resolvedProfile = {'use24HourClock': true};
    await service.refreshAvailability(client);

    expect(await service.resetProfileToDefaults(client, profile: 'desktop'), isTrue);
    expect(adapter.requests, contains('DELETE /Moonfin/Settings/Profile/desktop'));
    expect(postCount(), 0);
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(getPins(), ['group:Sports']);
    expect(pendingPins(), ['add:group:Sports']);

    await settingsUpdated();
    expect(adapter.pinActions, ['add']);
    expect(adapter.savedPins, ['group:News', 'group:Sports']);
    expect(getPins(), adapter.savedPins);
    expect(pendingPins(), isEmpty);
  });

  test('turning sync off cancels a reset queued behind a pin upload', () async {
    adapter.pauseResponses();
    final saving = togglePin('group:Sports');
    await adapter.responseReady!.future;

    final reset = service.resetProfileToDefaults(client, profile: 'global');
    await service.setSyncEnabled(false);
    adapter.responseGate!.complete();
    await saving;

    expect(await reset, isFalse);
    expect(
      adapter.requests.where((request) => request.startsWith('DELETE ')),
      isEmpty,
    );
    expect(getPins(), ['group:Sports']);
  });

  test('manual Save distinguishes profile failure from a pending or rejected pin', () async {
    Future<ProfilePushResult> save() => service.pushSettingsForProfile(client, profile: 'tv', force: true);
    adapter.failPinChanges = true; // The adapter returns 503 for all profile POSTs.
    expect(await save(), ProfilePushResult.failed);
    adapter.failPinChanges = false;
    adapter.unavailablePin = 'group:News';
    expect(await togglePin('group:News'), isNull);
    expect(await save(), ProfilePushResult.savedWithPinErrors);
    expect(pendingPins(), ['add:group:News']);
    adapter.unavailablePin = null;
    adapter.savedPins = ['group:Sports'];
    expect(await save(), ProfilePushResult.saved);
    expect(adapter.savedPins, ['group:Sports', 'group:News']);
    expect(pendingPins(), isEmpty);

    await prefs.set(UserPreferences.pluginSyncEnabled, false);
    await togglePin('group:Rejected');
    await prefs.set(UserPreferences.pluginSyncEnabled, true);
    adapter.rejectedPin = 'group:Rejected';
    expect(await save(), ProfilePushResult.savedWithPinErrors);
    expect(pendingPins(), isEmpty);
    expect(adapter.savedPins, ['group:Sports', 'group:News']);
  });

  test('only an explicit empty profile clears cached pins on another device', () async {
    await togglePin('group:News');
    adapter.savedPins = null;
    adapter.missingProfileUntilPins = true;
    await settingsUpdated();
    expect(getPins(), ['group:News']);
    adapter.confirmsEmptyPins = true;
    await settingsUpdated();
    expect(getPins(), isEmpty);

    service.resetState();
    await togglePin('group:Sports');
    await service.refreshAvailability(client);
    adapter.failPinChanges = true;
    await settingsUpdated();
    expect(getPins(), ['group:Sports']);
    expect(pendingPins(), ['add:group:Sports']);
  });

  for (final freshProfile in [false, true]) {
    test('offline guide edits survive a profile push and replay on reconnect (new profile=$freshProfile)', () async {
      const local = ['group:US | SPORTS, Canada', 'category:sports'];
      adapter.missingProfileUntilPins = freshProfile;
      adapter.savedPins = freshProfile ? null : [];
      service.resetState();
      expect(await Future.wait(local.map(togglePin)), [null, null]);
      expect(adapter.requests, isEmpty);
      expect(pendingPins(), [for (final pin in local) 'add:$pin']);

      await service.refreshAvailability(client);
      await service.pushSettingsForProfile(client, profile: 'desktop');
      expect(adapter.lastPushedProfile, isNot(contains('liveTvSavedFilters')));
      expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
      expect(await togglePin('group:News'), [...local, 'group:News']);
      expect(adapter.pinActions, ['add', 'add', 'add']);
      expect(adapter.savedPins, getPins());
      expect(pendingPins(), isEmpty);

      adapter.savedPins = ['group:News', 'category:movies'];
      await settingsUpdated();
      expect(getPins(), adapter.savedPins);
      adapter.missingProfileUntilPins = false;
      adapter.savedPins = null;
      adapter.resolvedProfile = {'liveTvCategoryDisplay': 'groups'};
      await settingsUpdated();
      expect(getPins(), ['group:News', 'category:movies']);
      for (final pins in [['group:Sports'], <String>[]]) {
        adapter.resolvedProfile = {'liveTvSavedFilters': pins};
        await service.pullSettingsForProfile(client, profile: 'desktop');
        expect(getPins(), pins);
      }
      expect(adapter.pinActions, ['add', 'add', 'add']);
    });
  }

  test('legacy and failing Moonbase writes preserve pins until recovery', () async {
    adapter.supportsPinChanges = false;
    adapter.savedPins = ['group:Admin'];
    adapter.resolvedProfile = {'use24HourClock': true};
    service.resetState();
    expect(await togglePin('group:Sports'), isNull);
    expect(await service.refreshAvailability(client), isTrue);
    expect(await togglePin('group:Movies'), isNull);
    const local = ['group:Sports', 'group:Movies'];

    // Old Moonbase must still restore unrelated settings without losing pins.
    await service.syncOnLogin(client, serverId: 'srv1');
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(await service.pullSettingsForProfile(client, profile: 'desktop'), isTrue);
    expect(getPins(), local);

    adapter.supportsPinChanges = true;
    adapter.failPinChanges = true;
    await settingsUpdated();
    expect(getPins(), local);
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    adapter.failPinChanges = false;
    await settingsUpdated();
    expect(adapter.savedPins, ['group:Admin', ...local]);
    expect(getPins(), adapter.savedPins);
    expect(pendingPins(), isEmpty);
  });

  test('reconnecting replays the last local choice and keeps edits made on another device', () async {
    adapter.savedPins = ['group:Sports', 'group:Kids'];
    await settingsUpdated();
    adapter.failPinChanges = true;
    expect(await togglePin('group:Sports'), isNull);
    expect(getPins(), ['group:Kids']);
    expect(pendingPins(), ['remove:group:Sports']);
    service.resetState();
    for (var tap = 0; tap < 3; tap++) { await togglePin('group:Movies'); }
    expect(pendingPins(), ['remove:group:Sports', 'add:group:Movies']);
    adapter.savedPins!.add('group:News');
    adapter.failPinChanges = false;
    adapter.unavailablePin = 'group:Movies';
    await service.refreshAvailability(client);
    await service.pullSettingsForProfile(client, profile: 'global');
    expect(pendingPins(), ['add:group:Movies']);
    expect(getPins(), contains('group:Movies'));

    adapter.savedPins!.add('group:Sports'); // Someone else re-pins it after our removal was confirmed.
    adapter.unavailablePin = null;
    await settingsUpdated();
    expect(adapter.pinActions, ['remove', 'add']);
    expect(getPins(), ['group:Kids', 'group:News', 'group:Sports', 'group:Movies']);
    expect(adapter.savedPins, getPins());
    expect(pendingPins(), isEmpty);
  });

  test('removing an over-limit local pin does not queue a server edit', () async {
    final pin = 'group:${'x' * 1024}';
    await prefs.set(UserPreferences.liveTvSavedFilters, [pin]);
    await togglePin(pin);
    expect(getPins(), isEmpty);
    expect(pendingPins(), isEmpty);
    expect(adapter.pinActions, isEmpty);
    await expectLater(togglePin(pin), throwsFormatException);
  });

  test('invalid pins surface an error and never block later edits', () async {
    await expectLater(togglePin('group:${'x' * 1024}'), throwsFormatException);
    adapter.rejectedPin = 'group:Rejected';
    await expectLater(togglePin('group:Rejected'), throwsA(isA<DioException>()));
    expect(getPins(), isEmpty);
    service.resetState();
    await togglePin('group:Rejected');
    await togglePin('group:News');
    await service.refreshAvailability(client);
    await service.pullSettingsForProfile(client, profile: 'global');
    expect(adapter.savedPins, ['group:News']);
    expect(pendingPins(), isEmpty);
  });

  test('queued pin replies cannot overwrite newer settings or another account', () async {
    adapter.savedPins = [];
    adapter.pauseResponses();
    final saving = togglePin('group:Sports');
    await adapter.responseReady!.future;
    adapter.savedPins = ['group:Sports', 'group:News'];
    expect(getPins(), ['group:Sports']);
    final updating = settingsUpdated();
    await Future<void>.delayed(Duration.zero);
    expect(resolvedCount(), 0);
    adapter.responseGate!.complete();
    expect(await saving, ['group:Sports']);
    await updating;
    expect(getPins(),
        ['group:Sports', 'group:News']);

    adapter.pauseResponses();
    final stale = togglePin('group:Movies');
    await adapter.responseReady!.future;
    final (saved: queued, local: localChange) = editPin('group:Kids');
    await localChange;
    final rejected = expectLater(stale, throwsA(isA<StateError>()));
    final queuedRejected = expectLater(queued, throwsA(isA<StateError>()));
    when(() => client.userId).thenReturn('other');
    adapter.responseGate!.complete();
    await Future.wait([rejected, queuedRejected]);
    // The old account keeps both local edits. Neither stale reply acknowledges them.
    expect(getPins(),
        ['group:Sports', 'group:News', 'group:Movies', 'group:Kids']);
    expect(pendingPins(),
        ['add:group:Movies', 'add:group:Kids']);
    expect(adapter.pinActions, ['add', 'add']);
  });

  for (final edit in [false, true]) {
    test('a ${edit ? 'pin edit' : 'settings event'} during sign-in waits for the server snapshot', () async {
      final active = _MockConnectivityAwareClient();
      when(() => active.onlineClient).thenReturn(client);
      await GetIt.instance.unregister<MediaServerClient>();
      GetIt.instance.registerSingleton<MediaServerClient>(active);
      adapter.resolvedProfile = {'use24HourClock': true};
      adapter.savedPins = ['group:Sports'];
      await prefs.set(UserPreferences.pluginSyncInitializedForServer('srv1'), true);
      adapter.pauseResponses();
      final signingIn = service.syncOnLogin(client, serverId: 'srv1');
      await adapter.responseReady!.future;
      final remove = edit ? togglePin('group:Sports') : null;
      final event = edit ? null : settingsUpdated();
      await Future<void>.delayed(Duration.zero);
      expect(resolvedCount(), 1);
      expect(adapter.pinActions, isEmpty);
      adapter.responseGate!.complete();
      await signingIn;
      await event;
      if (edit) expect(await remove, isEmpty);
      expect(prefs.get(UserPreferences.use24HourClock), isTrue);
      expect(adapter.pinActions, edit ? ['remove'] : isEmpty);
      expect(getPins(), edit ? isEmpty : ['group:Sports']);
      service.resetState();
    });
  }

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
    await settingsUpdated();
    expect(prefs.get(UserPreferences.use24HourClock), isTrue);
    expect(notified, isTrue);

    await service.pushSettings(client);
    // Allow the push debounce to expire before checking for an echo.
    await Future<void>.delayed(const Duration(milliseconds: 1400));
    expect(resolvedCount(), 1);
    expect(postCount(), 0);
  });

}
