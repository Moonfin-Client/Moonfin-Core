import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

enum KeyboardType { alphabetic, numeric }

enum InputPurpose { text, search, url, email, username, password, numeric }

typedef KeyboardSuggestionBuilder = Future<List<String>> Function(String query);

class KeyboardController extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  bool _isVisible = false;

  bool get isVisible => _isVisible;

  Function(String)? onTextChanged;
  Function(bool shouldPop)? onKeyboardClosed;
  VoidCallback? onRequestSystemKeyboard;

  void addCharacter(String character) {
    _text += character;
    notifyListeners();
    onTextChanged?.call(_text);
  }

  void insertText(String value) {
    if (value.isEmpty) return;
    _text += value;
    notifyListeners();
    onTextChanged?.call(_text);
  }

  void backspace() {
    if (_text.isNotEmpty) {
      _text = _text.substring(0, _text.length - 1);
      notifyListeners();
      onTextChanged?.call(_text);
    }
  }

  void clear() {
    _text = '';
    notifyListeners();
    onTextChanged?.call(_text);
  }

  void addSpace() {
    _text += ' ';
    notifyListeners();
    onTextChanged?.call(_text);
  }

  void setText(String value) {
    _text = value;
    notifyListeners();
    onTextChanged?.call(_text);
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
  static const List<List<String>> alphabeticLower = [
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', "'"],
    ['SHIFT', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', 'BACKSPACE'],
    ['123', '.', '?', 'SPACE', '-', '@', 'IME', 'DONE'],
  ];

  static const List<List<String>> alphabeticUpper = [
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', '"'],
    ['SHIFT', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', ',', 'BACKSPACE'],
    ['123', '.', '?', 'SPACE', '-', '@', 'IME', 'DONE'],
  ];

  static const List<List<String>> numeric = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
    ['!', '@', '#', r'$', '%', '^', '&', '*', '(', ')'],
    ['?', '~', r'\', ';', "'", '"', ',', '.', '/', 'BACKSPACE'],
    ['ABC', '[', ']', 'SPACE', '_', '+', 'IME', 'DONE'],
  ];

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
    '?': ['?', '¿'],
    '-': ['-', '_', '–', '—'],
    '@': ['@', '.com', '.net', '.org'],
    '"': ['"', "'"],
    "'": ["'", '"'],
  };
}

class _KeyboardChip {
  final String label;
  final String value;
  final bool submitOnTap;

  const _KeyboardChip({
    required this.label,
    required this.value,
    this.submitOnTap = false,
  });
}

class CustomKeyboard extends StatefulWidget {
  final KeyboardController keyboardController;
  final KeyboardType keyboardType;
  final InputPurpose inputPurpose;
  final FocusNode focusNode;
  final KeyboardSuggestionBuilder? suggestionsBuilder;
  final List<String> recentSuggestions;

  const CustomKeyboard({
    super.key,
    required this.keyboardController,
    required this.focusNode,
    this.keyboardType = KeyboardType.alphabetic,
    this.inputPurpose = InputPurpose.text,
    this.suggestionsBuilder,
    this.recentSuggestions = const [],
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

  bool _pendingAlternateSelect = false;
  bool _alternateAwaitingSelectRelease = false;

  Timer? _suggestionsDebounce;
  int _suggestionRequestGeneration = 0;
  String _lastControllerText = '';
  List<String> _searchSuggestions = const [];

  String get _selectedKey => _selectedRow.value < 0
      ? ''
      : _currentLayout[_selectedRow.value][_selectedCol.value];

  List<List<String>> get _currentLayout {
    if (_activeType.value == KeyboardType.numeric) {
      return KeyboardLayouts.numeric;
    }
    return _isShifted.value
        ? KeyboardLayouts.alphabeticUpper
        : KeyboardLayouts.alphabeticLower;
  }

  List<_KeyboardChip> get _contextChips {
    switch (widget.inputPurpose) {
      case InputPurpose.url:
        return const [
          _KeyboardChip(label: 'https://', value: 'https://'),
          _KeyboardChip(label: 'http://', value: 'http://'),
          _KeyboardChip(label: 'www.', value: 'www.'),
          _KeyboardChip(label: '.com', value: '.com'),
          _KeyboardChip(label: '.org', value: '.org'),
          _KeyboardChip(label: '.net', value: '.net'),
          _KeyboardChip(label: ':8096', value: ':8096'),
          _KeyboardChip(label: '/', value: '/'),
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
      case InputPurpose.username:
      case InputPurpose.password:
      case InputPurpose.numeric:
        return const [];
    }
  }

  @override
  void initState() {
    super.initState();
    _activeType = ValueNotifier<KeyboardType>(widget.keyboardType);
    _lastControllerText = widget.keyboardController.text;
    widget.keyboardController.addListener(_onControllerTextChanged);
    _refreshSearchSuggestions(immediate: true);
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

  void _resetSelection() {
    _selectedRow.value = 0;
    _selectedCol.value = 0;
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

    if (dRow < 0 && _selectedRow.value == 0 && chips.isNotEmpty) {
      _selectedRow.value = -1;
      _selectedChip.value = _selectedChip.value.clamp(0, chips.length - 1);
      _dismissAlternates();
      return;
    }

    int nextRow = (_selectedRow.value + dRow).clamp(
      0,
      _currentLayout.length - 1,
    );
    int nextCol = _selectedCol.value;

    if (dRow != 0) {
      nextCol = nextCol.clamp(0, _currentLayout[nextRow].length - 1);
    } else {
      final int rowLength = _currentLayout[nextRow].length;
      nextCol = (nextCol + dCol) % rowLength;
      if (nextCol < 0) nextCol += rowLength;
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
      if (chip.submitOnTap) {
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
      case 'DONE':
        controller.hide(true);
        break;
      case '123':
      case 'ABC':
        _switchType();
        break;
      case 'IME':
        controller.requestSystemKeyboard();
        break;
      default:
        controller.addCharacter(key);
        break;
    }
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borders = ThemeRegistry.active.borders;
    final palette = _KeyboardPalette(
      panel: theme.colorScheme.surface,
      panelBorder: borders.cardBorder,
      panelRadius: borders.cardRadius,
      idleKey: theme.colorScheme.surfaceContainerHighest.scaleAlpha(0.92),
      idleKeyBorder: borders.chipBorder,
      selectedKey: AppColorScheme.buttonFocused,
      selectedKeyBorder: borders.focusBorder,
      textPrimary: AppColorScheme.onSurface,
      textMuted: AppColorScheme.onSurface.withValues(alpha: 0.64),
      textOnSelected: AppColorScheme.onButtonFocused,
      chipBackground: borders.chipBackground,
      chipBorder: borders.chipBorder,
      chipRadius: borders.chipRadius,
      focusGlow: borders.focusGlow,
      accent: AppColorScheme.accent,
      keyTextStyle: theme.textTheme.titleMedium,
    );

    return ListenableBuilder(
      listenable: widget.keyboardController,
      builder: (context, _) {
        if (!widget.keyboardController.isVisible) {
          return const SizedBox.shrink();
        }

        final chips = _contextChips;
        if (_selectedRow.value < 0 && chips.isEmpty) {
          _selectedRow.value = 0;
        }
        if (chips.isNotEmpty && _selectedChip.value >= chips.length) {
          _selectedChip.value = chips.length - 1;
        }

        return SizedBox.expand(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => widget.keyboardController.hide(true),
            child: SafeArea(
              top: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                  child: GestureDetector(
                    onTap: () {},
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Material(
                        color: palette.panel,
                        elevation: 8,
                        shadowColor: Colors.black.withValues(alpha: 0.35),
                        shape: RoundedRectangleBorder(
                          borderRadius: palette.panelRadius,
                          side: palette.panelBorder,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                          child: Focus(
                            focusNode: widget.focusNode,
                            onKeyEvent: (_, e) => _handleKey(e),
                            autofocus: true,
                            child: ValueListenableBuilder<KeyboardType>(
                              valueListenable: _activeType,
                              builder: (context, type, _) {
                                return ValueListenableBuilder<bool>(
                                  valueListenable: _isShifted,
                                  builder: (context, shifted, _) {
                                    return ValueListenableBuilder<
                                      List<String>?
                                    >(
                                      valueListenable: _alternateOptions,
                                      builder: (context, alternateOptions, _) {
                                        return ValueListenableBuilder<int>(
                                          valueListenable: _alternateIndex,
                                          builder: (context, alternateIndex, _) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (chips.isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          bottom: 8,
                                                        ),
                                                    child: _ContextChipBar(
                                                      chips: chips,
                                                      selectedRow: _selectedRow,
                                                      selectedChip:
                                                          _selectedChip,
                                                      palette: palette,
                                                      onChipTapped: (index) {
                                                        _selectedRow.value = -1;
                                                        _selectedChip.value =
                                                            index;
                                                        _onAction();
                                                      },
                                                    ),
                                                  ),
                                                _KeyboardGrid(
                                                  layout: _currentLayout,
                                                  selectedRow: _selectedRow,
                                                  selectedCol: _selectedCol,
                                                  isShifted: _isShifted,
                                                  alternateOptions:
                                                      alternateOptions,
                                                  alternateIndex:
                                                      alternateIndex,
                                                  palette: palette,
                                                  onKeyTapped:
                                                      (int row, int col) {
                                                        _selectedRow.value =
                                                            row;
                                                        _selectedCol.value =
                                                            col;
                                                        _onAction();
                                                      },
                                                  onKeyLongPressed:
                                                      (int row, int col) {
                                                        _selectedRow.value =
                                                            row;
                                                        _selectedCol.value =
                                                            col;
                                                        _openAlternatesForKey(
                                                          _currentLayout[row][col],
                                                        );
                                                      },
                                                  onAlternateTapped: (index) {
                                                    _alternateIndex.value =
                                                        index;
                                                    _commitAlternateSelection();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
    super.dispose();
  }
}

class _ContextChipBar extends StatelessWidget {
  final List<_KeyboardChip> chips;
  final ValueListenable<int> selectedRow;
  final ValueListenable<int> selectedChip;
  final _KeyboardPalette palette;
  final ValueChanged<int> onChipTapped;

  const _ContextChipBar({
    required this.chips,
    required this.selectedRow,
    required this.selectedChip,
    required this.palette,
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
                      child: Text(
                        chip.label,
                        style: (palette.keyTextStyle ?? const TextStyle())
                            .copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? palette.textOnSelected
                                  : palette.textPrimary,
                            ),
                        overflow: TextOverflow.ellipsis,
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
  final ValueListenable<int> selectedRow;
  final ValueListenable<int> selectedCol;
  final ValueListenable<bool> isShifted;
  final List<String>? alternateOptions;
  final int alternateIndex;
  final _KeyboardPalette palette;
  final void Function(int row, int col) onKeyTapped;
  final void Function(int row, int col) onKeyLongPressed;
  final ValueChanged<int> onAlternateTapped;

  const _KeyboardGrid({
    required this.layout,
    required this.selectedRow,
    required this.selectedCol,
    required this.isShifted,
    required this.alternateOptions,
    required this.alternateIndex,
    required this.palette,
    required this.onKeyTapped,
    required this.onKeyLongPressed,
    required this.onAlternateTapped,
  });

  double _getKeyUnitSpan(String key) {
    if (key == 'SPACE') return 3.0;
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
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        margin: EdgeInsets.only(
                          right: c < layout[r].length - 1 ? spacing : 0,
                        ),
                        palette: palette,
                        onTap: () => onKeyTapped(r, c),
                        onLongPress: () => onKeyLongPressed(r, c),
                        onAlternateTapped: onAlternateTapped,
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
  final EdgeInsets margin;
  final _KeyboardPalette palette;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<int> onAlternateTapped;

  const _KeyboardKey({
    required this.label,
    required this.isSelected,
    required this.isShifted,
    required this.alternateOptions,
    required this.alternateIndex,
    required this.width,
    required this.margin,
    required this.palette,
    required this.onTap,
    required this.onLongPress,
    required this.onAlternateTapped,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = palette.chipRadius;

    return GestureDetector(
      onTap: onTap,
      onLongPress: KeyboardLayouts.alternateCharacters.containsKey(label)
          ? onLongPress
          : null,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: 40,
            margin: margin,
            decoration: BoxDecoration(
              color: isSelected ? palette.selectedKey : palette.idleKey,
              borderRadius: borderRadius,
              border: Border.fromBorderSide(
                isSelected ? palette.selectedKeyBorder : palette.idleKeyBorder,
              ),
              boxShadow: isSelected ? palette.focusGlow : null,
            ),
            child: Center(child: _buildContent(context)),
          ),
          if (alternateOptions != null && alternateOptions!.isNotEmpty)
            Positioned(
              bottom: 44,
              child: _AlternateCharacterPopup(
                options: alternateOptions!,
                selectedIndex: alternateIndex,
                palette: palette,
                onOptionTapped: onAlternateTapped,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final color = isSelected ? palette.textOnSelected : palette.textPrimary;
    switch (label) {
      case 'BACKSPACE':
        return Icon(Icons.backspace_outlined, color: color, size: 18);
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
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onOptionTapped(index),
            child: Container(
              width: 36,
              height: 36,
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

  const _KeyboardPalette({
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
