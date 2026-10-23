import 'access_schedule.dart';

class UserPolicy {
  final bool isAdministrator;
  final bool isHidden;
  final bool isDisabled;
  final bool enableRemoteAccess;
  final bool enableLiveTvAccess;
  final bool enableLiveTvManagement;
  final bool enableMediaPlayback;
  final bool enableAudioPlaybackTranscoding;
  final bool enableVideoPlaybackTranscoding;
  final bool enablePlaybackRemuxing;
  final bool enableContentDeletion;
  final bool enableContentDownloading;
  final bool enableSyncTranscoding;
  final bool enableMediaConversion;
  final bool enableAllDevices;
  final bool enableAllChannels;
  final bool enableAllFolders;
  final bool enablePublicSharing;
  final bool enableRemoteControlOfOtherUsers;
  final bool enableSharedDeviceControl;
  final bool enableCollectionManagement;
  final bool enableSubtitleManagement;
  final bool enableSubtitleDownloading;
  final bool enableLyricManagement;
  final bool forceRemoteSourceTranscoding;
  final int? remoteClientBitrateLimit;
  final List<String> enabledFolders;
  final List<String> enabledChannels;
  final List<String> enabledDevices;
  final List<String> blockedChannels;
  final List<String> blockedMediaFolders;
  final int? maxParentalRating;
  final List<String> blockedTags;
  final int? loginAttemptsBeforeLockout;
  final int? maxActiveSessions;
  final String authenticationProviderId;
  final String passwordResetProviderId;

  /// The policy exactly as the server sent it, every key included.
  final Map<String, dynamic> _raw;

  const UserPolicy({
    this.isAdministrator = false,
    this.isHidden = false,
    this.isDisabled = false,
    this.enableRemoteAccess = true,
    this.enableLiveTvAccess = false,
    this.enableLiveTvManagement = false,
    this.enableMediaPlayback = true,
    this.enableAudioPlaybackTranscoding = true,
    this.enableVideoPlaybackTranscoding = true,
    this.enablePlaybackRemuxing = true,
    this.enableContentDeletion = false,
    this.enableContentDownloading = false,
    this.enableSyncTranscoding = false,
    this.enableMediaConversion = false,
    this.enableAllDevices = true,
    this.enableAllChannels = true,
    this.enableAllFolders = true,
    this.enablePublicSharing = false,
    this.enableRemoteControlOfOtherUsers = false,
    this.enableSharedDeviceControl = false,
    this.enableCollectionManagement = false,
    this.enableSubtitleManagement = false,
    this.enableSubtitleDownloading = false,
    this.enableLyricManagement = false,
    this.forceRemoteSourceTranscoding = false,
    this.remoteClientBitrateLimit,
    this.enabledFolders = const [],
    this.enabledChannels = const [],
    this.enabledDevices = const [],
    this.blockedChannels = const [],
    this.blockedMediaFolders = const [],
    this.maxParentalRating,
    this.blockedTags = const [],
    this.loginAttemptsBeforeLockout,
    this.maxActiveSessions,
    this.authenticationProviderId =
        'Jellyfin.Server.Implementations.Users.DefaultAuthenticationProvider',
    this.passwordResetProviderId =
        'Jellyfin.Server.Implementations.Users.DefaultPasswordResetProvider',
    Map<String, dynamic> raw = const {},
  }) : _raw = raw;

  factory UserPolicy.fromJson(Map<String, dynamic> json) => UserPolicy(
        isAdministrator: json['IsAdministrator'] as bool? ?? false,
        isHidden: json['IsHidden'] as bool? ?? false,
        isDisabled: json['IsDisabled'] as bool? ?? false,
        enableRemoteAccess: json['EnableRemoteAccess'] as bool? ?? true,
        enableLiveTvAccess: json['EnableLiveTvAccess'] as bool? ?? false,
        enableLiveTvManagement:
            json['EnableLiveTvManagement'] as bool? ?? false,
        enableMediaPlayback: json['EnableMediaPlayback'] as bool? ?? true,
        enableAudioPlaybackTranscoding:
            json['EnableAudioPlaybackTranscoding'] as bool? ?? true,
        enableVideoPlaybackTranscoding:
            json['EnableVideoPlaybackTranscoding'] as bool? ?? true,
        enablePlaybackRemuxing:
            json['EnablePlaybackRemuxing'] as bool? ?? true,
        enableContentDeletion:
            json['EnableContentDeletion'] as bool? ?? false,
        enableContentDownloading:
            json['EnableContentDownloading'] as bool? ?? false,
        enableSyncTranscoding:
            json['EnableSyncTranscoding'] as bool? ?? false,
        enableMediaConversion:
            json['EnableMediaConversion'] as bool? ?? false,
        enableAllDevices: json['EnableAllDevices'] as bool? ?? true,
        enableAllChannels: json['EnableAllChannels'] as bool? ?? true,
        enableAllFolders: json['EnableAllFolders'] as bool? ?? true,
        enablePublicSharing: json['EnablePublicSharing'] as bool? ?? false,
        enableRemoteControlOfOtherUsers:
            json['EnableRemoteControlOfOtherUsers'] as bool? ?? false,
        enableSharedDeviceControl:
            json['EnableSharedDeviceControl'] as bool? ?? false,
        enableCollectionManagement:
            json['EnableCollectionManagement'] as bool? ?? false,
        enableSubtitleManagement:
            json['EnableSubtitleManagement'] as bool? ?? false,
        enableSubtitleDownloading:
            json['EnableSubtitleDownloading'] as bool? ?? false,
        enableLyricManagement:
            json['EnableLyricManagement'] as bool? ?? false,
        forceRemoteSourceTranscoding:
            json['ForceRemoteSourceTranscoding'] as bool? ?? false,
        remoteClientBitrateLimit:
            json['RemoteClientBitrateLimit'] as int?,
        enabledFolders: _stringList(json['EnabledFolders']),
        enabledChannels: _stringList(json['EnabledChannels']),
        enabledDevices: _stringList(json['EnabledDevices']),
        blockedChannels: _stringList(json['BlockedChannels']),
        blockedMediaFolders: _stringList(json['BlockedMediaFolders']),
        maxParentalRating: json['MaxParentalRating'] as int?,
        blockedTags: _stringList(json['BlockedTags']),
        loginAttemptsBeforeLockout:
            json['LoginAttemptsBeforeLockout'] as int?,
        maxActiveSessions: json['MaxActiveSessions'] as int?,
        authenticationProviderId: json['AuthenticationProviderId'] as String? ??
            'Jellyfin.Server.Implementations.Users.DefaultAuthenticationProvider',
        passwordResetProviderId: json['PasswordResetProviderId'] as String? ??
            'Jellyfin.Server.Implementations.Users.DefaultPasswordResetProvider',
        raw: json,
      );

