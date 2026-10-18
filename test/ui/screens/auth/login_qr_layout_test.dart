import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/ui/screens/auth/login_screen.dart';

void main() {
  group('quickConnectQrBeside', () {
    test('is beside the code on a TV', () {
      expect(
        quickConnectQrBeside(isTV: true, screen: const Size(1920, 1080)),
        isTrue,
      );
    });

    test('is beside the code on a tablet in landscape', () {
      expect(
        quickConnectQrBeside(isTV: false, screen: const Size(1280, 800)),
        isTrue,
      );
    });

    test('is below the code on a tablet in portrait', () {
      expect(
        quickConnectQrBeside(isTV: false, screen: const Size(800, 1280)),
        isFalse,
      );
    });

    test('is below the code on a phone in either orientation', () {
      expect(
        quickConnectQrBeside(isTV: false, screen: const Size(412, 915)),
        isFalse,
      );
      expect(
        quickConnectQrBeside(isTV: false, screen: const Size(915, 412)),
        isFalse,
      );
    });
  });
}
