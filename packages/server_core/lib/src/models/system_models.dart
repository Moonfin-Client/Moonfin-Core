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
    Map<String, dynamic> raw = const {},
  }) : _raw = raw;

  factory UserConfiguration.fromJson(Map<String, dynamic> json) =>
      UserConfiguration(
        orderedViews: _stringList(json['OrderedViews']),
        latestItemsExcludes: _stringList(json['LatestItemsExcludes']),
        myMediaExcludes: _stringList(json['MyMediaExcludes']),
        groupedFolders: _stringList(json['GroupedFolders']),
        hidePlayedInLatest: json['HidePlayedInLatest'] as bool? ?? true,
        enableNextEpisodeAutoPlay:
            json['EnableNextEpisodeAutoPlay'] as bool? ?? true,
        playDefaultAudioTrack:
            json['PlayDefaultAudioTrack'] as bool? ?? true,
        rememberAudioSelections:
            json['RememberAudioSelections'] as bool? ?? true,
        rememberSubtitleSelections:
            json['RememberSubtitleSelections'] as bool? ?? true,
        audioLanguagePreference: _nonEmptyString(json['AudioLanguagePreference']),
        subtitleLanguagePreference: _nonEmptyString(json['SubtitleLanguagePreference']),
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

  UserConfiguration copyWith({
    List<String>? myMediaExcludes,
    List<String>? latestItemsExcludes,
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
      raw: _raw,
    );
  }

  Map<String, dynamic> toJson() {
    final json = Map<String, dynamic>.from(_raw);
    json['OrderedViews'] = orderedViews;
    json['LatestItemsExcludes'] = latestItemsExcludes;
    json['MyMediaExcludes'] = myMediaExcludes;
    json['GroupedFolders'] = groupedFolders;
    json['HidePlayedInLatest'] = hidePlayedInLatest;
    json['EnableNextEpisodeAutoPlay'] = enableNextEpisodeAutoPlay;
    json['PlayDefaultAudioTrack'] = playDefaultAudioTrack;
    json['RememberAudioSelections'] = rememberAudioSelections;
    json['RememberSubtitleSelections'] = rememberSubtitleSelections;

    // key absence is used as a check, so only set if not null
    if (audioLanguagePreference != null) {
      json['AudioLanguagePreference'] = audioLanguagePreference;
    }
    if (subtitleLanguagePreference != null) {
      json['SubtitleLanguagePreference'] = subtitleLanguagePreference;
    }
    return json;
  }
}
