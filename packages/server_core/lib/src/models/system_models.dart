import 'server_models.dart';

class PublicSystemInfo {
  final String serverName;
  final String version;
  final String? productName;
  final String id;
  final bool startupWizardCompleted;
  final String? localAddress;

  const PublicSystemInfo({
    required this.serverName,
    required this.version,
    this.productName,
    required this.id,
    this.startupWizardCompleted = false,
    this.localAddress,
  });

  factory PublicSystemInfo.fromJson(Map<String, dynamic> json) =>
      PublicSystemInfo(
        serverName: json['ServerName'] as String? ?? '',
        version: json['Version'] as String? ?? '',
        productName: json['ProductName'] as String?,
        id: json['Id'] as String? ?? '',
        startupWizardCompleted:
            json['StartupWizardCompleted'] as bool? ?? false,
        localAddress: json['LocalAddress'] as String?,
      );
}

class SystemInfo {
  final String serverName;
  final String version;
  final String? productName;
  final String id;
  final String? operatingSystem;
  final bool hasPendingRestart;
  final bool supportsLibraryMonitor;
  final bool canSelfRestart;

  const SystemInfo({
    required this.serverName,
    required this.version,
    this.productName,
    required this.id,
    this.operatingSystem,
    this.hasPendingRestart = false,
    this.supportsLibraryMonitor = false,
    this.canSelfRestart = false,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) => SystemInfo(
        serverName: json['ServerName'] as String? ?? '',
        version: json['Version'] as String? ?? '',
        productName: json['ProductName'] as String?,
        id: json['Id'] as String? ?? '',
        operatingSystem: json['OperatingSystem'] as String?,
        hasPendingRestart: json['HasPendingRestart'] as bool? ?? false,
        supportsLibraryMonitor:
            json['SupportsLibraryMonitor'] as bool? ?? false,
        canSelfRestart: json['CanSelfRestart'] as bool? ?? false,
      );
}

class AuthResult {
  final String accessToken;
  final ServerUser user;
  final String? serverId;

  const AuthResult({
    required this.accessToken,
    required this.user,
    this.serverId,
  });

  factory AuthResult.fromJson(Map<String, dynamic> json) => AuthResult(
        accessToken: json['AccessToken'] as String? ?? '',
        user: ServerUser.fromJson(
            json['User'] as Map<String, dynamic>? ?? const {}),
        serverId: json['ServerId'] as String?,
      );
}

class DisplayPreferences {
  final String id;
  final String? sortBy;
  final String? sortOrder;
  final String? viewType;
  final Map<String, String> customPrefs;

  const DisplayPreferences({
    required this.id,
    this.sortBy,
    this.sortOrder,
    this.viewType,
    this.customPrefs = const {},
  });

  factory DisplayPreferences.fromJson(Map<String, dynamic> json) =>
      DisplayPreferences(
        id: json['Id'] as String? ?? '',
        sortBy: json['SortBy'] as String?,
        sortOrder: json['SortOrder'] as String?,
        viewType: json['ViewType'] as String?,
        customPrefs: (json['CustomPrefs'] as Map<String, dynamic>?)
                ?.map((k, v) => MapEntry(k, v as String)) ??
            const {},
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        if (sortBy != null) 'SortBy': sortBy,
        if (sortOrder != null) 'SortOrder': sortOrder,
        if (viewType != null) 'ViewType': viewType,
        'CustomPrefs': customPrefs,
      };
}

class UserConfiguration {
  final List<String> orderedViews;
  final List<String> latestItemsExcludes;
  final List<String> myMediaExcludes;
  final List<String> groupedFolders;
  final bool hidePlayedInLatest;
  final bool enableNextEpisodeAutoPlay;
  final bool playDefaultAudioTrack;
  final bool rememberAudioSelections;
  final bool rememberSubtitleSelections;
  final String? audioLanguagePreference;
  final String? subtitleLanguagePreference;
  final String? subtitleMode;
  final Map<String, dynamic> _raw;

  const UserConfiguration({
    this.orderedViews = const [],
    this.latestItemsExcludes = const [],
    this.myMediaExcludes = const [],
    this.groupedFolders = const [],
    this.hidePlayedInLatest = true,
    this.enableNextEpisodeAutoPlay = true,
    this.playDefaultAudioTrack = true,
    this.rememberAudioSelections = true,
    this.rememberSubtitleSelections = true,
    this.audioLanguagePreference, // = null
    this.subtitleLanguagePreference, // = null
    this.subtitleMode, // = null
    Map<String, dynamic> raw = const {},
  }) : _raw = raw;

