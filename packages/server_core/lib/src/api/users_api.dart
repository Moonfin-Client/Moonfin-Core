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

  /// The signed in user's access window, judged on the server's clock by the
  /// Moonfin plugin, or null when the server can't say: not Jellyfin, or
  /// without a plugin that answers it. Throws when it couldn't be read. The
  /// plugin answers it outside the user's schedule too.
  Future<AccessWindow?> getAccessWindow();
  Future<UserConfiguration> getUserConfiguration();
  Future<void> updateUserConfiguration(UserConfiguration config);
}
