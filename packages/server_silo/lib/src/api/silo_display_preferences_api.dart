import 'package:server_core/server_core.dart';

/// Moonfin's `DisplayPreferencesApi` on Silo, kept on this device.
///
/// Jellyfin and Emby store per-library view settings on the server. Silo's
/// only comparable setting, `ui.library_page_state`, is its web app's own
/// state, scoped to one profile on one device, so it would never sync
/// anything across devices. Moonfin already keeps these settings locally
/// (its preferences: image type, sort, view per library) and only mirrors
/// them to the server, so on Silo the mirror stays in memory: reads answer
/// what was saved this session, or an empty set, and nothing is sent.
class SiloDisplayPreferencesApi implements DisplayPreferencesApi {
  final Map<String, DisplayPreferences> _saved = {};

  static String _key(String id, String? client) => '$id:${client ?? ''}';

  @override
  Future<DisplayPreferences> getDisplayPreferences(
    String id, {
    String? client,
  }) async => _saved[_key(id, client)] ?? DisplayPreferences(id: id);

  @override
  Future<void> saveDisplayPreferences(
    String id,
    DisplayPreferences prefs, {
    String? client,
  }) async {
    _saved[_key(id, client)] = prefs;
  }
}
