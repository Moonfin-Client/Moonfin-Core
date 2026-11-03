import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';
import 'package:server_silo/server_silo.dart';

import '../../util/signed_in_server_features.dart';

/// Everything the user has rated, item id to score out of 10, from the
/// Moonfin server plugin, or on Silo from Silo's own ratings. Null when the
/// endpoint is unreachable or the plugin is not installed, which callers
/// treat as the sort being unavailable.
Future<Map<String, double>?> fetchMyUserRatings(MediaServerClient client) async {
  if (client is SiloMediaServerClient) return _siloRatings(client);
  final token = client.accessToken;
  if (token == null || token.isEmpty || !serverHasMoonfinPlugin(client)) {
    return null;
  }

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization': buildServerAuthorizationHeader(
          scheme: 'MediaBrowser',
          deviceInfo: client.deviceInfo,
          accessToken: token,
        ),
        'Accept': 'application/json',
      },
    ),
  );
  configureServerDio(dio);

  try {
    final response = await dio.get<Map<String, dynamic>>(
      '${client.baseUrl}/Moonfin/UserRatings/Mine',
    );
    final items = response.data?['Items'];
    if (items is! List) return null;

    final ratings = <String, double>{};
    for (final entry in items) {
      if (entry is! Map) continue;
      final id = entry['ItemId']?.toString();
      final rating = entry['Rating'];
      if (id == null || id.isEmpty || rating is! num) continue;
      ratings[id] = rating.toDouble();
    }
    return ratings;
  } catch (_) {
    return null;
  } finally {
    dio.close();
  }
}

/// The profile's star ratings (`GET /ratings`), 1 to 5 stars as Moonfin's
/// score out of 10.
Future<Map<String, double>?> _siloRatings(SiloMediaServerClient client) async {
  final ratings = <String, double>{};
  String? cursor;
  try {
    do {
      final response = await client.dio.get<Map<String, dynamic>>(
        '/api/v2/ratings',
        queryParameters: {'limit': siloMaxPageSize, 'cursor': ?cursor},
      );
      final page = SiloPage.fromJson(response.data ?? const {});
      for (final entry in page.items) {
        final id = entry['item_id']?.toString();
        final stars = entry['rating'];
        if (id == null || id.isEmpty || stars is! num) continue;
        ratings[id] = stars * 2.0;
      }
      cursor = page.nextCursor;
    } while (cursor != null);
    return ratings;
  } catch (_) {
    return null;
  }
}
