import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/media3_transmux_downloader.dart';

const _control = MethodChannel('moonfin/media3_transmux');
const _events = MethodChannel('moonfin/media3_transmux_events');

Future<void> _emit(Map<String, dynamic> event) {
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _events.name,
        const StandardMethodCodec().encodeSuccessEnvelope(event),
        (_) {},
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('buildStartPayload', () {
    test('carries every field the native side parses', () {
      final payload = Media3TransmuxDownloader.buildStartPayload(
        taskId: 'item::1',
        url: 'https://server/Videos/item/stream?Static=false',
        headers: {
          'Authorization': 'MediaBrowser Token="t"',
          'X-Emby-Token': 't',
        },
        outputPath: '/downloads/movie.mp4',
        allowUntrustedTls: true,
      );
      expect(payload, {
        'taskId': 'item::1',
        'url': 'https://server/Videos/item/stream?Static=false',
        'headers': {
          'Authorization': 'MediaBrowser Token="t"',
          'X-Emby-Token': 't',
        },
        'outputPath': '/downloads/movie.mp4',
        'allowUntrustedTls': true,
      });
    });
  });

  group('start', () {
    final calls = <MethodCall>[];

    setUp(() {
      calls.clear();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            calls.add(call);
            return null;
          });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, null);
    });

    test('completes with the native result and reports progress', () async {
      final bytes = <int>[];
      final future = Media3TransmuxDownloader.instance.start(
        taskId: 'a::1',
        url: 'https://server/stream',
        headers: const {},
        outputPath: '/tmp/out.mp4',
        allowUntrustedTls: false,
        onBytesWritten: bytes.add,
      );
      await _emit({'event': 'progress', 'taskId': 'a::1', 'bytesWritten': 42});
      // Another task's events must not leak into this download.
      await _emit({
        'event': 'progress',
        'taskId': 'other',
        'bytesWritten': 999,
      });
      await _emit({
        'event': 'complete',
        'taskId': 'a::1',
        'videoConversionProcess': 2,
        'audioConversionProcess': 2,
      });

      final result = await future;
      expect(bytes, [42]);
      expect(result.wasReEncoded, isFalse);
      expect(calls.single.method, 'start');
    });

    test('a re-encoded track is visible on the result', () async {
      final future = Media3TransmuxDownloader.instance.start(
        taskId: 'a::2',
        url: 'https://server/stream',
        headers: const {},
        outputPath: '/tmp/out.mp4',
        allowUntrustedTls: false,
        onBytesWritten: (_) {},
      );
      await _emit({
        'event': 'complete',
        'taskId': 'a::2',
        'videoConversionProcess': 1,
        'audioConversionProcess': 2,
      });
      expect((await future).wasReEncoded, isTrue);
    });

    test('an error event fails the download', () async {
      final future = Media3TransmuxDownloader.instance.start(
        taskId: 'a::3',
        url: 'https://server/stream',
        headers: const {},
        outputPath: '/tmp/out.mp4',
        allowUntrustedTls: false,
        onBytesWritten: (_) {},
      );
      await _emit({
        'event': 'error',
        'taskId': 'a::3',
        'message': 'read timed out',
        'errorCode': 2001,
      });
      await expectLater(
        future,
        throwsA(
          isA<TransmuxFailedException>()
              .having((e) => e.message, 'message', 'read timed out')
              .having((e) => e.errorCode, 'errorCode', 2001),
        ),
      );
    });

    test('a cancelled event surfaces as cancellation', () async {
      final future = Media3TransmuxDownloader.instance.start(
        taskId: 'a::4',
        url: 'https://server/stream',
        headers: const {},
        outputPath: '/tmp/out.mp4',
        allowUntrustedTls: false,
        onBytesWritten: (_) {},
      );
      await _emit({'event': 'cancelled', 'taskId': 'a::4'});
      await expectLater(future, throwsA(isA<TransmuxCancelledException>()));
    });

    test('a native refusal reads as unavailable, not as a failure', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            throw PlatformException(code: 'TRANSMUX_BUSY');
          });
      await expectLater(
        Media3TransmuxDownloader.instance.start(
          taskId: 'a::5',
          url: 'https://server/stream',
          headers: const {},
          outputPath: '/tmp/out.mp4',
          allowUntrustedTls: false,
          onBytesWritten: (_) {},
        ),
        throwsA(isA<TransmuxUnavailableException>()),
      );
    });

    test('a missing native side reads as unavailable', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_control, (call) async {
            throw MissingPluginException();
          });
      await expectLater(
        Media3TransmuxDownloader.instance.start(
          taskId: 'a::6',
          url: 'https://server/stream',
          headers: const {},
          outputPath: '/tmp/out.mp4',
          allowUntrustedTls: false,
          onBytesWritten: (_) {},
        ),
        throwsA(isA<TransmuxUnavailableException>()),
      );
    });
  });
}
