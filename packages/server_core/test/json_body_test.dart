import 'package:server_core/server_core.dart';
import 'package:test/test.dart';

void main() {
  test('passes JSON maps through', () {
    expect(asJsonMap({'a': 1}), {'a': 1});
    expect(asJsonMap(<dynamic, dynamic>{1: 'x'}), {'1': 'x'});
  });

  test('decodes JSON sent as text', () {
    expect(asJsonMap('{"server_version":"4b2e921c"}'), {
      'server_version': '4b2e921c',
    });
  });

  test('is null for anything that is not a JSON object', () {
    expect(asJsonMap(null), isNull);
    expect(asJsonMap(''), isNull);
    expect(asJsonMap('<html></html>'), isNull);
    expect(asJsonMap('[1,2]'), isNull);
    expect(asJsonMap([1, 2]), isNull);
    expect(asJsonMap(42), isNull);
  });
}
