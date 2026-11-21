import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/os_version_io.dart';

void main() {
  test(
    'parseOsRelease reads quoted and unquoted values and skips comments',
    () {
      final release = parseOsRelease([
        '# comment',
        'NAME="Fedora Linux"',
        "PRETTY_NAME='Fedora Linux 45 (Workstation Edition)'",
        'ID=fedora',
        '',
        'HOME_URL="https://fedoraproject.org/?a=b"',
        'BROKEN="no closing quote',
      ]);

      expect(release, {
        'NAME': 'Fedora Linux',
        'PRETTY_NAME': 'Fedora Linux 45 (Workstation Edition)',
        'ID': 'fedora',
        'HOME_URL': 'https://fedoraproject.org/?a=b',
        'BROKEN': '"no closing quote',
      });
    },
  );
}
