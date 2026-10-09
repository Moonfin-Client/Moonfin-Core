import 'package:server_core/server_core.dart';

class Server {
  final String id;
  final String name;
  final String address;

  /// [address] with the host in the Unicode spelling the user typed, or null
  /// when they didn't type one. Only for display, since requests always go
  /// to [address].
  final String? displayAddress;
  final String version;
  final ServerType serverType;
  final String? loginDisclaimer;
  final bool splashscreenEnabled;
  final bool setupCompleted;
  final DateTime dateAdded;
  final DateTime dateLastAccessed;

  const Server({
    required this.id,
    required this.name,
    required this.address,
    this.displayAddress,
    required this.version,
    required this.serverType,
    this.loginDisclaimer,
    this.splashscreenEnabled = false,
    this.setupCompleted = true,
    required this.dateAdded,
    DateTime? dateLastAccessed,
  }) : dateLastAccessed = dateLastAccessed ?? dateAdded;

  Server copyWith({
    String? name,
    String? address,
    String? displayAddress,
    bool clearDisplayAddress = false,
    String? version,
    ServerType? serverType,
    String? loginDisclaimer,
    bool? splashscreenEnabled,
    bool? setupCompleted,
    DateTime? dateLastAccessed,
  }) {
    return Server(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      displayAddress: clearDisplayAddress
          ? null
          : displayAddress ?? this.displayAddress,
      version: version ?? this.version,
      serverType: serverType ?? this.serverType,
      loginDisclaimer: loginDisclaimer ?? this.loginDisclaimer,
      splashscreenEnabled: splashscreenEnabled ?? this.splashscreenEnabled,
      setupCompleted: setupCompleted ?? this.setupCompleted,
      dateAdded: dateAdded,
      dateLastAccessed: dateLastAccessed ?? this.dateLastAccessed,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'displayAddress': displayAddress,
        'version': version,
        'serverType': serverType.name,
        'loginDisclaimer': loginDisclaimer,
        'splashscreenEnabled': splashscreenEnabled,
        'setupCompleted': setupCompleted,
        'dateAdded': dateAdded.toIso8601String(),
        'dateLastAccessed': dateLastAccessed.toIso8601String(),
      };

  factory Server.fromJson(String id, Map<String, dynamic> json) {
    return Server(
      id: id,
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      displayAddress: json['displayAddress'] as String?,
      version: json['version'] as String? ?? '',
      serverType: ServerType.values.firstWhere(
        (t) => t.name == json['serverType'],
        orElse: () => ServerType.jellyfin,
      ),
      loginDisclaimer: json['loginDisclaimer'] as String?,
      splashscreenEnabled: json['splashscreenEnabled'] as bool? ?? false,
      setupCompleted: json['setupCompleted'] as bool? ?? true,
      dateAdded: DateTime.tryParse(json['dateAdded'] as String? ?? '') ??
          DateTime.now(),
      dateLastAccessed:
          DateTime.tryParse(json['dateLastAccessed'] as String? ?? ''),
    );
  }
}
