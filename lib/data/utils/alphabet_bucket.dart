import '../../util/accent_folding.dart';
import '../models/aggregated_item.dart';

final _leadingLetter = RegExp(r'^[A-Z]');

/// What the alphabet strip sorts and matches on. Accents fold away first: an
/// accent does not make it a different word, so `Ángel` belongs under A rather
/// than in the number bucket with the symbols, which is where a viewer looking
/// for it would never think to check.
String alphabetSortKey(AggregatedItem item) =>
    foldAccents((item.sortName ?? item.name).trim()).toUpperCase();

/// Whether [item] belongs under [letter] on the alphabet strip. Anything not
/// starting with a letter files under the number bucket.
bool matchesAlphabetBucket(AggregatedItem item, String letter) {
  final name = alphabetSortKey(item);
  if (name.isEmpty) return false;
  if (letter == '#') return !_leadingLetter.hasMatch(name);
  return name.startsWith(letter.toUpperCase());
}
