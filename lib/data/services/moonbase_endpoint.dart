import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../auth/services/silo_token_storage.dart';
import '../../preference/user_preferences.dart';
import 'media_server_client_factory.dart';

/// Where a server's Moonbase routes start, and the headers that sign a
/// request to them. Append `/Moonfin/...` to [base].
typedef MoonbaseEndpoint = ({String base, Map<String, String> headers});

/// The plugin id Moonbase for Silo installs under.
const siloMoonbasePluginId = 'moonfin.moonbase';

/// Plex can't run plugins, so Moonbase for Plex is a companion service, by
/// default on this port of the Plex server's host.
const _plexMoonbasePort = 32500;

/// Silo installation ids of Moonbase and Plex companion addresses that
/// answered, by server base URL, and when a server last had no Moonbase,
/// which holds until [_missingRetry] passes.
final Map<String, String> _siloInstallations = {};
final Map<String, String> _plexBases = {};
final Map<String, DateTime> _missingAt = {};
const _missingRetry = Duration(minutes: 5);

/// The Moonbase endpoint for [client], or null when there is none to call.
///
/// Jellyfin and Emby serve Moonbase at the server root and take the
/// MediaBrowser token. Silo serves a plugin under its installation id
/// (`/api/v2/plugin-content/plugins/<id>`), found through
/// `GET /api/v2/settings/plugins`, and takes Silo's own headers: the bearer
/// token and the profile with its PIN proof. Plex uses the companion at the
/// address set for that server, or else next to the Plex server, once its ping
/// answers, and takes the PMS token, never the plex.tv account token.
Future<MoonbaseEndpoint?> moonbaseEndpoint(
  MediaServerClient client,
  Dio dio,
) async {
  final features = FeatureDetector(
    serverType: client.serverType,
    serverVersion: '',
  );
  if (!features.supportsMoonfinPlugin) return null;
  if (client.serverType == ServerType.plex) return _plexEndpoint(client, dio);
  final silo = siloClientOf(client);
  if (client.serverType == ServerType.silo && silo == null) return null;
  if (silo == null) {
    final token = client.accessToken;
    if (token == null || token.isEmpty) return null;
    return (
      base: client.baseUrl,
      headers: {
        'Authorization': buildServerAuthorizationHeader(
          scheme: 'MediaBrowser',
          deviceInfo: client.deviceInfo,
          accessToken: token,
        ),
      },
    );
  }

  // These requests go out on Moonfin's own Dio, past the Silo client's
  // refresh interceptor, so an expiring token is refreshed here first.
  if (silo.session.needsRefresh) await silo.refreshSession();
  final token = silo.accessToken;
  if (token == null || token.isEmpty) return null;
  final headers = silo.requestHeaders;

  final base = silo.baseUrl;
  String? id = _siloInstallations[base];
  if (id == null) {
    final missingAt = _missingAt[base];
    if (missingAt != null &&
        DateTime.now().difference(missingAt) < _missingRetry) {
      return null;
    }
    try {
      id = await _findSiloInstallation(dio, base, headers);
    } catch (_) {
      // Unreachable is not the same as not installed: ask again next time.
      return null;
    }
    if (id == null) {
      _missingAt[base] = DateTime.now();
      return null;
    }
    _siloInstallations[base] = id;
    _missingAt.remove(base);
  }
  return (base: '$base/api/v2/plugin-content/plugins/$id', headers: headers);
}

/// Whether [client]'s server recently answered that it has no Moonbase. On
/// Silo a server that couldn't be reached doesn't count. On Plex it does,
/// since most Plex servers have no companion.
bool moonbaseKnownMissing(MediaServerClient client) {
  final missingAt = _missingAt[client.baseUrl];
  return missingAt != null &&
      DateTime.now().difference(missingAt) < _missingRetry;
}

