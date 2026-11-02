import 'package:dio/dio.dart';
import 'package:server_core/server_core.dart';

import '../plex_item_mapper.dart';
import 'plex_apis.dart';

/// Plex keeps a file's seek previews in a BIF index and hands out the frame
/// nearest any offset. Each preview's tag is the file part's id, which is all
/// the frame address needs besides the time.
class PlexTrickplayApi implements TrickplayApi {
  final Dio _dio;
  final String Function() _baseUrl;
  final String? Function() _accessToken;

  PlexTrickplayApi(this._dio, this._baseUrl, this._accessToken);

  static const _frameInterval = Duration(seconds: 10);

  @override
  Future<TrickplayThumbnailSet?> getThumbnailSet(
    String itemId, {
    required int width,
    String? mediaSourceId,
  }) async {
    final target = plexPartOf(itemId);
    final (key, mediaIndex) = target != null
        ? (target.$1, target.$2)
        : plexSourceOf(mediaSourceId ?? itemId);
    final container = await plexContainer(_dio, '/library/metadata/$key');
    final item = (container['Metadata'] as List?)?.firstOrNull as Map?;
    final media = (item?['Media'] as List?)?.elementAtOrNull(mediaIndex);
    final part = (media?['Part'] as List?)?.elementAtOrNull(target?.$3 ?? 0);
    final duration = part?['duration'] as int?;
    final aspectRatio = (media?['aspectRatio'] as num?)?.toDouble();
    // Plex only marks a part that has its previews built.
    if (part?['indexes'] != 'sd' || duration == null || aspectRatio == null) {
      return null;
    }
    final step = _frameInterval.inMilliseconds;
    return TrickplayThumbnailSet(
      aspectRatio: aspectRatio,
      thumbnails: [
        for (var ms = 0; ms < duration; ms += step)
          TrickplayThumbnail(
            positionTicks: ms * 10000,
            imageTag: '${part['id']}',
          ),
      ],
    );
  }

  @override
  String getFrameImageUrl(
    String itemId, {
    required int width,
    required int positionTicks,
    required String imageTag,
    String? mediaSourceId,
  }) {
    final token = _accessToken();
    return '${_baseUrl()}/library/parts/$imageTag/indexes/sd/'
        '${positionTicks ~/ 10000}'
        '${token == null ? '' : '?X-Plex-Token=${Uri.encodeQueryComponent(token)}'}';
  }
}
