/// Deciding whether an item is hidden by the viewer's blocked ratings.
///
/// Client side on purpose. The servers do expose `MaxOfficialRating` on their
/// item query, but only there, so resume, next up, episodes, similar items and
/// search would all go unfiltered. It also resolves against each server's own
/// table, so two servers disagree about the same tick, and it can't express
/// letting unrated content through.
library;

import 'parental_rating_severity.dart';

/// The ratings a viewer blocked, resolved into something an item can be tested
/// against.
///
/// Ticking a rating blocks it and everything at or above it, so the set someone
/// picked collapses to a single ceiling: the mildest severity they chose.
class ParentalFilter {
  /// Blocks nothing.
  static const ParentalFilter none = ParentalFilter._(
    literals: <String>{},
    ceiling: null,
  );

  /// Every rating that was ticked, trimmed and upper cased. Each is blocked by
  /// name whether or not the ladder can place it.
  final Set<String> literals;

  /// The mildest severity that was blocked, or null when nothing ticked could
  /// be placed on the ladder.
  final int? ceiling;

  const ParentalFilter._({required this.literals, required this.ceiling});

  factory ParentalFilter.fromRatings(Iterable<String> ratings) {
    final literals = <String>{};
    int? ceiling;
    for (final raw in ratings) {
      final normalized = raw.trim().toUpperCase();
      if (normalized.isEmpty) continue;
      literals.add(normalized);
      final severity = parentalRatingSeverity(normalized);
      // A label the ladder can't place says nothing about what else to hide, so
      // it only ever blocks itself. Letting it set the ceiling would put it
      // above every real rating and empty the library.
      if (!isRankedRatingSeverity(severity)) continue;
      if (ceiling == null || severity < ceiling) ceiling = severity;
    }
    if (literals.isEmpty) return none;
    return ParentalFilter._(literals: literals, ceiling: ceiling);
  }

  /// Parses the comma separated form the preference stores.
  factory ParentalFilter.fromCsv(String csv) =>
      ParentalFilter.fromRatings(csv.split(','));

  bool get isActive => literals.isNotEmpty;

  /// Whether an item carrying [rating] is hidden.
  bool isBlockedRating(String? rating) {
    final normalized = rating?.trim().toUpperCase() ?? '';
    // An item nobody rated is never hidden. A server with no rating on an item
    // can't be told apart from a server that rates nothing.
    if (normalized.isEmpty) return false;
    if (literals.contains(normalized)) return true;
    final severity = parentalRatingSeverity(normalized);
    if (!isRankedRatingSeverity(severity)) return false;
    final ceiling = this.ceiling;
    return ceiling != null && severity >= ceiling;
  }

  /// The same for a raw server map, which is what the media bar and the
  /// recommendation scorer hold instead of an item.
  bool isBlockedRaw(Map<String, dynamic> raw) =>
      isBlockedRating(raw['OfficialRating']?.toString());

  @override
  bool operator ==(Object other) =>
      other is ParentalFilter &&
      other.ceiling == ceiling &&
      other.literals.length == literals.length &&
      other.literals.containsAll(literals);

  @override
  int get hashCode => Object.hash(ceiling, literals.length);
}

/// Whether [candidate] is stronger than the item a recommendation row was built
/// from.
///
/// Separate from the blocked ratings filter, and deliberately stricter about
/// what it can't place: dropping a suggestion costs nothing, while hiding an
/// item costs someone access to content they own.
bool exceedsRatingCap(String? candidate, String? source) {
  final sourceSeverity = parentalRatingSeverity(source ?? '');
  // An item nobody rated can't set a cap.
  if (!isRankedRatingSeverity(sourceSeverity)) return false;
  final candidateSeverity = parentalRatingSeverity(candidate ?? '');
  if (!isRankedRatingSeverity(candidateSeverity)) return true;
  return candidateSeverity > sourceSeverity;
}
