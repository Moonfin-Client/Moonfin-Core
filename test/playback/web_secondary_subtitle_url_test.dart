import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/web_secondary_subtitle_url.dart';
import 'package:moonfin/playback/web_subtitle_text.dart';

void main() {
  test('only Jellyfin-style subtitle URLs request WebVTT', () {
    for (final (url, expected) in [
      ('https://jellyfin/Moonfin/Videos/item/source/Subtitles/3/0/Stream.srt?api_key=token',
       'https://jellyfin/Moonfin/Videos/item/source/Subtitles/3/0/Stream.vtt?api_key=token'),
      ('/emby/Videos/item/source/Subtitles/4/Stream.SRT?ApiKey=test',
       '/emby/Videos/item/source/Subtitles/4/Stream.vtt?ApiKey=test'),
      for (final url in ['https://subtitles/movie.en.srt?token=abc', 'https://host/Stream.srt',
        'https://host/Videos/item/source/Subtitles/3/0/Stream.vtt',
        'https://host/watch?next=/Videos/a/b/Subtitles/3/0/Stream.srt',
        'https://host/Videos/item/source/Subtitles/3/0/Stream.srt?format=srt']) (url, url),
    ]) {
      expect(preferServerWebVttSubtitleUrl(url), expected);
    }
  });
  test('cue normalization removes leading alignment tags and preserves dialogue markup', () {
    const markup = '<v Speaker><b>Hello</b> &amp; <u>goodbye</u>\nNext line';
    const literal = r'The tag {\an8} belongs to this sentence.';
    for (final (input, text) in [
      for (var alignment = 1; alignment <= 9; alignment++)
        ('  {\\an$alignment}<i>Translation</i>', '<i>Translation</i>'),
      (markup, markup), (literal, literal),
    ]) {
      expect(secondaryWebVttCueText(input), '<c.moonfin-secondary>$text</c>');
    }
  });
}
