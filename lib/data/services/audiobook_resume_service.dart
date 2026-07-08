import 'package:shared_preferences/shared_preferences.dart';

/// Stores an audiobook's last playback position locally, keyed per server+item.
///
/// Audiobooks are so long that Jellyfin's percentage-based resume thresholds
/// discard early and near complete positions, so the client keeps its own
/// authoritative resume point rather than relying on the server value.
class AudiobookResumeService {
  static String _key(String serverId, String itemId) =>
      'audiobook_resume_${serverId}_$itemId';

  Future<void> save(String serverId, String itemId, int positionMs) async {
    if (positionMs <= 0) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key(serverId, itemId), positionMs);
  }

  Future<int?> load(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key(serverId, itemId));
  }

  /// Every locally-tracked resume position for [serverId], keyed by itemId.
  /// Used to build a "Continue listening" shelf; the car's server-side resume
  /// list omits these because progress is tracked here, not in server UserData.
  Future<Map<String, int>> loadAll(String serverId) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = _key(serverId, '');
    final result = <String, int>{};
    for (final key in prefs.getKeys()) {
      if (!key.startsWith(prefix)) continue;
      final itemId = key.substring(prefix.length);
      if (itemId.isEmpty) continue;
      final ms = prefs.getInt(key);
      if (ms != null && ms > 0) result[itemId] = ms;
    }
    return result;
  }

  Future<void> clear(String serverId, String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key(serverId, itemId));
  }
}
