import '../models/access_schedule.dart';
import '../models/server_models.dart';
import '../models/system_models.dart';

abstract class UsersApi {
  Future<ServerUser> getCurrentUser();

  /// The hours [userId] may use the server, empty for no limit, or null when
  /// the server didn't send a policy. Jellyfin enforces them and keeps
  /// answering this outside them, which [getCurrentUser] does not, so a client
  /// can still read the schedule once it has closed. Other servers have none to
  /// read and answer empty.
  Future<List<AccessSchedule>?> getAccessSchedules(String userId);

  /// Returns the signed-in user's access window, evaluated using the server's
  /// clock by the Moonfin plugin. Returns null when the server cannot provide
  /// this information, such as when it is not Jellyfin or the plugin is
  /// unavailable (404) or cannot read the schedule (501). Throws if the request
  /// fails for another reason or the response is not a valid access window.
  /// The plugin can return the window even when the user is outside it, unlike
  /// Jellyfin's own API.
  Future<AccessWindow?> getAccessWindow();
  Future<UserConfiguration> getUserConfiguration();
  Future<void> updateUserConfiguration(UserConfiguration config);
}
