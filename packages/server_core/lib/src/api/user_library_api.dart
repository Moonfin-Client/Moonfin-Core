abstract class UserLibraryApi {
  bool get supportsNumericUserRatings;
  Future<void> markFavorite(String itemId);
  Future<void> unmarkFavorite(String itemId);
  Future<void> markPlayed(String itemId);
  Future<void> unmarkPlayed(String itemId);
  /// Saves a resume position outside a playback session, stamped with the
  /// current time so another device can tell which save is newer.
  Future<void> updatePlayedPosition(String itemId, {required int positionTicks});
  Future<void> updateUserRating(String itemId, {required bool likes});
  Future<void> updateNumericUserRating(String itemId, {required double rating});
  Future<void> deleteUserRating(String itemId);
  Future<Map<String, dynamic>> getItem(String itemId);
}
