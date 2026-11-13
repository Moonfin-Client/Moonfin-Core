import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/cast_service.dart';
import 'package:moonfin/data/services/cast/cast_target.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/data/services/socket_handler.dart';
import 'package:moonfin/playback/audio_handler.dart';
import 'package:moonfin/playback/last_playback_session_store.dart';
import 'package:moonfin/playback/media_browse_service.dart';
import 'package:moonfin/playback/remote_media_notification_service.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _RecordingManager extends PlaybackManager {
  final calls = <String>[];

  @override
  Future<void> resume() async => calls.add('local:resume');

  @override
  Future<void> pause() async => calls.add('local:pause');

  @override
  Future<void> stop({bool userInitiated = true}) async =>
      calls.add('local:stop:$userInitiated');
}

class _FakeSocketHandler extends Fake implements SocketHandler {
  final eventsController = StreamController<ServerWebSocketMessage>.broadcast();
  final connectionsController = StreamController<void>.broadcast();

  @override
  Stream<ServerWebSocketMessage> get events => eventsController.stream;

  @override
  Stream<void> get connections => connectionsController.stream;

  @override
  void subscribe(String messageType) {}

  @override
  void unsubscribe(String messageType) {}

  Future<void> close() async {
    await eventsController.close();
    await connectionsController.close();
  }
}

class _FakeCastService extends Fake implements CastService {
  @override
  late final activeKindNotifier = ValueNotifier(null);

  @override
  late final activeTargetNotifier = ValueNotifier(null);

  @override
  late final castItemNotifier = ValueNotifier(null);

  @override
  late final remoteStateNotifier = ValueNotifier(null);

  @override
  late final remotePositionNotifier = ValueNotifier(0);

  @override
  late final remoteVolumeNotifier = ValueNotifier(null);
}

class _FakeClient extends Fake implements MediaServerClient {
  @override
  String get baseUrl => 'https://server.test';

  @override
  String? get accessToken => 'token-123';

  @override
  ServerType get serverType => ServerType.jellyfin;
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  final _client = _FakeClient();

  @override
  MediaServerClient? getClientIfExists(String serverId) => _client;
}

class _FakeBrowse extends Fake implements MediaBrowseService {}

class _FakeSessionStore extends Fake implements LastPlaybackSessionStore {
  @override
  Future<void> save(LastPlaybackSession session) async {}
}

class _RecordingRemoteService extends RemoteMediaNotificationService {
  _RecordingRemoteService({
    required super.socketHandler,
    required super.castService,
    required super.prefs,
  }) : super(activeClient: () => null, enabledOnPlatform: true);

  final calls = <String>[];

  @override
  Future<void> play() async => calls.add('remote:play');

  @override
  Future<void> pause() async => calls.add('remote:pause');

  Future<void> Function()? onStop;

  @override
  Future<void> stop() async {
    calls.add('remote:stop');
    if (onStop != null) {
      await onStop!();
    }
    activeSessionNotifier.value = null;
  }

  @override
  Future<void> seek(Duration position) async =>
      calls.add('remote:seek:${position.inSeconds}');

  @override
  Future<void> fastForward(Duration offset) async =>
      calls.add('remote:ff:${offset.inSeconds}');

  @override
  Future<void> rewind(Duration offset) async =>
      calls.add('remote:rw:${offset.inSeconds}');

  @override
  Future<void> skipToNext() async => calls.add('remote:next');

  @override
  Future<void> skipToPrevious() async => calls.add('remote:prev');

  @override
  Future<void> setVolume(int percent) async =>
      calls.add('remote:vol:$percent');

  @override
  Future<void> adjustVolume(int direction) async =>
      calls.add('remote:volDir:$direction');

  @override
  void dismissCurrent() {
    calls.add('remote:dismiss');
    super.dismissCurrent();
  }
}

