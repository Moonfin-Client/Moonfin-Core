import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/server.dart';
import '../models/user.dart';

class AuthenticationStore {
  static const _storeKey = 'authentication_store_json';
  static const _currentVersion = 2;

  final _logger = Logger();
  SharedPreferences? _prefs;
  Map<String, dynamic> _data = {'version': _currentVersion, 'servers': {}};

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    final raw = _prefs!.getString(_storeKey);
    if (raw != null && raw.trim().isNotEmpty) {
      try {
        _data = jsonDecode(raw) as Map<String, dynamic>;
        if (_data['version'] != _currentVersion) {
          _data = {'version': _currentVersion, 'servers': {}};
        }
      } catch (e) {
        _logger.e('Failed to load authentication store', error: e);
        _data = {'version': _currentVersion, 'servers': {}};
      }
    }
  }

  Future<void> _save() async {
    final prefs = _prefs;
    if (prefs == null) return;
    await prefs.setString(_storeKey, jsonEncode(_data));
  }

  Map<String, dynamic> get _servers {
    final servers = _data['servers'];
    if (servers is Map) return Map<String, dynamic>.from(servers);
    return {};
  }

  List<Server> getServers() {
    return _servers.entries.map((entry) {
      return Server.fromJson(
        entry.key,
        Map<String, dynamic>.from(entry.value as Map),
      );
    }).toList();
  }

  Server? getServer(String serverId) {
    final raw = _servers[serverId];
    if (raw == null) return null;
    final serverData = Map<String, dynamic>.from(raw as Map);
    return Server.fromJson(serverId, serverData);
  }

  Future<void> putServer(Server server) async {
    final servers = Map<String, dynamic>.from(_servers);
    final serverJson = Map<String, dynamic>.from(server.toJson());
    final existing = servers[server.id];
    if (existing is Map) {
      final existingMap = Map<String, dynamic>.from(existing);
      final existingUsers = existingMap['users'];
      if (existingUsers != null) {
        serverJson['users'] = existingUsers;
      }
      // Editing a server (name, address) must not sign its Silo accounts out.
      final existingSiloAccounts = existingMap[_siloAccountsKey];
      if (existingSiloAccounts != null) {
        serverJson[_siloAccountsKey] = existingSiloAccounts;
      }
    }
    servers[server.id] = serverJson;
    _data['servers'] = servers;
    await _save();
  }

  Future<void> removeServer(String serverId) async {
    final servers = Map<String, dynamic>.from(_servers);
    servers.remove(serverId);
    _data['servers'] = servers;
    await _save();
  }

  List<PrivateUser> getUsers(String serverId) {
    final raw = _servers[serverId];
    if (raw == null) return [];
    final serverData = Map<String, dynamic>.from(raw as Map);

    final usersRaw = serverData['users'];
    final users = usersRaw is Map ? Map<String, dynamic>.from(usersRaw) : <String, dynamic>{};
    return users.entries.map((entry) {
      return PrivateUser.fromJson(
        entry.key,
        serverId,
        Map<String, dynamic>.from(entry.value as Map),
      );
    }).toList();
  }

  PrivateUser? getUser(String serverId, String userId) {
    final raw = _servers[serverId];
    if (raw == null) return null;
    final serverData = Map<String, dynamic>.from(raw as Map);

    final usersRaw = serverData['users'];
    final users = usersRaw is Map ? Map<String, dynamic>.from(usersRaw) : <String, dynamic>{};
    final userRaw = users[userId];
    if (userRaw == null) return null;
    final userData = Map<String, dynamic>.from(userRaw as Map);

    return PrivateUser.fromJson(userId, serverId, userData);
  }

  Future<void> putUser(PrivateUser user) async {
    final servers = Map<String, dynamic>.from(_servers);
    final serverData =
        Map<String, dynamic>.from(servers[user.serverId] as Map? ?? {});
    final users =
        Map<String, dynamic>.from(serverData['users'] as Map? ?? {});

    users[user.id] = user.toJson();
    serverData['users'] = users;
    servers[user.serverId] = serverData;
    _data['servers'] = servers;
    await _save();
  }

  Future<void> removeUser(String serverId, String userId) async {
    final servers = Map<String, dynamic>.from(_servers);
    final serverData = servers[serverId] as Map<String, dynamic>?;
    if (serverData == null) return;

    final mutableServerData = Map<String, dynamic>.from(serverData);
    final users =
        Map<String, dynamic>.from(mutableServerData['users'] as Map? ?? {});
    final removed = users.remove(userId);
    mutableServerData['users'] = users;
    // A Silo account's tokens go with its last user on this server, so a
    // signed-out login leaves no refresh token behind.
    final accountId = removed is Map ? removed['siloAccountId'] : null;
    if (accountId is String &&
        !users.values.any((u) => u is Map && u['siloAccountId'] == accountId)) {
      final accounts = Map<String, dynamic>.from(
        mutableServerData[_siloAccountsKey] as Map? ?? {},
      );
      accounts.remove(accountId);
      mutableServerData[_siloAccountsKey] = accounts;
    }
    servers[serverId] = mutableServerData;
    _data['servers'] = servers;
    await _save();
  }

  // Silo accounts. A Silo login belongs to an account, and the Moonfin user is
  // one of its profiles. The account's token pair is stored once per
  // (server, account), so its profiles share it and a refresh replaces it in
  // one place. Stored like every other Moonfin access token, in this store's
  // shared preferences.

  static const _siloAccountsKey = 'siloAccounts';

  Map<String, dynamic> _siloAccounts(String serverId) {
    final raw = _servers[serverId];
    if (raw is! Map) return {};
    final accounts = Map<String, dynamic>.from(raw)[_siloAccountsKey];
    return accounts is Map ? Map<String, dynamic>.from(accounts) : {};
  }

  /// The stored token pair of a Silo account (the JSON from
  /// `SiloTokens.toJson`), or null when that account isn't signed in here.
  Map<String, dynamic>? getSiloTokens(String serverId, String accountId) {
    final record = _siloAccounts(serverId)[accountId];
    if (record is! Map) return null;
    final tokens = record['tokens'];
    return tokens is Map ? Map<String, dynamic>.from(tokens) : null;
  }

  /// The Silo accounts with stored tokens on [serverId].
  List<String> getSiloAccountIds(String serverId) =>
      _siloAccounts(serverId).keys.toList();

  /// Stores (or replaces) a Silo account's token pair.
  ///
  /// A refresh renews the same login, so the profiles' PIN proofs, which are
  /// bound to that login, are kept. A new login ([newLogin], at sign-in)
  /// drops them because Silo no longer accepts them.
  Future<void> putSiloTokens(
    String serverId,
    String accountId,
    Map<String, dynamic> tokens, {
    bool newLogin = false,
  }) async {
    final servers = Map<String, dynamic>.from(_servers);
    final serverData =
        Map<String, dynamic>.from(servers[serverId] as Map? ?? {});
    final accounts = Map<String, dynamic>.from(
      serverData[_siloAccountsKey] as Map? ?? {},
    );
    final previous = accounts[accountId];
    final proofs = newLogin || previous is! Map
        ? null
        : previous[_profileTokensKey];
    accounts[accountId] = {
      'tokens': tokens,
      if (proofs is Map && proofs.isNotEmpty) _profileTokensKey: proofs,
    };
    serverData[_siloAccountsKey] = accounts;
    servers[serverId] = serverData;
    _data['servers'] = servers;
    await _save();
  }

  static const _profileTokensKey = 'profileTokens';

  /// The stored PIN proof of a Silo profile (`{"token": …, "expiresAt": …}`),
  /// or null. It belongs to the account's current login.
  Map<String, dynamic>? getSiloProfileToken(
    String serverId,
    String accountId,
    String profileId,
  ) {
    final record = _siloAccounts(serverId)[accountId];
    if (record is! Map) return null;
    final proofs = record[_profileTokensKey];
    if (proofs is! Map) return null;
    final proof = proofs[profileId];
    return proof is Map ? Map<String, dynamic>.from(proof) : null;
  }

  /// Stores (or, with null, forgets) a Silo profile's PIN proof under its
  /// account. Does nothing when the account has no stored login.
  Future<void> putSiloProfileToken(
    String serverId,
    String accountId,
    String profileId,
    Map<String, dynamic>? proof,
  ) async {
    final servers = Map<String, dynamic>.from(_servers);
    final raw = servers[serverId];
    if (raw is! Map) return;
    final serverData = Map<String, dynamic>.from(raw);
    final accounts = Map<String, dynamic>.from(
      serverData[_siloAccountsKey] as Map? ?? {},
    );
    final record = accounts[accountId];
    if (record is! Map) return;
    final updated = Map<String, dynamic>.from(record);
    final proofs = Map<String, dynamic>.from(
      updated[_profileTokensKey] as Map? ?? {},
    );
    if (proof == null) {
      if (proofs.remove(profileId) == null) return;
    } else {
      proofs[profileId] = proof;
    }
    if (proofs.isEmpty) {
      updated.remove(_profileTokensKey);
    } else {
      updated[_profileTokensKey] = proofs;
    }
    accounts[accountId] = updated;
    serverData[_siloAccountsKey] = accounts;
    servers[serverId] = serverData;
    _data['servers'] = servers;
    await _save();
  }

  /// Forgets a Silo account's tokens (its users stay until removed).
  Future<void> removeSiloAccount(String serverId, String accountId) async {
    final servers = Map<String, dynamic>.from(_servers);
    final raw = servers[serverId];
    if (raw is! Map) return;
    final serverData = Map<String, dynamic>.from(raw);
    final accounts = Map<String, dynamic>.from(
      serverData[_siloAccountsKey] as Map? ?? {},
    );
    if (accounts.remove(accountId) == null) return;
    serverData[_siloAccountsKey] = accounts;
    servers[serverId] = serverData;
    _data['servers'] = servers;
    await _save();
  }
}
