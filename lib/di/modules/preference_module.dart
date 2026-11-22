import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';

final _getIt = GetIt.instance;

void registerPreferenceModule(PreferenceStore store) {
  // Read here rather than when UserPreferences is first built, since a
  // background task can reach the server before anything asks for it.
  gAllowSelfSignedCertificates = store.get(
    UserPreferences.allowSelfSignedCerts,
  );
  // Same reason as the certificate flag: the network layer reads these globals
  // directly, and a request can go out before Settings is ever opened.
  gServerProxyUrl = store.get(UserPreferences.proxyUrl);
  gServerUserAgentOverride = store.get(UserPreferences.serverUserAgent);
  gServerClientNameOverride = store.get(UserPreferences.serverClientName);
  gServerRequestHeaders = UserPreferences.decodeServerRequestHeaders(
    store.get(UserPreferences.serverRequestHeaders),
  );
  gEmbyAuthorizationHeader = store.get(UserPreferences.embyAuthorizationHeader);
  gEmbyAuthorizationScheme = store.get(UserPreferences.embyAuthorizationScheme);
  gEmbyDeviceNameOverride = store.get(UserPreferences.embyDeviceName);
  gEmbyDeviceIdOverride = store.get(UserPreferences.embyDeviceId);
  gEmbyClientVersionOverride = store.get(UserPreferences.embyClientVersion);
  _getIt.registerSingleton(store);
  _getIt.registerLazySingleton(() => UserPreferences(store));
}
