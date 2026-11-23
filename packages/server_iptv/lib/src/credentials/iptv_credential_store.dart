import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/xtream_models.dart';

class IptvCredentialStore {
  final FlutterSecureStorage _storage;

  IptvCredentialStore({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            mOptions: MacOsOptions(usesDataProtectionKeychain: false),
          );

  String _key(int playlistId, String field) =>
      'iptv_playlist_${playlistId}_$field';

  Future<void> saveXtreamCredentials({
    required int playlistId,
    required String serverUrl,
    required String username,
    required String password,
  }) async {
    await _storage.write(key: _key(playlistId, 'server_url'), value: serverUrl);
    await _storage.write(key: _key(playlistId, 'username'), value: username);
    await _storage.write(key: _key(playlistId, 'password'), value: password);
  }

  Future<XtreamCredentials?> getXtreamCredentials(int playlistId) async {
    final serverUrl = await _storage.read(key: _key(playlistId, 'server_url'));
    final username = await _storage.read(key: _key(playlistId, 'username'));
    final password = await _storage.read(key: _key(playlistId, 'password'));
    if (serverUrl == null || username == null || password == null) return null;
    return XtreamCredentials(
      serverUrl: serverUrl,
      username: username,
      password: password,
    );
  }

  Future<void> deleteCredentials(int playlistId) async {
    await _storage.delete(key: _key(playlistId, 'server_url'));
    await _storage.delete(key: _key(playlistId, 'username'));
    await _storage.delete(key: _key(playlistId, 'password'));
  }
}
