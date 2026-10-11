import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:media_kit/media_kit.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Native extends Fake implements NativePlayer {
  List<Map<String, dynamic>> tracks = [];
  final properties = <String, String>{'sid': 'no'};
  Completer<String>? delayedTracks;

  @override
  Future<String> getProperty(
    String property, {
    bool waitForInitialization = true,
  }) async {
    if (property == 'track-list') {
      return delayedTracks == null ? jsonEncode(tracks) : delayedTracks!.future;
    }
    return properties[property] ?? '';
  }

  @override
  Future<void> setProperty(
    String property,
    String value, {
    bool waitForInitialization = true,
  }) async {
    properties[property] = value;
  }
}

class _Streams extends Fake implements PlayerStream {
  final changes = StreamController<Tracks>.broadcast();
  @override
  Stream<Tracks> get tracks => changes.stream;
  @override
  Stream<VideoParams> get videoParams => const Stream.empty();
}

class _Player extends Fake implements Player {
  @override
  final _Native platform = _Native();
  @override
  final _Streams stream = _Streams();
  @override
  PlayerState get state => const PlayerState();
  final selections = <String>[];
  final opened = <String>[];
  @override
  Future<void> setSubtitleTrack(SubtitleTrack track) async {
    selections.add(track.id);
    platform.properties['sid'] = track.id;
  }

  @override
  Future<void> open(Playable playable, {bool play = true}) async {
    opened.add((playable as Media).uri);
  }

  @override
  Future<void> stop() async {}
  @override
  Future<void> dispose() async {
    await stream.changes.close();
  }

  void discover() {
    platform.tracks = [
      {'type': 'sub', 'id': 3, 'codec': 'eia_608'},
      {'type': 'sub', 'id': 8, 'codec': 'subrip', 'external': true},
      {'type': 'sub', 'id': 11, 'codec': 'subrip'},
      {'type': 'sub', 'id': 17, 'codec': 'subrip'},
    ];
    stream.changes.add(const Tracks());
  }
}

Future<void> _flush() async {
  for (var n = 0; n < 5; n++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _Player player;
  late UserPreferences prefs;
  late MediaKitPlayerBackend backend;
  bool disposed = false;
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    player = _Player();
    backend = MediaKitPlayerBackend.forTesting(player, prefs);
    disposed = false;
  });
  tearDown(() {
    if (!disposed) backend.dispose();
    prefs.dispose();
  });

  test('discovery selects the embedded ordinal once, excluding external and CC tracks', () async {
    await backend.setSubtitleTrack(2);
    player.discover();
    await _flush();
    expect(player.platform.properties['sid'], '17');
    player.discover();
    await _flush();
    expect(player.selections.where((id) => id == '17'), hasLength(1));
  });

  for (final action in ['off', 'stop', 'source', 'choice', 'dispose']) {
    test('$action cancels the pending Windows subtitle selection', () async {
      await backend.setSubtitleTrack(1);
      switch (action) {
        case 'off':
          await backend.disableSubtitleTrack();
        case 'stop':
          await backend.stop();
        case 'source':
          await backend.play({
            'url': 'https://example.com/next.mkv',
            'autoPlay': false,
          });
          expect(player.opened, hasLength(1));
        case 'choice':
          await backend.setSubtitleTrack(2);
        case 'dispose':
          backend.dispose();
          disposed = true;
      }
      player.selections.clear();
      if (disposed) return;
      player.discover();
      await _flush();
      expect(player.selections, action == 'choice' ? ['17'] : isEmpty);
    });
  }

  for (final action in ['off', 'stop', 'dispose', 'source', 'choice']) {
    test('$action cancels a discovery read already in flight', () async {
      await backend.setSubtitleTrack(1);
      final read = Completer<String>();
      player.platform.delayedTracks = read;
      player.discover();
      await _flush();
      Future<void>? replacement;
      switch (action) {
        case 'off':
          await backend.disableSubtitleTrack();
        case 'stop':
          await backend.stop();
        case 'dispose':
          backend.dispose();
          disposed = true;
        case 'source':
          await backend.play({
            'url': 'https://example.com/next.mkv',
            'autoPlay': false,
          });
        case 'choice':
          replacement = backend.setSubtitleTrack(2);
      }
      player.selections.clear();
      read.complete(jsonEncode(player.platform.tracks));
      await replacement;
      await _flush();
      expect(player.selections, action == 'choice' ? ['17'] : isEmpty);
    });
  }
}
