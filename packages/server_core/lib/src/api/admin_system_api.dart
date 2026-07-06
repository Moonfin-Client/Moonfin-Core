import '../models/admin_models.dart';

abstract class AdminSystemApi {
  Future<Map<String, dynamic>> getServerConfiguration();
  Future<void> updateServerConfiguration(Map<String, dynamic> config);
  Future<Map<String, dynamic>> getNamedConfiguration(String key);
  Future<void> updateNamedConfiguration(String key, Map<String, dynamic> config);
  Future<StorageInfo> getStorageInfo();
  Future<void> restartServer();
  Future<void> shutdownServer();
  Future<List<LogFileInfo>> getLogFiles();
  Future<String> getLogFileContent(String name);
  Future<ActivityLogResult> getActivityLog({
    int? startIndex,
    int? limit,
    bool? hasUserId,
    DateTime? minDate,
  });

  /// Localization metadata used to populate admin dropdowns.
  /// Each entry is returned as a raw map so callers can pick the fields they
  /// need (e.g. Cultures: `Name`/`DisplayName`/`TwoLetterISOLanguageName`;
  /// Countries: `Name`/`DisplayName`/`TwoLetterISORegionName`;
  /// ParentalRatings: `Name`/`Value`).
  Future<List<Map<String, dynamic>>> getCultures();
  Future<List<Map<String, dynamic>>> getCountries();
  Future<List<Map<String, dynamic>>> getParentalRatings();

  /// Available authentication / password-reset providers as `{Name, Id}` maps,
  /// used by the user-edit Profile tab selectors.
  Future<List<Map<String, dynamic>>> getAuthProviders();
  Future<List<Map<String, dynamic>>> getPasswordResetProviders();

  /// Uploads or removes the custom login splashscreen image.
  Future<void> uploadSplashscreen(List<int> bytes, String contentType);
  Future<void> deleteSplashscreen();

  /// Gets server-wide item counts grouped by type.
  Future<Map<String, dynamic>> getItemCounts();
}
