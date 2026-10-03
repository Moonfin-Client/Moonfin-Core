import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/models/aggregated_item.dart';
import 'package:moonfin/data/services/media_server_client_factory.dart';
import 'package:moonfin/util/audio_artwork_url.dart';
import 'package:server_core/server_core.dart';

MediaServerClientFactory _factory() {
  final factory = MediaServerClientFactory(
    deviceInfo: const DeviceInfo(
      id: 'device',
      name: 'Device',
      appName: 'Moonfin',
      appVersion: '1.0.0',
    ),
  );
  factory.getClient(
    serverId: 'server',
    serverType: ServerType.jellyfin,
    baseUrl: 'http://example.test',
  );
  return factory;
}

AggregatedItem _item(Map<String, dynamic> raw) => AggregatedItem(
      id: raw['Id'] as String,
      serverId: 'server',
      rawData: raw,
    );

void main() {
  // Every surface that draws the current track reads this.
  test('a music track shows its album cover, not its own picture', () {
    final url = audioArtUrl(
      _item({
        'Id': 'track-1',
        'Type': 'Audio',
        'AlbumId': 'album-1',
        'AlbumPrimaryImageTag': 'albumtag',
        'ImageTags': {'Primary': 'tracktag'},
      }),
      clientFactory: _factory(),
      maxHeight: 120,
    );

    expect(url, isNotNull);
    expect(url, contains('album-1'));
    expect(url, isNot(contains('track-1')));
    expect(url, contains('120'));
  });

  test('a track with no album art falls back to its own picture', () {
    final url = audioArtUrl(
      _item({
        'Id': 'track-2',
        'Type': 'Audio',
        'ImageTags': {'Primary': 'tracktag'},
      }),
      clientFactory: _factory(),
      maxHeight: 300,
    );

    expect(url, contains('track-2'));
    expect(url, contains('300'));
  });

  // Only music shows the album cover, even when other items carry an album id.
  test('a non-audio item shows its own picture', () {
    final url = audioArtUrl(
      _item({
        'Id': 'episode-1',
        'Type': 'Episode',
        'AlbumId': 'album-1',
        'AlbumPrimaryImageTag': 'albumtag',
        'ImageTags': {'Primary': 'episodetag'},
      }),
      clientFactory: _factory(),
      maxHeight: 600,
    );

    expect(url, contains('episode-1'));
    expect(url, isNot(contains('album-1')));
  });

  test('an item carrying no artwork at all answers null', () {
    final url = audioArtUrl(
      _item({'Id': 'track-3', 'Type': 'Audio'}),
      clientFactory: _factory(),
      maxHeight: 120,
    );

    expect(url, isNull);
  });

  test('each surface gets the size it asked for', () {
    final factory = _factory();
    final item = _item({
      'Id': 'track-4',
      'Type': 'Audio',
      'ImageTags': {'Primary': 'tracktag'},
    });

    expect(audioArtUrl(item, clientFactory: factory, maxHeight: 120),
        contains('120'));
    expect(audioArtUrl(item, clientFactory: factory, maxHeight: 600),
        contains('600'));
  });
}
