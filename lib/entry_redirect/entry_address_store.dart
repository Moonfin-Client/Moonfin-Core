// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// Remembers, per saved server, the address the user entered when it
// redirected to another host or port, and the server `Id` that answered
// then. Kept apart from the server records so the upstream model stays as
// it is.
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// The entered address of a server added through a redirect.
class EntryAddress {
  const EntryAddress({required this.address, required this.serverId});

  /// The address the user entered; it redirects to where the server is now.
  final String address;

  /// The server's own `Id` as it answered when [address] was saved, so a
  /// redirect that later leads to a different server isn't followed.
  final String serverId;

  Map<String, dynamic> toJson() => {'address': address, 'serverId': serverId};

  static EntryAddress? fromJson(Object? json) {
    if (json is! Map) return null;
    final address = json['address'];
    final serverId = json['serverId'];
    if (address is! String || serverId is! String) return null;
    return EntryAddress(address: address, serverId: serverId);
  }
}

class EntryAddressStore {
  /// Kept in memory only, for tests.
  EntryAddressStore.memory() : _persist = false;

  EntryAddressStore() : _persist = true;

  static const _key = 'entry_redirect_addresses_json';

  /// Where builds before this store kept the entry address: inside each
  /// server record of the authentication store.
  static const _legacyKey = 'authentication_store_json';

  final bool _persist;
  final _byServer = <String, EntryAddress>{};

  Future<void> init() async {
    if (!_persist) return;
    final prefs = await SharedPreferences.getInstance();
    try {
      final raw = prefs.getString(_key);
      if (raw != null) {
        final data = jsonDecode(raw);
        if (data is Map) {
          for (final MapEntry(:key, :value) in data.entries) {
            final entry = EntryAddress.fromJson(value);
            if (entry != null) _byServer[key.toString()] = entry;
          }
        }
        return;
      }
      _byServer.addAll(_legacy(prefs.getString(_legacyKey)));
      if (_byServer.isNotEmpty) await _save();
    } catch (_) {
      // A broken record only loses the entry addresses, not the servers.
    }
  }

  static Map<String, EntryAddress> _legacy(String? raw) {
    final out = <String, EntryAddress>{};
    if (raw == null) return out;
    final data = jsonDecode(raw);
    final servers = data is Map ? data['servers'] : null;
    if (servers is! Map) return out;
    for (final MapEntry(:key, :value) in servers.entries) {
      if (value is! Map) continue;
      final address = value['entryAddress'];
      final serverId = value['entryServerId'];
      if (address is String && serverId is String) {
        out[key.toString()] = EntryAddress(
          address: address,
          serverId: serverId,
        );
      }
    }
    return out;
  }

  EntryAddress? of(String serverId) => _byServer[serverId];

  /// Saves [entry] for [serverId], or forgets it when null.
  Future<void> put(String serverId, EntryAddress? entry) async {
    if (entry == null) {
      if (_byServer.remove(serverId) == null) return;
    } else {
      _byServer[serverId] = entry;
    }
    await _save();
  }

  Future<void> _save() async {
    if (!_persist) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode({
        for (final MapEntry(:key, :value) in _byServer.entries)
          key: value.toJson(),
      }),
    );
  }
}
