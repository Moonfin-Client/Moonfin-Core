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

  /// The server's clock and time zone, which an access schedule is judged by,
  /// or null when the server can't say: not Jellyfin, or without a Moonfin
  /// plugin that reports it. Throws when it couldn't be read. Jellyfin refuses
  /// it, like everything else, outside the user's schedule.
  Future<ServerTime?> getServerTime();

  Future<UserConfiguration> getUserConfiguration();
  Future<void> updateUserConfiguration(UserConfiguration config);
}
