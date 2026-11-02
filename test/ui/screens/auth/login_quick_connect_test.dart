import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/auth/login_screen.dart';

void main() {
  group('formatQuickConnectCode', () {
    test("Jellyfin's six digits read 3+3", () {
      expect(formatQuickConnectCode('123456'), '123 456');
    });

    test("Silo's eight digits read 4+4, with or without its dash", () {
      expect(formatQuickConnectCode('48217730'), '4821 7730');
      expect(formatQuickConnectCode('4821-7730'), '4821 7730');
    });

    test('anything else is shown as sent', () {
      expect(formatQuickConnectCode('ABC12'), 'ABC12');
    });
  });

  test('quickConnectDisplayUri drops the scheme and a trailing slash', () {
    expect(
      quickConnectDisplayUri('https://silo.example/activate'),
      'silo.example/activate',
    );
    expect(
      quickConnectDisplayUri('http://192.168.1.5:8080/silo/activate/'),
      '192.168.1.5:8080/silo/activate',
    );
  });
}
