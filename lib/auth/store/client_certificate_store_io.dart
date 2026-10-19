import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'client_certificate_store_base.dart';

class ClientCertificateStoreImpl implements ClientCertificateStore {
  // macOS's data protection keychain refuses writes from an app signed
  // without a keychain access group, so this keeps to the file based one.
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    mOptions: MacOsOptions(usesDataProtectionKeychain: false),
  );
  bool _unavailable = false;

  // The file based keychain rejects readAll (a match-all query that returns
  // data fails with errSecParam), so the hosts are also listed under their
  // own key and getAll falls back to reading them one by one. The key sits
  // outside keyPrefix, so getAll never takes it for a certificate.
  static const _hostsKey = 'mtls_client_cert_hosts';

  @override
  bool consumeSecureStorageUnavailable() {
    final value = _unavailable;
    _unavailable = false;
    return value;
  }

  String _key(String host) => '${ClientCertificateStore.keyPrefix}$host';

  // Saves and removals update the index by read-modify-write, so they run one
  // at a time or one could drop a host another just added.
  static Future<void> _pending = Future.value();

  Future<void> _serialized(Future<void> Function() action) {
    final result = _pending.then((_) => action());
    _pending = result.catchError((Object _) {});
    return result;
  }

  Future<List<String>> _readHosts() async {
    final raw = await _storage.read(key: _hostsKey);
    if (raw == null) return [];
    final decoded = jsonDecode(raw);
    return decoded is List ? [for (final host in decoded) '$host'] : [];
  }

  Future<void> _writeHosts(Set<String> hosts) =>
      _storage.write(key: _hostsKey, value: jsonEncode(hosts.toList()));

  @override
  Future<void> save(StoredClientCertificate certificate) async {
    try {
      // The index is written first: a host listed without a certificate is
      // skipped by getAll, a certificate missing from the index is lost.
      await _serialized(() async {
        await _writeHosts({...await _readHosts(), certificate.host});
        await _storage.write(
          key: _key(certificate.host),
          value: jsonEncode(certificate.toJson()),
        );
      });
    } on Exception {
      _unavailable = true;
    }
  }

  @override
  Future<StoredClientCertificate?> get(String host) async {
    try {
      final raw = await _storage.read(key: _key(host));
      if (raw == null) return null;
      return StoredClientCertificate.fromJson(
        host,
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } on Exception {
      return null;
    }
  }

  @override
  Future<List<StoredClientCertificate>> getAll() async {
    try {
      final all = await _storage.readAll();
      return [
        for (final entry in all.entries)
          if (entry.key.startsWith(ClientCertificateStore.keyPrefix))
            StoredClientCertificate.fromJson(
              entry.key.substring(ClientCertificateStore.keyPrefix.length),
              jsonDecode(entry.value) as Map<String, dynamic>,
            ),
      ];
    } on Exception {
      return _getAllFromIndex();
    }
  }

  Future<List<StoredClientCertificate>> _getAllFromIndex() async {
    try {
      return [for (final host in await _readHosts()) ?await get(host)];
    } on Exception {
      return const [];
    }
  }

  @override
  Future<void> remove(String host) async {
    try {
      await _serialized(() async {
        await _storage.delete(key: _key(host));
        await _writeHosts({...await _readHosts()}..remove(host));
      });
    } on Exception {
      _unavailable = true;
    }
  }
}

ClientCertificateStore createClientCertificateStore() =>
    ClientCertificateStoreImpl();
