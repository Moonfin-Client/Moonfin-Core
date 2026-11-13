import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/preference/user_preferences.dart';
import 'package:moonfin/syncplay/syncplay_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

class _TestBackend extends Fake implements PlayerBackend {
  final positions = StreamController<Duration>.broadcast(sync: true);
  final playingController = StreamController<bool>.broadcast(sync: true);
  final bufferingController = StreamController<bool>.broadcast(sync: true);
  bool playing = false;
  Duration currentPosition = Duration.zero;
  Duration currentDuration = Duration.zero;

  void emitPosition(Duration position) {
    currentPosition = position;
    positions.add(position);
  }

  @override
  Duration get position => currentPosition;

  @override
  Duration get duration => currentDuration;

  @override
  Duration get buffer => Duration.zero;

  @override
  bool get isPlaying => playing;

  @override
  bool get playWhenReady => playing;

  @override
  double get playbackSpeed => 1.0;

  @override
  bool get isBuffering => false;

  @override
  Stream<Duration> get positionStream => positions.stream;

  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();

  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();

  @override
  Stream<bool> get playingStream => playingController.stream;

  @override
  Stream<bool> get bufferingStream => bufferingController.stream;

  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();

  @override
  Stream<Map<String, dynamic>>? get errorStream => null;

  @override
  bool get supportsRuntimeTrackSelection => false;

  @override
  bool get supportsDirectPlayAudioSwitch => false;

  @override
  bool get canRenderBitmapSubtitles => false;

  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  bool get nativelyHandlesStartPosition => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {
    currentPosition = startPosition;
    playing = true;
  }

  @override
  Future<void> pause() async => playing = false;

  @override
  Future<void> resume() async => playing = true;

  @override
  Future<void> stop() async => playing = false;

  @override
  Future<void> setSubtitleRendererMode(SubtitleRendererMode mode) async {}

  @override
  Future<void> waitForTracksReady() async {}

  @override
  void dispose() {
    positions.close();
    playingController.close();
    bufferingController.close();
  }
}

class _TestResolver extends MediaStreamResolver {
  @override
  Future<StreamResolutionResult> resolve(
    dynamic mediaItem, {
    Map<String, dynamic>? deviceProfile,
    int? maxStreamingBitrate,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startTimeTicks,
    String? mediaSourceId,
    bool enableDirectPlay = true,
    bool enableDirectStream = true,
    bool enableTranscoding = true,
  }) async => StreamResolutionResult(
    streamUrl: 'https://example.test/stream',
    mediaSourceId: 'source',
    playSessionId: 'session',
    playMethod: StreamPlayMethod.directStream,
  );
}

class _TestService extends Fake implements PlayerService {
  final stops = <Duration>[];

  @override
  Future<void> onPlaybackStart(
    dynamic mediaItem,
    StreamResolutionResult resolution, {
    int? positionTicks,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

  @override
  Future<void> onPlaybackProgress(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool isPaused = false,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? volumeLevel,
    bool? isMuted,
  }) async {}

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => stops.add(position);

  @override
  Future<void> closeLiveStream(String liveStreamId) async {}

  @override
  Future<void> stopTranscoding(StreamResolutionResult resolution) async {}

  @override
  void dispose() {}
}

class _FakeSyncPlayApi extends Fake implements SyncPlayApi {
  final List<String> nextItemCalls = [];
  Object? nextError;

  @override
  Future<UtcTimeResponse> getUtcTime() async =>
      const UtcTimeResponse(
        requestReceptionTimeMs: 1000,
        responseTransmissionTimeMs: 1000,
      );

  @override
  Future<void> nextItem(String playlistItemId) async {
    nextItemCalls.add(playlistItemId);
    final error = nextError;
    if (error != null) throw error;
  }

  @override
  Future<void> sendPing(int ping) async {}

