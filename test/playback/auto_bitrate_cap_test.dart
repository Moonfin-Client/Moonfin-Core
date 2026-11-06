import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/auto_bitrate_service.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart' show ItemsApi;

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
  _BitrateResolver(this.sourceBitrate, {this.codecTranscodes = false});

  final int sourceBitrate;

  /// Transcodes whatever the ceiling, like a source the device can't decode.
  final bool codecTranscodes;
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
      playMethod: enableDirectPlay && fits && !codecTranscodes
          ? StreamPlayMethod.directPlay
          : StreamPlayMethod.transcode,
      sourceBitrate: sourceBitrate,
      liveStreamId: MediaStreamResolver.isLiveTvItem(mediaItem) ? 'live' : null,
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

/// The ceilings each request carried, and how often the speed test was asked.
Future<({List<int?> ceilings, int tests})> _play({
  required dynamic item,
  required int sourceBitrate,
  required int? measured,
  int? saved,
  bool enableDirectPlay = true,
  bool codecTranscodes = false,
}) async {
  final resolver = _BitrateResolver(
    sourceBitrate,
    codecTranscodes: codecTranscodes,
  );
  var tests = 0;
  final manager = PlaybackManager()
    ..setBackend(_Backend())
    ..setResolver(resolver)
    ..autoBitrateProvider = (() async {
      tests++;
      return measured;
    })
    ..savedAutoBitrateProvider = (() async => saved);
  await manager.playItems(<dynamic>[item], enableDirectPlay: enableDirectPlay);
  manager.dispose();
  return (ceilings: resolver.ceilings, tests: tests);
}

void main() {
  const queueEntry = <String, dynamic>{'Id': 'episode', 'Type': 'Episode'};

  group('Auto ceiling', () {
    test(
      'a source that outruns the measurement is sent its own bitrate',
      () async {
        final played = await _play(
          item: _ItemWithSources(15000000),
          sourceBitrate: 15000000,
          measured: 1500000,
          saved: 1500000,
        );

        expect(played.ceilings, [15000000]);
      },
    );

    test('an item without its sources asks again once the server names the bitrate', () async {
      final played = await _play(
        item: queueEntry,
        sourceBitrate: 15000000,
        measured: 1500000,
        saved: 1500000,
      );

      expect(played.ceilings, [1500000, 15000000]);
    });

    test('a source under the measurement is sent the measurement', () async {
      final played = await _play(
        item: queueEntry,
        sourceBitrate: 1000000,
        measured: 1500000,
        saved: 1500000,
      );

      expect(played.ceilings, [1500000]);
      expect(played.tests, 0);
    });

    test('a transcode asked for outright is held to the measurement', () async {
      final played = await _play(
        item: _ItemWithSources(15000000),
        sourceBitrate: 15000000,
        measured: 1500000,
        enableDirectPlay: false,
      );

      expect(played.ceilings, [1500000]);
      expect(played.tests, 1);
    });

    test('a direct play with nothing saved never runs the test', () async {
      final played = await _play(
        item: _ItemWithSources(15000000),
        sourceBitrate: 15000000,
        measured: 1500000,
      );

      expect(played.ceilings, [null]);
      expect(played.tests, 0);
    });

    test('a transcode with nothing saved runs the test and asks again', () async {
      final played = await _play(
        item: _ItemWithSources(1000000),
        sourceBitrate: 1000000,
        measured: 1500000,
        codecTranscodes: true,
      );

      expect(played.ceilings, [null, 1500000]);
      expect(played.tests, 1);
    });

    test('a transcode on a saved measurement that still holds asks once', () async {
      final played = await _play(
        item: _ItemWithSources(1000000),
        sourceBitrate: 1000000,
        measured: 1500000,
        saved: 1500000,
        codecTranscodes: true,
      );

      expect(played.ceilings, [1500000]);
      expect(played.tests, 1);
    });

    test('a transcode on an outdated saved measurement asks with the new one', () async {
      final played = await _play(
        item: _ItemWithSources(1000000),
        sourceBitrate: 1000000,
        measured: 1500000,
        saved: 8000000,
        codecTranscodes: true,
      );

      expect(played.ceilings, [8000000, 1500000]);
      expect(played.tests, 1);
    });

    test('a live channel is measured before its only request', () async {
      final played = await _play(
        item: const <String, dynamic>{'Id': 'channel', 'Type': 'TvChannel'},
        sourceBitrate: 15000000,
        measured: 1500000,
      );

      expect(played.ceilings, [1500000]);
      expect(played.tests, 1);
    });

    test('no measurement leaves the request uncapped', () async {
      final played = await _play(
        item: queueEntry,
        sourceBitrate: 15000000,
        measured: null,
      );

      expect(played.ceilings, [null]);
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

  group('AutoBitrateService.plexSampleFile', () {
    test('reads the first movie file', () async {
      final items = _Items({
        'Movie': '/library/parts/3720/1786486459/file.mkv',
        'Episode': '/library/parts/21205/1/file.mkv',
      });

      expect(
        await AutoBitrateService.plexSampleFile(items),
        '/library/parts/3720/1786486459/file.mkv',
      );
      expect(
        items.asked.single,
        allOf(
          containsPair(#includeItemTypes, ['Movie']),
          containsPair(#limit, 1),
        ),
      );
    });

    test('a library without movies reads an episode', () async {
      final items = _Items({'Episode': '/library/parts/21205/1/file.mkv'});

      expect(
        await AutoBitrateService.plexSampleFile(items),
        '/library/parts/21205/1/file.mkv',
      );
      expect(items.asked.map((args) => args[#includeItemTypes]), [
        ['Movie'],
        ['Episode'],
      ]);
    });

    test('an empty library or a failed request has nothing to read', () async {
      expect(await AutoBitrateService.plexSampleFile(_Items({})), isNull);
      expect(await AutoBitrateService.plexSampleFile(_Items(null)), isNull);
    });
  });
}

/// Answers `getItems` with the file [files] lists for the type asked for, or
/// fails when [files] is null.
class _Items implements ItemsApi {
  _Items(this.files);

  final Map<String, String>? files;
  final asked = <Map<Symbol, dynamic>>[];

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName != #getItems) {
      return super.noSuchMethod(invocation);
    }
    asked.add(invocation.namedArguments);
    final byType = files;
    if (byType == null) {
      return Future<Map<String, dynamic>>.error(StateError('offline'));
    }
    final type = (invocation.namedArguments[#includeItemTypes] as List).single;
    final path = byType[type];
    return Future.value(<String, dynamic>{
      'Items': [
        if (path != null)
          {
            'MediaSources': [
              {'DirectStreamUrl': path},
            ],
          },
      ],
    });
  }
}
