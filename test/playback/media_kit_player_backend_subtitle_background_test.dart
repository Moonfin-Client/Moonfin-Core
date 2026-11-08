import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/playback/media_kit_player_backend.dart';

void main() {
  test('nontransparent background selects a padded box', () {
    expect(MediaKitPlayerBackend.subtitleBackgroundMpvProperties(0xBF102030), {
      'sub-back-color': '#bf102030',
      'sub-border-style': 'background-box',
      'sub-shadow-offset': '4',
      'sub-blur': '0',
    });
  });

  test('transparent background clears the previous box and padding', () {
    expect(MediaKitPlayerBackend.subtitleBackgroundMpvProperties(0x00102030), {
      'sub-back-color': '#00102030',
      'sub-border-style': 'outline-and-shadow',
      'sub-shadow-offset': '0',
      'sub-blur': '0',
    });
  });

  test('low opacity still selects the box', () {
    final properties = MediaKitPlayerBackend.subtitleBackgroundMpvProperties(
      0x01000000,
    );
    expect(properties['sub-border-style'], 'background-box');
    expect(properties['sub-back-color'], '#01000000');
  });

  test('a shadow takes the back color while there is no box', () {
    expect(
      MediaKitPlayerBackend.subtitleBackgroundMpvProperties(
        0x00000000,
        shadowColor: 0xCC000000,
        shadowOffset: 2.24,
        shadowBlur: 1,
      ),
      {
        'sub-back-color': '#cc000000',
        'sub-border-style': 'outline-and-shadow',
        'sub-shadow-offset': '2.2',
        'sub-blur': '1.0',
      },
    );
  });

  test('a box takes the place of the shadow', () {
    final properties = MediaKitPlayerBackend.subtitleBackgroundMpvProperties(
      0xBF102030,
      shadowColor: 0xCC000000,
      shadowOffset: 3,
      shadowBlur: 1,
    );
    expect(properties['sub-back-color'], '#bf102030');
    expect(properties['sub-shadow-offset'], '4');
    expect(properties['sub-blur'], '0');
  });
}
