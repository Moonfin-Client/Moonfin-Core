import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/store/authentication_preferences.dart';
import '../../auth/store/authentication_store.dart';
import '../../data/services/pin_guard.dart';
import '../../data/services/server_pin_service.dart';
import '../../l10n/app_localizations.dart';
import '../../preference/user_preferences.dart';
import '../../util/pin_code_util.dart';
import '../screens/auth/silo_profile_unlock.dart';
import '../widgets/pin_entry_dialog.dart';
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
  unawaited(
    _pinUserIfRequested(
      route,
      onPinned: () => finish(navigate: true),
      onDeclined: () => finish(navigate: false),
    ),
  );
}

/// Cold-start user pin for a deep link that carried `userId`: establish that
/// stored session directly so automation doesn't need the profile picker.
/// Runs only while the app is still unauthenticated, and only after
/// StartupScreen has settled, since switching mid restore would interleave
/// with a second concurrent session setup. [onPinned] claims the shared
/// navigation once the session is live, so the picker path can't
/// double-navigate later. [onDeclined] drops the link once a home link's
/// prompt was turned down or sent the person to sign in, so whoever is picked
/// next isn't asked for that user's PIN again.
Future<void> _pinUserIfRequested(
  String route, {
  required void Function() onPinned,
  required void Function() onDeclined,
}) async {
  final userId = _pinnedUserId(route);
  if (userId == null) return;
  // A home link asks for what the user needs over the picker instead.
  final home = _isHomeLink(route);
  if (!home && _switchBlocked(userId)) return;

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
  if (home) {
    final outcome = await _switchWithPrompts(serverId, userId);
    if (outcome != _SwitchOutcome.switched) {
      onDeclined();
      return;
    }
    pinned = true;
  } else {
    try {
      await GetIt.instance<ServerRepository>().loadStoredServers();
      pinned = await session.switchCurrentSession(
        serverId: serverId,
        userId: userId,
      );
    } catch (_) {
      pinned = false;
    }
  }
  if (!pinned || !_isAuthenticated()) return;

  onPinned();
  // The navigation onPinned queued waits for the next frame, and once the PIN
  // dialog has closed the picker is idle and draws none by itself.
  if (home) WidgetsBinding.instance.scheduleFrame();
}

bool _isHomeLink(String route) =>
    Uri.tryParse(route)?.path == Destinations.home;

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
    unawaited(openLinkedRoute(appRouter, route));
    return;
  }
  await _switchUserAndNavigate(route, pinnedUserId);
}

/// Opens a linked [route]. go() builds a nested route's parents, which would
/// put the Live TV page, one the app never opens itself, under a Live TV link,
/// so those open over Home instead, as the in-app entry points do. A watch
/// party link does the same, so its screen has a way back.
Future<void> openLinkedRoute(GoRouter router, String route) async {
  if (!route.startsWith('${Destinations.liveTv}/') &&
      !route.startsWith(Destinations.watchParty)) {
    router.go(route);
    return;
  }
  router.go(Destinations.home);
  await WidgetsBinding.instance.endOfFrame;
  unawaited(router.push(route));
}

/// Switches to [userId] before navigating, since otherwise the route resolves
/// under the wrong profile. Any gate or failure opens it under the current
/// user instead, so a link never ends up worse than it was.
Future<void> _switchUserAndNavigate(String route, String userId) async {
  final query = Uri.tryParse(route)?.queryParameters;
  final serverId = _resolveServerIdForUser(userId, query?['serverId']);
  if (serverId != null && _isHomeLink(route)) {
    // A home link is for landing on that user's Home, so it asks for what the
    // switch needs over Home rather than staying on the signed-in user.
    final outcome = await _switchWithPrompts(
      serverId,
      userId,
      beforePrompt: () => openLinkedRoute(appRouter, route),
    );
    switch (outcome) {
      case _SwitchOutcome.switched:
        // Home may already be showing the last user, and going to the same
        // place doesn't rebuild it, so this lands on Home through startup the
        // way the user menu does.
        appRouter.go('${Destinations.startup}?bootstrap=1');
      case _SwitchOutcome.declined:
        if (_currentPath() != Destinations.home) {
          unawaited(openLinkedRoute(appRouter, route));
        }
      case _SwitchOutcome.signingIn:
        break;
    }
    return;
  }
  // Kids Mode locks its way out behind a PIN, so a link can't switch away from
  // it either.
  if (serverId == null ||
      _switchBlocked(userId) ||
      GetIt.instance<UserPreferences>().get(UserPreferences.kidsModeEnabled)) {
    unawaited(openLinkedRoute(appRouter, route));
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
    unawaited(openLinkedRoute(appRouter, route));
    return;
  }

  // The switch rebuilds everything that follows the signed-in user, so the
  // navigation waits a frame rather than landing in the middle of that.
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => unawaited(openLinkedRoute(appRouter, route)),
  );
}

