import 'dart:convert';

import 'package:server_silo/server_silo.dart';

import '../../data/services/media_server_client_factory.dart';
import '../models/user.dart';
import '../store/authentication_store.dart';
import 'silo_token_storage.dart';

/// Keeps a Silo account's household profiles stored as Moonfin users.
///
/// A Silo login belongs to an account, and each of the account's profiles
/// (each with its own progress, favorites and limits) becomes one Moonfin
/// user, so the server's user grid, the account switcher and everything
/// Moonfin keeps per user work per household member. All of them share the
/// account's one token pair, stored once under (server, account)
/// ([SiloTokenStorage]), and a user carries only its profile.
class SiloHousehold {
  SiloHousehold(this._store);

  final AuthenticationStore _store;

  /// The time a profile that has never been used here is sorted by: oldest.
  static final neverUsed = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

  /// Stores every profile in [members] as a user of [accountId] on
  /// [serverId], and forgets stored profiles of that account Silo no longer
  /// lists (deleted on the web). Returns the users in Silo's order.
  ///
  /// A profile already stored keeps when it was last used, and its download
  /// permission (Silo decides that per profile, and it is read again when the
  /// profile is used). A new one is sorted last. [accessToken] is kept on
  /// each user for the code that checks a stored user has a token, but the
  /// session restores from the account's pair.
  Future<List<PrivateUser>> store({
    required String serverId,
    required String accountId,
    required List<SiloHouseholdMember> members,
    required String accessToken,
  }) async {
    final stored = {
      for (final user in _store.getUsers(serverId))
        if (user.siloAccountId == accountId) user.id: user,
    };
    final users = <PrivateUser>[];
    for (final member in members) {
      final existing = stored[member.profile.id];
      final policy = member.user.policy;
      final name = (member.user.name ?? '').trim();
      final user = PrivateUser(
        id: member.profile.id,
        name: name.isNotEmpty ? name : member.profile.name,
        serverId: serverId,
        accessToken: accessToken,
        lastUsed: existing?.lastUsed ?? neverUsed,
        imageTag: member.user.primaryImageTag,
        isAdministrator: policy?.isAdministrator ?? false,
        canDownload:
            existing?.canDownload ?? policy?.enableContentDownloading ?? false,
        canManageSubtitles: policy?.canFetchRemoteSubtitles ?? false,
        canManageCollections: policy?.enableCollectionManagement ?? false,
        siloAccountId: accountId,
        siloHasPin: member.profile.hasPin,
      );
      // Each save rewrites the whole store, and this runs at every start, so
      // a profile that hasn't changed isn't written again.
      if (existing == null ||
          jsonEncode(existing.toJson()) != jsonEncode(user.toJson())) {
        await _store.putUser(user);
      }
      users.add(user);
    }
    // After the new ones are in, so the account's tokens (which go with its
    // last stored user) stay.
    final listed = {for (final member in members) member.profile.id};
    for (final id in stored.keys) {
      if (!listed.contains(id)) await _store.removeUser(serverId, id);
    }
    return users;
  }

  /// The profile to read a Silo server as when it isn't the active one,
  /// since Home's and search's rows merge every signed-in server, one user
  /// each. Of [users] (a server's stored users), the most recently used
  /// profile that can act without asking for a PIN, or null when every one
  /// is locked. Profiles of one household are never merged: they are the same
  /// library with different watch state and limits.
  static PrivateUser? profileForOtherServer(
    List<PrivateUser> users,
    SiloTokenStorage storage,
  ) {
    final usable = [
      for (final user in users)
        if (!storage.needsPin(user)) user,
    ]..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));
    return usable.firstOrNull;
  }

  /// The stored profiles of [accountId] on [serverId].
  List<PrivateUser> users(String serverId, String accountId) => [
    for (final user in _store.getUsers(serverId))
      if (user.siloAccountId == accountId) user,
  ];
}

/// A stored Silo profile's avatar URL, or null when it has none or the
/// server's client hasn't read the household yet. Silo has no
/// `/Users/{id}/Images/Primary`. The URL came with the profile, and
/// only that server's client knows it.
String? siloProfileImageUrl(
  MediaServerClientFactory clients, {
  required String serverId,
  required String userId,
}) {
  final url = clients
      .getClientIfExists(serverId)
      ?.imageApi
      .getUserImageUrl(userId);
  return url == null || url.isEmpty ? null : url;
}
