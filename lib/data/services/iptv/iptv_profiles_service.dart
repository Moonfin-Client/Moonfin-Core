import 'dart:ui' show Color;

import 'package:get_it/get_it.dart';
import 'package:server_iptv/server_iptv.dart';
import 'package:uuid/uuid.dart';

import '../../../auth/models/user.dart';
import '../../../auth/repositories/server_repository.dart';
import '../../../auth/store/authentication_store.dart';
import '../../../l10n/current_app_localizations.dart';

/// Manages the local IPTV profiles (the "Who's watching" users) stored under
/// the single IPTV pseudo-server. Profiles are plain [PrivateUser]s carrying
/// a sentinel token, since there's no remote sign-in.
class IptvProfilesService {
  static const sentinelToken = 'iptv-local';
  static const _idPrefix = 'iptvp_';
  static const _avatarPrefix = 'avatar:';

  /// Profiles have no server image, so the image tag holds the index of
  /// their avatar color instead.
  static String avatarTag(int index) => '$_avatarPrefix$index';

  /// The avatar color index in [tag], or null when it isn't a profile tag.
  static int? avatarIndexFromTag(String? tag) {
    if (tag == null || !tag.startsWith(_avatarPrefix)) return null;
    return int.tryParse(tag.substring(_avatarPrefix.length)) ?? 0;
  }

  static const avatarColors = [
    Color(0xFF7E57C2),
    Color(0xFF1E88E5),
    Color(0xFF00897B),
    Color(0xFFF4511E),
    Color(0xFF6D4C41),
    Color(0xFFC2185B),
    Color(0xFF3949AB),
    Color(0xFF7CB342),
  ];

  /// The profile's chosen color, or null when [tag] isn't a profile tag.
  static Color? colorForTag(String? tag) {
    final index = avatarIndexFromTag(tag);
    return index == null ? null : avatarColors[index % avatarColors.length];
  }

  final AuthenticationStore _authStore;
  final ServerRepository _serverRepository;

  IptvProfilesService(this._authStore, this._serverRepository);

  List<PrivateUser> getProfiles() =>
      _authStore.getUsers(ServerRepository.iptvServerId);

  /// Creates the IPTV server (if missing) and a new profile under it.
  Future<PrivateUser> createProfile(String name, {int avatarIndex = 0}) async {
    await _serverRepository.addIptvServer();
    final profile = PrivateUser(
      id: '$_idPrefix${const Uuid().v4()}',
      name: name.trim().isEmpty
          ? currentAppLocalizations().iptvDefaultProfileName
          : name.trim(),
      serverId: ServerRepository.iptvServerId,
      accessToken: sentinelToken,
      lastUsed: DateTime.now(),
      imageTag: avatarTag(avatarIndex),
    );
    await _authStore.putUser(profile);
    return profile;
  }

  Future<void> updateProfile(
    String profileId, {
    required String name,
    required int avatarIndex,
  }) async {
    final profile = _find(profileId);
    if (profile == null || name.trim().isEmpty) return;
    await _authStore.putUser(
      profile.copyWith(name: name.trim(), imageTag: avatarTag(avatarIndex)),
    );
  }

  /// Removes the profile and everything it owns: favorites, watch history
  /// and its group allowlist.
  Future<void> deleteProfile(String profileId) async {
    await _authStore.removeUser(ServerRepository.iptvServerId, profileId);
    final db = GetIt.instance<IptvDatabase>();
    await WatchStateRepository(db).clearProfileData(profileId);
    await PersonalizationRepository(db).clearProfile(profileId);
  }

  PrivateUser? _find(String profileId) {
    final profiles = getProfiles();
    for (final p in profiles) {
      if (p.id == profileId) return p;
    }
    return null;
  }
}
