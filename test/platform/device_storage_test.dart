import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/platform/device_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel(DeviceStorage.channelName);
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  tearDown(() => messenger.setMockMethodCallHandler(channel, null));

  test('answers with the native free space for the path', () async {
    String? asked;
    messenger.setMockMethodCallHandler(channel, (call) async {
      asked = (call.arguments as Map)['path'] as String;
      return 12345;
    });
    expect(await DeviceStorage(channel: channel).freeBytes('/tmp'), 12345);
    expect(asked, '/tmp');
  });

  test('is unknown where the native side is absent or fails', () async {
    expect(await DeviceStorage(channel: channel).freeBytes('/tmp'), isNull);
    messenger.setMockMethodCallHandler(channel, (call) async {
      throw PlatformException(code: 'boom');
    });
    expect(await DeviceStorage(channel: channel).freeBytes('/tmp'), isNull);
  });
}
