import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/cast_provider.dart';
import 'package:moonfin/data/services/cast/cast_service.dart';
import 'package:moonfin/data/services/cast/cast_target.dart';
import 'package:moonfin/data/services/cast/cast_transport_controls.dart';
import 'package:moonfin/data/services/cast/remote_session_cast_provider.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:server_core/server_core.dart';

class _FakeSessionApi extends Fake implements SessionApi {
  final playStateCommands = <String>[];
  List<Map<String, dynamic>> sessions = const [];

  @override
  Future<List<Map<String, dynamic>>> getSessions({
    String? controllableByUserId,
    int? activeWithinSeconds,
  }) async => sessions;

  @override
  Future<void> sendPlayCommand(
    String sessionId, {
    required String playCommand,
    required List<String> itemIds,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
    int? startIndex,
  }) async {}

  @override
  Future<void> sendPlayStateCommand(
    String sessionId,
    String command, {
    int? seekPositionTicks,
  }) async {
    playStateCommands.add('$sessionId:$command');
  }
}

class _FakeClient extends Fake implements MediaServerClient {
  @override
  final SessionApi sessionApi;

  _FakeClient(this.sessionApi);
}

class _FakeClientFactory extends Fake implements MediaServerClientFactory {
  final MediaServerClient client;

  _FakeClientFactory(this.client);

  @override
  MediaServerClient? getClientIfExists(String serverId) => client;
}

