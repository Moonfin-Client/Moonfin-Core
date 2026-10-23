sealed class User {
  String get id;
  String get name;
  String get serverId;
  String? get imageTag;
  bool get isAdministrator;
  bool get canDownload;
  bool get canManageSubtitles;
  bool get canManageCollections;

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
    );
  }

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
  });
}
