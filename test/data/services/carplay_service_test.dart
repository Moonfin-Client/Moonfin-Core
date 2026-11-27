import 'package:audio_service/audio_service.dart';
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
  List<MediaItem> children = const [];

  @override
  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async =>
      children;

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PlaybackManager manager;
  late _FakeBrowse browse;
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
    browse = _FakeBrowse();
    service = CarPlayService(browse: browse, manager: manager)..start();
  });

  tearDown(() {
    service.dispose();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_channel, null);
  });

  // Calls the Dart handler the way the Swift bridge does.
  Future<Object?> fromCar(String method, [Object? arguments]) async {
    ByteData? reply;
    await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage(
      _channel.name,
      _codec.encodeMethodCall(MethodCall(method, arguments)),
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

  // CarPlay can't read the Android style extras, so each browse row carries
  // the shelf, the cover or tile style, progress and an SF Symbol.
  group('browse rows', () {
    const shelfKey = 'android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT';
    const styleKey = 'android.media.browse.CONTENT_STYLE_SINGLE_ITEM_HINT';
    const statusKey = 'android.media.extra.PLAYBACK_STATUS';
    const percentKey = 'androidx.media.MediaItem.Extras.COMPLETION_PERCENTAGE';

    Future<List<Map<Object?, Object?>>> rows(List<MediaItem> items) async {
      browse.children = items;
      final reply = await fromCar('getChildren', {'nodeId': 'tab|home'});
      return ((reply as Map)['items'] as List).cast<Map<Object?, Object?>>();
    }

    test('a cover shelf item carries its shelf and cover style', () async {
      final [row] = await rows([
        const MediaItem(
          id: 'album|s|1',
          title: 'Album',
          playable: false,
          extras: {
            shelfKey: 'Jump Back In',
            styleKey: AndroidContentStyle.gridItemHintValue,
          },
        ),
      ]);
      expect(row['shelf'], 'Jump Back In');
      expect(row['cover'], isTrue);
      expect(row['tile'], isFalse);
      expect(row.containsKey('progress'), isFalse);
      expect(row.containsKey('iconName'), isFalse);
    });

    test('a letter tile is a tile with its letter symbol', () async {
      final [b, hash] = await rows([
        for (final letter in ['B', '#'])
          MediaItem(
            id: 'sec|albums|s|az|$letter',
            title: letter,
            playable: false,
            extras: const {
              shelfKey: 'Browse by Letter',
              styleKey: AndroidContentStyle.categoryGridItemHintValue,
            },
          ),
      ]);
      expect(b['iconName'], 'b.circle');
      expect(b['cover'], isFalse);
      expect(b['tile'], isTrue);
      expect(hash['iconName'], 'number.circle');
    });

    test('progress comes through, and finished is full', () async {
      final [started, done, untouched] = await rows([
        const MediaItem(
          id: 'book|s|1',
          title: 'Book',
          extras: {statusKey: 1, percentKey: 0.4},
        ),
        const MediaItem(
          id: 'bookch|s|1|0',
          title: 'Chapter 1',
          extras: {statusKey: 2},
        ),
        const MediaItem(id: 'bookch|s|1|1', title: 'Chapter 2'),
      ]);
      expect(started['progress'], 0.4);
      expect(done['progress'], 1.0);
      expect(untouched.containsKey('progress'), isFalse);
    });

    test('quick tiles get symbols and display text wins', () async {
      final [shuffle, top] = await rows([
        const MediaItem(id: 'shuffle|s|all', title: 'Shuffle All'),
        const MediaItem(
          id: 'track|s|1|top|2',
          title: 'Song',
          artist: 'Artist',
          displaySubtitle: 'Album',
        ),
      ]);
      expect(shuffle['iconName'], 'shuffle');
      expect(top['subtitle'], 'Album');
    });
  });
}
