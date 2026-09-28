import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moonfin/auth/store/credential_store_io.dart';
import 'package:moonfin/util/app_distribution.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

  test(
    'macOS writes and cleanup stay inside the app keychain service',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            calls.add(call);
            return null;
          });
      try {
        final store = CredentialStoreImpl();
        await store.saveToken('test-server', 'test-token');
        await store.clear();
        expect(calls.map((call) => call.method), ['write', 'deleteAll']);
        for (final call in calls) {
          final options = (call.arguments as Map)['options'] as Map;
          expect(
            options['accountName'],
            AppDistribution.isCustomBuild
                ? 'moonfin_books'
                : AppleOptions.defaultAccountName,
          );
          expect(options['usesDataProtectionKeychain'], 'false');
        }
      } finally {
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, null);
        debugDefaultTargetPlatformOverride = null;
      }
    },
  );
}
