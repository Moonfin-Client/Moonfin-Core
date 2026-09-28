import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/store/authentication_preferences.dart';
import '../../auth/store/authentication_store.dart';
import '../../preference/user_preferences.dart';
import '../../util/pin_code_util.dart';
import 'app_router.dart';
import 'destinations.dart';

/// Routes a launch or deep-link path, holding it back past the cold-start auth
/// window so the router's redirect doesn't swallow it. When the session is
/// already authenticated this navigates once startup has settled, switching
/// first to the user the link pinned. Otherwise it waits for the first moment
/// the app is authenticated and settled on Home.
void navigateWhenReady(String route) {
  final pinnedUserId = _pinnedUserId(route);
  if (_isAuthenticated()) {
    unawaited(_navigate(route, pinnedUserId));
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
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => unawaited(_navigate(route, pinnedUserId)),
      );
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
  final userId = _pinnedUserId(route);
  if (userId == null || _switchBlocked(userId)) return;

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

  final query = Uri.tryParse(route)?.queryParameters;
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

String? _pinnedUserId(String route) {
  final userId = Uri.tryParse(route)?.queryParameters['userId'];
  return (userId == null || userId.isEmpty) ? null : userId;
}

/// The gates the picker applies before switching to a user. A link must never
/// silently bypass a PIN or an always-authenticate requirement.
bool _switchBlocked(String userId) {
  try {
    return GetIt.instance<AuthenticationPreferences>()
            .shouldAlwaysAuthenticate ||
        PinCodeUtil(GetIt.instance<PreferenceStore>(), userId).isPinEnabled;
  } catch (_) {
    // Preferences unavailable, so don't switch.
    return true;
  }
}

/// Navigates to [route], switching first when the link pinned a user other
/// than the signed-in one. A session restored from disk counts as signed in
/// before the startup screen has moved on, and navigating or switching then
/// races its trip to Home, where the item can read "not found". So this waits
/// for startup to settle first, which costs nothing once the app is running.
Future<void> _navigate(String route, String? pinnedUserId) async {
  await _startupSettled();
  final activeUserId = GetIt.instance<SessionRepository>().activeUserId;
  if (pinnedUserId == null || pinnedUserId == activeUserId) {
    appRouter.go(route);
    return;
  }
  await _switchUserAndNavigate(route, pinnedUserId);
}

/// Switches to [userId] before navigating, since otherwise the route resolves
/// under the wrong profile. Any gate or failure opens it under the current
/// user instead, so a link never ends up worse than it was.
Future<void> _switchUserAndNavigate(String route, String userId) async {
  final query = Uri.tryParse(route)?.queryParameters;
  final serverId = _resolveServerIdForUser(userId, query?['serverId']);
  // Kids Mode locks its way out behind a PIN, so a link can't switch away from
  // it either.
  if (serverId == null ||
      _switchBlocked(userId) ||
      GetIt.instance<UserPreferences>().get(UserPreferences.kidsModeEnabled)) {
    appRouter.go(route);
    return;
  }

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
  if (!pinned) {
    appRouter.go(route);
    return;
  }

  // The switch rebuilds everything that follows the signed-in user, so the
  // navigation waits a frame rather than landing in the middle of that.
  WidgetsBinding.instance.addPostFrameCallback((_) => appRouter.go(route));
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
