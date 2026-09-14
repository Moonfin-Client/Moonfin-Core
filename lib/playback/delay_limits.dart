import 'package:playback_core/playback_core.dart';

import 'aether_backend.dart';
import 'media3_player_backend.dart';
import 'media_kit_player_backend.dart';

/// The range [backend] honors for a delay, or null when it cant offset this
/// track at all. Either bound being null means it takes anything.
///
/// Aether has its own subtitle overlay to shift but no say over AVFoundation
/// audio timing.
(double?, double?)? delayLimitsFor(PlayerBackend? backend, {required bool audio}) {
  if (backend is MediaKitPlayerBackend) return (null, null);
  if (backend is Media3PlayerBackend) {
    return audio ? (-2.0, 2.0) : (-5.0, 5.0);
  }
  if (backend is AetherBackend) return audio ? null : (null, null);
  return null;
}