RemoteMediaSession _remoteSession({
  String sessionId = 'sess-tv',
  String? jellyfinSessionId = 'sess-tv',
  CastTargetKind? castKind,
  String itemId = 'ep-1',
  bool isPlaying = true,
  Duration position = const Duration(seconds: 60),
  bool canSeek = true,
  bool supportsSetVolume = true,
  int? volumePercent = 45,
}) {
  return RemoteMediaSession(
    sessionId: sessionId,
    jellyfinSessionId: jellyfinSessionId,
    castKind: castKind,
    deviceName: 'SHIELD',
    itemId: itemId,
    title: 'The Beast in the Jungle',
    subtitle: 'The Haunting of Bly Manor • S1E9',
    activityLabel: 'Watching on Moonfin',
    serverId: 'server-1',
    artUrl: 'https://server.test/Items/$itemId/Images/Primary?maxHeight=300',
    duration: const Duration(minutes: 48),
    position: position,
    isPlaying: isPlaying,
    canSeek: canSeek,
    supportsSetVolume: supportsSetVolume,
    volumePercent: volumePercent,
  );
}

const _localSong = AggregatedItem(
  id: 'song-1',
  serverId: 'server-1',
  rawData: {
    'Type': 'Audio',
    'Name': 'Local Track',
    'Artists': ['Local Artist'],
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _RecordingManager manager;
  late _FakeSocketHandler socket;
  late _FakeCastService castService;
  late UserPreferences prefs;
  late _RecordingRemoteService remoteService;
  late MoonfinAudioHandler handler;

  setUp(() async {
    await GetIt.instance.reset();
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    SharedPreferences.setMockInitialValues({});
    final store = PreferenceStore();
    await store.init();
    prefs = UserPreferences(store);
    await prefs.set(UserPreferences.skipForwardLength, 30000);
    await prefs.set(UserPreferences.skipBackLength, 10000);
    GetIt.instance.registerSingleton<UserPreferences>(prefs);

    manager = _RecordingManager();
    socket = _FakeSocketHandler();
    castService = _FakeCastService();
    remoteService = _RecordingRemoteService(
      socketHandler: socket,
      castService: castService,
      prefs: prefs,
    );
    handler = MoonfinAudioHandler(
      manager,
      _FakeClientFactory(),
      _FakeBrowse(),
      _FakeSessionStore(),
      remoteService: remoteService,
    );
  });

  tearDown(() async {
    handler.disposeForTest();
    debugDefaultTargetPlatformOverride = null;
    remoteService.dispose();
    await socket.close();
    await GetIt.instance.reset();
  });

  test('mirrors active remote session metadata, controls, and volume info', () async {
    remoteService.activeSessionNotifier.value = _remoteSession();
    await Future<void>.delayed(Duration.zero);

    expect(handler.isRemoteMode, isTrue);
    expect(handler.activeRemoteJellyfinSessionId, 'sess-tv');
    expect(handler.mediaItem.value?.id, 'remote:sess-tv:ep-1');
    expect(handler.mediaItem.value?.title, 'The Beast in the Jungle');
    expect(
      handler.mediaItem.value?.artist,
      'The Haunting of Bly Manor • S1E9',
    );
    expect(handler.mediaItem.value?.album, 'Watching on Moonfin');
    expect(handler.playbackState.value.playing, isTrue);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );
    expect(handler.playbackState.value.controls, [
      MediaControl.rewind,
      MediaControl.pause,
      MediaControl.fastForward,
      MediaControl.stop,
    ]);
    expect(
      handler.androidPlaybackInfo.value,
      RemoteAndroidPlaybackInfo(
        volumeControlType: AndroidVolumeControlType.absolute,
        maxVolume: 100,
        volume: 45,
      ),
    );
  });

  test('routes transport, volume, dismiss, and stop commands to remote service', () async {
    remoteService.activeSessionNotifier.value = _remoteSession();
    await Future<void>.delayed(Duration.zero);

    await handler.pause();
    await handler.play();
    await handler.fastForward();
    await handler.rewind();
    await handler.seek(const Duration(seconds: 150));
    await handler.skipToNext();
    await handler.skipToPrevious();
    await handler.androidSetRemoteVolume(80);
    await handler.androidAdjustRemoteVolume(AndroidVolumeDirection.raise);

    expect(remoteService.calls, [
      'remote:pause',
      'remote:play',
      'remote:ff:30',
      'remote:rw:10',
      'remote:seek:150',
      'remote:next',
      'remote:prev',
      'remote:vol:80',
      'remote:volDir:1',
    ]);
    expect(manager.calls, isEmpty);

    // Swipe dismiss clears notification without calling remote stop or local stop.
    await handler.onNotificationDeleted();
    expect(remoteService.calls.last, 'remote:dismiss');
    expect(remoteService.calls, isNot(contains('remote:stop')));
    expect(handler.isRemoteMode, isFalse);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );

    // Explicit stop sends remote stop without cancelling local subscriptions.
    remoteService.calls.clear();
    remoteService.activeSessionNotifier.value = _remoteSession(itemId: 'ep-2');
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);

    await handler.stop();
    expect(remoteService.calls, ['remote:stop']);
    expect(handler.isRemoteMode, isFalse);
    expect(manager.calls, isEmpty);

    // Local streams stay bound after a remote stop.
    manager.queueService.setQueue([_localSong]);
    await Future<void>.delayed(Duration.zero);
    expect(handler.mediaItem.value?.id, 'song-1');
  });

  test('local playback takes precedence over remote session and restores when cleared', () async {
    remoteService.activeSessionNotifier.value = _remoteSession();
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);
    expect(handler.mediaItem.value?.id, 'remote:sess-tv:ep-1');

    // Local queue starts: overrides remote session and restores local audio info.
    manager.queueService.setQueue([_localSong]);
    await Future<void>.delayed(Duration.zero);

    expect(handler.isRemoteMode, isFalse);
    expect(handler.mediaItem.value?.id, 'song-1');
    expect(handler.androidPlaybackInfo.value, isA<LocalAndroidPlaybackInfo>());

    // Even if remote state updates while local plays, local stays in charge.
    remoteService.activeSessionNotifier.value = _remoteSession(itemId: 'ep-3');
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isFalse);
    expect(handler.mediaItem.value?.id, 'song-1');

    // Local queue empties: active remote session resumes mirroring.
    manager.queueService.clear();
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);
    expect(handler.mediaItem.value?.id, 'remote:sess-tv:ep-3');
  });

  test('omits seek controls and exposes active cast kind when non-seekable Cast session is active', () async {
    remoteService.activeSessionNotifier.value = _remoteSession(
      sessionId: 'cast:googleCast:living-room',
      jellyfinSessionId: null,
      castKind: CastTargetKind.googleCast,
      canSeek: false,
    );
    await Future<void>.delayed(Duration.zero);

    expect(handler.activeRemoteJellyfinSessionId, isNull);
    expect(handler.activeRemoteCastKind, CastTargetKind.googleCast);
    expect(handler.playbackState.value.controls, [
      MediaControl.pause,
      MediaControl.stop,
    ]);
    expect(handler.playbackState.value.androidCompactActionIndices, [0, 1]);
    expect(
      handler.playbackState.value.systemActions,
      isNot(containsAll([MediaAction.seek, MediaAction.fastForward, MediaAction.rewind])),
    );

    // Turning canSeek on without changing position/playing still republishes controls.
    remoteService.activeSessionNotifier.value = _remoteSession(
      sessionId: 'cast:googleCast:living-room',
      jellyfinSessionId: null,
      castKind: CastTargetKind.googleCast,
      canSeek: true,
    );
    await Future<void>.delayed(Duration.zero);

    expect(handler.playbackState.value.controls, [
      MediaControl.rewind,
      MediaControl.pause,
      MediaControl.fastForward,
      MediaControl.stop,
    ]);
    expect(handler.playbackState.value.androidCompactActionIndices, [0, 1, 2]);
  });

  test('preserves local playback that starts while remote stop is in flight', () async {
    remoteService.activeSessionNotifier.value = _remoteSession();
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);

    final stopCompleter = Completer<void>();
    remoteService.onStop = () => stopCompleter.future;

    final stopFuture = handler.stop();
    manager.queueService.setQueue([_localSong]);
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isFalse);
    expect(handler.mediaItem.value?.id, 'song-1');

    stopCompleter.complete();
    await stopFuture;
    expect(handler.isRemoteMode, isFalse);
    expect(handler.mediaItem.value?.id, 'song-1');
  });

  test('keeps remote session ready across pause and resume', () async {
    remoteService.activeSessionNotifier.value = _remoteSession(isPlaying: true);
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);
    expect(handler.playbackState.value.playing, isTrue);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );

    // Pausing keeps remote mode and notification controls alive.
    remoteService.activeSessionNotifier.value = _remoteSession(isPlaying: false);
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);
    expect(handler.mediaItem.value?.id, 'remote:sess-tv:ep-1');
    expect(handler.playbackState.value.playing, isFalse);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );
    expect(handler.playbackState.value.controls, [
      MediaControl.rewind,
      MediaControl.play,
      MediaControl.fastForward,
      MediaControl.stop,
    ]);

    // Resuming transitions back to playing without recreating remote mode.
    remoteService.activeSessionNotifier.value = _remoteSession(isPlaying: true);
    await Future<void>.delayed(Duration.zero);
    expect(handler.isRemoteMode, isTrue);
    expect(handler.playbackState.value.playing, isTrue);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );
    expect(handler.playbackState.value.controls, [
      MediaControl.rewind,
      MediaControl.pause,
      MediaControl.fastForward,
      MediaControl.stop,
    ]);
  });

  test('emits idle after pausedForegroundGrace and recovers on resume or new item', () async {
    final shortGraceHandler = MoonfinAudioHandler(
      manager,
      _FakeClientFactory(),
      _FakeBrowse(),
      _FakeSessionStore(),
      remoteService: remoteService,
      pausedForegroundGrace: const Duration(milliseconds: 25),
    );
    addTearDown(shortGraceHandler.disposeForTest);

    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-1',
      isPlaying: true,
    );
    await Future<void>.delayed(Duration.zero);
    expect(shortGraceHandler.isRemoteMode, isTrue);

    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-1',
      isPlaying: false,
    );
    await Future<void>.delayed(const Duration(milliseconds: 10));
    expect(shortGraceHandler.isRemoteMode, isTrue);
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );

    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(shortGraceHandler.isRemoteMode, isFalse);
    expect(shortGraceHandler.mediaItem.value, isNull);
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );

    // Repeated paused updates for the timed-out item keep it idle.
    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-1',
      isPlaying: false,
    );
    await Future<void>.delayed(Duration.zero);
    expect(shortGraceHandler.isRemoteMode, isFalse);
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );

    // Resuming the same item immediately restores ready remote controls.
    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-1',
      isPlaying: true,
    );
    await Future<void>.delayed(Duration.zero);
    expect(shortGraceHandler.isRemoteMode, isTrue);
    expect(shortGraceHandler.playbackState.value.playing, isTrue);
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );

    // Switching to another paused item also exits the timed-out suppression.
    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-1',
      isPlaying: false,
    );
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(shortGraceHandler.isRemoteMode, isFalse);
    remoteService.activeSessionNotifier.value = _remoteSession(
      itemId: 'ep-2',
      isPlaying: false,
    );
    await Future<void>.delayed(Duration.zero);
    expect(shortGraceHandler.isRemoteMode, isTrue);
    expect(shortGraceHandler.mediaItem.value?.id, 'remote:sess-tv:ep-2');
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );
  });

  test('emits idle after pausedForegroundGrace during local paused playback', () async {
    final shortGraceHandler = MoonfinAudioHandler(
      manager,
      _FakeClientFactory(),
      _FakeBrowse(),
      _FakeSessionStore(),
      remoteService: remoteService,
      pausedForegroundGrace: const Duration(milliseconds: 25),
    );
    addTearDown(shortGraceHandler.disposeForTest);

    manager.queueService.setQueue([_localSong]);
    await Future<void>.delayed(const Duration(milliseconds: 10));
    expect(shortGraceHandler.isRemoteMode, isFalse);
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.ready,
    );
    expect(shortGraceHandler.playbackState.value.playing, isFalse);

    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(
      shortGraceHandler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );
  });
}
