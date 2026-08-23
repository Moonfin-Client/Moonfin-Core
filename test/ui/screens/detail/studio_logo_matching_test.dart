import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/detail/modern/modern_detail_content.dart';

String? logoFor(String studio, Map<String, String?> companies) {
  final index = studioLogoIndex([
    for (final e in companies.entries) (name: e.key, imageUrl: e.value),
  ]);
  return studioLogoUrlFor(studio, index);
}

void main() {
  test('an exact name wins', () {
    expect(logoFor('HBO', {'HBO': 'hbo.png'}), 'hbo.png');
  });

  test('punctuation and spacing differences still match', () {
    expect(logoFor('Apple TV', {'Apple TV+': 'apple.png'}), 'apple.png');
    expect(logoFor('StudioCanal', {'Studio Canal': 'canal.png'}), 'canal.png');
  });

  test('a shared start matches when nothing is exact', () {
    expect(logoFor('AMC', {'AMC Networks': 'amc.png'}), 'amc.png');
    expect(logoFor('HBO', {'HBO Max': 'max.png'}), 'max.png');
  });

  test('a name shared only in the middle or end does not match', () {
    expect(logoFor('Netflix', {'X': 'x.png'}), isNull);
    expect(logoFor('Bandai Namco Filmworks', {'AMC': 'amc.png'}), isNull);
    expect(logoFor('CBBC', {'BBC': 'bbc.png'}), isNull);
    expect(logoFor('Reel FX Animation Studios', {'FX': 'fx.png'}), isNull);
  });

  test('the closest name wins rather than the first listed', () {
    expect(
      logoFor('Paramount Pictures', {
        'Paramount+': 'plus.png',
        'Paramount Pictures International': 'intl.png',
      }),
      'intl.png',
    );
  });

  test('an exact match beats a longer name that shares its start', () {
    expect(
      logoFor('BBC', {'BBC Studios': 'studios.png', 'BBC': 'bbc.png'}),
      'bbc.png',
    );
  });

  test('a company with no logo is skipped', () {
    expect(logoFor('HBO', {'HBO': null}), isNull);
  });

  test('a studio with no usable name gets nothing', () {
    expect(logoFor('...', {'BBC': 'bbc.png'}), isNull);
  });
}
