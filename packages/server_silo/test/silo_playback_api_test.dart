import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';
import 'package:test/test.dart';

import 'fixture_server.dart';
import 'silo_test_client.dart';

const _salt = 'movie-imdb-tt27766440';

Map<String, dynamic> _profile(String video, String audio) => {
  'DirectPlayProfiles': [
    {
      'Type': 'Video',
      'Container': 'mkv,mp4',
      'VideoCodec': video,
      'AudioCodec': audio,
    },
    {'Type': 'Audio', 'Container': 'mp3', 'AudioCodec': 'mp3'},
  ],
};

FixtureServer _server() => FixtureServer({
  '/api/v2/catalog/items/$_salt': FixtureServer.file(
    'silo/catalog_item_movie_multi.json',
  ),
});

void main() {
  capabilitiesTests();

  test('built from the versions, never starting playback', () async {
    final server = _server();
    final info = await siloTestClient(server).playbackApi.getPlaybackInfo(
      _salt,
      requestBody: {'DeviceProfile': _profile('h264,hevc', 'ac3,eac3')},
    );
    final sources = (info['MediaSources'] as List).cast<Map>();
    expect(sources.map((s) => s['Id']), ['4603', '4602']);
    expect(sources.every((s) => s['SupportsDirectPlay'] == true), isTrue);
    expect(sources.first, isNot(contains(siloTracksKey)));
    expect(info['PlaySessionId'], isNull);
    expect(
      server.requests.where((r) => r.uri.path.contains('/playback')),
      isEmpty,
    );
  });

  test('the asked version comes first', () async {
    final info = await siloTestClient(_server()).playbackApi.getPlaybackInfo(
      _salt,
      requestBody: {'MediaSourceId': '4602'},
    );
    expect((info['MediaSources'] as List).first['Id'], '4602');
  });

  test('reasons when the device can\'t play it directly', () async {
    final info = await siloTestClient(_server()).playbackApi.getPlaybackInfo(
      _salt,
      requestBody: {'DeviceProfile': _profile('h264', 'aac')},
    );
    final sources = (info['MediaSources'] as List).cast<Map>();
    expect(sources[0]['SupportsDirectPlay'], isFalse);
    expect(sources[0]['TranscodingReasons'], [
      'VideoCodecNotSupported',
      'AudioCodecNotSupported',
    ]);
    expect(sources[1]['TranscodingReasons'], ['AudioCodecNotSupported']);
    // Moonfin's own parser reads it.
    final parsed = PlaybackInfoResult.fromJson(info);
    expect(parsed.mediaSources.first.transcodingReasons, hasLength(2));
    expect(parsed.mediaSources.last.supportsDirectPlay, isFalse);
  });

  test('container names and empty lists', () {
    final source = {
      'Container': 'mkv',
      'MediaStreams': [
        {'Type': 'Video', 'Index': 0, 'Codec': 'hevc'},
        {'Type': 'Audio', 'Index': 1, 'Codec': 'dts'},
        {'Type': 'Audio', 'Index': 2, 'Codec': 'aac'},
      ],
      'DefaultAudioStreamIndex': 1,
    };
    Map<String, dynamic> profile(Map<String, String> p) => {
      'DirectPlayProfiles': [
        {'Type': 'Video', ...p},
      ],
    };
    expect(
      siloDirectPlayReasons(source, profile({'Container': 'matroska'})),
      isEmpty,
    );
    expect(siloDirectPlayReasons(source, profile({'AudioCodec': 'aac'})), [
      'AudioCodecNotSupported',
    ]);
    expect(
      siloDirectPlayReasons(
        source,
        profile({'AudioCodec': 'aac'}),
        audioStreamIndex: 2,
      ),
      isEmpty,
    );
    expect(siloDirectPlayReasons(source, {'DirectPlayProfiles': []}), [
      'ContainerNotSupported',
    ]);
  });

  test("Jellyfin's playback reporting is not Silo's", () {
    final api = siloTestClient(FixtureServer({})).playbackApi;
    expect(() => api.reportPlaybackStart({}), throwsUnsupportedError);
  });
}

/// A signed-in client whose clock the test moves.
({SiloMediaServerClient client, void Function(Duration) wait}) _clockedClient(
  FixtureServer server,
) {
  var now = siloTestNow;
  final client =
      SiloMediaServerClient(
          baseUrl: 'https://silo.example',
          deviceInfo: siloTestDevice,
          httpClientAdapter: server,
          clock: () => now,
        )
        ..session.setTokens(
          SiloTokens(
            accessToken: 'access-1',
            refreshToken: 'refresh-1',
            expiresAt: now.add(const Duration(hours: 1)),
            lifetime: const Duration(hours: 1),
          ),
        )
        ..profileId = 'p1';
  return (client: client, wait: (d) => now = now.add(d));
}

void capabilitiesTests() {
  group('capabilities', () {
    FixtureServer server() => FixtureServer({
      '/api/v2/playback/capabilities': FixtureServer.file(
        'silo/playback_capabilities.json',
      ),
    });

    test('the installation id, features and deliveries', () async {
      final caps = await siloTestClient(server()).playbackApi.capabilities();
      expect(caps.installationId, 'c621caf1-c95a-4626-a74f-bee7cf6b1402');
      expect(caps.playable, isTrue);
      expect(caps.protocolVersions, [3]);
      expect(caps.has('sequenced_progress_v1'), isTrue);
      expect(caps.has('fixed_media_file_v1'), isTrue);
      expect(caps.deliveries, contains('server_transcode_hls'));
    });

    test('kept a minute, shared while being read, then read again', () async {
      final s = server();
      final c = _clockedClient(s);
      final api = c.client.playbackApi;
      await Future.wait([api.capabilities(), api.capabilities()]);
      expect(s.requests, hasLength(1));
      c.wait(const Duration(seconds: 59));
      await api.capabilities();
      expect(s.requests, hasLength(1));
      c.wait(const Duration(seconds: 2));
      await api.capabilities();
      expect(s.requests, hasLength(2));
      // A refresh, or forgetting them, reads now.
      await api.capabilities(refresh: true);
      api.forgetCapabilities();
      await api.capabilities();
      expect(s.requests, hasLength(4));
      expect(s.requests.first.headers['X-Profile-Id'], 'p1');
    });

    test('a server without playback is not playable', () async {
      final s = FixtureServer({
        '/api/v2/playback/capabilities': siloJson({
          'installation_id': 'c621caf1-c95a-4626-a74f-bee7cf6b1402',
          'revision': 'r',
          'state': 'not_configured',
          'allowed': false,
          'protocol_versions': [3],
          'features': <String>[],
          'deliveries': <String>[],
        }),
      });
      final caps = await siloTestClient(s).playbackApi.capabilities();
      expect(caps.playable, isFalse);
    });

    test('installation_changed is recognised', () async {
      final s = FixtureServer({
        '/api/v2/playback/capabilities': (_) => FixtureServer.problem(
          409,
          'installation_changed',
          'The server installation changed.',
        ),
      });
      Object? error;
      try {
        await siloTestClient(s).playbackApi.capabilities();
      } catch (e) {
        error = e;
      }
      expect(SiloPlaybackApi.isInstallationChanged(error!), isTrue);
      expect(SiloPlaybackApi.isInstallationChanged(StateError('x')), isFalse);
    });
  });
}