  /// The server replaces the whole policy on POST and resets every key the
  /// body leaves out, so a policy read from the server goes back as it came.
  /// The class has no copyWith, so that map is always the current value.
  Map<String, dynamic> toJson() =>
      _raw.isNotEmpty ? Map<String, dynamic>.from(_raw) : _typedJson();

  Map<String, dynamic> _typedJson() => {
        'IsAdministrator': isAdministrator,
        'IsHidden': isHidden,
        'IsDisabled': isDisabled,
        'EnableRemoteAccess': enableRemoteAccess,
        'EnableLiveTvAccess': enableLiveTvAccess,
        'EnableLiveTvManagement': enableLiveTvManagement,
        'EnableMediaPlayback': enableMediaPlayback,
        'EnableAudioPlaybackTranscoding': enableAudioPlaybackTranscoding,
        'EnableVideoPlaybackTranscoding': enableVideoPlaybackTranscoding,
        'EnablePlaybackRemuxing': enablePlaybackRemuxing,
        'EnableContentDeletion': enableContentDeletion,
        'EnableContentDownloading': enableContentDownloading,
        'EnableSyncTranscoding': enableSyncTranscoding,
        'EnableMediaConversion': enableMediaConversion,
        'EnableAllDevices': enableAllDevices,
        'EnableAllChannels': enableAllChannels,
        'EnableAllFolders': enableAllFolders,
        'EnablePublicSharing': enablePublicSharing,
        'EnableRemoteControlOfOtherUsers': enableRemoteControlOfOtherUsers,
        'EnableSharedDeviceControl': enableSharedDeviceControl,
        'EnableCollectionManagement': enableCollectionManagement,
        'EnableSubtitleManagement': enableSubtitleManagement,
        'EnableSubtitleDownloading': enableSubtitleDownloading,
        'EnableLyricManagement': enableLyricManagement,
        'ForceRemoteSourceTranscoding': forceRemoteSourceTranscoding,
        if (remoteClientBitrateLimit != null)
          'RemoteClientBitrateLimit': remoteClientBitrateLimit,
        'EnabledFolders': enabledFolders,
        'EnabledChannels': enabledChannels,
        'EnabledDevices': enabledDevices,
        'BlockedChannels': blockedChannels,
        'BlockedMediaFolders': blockedMediaFolders,
        if (maxParentalRating != null)
          'MaxParentalRating': maxParentalRating,
        'BlockedTags': blockedTags,
        if (loginAttemptsBeforeLockout != null)
          'LoginAttemptsBeforeLockout': loginAttemptsBeforeLockout,
        if (maxActiveSessions != null)
          'MaxActiveSessions': maxActiveSessions,
        'AuthenticationProviderId': authenticationProviderId,
        'PasswordResetProviderId': passwordResetProviderId,
      };

  /// The hours the user may use the server, empty for no limit. Read from the
  /// server's own policy, so entries this client can't read are left out.
  List<AccessSchedule> get accessSchedules {
    final entries = _raw['AccessSchedules'];
    if (entries is! List) return const [];
    return [
      for (final entry in entries)
        if (entry is Map)
          AccessSchedule.fromJson(Map<String, dynamic>.from(entry)),
    ];
  }

  /// Whether the user may search for and pull in subtitles from a provider.
  ///
  /// Two flags mean the same thing here and servers disagree on which to
  /// grant. Emby hands out downloading by default and leaves management off,
  /// so reading management alone locks out every ordinary Emby account. An
  /// administrator may either way, and Jellyfin leaves both off for them.
  bool get canFetchRemoteSubtitles =>
      isAdministrator || enableSubtitleManagement || enableSubtitleDownloading;

  static List<String> _stringList(dynamic value) {
    if (value is List) return value.cast<String>();
    return const [];
  }
}
