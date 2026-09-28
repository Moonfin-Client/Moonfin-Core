abstract class UserLibraryApi {
  bool get supportsNumericUserRatings;
  Future<void> markFavorite(String itemId);
  Future<void> unmarkFavorite(String itemId);
  /// [datePlayed] overrides the LastPlayedDate the server records; it
  /// defaults to now on the server.
  Future<void> markPlayed(String itemId, {DateTime? datePlayed});
  Future<void> unmarkPlayed(String itemId);
  Future<void> updateUserRating(String itemId, {required bool likes});
  Future<void> updateNumericUserRating(String itemId, {required double rating});
  Future<void> deleteUserRating(String itemId);
  Future<Map<String, dynamic>> getItem(String itemId);
}
