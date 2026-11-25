// Entry redirect (portnook fork): stream and image URLs follow a client
// moved to a new address.
import 'package:dio/dio.dart';
import 'package:server_jellyfin/src/api/jellyfin_image_api.dart';
import 'package:server_jellyfin/src/api/jellyfin_playback_api.dart';
import 'package:test/test.dart';

void main() {
  test('stream URLs follow a changed base URL without a new instance', () {
    var base = 'http://old.example:8096';
    final api = JellyfinPlaybackApi(Dio(), base, baseUrlOf: () => base);

    final before = api.getStreamUrl(
      'item-1',
      mediaSourceId: 'src-1',
      audioStreamIndex: '2',
    );
    base = 'https://new.example:41763';
    final after = api.getStreamUrl(
      'item-1',
      mediaSourceId: 'src-1',
      audioStreamIndex: '2',
    );

    expect(before, startsWith('http://old.example:8096/Videos/item-1/stream?'));
    expect(
      after,
      'https://new.example:41763/Videos/item-1/stream?'
      'MediaSourceId=src-1&AudioStreamIndex=2&Static=true',
    );
  });

  test('without baseUrlOf the given base URL stays', () {
    final api = JellyfinPlaybackApi(Dio(), 'http://fixed.example:8096');
    expect(
      api.getStreamUrl('item-1'),
      startsWith('http://fixed.example:8096/Videos/item-1/stream?'),
    );
  });

  test('image URLs follow a changed base URL', () {
    var base = 'http://old.example:8096';
    final api = JellyfinImageApi(base, baseUrlOf: () => base);
    base = 'https://new.example:41763';
    expect(
      api.getPrimaryImageUrl('item-1'),
      startsWith('https://new.example:41763/Items/item-1/Images/Primary'),
    );
  });
}
