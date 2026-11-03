import 'package:server_core/server_core.dart';

import 'silo_media_stream_resolver.dart';
import 'silo_play_session_service.dart';
import 'silo_playback_context.dart';

/// Builds Silo's stream resolver and session reporter for a client, like
/// `JellyfinPlugin` and `EmbyPlugin` do for theirs.
///
/// [environment] tells the resolver about the device and its player. It's
/// asked at every playback start, so a changed display or setting is
/// picked up. Without it the resolver knows only the app version and sends
/// conservative defaults.
class SiloPlugin {
  final MediaServerClient _client;
  final SiloPlaybackEnvironment Function() _environment;

  SiloPlugin(this._client, {SiloPlaybackEnvironment Function()? environment})
    : _environment = environment ?? _defaultEnvironment;

  static SiloPlaybackEnvironment _defaultEnvironment() =>
      const SiloPlaybackEnvironment();

  SiloMediaStreamResolver createStreamResolver() =>
      SiloMediaStreamResolver(_client, environment: _environment);

  SiloPlaySessionService createPlaySessionService() =>
      SiloPlaySessionService(_client);
}
