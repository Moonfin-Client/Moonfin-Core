/// Translates Silo accounts and household profiles into Jellyfin `UserDto`
/// maps, so Moonfin's user models read them unchanged.
///
/// Moonfin's user is the Silo **profile** (plan §4.2, option A). The login
/// belongs to the account; [siloAccountIdKey] on each translated user ties the
/// profile back to it.
library;

/// Key on a translated user carrying the owning Silo account's id.
const siloAccountIdKey = 'SiloAccountId';

/// Silo's subtitle modes (`auto`, `always`, `off`) plus its separate
/// show-forced flag, as Jellyfin's `SubtitleMode` values.
String siloSubtitleModeToJellyfin(String? mode, {bool showForced = true}) {
  switch (mode) {
    case 'always':
      return 'Always';
    case 'off':
      return showForced ? 'OnlyForced' : 'None';
    case 'auto':
    default:
      return 'Default';
  }
}

/// The reverse of [siloSubtitleModeToJellyfin]: Silo's `subtitle_mode` and
/// `show_forced_subtitles` for a Jellyfin `SubtitleMode`.
///
/// Case-insensitive: Moonfin's `UserConfiguration` stores the mode lowercase.
({String mode, bool showForced}) jellyfinSubtitleModeToSilo(String? mode) {
  switch (mode?.trim().toLowerCase()) {
    case 'always':
      return (mode: 'always', showForced: true);
    case 'onlyforced':
      return (mode: 'off', showForced: true);
    case 'none':
      return (mode: 'off', showForced: false);
    case 'smart':
    case 'default':
    default:
      return (mode: 'auto', showForced: true);
  }
}

/// A Jellyfin `UserDto` for a Silo [profile] of [account].
///
/// Administrator rights belong to the account role, but Silo withholds
/// administrator channels from secondary profiles, so only the household's
/// primary profile of an admin account is treated as an administrator.
Map<String, dynamic> siloProfileToUserDto({
  required Map<String, dynamic> profile,
  required Map<String, dynamic> account,
  String? serverId,
  String? imageTag,
}) {
  final isAdminAccount = account['role'] == 'admin';
  final isPrimary = profile['is_primary'] == true;
  final downloadAllowed = account['download_allowed'] == true;
  final language = _nonEmpty(profile['language']);
  final subtitleLanguage = _nonEmpty(profile['subtitle_language']);
  final showForced = profile['show_forced_subtitles'] as bool? ?? true;

  return {
    'Id': profile['id']?.toString(),
    'Name': profile['name'] as String? ?? account['username'] as String? ?? '',
    if (serverId != null) 'ServerId': serverId,
    'HasPassword': true,
    'HasConfiguredPassword': true,
    'PrimaryImageTag': ?imageTag,
    siloAccountIdKey: account['id']?.toString(),
    'Policy': {
      'IsAdministrator': isAdminAccount && isPrimary,
      'IsHidden': false,
      'IsDisabled': false,
      'EnableMediaPlayback': true,
      'EnableContentDownloading': downloadAllowed,
      // Personal collections are open to every profile on Silo.
      'EnableCollectionManagement': true,
      // Silo checks subtitle search/download rights itself.
      'EnableSubtitleDownloading': true,
      'EnableSubtitleManagement': false,
      'EnableContentDeletion': false,
      'EnableLiveTvAccess': false,
      'EnableLiveTvManagement': false,
    },
    'Configuration': {
      'AudioLanguagePreference': ?language,
      'SubtitleLanguagePreference': ?subtitleLanguage,
      'SubtitleMode': siloSubtitleModeToJellyfin(
        profile['subtitle_mode'] as String?,
        showForced: showForced,
      ),
      'PlayDefaultAudioTrack': true,
      'EnableNextEpisodeAutoPlay': true,
      'RememberAudioSelections': true,
      'RememberSubtitleSelections': true,
      'HidePlayedInLatest': true,
    },
    'SiloProfile': profile,
    'SiloAccount': account,
  };
}

String? _nonEmpty(Object? value) =>
    value is String && value.trim().isNotEmpty ? value : null;
