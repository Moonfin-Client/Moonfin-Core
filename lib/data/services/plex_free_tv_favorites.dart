import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';

/// Free TV channel IDs are the same through Plex Cloud and a media server.
bool isPlexFreeTvChannel(MediaServerClient client, String channelId) =>
    channelId.startsWith('channel-plex-') &&
    client.serverType == ServerType.plex;

/// Store Free TV favorites on this device per Plex profile.
/// Cloud and PMS connections share the same list.
class PlexFreeTvFavorites {
  static Preference<List<String>> _preference(String userId) =>
      Preference<List<String>>(
        key: 'plex_free_tv_favorites_${Uri.encodeComponent(userId)}',
        defaultValue: const [],
      );

  static Map<String, dynamic> applyToItem(
    MediaServerClient client,
    Map<String, dynamic> item,
  ) {
    final id = item['Id']?.toString() ?? '';
    final userId = client.userId;
    if (!isPlexFreeTvChannel(client, id) ||
        userId == null ||
        userId.isEmpty ||
        !GetIt.instance.isRegistered<UserPreferences>()) {
      return item;
    }
    final favorites = GetIt.instance<UserPreferences>().get(_preference(userId));
    final userData = item['UserData'];
    return {
      ...item,
      'UserData': {
        if (userData is Map) ...userData,
        'IsFavorite': favorites.contains(id),
      },
    };
  }

  static Future<void> setFavorite(
    MediaServerClient client,
    String channelId, {
    required bool isFavorite,
  }) async {
    final userId = client.userId;
    if (!isPlexFreeTvChannel(client, channelId) ||
        userId == null ||
        userId.isEmpty ||
        !GetIt.instance.isRegistered<UserPreferences>()) {
      throw StateError('Plex Free TV account preferences are unavailable');
    }
    final prefs = GetIt.instance<UserPreferences>();
    final preference = _preference(userId);
    final ids = prefs.get(preference).toSet();
    if (isFavorite) {
      ids.add(channelId);
    } else {
      ids.remove(channelId);
    }
    await prefs.set(preference, ids.toList()..sort());
  }
}
