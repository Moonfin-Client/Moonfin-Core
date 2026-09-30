import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

const _subtitleUrl =
    'https://jf.example/Videos/abc/abc/Subtitles/3/0/Stream.subrip?ApiKey=token';

void main() {
  group('MediaKitPlayerBackend subtitle load errors', () {
    test('matches the subtitle mpv failed to open', () {
      expect(
        MediaKitPlayerBackend.externalSubtitleInError(
          'Failed to open $_subtitleUrl.',
          [_subtitleUrl],
        ),
        _subtitleUrl,
      );
    });

    test('matches when mpv prints the URL decoded', () {
      const url =
          'https://jf.example/Subtitles/My%20Show/Stream.srt?ApiKey=token';
      expect(
        MediaKitPlayerBackend.externalSubtitleInError(
          'Can not open external file '
          'https://jf.example/Subtitles/My Show/Stream.srt?ApiKey=token.',
          [url],
        ),
        url,
      );
    });

    test('matches a local subtitle file', () {
      const path = '/storage/emulated/0/Movies/Moana.en.srt';
      expect(
        MediaKitPlayerBackend.externalSubtitleInError(
          "Cannot open file '$path': No such file or directory",
          [path],
        ),
        path,
      );
    });

    test('leaves an error about the video alone', () {
      expect(
        MediaKitPlayerBackend.externalSubtitleInError(
          'Failed to open https://jf.example/videos/abc/master.m3u8?ApiKey=token.',
          [_subtitleUrl],
        ),
        isNull,
      );
    });

    test('skips an empty subtitle URL', () {
      expect(
        MediaKitPlayerBackend.externalSubtitleInError('Failed to open .', ['']),
        isNull,
      );
    });

    test('a percent sign that is not a valid escape does not throw', () {
      expect(
        MediaKitPlayerBackend.externalSubtitleInError(
          'Failed to open /data/video.mkv.',
          ['/data/100%.srt', '/data/%FF.srt'],
        ),
        isNull,
      );
    });
  });
}
