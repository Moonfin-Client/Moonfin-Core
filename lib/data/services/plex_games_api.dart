import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import 'moonbase_endpoint.dart';
import 'plugin_sync_service.dart' show pluginRequestOptions;

/// Moonbase's retro games routes for a Plex [client]. Plex has no plugins,
/// so they're on the Moonbase companion, which each request finds and signs
/// with the PMS token. URLs handed to an image loader, the native player or
/// the EmulatorJS page carry that token in the query instead.
GamesApi plexMoonbaseGamesApi(
  MediaServerClient client, {
  @visibleForTesting Dio? dio,
  @visibleForTesting Dio? endpointDio,
}) {
  final games = dio ?? _newDio();
  final lookup = endpointDio ?? _newDio();
  String? base;
  games.interceptors.insert(
    0,
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final endpoint = await moonbaseEndpoint(client, lookup);
        if (endpoint == null) {
          handler.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.connectionError,
              message: 'Moonbase for Plex couldn\'t be reached.',
            ),
          );
          return;
        }
        base = endpoint.base;
        options.baseUrl = endpoint.base;
        options.headers.addAll(endpoint.headers);
        handler.next(options);
      },
    ),
  );
  return MoonbaseGamesApi(
    games,
    () => base ?? plexMoonbaseDefault(client) ?? client.baseUrl,
    () => client.accessToken,
    ServerType.plex,
  );
}

Dio _newDio() {
  final dio = Dio(pluginRequestOptions());
  configureServerDio(dio);
  dio.interceptors.add(redirectInterceptor(dio));
  return dio;
}
