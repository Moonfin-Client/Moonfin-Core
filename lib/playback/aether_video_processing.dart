import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../data/models/aggregated_item.dart';
import '../data/services/media_server_client_factory.dart';
import '../preference/user_preferences.dart';

Future<Map<String, Object?>> aetherVideoProcessingArgs(
  UserPreferences prefs,
) async {
  final lineArt =
      prefs.get(UserPreferences.upscaleAnimationLineArt) &&
      await _currentItemIsDrawnAnimation();
  return {
    'upscaleLowResolution':
        lineArt || prefs.get(UserPreferences.upscaleLowResolutionVideo),
    'upscaleFullHD': prefs.get(UserPreferences.upscaleFullHdVideo),
    'upscaleLineArt': lineArt,
  };
}

/// Movies tagged only Animation are left out because many of them are 3D,
/// which line art makes look painted.
bool isDrawnAnimation({required List<String> genres, required bool isEpisode}) {
  final names = genres.map((genre) => genre.toLowerCase()).toSet();
  return names.contains('anime') || (isEpisode && names.contains('animation'));
}

final _seriesGenres = <String, List<String>>{};

Future<bool> _currentItemIsDrawnAnimation() async {
  if (!GetIt.instance.isRegistered<PlaybackManager>()) return false;
  final item = GetIt.instance<PlaybackManager>().queueService.currentItem;
  if (item is! AggregatedItem) return false;
  final isEpisode = item.type == 'Episode';
  final seriesId = item.seriesId;
  final genres = isEpisode && item.genres.isEmpty && seriesId != null
      ? await _genresOfSeries(item.serverId, seriesId)
      : item.genres;
  return isDrawnAnimation(genres: genres, isEpisode: isEpisode);
}

// Many episodes carry no genres of their own, only their show does.
Future<List<String>> _genresOfSeries(String serverId, String seriesId) async {
  final key = '$serverId/$seriesId';
  final cached = _seriesGenres[key];
  if (cached != null) return cached;
  if (!GetIt.instance.isRegistered<MediaServerClientFactory>()) return const [];
  final client = GetIt.instance<MediaServerClientFactory>().getClientIfExists(
    serverId,
  );
  if (client == null) return const [];
  try {
    final series = await client.itemsApi
        .getItem(seriesId, fields: 'Genres')
        .timeout(const Duration(seconds: 2));
    final genres = [
      for (final genre in series['Genres'] as List? ?? const []) '$genre',
    ];
    return _seriesGenres[key] = genres;
  } catch (_) {
    return const [];
  }
}
