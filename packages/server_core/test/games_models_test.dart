import 'dart:convert';

import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  group('GameDetail.fromJson', () {
    test('parses coreCompatibilityReason when present', () {
      final game = GameDetail.fromJson(const {
        'id': 'game',
        'title': 'BurgerTime',
        'system': 'MAME',
        'core': 'arcade',
        'fileName': 'btime2.zip',
        'sizeBytes': 1,
        'bios': [],
        'recommendedCore': 'arcade',
        'availableCores': ['arcade', 'mame'],
        'coreCompatibilityReason':
            'Validated against both installed FBNeo and MAME DATs; FBNeo is preferred.',
      });

      expect(
        game.coreCompatibilityReason,
        'Validated against both installed FBNeo and MAME DATs; FBNeo is preferred.',
      );
      expect(game.supportsCoreOverrides, isTrue);
    });

    test('non-arcade round-trip with no coreCompatibilityReason key yields null', () {
      final game = GameDetail.fromJson(const {
        'id': 'game2',
        'title': 'Some Console Game',
        'system': 'SNES',
        'core': 'snes9x',
        'fileName': 'game2.sfc',
        'sizeBytes': 2048,
        'bios': [],
      });

        expect(game.coreCompatibilityReason, isNull);
        expect(game.recommendedCore, isNull);
        expect(game.availableCores, isEmpty);
        expect(game.supportsCoreOverrides, isFalse);
        expect(game.supportsBackendOverrides, isFalse);
      },
    );

    test('an explicit empty core list still advertises override support', () {
      final game = GameDetail.fromJson(const {
        'id': 'game3',
        'title': 'Console Game',
        'system': 'SNES',
        'core': 'snes9x',
        'fileName': 'game3.sfc',
        'sizeBytes': 2048,
        'bios': [],
        'availableCores': [],
      });

      expect(game.availableCores, isEmpty);
      expect(game.supportsCoreOverrides, isTrue);
    });

    test('backend override support is independent of arcade core support', () {
      final game = GameDetail.fromJson(const {
        'id': 'game4',
        'title': 'Console Game',
        'system': 'NES',
        'core': 'nes',
        'fileName': 'game4.nes',
        'sizeBytes': 2048,
        'bios': [],
        'backendOverrideSupported': true,
      });

      expect(game.supportsCoreOverrides, isFalse);
      expect(game.supportsBackendOverrides, isTrue);
    });
  });

  test('RecentGame.fromJson reads the year, overview and box art shape', () {
    final game = RecentGame.fromJson({
      'id': 'g1',
      'title': 'Super Mario World',
      'system': 'SNES',
      'core': 'snes',
      'fileName': 'Super Mario World (USA).sfc',
      'year': 1990,
      'overview': 'Mario and Yoshi set out to save Dinosaur Land.',
      'boxart': {'state': 'thumbnailReady', 'url': '/a', 'width': 512, 'height': 357},
    });
    expect(game.year, 1990);
    expect(game.overview, 'Mario and Yoshi set out to save Dinosaur Land.');
    expect(game.boxart!.aspectRatio, closeTo(1.434, 0.001));

    final bare = RecentGame.fromJson({'id': 'g2'});
    expect(bare.year, isNull);
    expect(bare.overview, isNull);
    expect(bare.boxart, isNull);
  });

  group('sanitizeDownloadFileName', () {
    test('accepts an ordinary file name', () {
      expect(
        sanitizeDownloadFileName('Super Mario World.sfc'),
        'Super Mario World.sfc',
      );
    });

    for (final hostile in const [
      '../escape.bin',
      '..\\escape.bin',
      'a/b.bin',
      'a\\b.bin',
      '/etc/passwd',
      'C:\\windows\\system32\\drivers\\etc\\hosts',
      '..',
      '.',
      '',
    ]) {
      test('rejects ${jsonEncode(hostile)}', () {
        expect(
          () => sanitizeDownloadFileName(hostile),
          throwsA(isA<FormatException>()),
        );
      });
    }
  });
}
