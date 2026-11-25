// Entry redirect (portnook fork): not part of upstream Moonfin.
//
// Wires the entry redirect into the app. Called once from
// `configureDependencies` (and the background setup) after the auth and
// playback modules registered; everything else of upstream stays as it is.
import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../auth/repositories/server_repository.dart';
import '../data/services/connectivity_service.dart';
import '../data/services/media_server_client_factory.dart';
import 'entry_address_store.dart';
import 'entry_redirect.dart';
import 'entry_redirect_connectivity.dart';

Future<void> registerEntryRedirect() async {
  final getIt = GetIt.instance;
  if (getIt.isRegistered<EntryRedirect>()) return;
  final store = EntryAddressStore();
  await store.init();
  final repository = getIt<ServerRepository>();
  final redirect = EntryRedirect(
    repository,
    store,
    getIt<MediaServerClientFactory>(),
  );
  repository.entryRedirect = redirect;
  getIt.registerSingleton<EntryRedirect>(redirect);

  // A request that can't reach a server added through a redirect asks the
  // entered address where it went, so a moved target is taken at once.
  ServerMoved.resolver = redirect.followMovedAddress;
  ServerMoved.canMove = redirect.canMove;
  ServerMoved.serverAt = redirect.serverIdAt;

  EntryRedirectConnectivity? watcher;
  if (getIt.isRegistered<ConnectivityService>()) {
    watcher = EntryRedirectConnectivity(getIt<ConnectivityService>(), redirect)
      ..start();
    getIt.registerSingleton<EntryRedirectConnectivity>(watcher);
  }

  if (getIt.isRegistered<PlaybackManager>()) {
    final manager = getIt<PlaybackManager>();
    // Only a server added through a redirect can have moved: for any other,
    // each ask would only ping a link that is slow already.
    manager.canServerMove = () =>
        getIt.isRegistered<MediaServerClient>() &&
        redirect.canMove(getIt<MediaServerClient>().baseUrl);
    void lost() {
      if (watcher != null && (manager.canServerMove?.call() ?? false)) {
        unawaited(watcher.onStreamConnectionLost());
      }
    }

    // A lost stream may mean the server moved behind its entry address; the
    // check then hands the client the new address before the next reconnect.
    manager.reconnectingStream
        .where((reconnecting) => reconnecting)
        .listen((_) => lost());
    // A stalled request finds a moved server while the buffer still plays.
    manager.serverStalledStream.listen((_) => lost());
  }
}
