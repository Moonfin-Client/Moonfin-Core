import 'package:server_core/server_core.dart';

import 'iptv_media_stream_resolver.dart';
import 'iptv_player_service.dart';

class IptvPlugin {
  final MediaServerClient _client;

  IptvPlugin(this._client);

  IptvMediaStreamResolver createStreamResolver() =>
      IptvMediaStreamResolver(_client);

  IptvPlayerService createPlaySessionService() => IptvPlayerService(_client);
}
