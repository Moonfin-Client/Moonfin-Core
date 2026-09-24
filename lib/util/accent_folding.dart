/// Folds accented Latin letters onto the plain letter behind them, so that
/// searching for `canco` or `canço` still turns up `Cançó`.
///
/// The media server already does this for the searches it answers itself, so
/// anything matching locally has to fold too or the same query gives different
/// results depending on which box ran it.
library;

/// [value] with every accented letter this knows replaced by its base letter.
///
/// A letter it does not know is left exactly as it was, and the ones it does
/// know come back upper case, so read the result through [foldForSearch] or
/// case fold it yourself before comparing.
String foldAccents(String value) {
  final result = StringBuffer();
  for (final rune in value.runes) {
    final character = String.fromCharCode(rune);
    result.write(_accentFolds[character.toUpperCase()] ?? character);
  }
  return result.toString();
}

/// [value] folded and lower cased, ready to compare against other search text.
String foldForSearch(String value) => foldAccents(value).toLowerCase();

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
