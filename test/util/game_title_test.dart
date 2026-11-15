import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/game_library.dart';

void main() {
  test('a name copied through a Mac or Samba share reads as typed', () {
    expect(
      gameDisplayTitle('Super Mario Bros\uF029', 'Super Mario Bros. (World).nes'),
      'Super Mario Bros.',
    );
    expect(gameDisplayTitle('Zelda\uF022 A Link', 'z.sfc'), 'Zelda: A Link');
  });

  test('the headline drops trailing No-Intro tags only', () {
    expect(
      gameHeadlineTitle('Sonic The Hedgehog 2 (World) (Rev B)', 's.md'),
      'Sonic The Hedgehog 2',
    );
    expect(
      gameHeadlineTitle('Pokemon - Emerald Version (USA, Europe)', 'p.gba'),
      'Pokemon - Emerald Version',
    );
    expect(gameHeadlineTitle('(USA)', 'Tetris (World).gb'), '(USA)');
  });
}
