import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/app_beta.dart';

void main() {
  group('AppBeta.parseBetaNumber', () {
    test('returns null when the flag is off', () {
      expect(
        AppBeta.parseBetaNumber('''
moonfin:
  android_tv_version: 2.5.1
  beta: false
  beta_number: 3
'''),
        isNull,
      );
    });

    test('returns the beta number when the flag is on', () {
      expect(
        AppBeta.parseBetaNumber('''
moonfin:
  beta: true
  beta_number: 3
'''),
        3,
      );
    });

    test('defaults to 1 when only the flag is set', () {
      expect(AppBeta.parseBetaNumber('moonfin:\n  beta: true\n'), 1);
    });

    test('ignores beta keys outside the moonfin block', () {
      expect(
        AppBeta.parseBetaNumber('''
moonfin:
  beta: true
  beta_number: 2

flutter:
  beta: false
  beta_number: 9
'''),
        2,
      );
    });

    test('ignores comments', () {
      expect(
        AppBeta.parseBetaNumber('''
moonfin:
  # beta: true
  beta: true  # shipped as a beta
  beta_number: 4
'''),
        4,
      );
    });
  });

  group('AppBeta.label', () {
    tearDown(() => AppBeta.setForTesting(null));

    test('leaves the version alone on a non-beta build', () {
      expect(AppBeta.label('2.5.1'), '2.5.1');
    });

    test('appends the beta suffix on a beta build', () {
      AppBeta.setForTesting(3);
      expect(AppBeta.label('2.5.1'), '2.5.1 beta 3');
    });
  });
}
