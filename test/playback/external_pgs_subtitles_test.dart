import 'package:flutter_test/flutter_test.dart';
import 'package:playback_core/playback_core.dart';

Map<String, dynamic> _profileOfferingPgsAsFile() => <String, dynamic>{
  'SubtitleProfiles': <Map<String, dynamic>>[
    {'Format': 'srt', 'Method': 'External'},
    {'Format': 'pgs', 'Method': 'Embed'},
    {'Format': 'pgs', 'Method': 'External'},
    {'Format': 'pgs', 'Method': 'Encode'},
    {'Format': 'pgssub', 'Method': 'Embed'},
    {'Format': 'pgssub', 'Method': 'External'},
    {'Format': 'pgssub', 'Method': 'Encode'},
  ],
};

bool _offersPgsAsFile(Map<String, dynamic>? profile) =>
    ((profile?['SubtitleProfiles'] as List?) ?? const [])
        .cast<Map<String, dynamic>>()
        .any(
          (entry) =>
              entry['Format'] == 'pgssub' && entry['Method'] == 'External',
        );

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
  bool get canRenderBitmapSubtitles => true;
  @override
  bool get requiresStartupMediaReadyCheck => false;
  @override
  bool get demuxesEmbeddedSubtitles => true;

  @override
  Map<String, dynamic> getDeviceProfile({
    bool useProgressiveTranscode = false,
  }) => _profileOfferingPgsAsFile();

  @override
  Future<void> play(
    dynamic mediaItem, {
    Duration startPosition = Duration.zero,
  }) async {}

  @override
  Future<void> stop() async {}
  @override
  Future<void> setSubtitleTrack(
    int trackId, {
    bool isBitmapSubtitle = false,
    String? subtitleCodec,
    bool isExternalSubtitle = false,
    String? externalSubtitleUrl,
  }) async {}
  @override
  Future<void> disableSubtitleTrack() async {}
  @override
  Future<void> waitForTracksReady() async {}
  @override
  void dispose() {}
}

/// Answers the way Jellyfin does for a file with a PGS track inside it
/// (index 1) and a .sup file next to it (index 2). Direct play keeps the
/// embedded track embedded. Otherwise a PGS track goes out as a file when the
/// profile offers that, and is burned in when it doesn't.
class _ServerLikeResolver extends MediaStreamResolver {
  _ServerLikeResolver(this.playMethod);

  final StreamPlayMethod playMethod;
  final List<bool> offeredPgsAsFile = <bool>[];

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
    final asFile = _offersPgsAsFile(deviceProfile);
    offeredPgsAsFile.add(asFile);
    String delivery({required bool isExternal}) {
      if (!isExternal && playMethod == StreamPlayMethod.directPlay) {
        return 'Embed';
      }
      return asFile ? 'External' : 'Encode';
    }

    return StreamResolutionResult(
      streamUrl: 'https://example.test/master.m3u8',
      mediaSourceId: 'source-1',
      playSessionId: 'session-1',
      playMethod: playMethod,
      mediaStreams: <Map<String, dynamic>>[
        {'Type': 'Video', 'Index': 0, 'Codec': 'av1'},
        {
          'Type': 'Subtitle',
          'Index': 1,
          'Codec': 'PGSSUB',
          'IsExternal': false,
          'DeliveryMethod': delivery(isExternal: false),
        },
        {
          'Type': 'Subtitle',
          'Index': 2,
          'Codec': 'PGSSUB',
          'IsExternal': true,
          'DeliveryMethod': delivery(isExternal: true),
        },
      ],
      selectedSubtitleStreamIndex: subtitleStreamIndex,
    );
  }
}

Future<List<bool>> _offersWhenPicking(
  int subtitleStreamIndex,
  StreamPlayMethod playMethod,
) async {
  final resolver = _ServerLikeResolver(playMethod);
  final manager = PlaybackManager()
    ..setBackend(_Backend())
    ..setResolver(resolver);
  await manager.playItems(
    <dynamic>[
      <String, dynamic>{'Id': 'episode', 'Type': 'Episode'},
    ],
    subtitleStreamIndex: subtitleStreamIndex,
    subtitleSelectionExplicit: true,
  );
  manager.dispose();
  return resolver.offeredPgsAsFile;
}

void main() {
  group('withholdExternalPgsSubtitles', () {
    test('drops only the External PGS entries', () {
      final profile = _profileOfferingPgsAsFile();
      withholdExternalPgsSubtitles(profile);

      final left = (profile['SubtitleProfiles'] as List)
          .cast<Map<String, dynamic>>()
          .map((entry) => '${entry['Format']}:${entry['Method']}')
          .toList();
      expect(left, [
        'srt:External',
        'pgs:Embed',
        'pgs:Encode',
        'pgssub:Embed',
        'pgssub:Encode',
      ]);
    });

    test('leaves a profile with no subtitle list alone', () {
      final profile = <String, dynamic>{'Name': 'bare'};
      withholdExternalPgsSubtitles(profile);

      expect(profile, {'Name': 'bare'});
    });
  });

  group('extractExternalSubtitles', () {
    test(
      'keeps a .sup file and skips a PGS track the server would extract',
      () {
        final subs = MediaStreamResolver.extractExternalSubtitles(
          <Map<String, dynamic>>[
            {
              'Type': 'Subtitle',
              'Index': 1,
              'Codec': 'PGSSUB',
              'IsExternal': false,
              'SupportsExternalStream': true,
              'DeliveryUrl': '/Videos/e/s/Subtitles/1/0/Stream.pgssub',
            },
            {
              'Type': 'Subtitle',
              'Index': 2,
              'Codec': 'PGSSUB',
              'IsExternal': true,
              'DeliveryUrl': '/Videos/e/s/Subtitles/2/0/Stream.pgssub',
            },
            {
              'Type': 'Subtitle',
              'Index': 3,
              'Codec': 'subrip',
              'IsExternal': false,
              'SupportsExternalStream': true,
              'DeliveryUrl': '/Videos/e/s/Subtitles/3/0/Stream.srt',
            },
          ],
          'https://example.test',
        );

        expect(subs.map((s) => s.streamIndex), [2, 3]);
        expect(subs.first.codec, 'PGSSUB');
      },
    );
  });

  group('picking a PGS track', () {
    test(
      'an embedded track in a transcode asks again and gets burned in',
      () async {
        final offers = await _offersWhenPicking(1, StreamPlayMethod.transcode);

        expect(offers, [true, false]);
      },
    );

    test('a .sup file in a transcode is handed over in one request', () async {
      final offers = await _offersWhenPicking(2, StreamPlayMethod.transcode);

      expect(offers, [true]);
    });

    test('an embedded track in direct play stays embedded', () async {
      final offers = await _offersWhenPicking(1, StreamPlayMethod.directPlay);

      expect(offers, [true]);
    });
  });
}
