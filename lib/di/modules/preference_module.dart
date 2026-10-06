import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../preference/user_preferences.dart';
import '../../util/insecure_certificates.dart';

final _getIt = GetIt.instance;

void registerPreferenceModule(PreferenceStore store) {
  // Read here rather than when UserPreferences is first built, since a
  // background task can reach the server before anything asks for it.
  gAllowSelfSignedCertificates = store.get(
    UserPreferences.allowSelfSignedCerts,
  );
  _getIt.registerSingleton(store);
  _getIt.registerLazySingleton(() => UserPreferences(store));
}