/// How a home link's switch to its user went.
enum _SwitchOutcome {
  switched,

  /// A dialog was closed, or Kids Mode has no PIN to leave it by, so the
  /// session is as it was.
  declined,

  /// The person was sent to sign in as that user, so nothing else navigates.
  signingIn,
}

/// Set while a home link is asking for something, so a second link can't
/// stack its own dialogs and race the first switch.
bool _switchingWithPrompts = false;

/// Switches to [userId] on [serverId] with the same checks as the user menu,
/// asking for whatever stands in the way: the Kids Mode PIN when the
/// signed-in user is in Kids Mode, the login when every sign in must
/// authenticate, then the user's sign in PIN and a locked Silo profile's PIN.
/// [beforePrompt] runs once, before the first thing is shown.
Future<_SwitchOutcome> _switchWithPrompts(
  String serverId,
  String userId, {
  Future<void> Function()? beforePrompt,
}) async {
  if (_switchingWithPrompts) return _SwitchOutcome.declined;
  _switchingWithPrompts = true;
  try {
    return await _askAndSwitch(serverId, userId, beforePrompt);
  } finally {
    _switchingWithPrompts = false;
  }
}

Future<_SwitchOutcome> _askAndSwitch(
  String serverId,
  String userId,
  Future<void> Function()? beforePrompt,
) async {
  const declined = _SwitchOutcome.declined;
  final getIt = GetIt.instance;
  final authStore = getIt<AuthenticationStore>();
  final server = authStore.getServer(serverId);
  final user = authStore
      .getUsers(serverId)
      .where((u) => u.id == userId)
      .firstOrNull;
  if (server == null || user == null) return declined;

  final store = getIt<PreferenceStore>();
  var prompted = false;
  Future<BuildContext?> promptContext() async {
    if (!prompted) {
      prompted = true;
      if (beforePrompt != null) {
        await beforePrompt();
        await WidgetsBinding.instance.endOfFrame;
      }
    }
    final context = appRouter.routerDelegate.navigatorKey.currentContext;
    return (context != null && context.mounted) ? context : null;
  }

  // Kids Mode locks its way out behind a PIN, so leaving it for another user
  // needs that PIN, and without one there is no way out from a link.
  final activeUserId = getIt<SessionRepository>().activeUserId;
  if (activeUserId != null &&
      getIt<UserPreferences>().get(UserPreferences.kidsModeEnabled)) {
    final kidsPin = PinCodeUtil.kidsMode(store, activeUserId);
    if (!kidsPin.isPinEnabled) return declined;
    final context = await promptContext();
    if (context == null || !context.mounted) return declined;
    final verified = await PinEntryDialog.show(
      context,
      mode: PinEntryMode.verify,
      onVerify: kidsPin.verifyPin,
      onFailedAttempt: kidsPin.registerFailedAttempt,
      lockoutRemaining: () => kidsPin.lockoutRemaining,
      title: AppLocalizations.of(context).kidsMode,
      subtitle: AppLocalizations.of(context).kidsModePinToSwitchUser(user.name),
    );
    if (!verified) return declined;
  }

  String loginRoute({bool resetPin = false}) => Uri(
    path: Destinations.login,
    queryParameters: {
      'serverId': serverId,
      'username': user.name,
      if (resetPin) 'resetPin': '1',
    },
  ).toString();

  if (getIt<AuthenticationPreferences>().shouldAlwaysAuthenticate) {
    appRouter.go(loginRoute());
    return _SwitchOutcome.signingIn;
  }

  final guard = PinGuard.forAccount(
    store: store,
    service: getIt<ServerPinService>(),
    userId: userId,
    server: server,
    accessToken: user.accessToken,
  );
  await guard.refresh();
  if (guard.pin.isPinEnabled) {
    final context = await promptContext();
    if (context == null || !context.mounted) return declined;
    var forgot = false;
    final verified = await PinEntryDialog.show(
      context,
      mode: PinEntryMode.verify,
      onVerifyAsync: guard.verify,
      onForgotPin: () {
        forgot = true;
        appRouter.go(loginRoute(resetPin: true));
      },
      title: AppLocalizations.of(context).switchToUser(user.name),
    );
    if (forgot) return _SwitchOutcome.signingIn;
    if (!verified) return declined;
  }

  if (user.siloHasPin) {
    final context = await promptContext();
    if (context == null || !context.mounted) return declined;
    if (!await unlockSiloProfileIfNeeded(context, server: server, user: user)) {
      return declined;
    }
  }

  var switched = false;
  try {
    await getIt<ServerRepository>().loadStoredServers();
    switched = await getIt<SessionRepository>().switchCurrentSession(
      serverId: serverId,
      userId: userId,
    );
  } catch (_) {
    switched = false;
  }
  if (switched) return _SwitchOutcome.switched;
  // No stored session to switch to, so sign in as that user, as the user menu
  // does.
  appRouter.go(loginRoute());
  return _SwitchOutcome.signingIn;
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
