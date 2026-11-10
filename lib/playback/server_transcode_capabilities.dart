import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

/// Reads the cached probe result for the active server. False whenever the
/// service is not registered, so profile builds outside a full app session
/// keep the H264-first offer.
bool serverAllowsHevcTranscode() {
  final getIt = GetIt.instance;
  if (!getIt.isRegistered<ServerTranscodeCapabilities>()) return false;
  return getIt<ServerTranscodeCapabilities>().hevcEncodeAllowed;
}

/// Caches whether the active Jellyfin server allows HEVC encoding, read from
/// its encoding options, so device profiles can offer an HEVC transcode
/// target only when the admin explicitly enabled it. The value resets to
/// false the moment a new server activates and stays false on Emby, probe
/// failures, or blocked endpoints, so every fallback keeps the H264-first
/// offer.
class ServerTranscodeCapabilities {
  int _generation = 0;
  bool _hevcEncodeAllowed = false;

  bool get hevcEncodeAllowed => _hevcEncodeAllowed;

  Future<void> refresh(MediaServerClient client) async {
    final generation = ++_generation;
    _hevcEncodeAllowed = false;
    if (!client.features.supportsHevcEncodingSetting) return;

    try {
      final config = await client.adminSystemApi.getNamedConfiguration(
        'encoding',
      );
      // A server switch mid-probe means this result belongs to the old server.
      if (generation != _generation) return;
      _hevcEncodeAllowed = config['AllowHevcEncoding'] == true;
    } catch (_) {}
  }
}
