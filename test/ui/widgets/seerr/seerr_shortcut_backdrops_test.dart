import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/widgets/seerr/seerr_shortcuts.dart';

void main() {
  test('movies and series take a still of their own kind', () {
    final picked = pickShortcutBackdrops(
      shortcuts: SeerrShortcut.values,
      movieBackdrops: const ['/m1.jpg', '/m2.jpg', '/m3.jpg'],
      tvBackdrops: const ['/t1.jpg', '/t2.jpg', '/t3.jpg'],
    );

    expect(picked[SeerrShortcut.movies], startsWith('/m'));
    expect(picked[SeerrShortcut.series], startsWith('/t'));
  });

  test('no still is used twice', () {
    final picked = pickShortcutBackdrops(
      shortcuts: SeerrShortcut.values,
      movieBackdrops: const ['/m1.jpg', '/m2.jpg', '/m3.jpg'],
      tvBackdrops: const ['/t1.jpg', '/t2.jpg', '/t3.jpg'],
    );

    expect(picked.length, SeerrShortcut.values.length);
    expect(picked.values.toSet().length, picked.length);
  });

  test('movies and series claim art before the plain tiles do', () {
    final picked = pickShortcutBackdrops(
      shortcuts: SeerrShortcut.values,
      movieBackdrops: const ['/m1.jpg'],
      tvBackdrops: const ['/t1.jpg'],
    );

    expect(picked[SeerrShortcut.movies], '/m1.jpg');
    expect(picked[SeerrShortcut.series], '/t1.jpg');
  });

  test('a tile falls back to the other kind when its own runs out', () {
    final picked = pickShortcutBackdrops(
      shortcuts: const [SeerrShortcut.movies, SeerrShortcut.series],
      movieBackdrops: const ['/m1.jpg'],
      tvBackdrops: const [],
    );

    expect(picked[SeerrShortcut.movies], '/m1.jpg');
    expect(picked[SeerrShortcut.series], isNull);
  });

  test('no artwork leaves every tile on its plain background', () {
    final picked = pickShortcutBackdrops(
      shortcuts: SeerrShortcut.values,
      movieBackdrops: const [],
      tvBackdrops: const [],
    );

    expect(picked, isEmpty);
  });
}
