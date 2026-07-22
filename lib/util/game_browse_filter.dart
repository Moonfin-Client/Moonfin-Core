/// Returns whether [title] matches the active game-library search and alphabet
/// filters. [alternateText] lets callers include the ROM filename without
/// changing the title used for alphabetical bucketing. Search terms match word
/// prefixes, so `river` matches `River Raid` but not `Night Driver`.
bool gameTitleMatchesBrowseFilters(
  String title, {
  String alternateText = '',
  String query = '',
  String letter = '',
}) {
  return GameBrowseTextIndex(
    title,
    alternateText: alternateText,
  ).matches(queryWords: gameBrowseQueryWords(query), letter: letter);
}

/// Search and sort data prepared once for an item in a game library.
///
/// Large systems can contain thousands of ROMs, so callers should retain this
/// object rather than repeatedly tokenizing titles on every search keystroke.
class GameBrowseTextIndex {
  GameBrowseTextIndex(String title, {String alternateText = ''})
    : searchWords = {..._searchWords(title), ..._searchWords(alternateText)},
      alphabeticalBucket = _alphabeticalBucket(title),
      sortKey = _foldForBrowse(title.trim()).toLowerCase();

  final Set<String> searchWords;
  final String alphabeticalBucket;
  final String sortKey;

  bool matches({required List<String> queryWords, String letter = ''}) {
    if (queryWords.isNotEmpty &&
        !queryWords.every(
          (term) => searchWords.any((word) => word.startsWith(term)),
        )) {
      return false;
    }
    return letter.isEmpty || alphabeticalBucket == letter.toUpperCase();
  }
}

/// Tokenizes a query once for use against prepared [GameBrowseTextIndex] data.
List<String> gameBrowseQueryWords(String query) => _searchWords(query.trim());

/// Breaks search text into words while retaining non-ASCII letters. Search
/// terms match word prefixes rather than arbitrary text inside another word.
List<String> _searchWords(String value) {
  return _foldForBrowse(value)
      .toLowerCase()
      .split(_wordSeparators)
      .where((word) => word.isNotEmpty)
      .toList(growable: false);
}

final RegExp _wordSeparators = RegExp(
  r'''[\s\-_./\\,:;!?()[\]{}'"+&\u2010-\u2015\u2018\u2019\u201c\u201d]+''',
);

String _alphabeticalBucket(String value) {
  final trimmed = value.trimLeft();
  if (trimmed.isEmpty) return '#';

  final initial = String.fromCharCode(trimmed.runes.first).toUpperCase();
  final folded = _accentFolds[initial] ?? initial;
  if (folded.length != 1) return '#';

  final unit = folded.codeUnitAt(0);
  return unit >= 0x41 && unit <= 0x5A ? folded : '#';
}

String _foldForBrowse(String value) {
  final result = StringBuffer();
  for (final rune in value.runes) {
    final character = String.fromCharCode(rune);
    result.write(_accentFolds[character.toUpperCase()] ?? character);
  }
  return result.toString();
}

const Map<String, String> _accentFolds = {
  'À': 'A',
  'Á': 'A',
  'Â': 'A',
  'Ã': 'A',
  'Ä': 'A',
  'Å': 'A',
  'Ā': 'A',
  'Ă': 'A',
  'Ą': 'A',
  'Æ': 'A',
  'Ç': 'C',
  'Ć': 'C',
  'Č': 'C',
  'Ð': 'D',
  'Ď': 'D',
  'Đ': 'D',
  'È': 'E',
  'É': 'E',
  'Ê': 'E',
  'Ë': 'E',
  'Ē': 'E',
  'Ė': 'E',
  'Ę': 'E',
  'Ě': 'E',
  'Ì': 'I',
  'Í': 'I',
  'Î': 'I',
  'Ï': 'I',
  'Ī': 'I',
  'Į': 'I',
  'Ł': 'L',
  'Ñ': 'N',
  'Ń': 'N',
  'Ň': 'N',
  'Ò': 'O',
  'Ó': 'O',
  'Ô': 'O',
  'Õ': 'O',
  'Ö': 'O',
  'Ø': 'O',
  'Ō': 'O',
  'Ő': 'O',
  'Ś': 'S',
  'Š': 'S',
  'Ş': 'S',
  'Þ': 'T',
  'Ù': 'U',
  'Ú': 'U',
  'Û': 'U',
  'Ü': 'U',
  'Ū': 'U',
  'Ů': 'U',
  'Ű': 'U',
  'Ý': 'Y',
  'Ÿ': 'Y',
  'Ź': 'Z',
  'Ž': 'Z',
  'Ż': 'Z',
};
