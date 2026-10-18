import '../models/server_models.dart';
import '../models/system_models.dart';

abstract class UsersApi {
  Future<ServerUser> getCurrentUser();

  /// A user by id. Unlike [getCurrentUser] this keeps answering outside a
  /// user's access schedule on Jellyfin, which is how a client can still read
  /// the schedule then.
  Future<ServerUser> getUser(String userId);
  Future<UserConfiguration> getUserConfiguration();
  Future<void> updateUserConfiguration(UserConfiguration config);
}
