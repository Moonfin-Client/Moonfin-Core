import '../models/aggregated_item.dart';

final _leadingLetter = RegExp(r'^[A-Z]');

/// What the alphabet strip sorts and matches on.
String alphabetSortKey(AggregatedItem item) =>
    (item.sortName ?? item.name).trim().toUpperCase();

/// Whether [item] belongs under [letter] on the alphabet strip. Anything not
/// starting with a letter files under the number bucket.
bool matchesAlphabetBucket(AggregatedItem item, String letter) {
  final name = alphabetSortKey(item);
  if (name.isEmpty) return false;
  if (letter == '#') return !_leadingLetter.hasMatch(name);
  return name.startsWith(letter.toUpperCase());
}