  @override
  Future<void> sendReady({
    required bool isPlaying,
    required String playlistItemId,
    required int positionTicks,
    DateTime? when,
  }) async {}

  @override
  Future<void> leaveGroup() async {}
}

class _FakeItemsApi extends Fake implements ItemsApi {
  final Map<String, Map<String, dynamic>> items = {
    'ep1': {'Id': 'ep1', 'Type': 'Episode', 'Name': 'Episode 1'},
    'ep2': {'Id': 'ep2', 'Type': 'Episode', 'Name': 'Episode 2'},
    'ep3': {'Id': 'ep3', 'Type': 'Episode', 'Name': 'Episode 3'},
  };
  Completer<void>? getItemGate;

  @override
  Future<Map<String, dynamic>> getItem(
    String itemId, {
    String? mediaSourceId,
    String? fields,
  }) async {
    await getItemGate?.future;
    return items[itemId] ?? {'Id': itemId, 'Type': 'Episode'};
  }
}

class _MockMediaServerClient extends Mock implements MediaServerClient {}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  _FakeClientFactory(this._clients);

  final Map<String, MediaServerClient> _clients;

  @override
  Map<String, MediaServerClient> get clients => _clients;
}

class _FakeUserPreferences extends Fake implements UserPreferences {
  @override
  T get<T>(Preference<T> preference) => preference.defaultValue;
}

