import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/auto_bitrate_service.dart';
import 'package:playback_core/playback_core.dart';

class _Backend extends Fake implements PlayerBackend {
  @override
  Duration get position => Duration.zero;
  @override
  Duration get duration => const Duration(minutes: 50);
  @override
  Duration get buffer => Duration.zero;
  @override
  bool get isPlaying => false;
  @override
  bool get isBuffering => false;
  @override
  Stream<Duration> get positionStream => const Stream<Duration>.empty();
  @override
  Stream<Duration> get durationStream => const Stream<Duration>.empty();
  @override
  Stream<Duration> get bufferStream => const Stream<Duration>.empty();
  @override
  Stream<bool> get playingStream => const Stream<bool>.empty();
  @override
  Stream<bool> get bufferingStream => const Stream<bool>.empty();
  @override
  Stream<bool> get completedStream => const Stream<bool>.empty();
  @override
  Stream<Map<String, dynamic>>? get errorStream => null;
  @override
  bool get requiresStartupMediaReadyCheck => false;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => <String, dynamic>{};

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {}

  @override
  Future<void> stop() async {}
  @override
  void dispose() {}
}

/// Direct plays when the ceiling it's sent lets the source through and
/// transcodes when it doesn't, the way the server weighs the bitrate.
class _BitrateResolver extends MediaStreamResolver {
  _BitrateResolver(this.sourceBitrate);

  final int sourceBitrate;
  final List<int?> ceilings = <int?>[];

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
  }) async {
    ceilings.add(maxStreamingBitrate);
    final fits =
        maxStreamingBitrate == null || sourceBitrate <= maxStreamingBitrate;
    return StreamResolutionResult(
      streamUrl: 'https://example.test/stream',
      mediaSourceId: 'source-1',
      playSessionId: 'session-1',
      playMethod: enableDirectPlay && fits
          ? StreamPlayMethod.directPlay
          : StreamPlayMethod.transcode,
      sourceBitrate: sourceBitrate,
    );
  }
}

/// A library item that carries its media sources, the way one opened from its
/// detail screen does.
class _ItemWithSources {
  _ItemWithSources(int bitrate)
    : mediaSources = <Map<String, dynamic>>[
        {'Id': 'source-1', 'Bitrate': bitrate},
      ];

  final String id = 'episode';
  final List<Map<String, dynamic>> mediaSources;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

Future<List<int?>> _ceilingsSent({
  required dynamic item,
  required int sourceBitrate,
  required int? measured,
  bool enableDirectPlay = true,
}) async {
  final resolver = _BitrateResolver(sourceBitrate);
  final manager = PlaybackManager()
    ..setBackend(_Backend())
    ..setResolver(resolver)
    ..autoBitrateProvider = (() async => measured);
  await manager.playItems(<dynamic>[item], enableDirectPlay: enableDirectPlay);
  manager.dispose();
  return resolver.ceilings;
}

void main() {
  const queueEntry = <String, dynamic>{'Id': 'episode', 'Type': 'Episode'};

  group('Auto ceiling', () {
    test(
      'a source that outruns the measurement is sent its own bitrate',
      () async {
        final ceilings = await _ceilingsSent(
          item: _ItemWithSources(15000000),
          sourceBitrate: 15000000,
          measured: 1500000,
        );

        expect(ceilings, [15000000]);
      },
    );

    test('an item without its sources asks again once the server names the bitrate', () async {
      final ceilings = await _ceilingsSent(
        item: queueEntry,
        sourceBitrate: 15000000,
        measured: 1500000,
      );

      expect(ceilings, [1500000, 15000000]);
    });

    test('a source under the measurement is sent the measurement', () async {
      final ceilings = await _ceilingsSent(
        item: queueEntry,
        sourceBitrate: 1000000,
        measured: 1500000,
      );

      expect(ceilings, [1500000]);
    });

    test('a transcode asked for outright is held to the measurement', () async {
      final ceilings = await _ceilingsSent(
        item: _ItemWithSources(15000000),
        sourceBitrate: 15000000,
        measured: 1500000,
        enableDirectPlay: false,
      );

      expect(ceilings, [1500000]);
    });

    test('no measurement leaves the request uncapped', () async {
      final ceilings = await _ceilingsSent(
        item: queueEntry,
        sourceBitrate: 15000000,
        measured: null,
      );

      expect(ceilings, [null]);
    });
  });

  group('AutoBitrateService.stepThroughProbes', () {
    Future<(int?, List<int>)> run(Map<int, int?> rateForSize) async {
      final asked = <int>[];
      final bps = await AutoBitrateService.stepThroughProbes((bytes) async {
        asked.add(bytes);
        return rateForSize[bytes];
      });
      return (bps, asked);
    }

    test('a slow link stops on the smallest probe', () async {
      final (bps, asked) = await run({500000: 400000});

      expect(bps, 400000);
      expect(asked, [500000]);
    });

    test('a middling link stops on the second probe', () async {
      final (bps, asked) = await run({500000: 8000000, 1000000: 12000000});

      expect(bps, 12000000);
      expect(asked, [500000, 1000000]);
    });

    test('a fast link runs every probe and keeps the last', () async {
      final (bps, asked) = await run({
        500000: 30000000,
        1000000: 60000000,
        3000000: 90000000,
      });

      expect(bps, 90000000);
      expect(asked, [500000, 1000000, 3000000]);
    });

    test('a later probe that fails keeps the rate before it', () async {
      final (bps, asked) = await run({500000: 30000000, 1000000: 60000000});

      expect(bps, 60000000);
      expect(asked, [500000, 1000000, 3000000]);
    });

    test('a first probe that fails measures nothing', () async {
      final (bps, asked) = await run({});

      expect(bps, isNull);
      expect(asked, [500000]);
    });
  });
}