  factory UserConfiguration.fromJson(Map<String, dynamic> json) =>
      UserConfiguration(
        orderedViews: _stringList(json['OrderedViews'] ?? json['orderedViews']),
        latestItemsExcludes: _stringList(json['LatestItemsExcludes'] ?? json['latestItemsExcludes']),
        myMediaExcludes: _stringList(json['MyMediaExcludes'] ?? json['myMediaExcludes']),
        groupedFolders: _stringList(json['GroupedFolders'] ?? json['groupedFolders']),
        hidePlayedInLatest: (json['HidePlayedInLatest'] ?? json['hidePlayedInLatest']) as bool? ?? true,
        enableNextEpisodeAutoPlay:
            (json['EnableNextEpisodeAutoPlay'] ?? json['enableNextEpisodeAutoPlay']) as bool? ?? true,
        playDefaultAudioTrack:
            (json['PlayDefaultAudioTrack'] ?? json['playDefaultAudioTrack']) as bool? ?? true,
        rememberAudioSelections:
            (json['RememberAudioSelections'] ?? json['rememberAudioSelections']) as bool? ?? true,
        rememberSubtitleSelections:
            (json['RememberSubtitleSelections'] ?? json['rememberSubtitleSelections']) as bool? ?? true,
        audioLanguagePreference: _nonEmptyString(json['AudioLanguagePreference'] ?? json['audioLanguagePreference']),
        subtitleLanguagePreference: _nonEmptyString(json['SubtitleLanguagePreference'] ?? json['subtitleLanguagePreference']),
        subtitleMode: _subtitleModeString(json['SubtitleMode'] ?? json['subtitleMode']),
        raw: json,
      );

  static List<String> _stringList(dynamic value) {
    if (value is List) return value.cast<String>();
    return const [];
  }

  static String? _nonEmptyString(dynamic value) {
    if (value is String && value.trim().isNotEmpty) return value.trim();
    return null;
  }

  /// Normalizes the SubtitleMode field which Jellyfin/Emby may return as either a
  /// string or an integer depending on the server version.  Returns a lowercase
  /// string matching Jellyfin's enum names, or null if the value is absent.
  static String? _subtitleModeString(dynamic value) {
    if (value == null) return null;
    if (value is String && value.trim().isNotEmpty) {
      return value.trim().toLowerCase();
    }
    // SubtitlePlaybackMode: Default=0, Always=1, OnlyForced=2, None=3, Smart=4
    if (value is int) {
      return switch (value) {
        0 => 'default',
        1 => 'always',
        2 => 'onlyforced',
        3 => 'none',
        4 => 'smart',
        _ => null,
      };
    }
    return null;
  }

  UserConfiguration copyWith({
    List<String>? myMediaExcludes,
    List<String>? latestItemsExcludes,
    String? subtitleMode,
  }) {
    return UserConfiguration(
      orderedViews: orderedViews,
      latestItemsExcludes: latestItemsExcludes ?? this.latestItemsExcludes,
      myMediaExcludes: myMediaExcludes ?? this.myMediaExcludes,
      groupedFolders: groupedFolders,
      hidePlayedInLatest: hidePlayedInLatest,
      enableNextEpisodeAutoPlay: enableNextEpisodeAutoPlay,
      playDefaultAudioTrack: playDefaultAudioTrack,
      rememberAudioSelections: rememberAudioSelections,
      rememberSubtitleSelections: rememberSubtitleSelections,
      audioLanguagePreference: audioLanguagePreference,
      subtitleLanguagePreference: subtitleLanguagePreference,
      subtitleMode: subtitleMode ?? this.subtitleMode,
      raw: _raw,
    );
  }

  Map<String, dynamic> toJson() {
    final json = Map<String, dynamic>.from(_raw);
    json['OrderedViews'] = orderedViews;
    json['orderedViews'] = orderedViews;
    json['LatestItemsExcludes'] = latestItemsExcludes;
    json['latestItemsExcludes'] = latestItemsExcludes;
    json['MyMediaExcludes'] = myMediaExcludes;
    json['myMediaExcludes'] = myMediaExcludes;
    json['GroupedFolders'] = groupedFolders;
    json['groupedFolders'] = groupedFolders;
    json['HidePlayedInLatest'] = hidePlayedInLatest;
    json['hidePlayedInLatest'] = hidePlayedInLatest;
    json['EnableNextEpisodeAutoPlay'] = enableNextEpisodeAutoPlay;
    json['enableNextEpisodeAutoPlay'] = enableNextEpisodeAutoPlay;
    json['PlayDefaultAudioTrack'] = playDefaultAudioTrack;
    json['playDefaultAudioTrack'] = playDefaultAudioTrack;
    json['RememberAudioSelections'] = rememberAudioSelections;
    json['rememberAudioSelections'] = rememberAudioSelections;
    json['RememberSubtitleSelections'] = rememberSubtitleSelections;
    json['rememberSubtitleSelections'] = rememberSubtitleSelections;

    // key absence is used as a check, so only set if not null
    if (audioLanguagePreference != null) {
      json['AudioLanguagePreference'] = audioLanguagePreference;
      json['audioLanguagePreference'] = audioLanguagePreference;
    }
    if (subtitleLanguagePreference != null) {
      json['SubtitleLanguagePreference'] = subtitleLanguagePreference;
      json['subtitleLanguagePreference'] = subtitleLanguagePreference;
    }
    if (subtitleMode != null) {
      json['SubtitleMode'] = subtitleMode;
      json['subtitleMode'] = subtitleMode;
    }
    return json;
  }
}
