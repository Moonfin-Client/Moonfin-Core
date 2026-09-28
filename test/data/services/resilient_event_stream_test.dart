import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/cast/resilient_event_stream.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  const channelName = 'com.test/resilient_events';
  final methodChannel = MethodChannel(channelName);

  tearDown(() {
    messenger.setMockMethodCallHandler(methodChannel, null);
  });

  test('emits events normally when platform channel responds with success',
      () async {
    var listenCalled = false;
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == 'listen') {
        listenCalled = true;
        return null;
      }
      if (call.method == 'cancel') {
        return null;
      }
      return null;
    });

    final stream = resilientEventChannelStream(channelName);
    final events = <dynamic>[];
    final sub = stream.listen(events.add);

    // Give microtasks time to execute onListen.
    await pumpEventQueue();
    expect(listenCalled, isTrue);

    // Emit platform message.
    await messenger.handlePlatformMessage(
      channelName,
      const StandardMethodCodec().encodeSuccessEnvelope({'status': 'connected'}),
      (_) {},
    );

    expect(events, equals([{'status': 'connected'}]));
    await sub.cancel();
  });

  test('gracefully catches MissingPluginException and retries successfully',
      () async {
    var callCount = 0;
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == 'listen') {
        callCount++;
        if (callCount == 1) {
          // Simulate MissingPluginException on first attempt (cold startup race).
          throw MissingPluginException('No implementation found for method listen');
        }
        return null;
      }
      return null;
    });

    final stream = resilientEventChannelStream(
      channelName,
      retryInterval: const Duration(milliseconds: 10),
      maxRetries: 3,
    );
    final events = <dynamic>[];
    final sub = stream.listen(events.add);

    // Initial attempt throws MissingPluginException and schedules retry.
    await pumpEventQueue();
    expect(callCount, equals(1));

    // Wait for retry timer to fire.
    await Future<void>.delayed(const Duration(milliseconds: 25));
    expect(callCount, equals(2));

    // Platform message should now be received.
    await messenger.handlePlatformMessage(
      channelName,
      const StandardMethodCodec().encodeSuccessEnvelope({'device': 'Pixel 10'}),
      (_) {},
    );

    expect(events, equals([{'device': 'Pixel 10'}]));
    await sub.cancel();
  });

  test('exhausts retries quietly without uncaught exceptions when channel missing',
      () async {
    var callCount = 0;
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == 'listen') {
        callCount++;
        throw MissingPluginException('No implementation found for method listen');
      }
      return null;
    });

    final stream = resilientEventChannelStream(
      channelName,
      retryInterval: const Duration(milliseconds: 10),
      maxRetries: 2,
    );
    final events = <dynamic>[];
    final errors = <dynamic>[];
    final sub = stream.listen(events.add, onError: errors.add);

    // Wait through initial attempt and all retries (2 retries).
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(callCount, equals(3)); // 1 initial + 2 retries
    expect(events, isEmpty);
    expect(errors, isEmpty); // Gracefully swallowed, not thrown or errored

    await sub.cancel();
  });

  test('once the retries run out, a resume subscribes when the handler exists',
      () async {
    var callCount = 0;
    var handlerRegistered = false;
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == 'listen') {
        callCount++;
        if (!handlerRegistered) {
          throw MissingPluginException('No implementation found');
        }
      }
      return null;
    });

    final stream = resilientEventChannelStream(
      channelName,
      retryInterval: const Duration(milliseconds: 10),
      maxRetries: 1,
    );
    final events = <dynamic>[];
    final sub = stream.listen(events.add);

    await Future<void>.delayed(const Duration(milliseconds: 30));
    expect(callCount, equals(2));

    // An Activity adopting the engine registers the handler, then resumes.
    handlerRegistered = true;
    final binding = TestWidgetsFlutterBinding.instance;
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await pumpEventQueue();
    expect(callCount, equals(3));

    await messenger.handlePlatformMessage(
      channelName,
      const StandardMethodCodec().encodeSuccessEnvelope({'state': 'connected'}),
      (_) {},
    );
    expect(events, equals([{'state': 'connected'}]));

    // Subscribed now, so a later resume leaves the channel alone.
    binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await pumpEventQueue();
    expect(callCount, equals(3));

    await sub.cancel();
  });

  test('cancels retry timer when subscription is cancelled before retry fires',
      () async {
    var callCount = 0;
    messenger.setMockMethodCallHandler(methodChannel, (call) async {
      if (call.method == 'listen') {
        callCount++;
        throw MissingPluginException('No implementation found');
      }
      return null;
    });

    final stream = resilientEventChannelStream(
      channelName,
      retryInterval: const Duration(milliseconds: 50),
      maxRetries: 3,
    );
    final sub = stream.listen((_) {});

    await pumpEventQueue();
    expect(callCount, equals(1));

    // Cancel before retry timer fires.
    await sub.cancel();

    // Wait past retry duration to ensure no extra calls occur.
    await Future<void>.delayed(const Duration(milliseconds: 70));
    expect(callCount, equals(1));
  });
}
