import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/data/services/app_update_service.dart';

void main() {
  group('AppUpdateService.isStoreInstaller', () {
    test('recognizes the stores that redistribute the sideload APK', () {
      expect(AppUpdateService.isStoreInstaller('com.android.vending'), isTrue);
      expect(AppUpdateService.isStoreInstaller('com.amazon.venezia'), isTrue);
      expect(
        AppUpdateService.isStoreInstaller('com.sec.android.app.samsungapps'),
        isTrue,
      );
      expect(AppUpdateService.isStoreInstaller('org.fdroid.fdroid'), isTrue);
    });

    test('matches case-insensitively and ignores surrounding whitespace', () {
      expect(AppUpdateService.isStoreInstaller(' Com.Amazon.Venezia '), isTrue);
    });

    test('sideload installers do not count as stores', () {
      expect(AppUpdateService.isStoreInstaller(null), isFalse);
      expect(AppUpdateService.isStoreInstaller(''), isFalse);
      expect(
        AppUpdateService.isStoreInstaller('com.android.packageinstaller'),
        isFalse,
      );
      expect(
        AppUpdateService.isStoreInstaller(
          'com.google.android.packageinstaller',
        ),
        isFalse,
      );
      expect(AppUpdateService.isStoreInstaller('com.android.shell'), isFalse);
    });
  });
}
