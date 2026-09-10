import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../auth/repositories/server_repository.dart';

/// What the engine is told about certificates the system will not vouch for.
///
/// The preference is one switch, but the engine decides per origin. A user with
/// a self signed server on the LAN and a second one behind a real certificate
/// should not have the second relaxed along with the first, so the hosts the
/// switch was meant for travel with it.
class EngineTrust {
  const EngineTrust({required this.enabled, required this.hosts});

  final bool enabled;
  final List<String> hosts;

  /// Reads the preference and the servers this install is configured for.
  ///
  /// The list is empty before the servers have loaded, which the native side
  /// reads as "no list yet" rather than as "trust nothing", so opting in never
  /// costs playback.
  factory EngineTrust.current(bool enabled) {
    if (!enabled) return const EngineTrust(enabled: false, hosts: []);
    final hosts = <String>{};
    if (GetIt.instance.isRegistered<ServerRepository>()) {
      for (final server in GetIt.instance<ServerRepository>().servers) {
        final host = Uri.tryParse(server.address)?.host ?? '';
        if (host.isNotEmpty) hosts.add(host.toLowerCase());
      }
    }
    return EngineTrust(enabled: true, hosts: hosts.toList()..sort());
  }

  bool matches(EngineTrust? other) =>
      other != null &&
      other.enabled == enabled &&
      listEquals(other.hosts, hosts);

  Map<String, Object?> toChannelArguments() => {
    'enabled': enabled,
    'hosts': hosts,
  };
}
