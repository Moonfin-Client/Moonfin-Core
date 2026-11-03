import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/watch_party/silo_watch_party_manager.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

const _item = {
  'MediaSources': [
    {
      'Id': '5',
      'MediaStreams': [
        {'Type': 'Video', 'Index': 0},
        {'Type': 'Audio', 'Index': 1, 'IsDefault': false},
        {'Type': 'Audio', 'Index': 2, 'IsDefault': true},
        {'Type': 'Subtitle', 'Index': 3, 'DisplayTitle': 'English'},
      ],
    },
    {
      'Id': '9',
      'MediaStreams': [
        {'Type': 'Audio', 'Index': 1},
      ],
    },
  ],
};

class _NoPlayback extends Fake implements PlaybackManager {}

void main() {
  test('a clock sample takes out the server\'s own handling time', () {
    // Sent at 1000, received 40 ms later by a server whose clock runs 500 ms
    // ahead, answered 10 ms later, back at 1090.
    final sample = SiloWatchPartyManager.clockSample(1000, 1540, 1550, 1090);
    expect(sample.rttMs, 80);
    expect(sample.offsetMs, 500);
  });

  test('everyone gets the pinned file\'s default audio track', () {
    final pinned = SiloWatchPartyManager.partySource(_item, '5');
    expect(SiloWatchPartyManager.defaultAudioIndex(pinned), 2);
    expect(
      SiloWatchPartyManager.streamsOf(pinned, 'Subtitle').single['Index'],
      3,
    );
    // No default flagged: the first audio track.
    final other = SiloWatchPartyManager.partySource(_item, '9');
    expect(SiloWatchPartyManager.defaultAudioIndex(other), 1);
    // No pin, or a pin Moonfin doesn't list: the first file.
    expect(SiloWatchPartyManager.partySource(_item, null)?['Id'], '5');
    expect(SiloWatchPartyManager.partySource(_item, '404')?['Id'], '5');
  });

  test('the host\'s subtitles map onto each member\'s file', () {
    final source = {
      'MediaStreams': [
        {'Type': 'Subtitle', 'Index': 3, 'Language': 'eng'},
        {'Type': 'Subtitle', 'Index': 4, 'Language': 'spa'},
      ],
    };
    int? pick(Map<String, dynamic>? choice) =>
        SiloWatchPartyManager.subtitleIndexFor(choice, source);
    expect(pick(null), isNull);
    expect(pick({'off': true}), -1);
    expect(pick({'index': 3, 'language': 'eng'}), 3);
    // Another file of the title numbers its tracks differently.
    expect(pick({'index': 9, 'language': 'spa'}), 4);
    expect(pick({'index': 3, 'language': 'spa'}), 4);
    expect(pick({'index': 9, 'language': 'fre'}), isNull);
  });

  test('closes drift by a small rate, slower when ahead', () {
    // Ahead by half a second: 0.5/25 is 2 percent, slowed.
    expect(SiloWatchPartyManager.rateFor(0.5), closeTo(0.98, 1e-9));
    // Nearly closed (a nudge runs on to 0.1 s): the 1 percent floor.
    expect(SiloWatchPartyManager.rateFor(0.15), closeTo(0.99, 1e-9));
    // Behind by two seconds: 2/25 is past the 4 percent cap.
    expect(SiloWatchPartyManager.rateFor(-2), closeTo(1.04, 1e-9));
    // In between, half-percent steps: 0.6/25 = 2.4 percent rounds to 2.5.
    expect(SiloWatchPartyManager.rateFor(-0.6), closeTo(1.025, 1e-9));
  });

  test('the next episode follows season and episode order', () {
    Map<String, dynamic> ep(String id, int season, int number) => {
      'Id': id,
      'ParentIndexNumber': season,
      'IndexNumber': number,
    };
    final episodes = [
      ep('s2e1', 2, 1),
      ep('special', 0, 1),
      ep('s1e2', 1, 2),
      ep('s1e1', 1, 1),
    ];
    expect(SiloWatchPartyManager.nextEpisodeId(episodes, 's1e1'), 's1e2');
    expect(SiloWatchPartyManager.nextEpisodeId(episodes, 's1e2'), 's2e1');
    expect(SiloWatchPartyManager.nextEpisodeId(episodes, 's2e1'), isNull);
    expect(SiloWatchPartyManager.nextEpisodeId(episodes, 'special'), isNull);
  });

  test('follows the signed-in server, not the newest connection', () async {
    final getIt = GetIt.instance;
    addTearDown(getIt.reset);
    final factory = MediaServerClientFactory(
      deviceInfo: const DeviceInfo(
        id: 'device',
        name: 'Device',
        appName: 'Moonfin',
        appVersion: '1.0.0',
      ),
    );
    final silo = factory.getClient(
      serverId: 'silo',
      serverType: ServerType.silo,
      baseUrl: 'https://silo.example',
    );
    // Another account signed in later: the factory's newest client.
    final emby = factory.getClient(
      serverId: 'emby',
      serverType: ServerType.emby,
      baseUrl: 'https://emby.example',
    );
    getIt.registerSingleton<MediaServerClientFactory>(factory);
    getIt.registerSingleton<MediaServerClient>(silo);
    final manager = SiloWatchPartyManager(_NoPlayback());
    expect(manager.activeSiloClient, isNotNull);

    await getIt.unregister<MediaServerClient>();
    getIt.registerSingleton<MediaServerClient>(emby);
    expect(manager.activeSiloClient, isNull);
  });
}
