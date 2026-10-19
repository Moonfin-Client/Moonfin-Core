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
  Future<UserConfiguration> getUserConfiguration();
  Future<void> updateUserConfiguration(UserConfiguration config);
}
