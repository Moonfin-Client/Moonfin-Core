sealed class User {
  String get id;
  String get name;
  String get serverId;
  String? get imageTag;
  bool get isAdministrator;
  bool get canDownload;
  bool get canManageSubtitles;
  bool get canManageCollections;
  bool get canManageLiveTv;

  const User();
}

class PrivateUser extends User {
  @override
  final String id;
  @override
  final String name;
  @override
  final String serverId;
  final String accessToken;

  /// A Plex user's own plex.tv token, which lists and switches Plex Home
  /// members. Their server token is [accessToken].
  final String? plexToken;
  final DateTime lastUsed;
  @override
  final String? imageTag;
  @override
  final bool isAdministrator;
  @override
  final bool canDownload;
  @override
  final bool canManageSubtitles;
  @override
  final bool canManageCollections;
  @override
  final bool canManageLiveTv;

  /// On Silo, the account this user belongs to. A Silo login belongs to an
  /// account, and the Moonfin user is one of its household profiles. The
  /// stored tokens are keyed by it. Null on Jellyfin and Emby.
  final String? siloAccountId;

  bool get isSiloProfile => siloAccountId != null;

  /// On Silo, whether the profile is locked with a PIN, so acting as it needs
  /// the PIN entered in this login. As Silo said when the household was last
  /// read. False on Jellyfin and Emby.
  final bool siloHasPin;

  const PrivateUser({
    required this.id,
    required this.name,
    required this.serverId,
    required this.accessToken,
    required this.lastUsed,
    this.plexToken,
    this.imageTag,
    this.isAdministrator = false,
    this.canDownload = false,
    this.canManageSubtitles = false,
    this.canManageCollections = false,
    this.canManageLiveTv = false,
    this.siloAccountId,
    this.siloHasPin = false,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'accessToken': accessToken,
        'plexToken': ?plexToken,
        'lastUsed': lastUsed.toIso8601String(),
        'imageTag': imageTag,
        'isAdministrator': isAdministrator,
        'canDownload': canDownload,
        'canManageSubtitles': canManageSubtitles,
        'canManageCollections': canManageCollections,
        'canManageLiveTv': canManageLiveTv,
        // Only written for Silo users, so Jellyfin and Emby entries are
        // exactly what they were.
        if (siloAccountId != null) 'siloAccountId': siloAccountId,
        if (siloHasPin) 'siloHasPin': true,
      };

  factory PrivateUser.fromJson(
    String id,
    String serverId,
    Map<String, dynamic> json,
  ) {
    return PrivateUser(
      id: id,
      name: json['name'] as String? ?? '',
      serverId: serverId,
      accessToken: json['accessToken'] as String? ?? '',
      plexToken: json['plexToken'] as String?,
      lastUsed: DateTime.tryParse(json['lastUsed'] as String? ?? '') ??
          DateTime.now(),
      imageTag: json['imageTag'] as String?,
      isAdministrator: json['isAdministrator'] as bool? ?? false,
      canDownload: json['canDownload'] as bool? ?? false,
      canManageSubtitles: json['canManageSubtitles'] as bool? ?? false,
      canManageCollections: json['canManageCollections'] as bool? ?? false,
      canManageLiveTv: json['canManageLiveTv'] as bool? ?? false,
      siloAccountId: _nonEmpty(json['siloAccountId']),
      siloHasPin: json['siloHasPin'] == true,
    );
  }

  static String? _nonEmpty(Object? value) =>
      value is String && value.isNotEmpty ? value : null;

  PrivateUser copyWith({
    String? id,
    String? name,
    String? serverId,
    String? accessToken,
    String? plexToken,
    DateTime? lastUsed,
    String? imageTag,
    bool? isAdministrator,
    bool? canDownload,
    bool? canManageSubtitles,
    bool? canManageCollections,
    bool? canManageLiveTv,
    String? siloAccountId,
    bool? siloHasPin,
  }) {
    return PrivateUser(
      id: id ?? this.id,
      name: name ?? this.name,
      serverId: serverId ?? this.serverId,
      accessToken: accessToken ?? this.accessToken,
      plexToken: plexToken ?? this.plexToken,
      lastUsed: lastUsed ?? this.lastUsed,
      imageTag: imageTag ?? this.imageTag,
      isAdministrator: isAdministrator ?? this.isAdministrator,
      canDownload: canDownload ?? this.canDownload,
      canManageSubtitles: canManageSubtitles ?? this.canManageSubtitles,
      canManageCollections: canManageCollections ?? this.canManageCollections,
      canManageLiveTv: canManageLiveTv ?? this.canManageLiveTv,
      siloAccountId: siloAccountId ?? this.siloAccountId,
      siloHasPin: siloHasPin ?? this.siloHasPin,
    );
  }
}

class PublicUser extends User {
  @override
  final String id;
  @override
  final String name;
  @override
  final String serverId;
  final bool hasPassword;
  @override
  final String? imageTag;
  @override
  final bool isAdministrator;
  @override
  final bool canDownload;
  @override
  final bool canManageSubtitles;
  @override
  final bool canManageCollections;
  @override
  final bool canManageLiveTv;

  const PublicUser({
    required this.id,
    required this.name,
    required this.serverId,
    required this.hasPassword,
    this.imageTag,
    this.isAdministrator = false,
    this.canDownload = false,
    this.canManageSubtitles = false,
    this.canManageCollections = false,
    this.canManageLiveTv = false,
  });
}
