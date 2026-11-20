import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/cast/cast_session_reporter.dart';
import 'package:playback_core/playback_core.dart';

/// Records what the reporter tells the server.
class _Service extends PlayerService {
  final calls = <String>[];

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
  }) async {
    onProgress?.call(resolution);
    calls.add(
      'progress ${(mediaItem as AggregatedItem).id} ${position.inSeconds}'
      '${isPaused ? ' paused' : ''}',
    );
  }

  void Function(StreamResolutionResult)? onProgress;

  @override
  Future<void> onPlaybackStop(
    dynamic mediaItem,
    StreamResolutionResult resolution,
    Duration position, {
    bool releaseLiveStream = true,
  }) async => calls.add(
    'stop ${(mediaItem as AggregatedItem).id} ${position.inSeconds}',
  );

  @override
  void dispose() {}
}

final _film = AggregatedItem(
  id: 'movie-imdb-tt0295701',
  serverId: 's',
  rawData: const {'Id': 'movie-imdb-tt0295701', 'Type': 'Movie'},
);

/// A remux cut at 9:53 for a resume.
const _resolution = StreamResolutionResult(
  streamUrl: 'https://silo.example/api/v2/stream/s?token=t',
  mediaSourceId: '4598',
  playSessionId: 's',
  playMethod: StreamPlayMethod.directStream,
  timelineOffset: Duration(minutes: 9, seconds: 53),
);

void main() {
  late _Service service;
  late CastReceiverState receiver;
  late CastSessionReporter reporter;

  setUp(() {
    service = _Service();
    receiver = (active: true, itemId: _film.id, state: null, positionTicks: 0);
    reporter = CastSessionReporter(
      read: () => receiver,
      interval: const Duration(hours: 1),
    );
  });

  Future<void> begin() =>
      reporter.begin(service: service, item: _film, resolution: _resolution);

  test('the receiver\'s position on the film\'s timeline, paused or not',
      () async {
    await begin();
    // Nothing heard from the receiver yet: kept alive at the start.
    await reporter.tick();
    expect(service.calls, ['progress ${_film.id} 593']);
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 70 * 10000000,
    );
    await reporter.tick();
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'paused',
      positionTicks: 80 * 10000000,
    );
    await reporter.tick();
    expect(service.calls.skip(1), [
      'progress ${_film.id} 663',
      'progress ${_film.id} 673 paused',
    ]);
  });

  test('a receiver on the film\'s timeline gets no second offset', () async {
    await reporter.begin(
      service: service,
      item: _film,
      resolution: _resolution,
      positionsOnMediaTimeline: true,
    );
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 663 * 10000000,
    );
    await reporter.tick();
    expect(service.calls, ['progress ${_film.id} 663']);
  });

  // A DLNA seek on a remux replaces the stream in the same session.
  test('follows a replaced stream, through the idle while it loads', () async {
    var current = _resolution;
    var replacing = false;
    await reporter.begin(
      service: service,
      item: _film,
      resolution: _resolution,
      currentResolution: () => current,
      replacing: () => replacing,
      positionsOnMediaTimeline: true,
    );
    final reported = <StreamResolutionResult>[];
    service.onProgress = reported.add;
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 600 * 10000000,
    );
    await reporter.tick();
    current = const StreamResolutionResult(
      streamUrl: 'https://silo.example/api/v2/stream/s?seek=1800',
      mediaSourceId: '4598',
      playSessionId: 's',
      playMethod: StreamPlayMethod.directStream,
      timelineOffset: Duration(minutes: 30),
    );
    replacing = true;
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'idle',
      positionTicks: 1800 * 10000000,
    );
    await reporter.tick();
    expect(reporter.reporting, isTrue);
    expect(reported, [_resolution, current]);
    expect(service.calls.last, 'progress ${_film.id} 1800');
    // A stream that never plays: idle ends the cast once it isn't loading.
    replacing = false;
    await reporter.tick();
    expect(reporter.reporting, isFalse);
    expect(service.calls.last, 'stop ${_film.id} 1800');
  });

  test('a stop right after a seek saves where the seek went', () async {
    var current = _resolution;
    await reporter.begin(
      service: service,
      item: _film,
      resolution: _resolution,
      currentResolution: () => current,
      positionsOnMediaTimeline: true,
    );
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 600 * 10000000,
    );
    await reporter.tick();
    current = const StreamResolutionResult(
      streamUrl: 'https://silo.example/api/v2/stream/s?seek=1800',
      mediaSourceId: '4598',
      playSessionId: 's',
      playMethod: StreamPlayMethod.directStream,
      timelineOffset: Duration(minutes: 30),
      seeksThroughServer: true,
    );
    await reporter.end();
    expect(service.calls.last, 'stop ${_film.id} 1800');
  });

  test('stops when the cast ends, at the last position', () async {
    await begin();
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 10 * 10000000,
    );
    await reporter.tick();
    receiver = (active: false, itemId: null, state: null, positionTicks: 0);
    await reporter.tick();
    expect(service.calls.last, 'stop ${_film.id} 603');
    expect(reporter.reporting, isFalse);
    // Nothing more after the stop.
    await reporter.tick();
    expect(service.calls, hasLength(2));
  });

  test('stops when the receiver goes idle after playing, or plays another '
      'item', () async {
    await begin();
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'idle',
      positionTicks: 0,
    );
    // Idle before it played: still loading.
    await reporter.tick();
    expect(reporter.reporting, isTrue);
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'playing',
      positionTicks: 0,
    );
    await reporter.tick();
    receiver = (
      active: true,
      itemId: _film.id,
      state: 'idle',
      positionTicks: 0,
    );
    await reporter.tick();
    expect(reporter.reporting, isFalse);

    await begin();
    receiver = (
      active: true,
      itemId: 'episode-other',
      state: 'playing',
      positionTicks: 0,
    );
    await reporter.tick();
    expect(reporter.reporting, isFalse);
    expect(service.calls.where((c) => c.startsWith('stop')), hasLength(2));
  });

  test('a new cast stops the one before', () async {
    await begin();
    await begin();
    expect(service.calls, ['stop ${_film.id} 593']);
  });
}