void main() {
  const credits = Duration(minutes: 20);
  const end = Duration(minutes: 25);

  late _TestBackend backend;
  late _TestService service;
  late PlaybackManager playbackManager;
  late _FakeSyncPlayApi syncPlayApi;
  late _FakeItemsApi itemsApi;
  late SyncPlayManager syncPlayManager;
  late DateTime now;

  setUp(() async {
    await GetIt.instance.reset();
    now = DateTime(2026, 1, 1, 12);
    backend = _TestBackend();
    service = _TestService();
    playbackManager = PlaybackManager()
      ..clock = (() => now)
      ..setBackend(backend)
      ..setResolver(_TestResolver())
      ..setPlayerService(service);

    syncPlayApi = _FakeSyncPlayApi();
    itemsApi = _FakeItemsApi();
    final client = _MockMediaServerClient();
    when(() => client.baseUrl).thenReturn('http://jf');
    when(() => client.serverType).thenReturn(ServerType.jellyfin);
    when(() => client.syncPlayApi).thenReturn(syncPlayApi);
    when(() => client.itemsApi).thenReturn(itemsApi);

    GetIt.instance.registerSingleton<MediaServerClientFactory>(
      _FakeClientFactory({'server1': client}),
    );

    syncPlayManager = SyncPlayManager(
      playbackManager,
      _FakeUserPreferences(),
    );
    syncPlayManager.setActiveClient(client);

    await playbackManager.playItems(<dynamic>[
      <String, dynamic>{'Id': 'ep1', 'Type': 'Episode'},
      <String, dynamic>{'Id': 'ep2', 'Type': 'Episode'},
    ]);

    syncPlayManager.handleGroupUpdate(
      const SyncPlayGroupUpdate(
        groupId: 'g1',
        type: SyncPlayGroupUpdateType.groupJoined,
        payload: SyncPlayGroupJoinedPayload(
          SyncPlayGroupInfo(
            groupId: 'g1',
            groupName: 'Group',
            state: SyncPlayGroupState.playing,
          ),
        ),
      ),
    );
    syncPlayManager.handleGroupUpdate(
      const SyncPlayGroupUpdate(
        groupId: 'g1',
        type: SyncPlayGroupUpdateType.playQueue,
        payload: SyncPlayPlayQueuePayload(
          SyncPlayPlayQueueUpdate(
            reason: SyncPlayQueueUpdateReason.newPlaylist,
            lastUpdate: '2026-01-01T00:00:00.000Z',
            playlist: [
              SyncPlayQueueItem(itemId: 'ep1', playlistItemId: 'pl1'),
              SyncPlayQueueItem(itemId: 'ep2', playlistItemId: 'pl2'),
            ],
            playingItemIndex: 0,
            startPositionTicks: 0,
            isPlaying: true,
            shuffleMode: SyncPlayShuffleMode.sorted,
            repeatMode: SyncPlayRepeatMode.repeatNone,
          ),
        ),
      ),
    );
    await Future<void>.delayed(Duration.zero);
    backend.currentDuration = end;
    backend.emitPosition(credits);
    service.stops.clear();
  });

  tearDown(() async {
    syncPlayManager.dispose();
    playbackManager.dispose();
    await GetIt.instance.reset();
  });

  test(
    'delayed SyncPlay nextItem switch after >10s still closes outgoing item as finished',
    () async {
      itemsApi.getItemGate = Completer<void>();

      await playbackManager.nextInQueueAsFinished();
      expect(syncPlayApi.nextItemCalls, ['pl1']);
      expect(service.stops, isEmpty);

      syncPlayManager.handleGroupUpdate(
        const SyncPlayGroupUpdate(
          groupId: 'g1',
          type: SyncPlayGroupUpdateType.playQueue,
          payload: SyncPlayPlayQueuePayload(
            SyncPlayPlayQueueUpdate(
              reason: SyncPlayQueueUpdateReason.nextItem,
              lastUpdate: '2026-01-01T00:00:01.000Z',
              playlist: [
                SyncPlayQueueItem(itemId: 'ep1', playlistItemId: 'pl1'),
                SyncPlayQueueItem(itemId: 'ep2', playlistItemId: 'pl2'),
              ],
              playingItemIndex: 1,
              startPositionTicks: 0,
              isPlaying: true,
              shuffleMode: SyncPlayShuffleMode.sorted,
              repeatMode: SyncPlayRepeatMode.repeatNone,
            ),
          ),
        ),
      );
      await Future<void>.delayed(Duration.zero);

      // Simulate a slow item fetch taking well past 10 seconds before playItems.
      now = now.add(const Duration(seconds: 30));
      itemsApi.getItemGate!.complete();
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(service.stops, [end]);
    },
  );

  test(
    'ignored SyncPlay next request does not mark a subsequent unrelated playItems as finished',
    () async {
      syncPlayApi.nextError = StateError('next rejected');

      await playbackManager.nextInQueueAsFinished();
      expect(syncPlayApi.nextItemCalls, ['pl1']);
      expect(service.stops, isEmpty);

      // User starts an unrelated item directly; outgoing item keeps credits pos.
      await playbackManager.playItems(<dynamic>[
        <String, dynamic>{'Id': 'ep3', 'Type': 'Episode'},
      ]);
      expect(service.stops, [credits]);
    },
  );

  test(
    'unrelated remote SyncPlay queue switch after pending nextAsFinished does not mark outgoing item finished',
    () async {
      await playbackManager.nextInQueueAsFinished();
      expect(syncPlayApi.nextItemCalls, ['pl1']);

      // Another participant replaces the playlist instead of advancing nextItem.
      syncPlayManager.handleGroupUpdate(
        const SyncPlayGroupUpdate(
          groupId: 'g1',
          type: SyncPlayGroupUpdateType.playQueue,
          payload: SyncPlayPlayQueuePayload(
            SyncPlayPlayQueueUpdate(
              reason: SyncPlayQueueUpdateReason.newPlaylist,
              lastUpdate: '2026-01-01T00:00:02.000Z',
              playlist: [
                SyncPlayQueueItem(itemId: 'ep3', playlistItemId: 'pl3'),
              ],
              playingItemIndex: 0,
              startPositionTicks: 0,
              isPlaying: true,
              shuffleMode: SyncPlayShuffleMode.sorted,
              repeatMode: SyncPlayRepeatMode.repeatNone,
            ),
          ),
        ),
      );
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(service.stops, [credits]);
    },
  );
}
