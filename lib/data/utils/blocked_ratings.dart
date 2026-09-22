import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:get_it/get_it.dart';

import '../../preference/user_preferences.dart';
import '../../util/parental_filter.dart';
import '../models/aggregated_item.dart';

String? _cachedCsv;
ParentalFilter _cachedFilter = ParentalFilter.none;

/// The ratings the viewer blocked, as a filter.
///
/// Memoized on the stored string rather than on a listener, so a write through
/// the settings screen is picked up on the next call with no subscription to
/// keep alive. Parsing on every call would matter: the home screen builds its
/// rows through one function that's called twenty times a load.
ParentalFilter get activeParentalFilter {
  // No preferences means a test or a boot ordering this knows nothing about.
  // Blocking nothing is the only answer that can't blank the app.
  if (!GetIt.instance.isRegistered<UserPreferences>()) {
    return ParentalFilter.none;
  }
  final csv = GetIt.instance<UserPreferences>().get(
    UserPreferences.blockedParentalRatings,
  );
  if (csv == _cachedCsv) return _cachedFilter;
  _cachedCsv = csv;
  _cachedFilter = ParentalFilter.fromCsv(csv);
  return _cachedFilter;
}

@visibleForTesting
void resetParentalFilterCache() {
  _cachedCsv = null;
  _cachedFilter = ParentalFilter.none;
}

bool isRatingBlocked(String? rating) =>
    activeParentalFilter.isBlockedRating(rating);

bool _isItemBlocked(AggregatedItem item, {String? fallbackRating}) {
  final own = item.officialRating?.trim();
  return isRatingBlocked(
    own != null && own.isNotEmpty ? own : fallbackRating,
  );
}

/// [items] with the blocked ones dropped.
///
/// [fallbackRating] covers episodes, which usually carry no rating of their own
/// while the series does. An item's own rating always wins, so an episode rated
/// milder than its series is judged on its own.
List<AggregatedItem> withoutBlockedItems(
  List<AggregatedItem> items, {
  String? fallbackRating,
}) {
  final filter = activeParentalFilter;
  if (!filter.isActive) return items;
  return items
      .where((item) => !_isItemBlocked(item, fallbackRating: fallbackRating))
      .toList();
}
