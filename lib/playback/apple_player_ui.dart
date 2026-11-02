import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../data/services/cast/cast_service.dart';
import '../data/services/cast/cast_target.dart';
import '../preference/preference_constants.dart';
import '../preference/user_preferences.dart';
import '../util/platform_detection.dart';

/// Whether a video starting now should play through the native player instead
/// of the Flutter one.
///
/// The native player has no cast controls, so a video started while casting
/// keeps the Flutter player. An AirPlay route the system picked, from Control
/// Center, a HomePod or the native player's own picker, isn't casting though:
/// the native player plays to it itself. Only an AirPlay session Moonfin started
/// carries a cast item.
@visibleForTesting
bool decideNativeApplePlayer({
  required bool offersChoice,
  required ApplePlayerUi pref,
  required CastTargetKind? castKind,
  required bool hasCastItem,
}) {
  if (!offersChoice || pref != ApplePlayerUi.native) return false;
  if (castKind == null) return true;
  return castKind == CastTargetKind.airPlay && !hasCastItem;
}

/// Holds the choice a player route made, so every item that route plays goes
/// to the backend that matches the screen it shows.
///
/// The route picks its screen once, but the backend selector runs again for
/// every episode, so without this a cast session rejoining or a setting
/// changing mid queue would put the next episode on a backend nobody is
/// showing.
@visibleForTesting
class ApplePlayerChoiceLatch {
  ApplePlayerChoiceLatch(this._decide);

  final bool Function() _decide;
  Object? _owner;
  bool? _choice;

  /// The first build of a route decides, and rebuilds of it get the same
  /// answer.
  bool forRoute(Object routeKey) {
    if (_owner != routeKey) {
      _owner = routeKey;
      _choice = _decide();
    }
    return _choice!;
  }

  /// The route's choice while one is up, otherwise a fresh answer that isn't
  /// kept.
  bool current() => _choice ?? _decide();

  /// Only the route that made the choice clears it, so an old route removed
  /// after a new one was built can't take the new one's answer away.
  void release(Object? routeKey) {
    if (routeKey == null || routeKey != _owner) return;
    _owner = null;
    _choice = null;
  }
}

/// The platforms that let the viewer pick between the two players.
bool get offersApplePlayerChoice =>
    PlatformDetection.isIOS || PlatformDetection.isAppleTV;

bool _decideNow() {
  final getIt = GetIt.instance;
  final cast = getIt.isRegistered<CastService>() ? getIt<CastService>() : null;
  return decideNativeApplePlayer(
    offersChoice: offersApplePlayerChoice,
    pref: getIt<UserPreferences>().get(UserPreferences.applePlayerUi),
    castKind: cast?.activeKind,
    hasCastItem: cast?.castItemNotifier.value != null,
  );
}

final _latch = ApplePlayerChoiceLatch(_decideNow);

/// For the player routes' page builders, keyed by the page so a rebuild of the
/// same route never swaps its screen.
bool useNativeApplePlayerForRoute(Object routeKey) {
  if (!offersApplePlayerChoice) return false;
  return _latch.forRoute(routeKey);
}

/// For the backend selector and anything inside a player route. Follows the
/// route's choice while one is up.
bool useNativeApplePlayer() {
  if (!offersApplePlayerChoice) return false;
  return _latch.current();
}

/// What the native player is told about its transport buttons. Null off iOS,
/// where the television always docks them.
bool? nativeTransportDocked(UserPreferences prefs) => PlatformDetection.isIOS
    ? prefs.get(UserPreferences.playerTransportPosition) ==
          PlayerTransportPosition.docked
    : null;

/// Called when a player route leaves the navigator.
void releaseApplePlayerRoute(Object? routeKey) {
  if (!offersApplePlayerChoice) return;
  _latch.release(routeKey);
}
