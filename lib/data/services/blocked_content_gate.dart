import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../preference/user_preferences.dart';
import '../models/aggregated_item.dart';
import '../offline/offline_catalog.dart';
import '../utils/blocked_ratings.dart';

/// Decides whether an item may be opened or played.
///
/// The list filters answer from a rating in hand. This has the harder job: an
/// episode usually carries no rating of its own while its series does, so the
/// series has to be found before the answer is known.
///
/// Fails open on genuine uncertainty. A server that rates nothing can't be told
/// apart from an item nobody rated, and blanking the app is worse than the gap.
/// The one exception is a series already seen carrying a blocked rating, which
/// stays blocked so a dropped connection can't undo a refusal.
class BlockedContentGate {
  final MediaServerClient _client;
  final UserPreferences _prefs;

  final Map<String, String?> _seriesRating = {};
  final Map<String, Future<String?>> _inFlight = {};

  BlockedContentGate(this._client, this._prefs);

  static const _lookupTimeout = Duration(seconds: 3);

  Set<String> get _stickyBlocked {
    final csv = _prefs.get(UserPreferences.blockedSeriesIds);
    if (csv.trim().isEmpty) return const {};
    return csv.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet();
  }

  /// Remembers any series rating the app happens to parse, so the common path
  /// never needs a lookup.
  void observe(AggregatedItem item) {
    if (item.type != 'Series') return;
    final rating = item.officialRating?.trim();
    if (item.id.isEmpty) return;
    _seriesRating[item.id] = (rating != null && rating.isNotEmpty) ? rating : null;
  }

  /// Answers from what is already in hand. No network, so a whole queue can be
  /// strained through it. A miss reads as allowed and is caught later by
  /// [isBlocked] for the one item about to play.
  bool isBlockedNow(AggregatedItem item) {
    final own = item.officialRating?.trim();
    if (own != null && own.isNotEmpty) return isRatingBlocked(own);

    final seriesId = item.seriesId;
    if (seriesId == null || seriesId.isEmpty) return false;
    if (_stickyBlocked.contains(seriesId)) return true;

    final cached = _seriesRating[seriesId] ?? _offlineSeriesRating(seriesId);
    return cached == null ? false : isRatingBlocked(cached);
  }

  /// The authoritative answer for the one item about to open or play. Resolves
  /// the series over the network when it has to.
  Future<bool> isBlocked(AggregatedItem item) async {
    final own = item.officialRating?.trim();
    if (own != null && own.isNotEmpty) return isRatingBlocked(own);

    final seriesId = item.seriesId;
    if (seriesId == null || seriesId.isEmpty) return false;

    final (rating, resolved) = await _resolveSeriesRating(seriesId);
    // A lookup that worked always wins, so unblocking a rating releases the
    // series rather than leaving it refused forever.
    if (resolved) {
      final blocked = rating != null && isRatingBlocked(rating);
      await _rememberSeries(seriesId, blocked: blocked);
      return blocked;
    }

    // Nothing to go on, so fall back to what this device last knew.
    return _stickyBlocked.contains(seriesId);
  }

  String? _offlineSeriesRating(String seriesId) {
    if (!GetIt.instance.isRegistered<OfflineCatalog>()) return null;
    final entry = GetIt.instance<OfflineCatalog>().byId(seriesId);
    final rating = entry?.metadata['OfficialRating']?.toString().trim();
    return (rating != null && rating.isNotEmpty) ? rating : null;
  }

  /// The series' rating, and whether the question could be answered at all.
  ///
  /// A lookup that failed isn't the same as a series with no rating, and
  /// conflating them would cache the failure for the rest of the session.
  Future<(String?, bool)> _resolveSeriesRating(String seriesId) async {
    if (_seriesRating.containsKey(seriesId)) {
      return (_seriesRating[seriesId], true);
    }
    final offline = _offlineSeriesRating(seriesId);
    if (offline != null) {
      _seriesRating[seriesId] = offline;
      return (offline, true);
    }

    // One request even when a whole season is queued.
    final pending = _inFlight[seriesId] ??= () async {
      final data = await _client.itemsApi
          .getItem(seriesId)
          .timeout(_lookupTimeout);
      final rating = data['OfficialRating']?.toString().trim();
      return (rating != null && rating.isNotEmpty) ? rating : null;
    }();

    try {
      final rating = await pending;
      _seriesRating[seriesId] = rating;
      return (rating, true);
    } catch (_) {
      return (null, false);
    } finally {
      _inFlight.remove(seriesId);
    }
  }

  Future<void> _rememberSeries(String seriesId, {required bool blocked}) async {
    final current = _stickyBlocked;
    if (blocked == current.contains(seriesId)) return;
    final next = current.toSet();
    if (blocked) {
      next.add(seriesId);
    } else {
      next.remove(seriesId);
    }
    await _prefs.set(UserPreferences.blockedSeriesIds, next.join(','));
  }
}