/// Forgets where Moonbase was on [client]'s server, so the next call looks it
/// up again. For when its routes answer 404 (the plugin was removed or
/// reinstalled under a new id), or the Plex companion's address changed.
void forgetMoonbaseEndpoint(MediaServerClient client) {
  _siloInstallations.remove(client.baseUrl);
  _plexBases.remove(client.baseUrl);
  _missingAt.remove(client.baseUrl);
}

Future<MoonbaseEndpoint?> _plexEndpoint(
  MediaServerClient client,
  Dio dio,
) async {
  final token = client.accessToken;
  if (token == null || token.isEmpty) return null;
  final headers = {'X-Plex-Token': token};
  final pref = plexMoonbasePreference(client);
  final typed = pref != null && GetIt.instance.isRegistered<UserPreferences>()
      ? _normalizeUrl(GetIt.instance<UserPreferences>().get(pref))
      : '';
  final base = typed.isNotEmpty ? typed : plexMoonbaseDefault(client);
  if (base == null) return null;

  final key = client.baseUrl;
  if (_plexBases[key] == base) return (base: base, headers: headers);
  if (moonbaseKnownMissing(client)) return null;
  try {
    var request = dio.get<dynamic>(
      '$base/Moonfin/Ping',
      options: Options(headers: headers),
    );
    // Sign-in waits on this, and most Plex servers have no companion.
    if (typed.isEmpty) request = request.timeout(const Duration(seconds: 3));
    final data = (await request).data;
    // Plex itself answers paths it doesn't know, so the reply has to say
    // Moonbase is there.
    if (data is Map && data['installed'] == true) {
      _plexBases[key] = base;
      _missingAt.remove(key);
      return (base: base, headers: headers);
    }
  } catch (_) {}
  _missingAt[key] = DateTime.now();
  return null;
}

/// The Moonbase address the user set for [client]'s Plex server, or null on
/// other servers and before the app has a client factory.
Preference<String>? plexMoonbasePreference(MediaServerClient client) {
  if (client.serverType != ServerType.plex ||
      !GetIt.instance.isRegistered<MediaServerClientFactory>()) {
    return null;
  }
  return UserPreferences.moonbaseUrlForServer(
    GetIt.instance<MediaServerClientFactory>().serverIdOf(client),
  );
}

/// `http://<Plex host>:32500`, with a plex.direct name turned back into the
/// address it spells, since the companion has no plex.direct certificate.
String? plexMoonbaseDefault(MediaServerClient client) {
  final host = Uri.tryParse(client.baseUrl)?.host ?? '';
  if (host.isEmpty) return null;
  return Uri(
    scheme: 'http',
    host: plexDirectAddress(host) ?? host,
    port: _plexMoonbasePort,
  ).toString();
}

final _plexDirect = RegExp(
  r'^(\d{1,3}-\d{1,3}-\d{1,3}-\d{1,3})\.[0-9a-f]+\.plex\.direct$',
  caseSensitive: false,
);

/// Turns `192-168-1-5.<hash>.plex.direct` back into `192.168.1.5`. Null for
/// any other host, IPv6 plex.direct names included.
String? plexDirectAddress(String host) =>
    _plexDirect.firstMatch(host)?.group(1)?.replaceAll('-', '.');

String _normalizeUrl(String url) {
  var out = url.trim();
  while (out.endsWith('/')) {
    out = out.substring(0, out.length - 1);
  }
  if (out.isEmpty) return out;
  return out.contains('://') ? out : 'http://$out';
}

Future<String?> _findSiloInstallation(
  Dio dio,
  String base,
  Map<String, String> headers,
) async {
  final response = await dio.get(
    '$base/api/v2/settings/plugins',
    options: Options(headers: headers),
  );
  final data = response.data;
  final items = data is Map ? data['items'] : null;
  if (items is! List) return null;
  for (final item in items) {
    if (item is Map && item['plugin_id'] == siloMoonbasePluginId) {
      final id = item['id'];
      if (id != null && '$id'.isNotEmpty) return '$id';
    }
  }
  return null;
}
