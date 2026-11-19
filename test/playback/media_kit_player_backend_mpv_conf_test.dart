import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

void main() {
  test('quotes around a value are dropped, as mpv does', () {
    expect(
      MediaKitPlayerBackend.parseMpvConf(
        'tone-mapping="bt.2390"\n'
        "glsl-shaders='~~/shaders/a.glsl' # comment\n"
        'target-trc=pq\n',
      ),
      [
        ('tone-mapping', 'bt.2390'),
        ('glsl-shaders', '~~/shaders/a.glsl'),
        ('target-trc', 'pq'),
      ],
    );
  });

  test('keys under a profile section are skipped until [default]', () {
    expect(
      MediaKitPlayerBackend.parseMpvConf(
        'deband=yes\n'
        '[hdr]\n'
        'profile-cond=p["video-params/gamma"]=="pq"\n'
        'tone-mapping=bt.2390\n'
        '[default] # back to the top level\n'
        'dither=yes\n',
      ),
      [('deband', 'yes'), ('dither', 'yes')],
    );
  });

  test('a # inside a profile name does not end the header', () {
    expect(
      MediaKitPlayerBackend.parseMpvConf('[HDR # TV]\ndeband=yes\n'),
      isEmpty,
    );
  });

  test('an empty profile name [] is the top level', () {
    expect(
      MediaKitPlayerBackend.parseMpvConf(
        '[hdr]\ndeband=yes\n[]\nscale=spline36\n',
      ),
      [('scale', 'spline36')],
    );
  });

  test('a Windows shader list keeps every path after a semicolon', () {
    expect(
      MediaKitPlayerBackend.parseMpvConf(
        r'glsl-shaders=C:\shaders\a.glsl;C:\shaders\b.glsl' '\n',
      ),
      [('glsl-shaders', r'C:\shaders\a.glsl;C:\shaders\b.glsl')],
    );
  });
}
