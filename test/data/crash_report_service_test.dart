import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/crash_report_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _RecordingClientLogApi extends Fake implements ClientLogApi {
  final uploaded = <String>[];
  bool failUploads = false;
  Completer<void>? gate;

  @override
  Future<String?> uploadDocument(String content) async {
    if (failUploads) throw Exception('upload refused');
    await gate?.future;
    uploaded.add(content);
    return 'report.txt';
  }
}

class _TestClient extends Fake implements MediaServerClient {
  _TestClient(this._logApi);
  final ClientLogApi? _logApi;

  @override
  ClientLogApi? get clientLogApi => _logApi;
}

class _TestFactory extends Fake implements MediaServerClientFactory {
  _TestFactory({this.client});
  MediaServerClient? client;

  @override
  MediaServerClient getActiveClient() {
    final c = client;
    if (c == null) throw StateError('No active server clients');
    return c;
  }
}

Future<UserPreferences> _prefs({bool crashReports = true}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'pref_crash_reports_enabled': crashReports,
  });
  final store = PreferenceStore();
  await store.init();
  return UserPreferences(store);
}

Future<List<String>> _storedSignatures() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(CrashReportService.storageKey);
  if (raw == null) return [];
  return [
    for (final item in (jsonDecode(raw) as List).whereType<Map>())
      item['signature'] as String,
  ];
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('shouldCapture allows a signature once and caps the run', () async {
    final service = CrashReportService(await _prefs(), _TestFactory());

    expect(service.shouldCapture('a'), isTrue);
    expect(service.shouldCapture('a'), isFalse);
    for (final s in ['b', 'c', 'd', 'e']) {
      expect(service.shouldCapture(s), isTrue);
    }
    expect(
      service.shouldCapture('f'),
      isFalse,
      reason: 'a sixth distinct signature is past the per run cap',
    );
  });

  test('record keeps one report per signature and three overall', () async {
    final service = CrashReportService(await _prefs(), _TestFactory());

    await service.record('same', 'first');
    await service.record('same', 'second');
    expect(await _storedSignatures(), ['same']);

    await service.record('two', 't');
    await service.record('three', 't');
    await service.record('four', 't');
    expect(
      await _storedSignatures(),
      ['two', 'three', 'four'],
      reason: 'the oldest report gives way once three are held',
    );
  });

  test('record truncates an oversize report', () async {
    final service = CrashReportService(await _prefs(), _TestFactory());

    await service.record('big', 'x' * (80 * 1024));
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(CrashReportService.storageKey)!;
    final text = ((jsonDecode(raw) as List).first as Map)['text'] as String;
    expect(text.length, 64 * 1024);
  });

  test('reports past the age limit are dropped on load', () async {
    final service = CrashReportService(await _prefs(), _TestFactory());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      CrashReportService.storageKey,
      jsonEncode([
        {
          'signature': 'old',
          'time': DateTime.now()
              .subtract(const Duration(days: 20))
              .toIso8601String(),
          'text': 'stale',
        },
      ]),
    );

    await service.record('fresh', 'new report');
    expect(await _storedSignatures(), ['fresh']);
  });

  test('flushPending uploads then clears', () async {
    final api = _RecordingClientLogApi();
    final service = CrashReportService(
      await _prefs(),
      _TestFactory(client: _TestClient(api)),
    );
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(api.uploaded, ['the report']);
    expect(await _storedSignatures(), isEmpty);
  });

  test('a failed upload stays pending', () async {
    final api = _RecordingClientLogApi()..failUploads = true;
    final service = CrashReportService(
      await _prefs(),
      _TestFactory(client: _TestClient(api)),
    );
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(api.uploaded, isEmpty);
    expect(await _storedSignatures(), ['sig']);
  });

  test('flushPending skips when uploads are turned off', () async {
    final api = _RecordingClientLogApi();
    final service = CrashReportService(
      await _prefs(crashReports: false),
      _TestFactory(client: _TestClient(api)),
    );
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(api.uploaded, isEmpty);
  });

  test('flushPending skips servers without the endpoint', () async {
    final service = CrashReportService(
      await _prefs(),
      _TestFactory(client: _TestClient(null)),
    );
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(
      await _storedSignatures(),
      ['sig'],
      reason: 'a server without the endpoint leaves the report for one that has it',
    );
  });

  test('flushPending uploads to a server that has the endpoint', () async {
    final api = _RecordingClientLogApi();
    final service = CrashReportService(
      await _prefs(),
      _TestFactory(client: _TestClient(api)),
    );
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(api.uploaded, ['the report']);
    expect(
      await _storedSignatures(),
      isEmpty,
      reason: 'an uploaded report is not kept for a second send',
    );
  });

  test('flushPending skips when nobody is signed in', () async {
    final service = CrashReportService(await _prefs(), _TestFactory());
    await service.record('sig', 'the report');

    await service.flushPending();

    expect(await _storedSignatures(), ['sig']);
  });

  test('a second flush waits rather than uploading twice', () async {
    final api = _RecordingClientLogApi()..gate = Completer<void>();
    final service = CrashReportService(
      await _prefs(),
      _TestFactory(client: _TestClient(api)),
    );
    await service.record('sig', 'the report');

    final first = service.flushPending();
    await service.flushPending();
    api.gate!.complete();
    await first;

    expect(api.uploaded, ['the report']);
  });

  test('turning the toggle off clears pending reports', () async {
    final prefs = await _prefs();
    final service = CrashReportService(prefs, _TestFactory());
    await service.record('sig', 'the report');
    expect(await _storedSignatures(), isNotEmpty);

    await prefs.set(UserPreferences.crashReportsEnabled, false);
    await Future<void>.delayed(Duration.zero);

    expect(await _storedSignatures(), isEmpty);
    service.dispose();
  });
}
