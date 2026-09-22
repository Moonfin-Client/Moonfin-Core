import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The display-only beta marker from the `moonfin:` block of pubspec.yaml.
///
/// A beta build still carries the plain `version:` line, so the build id, the
/// build number and the version the server records stay where they are. Only
/// the version the login and about screens show picks up the suffix.
class AppBeta {
  const AppBeta._();

  static int? _number;

  /// Reads the flag out of the bundled pubspec. A pubspec that can't be read
  /// or parsed leaves the build non-beta.
  static Future<void> load() async {
    try {
      _number = parseBetaNumber(await rootBundle.loadString('pubspec.yaml'));
    } catch (_) {
      _number = null;
    }
  }

  /// [version] with the beta suffix appended, when this build is a beta.
  static String label(String version) =>
      _number == null ? version : '$version beta $_number';

  /// Pulls `beta` and `beta_number` out of the top-level `moonfin:` block.
  ///
  /// Hand rolled rather than handed to a YAML parser, because these two keys
  /// are scalars this repo writes itself and a runtime YAML dependency would
  /// buy nothing else.
  @visibleForTesting
  static int? parseBetaNumber(String pubspec) {
    var inBlock = false;
    var enabled = false;
    var number = 1;

    for (final raw in const LineSplitter().convert(pubspec)) {
      final hash = raw.indexOf('#');
      final line = hash < 0 ? raw : raw.substring(0, hash);
      final entry = line.trim();
      if (entry.isEmpty) continue;

      if (!line.startsWith(' ')) {
        inBlock = entry == 'moonfin:';
        continue;
      }
      if (!inBlock) continue;

      final colon = entry.indexOf(':');
      if (colon < 0) continue;
      final key = entry.substring(0, colon);
      final value = entry.substring(colon + 1).trim();
      if (key == 'beta') {
        enabled = value.toLowerCase() == 'true';
      } else if (key == 'beta_number') {
        number = int.tryParse(value) ?? number;
      }
    }

    return enabled ? number : null;
  }

  @visibleForTesting
  static void setForTesting(int? betaNumber) => _number = betaNumber;
}
