/// Translates Silo accounts and profiles into Jellyfin `UserDto` maps, so
/// Moonfin's user models read them unchanged.
library;

/// Key on a translated user carrying the owning Silo account's id.
///
/// Moonfin's user is a profile of the account, and this ties it back to the
/// account that owns the login. (Right after sign-in, before a profile is
/// chosen, the user is the account itself. See [siloAccountToUserDto].)
const siloAccountIdKey = 'SiloAccountId';

/// Key on a translated user carrying the untranslated Silo `Account`.
const siloAccountKey = 'SiloAccount';

/// A Jellyfin `UserDto` for a Silo `Account`, before a profile is chosen.
///
/// Silo has no per-user policy object. Its account carries a server-wide
/// `role` (`admin` or `user`) and `download_allowed`. The rest of Jellyfin's
/// policy flags are left out and read as their defaults.
Map<String, dynamic> siloAccountToUserDto(Map<String, dynamic> account) {
  final id = account['id']?.toString();
  return {
    'Id': id,
    'Name': account['username'] as String? ?? '',
    'HasPassword': true,
    'HasConfiguredPassword': true,
    siloAccountIdKey: id,
    siloAccountKey: account,
    'Policy': {
      'IsAdministrator': account['role'] == 'admin',
      'EnableContentDownloading': account['download_allowed'] == true,
      // Personal collections are open to every Silo account.
      'EnableCollectionManagement': true,
    },
  };
}

/// Key on a translated user carrying the untranslated Silo profile.
const siloProfileKey = 'SiloProfile';

/// A Jellyfin `UserDto` for a Silo [profile] of [account]: the Moonfin user.
///
/// The id is the profile's, so each profile can be its own Moonfin user.
///
/// Silo has no per-user policy object. What Moonfin reads is derived:
/// - `IsAdministrator`: an `admin` account acting as its **primary** profile.
///   Silo withholds administrator routes from secondary profiles.
/// - `EnableContentDownloading`: the account's `download_allowed`.
/// - `EnableCollectionManagement`, `EnableSubtitleDownloading`: true. Personal
///   collections and subtitle search are open to every profile on Silo.
/// - `EnableAllFolders`: always true. Silo enforces a profile's library
///   restrictions itself, and its library ids aren't Moonfin's view ids, so
///   passing them on could hide libraries the profile may see.
/// - `EnableLiveTvAccess`: false, Silo has no Live TV.
Map<String, dynamic> siloProfileToUserDto({
  required Map<String, dynamic> profile,
  required Map<String, dynamic> account,
}) {
  final name = (profile['name'] as String?)?.trim();
  final accountId = account['id']?.toString();
  return {
    'Id': profile['id']?.toString(),
    'Name': (name != null && name.isNotEmpty)
        ? name
        : account['username'] as String? ?? '',
    'HasPassword': true,
    'HasConfiguredPassword': true,
    siloAccountIdKey: accountId,
    siloAccountKey: account,
    siloProfileKey: profile,
    'Policy': {
      'IsAdministrator':
          account['role'] == 'admin' && profile['is_primary'] == true,
      'IsHidden': false,
      'IsDisabled': false,
      'EnableMediaPlayback': true,
      'EnableContentDownloading': account['download_allowed'] == true,
      'EnableCollectionManagement': true,
      'EnableSubtitleDownloading': true,
      'EnableAllFolders': true,
      'EnableLiveTvAccess': false,
      'EnableLiveTvManagement': false,
    },
  };
}
