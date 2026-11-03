import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

void main() {
  const url = 'https://silo.example/api/v2/playback/transcode/s/master.m3u8';

  test('the stream\'s headers go to mpv with the file', () {
    final media = MediaKitPlayerBackend.mediaForPayload(url, {
      'url': url,
      'headers': {'Authorization': 'Bearer a', 'X-Profile-Id': 'p1'},
    });
    expect(media.uri, url);
    expect(media.httpHeaders, {
      'Authorization': 'Bearer a',
      'X-Profile-Id': 'p1',
    });
  });

  test('a file without headers opens without any', () {
    const other = 'https://cdn.example/trailer.mp4';
    expect(
      MediaKitPlayerBackend.mediaForPayload(other, {'url': other}).httpHeaders,
      isNull,
    );
    expect(
      MediaKitPlayerBackend.mediaForPayload(other, {
        'url': other,
        'headers': <String, String>{},
      }).httpHeaders,
      isNull,
    );
  });
}
