import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/seasonal_country.dart';

void main() {
  test('automatic sends the device country when it is a two letter code', () {
    expect(seasonalCountryParam('auto', deviceCountry: 'us'), 'US');
    expect(seasonalCountryParam('auto', deviceCountry: 'CA'), 'CA');
    expect(seasonalCountryParam('auto', deviceCountry: 'OT'), 'OT');
  });

  test('automatic sends nothing when the device has no usable country', () {
    expect(seasonalCountryParam('auto', deviceCountry: null), isNull);
    expect(seasonalCountryParam('auto', deviceCountry: ''), isNull);
    expect(seasonalCountryParam('auto', deviceCountry: '419'), isNull);
  });

  test('other sends the code Moonbase reads as no country', () {
    expect(seasonalCountryParam('other', deviceCountry: 'US'), 'ZZ');
  });

  test('a chosen country is sent upper cased whatever the device says', () {
    expect(seasonalCountryParam('ca', deviceCountry: 'US'), 'CA');
    expect(seasonalCountryParam(' US ', deviceCountry: null), 'US');
  });

  test('an unknown setting sends nothing', () {
    expect(seasonalCountryParam('everywhere', deviceCountry: 'US'), isNull);
  });
}
