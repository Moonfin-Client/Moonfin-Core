import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/aether_backend.dart';
import 'package:moonfin/playback/delay_limits.dart';
import 'package:moonfin/playback/media3_player_backend.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

class _Media3 extends Fake implements Media3PlayerBackend {}

class _MediaKit extends Fake implements MediaKitPlayerBackend {}

class _Aether extends Fake implements AetherBackend {}

void main() {
  test('Media3 subtitles can go five seconds either way', () {
    expect(delayLimitsFor(_Media3(), audio: false), (-5.0, 5.0));
    expect(delayLimitsFor(_Media3(), audio: true), (-2.0, 2.0));
  });

  test('MediaKit takes anything', () {
    expect(delayLimitsFor(_MediaKit(), audio: false), (null, null));
    expect(delayLimitsFor(_MediaKit(), audio: true), (null, null));
  });

  test('Aether shifts subtitles only', () {
    expect(delayLimitsFor(_Aether(), audio: false), (null, null));
    expect(delayLimitsFor(_Aether(), audio: true), isNull);
  });

  test('no backend means no delay', () {
    expect(delayLimitsFor(null, audio: false), isNull);
    expect(delayLimitsFor(null, audio: true), isNull);
  });
}
