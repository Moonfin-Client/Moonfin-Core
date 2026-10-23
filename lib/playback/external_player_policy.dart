import 'package:get_it/get_it.dart';

import '../data/models/aggregated_item.dart';
import '../preference/user_preferences.dart';
import '../syncplay/syncplay_manager.dart';
import '../util/platform_detection.dart';

class ExternalPlayerPolicy {
  static const Set<String> _supportedTypes = {
    'Movie',
    'Episode',
    'Video',
    'Series',
    'Season',
    'Recording',
    'TvChannel',
    'Program',
  };

  static const Set<String> _liveTvTypes = {'TvChannel', 'Program'};

  static bool isEligibleQueue(List<dynamic> items) {
    if (items.isEmpty) return false;
    return items.every(isEligibleItem);
  }

  static bool isEligibleItem(dynamic item) {
    if (item is! AggregatedItem) return false;

    final type = item.type;
    if (type == null || !_supportedTypes.contains(type)) return false;

    final mediaType =
        (item.rawData['MediaType'] as String?)?.trim().toLowerCase();
    if (mediaType == 'audio') return false;

    return true;
  }

  /// Whether the external player setting is on and in force here. A Live TV
  /// channel always qualifies once it is.
  static bool get isEnabled {
    if (!PlatformDetection.isAndroid) return false;
    final getIt = GetIt.instance;
    if (!getIt<UserPreferences>().get(UserPreferences.useExternalPlayer)) {
      return false;
    }
    return !getIt.isRegistered<SyncPlayManager>() ||
        !getIt<SyncPlayManager>().state.enabled;
  }

  /// Whether the external player setting sends [items] there on its own,
  /// as opposed to the viewer asking for the external player once.
  static bool coversQueue(List<dynamic> items) {
    if (!isEnabled || !isEligibleQueue(items)) return false;
    final prefs = GetIt.instance<UserPreferences>();
    return !prefs.get(UserPreferences.externalPlayerLiveTvOnly) ||
        items.every(
          (item) => _liveTvTypes.contains((item as AggregatedItem).type),
        );
  }
}