class _FakeRemoteProvider
    implements
        CastProvider,
        CastTransportControls,
        CastTrackSkipControls,
        PollableRemoteState {
  final commands = <String>[];
  RemotePlaybackSnapshot? snapshot;

  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.jellyfinSession};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.jellyfinSession};

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async => const [];

  @override
  Future<void> playToTarget(
    CastTarget target, {
    required AggregatedItem item,
    List<AggregatedItem>? queueItems,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {
    commands.add('playToTarget:${item.id}');
  }

  @override
  Future<void> play(CastTargetKind kind) async => commands.add('play');

  @override
  Future<void> pause(CastTargetKind kind) async => commands.add('pause');

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async =>
      commands.add('seek:$positionTicks');

  @override
  Future<void> stop(CastTargetKind kind) async => commands.add('stop');

  @override
  Future<void> nextTrack(CastTargetKind kind) async =>
      commands.add('nextTrack');

  @override
  Future<void> previousTrack(CastTargetKind kind) async =>
      commands.add('previousTrack');

  @override
  Future<double?> getVolume(CastTargetKind kind) async => null;

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {}

  @override
  Future<RemotePlaybackSnapshot?> fetchRemoteSnapshot(
    CastTargetKind kind,
  ) async => snapshot;
}

class _NoSkipProvider implements CastProvider, CastTransportControls {
  @override
  Set<CastTargetKind> get supportedKinds => {CastTargetKind.googleCast};

  @override
  Set<CastTargetKind> get controllableKinds => {CastTargetKind.googleCast};

  @override
  Future<List<CastTarget>> discoverTargets(AggregatedItem item) async => const [];

  @override
  Future<void> playToTarget(
    CastTarget target, {
    required AggregatedItem item,
    List<AggregatedItem>? queueItems,
    int? startPositionTicks,
    String? mediaSourceId,
    int? audioStreamIndex,
    int? subtitleStreamIndex,
  }) async {}

  @override
  Future<void> play(CastTargetKind kind) async {}

  @override
  Future<void> pause(CastTargetKind kind) async {}

  @override
  Future<void> seek(CastTargetKind kind, {required int positionTicks}) async {}

  @override
  Future<void> stop(CastTargetKind kind) async {}

  @override
  Future<double?> getVolume(CastTargetKind kind) async => null;

  @override
  Future<void> setVolume(CastTargetKind kind, {required double volume}) async {}
}

void main() {
  const target = CastTarget(
    id: 'tv-session-1',
    kind: CastTargetKind.jellyfinSession,
    title: 'Living Room TV',
    subtitle: 'Moonfin for webOS',
  );

  final track1 = AggregatedItem(
    id: 'track-1',
    serverId: 'srv-1',
    rawData: const {
      'Id': 'track-1',
      'Name': 'Money',
      'Type': 'Audio',
      'RunTimeTicks': 3890000000,
      'MediaStreams': [
        {'Type': 'Audio', 'Codec': 'flac'},
      ],
    },
  );

  final track2 = AggregatedItem(
    id: 'track-2',
    serverId: 'srv-1',
    rawData: const {
      'Id': 'track-2',
      'Name': 'Us and Them',
      'Type': 'Audio',
      'RunTimeTicks': 4690000000,
    },
  );

  final video = AggregatedItem(
    id: 'movie-1',
    serverId: 'srv-1',
    rawData: const {
      'Id': 'movie-1',
      'Name': 'The Matrix',
      'Type': 'Movie',
      'RunTimeTicks': 81600000000,
    },
  );

  test('polling preserves richer item when id matches and switches on item change',
      () async {
    final provider = _FakeRemoteProvider();
    final service = CastService([provider]);
    addTearDown(service.dispose);

    // Same track id with sparser snapshot payload should keep the richer item.
    provider.snapshot = RemotePlaybackSnapshot(
      state: 'playing',
      positionTicks: 1010000000,
      item: AggregatedItem(
        id: 'track-1',
        serverId: 'srv-1',
        rawData: const {'Id': 'track-1', 'Name': 'Money', 'Type': 'Audio'},
      ),
    );

    await service.playToTarget(target, item: track1);
    await Future<void>.delayed(Duration.zero);

    expect(service.remoteStateNotifier.value, 'playing');
    expect(service.remotePositionNotifier.value, 1010000000);
    expect(service.castItemNotifier.value, same(track1));

    // When the TV switches to a different item (e.g. a video), castItemNotifier updates.
    provider.snapshot = RemotePlaybackSnapshot(
      state: 'playing',
      positionTicks: 500000000,
      item: video,
    );
    await service.nextTrack(CastTargetKind.jellyfinSession);
    await Future<void>.delayed(Duration.zero);

    expect(provider.commands, contains('nextTrack'));
    expect(service.castItemNotifier.value?.id, 'movie-1');
    expect(service.castItemNotifier.value?.name, 'The Matrix');
    expect(service.remotePositionNotifier.value, 500000000);
  });

  test('nextTrack and previousTrack forward to CastTrackSkipControls and no-op otherwise',
      () async {
    final remote = _FakeRemoteProvider()
      ..snapshot = RemotePlaybackSnapshot(
        state: 'playing',
        positionTicks: 0,
        item: track2,
      );
    final noSkip = _NoSkipProvider();
    final service = CastService([remote, noSkip]);
    addTearDown(service.dispose);

    await service.playToTarget(target, item: track1);
    await service.nextTrack(CastTargetKind.jellyfinSession);
    await service.previousTrack(CastTargetKind.jellyfinSession);

    expect(
      remote.commands,
      ['playToTarget:track-1', 'nextTrack', 'previousTrack'],
    );

    // Non-skipping providers (e.g. Google Cast) must safely no-op.
    await service.nextTrack(CastTargetKind.googleCast);
    await service.previousTrack(CastTargetKind.googleCast);
  });

  test('play, pause, and seek optimistically update remote notifiers', () async {
    final provider = _FakeRemoteProvider();
    final service = CastService([provider]);
    addTearDown(service.dispose);

    await service.playToTarget(target, item: track1);

    await service.pause(CastTargetKind.jellyfinSession);
    expect(service.remoteStateNotifier.value, 'paused');

    await service.play(CastTargetKind.jellyfinSession);
    expect(service.remoteStateNotifier.value, 'playing');

    await service.seek(CastTargetKind.jellyfinSession, positionTicks: 420000000);
    expect(service.remotePositionNotifier.value, 420000000);
  });

  test('RemoteSessionCastProvider sends NextTrack/PreviousTrack and parses NowPlayingItem',
      () async {
    final sessionApi = _FakeSessionApi()
      ..sessions = [
        {
          'Id': target.id,
          'PlayState': {
            'IsPaused': false,
            'PositionTicks': 1230000000,
            'VolumeLevel': 65,
          },
          'NowPlayingItem': {
            'Id': 'track-2',
            'Name': 'Us and Them',
            'Type': 'Audio',
            'RunTimeTicks': 4690000000,
          },
        },
      ];
    final provider = RemoteSessionCastProvider(
      _FakeClientFactory(_FakeClient(sessionApi)),
    );

    await provider.playToTarget(target, item: track1);
    await provider.nextTrack(CastTargetKind.jellyfinSession);
    await provider.previousTrack(CastTargetKind.jellyfinSession);

    expect(sessionApi.playStateCommands, [
      '${target.id}:NextTrack',
      '${target.id}:PreviousTrack',
    ]);

    final snap = await provider.fetchRemoteSnapshot(
      CastTargetKind.jellyfinSession,
    );
    expect(snap, isNotNull);
    expect(snap!.state, 'playing');
    expect(snap.positionTicks, 1230000000);
    expect(snap.volume, closeTo(0.65, 0.001));
    expect(snap.item?.id, 'track-2');
    expect(snap.item?.name, 'Us and Them');
    expect(snap.item?.serverId, 'srv-1');
  });
}
