import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/services/book_parts.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _control = MethodChannel('moonfin/ios_aether_control');
const _events = MethodChannel('moonfin/ios_aether_events');
const _s = Duration(seconds: 1);

TestDefaultBinaryMessenger get _messenger =>
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

Future<void> _send(Map<String, dynamic> payload) =>
    _messenger.handlePlatformMessage(
      _events.name,
      const StandardMethodCodec().encodeSuccessEnvelope(payload),
      (_) {},
    );

Future<void> _state(int positionMs, {bool playing = true}) => _send({
  'event': 'state',
  'positionMs': positionMs,
  'durationMs': 10000,
  'bufferedMs': 0,
  'isPlaying': playing,
  'isBuffering': false,
  'isSubtitleLoading': false,
});

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory dir;
  late String playlist;
  late AetherBackend backend;
  late List<Map<dynamic, dynamic>> sources;
  late List<int> seeks;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('book_parts');
    playlist = '${dir.path}/Book.edl';
    await File(playlist).writeAsString(
      bookPartsPlaylist([
        // Saved before an app update moved the folder.
        for (final name in ['a', 'b', 'c'])
          (path: '/old/Book.parts/$name.mp3', length: _s * 10),
      ]),
    );
    sources = [];
    seeks = [];
    _messenger.setMockMethodCallHandler(_control, (call) async {
      final args = call.arguments;
      if (call.method == 'setSource') sources.add(args as Map);
      if (call.method == 'seek') seeks.add((args as Map)['positionMs'] as int);
      return null;
    });
    _messenger.setMockMethodCallHandler(_events, (_) async => null);
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    backend = AetherBackend(UserPreferences(store));
  });

  tearDown(() async {
    backend.dispose();
    _messenger.setMockMethodCallHandler(_control, null);
    _messenger.setMockMethodCallHandler(_events, null);
    await dir.delete(recursive: true);
  });

  test('plays the parts of a downloaded book as one timeline', () async {
    await backend.play({
      'url': playlist,
      'mediaType': 'audio',
    }, startPosition: _s * 15);

    expect(sources.single['url'], '${dir.path}/Book.parts/b.mp3');
    expect(sources.single['startPositionMs'], 5000);
    expect(backend.position, _s * 15);

    // Until the part reports from near where it opened, state is stale.
    await _state(9900);
    expect(backend.position, _s * 15);
    await _state(5000);
    await _state(9000);
    expect(backend.position, _s * 19);
    expect(backend.duration, _s * 30);

    await backend.seekTo(_s * 12);
    expect(seeks, [2000]);

    final remote = <Map<String, dynamic>>[];
    backend.remoteCommandStream.listen(remote.add);
    await _send({'event': 'seek', 'positionMs': 3000});
    await pumpEventQueue();
    expect(remote.single['positionMs'], 13000);

    await backend.seekTo(_s * 4);
    expect(sources.last['url'], endsWith('Book.parts/a.mp3'));
    expect(sources.last['startPositionMs'], 4000);
    expect(sources.last['autoPlay'], isTrue);
    await _state(4000);
    expect(backend.position, _s * 4);

    // The engine can say playing after a seek while paused.
    await backend.pause();
    await _state(4000, playing: true);
    await backend.seekTo(_s * 25);
    expect(sources.last['url'], endsWith('Book.parts/c.mp3'));
    expect(sources.last['autoPlay'], isFalse);
  });

  test('moves to the next part and ends only after the last', () async {
    final completed = <bool>[];
    backend.completedStream.listen(completed.add);
    await backend.play({
      'url': playlist,
      'mediaType': 'audio',
    }, startPosition: _s * 19);
    await _state(9000);

    await _send({'event': 'completed', 'completed': true});
    await pumpEventQueue();
    expect(sources.last['url'], endsWith('Book.parts/c.mp3'));
    expect(sources.last['startPositionMs'], 0);
    expect(completed, isEmpty);

    // The finished part can repeat its end while the next one opens.
    await _send({'event': 'completed', 'completed': true});
    await _state(10000, playing: false);
    await pumpEventQueue();
    expect(sources, hasLength(2));
    expect(backend.position, _s * 20);

    await _state(0);
    await _state(10000, playing: false);
    await _send({'event': 'completed', 'completed': true});
    await pumpEventQueue();
    expect(sources, hasLength(2));
    expect(completed, [true]);
    expect(backend.position, _s * 30);
  });

  test('anything else plays as it is', () async {
    await backend.play({'url': '${dir.path}/song.mp3'}, startPosition: _s);
    await _state(2000);

    expect(sources.single['url'], endsWith('song.mp3'));
    expect(backend.position, _s * 2);
    expect(backend.duration, _s * 10);
  });
}
