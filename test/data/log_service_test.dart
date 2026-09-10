import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/log_service.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeClientFactory extends Fake implements MediaServerClientFactory {}

const _device = DeviceInfo(
  id: 'dev-1',
  name: 'Test Device',
  appName: 'Moonfin',
  appVersion: '0.0.0',
);

Future<LogService> _service({bool loggingEnabled = false}) async {
  SharedPreferences.setMockInitialValues(<String, Object>{
    if (loggingEnabled) 'pref_diagnostic_logging_enabled': true,
  });
  final store = PreferenceStore();
  await store.init();
  return LogService(UserPreferences(store), _FakeClientFactory(), _device);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a crash is recorded even while diagnostic logging is off', () async {
    final logs = await _service();

    logs.log(LogCategory.general, 'routine chatter');
    expect(logs.entryCount, 0, reason: 'ordinary logging stays gated');

    logs.logCrash('Uncaught: boom', 'boom\n#0 main (main.dart:1)');
    expect(logs.entryCount, 1);
    expect(logs.entries.single.level, LogLevel.error);
  });

  group('redaction logic', () {
    late LogService logs;

    setUp(() async {
      logs = await _service(loggingEnabled: true);
    });

    void assertRedacted(String input, String expectedSubstring) {
      logs.clear();
      logs.log(LogCategory.general, input);
      final text = logs.entries.single.message;
      expect(text, contains(expectedSubstring));
    }

    test('redacts logCrash entries (message and error)', () async {
      logs.clear();
      logs.logCrash(
        'Uncaught: bad response at https://myserver.example',
        'DioException for https://myserver.example:8096/Items',
      );

      final entry = logs.entries.single;
      expect(entry.message, contains('https://[REDACTED]'));
      expect(entry.error, contains('https://[REDACTED]'));
      expect(entry.message, isNot(contains('myserver.example')));
      expect(entry.error, isNot(contains('myserver.example')));
    });

    test('redacts URLs and preserves delimiters', () {
      assertRedacted(
        'Connected to https://my-server.com, status 200',
        'Connected to https://[REDACTED], status 200',
      );
      assertRedacted(
        'URL is <https://example.com>',
        'URL is <https://[REDACTED]>',
      );
    });

    test('redacts the host but keeps the endpoint', () {
      assertRedacted(
        'URL is <https://example.com/path>',
        'URL is <https://[REDACTED]/path>',
      );
      assertRedacted(
        'POST https://my-server.com/Items/abc/PlaybackInfo?maxStreamingBitrate=4000000',
        'POST https://[REDACTED]/Items/abc/PlaybackInfo?maxStreamingBitrate=4000000',
      );
    });

    test('redacts a credential left in a query string', () {
      assertRedacted(
        'GET https://my-server.com/Videos/abc/stream?MediaSourceId=abc'
        '&ApiKey=f3eebe84a7f443569c352dd45cf4521b',
        'MediaSourceId=abc&ApiKey=[REDACTED]',
      );
      assertRedacted(
        'GET https://my-server.com/Items?api_key=deadbeefcafe&limit=10',
        'api_key=[REDACTED]&limit=10',
      );
    });

    test('redacts a credential sent as a header', () {
      assertRedacted('X-Emby-Token: deadbeefcafe', 'X-Emby-Token: [REDACTED]');
      assertRedacted(
        'Authorization: Bearer deadbeefcafe',
        'Authorization: [REDACTED]',
      );
      assertRedacted(
        'Authorization: MediaBrowser Client="Moonfin", Token="deadbeefcafe"',
        'Token="[REDACTED]"',
      );
    });

    test('keeps a header name that carries no value', () {
      assertRedacted(
        'play http://my-server.com/Videos/abc/stream '
        'headers=Authorization,X-Emby-Token autoPlay=true',
        'headers=Authorization,X-Emby-Token autoPlay=true',
      );
    });

    test('redacts Dart host lookup failures', () {
      assertRedacted(
        "SocketException: Failed host lookup: 'my.host.name' (OS Error: ...)",
        "SocketException: Failed host lookup: '[REDACTED]'",
      );
    });

    test('redacts Android native host lookup failures', () {
      assertRedacted(
        'Unable to resolve host "moonfin.io": No address associated',
        'Unable to resolve host "[REDACTED]": No address associated',
      );
    });

    test('redacts international domain names', () {
      assertRedacted(
        "Failed host lookup: 'münchen.de'",
        "Failed host lookup: '[REDACTED]'",
      );
    });

    test('redacts generic host and address labels', () {
      assertRedacted('Connecting to host: moonfin.io', 'Connecting to host: [REDACTED]');
      assertRedacted('Server address = 1.2.3.4', 'Server address = [REDACTED]');
      assertRedacted('Client ip: 127.0.0.1', 'Client ip: [REDACTED]');
    });

    test('redacts JSON-style keys and values with different spacing', () {
      assertRedacted('"host":"moonfin.io"', '"host":"[REDACTED]"');
      assertRedacted('"server": "1.2.3.4"', '"server": "[REDACTED]"');
      assertRedacted('{"domain":"example.com"}', '{"domain":"[REDACTED]"}');
    });

    test('handles multiple field replacements and case sensitivity', () {
      assertRedacted(
        'SERVER: 1.1.1.1, ORIGIN: https://moonfin.io',
        'SERVER: [REDACTED], ORIGIN: [REDACTED]',
      );
      assertRedacted(
        'host: a.com and ip: 1.2.3.4',
        'host: [REDACTED] and ip: [REDACTED]',
      );
    });

    test('respects keyword boundaries to avoid false positives (e.g. ghost, stripping, addressable)', () {
      // Each keyword from the regex embedded in another word followed by a separator
      assertRedacted('ghost: value', 'ghost: value'); // host
      assertRedacted('ghostname: value', 'ghostname: value'); // hostname
      assertRedacted('addressable: true', 'addressable: true'); // address
      assertRedacted('description: text', 'description: text'); // ip
      assertRedacted('serverless: cloud', 'serverless: cloud'); // server
      assertRedacted('surly: value', 'surly: value'); // url
      assertRedacted('purify: water', 'purify: water'); // uri
      assertRedacted('predominate: factor', 'predominate: factor'); // domain
      assertRedacted('original: source', 'original: source'); // origin
    });

    test('redacts specific values after keywords but ignores friendly names and empty values', () {
      // Redacts if it contains a dot or digit
      assertRedacted('server: 1.2.3.4', 'server: [REDACTED]');
      assertRedacted('domain=moonfin.io', 'domain=[REDACTED]');
      assertRedacted('host: server7', 'host: [REDACTED]');

      // Should NOT match because they don't contain a dot or digit (friendly names)
      assertRedacted('server: Production', 'server: Production');
      assertRedacted('domain=Development', 'domain=Development');

      // Should NOT match because there is no value after the separator
      assertRedacted('Connecting to host: ', 'Connecting to host: ');
    });

    test('redacts standalone IPv4 and IPv6 addresses', () {
      assertRedacted('Error connecting to 192.168.1.1', 'Error connecting to [REDACTED]');
      assertRedacted(
        'IPv6 failure at 2001:0db8:85a3:0000:0000:8a2e:0370:7334',
        'IPv6 failure at [REDACTED]',
      );
      assertRedacted('Compressed IPv6: fe80::1', 'Compressed IPv6: [REDACTED]');
      assertRedacted('Loopback: ::1', 'Loopback: [REDACTED]');
      assertRedacted('Common shorthand: 2001:db8::1', 'Common shorthand: [REDACTED]');
    });

    test('does not redact version numbers, UUIDs, or clock times', () {
      assertRedacted('App version 1.2.3', 'App version 1.2.3');
      assertRedacted('Playback at 0:00:15.000000', 'Playback at 0:00:15.000000');
      assertRedacted('UUID is 550e8400-e29b-41d4-a716-446655440000', 'UUID is 550e8400-e29b-41d4-a716-446655440000');
      assertRedacted('Version with port v1.2.3:8080', 'Version with port v1.2.3:8080');
      assertRedacted('Simple sentence.', 'Simple sentence.');
    });
  });

  group('exportText', () {
    test('produces a formatted report with headers', () async {
      final logs = await _service(loggingEnabled: true);
      logs.clear();
      logs.log(LogCategory.general, 'routine event', level: LogLevel.info);
      logs.logCrash('Uncaught: boom', 'stack trace');

      final text = logs.exportText();
      expect(text, contains('Moonfin diagnostic report'));
      expect(text, contains('App: Moonfin 0.0.0'));
      expect(text, contains('Device: Test Device (dev-1)'));
      expect(text, contains('INFO  [general] routine event'));
      expect(text, contains('ERROR [general] Uncaught: boom'));
      expect(text, contains('└─ stack trace'));
    });

    test('can be bounded to the newest entries', () async {
      final logs = await _service(loggingEnabled: true);
      logs.clear();
      for (var i = 0; i < 10; i++) {
        logs.log(LogCategory.general, 'entry $i');
      }

      final text = logs.exportText(maxEntries: 3);
      expect(text, contains('entry 9'));
      expect(text, contains('entry 7'));
      expect(text, isNot(contains('entry 6')));
      expect(text, contains('Entries: 3'));
    });
  });
}
