import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/store/authentication_preferences.dart';
import '../../auth/store/authentication_store.dart';
import '../../util/pin_code_util.dart';
import 'app_router.dart';
import 'destinations.dart';

/// Routes a launch or deep-link path, holding it back past the cold-start auth
/// window so the router's redirect doesn't swallow it. When the session is
/// already authenticated this navigates right away, the warm path from any
/// screen. Otherwise it waits for the first moment the app is authenticated and
/// settled on Home.
void navigateWhenReady(String route) {
  final pinnedUserId = _pinnedUserId(route);
  if (_isAuthenticated()) {
    // Warm path. A link pinned to a user different from the active session
    // must re-pin first, or the route resolves under the wrong profile and the
    // item reads "not found". With no pin, or the pin already the active user,
    // the original fast navigation holds.
    if (pinnedUserId == null ||
        pinnedUserId == GetIt.instance<SessionRepository>().activeUserId) {
      unawaited(_navigateWhenSettled(route));
      return;
    }
    unawaited(_warmRepin(route, pinnedUserId));
    return;
  }

  var done = false;
  late final VoidCallback listener;
  void finish({required bool navigate}) {
    if (done) return;
    done = true;
    appRouter.routerDelegate.removeListener(listener);
    // Defer off the router-notification call stack. The listener fires
    // synchronously inside the startup navigation to Home (the delegate
    // notifies its listeners during go()), and navigating re-entrantly there
    // would fight go_router mid-transition. A post-frame hop lets Home settle.
    if (navigate) {
      WidgetsBinding.instance.addPostFrameCallback((_) => appRouter.go(route));
    }
  }

  listener = () {
    if (_isAuthenticated() && _currentPath() == Destinations.home) {
      finish(navigate: true);
    }
  };
  appRouter.routerDelegate.addListener(listener);

  // Detach only, never an early drop. This survives long PIN, login, and
  // server-select cold starts, and can't leak a listener if auth never lands.
  Timer(const Duration(minutes: 5), () => finish(navigate: false));

  // Cold start with a pinned user: establish that stored session directly so
  // the profile picker isn't needed. Best effort and non blocking, so any gate
  // or failure falls through to the picker path above, which is unchanged.
  unawaited(_pinUserIfRequested(route, onPinned: () => finish(navigate: true)));
}

/// Cold-start user pin for a deep link that carried `userId`: establish that
/// stored session directly so automation doesn't need the profile picker.
/// Runs only while the app is still unauthenticated, and only after
/// StartupScreen has settled, since switching mid restore would interleave
/// with a second concurrent session setup. [onPinned] claims the shared
/// navigation once the session is live, so the picker path can't
/// double-navigate later.
Future<void> _pinUserIfRequested(
  String route, {
  required void Function() onPinned,
}) async {
  final query = Uri.tryParse(route)?.queryParameters;
  final userId = query?['userId'];
  if (userId == null || userId.isEmpty) return;

  // The same gates the picker applies before switching to a user: a link
  // must never silently bypass a PIN or an always-authenticate requirement.
  try {
    if (GetIt.instance<AuthenticationPreferences>().shouldAlwaysAuthenticate) {
      return;
    }
    if (PinCodeUtil(GetIt.instance<PreferenceStore>(), userId).isPinEnabled) {
      return;
    }
  } catch (_) {
    // Preferences unavailable, so don't pin and let the picker handle it.
    return;
  }

  if (!await _startupSettled()) return;
  if (_isAuthenticated()) return; // startup already gave us a session

  final session = GetIt.instance<SessionRepository>();
  if (session.state != SessionState.ready) {
    await session.stateStream
        .firstWhere((s) => s == SessionState.ready)
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () => SessionState.ready,
        );
  }

  final serverId = _resolveServerIdForUser(userId, query?['serverId']);
  // Unknown or ambiguous, so let the picker decide.
  if (serverId == null) return;

  bool pinned = false;
  try {
    await GetIt.instance<ServerRepository>().loadStoredServers();
    pinned = await session.switchCurrentSession(
      serverId: serverId,
      userId: userId,
    );
  } catch (_) {
    pinned = false;
  }
  if (!pinned || !_isAuthenticated()) return;

  onPinned();
}

