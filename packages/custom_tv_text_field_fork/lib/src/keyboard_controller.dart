import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

enum KeyboardType { alphabetic, numeric }

enum InputPurpose { text, search, url, email, username, password, numeric }

/// Physical letter arrangement, picked from the app locale so French and
/// German speakers get the rows their muscle memory expects.
enum KeyboardLayoutVariant { qwerty, azerty, qwertz }

/// How text entry looks. [native] hands entry to the platform's own keyboard,
/// the rest draw the in-app keyboard. [docked] lays the keys out differently,
/// [classic] and [glass] share one layout.
enum KeyboardStyle { native, classic, glass, docked }

/// The few words the glass and docked keyboards draw. The app fills these
/// from its translations.
class KeyboardStrings {
  final String space;
  final String delete;
  final String search;
  final String done;
  final String holdForAccents;
  final String close;
  final String nativeStyle;
  final String classicStyle;
  final String glassStyle;
  final String dockedStyle;

  const KeyboardStrings({
    this.space = 'space',
    this.delete = 'Delete',
    this.search = 'Search',
    this.done = 'Done',
    this.holdForAccents = 'hold for accents',
    this.close = 'close',
    this.nativeStyle = 'Native',
    this.classicStyle = 'Classic',
    this.glassStyle = 'Glass',
    this.dockedStyle = 'Docked',
  });

  String styleName(KeyboardStyle style) => switch (style) {
    KeyboardStyle.native => nativeStyle,
    KeyboardStyle.classic => classicStyle,
    KeyboardStyle.glass => glassStyle,
    KeyboardStyle.docked => dockedStyle,
  };
}

typedef KeyboardSuggestionBuilder = Future<List<String>> Function(String query);

class KeyboardController extends ChangeNotifier {
  String _text = '';
  int _cursor = 0;

  String get text => _text;

  /// Caret position in code units, 0 to text.length.
  int get cursor => _cursor;

  bool _isVisible = false;

  bool get isVisible => _isVisible;

  Function(String)? onTextChanged;
  Function(bool shouldPop)? onKeyboardClosed;
  VoidCallback? onRequestSystemKeyboard;

  KeyboardStyle _style = KeyboardStyle.classic;

  KeyboardStyle get style => _style;

  set style(KeyboardStyle value) {
    if (value == _style) return;
    _style = value;
    notifyListeners();
  }

  /// Set while a keyboard is open. Closes its accents or style popup and
  /// reports whether one was open, so Back can close that first.
  bool Function()? dismissPopup;

  void _commit() {
    notifyListeners();
    onTextChanged?.call(_text);
  }

  /// Length of the character ending at [index], so a surrogate pair is
  /// deleted and stepped over as one unit.
  int _stepBefore(int index) {
    if (index >= 2 &&
        _isLowSurrogate(_text.codeUnitAt(index - 1)) &&
        _isHighSurrogate(_text.codeUnitAt(index - 2))) {
      return 2;
    }
    return 1;
  }

  int _stepAfter(int index) {
    if (index <= _text.length - 2 &&
        _isHighSurrogate(_text.codeUnitAt(index)) &&
        _isLowSurrogate(_text.codeUnitAt(index + 1))) {
      return 2;
    }
    return 1;
  }

  static bool _isHighSurrogate(int codeUnit) =>
      codeUnit >= 0xD800 && codeUnit <= 0xDBFF;

  static bool _isLowSurrogate(int codeUnit) =>
      codeUnit >= 0xDC00 && codeUnit <= 0xDFFF;

  void addCharacter(String character) => insertText(character);

  void insertText(String value) {
    if (value.isEmpty) return;
    _text = _text.substring(0, _cursor) + value + _text.substring(_cursor);
    _cursor += value.length;
    _commit();
  }

  void backspace() {
    if (_cursor == 0) return;
    final step = _stepBefore(_cursor);
    _text = _text.substring(0, _cursor - step) + _text.substring(_cursor);
    _cursor -= step;
    _commit();
  }

  void clear() {
    if (_text.isEmpty && _cursor == 0) return;
    _text = '';
    _cursor = 0;
    _commit();
  }

  void addSpace() => insertText(' ');

  void moveCursor(int direction) {
    final next = direction < 0
        ? _cursor - (_cursor > 0 ? _stepBefore(_cursor) : 0)
        : _cursor + (_cursor < _text.length ? _stepAfter(_cursor) : 0);
    if (next == _cursor) return;
    _cursor = next;
    // The text is unchanged, so listeners repaint but the field's
    // onTextChanged callback stays quiet.
    notifyListeners();
  }

  void setText(String value) {
    _text = value;
    _cursor = value.length;
    _commit();
  }

  void requestSystemKeyboard() {
    onRequestSystemKeyboard?.call();
  }

  void show() {
    _isVisible = true;
    notifyListeners();
  }

  void hide(bool shouldPop) {
    _isVisible = false;
    notifyListeners();
    onKeyboardClosed?.call(shouldPop);
  }

  void toggle() => _isVisible ? hide(true) : show();
}

class KeyboardLayouts {
  /// Shared bottom row: type switch, the two characters worth a dedicated
  /// key everywhere, space, caret movement, paste, system keyboard, done.
  static const List<String> _bottomRow = [
    '123',
    '@',
    '.',
    'SPACE',
    'CURSORL',
    'CURSORR',
    'PASTE',
    'IME',
    'DONE',
  ];

