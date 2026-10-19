import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/auth/store/client_certificate_store_base.dart';
import 'package:moonfin/auth/store/client_certificate_store_io.dart';

/// Like macOS's file based keychain: single reads and writes work, readAll
/// fails with errSecParam as soon as an item exists.
class _MacKeychainPlatform extends TestFlutterSecureStoragePlatform {
  _MacKeychainPlatform(super.data);

  @override
  Future<Map<String, String>> readAll({
    required Map<String, String> options,
  }) async {
    throw PlatformException(code: '-50', message: 'errSecParam');
  }
}

StoredClientCertificate _cert(String host) => StoredClientCertificate(
  host: host,
  chainPem: 'chain-$host',
  keyPem: 'key-$host',
  subject: 'CN=$host',
  notAfter: DateTime.utc(2027, 4, 17),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getAll falls back to the host index when readAll fails', () async {
    FlutterSecureStoragePlatform.instance = _MacKeychainPlatform({});
    final store = ClientCertificateStoreImpl();

    await store.save(_cert('a.example.com'));
    await store.save(_cert('b.example.com'));
    await store.save(_cert('a.example.com'));
    expect(store.consumeSecureStorageUnavailable(), isFalse);

    var all = await store.getAll();
    expect(
      all.map((c) => c.host),
      unorderedEquals(['a.example.com', 'b.example.com']),
    );
    expect(
      all.firstWhere((c) => c.host == 'b.example.com').keyPem,
      'key-b.example.com',
    );

    await store.remove('a.example.com');
    all = await store.getAll();
    expect(all.map((c) => c.host), ['b.example.com']);
  });

  test('readAll results ignore the host index', () async {
    FlutterSecureStorage.setMockInitialValues({});
    final store = ClientCertificateStoreImpl();

    await store.save(_cert('a.example.com'));
    final all = await store.getAll();
    expect(all.map((c) => c.host), ['a.example.com']);
  });
}
