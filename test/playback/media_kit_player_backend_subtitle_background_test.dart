import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

void main() {
  test('nontransparent background selects a padded box', () {
    expect(MediaKitPlayerBackend.subtitleBackgroundMpvProperties(0xBF102030), {
      'sub-back-color': '#bf102030',
      'sub-border-style': 'background-box',
      'sub-shadow-offset': '4',
    });
  });

  test('transparent background clears the previous box and padding', () {
    expect(MediaKitPlayerBackend.subtitleBackgroundMpvProperties(0x00102030), {
      'sub-back-color': '#00102030',
      'sub-border-style': 'outline-and-shadow',
      'sub-shadow-offset': '0',
    });
  });

  test('low opacity still selects the box', () {
    final properties = MediaKitPlayerBackend.subtitleBackgroundMpvProperties(
      0x01000000,
    );
    expect(properties['sub-border-style'], 'background-box');
    expect(properties['sub-back-color'], '#01000000');
  });
}