/// The `userId` a deep link asked us to pin, or null when it carried none.
String? _pinnedUserId(String route) {
  final userId = Uri.tryParse(route)?.queryParameters['userId'];
  return (userId == null || userId.isEmpty) ? null : userId;
}

/// Warm-session re-pin: the app already holds a session for a different user,
/// so a link pinned to another user has to switch sessions before navigating,
/// or the route resolves under the wrong profile. Applies the same gates the
/// cold-start pin does (a link must never bypass a PIN or an
/// always-authenticate requirement), reuses `switchCurrentSession` exactly the
/// way the cold path does, and falls back to the plain warm navigation on any
/// gate or failure so a link can't end up worse than before.
Future<void> _warmRepin(String route, String userId) async {
  try {
    if (GetIt.instance<AuthenticationPreferences>().shouldAlwaysAuthenticate) {
      return _navigateWarm(route);
    }
    if (PinCodeUtil(GetIt.instance<PreferenceStore>(), userId).isPinEnabled) {
      return _navigateWarm(route);
    }
  } catch (_) {
    // Preferences unavailable, so don't repin; keep the old warm behavior.
    return _navigateWarm(route);
  }

  final query = Uri.tryParse(route)?.queryParameters;
  final serverId = _resolveServerIdForUser(userId, query?['serverId']);
  // Unknown or ambiguous, so keep the old warm behavior.
  if (serverId == null) return _navigateWarm(route);

  bool pinned = false;
  try {
    await GetIt.instance<ServerRepository>().loadStoredServers();
    pinned = await GetIt.instance<SessionRepository>().switchCurrentSession(
      serverId: serverId,
      userId: userId,
    );
  } catch (_) {
    pinned = false;
  }
  if (!pinned || !_isAuthenticated()) return _navigateWarm(route);

  // Same post-frame hop the cold path uses: a switch settles Home, and
  // re-navigating inside that settlement would fight the router mid-go().
  WidgetsBinding.instance.addPostFrameCallback((_) => appRouter.go(route));
}

/// The pre-patch warm behavior, kept as the fallback for every repin failure.
void _navigateWarm(String route) => appRouter.go(route);

/// The no-repin warm path. A cold-started app fires this while the startup
/// screen is still settling (the session restores from disk, so
/// [SessionRepository.activeUserId] is already set before the router leaves
/// the startup route); navigating into an item screen mid-startup races the
/// first home transition and the item can read "not found". Wait until the
/// router has left the startup screen, then navigate. A genuinely warm app is
/// never on the startup route, so this is a no-op delay there.
Future<void> _navigateWhenSettled(String route) async {
  for (var i = 0; i < 60 && _currentPath() == Destinations.startup; i++) {
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
  appRouter.go(route);
}

/// Polls until the app is no longer on the startup screen (StartupScreen's
/// own restore finished or it gave up and showed the picker), capped so a
/// stuck startup can't hold this forever. The picker fallback window still
/// applies.
Future<bool> _startupSettled() async {
  for (var i = 0; i < 60; i++) {
    if (_currentPath() != Destinations.startup) return true;
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
  return _currentPath() != Destinations.startup;
}

/// Resolves which stored server [userId] belongs to. An explicit `serverId`
/// wins when it is a known server, otherwise the user must appear on exactly
/// one stored server. Never guess across several.
String? _resolveServerIdForUser(String userId, String? explicitServerId) {
  final authStore = GetIt.instance<AuthenticationStore>();
  if (explicitServerId != null &&
      authStore.getServer(explicitServerId) != null) {
    return explicitServerId;
  }
  final matches = authStore.getServers().where((server) =>
      authStore.getUsers(server.id).any((user) => user.id == userId)).toList();
  return matches.length == 1 ? matches.first.id : null;
}

bool _isAuthenticated() =>
    GetIt.instance.isRegistered<SessionRepository>() &&
    GetIt.instance<SessionRepository>().activeUserId != null;

String? _currentPath() {
  try {
    return appRouter.routerDelegate.currentConfiguration.uri.path;
  } catch (_) {
    return null;
  }
}
