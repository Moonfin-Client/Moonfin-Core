import 'package:playback_silo/playback_silo.dart';
import 'package:server_core/server_core.dart';

import '../auth/services/silo_token_storage.dart';

/// The Silo plugin for the app's [client].
///
/// The app hands every server's client around wrapped in
/// `ConnectivityAwareMediaServerClient` (for offline browsing), and Silo's
/// playback calls its own API on the Silo client itself, so the plugin gets
/// the client inside the wrapper. Its resolver and session service then
/// share one client, and with it one session registry.
SiloPlugin siloPluginFor(
  MediaServerClient client, {
  SiloPlaybackEnvironment Function()? environment,
}) => SiloPlugin(siloClientOf(client) ?? client, environment: environment);
