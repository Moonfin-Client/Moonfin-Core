import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/carplay_service.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:playback_core/playback_core.dart';

// CarPlay sends shuffle and repeat taps to the Now Playing buttons' own
// handlers, which call these methods, and draws the buttons from the modes the
// replies and pushes carry.

const _channel = MethodChannel('com.moonfin/carplay');
const _codec = StandardMethodCodec();

class _FakeBrowse implements MediaBrowseService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PlaybackManager manager;
  late CarPlayService service;
  late List<MethodCall> pushed;

  setUp(() {
    pushed = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, (call) async {
      pushed.add(call);
      return null;
    });
    manager = PlaybackManager();
    manager.queueService.setQueue(['a', 'b', 'c']);
    service = CarPlayService(browse: _FakeBrowse(), manager: manager)..start();
  });

  tearDown(() {
    service.dispose();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, null);
  });

  // Calls the Dart handler the way the Swift bridge does.
  Future<Object?> fromCar(String method) async {
    ByteData? reply;
    await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage(
      _channel.name,
      _codec.encodeMethodCall(MethodCall(method)),
      (data) => reply = data,
    );
    return _codec.decodeEnvelope(reply!);
  }

  List<Map<Object?, Object?>> modePushes() => pushed
      .where((c) => c.method == 'playbackModesChanged')
      .map((c) => c.arguments as Map<Object?, Object?>)
      .toList();

  test('the shuffle button turns shuffle on and off', () async {
    expect(await fromCar('toggleShuffle'), {'shuffle': true, 'repeat': 'none'});
    expect(manager.queueService.isShuffled, isTrue);

    expect(await fromCar('toggleShuffle'), {'shuffle': false, 'repeat': 'none'});
    expect(manager.queueService.isShuffled, isFalse);
  });

  test('the repeat button cycles off, all, one, off', () async {
    expect((await fromCar('cycleRepeat') as Map)['repeat'], 'all');
    expect((await fromCar('cycleRepeat') as Map)['repeat'], 'one');
    expect((await fromCar('cycleRepeat') as Map)['repeat'], 'none');
  });

  test('a change made on the phone reaches the car', () async {
    manager.toggleRepeat();
    await pumpEventQueue();

    expect(modePushes().last, {'shuffle': false, 'repeat': 'all'});
  });

  test('a queue change that leaves the modes alone pushes nothing new', () async {
    manager.toggleShuffle();
    await pumpEventQueue();
    final before = modePushes().length;

    manager.queueService.addItems(['d', 'e']);
    await pumpEventQueue();

    expect(modePushes().length, before);
  });

  test('a new queue turning shuffle off reaches the car', () async {
    manager.toggleShuffle();
    await pumpEventQueue();
    expect(modePushes().last['shuffle'], isTrue);

    manager.queueService.setQueue(['d', 'e']);
    await pumpEventQueue();

    expect(modePushes().last['shuffle'], isFalse);
  });
}
