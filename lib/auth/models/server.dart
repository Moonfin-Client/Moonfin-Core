import 'package:server_core/server_core.dart';

class Server {
  final String id;
  final String name;
  final String address;
  final String connectionAddress;
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
    String? connectionAddress,
    required this.version,
    required this.serverType,
    this.loginDisclaimer,
    this.splashscreenEnabled = false,
    this.setupCompleted = true,
    required this.dateAdded,
    DateTime? dateLastAccessed,
  }) : connectionAddress = connectionAddress ?? address,
       dateLastAccessed = dateLastAccessed ?? dateAdded;

  Server copyWith({
    String? name,
    String? address,
    String? connectionAddress,
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
      connectionAddress: connectionAddress ?? this.connectionAddress,
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
    'connectionAddress': connectionAddress,
    'version': version,
    'serverType': serverType.name,
    'loginDisclaimer': loginDisclaimer,
    'splashscreenEnabled': splashscreenEnabled,
    'setupCompleted': setupCompleted,
    'dateAdded': dateAdded.toIso8601String(),
    'dateLastAccessed': dateLastAccessed.toIso8601String(),
  };

  factory Server.fromJson(String id, Map<String, dynamic> json) {
    final address = json['address'] as String? ?? '';
    return Server(
      id: id,
      name: json['name'] as String? ?? '',
      address: address,
      connectionAddress: json['connectionAddress'] as String? ?? address,
      version: json['version'] as String? ?? '',
      serverType: ServerType.values.firstWhere(
        (t) => t.name == json['serverType'],
        orElse: () => ServerType.jellyfin,
      ),
      loginDisclaimer: json['loginDisclaimer'] as String?,
      splashscreenEnabled: json['splashscreenEnabled'] as bool? ?? false,
      setupCompleted: json['setupCompleted'] as bool? ?? true,
      dateAdded:
          DateTime.tryParse(json['dateAdded'] as String? ?? '') ??
          DateTime.now(),
      dateLastAccessed: DateTime.tryParse(
        json['dateLastAccessed'] as String? ?? '',
      ),
    );
  }
}