  static const List<List<String>> _lowerQwerty = [
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', "'"],
    ['SHIFT', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', 'BACKSPACE'],
    _bottomRow,
  ];

  static const List<List<String>> _lowerAzerty = [
    ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['q', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm'],
    ['SHIFT', 'w', 'x', 'c', 'v', 'b', 'n', "'", ',', 'BACKSPACE'],
    _bottomRow,
  ];

  static const List<List<String>> _lowerQwertz = [
    ['q', 'w', 'e', 'r', 't', 'z', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', "'"],
    ['SHIFT', 'y', 'x', 'c', 'v', 'b', 'n', 'm', ',', 'BACKSPACE'],
    _bottomRow,
  ];

  static const List<List<String>> numeric = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['!', '@', '#', r'$', '%', '^', '&', '*', '(', ')'],
    ['-', '_', '=', '+', ';', ':', "'", '?', '/', 'BACKSPACE'],
    ['ABC', ',', '.', 'SPACE', 'CURSORL', 'CURSORR', 'PASTE', 'IME', 'DONE'],
  ];

  /// Large targets for PINs and ports, phone dialer arrangement.
  static const List<List<String>> numberPad = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', 'BACKSPACE'],
    ['CURSORL', 'CURSORR', 'DONE'],
  ];

  static const List<String> _dockedBottomRow = [
    'IME',
    'SPACE',
    'SPACE',
    'SPACE',
    'SPACE',
    'SPACE',
    'SPACE',
    'SPACE',
    'CURSORL',
    'CURSORR',
    'PASTE',
    'DONE',
  ];

  /// Docked rows are twelve cells: the mode rail, ten characters and the
  /// action column. A key repeated in neighboring cells is one key spanning
  /// them, so Delete and Done each cover two rows and space covers seven
  /// columns. The semicolon is left out, it sits behind ':' and ','.
  static const List<List<String>> dockedNumeric = [
    ['MODE_LOWER', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'BACKSPACE'],
    ['MODE_UPPER', '!', '@', '#', r'$', '%', '^', '&', '*', '(', ')', 'BACKSPACE'],
    ['MODE_NUM', '-', '_', '=', '+', ':', "'", '?', '/', ',', '.', 'DONE'],
    _dockedBottomRow,
  ];

  static final Map<KeyboardLayoutVariant, List<List<String>>> _upperCache = {};
  static final Map<(KeyboardLayoutVariant, bool), List<List<String>>>
  _dockedCache = {};

  static List<List<String>> dockedFor(
    KeyboardLayoutVariant variant, {
    required bool shifted,
  }) {
    return _dockedCache.putIfAbsent((variant, shifted), () {
      final rows = shifted ? upperFor(variant) : lowerFor(variant);
      return [
        ['MODE_LOWER', ...rows[0], 'BACKSPACE'],
        ['MODE_UPPER', ...rows[1], 'BACKSPACE'],
        ['MODE_NUM', ...rows[2].sublist(1, rows[2].length - 1), '.', '@', 'DONE'],
        _dockedBottomRow,
      ];
    });
  }

  static List<List<String>> lowerFor(KeyboardLayoutVariant variant) {
    switch (variant) {
      case KeyboardLayoutVariant.qwerty:
        return _lowerQwerty;
      case KeyboardLayoutVariant.azerty:
        return _lowerAzerty;
      case KeyboardLayoutVariant.qwertz:
        return _lowerQwertz;
    }
  }

  static List<List<String>> upperFor(KeyboardLayoutVariant variant) {
    return _upperCache.putIfAbsent(
      variant,
      () => lowerFor(variant)
          .map((row) => row.map(_shiftKey).toList(growable: false))
          .toList(growable: false),
    );
  }

  static String _shiftKey(String key) {
    if (key.length > 1) return key;
    if (key == "'") return '"';
    return key.toUpperCase();
  }

  static bool hasAlternates(String key) =>
      (alternateCharacters[key]?.length ?? 0) > 1;

  static KeyboardLayoutVariant variantForLocale(Locale? locale) {
    switch (locale?.languageCode) {
      case 'fr':
        return KeyboardLayoutVariant.azerty;
      case 'de':
      case 'cs':
      case 'sk':
      case 'hu':
      case 'hr':
      case 'sl':
        return KeyboardLayoutVariant.qwertz;
      default:
        return KeyboardLayoutVariant.qwerty;
    }
  }

  static const Map<String, List<String>> alternateCharacters = {
    'a': ['a', 'à', 'á', 'â', 'ä', 'ã', 'å', 'æ'],
    'A': ['A', 'À', 'Á', 'Â', 'Ä', 'Ã', 'Å', 'Æ'],
    'c': ['c', 'ç'],
    'C': ['C', 'Ç'],
    'e': ['e', 'è', 'é', 'ê', 'ë', 'ē'],
    'E': ['E', 'È', 'É', 'Ê', 'Ë', 'Ē'],
    'i': ['i', 'ì', 'í', 'î', 'ï', 'ī'],
    'I': ['I', 'Ì', 'Í', 'Î', 'Ï', 'Ī'],
    'n': ['n', 'ñ'],
    'N': ['N', 'Ñ'],
    'o': ['o', 'ò', 'ó', 'ô', 'ö', 'õ', 'ø', 'œ'],
    'O': ['O', 'Ò', 'Ó', 'Ô', 'Ö', 'Õ', 'Ø', 'Œ'],
    's': ['s', 'ß', 'ś', 'š'],
    'S': ['S', 'Ś', 'Š'],
    'u': ['u', 'ù', 'ú', 'û', 'ü', 'ū'],
    'U': ['U', 'Ù', 'Ú', 'Û', 'Ü', 'Ū'],
    'y': ['y', 'ý', 'ÿ'],
    'Y': ['Y', 'Ý', 'Ÿ'],
    'z': ['z', 'ž', 'ź', 'ż'],
    'Z': ['Z', 'Ž', 'Ź', 'Ż'],
    '.': ['.', '!', '?', ',', ';', ':'],
    ',': [',', ';', ':'],
    '?': ['?', '!', '¿', '¡'],
    '!': ['!', '¡'],
    '-': ['-', '_', '–', '—'],
    '_': ['_', '-'],
    '@': ['@', '.com', '.net', '.org'],
    '"': ['"', "'"],
    "'": ["'", '"'],
    '(': ['(', '[', '{', '<'],
    ')': [')', ']', '}', '>'],
    '/': ['/', r'\', '|'],
    '=': ['=', '~', '≠'],
    ':': [':', ';'],
  };
}

class _KeyboardChip {
  final String label;
  final String value;
  final bool submitOnTap;
  final bool replaceOnTap;

  const _KeyboardChip({
    required this.label,
    required this.value,
    this.submitOnTap = false,
    this.replaceOnTap = false,
  });
}

class CustomKeyboard extends StatefulWidget {
  static KeyboardStrings strings = const KeyboardStrings();

  /// The app saves a style picked from the keyboard's own picker.
  static ValueChanged<KeyboardStyle>? onStylePicked;

  final KeyboardController keyboardController;
  final KeyboardType keyboardType;
  final InputPurpose inputPurpose;
  final FocusNode focusNode;
  final KeyboardSuggestionBuilder? suggestionsBuilder;
  final List<String> recentSuggestions;
  final bool obscureText;

  const CustomKeyboard({
    super.key,
    required this.keyboardController,
    required this.focusNode,
    this.keyboardType = KeyboardType.alphabetic,
    this.inputPurpose = InputPurpose.text,
    this.suggestionsBuilder,
    this.recentSuggestions = const [],
    this.obscureText = false,
  });

  @override
  State<CustomKeyboard> createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final ValueNotifier<int> _selectedRow = ValueNotifier<int>(0);
  final ValueNotifier<int> _selectedCol = ValueNotifier<int>(0);
  final ValueNotifier<int> _selectedChip = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isShifted = ValueNotifier<bool>(false);
  late final ValueNotifier<KeyboardType> _activeType;
  final ValueNotifier<List<String>?> _alternateOptions =
      ValueNotifier<List<String>?>(null);
  final ValueNotifier<int> _alternateIndex = ValueNotifier<int>(0);
  final ValueNotifier<int?> _styleChoice = ValueNotifier<int?>(null);

  bool _pendingAlternateSelect = false;
  bool _alternateAwaitingSelectRelease = false;

  // The app's back handler sees each Back before this keyboard does. When it
  // closes a popup, the same press reaching here must not close the keyboard.
  bool _backClosedPopup = false;

  KeyboardLayoutVariant _layoutVariant = KeyboardLayoutVariant.qwerty;

  Timer? _suggestionsDebounce;
  int _suggestionRequestGeneration = 0;
  String _lastControllerText = '';
  List<String> _searchSuggestions = const [];

  String get _selectedKey => _selectedRow.value < 0
      ? ''
      : _currentLayout[_selectedRow.value][_selectedCol.value];

  bool get _usesNumberPad => widget.inputPurpose == InputPurpose.numeric;

  KeyboardStyle get _style => widget.keyboardController.style;

  bool get _isDocked => _style == KeyboardStyle.docked;

  List<List<String>> get _currentLayout {
    if (_usesNumberPad) {
      return KeyboardLayouts.numberPad;
    }
    if (_isDocked) {
      return _activeType.value == KeyboardType.numeric
          ? KeyboardLayouts.dockedNumeric
          : KeyboardLayouts.dockedFor(
              _layoutVariant,
              shifted: _isShifted.value,
            );
    }
    if (_activeType.value == KeyboardType.numeric) {
      return KeyboardLayouts.numeric;
    }
    return _isShifted.value
        ? KeyboardLayouts.upperFor(_layoutVariant)
        : KeyboardLayouts.lowerFor(_layoutVariant);
  }

  /// Recent entries as chips, filtered down as typing narrows them.
  List<_KeyboardChip> _recentChips({
    bool submitOnTap = false,
    bool replaceOnTap = false,
  }) {
    final query = widget.keyboardController.text.trim().toLowerCase();
    final unique = <String>[];
    final seen = <String>{};

    for (final entry in widget.recentSuggestions) {
      final value = entry.trim();
      if (value.isEmpty) continue;
      final normalized = value.toLowerCase();
      if (normalized == query) continue;
      if (query.isNotEmpty && !normalized.contains(query)) continue;
      if (seen.add(normalized)) {
        unique.add(value);
      }
      if (unique.length >= 5) break;
    }

    return unique
        .map(
          (value) => _KeyboardChip(
            label: value,
            value: value,
            submitOnTap: submitOnTap,
            replaceOnTap: replaceOnTap,
          ),
        )
        .toList(growable: false);
  }

  List<_KeyboardChip> get _contextChips {
    switch (widget.inputPurpose) {
      case InputPurpose.url:
        return [
          ..._recentChips(replaceOnTap: true),
          const _KeyboardChip(label: 'https://', value: 'https://'),
          const _KeyboardChip(label: 'http://', value: 'http://'),
          const _KeyboardChip(label: 'www.', value: 'www.'),
          const _KeyboardChip(label: 'jellyfin', value: 'jellyfin'),
          const _KeyboardChip(label: '.com', value: '.com'),
          const _KeyboardChip(label: '.org', value: '.org'),
          const _KeyboardChip(label: '.net', value: '.net'),
          const _KeyboardChip(label: ':8096', value: ':8096'),
          const _KeyboardChip(label: '/', value: '/'),
        ];
      case InputPurpose.email:
        return const [
          _KeyboardChip(label: '@gmail.com', value: '@gmail.com'),
          _KeyboardChip(label: '@outlook.com', value: '@outlook.com'),
          _KeyboardChip(label: '@icloud.com', value: '@icloud.com'),
          _KeyboardChip(label: '@yahoo.com', value: '@yahoo.com'),
          _KeyboardChip(label: '.com', value: '.com'),
          _KeyboardChip(label: '.', value: '.'),
        ];
      case InputPurpose.username:
        // Picking a remembered name fills the field and moves on, the same
        // flow as tapping a search suggestion.
        return _recentChips(submitOnTap: true);
      case InputPurpose.search:
        final query = widget.keyboardController.text.trim();
        final source = query.isEmpty
            ? widget.recentSuggestions
            : _searchSuggestions;
        final unique = <String>[];
        final seen = <String>{};

        for (final entry in source) {
          final value = entry.trim();
          if (value.isEmpty) continue;
          final normalized = value.toLowerCase();
          if (normalized == query.toLowerCase()) continue;
          if (seen.add(normalized)) {
            unique.add(value);
          }
          if (unique.length >= 5) break;
        }

        return unique
            .map(
              (value) =>
                  _KeyboardChip(label: value, value: value, submitOnTap: true),
            )
            .toList(growable: false);
      case InputPurpose.text:
      // Passwords never surface stored values on screen.
      case InputPurpose.password:
      case InputPurpose.numeric:
        return const [];
    }
  }

  @override
  void initState() {
    super.initState();
    _activeType = ValueNotifier<KeyboardType>(widget.keyboardType);
    _selectedCol.value = _homeCol;
    widget.keyboardController.dismissPopup = _dismissPopup;
    _lastControllerText = widget.keyboardController.text;
    widget.keyboardController.addListener(_onControllerTextChanged);
    _refreshSearchSuggestions(immediate: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final variant = KeyboardLayouts.variantForLocale(
      Localizations.maybeLocaleOf(context),
    );
    if (variant != _layoutVariant) {
      _layoutVariant = variant;
      _resetSelection();
    }
  }

  @override
  void didUpdateWidget(CustomKeyboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keyboardType != widget.keyboardType) {
      _activeType.value = widget.keyboardType;
      _resetSelection();
    }

    final inputPurposeChanged = oldWidget.inputPurpose != widget.inputPurpose;
    final suggestionsBuilderChanged =
        oldWidget.suggestionsBuilder != widget.suggestionsBuilder;
    final recentsChanged = !listEquals(
      oldWidget.recentSuggestions,
      widget.recentSuggestions,
    );

    if (inputPurposeChanged || suggestionsBuilderChanged || recentsChanged) {
      _refreshSearchSuggestions(immediate: true);
      if (_selectedRow.value < 0 && _contextChips.isEmpty) {
        _selectedRow.value = 0;
      }
    }
  }

  void _onControllerTextChanged() {
    final next = widget.keyboardController.text;
    if (next == _lastControllerText) return;
    _lastControllerText = next;

    _refreshSearchSuggestions();

    if (_selectedRow.value < 0 && _contextChips.isEmpty) {
      _selectedRow.value = 0;
    }
  }

  void _refreshSearchSuggestions({bool immediate = false}) {
    if (widget.inputPurpose != InputPurpose.search ||
        widget.suggestionsBuilder == null) {
      _suggestionsDebounce?.cancel();
      _suggestionRequestGeneration++;
      if (_searchSuggestions.isNotEmpty) {
        setState(() => _searchSuggestions = const []);
      }
      return;
    }

    final query = widget.keyboardController.text.trim();
    if (query.isEmpty) {
      _suggestionRequestGeneration++;
      if (_searchSuggestions.isNotEmpty) {
        setState(() => _searchSuggestions = const []);
      }
      _suggestionsDebounce?.cancel();
      return;
    }

    _suggestionsDebounce?.cancel();

    Future<void> runFetch() async {
      final generation = ++_suggestionRequestGeneration;
      try {
        final results = await widget.suggestionsBuilder!.call(query);
        if (!mounted || generation != _suggestionRequestGeneration) return;

        final normalized = <String>[];
        final seen = <String>{};
        for (final result in results) {
          final value = result.trim();
          if (value.isEmpty) continue;
          final key = value.toLowerCase();
          if (key == query.toLowerCase()) continue;
          if (seen.add(key)) {
            normalized.add(value);
          }
          if (normalized.length >= 5) break;
        }

        setState(() {
          _searchSuggestions = normalized;
        });
      } catch (_) {
        if (!mounted || generation != _suggestionRequestGeneration) return;
        setState(() {
          _searchSuggestions = const [];
        });
      }
    }

    if (immediate) {
      runFetch();
      return;
    }

    _suggestionsDebounce = Timer(const Duration(milliseconds: 280), runFetch);
  }

  // Docked opens on the first letter rather than the mode rail beside it.
  int get _homeCol => _isDocked && !_usesNumberPad ? 1 : 0;

  void _resetSelection() {
    _selectedRow.value = 0;
    _selectedCol.value = _homeCol;
    _selectedChip.value = 0;
  }

  void _switchType() {
    _activeType.value = _activeType.value == KeyboardType.alphabetic
        ? KeyboardType.numeric
        : KeyboardType.alphabetic;
    _isShifted.value = false;
    _dismissAlternates();
    _resetSelection();
  }

  void _onMove(int dRow, int dCol) {
    final chips = _contextChips;

    if (_selectedRow.value < 0) {
      if (dRow > 0) {
        _selectedRow.value = 0;
        _selectedCol.value = _selectedCol.value.clamp(
          0,
          _currentLayout[0].length - 1,
        );
        return;
      }

      if (dCol != 0 && chips.isNotEmpty) {
        final rowLength = chips.length;
        var nextChip = (_selectedChip.value + dCol) % rowLength;
        if (nextChip < 0) nextChip += rowLength;
        _selectedChip.value = nextChip;
      }
      return;
    }

    final layout = _currentLayout;
    final row = _selectedRow.value;
    final col = _selectedCol.value;
    final key = layout[row][col];
    int nextRow = row;
    int nextCol = col;

    // A key repeated in neighboring cells is one key spanning them (docked
    // Delete, Done and space), so a move steps past the rest of its cells.
    if (dRow != 0) {
      do {
        nextRow += dRow;
      } while (nextRow >= 0 &&
          nextRow < layout.length &&
          layout[nextRow][col.clamp(0, layout[nextRow].length - 1)] == key);

      if (nextRow < 0 && chips.isNotEmpty) {
        _selectedRow.value = -1;
        _selectedChip.value = _selectedChip.value.clamp(0, chips.length - 1);
        _dismissAlternates();
        return;
      }
      nextRow = nextRow.clamp(0, layout.length - 1);
      nextCol = col.clamp(0, layout[nextRow].length - 1);
    } else {
      final int rowLength = layout[row].length;
      do {
        nextCol = (nextCol + dCol) % rowLength;
        if (nextCol < 0) nextCol += rowLength;
      } while (layout[row][nextCol] == key && nextCol != col);
    }

    _selectedRow.value = nextRow;
    _selectedCol.value = nextCol;

    if (_alternateOptions.value != null) {
      _dismissAlternates();
    }
  }

  void _onAction() {
    if (_selectedRow.value < 0) {
      final chips = _contextChips;
      if (chips.isEmpty) return;

      final chipIndex = _selectedChip.value.clamp(0, chips.length - 1);
      final chip = chips[chipIndex];
      if (chip.submitOnTap || chip.replaceOnTap) {
        widget.keyboardController.setText(chip.value);
      } else {
        widget.keyboardController.insertText(chip.value);
      }
      if (chip.submitOnTap) {
        widget.keyboardController.hide(true);
      }
      return;
    }

    final key = _currentLayout[_selectedRow.value][_selectedCol.value];
    final controller = widget.keyboardController;

    switch (key) {
      case 'BACKSPACE':
        controller.backspace();
        break;
      case 'SPACE':
        controller.addSpace();
        break;
      case 'SHIFT':
        _isShifted.value = !_isShifted.value;
        break;
      case 'CURSORL':
        controller.moveCursor(-1);
        break;
      case 'CURSORR':
        controller.moveCursor(1);
        break;
      case 'PASTE':
        _pasteFromClipboard();
        break;
      case 'DONE':
        controller.hide(true);
        break;
      case '123':
      case 'ABC':
        _switchType();
        break;
      case 'MODE_LOWER':
      case 'MODE_UPPER':
      case 'MODE_NUM':
        // Every docked layout has the same shape, so focus stays on the rail.
        _activeType.value = key == 'MODE_NUM'
            ? KeyboardType.numeric
            : KeyboardType.alphabetic;
        _isShifted.value = key == 'MODE_UPPER';
        break;
      case 'IME':
        _styleChoice.value = _style.index;
        break;
      default:
        controller.addCharacter(key);
        break;
    }
  }

  Future<void> _pasteFromClipboard() async {
    String? value;
    try {
      value = (await Clipboard.getData(Clipboard.kTextPlain))?.text;
    } catch (_) {
      return;
    }
    if (!mounted || value == null) return;
    // Line breaks have no home in a single line field, and clipboard
    // managers love trailing ones.
    final sanitized = value
        .replaceAll(RegExp(r'[\r\n]+$'), '')
        .replaceAll(RegExp(r'[\r\n]+'), ' ');
    if (sanitized.isEmpty) return;
    widget.keyboardController.insertText(sanitized);
  }

  List<String>? _alternatesForKey(String key) =>
      KeyboardLayouts.alternateCharacters[key];

  bool _openAlternatesForKey(String key) {
    final options = _alternatesForKey(key);
    if (options == null || options.isEmpty) return false;
    _alternateOptions.value = options;
    _alternateIndex.value = 0;
    _alternateAwaitingSelectRelease = true;
    return true;
  }

  void _pickStyle(KeyboardStyle style) {
    _styleChoice.value = null;
    CustomKeyboard.onStylePicked?.call(style);
    widget.keyboardController.style = style;
    if (style == KeyboardStyle.native) {
      widget.keyboardController.requestSystemKeyboard();
      return;
    }
    _resetSelection();
  }

  bool _dismissPopup() {
    if (_styleChoice.value != null) {
      _styleChoice.value = null;
    } else if (_alternateOptions.value != null) {
      _dismissAlternates();
    } else {
      return false;
    }
    _backClosedPopup = true;
    return true;
  }

  void _dismissAlternates() {
    _alternateOptions.value = null;
    _alternateIndex.value = 0;
    _alternateAwaitingSelectRelease = false;
  }

  void _commitAlternateSelection() {
    final options = _alternateOptions.value;
    if (options == null || options.isEmpty) return;
    widget.keyboardController.addCharacter(options[_alternateIndex.value]);
    _dismissAlternates();
  }

  void _handleAlternateMove(int delta) {
    final options = _alternateOptions.value;
    if (options == null || options.isEmpty) return;

    final next = (_alternateIndex.value + delta) % options.length;
    _alternateIndex.value = next < 0 ? next + options.length : next;
  }

  /// Keys that act again on every repeat while select is held down.
  bool get _selectedKeyRepeats {
    final key = _selectedKey;
    return key == 'BACKSPACE' || key == 'CURSORL' || key == 'CURSORR';
  }

  void _startSelectHold() {
    if (_selectedRow.value < 0) {
      _onAction();
      return;
    }

    final key = _selectedKey;
    if (_alternatesForKey(key) == null) {
      _onAction();
      return;
    }

    _pendingAlternateSelect = true;
  }

  void _finishSelectHold() {
    final shouldCommitBaseKey = _pendingAlternateSelect;
    _cancelSelectHold();
    if (shouldCommitBaseKey) {
      _onAction();
    }
  }

  void _cancelSelectHold() {
    _pendingAlternateSelect = false;
  }

  KeyEventResult _handleKey(KeyEvent event) {
    if (event is KeyDownEvent && _backClosedPopup) {
      _backClosedPopup = false;
      final key = event.logicalKey;
      if (key == LogicalKeyboardKey.escape ||
          key == LogicalKeyboardKey.exit ||
          key == LogicalKeyboardKey.goBack) {
        return KeyEventResult.handled;
      }
    }
    final choice = _styleChoice.value;
    if (choice != null) {
      // The release of the press that opened the picker lands here too, so
      // only fresh presses act.
      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.handled;
      }
      final key = event.logicalKey;
      final last = KeyboardStyle.values.length - 1;
      if (key == LogicalKeyboardKey.arrowUp ||
          key == LogicalKeyboardKey.arrowLeft) {
        _styleChoice.value = (choice - 1).clamp(0, last);
      } else if (key == LogicalKeyboardKey.arrowDown ||
          key == LogicalKeyboardKey.arrowRight) {
        _styleChoice.value = (choice + 1).clamp(0, last);
      } else if ((key == LogicalKeyboardKey.enter ||
              key == LogicalKeyboardKey.select) &&
          event is KeyDownEvent) {
        _pickStyle(KeyboardStyle.values[choice]);
      } else if (key == LogicalKeyboardKey.escape ||
          key == LogicalKeyboardKey.exit ||
          key == LogicalKeyboardKey.goBack) {
        _styleChoice.value = null;
      }
      return KeyEventResult.handled;
    }

    if (_alternateOptions.value != null) {
      if (event is! KeyDownEvent &&
          event is! KeyRepeatEvent &&
          event is! KeyUpEvent) {
        return KeyEventResult.ignored;
      }

      if (event is KeyUpEvent &&
          (event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.select)) {
        if (_alternateAwaitingSelectRelease) {
          _alternateAwaitingSelectRelease = false;
          return KeyEventResult.handled;
        }
        return KeyEventResult.handled;
      }

      if (event is KeyUpEvent &&
          (event.logicalKey == LogicalKeyboardKey.escape ||
              event.logicalKey == LogicalKeyboardKey.exit ||
              event.logicalKey == LogicalKeyboardKey.goBack)) {
        return KeyEventResult.handled;
      }

      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _handleAlternateMove(-1);
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _handleAlternateMove(-1);
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _handleAlternateMove(1);
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _handleAlternateMove(1);
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.select) {
        if (_alternateAwaitingSelectRelease) {
          return KeyEventResult.handled;
        }
        _commitAlternateSelection();
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.escape ||
          event.logicalKey == LogicalKeyboardKey.exit ||
          event.logicalKey == LogicalKeyboardKey.goBack) {
        _dismissAlternates();
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.escape ||
          event.logicalKey == LogicalKeyboardKey.exit ||
          event.logicalKey == LogicalKeyboardKey.goBack) {
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.select) {
        _finishSelectHold();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      widget.keyboardController.backspace();
      return KeyEventResult.handled;
    }

    final handlers = {
      LogicalKeyboardKey.arrowUp: () => _onMove(-1, 0),
      LogicalKeyboardKey.arrowDown: () => _onMove(1, 0),
      LogicalKeyboardKey.arrowLeft: () => _onMove(0, -1),
      LogicalKeyboardKey.arrowRight: () => _onMove(0, 1),
      LogicalKeyboardKey.escape: () {
        _cancelSelectHold();
        widget.keyboardController.hide(false);
      },
      LogicalKeyboardKey.exit: () {
        _cancelSelectHold();
        widget.keyboardController.hide(false);
      },
      LogicalKeyboardKey.goBack: () {
        _cancelSelectHold();
        widget.keyboardController.hide(false);
      },
    };

    if ((event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.select) &&
        event is KeyDownEvent) {
      _startSelectHold();
      return KeyEventResult.handled;
    }

    if ((event.logicalKey == LogicalKeyboardKey.enter ||
            event.logicalKey == LogicalKeyboardKey.select) &&
        event is KeyRepeatEvent) {
      if (_pendingAlternateSelect && _selectedRow.value >= 0) {
        _pendingAlternateSelect = false;
        _openAlternatesForKey(_selectedKey);
      } else if (_selectedRow.value >= 0 && _selectedKeyRepeats) {
        _onAction();
      }
      return KeyEventResult.handled;
    }

    if (handlers.containsKey(event.logicalKey)) {
      handlers[event.logicalKey]?.call();
      return KeyEventResult.handled;
    }

    final character = event.character;
    if (character != null && character.isNotEmpty) {
      final charCode = character.codeUnitAt(0);
      if ((charCode >= 32 && charCode <= 126) || charCode > 127) {
        widget.keyboardController.addCharacter(character);
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  _KeyboardPalette _paletteFor(ThemeData theme) {
    final accent = AppColorScheme.accent;
    final accentText = Color.lerp(accent, Colors.white, 0.55)!;

    switch (_style) {
      case KeyboardStyle.glass:
        return _KeyboardPalette(
          scrim: const Color(0x6B06080C),
          panel: const Color(0xE01C1E24),
          panelBorder: const BorderSide(color: Color(0x17FFFFFF)),
          panelRadius: BorderRadius.circular(14),
          idleKey: const Color(0x13FFFFFF),
          idleKeyBorder: BorderSide.none,
          functionKey: const Color(0x09FFFFFF),
          selectedKey: const Color(0xFFF5F7FA),
          selectedKeyBorder: BorderSide.none,
          textPrimary: const Color(0xEBFFFFFF),
          textMuted: const Color(0x9EFFFFFF),
          textOnSelected: const Color(0xFF0B0D12),
          chipBackground: const Color(0x0FFFFFFF),
          chipBorder: BorderSide.none,
          chipRadius: BorderRadius.circular(10),
          focusGlow: const [
            BoxShadow(
              color: Color(0x8C000000),
              blurRadius: 26,
              offset: Offset(0, 10),
            ),
            BoxShadow(color: Color(0x29FFFFFF), blurRadius: 28),
          ],
          accent: accent,
          accentText: accentText,
          keyTextStyle: theme.textTheme.titleMedium,
          keyHeight: 44,
          rowGap: 8,
          keyRadius: BorderRadius.circular(12),
          selectedScale: 1.12,
          glass: true,
        );
      case KeyboardStyle.docked:
        // Dark text where the accent is light enough to carry it, the 0.19
        // cut is where the two contrast ratios meet.
        final onAccent = accent.computeLuminance() > 0.19
            ? const Color(0xFF04131A)
            : Colors.white;
        return _KeyboardPalette(
          scrim: const Color(0x8C040508),
          panel: const Color(0xF70B0C10),
          panelBorder: const BorderSide(color: Color(0x12FFFFFF)),
          panelRadius: BorderRadius.circular(14),
          idleKey: const Color(0x0FFFFFFF),
          idleKeyBorder: BorderSide.none,
          functionKey: const Color(0x0DFFFFFF),
          selectedKey: accent,
          selectedKeyBorder: BorderSide.none,
          textPrimary: const Color(0xD1FFFFFF),
          textMuted: const Color(0x73FFFFFF),
          textOnSelected: onAccent,
          chipBackground: Colors.transparent,
          chipBorder: BorderSide.none,
          chipRadius: BorderRadius.circular(10),
          focusGlow: [
            BoxShadow(color: accent.withValues(alpha: 0.18), spreadRadius: 5),
            BoxShadow(
              color: accent.withValues(alpha: 0.28),
              blurRadius: 30,
              offset: const Offset(0, 12),
            ),
          ],
          accent: accent,
          accentText: accentText,
          keyTextStyle: theme.textTheme.titleMedium,
        );
      case KeyboardStyle.native:
      case KeyboardStyle.classic:
        final borders = ThemeRegistry.active.borders;
        final idleKey = theme.colorScheme.surfaceContainerHighest.scaleAlpha(
          0.92,
        );
        return _KeyboardPalette(
          panel: theme.colorScheme.surface,
          panelBorder: borders.cardBorder,
          panelRadius: borders.cardRadius,
          idleKey: idleKey,
          idleKeyBorder: borders.chipBorder,
          functionKey: idleKey,
          selectedKey: AppColorScheme.buttonFocused,
          selectedKeyBorder: borders.focusBorder,
          textPrimary: AppColorScheme.onSurface,
          textMuted: AppColorScheme.onSurface.withValues(alpha: 0.64),
          textOnSelected: AppColorScheme.onButtonFocused,
          chipBackground: borders.chipBackground,
          chipBorder: borders.chipBorder,
          chipRadius: borders.chipRadius,
          focusGlow: borders.focusGlow,
          accent: accent,
          accentText: accentText,
          keyTextStyle: theme.textTheme.titleMedium,
          keyRadius: borders.chipRadius,
        );
    }
  }

  String get _doneLabel => widget.inputPurpose == InputPurpose.search
      ? CustomKeyboard.strings.search
      : CustomKeyboard.strings.done;

  void _tapKey(int row, int col) {
    _selectedRow.value = row;
    _selectedCol.value = col;
    _onAction();
  }

  void _longPressKey(int row, int col) {
    _selectedRow.value = row;
    _selectedCol.value = col;
    final key = _currentLayout[row][col];
    if (key == 'BACKSPACE') {
      widget.keyboardController.clear();
      return;
    }
    _openAlternatesForKey(key);
  }

  void _tapAlternate(int index) {
    _alternateIndex.value = index;
    _commitAlternateSelection();
  }

  void _tapChip(int index) {
    _selectedRow.value = -1;
    _selectedChip.value = index;
    _onAction();
  }

  Widget _buildGrid(_KeyboardPalette palette) {
    return _KeyboardGrid(
      layout: _currentLayout,
      uniformKeySpans: _usesNumberPad,
      selectedRow: _selectedRow,
      selectedCol: _selectedCol,
      isShifted: _isShifted,
      alternateOptions: _alternateOptions.value,
      alternateIndex: _alternateIndex.value,
      palette: palette,
      doneLabel: _doneLabel,
      styleChoice: _styleChoice.value,
      style: _style,
      onKeyTapped: _tapKey,
      onKeyLongPressed: _longPressKey,
      onAlternateTapped: _tapAlternate,
      onStylePicked: _pickStyle,
    );
  }

  Widget _buildKeys(List<_KeyboardChip> chips, _KeyboardPalette palette) {
    switch (_style) {
      case KeyboardStyle.docked:
        return ListenableBuilder(
          listenable: Listenable.merge([
            _selectedRow,
            _selectedCol,
            _selectedChip,
          ]),
          builder: (context, _) => _DockedKeyboard(
            layout: _currentLayout,
            numberPad: _usesNumberPad,
            selectedRow: _selectedRow.value,
            selectedCol: _selectedCol.value,
            selectedChip: _selectedChip.value,
            chips: chips,
            text: widget.keyboardController.text,
            cursor: widget.keyboardController.cursor,
            obscureText: widget.obscureText,
            activeMode: _activeType.value == KeyboardType.numeric
                ? 'MODE_NUM'
                : (_isShifted.value ? 'MODE_UPPER' : 'MODE_LOWER'),
            alternateOptions: _alternateOptions.value,
            alternateIndex: _alternateIndex.value,
            doneLabel: _doneLabel,
            doneIcon: widget.inputPurpose == InputPurpose.search
                ? Icons.search_rounded
                : Icons.check_rounded,
            styleChoice: _styleChoice.value,
            palette: palette,
            onKeyTapped: _tapKey,
            onKeyLongPressed: _longPressKey,
            onAlternateTapped: _tapAlternate,
            onChipTapped: _tapChip,
            onStylePicked: _pickStyle,
          ),
        );
      case KeyboardStyle.glass:
        final showHeader = chips.isNotEmpty || !_usesNumberPad;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showHeader)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  height: 36,
                  child: Row(
                    children: [
                      Expanded(
                        child: _ContextChipBar(
                          chips: chips,
                          selectedRow: _selectedRow,
                          selectedChip: _selectedChip,
                          palette: palette,
                          leadingIcon:
                              widget.inputPurpose == InputPurpose.search
                              ? Icons.search_rounded
                              : null,
                          onChipTapped: _tapChip,
                        ),
                      ),
                      if (!_usesNumberPad) ...[
                        const SizedBox(width: 16),
                        _KeyHint(
                          cap: _okCap,
                          label: CustomKeyboard.strings.holdForAccents,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            _buildGrid(palette),
          ],
        );
      case KeyboardStyle.native:
      case KeyboardStyle.classic:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (chips.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _ContextChipBar(
                  chips: chips,
                  selectedRow: _selectedRow,
                  selectedChip: _selectedChip,
                  palette: palette,
                  onChipTapped: _tapChip,
                ),
              ),
            _buildGrid(palette),
          ],
        );
    }
  }

  Widget _buildFrame(Widget keys, _KeyboardPalette palette) {
    switch (_style) {
      case KeyboardStyle.docked:
        return GestureDetector(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.panel,
              border: Border(top: palette.panelBorder),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x80000000),
                  blurRadius: 60,
                  offset: Offset(0, -30),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
                child: Center(
                  heightFactor: 1,
                  child: FittedBox(fit: BoxFit.scaleDown, child: keys),
                ),
              ),
            ),
          ),
        );
      case KeyboardStyle.glass:
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 18),
          child: GestureDetector(
            onTap: () {},
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: _usesNumberPad ? 340 : 850,
              ),
              // The pane sits behind the keys rather than around them,
              // since it clips and the alternate popup has to float free.
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: glassPane(
                      tier: GlassSettings.tier,
                      fallbackColor: palette.panel,
                      cornerRadius: 24,
                      shadow: true,
                      context: context,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                    child: keys,
                  ),
                ],
              ),
            ),
          ),
        );
      case KeyboardStyle.native:
      case KeyboardStyle.classic:
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: GestureDetector(
            onTap: () {},
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: _usesNumberPad ? 320 : 820,
              ),
              child: Material(
                color: palette.panel,
                elevation: 8,
                shadowColor: Colors.black.withValues(alpha: 0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: palette.panelRadius,
                  side: palette.panelBorder,
                ),
                // No clip, so the alternate character popup can float
                // above the panel edge for keys on the top row.
                clipBehavior: Clip.none,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  child: keys,
                ),
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.keyboardController,
      builder: (context, _) {
        if (!widget.keyboardController.isVisible) {
          return const SizedBox.shrink();
        }

        final palette = _paletteFor(Theme.of(context));

        final chips = _contextChips;
        if (_selectedRow.value < 0 && chips.isEmpty) {
          _selectedRow.value = 0;
        }
        if (chips.isNotEmpty && _selectedChip.value >= chips.length) {
          _selectedChip.value = chips.length - 1;
        }

        final keys = Focus(
          focusNode: widget.focusNode,
          onKeyEvent: (_, e) => _handleKey(e),
          autofocus: true,
          child: ListenableBuilder(
            listenable: Listenable.merge([
              _activeType,
              _isShifted,
              _alternateOptions,
              _alternateIndex,
              _styleChoice,
            ]),
            builder: (context, _) => _buildKeys(chips, palette),
          ),
        );

        return SizedBox.expand(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => widget.keyboardController.hide(true),
            child: ColoredBox(
              color: palette.scrim,
              child: SafeArea(
                top: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFrame(keys, palette),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cancelSelectHold();
    _dismissAlternates();
    _suggestionsDebounce?.cancel();
    widget.keyboardController.removeListener(_onControllerTextChanged);
    _selectedRow.dispose();
    _selectedCol.dispose();
    _selectedChip.dispose();
    _isShifted.dispose();
    _activeType.dispose();
    _alternateOptions.dispose();
    _alternateIndex.dispose();
    _styleChoice.dispose();
    if (widget.keyboardController.dismissPopup == _dismissPopup) {
      widget.keyboardController.dismissPopup = null;
    }
    super.dispose();
  }
}

class _ContextChipBar extends StatelessWidget {
  final List<_KeyboardChip> chips;
  final ValueListenable<int> selectedRow;
  final ValueListenable<int> selectedChip;
  final _KeyboardPalette palette;
  final IconData? leadingIcon;
  final ValueChanged<int> onChipTapped;

  const _ContextChipBar({
    required this.chips,
    required this.selectedRow,
    required this.selectedChip,
    required this.palette,
    this.leadingIcon,
    required this.onChipTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final chip = chips[index];
          return ValueListenableBuilder<int>(
            valueListenable: selectedRow,
            builder: (context, row, _) {
              return ValueListenableBuilder<int>(
                valueListenable: selectedChip,
                builder: (context, chipIndex, _) {
                  final isSelected = row < 0 && chipIndex == index;
                  final textColor = isSelected
                      ? palette.textOnSelected
                      : palette.textPrimary;
                  final label = Text(
                    chip.label,
                    style: (palette.keyTextStyle ?? const TextStyle()).copyWith(
                      fontSize: palette.glass ? 13.5 : 13,
                      fontWeight: palette.glass
                          ? FontWeight.w500
                          : FontWeight.w600,
                      color: textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  );
                  return GestureDetector(
                    onTap: () => onChipTapped(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 90),
                      curve: Curves.easeOut,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? palette.selectedKey
                            : palette.chipBackground,
                        borderRadius: palette.chipRadius,
                        border: Border.fromBorderSide(
                          isSelected
                              ? palette.selectedKeyBorder
                              : palette.chipBorder,
                        ),
                        boxShadow: isSelected ? palette.focusGlow : null,
                      ),
                      child: leadingIcon == null
                          ? label
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  leadingIcon,
                                  size: 14,
                                  color: textColor.withValues(alpha: 0.55),
                                ),
                                const SizedBox(width: 7),
                                label,
                              ],
                            ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _KeyboardGrid extends StatelessWidget {
  final List<List<String>> layout;
  final bool uniformKeySpans;
  final ValueListenable<int> selectedRow;
  final ValueListenable<int> selectedCol;
  final ValueListenable<bool> isShifted;
  final List<String>? alternateOptions;
  final int alternateIndex;
  final _KeyboardPalette palette;
  final String doneLabel;
  final int? styleChoice;
  final KeyboardStyle style;
  final void Function(int row, int col) onKeyTapped;
  final void Function(int row, int col) onKeyLongPressed;
  final ValueChanged<int> onAlternateTapped;
  final ValueChanged<KeyboardStyle> onStylePicked;

  const _KeyboardGrid({
    required this.layout,
    required this.uniformKeySpans,
    required this.selectedRow,
    required this.selectedCol,
    required this.isShifted,
    required this.alternateOptions,
    required this.alternateIndex,
    required this.palette,
    required this.doneLabel,
    required this.styleChoice,
    required this.style,
    required this.onKeyTapped,
    required this.onKeyLongPressed,
    required this.onAlternateTapped,
    required this.onStylePicked,
  });

  double _getKeyUnitSpan(String key) {
    if (uniformKeySpans) return 1.0;
    if (key == 'SPACE') return 2.4;
    if (['123', 'ABC', 'DONE', 'IME'].contains(key)) return 1.22;
    return 1.0;
  }

  double _getKeyWidth(String key, double base) {
    return base * _getKeyUnitSpan(key);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double horizontalGapFactor = 0.1;
        double maxRowSpan = 1.0;
        for (final row in layout) {
          final keySpan = row.fold<double>(
            0,
            (total, key) => total + _getKeyUnitSpan(key),
          );
          final gapSpan = (row.length - 1) * horizontalGapFactor;
          final rowSpan = keySpan + gapSpan;
          if (rowSpan > maxRowSpan) {
            maxRowSpan = rowSpan;
          }
        }

        final double baseWidth = constraints.maxWidth / maxRowSpan;
        final double spacing = baseWidth * horizontalGapFactor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(layout.length, (r) {
            return Padding(
              padding: EdgeInsets.only(bottom: palette.rowGap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: spacing,
                children: List.generate(layout[r].length, (c) {
                  final key = layout[r][c];
                  return ValueListenableBuilder<int>(
                    valueListenable: selectedRow,
                    builder: (context, sR, _) => ValueListenableBuilder<int>(
                      valueListenable: selectedCol,
                      builder: (context, sC, _) => _KeyboardKey(
                        label: key,
                        isSelected: sR == r && sC == c,
                        isShifted: isShifted,
                        alternateOptions: sR == r && sC == c
                            ? alternateOptions
                            : null,
                        alternateIndex: alternateIndex,
                        width: _getKeyWidth(key, baseWidth),
                        palette: palette,
                        doneLabel: doneLabel,
                        styleChoice: key == 'IME' ? styleChoice : null,
                        style: style,
                        onTap: () => onKeyTapped(r, c),
                        onLongPress: () => onKeyLongPressed(r, c),
                        onAlternateTapped: onAlternateTapped,
                        onStylePicked: onStylePicked,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        );
      },
    );
  }
}

class _KeyboardKey extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueListenable<bool> isShifted;
  final List<String>? alternateOptions;
  final int alternateIndex;
  final double width;
  final _KeyboardPalette palette;
  final String doneLabel;
  final int? styleChoice;
  final KeyboardStyle style;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<int> onAlternateTapped;
  final ValueChanged<KeyboardStyle> onStylePicked;

  const _KeyboardKey({
    required this.label,
    required this.isSelected,
    required this.isShifted,
    required this.alternateOptions,
    required this.alternateIndex,
    required this.width,
    required this.palette,
    required this.doneLabel,
    required this.styleChoice,
    required this.style,
    required this.onTap,
    required this.onLongPress,
    required this.onAlternateTapped,
    required this.onStylePicked,
  });

  static const _functionKeys = {
    'SHIFT',
    'BACKSPACE',
    '123',
    'ABC',
    'SPACE',
    'CURSORL',
    'CURSORR',
    'PASTE',
    'IME',
  };

  bool get _hasAlternates => KeyboardLayouts.hasAlternates(label);

  @override
  Widget build(BuildContext context) {
    final borderRadius = palette.keyRadius;
    final scale = isSelected ? palette.selectedScale : 1.0;
    final idleColor = palette.glass && label == 'DONE'
        ? palette.accent.withValues(alpha: 0.2)
        : (_functionKeys.contains(label) ? palette.functionKey : palette.idleKey);

    return GestureDetector(
      onTap: onTap,
      onLongPress: _hasAlternates || label == 'BACKSPACE' ? onLongPress : null,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            width: width,
            height: palette.keyHeight,
            transform: Matrix4.diagonal3Values(scale, scale, 1),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? palette.selectedKey : idleColor,
              borderRadius: borderRadius,
              border: Border.fromBorderSide(
                isSelected ? palette.selectedKeyBorder : palette.idleKeyBorder,
              ),
              boxShadow: isSelected ? palette.focusGlow : null,
            ),
            child: Stack(
              children: [
                Center(child: _buildContent(context)),
                // A quiet marker that holding this key opens more characters.
                // Glass says so once in its header instead.
                if (_hasAlternates && !palette.glass)
                  Positioned(
                    top: 5,
                    right: 6,
                    child: Container(
                      width: 3.5,
                      height: 3.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            (isSelected
                                    ? palette.textOnSelected
                                    : palette.textMuted)
                                .withValues(alpha: 0.55),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (alternateOptions != null && alternateOptions!.isNotEmpty)
            Positioned(
              bottom: palette.keyHeight + 4,
              child: _AlternateCharacterPopup(
                options: alternateOptions!,
                selectedIndex: alternateIndex,
                palette: palette,
                onOptionTapped: onAlternateTapped,
              ),
            ),
          if (styleChoice != null)
            Positioned(
              bottom: palette.keyHeight + 4,
              child: _StylePicker(
                focusedIndex: styleChoice!,
                current: style,
                palette: palette,
                onPicked: onStylePicked,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGlassContent() {
    final isFunction = _functionKeys.contains(label);
    final color = isSelected
        ? palette.textOnSelected
        : (isFunction ? palette.textMuted : palette.textPrimary);
    Widget word(String text, Color idle, FontWeight weight) => Text(
      text,
      style: (palette.keyTextStyle ?? const TextStyle()).copyWith(
        color: isSelected ? palette.textOnSelected : idle,
        fontSize: 13.5,
        fontWeight: weight,
      ),
    );

    switch (label) {
      case 'BACKSPACE':
        return Icon(Icons.backspace_outlined, color: color, size: 20);
      case 'PASTE':
        return Icon(Icons.content_paste_rounded, color: color, size: 17);
      case 'CURSORL':
        return Icon(Icons.chevron_left_rounded, color: color, size: 24);
      case 'CURSORR':
        return Icon(Icons.chevron_right_rounded, color: color, size: 24);
      case 'IME':
        return Icon(Icons.keyboard_alt_outlined, color: color, size: 19);
      case 'SHIFT':
        return ValueListenableBuilder<bool>(
          valueListenable: isShifted,
          builder: (context, shifted, _) => Icon(
            shifted ? Icons.keyboard_capslock_rounded : Icons.arrow_upward_rounded,
            color: shifted && !isSelected ? palette.textPrimary : color,
            size: 19,
          ),
        );
      case 'SPACE':
        return word(
          CustomKeyboard.strings.space,
          Colors.white.withValues(alpha: 0.45),
          FontWeight.w500,
        );
      case 'DONE':
        return word(doneLabel, palette.accentText, FontWeight.w600);
      case '123':
      case 'ABC':
        return word(label, palette.textMuted, FontWeight.w600);
      default:
        return Text(
          label,
          style: (palette.keyTextStyle ?? const TextStyle()).copyWith(
            color: color,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    if (palette.glass) return _buildGlassContent();
    final color = isSelected ? palette.textOnSelected : palette.textPrimary;
    switch (label) {
      case 'BACKSPACE':
        return Icon(Icons.backspace_outlined, color: color, size: 18);
      case 'PASTE':
        return Icon(Icons.content_paste_rounded, color: color, size: 16);
      case 'CURSORL':
        return Icon(Icons.keyboard_arrow_left, color: color, size: 22);
      case 'CURSORR':
        return Icon(Icons.keyboard_arrow_right, color: color, size: 22);
      case 'DONE':
        return Icon(
          Icons.check_circle_outline,
          color: isSelected ? palette.textOnSelected : palette.accent,
          size: 20,
        );
      case 'IME':
        return Icon(
          Icons.keyboard_alt_outlined,
          color: isSelected ? palette.textOnSelected : palette.accent,
          size: 18,
        );
      case 'SHIFT':
        return ValueListenableBuilder<bool>(
          valueListenable: isShifted,
          builder: (context, shifted, _) => Icon(
            shifted ? Icons.keyboard_capslock : Icons.keyboard_arrow_up,
            color: shifted
                ? (isSelected ? palette.textOnSelected : palette.accent)
                : color,
            size: 20,
          ),
        );
      case 'SPACE':
        return Container(
          width: width * 0.5,
          height: 4,
          decoration: BoxDecoration(
            color: (isSelected ? palette.textOnSelected : palette.textMuted)
                .withValues(alpha: 0.65),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      default:
        return Text(
          label,
          style: (palette.keyTextStyle ?? const TextStyle()).copyWith(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
        );
    }
  }
}

/// The keyboard key's list of styles, with a check on the one in use.
class _StylePicker extends StatelessWidget {
  final int focusedIndex;
  final KeyboardStyle current;
  final _KeyboardPalette palette;
  final ValueChanged<KeyboardStyle> onPicked;

  const _StylePicker({
    required this.focusedIndex,
    required this.current,
    required this.palette,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // Solid, so the keys under the list never show through it.
        color: Color.alphaBlend(palette.panel, Colors.black),
        borderRadius: palette.panelRadius,
        border: Border.fromBorderSide(palette.panelBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          for (final style in KeyboardStyle.values)
            GestureDetector(
              onTap: () => onPicked(style),
              child: _buildRow(style, style.index == focusedIndex),
            ),
        ],
      ),
    );
  }

  Widget _buildRow(KeyboardStyle style, bool isFocused) {
    final color = isFocused ? palette.textOnSelected : palette.textPrimary;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isFocused ? palette.selectedKey : Colors.transparent,
        borderRadius: palette.chipRadius,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              CustomKeyboard.strings.styleName(style),
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: isFocused ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
          if (style == current) Icon(Icons.check_rounded, size: 18, color: color),
        ],
      ),
    );
  }
}

class _AlternateCharacterPopup extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final _KeyboardPalette palette;
  final ValueChanged<int> onOptionTapped;

  const _AlternateCharacterPopup({
    required this.options,
    required this.selectedIndex,
    required this.palette,
    required this.onOptionTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: palette.panel,
        borderRadius: palette.panelRadius,
        border: Border.fromBorderSide(palette.panelBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onOptionTapped(index),
            child: Container(
              constraints: const BoxConstraints(minWidth: 36),
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              margin: EdgeInsets.only(
                right: index < options.length - 1 ? 6 : 0,
              ),
              decoration: BoxDecoration(
                color: isSelected ? palette.selectedKey : palette.idleKey,
                borderRadius: palette.chipRadius,
                border: Border.fromBorderSide(
                  isSelected
                      ? palette.selectedKeyBorder
                      : palette.idleKeyBorder,
                ),
              ),
              child: Center(
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: isSelected
                        ? palette.textOnSelected
                        : palette.textMuted,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _KeyboardPalette {
  final Color panel;
  final BorderSide panelBorder;
  final BorderRadius panelRadius;
  final Color idleKey;
  final BorderSide idleKeyBorder;
  final Color selectedKey;
  final BorderSide selectedKeyBorder;
  final Color textPrimary;
  final Color textMuted;
  final Color textOnSelected;
  final Color chipBackground;
  final BorderSide chipBorder;
  final BorderRadius chipRadius;
  final List<BoxShadow> focusGlow;
  final Color accent;
  final TextStyle? keyTextStyle;
  final Color scrim;
  final Color functionKey;
  final Color accentText;
  final double keyHeight;
  final double rowGap;
  final BorderRadius keyRadius;
  final double selectedScale;
  final bool glass;

  const _KeyboardPalette({
    this.scrim = Colors.transparent,
    required this.functionKey,
    required this.accentText,
    this.keyHeight = 40,
    this.rowGap = 4,
    this.keyRadius = BorderRadius.zero,
    this.selectedScale = 1,
    this.glass = false,
    required this.panel,
    required this.panelBorder,
    required this.panelRadius,
    required this.idleKey,
    required this.idleKeyBorder,
    required this.selectedKey,
    required this.selectedKeyBorder,
    required this.textPrimary,
    required this.textMuted,
    required this.textOnSelected,
    required this.chipBackground,
    required this.chipBorder,
    required this.chipRadius,
    required this.focusGlow,
    required this.accent,
    required this.keyTextStyle,
  });
}

const _okCap = Text(
  'OK',
  style: TextStyle(
    color: Color(0xBFFFFFFF),
    fontSize: 10,
    fontWeight: FontWeight.w600,
  ),
);

/// A remote button drawn as a small keycap, followed by what it does.
class _KeyHint extends StatelessWidget {
  final Widget cap;
  final String label;

  const _KeyHint({required this.cap, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 18,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x47FFFFFF)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: cap,
        ),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(color: Color(0x8CFFFFFF), fontSize: 11.5),
        ),
      ],
    );
  }
}

/// The docked keyboard: an echo of the text, the suggestions, and the keys
/// split into a mode rail, a capless character grid and two tall actions.
class _DockedKeyboard extends StatelessWidget {
  static const double _cell = 52;
  static const double _row = 48;
  static const double _gap = 4;
  static const double _rowGap = 6;
  static const double _rail = 72;
  static const double _action = 148;
  static const double _columnGap = 24;
  static const double _width = 824;
  static const double _padCell = 84;

  final List<List<String>> layout;
  final bool numberPad;
  final int selectedRow;
  final int selectedCol;
  final int selectedChip;
  final List<_KeyboardChip> chips;
  final String text;
  final int cursor;
  final bool obscureText;
  final String activeMode;
  final List<String>? alternateOptions;
  final int alternateIndex;
  final String doneLabel;
  final IconData doneIcon;
  final int? styleChoice;
  final _KeyboardPalette palette;
  final void Function(int row, int col) onKeyTapped;
  final void Function(int row, int col) onKeyLongPressed;
  final ValueChanged<int> onAlternateTapped;
  final ValueChanged<int> onChipTapped;
  final ValueChanged<KeyboardStyle> onStylePicked;

  const _DockedKeyboard({
    required this.layout,
    required this.numberPad,
    required this.selectedRow,
    required this.selectedCol,
    required this.selectedChip,
    required this.chips,
    required this.text,
    required this.cursor,
    required this.obscureText,
    required this.activeMode,
    required this.alternateOptions,
    required this.alternateIndex,
    required this.doneLabel,
    required this.doneIcon,
    required this.styleChoice,
    required this.palette,
    required this.onKeyTapped,
    required this.onKeyLongPressed,
    required this.onAlternateTapped,
    required this.onChipTapped,
    required this.onStylePicked,
  });

  String? get _selectedKey =>
      selectedRow < 0 ? null : layout[selectedRow][selectedCol];

  @override
  Widget build(BuildContext context) {
    final strings = CustomKeyboard.strings;
    return SizedBox(
      width: numberPad ? 3 * _padCell + 2 * _gap : _width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(child: _buildEcho()),
                if (!numberPad) ...[
                  const SizedBox(width: 16),
                  _KeyHint(cap: _okCap, label: strings.holdForAccents),
                  const SizedBox(width: 16),
                  _KeyHint(
                    cap: const Icon(
                      Icons.arrow_back_rounded,
                      size: 11,
                      color: Color(0xBFFFFFFF),
                    ),
                    label: strings.close,
                  ),
                ],
              ],
            ),
          ),
          if (chips.isNotEmpty) ...[
            const SizedBox(height: 10),
            SizedBox(height: 28, child: _buildSuggestions()),
          ],
          const SizedBox(height: 16),
          numberPad ? _buildPad() : _buildKeys(),
        ],
      ),
    );
  }

  Widget _buildEcho() {
    final shown = obscureText ? '•' * text.length : text;
    final split = cursor.clamp(0, shown.length);
    var ghost = '';
    if (!obscureText && text.isNotEmpty && cursor >= text.length) {
      final typed = text.toLowerCase();
      // Only a suggestion that replaces the text can finish it, helpers like
      // https:// are added on instead.
      for (final chip in chips) {
        if ((chip.submitOnTap || chip.replaceOnTap) &&
            chip.label.length > text.length &&
            chip.label.toLowerCase().startsWith(typed)) {
          ghost = chip.label.substring(text.length);
          break;
        }
      }
    }

    // Short text sits at the start, long text keeps its end in view.
    return Align(
      alignment: Alignment.centerLeft,
      child: UnconstrainedBox(
        alignment: Alignment.centerRight,
        constrainedAxis: Axis.vertical,
        clipBehavior: Clip.hardEdge,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: shown.substring(0, split)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  width: 2,
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  color: palette.accent,
                ),
              ),
              TextSpan(text: shown.substring(split)),
              if (ghost.isNotEmpty)
                TextSpan(
                  text: ghost,
                  style: const TextStyle(color: Color(0x47FFFFFF)),
                ),
            ],
          ),
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    final typed = text.trim().toLowerCase();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: chips.length,
      separatorBuilder: (_, _) => const SizedBox(width: 4),
      itemBuilder: (context, index) {
        final label = chips[index].label;
        final isSelected = selectedRow < 0 && selectedChip == index;
        final matched =
            typed.isNotEmpty && label.toLowerCase().startsWith(typed)
            ? typed.length
            : 0;
        return GestureDetector(
          onTap: () => onChipTapped(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? palette.selectedKey : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: label.substring(0, matched),
                    style: TextStyle(
                      color: isSelected
                          ? palette.textOnSelected
                          : const Color(0xF2FFFFFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: label.substring(matched)),
                ],
              ),
              style: TextStyle(
                color: isSelected
                    ? palette.textOnSelected
                    : const Color(0x80FFFFFF),
                fontSize: 15,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeys() {
    const gridLeft = _rail + _columnGap;
    const actionLeft = gridLeft + 10 * _cell + 9 * _gap + _columnGap;
    final children = <Widget>[];

    // Rows are added top to bottom, so a popup, which opens upward, always
    // paints over the rows above it.
    for (var r = 0; r < layout.length; r++) {
      final top = r * (_row + _rowGap);
      children.add(
        Positioned(
          left: 0,
          top: top,
          width: _rail,
          height: _row,
          child: _buildCell(r, 0, _row),
        ),
      );

      var c = 1;
      while (c <= 10) {
        var span = 1;
        while (c + span <= 10 && layout[r][c + span] == layout[r][c]) {
          span++;
        }
        children.add(
          Positioned(
            left: gridLeft + (c - 1) * (_cell + _gap),
            top: top,
            width: span * _cell + (span - 1) * _gap,
            height: _row,
            child: _buildCell(r, c, _row),
          ),
        );
        c += span;
      }

      if (r == 0 || layout[r - 1][11] != layout[r][11]) {
        var span = 1;
        while (r + span < layout.length &&
            layout[r + span][11] == layout[r][11]) {
          span++;
        }
        final height = span * _row + (span - 1) * _rowGap;
        children.add(
          Positioned(
            left: actionLeft,
            top: top,
            width: _action,
            height: height,
            child: _buildCell(r, 11, height),
          ),
        );
      }
    }

    return SizedBox(
      width: _width,
      height: layout.length * _row + (layout.length - 1) * _rowGap,
      child: Stack(clipBehavior: Clip.none, children: children),
    );
  }

  Widget _buildPad() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: _rowGap,
      children: [
        for (var r = 0; r < layout.length; r++)
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: _gap,
            children: [
              for (var c = 0; c < layout[r].length; c++)
                SizedBox(
                  width: _padCell,
                  height: _row,
                  child: _buildCell(r, c, _row),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildCell(int row, int col, double height) {
    final key = layout[row][col];
    final isSelected = key == _selectedKey;
    final isRail = !numberPad && col == 0;
    final hasAlternates = KeyboardLayouts.hasAlternates(key);

    Color fill = Colors.transparent;
    BoxBorder? border;
    if (key == activeMode) {
      fill = const Color(0x12FFFFFF);
    } else if (key == 'BACKSPACE' && !numberPad) {
      fill = palette.functionKey;
    } else if (key == 'DONE' && !numberPad) {
      fill = palette.accent.withValues(alpha: 0.14);
      border = Border.all(color: palette.accent.withValues(alpha: 0.38));
    } else if (key == 'SPACE') {
      border = Border.all(color: const Color(0x1AFFFFFF));
    }

    return GestureDetector(
      onTap: () => onKeyTapped(row, col),
      onLongPress: hasAlternates || key == 'BACKSPACE'
          ? () => onKeyLongPressed(row, col)
          : null,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 90),
              curve: Curves.easeOut,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? palette.selectedKey : fill,
                borderRadius: BorderRadius.circular(
                  isRail || key == 'SPACE' ? 12 : 14,
                ),
                border: isSelected ? null : border,
                boxShadow: isSelected ? palette.focusGlow : null,
              ),
              child: _buildContent(key, isSelected),
            ),
          ),
          if (hasAlternates)
            Positioned(
              bottom: 6,
              child: Container(
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? palette.textOnSelected.withValues(alpha: 0.4)
                      : const Color(0x3DFFFFFF),
                ),
              ),
            ),
          if (isSelected && alternateOptions != null && alternateOptions!.isNotEmpty)
            Positioned(
              bottom: height + 6,
              child: _AlternateCharacterPopup(
                options: alternateOptions!,
                selectedIndex: alternateIndex,
                palette: palette,
                onOptionTapped: onAlternateTapped,
              ),
            ),
          // The rail sits at the left edge, so the picker grows rightward.
          if (key == 'IME' && styleChoice != null)
            Positioned(
              left: 0,
              bottom: height + 6,
              child: _StylePicker(
                focusedIndex: styleChoice!,
                current: KeyboardStyle.docked,
                palette: palette,
                onPicked: onStylePicked,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(String key, bool isSelected) {
    final strings = CustomKeyboard.strings;
    Color tone(Color idle) => isSelected ? palette.textOnSelected : idle;
    const iconColor = Color(0xB3FFFFFF);

    Widget stacked(IconData glyph, String label, Color idle, FontWeight weight) {
      if (numberPad) return Icon(glyph, size: 22, color: tone(idle));
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(glyph, size: 24, color: tone(idle)),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: tone(idle), fontSize: 13, fontWeight: weight),
          ),
        ],
      );
    }

    Widget railLabel(String label) {
      final active = key == activeMode;
      return Text(
        label,
        style: TextStyle(
          color: tone(active ? Colors.white : palette.textMuted),
          fontSize: 14,
          fontWeight: active || isSelected ? FontWeight.w600 : FontWeight.w500,
          letterSpacing: 0.3,
        ),
      );
    }

    switch (key) {
      case 'MODE_LOWER':
        return railLabel('abc');
      case 'MODE_UPPER':
        return railLabel('ABC');
      case 'MODE_NUM':
        return railLabel('123');
      case 'IME':
        return Icon(
          Icons.keyboard_alt_outlined,
          size: 22,
          color: tone(palette.textMuted),
        );
      case 'SPACE':
        return Text(
          strings.space,
          style: TextStyle(
            color: tone(palette.textMuted),
            fontSize: 13,
            letterSpacing: 0.4,
          ),
        );
      case 'CURSORL':
        return Icon(Icons.chevron_left_rounded, size: 24, color: tone(iconColor));
      case 'CURSORR':
        return Icon(Icons.chevron_right_rounded, size: 24, color: tone(iconColor));
      case 'PASTE':
        return Icon(Icons.content_paste_rounded, size: 19, color: tone(iconColor));
      case 'BACKSPACE':
        return stacked(
          Icons.backspace_outlined,
          strings.delete,
          const Color(0xC7FFFFFF),
          FontWeight.w500,
        );
      case 'DONE':
        return stacked(doneIcon, doneLabel, palette.accentText, FontWeight.w600);
      default:
        return Text(
          key,
          style: TextStyle(
            color: tone(palette.textPrimary),
            fontSize: 21,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        );
    }
  }
}
